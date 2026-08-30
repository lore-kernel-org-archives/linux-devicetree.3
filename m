Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DEB1514F8
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 20:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788122177; cv=none; b=VA8o6CH9M2k3+oOh/KLQD+6//+4W1GPdPnlFAzpueou+ZTiHl4cw34AXZ2V2L0civGXq+wwbu7/u2zmKSlmyxhZ8e7KWTFoEWYNZqZEvSPxjHZ9iy4XsCm9nwWFTYEBlrscg1npbelY7nNjk8SYyMi6yhFTHGINTt/cr3esvHM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788122177; c=relaxed/simple;
	bh=5o1izuoihUN4sofL9cTUjiLMpZQROQ6Gz4fNfnXEU/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WTf2uMLNntFqUQgdB7h+ahSck/kxKzm24sqm5C3wWSm59Gqru+sxsSzdUOvmG0VqUpjnzIjG6p7hX6+728SRz0pPSijlE96M6SIbgPrKM7lN2XSpEhA8yBavbj0Dv+0Zxa7A0MwXEwhl5gYkob3pUtX/uoCu6qDc1NaXmDJdnXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDzuNu7L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDzuNu7L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5CF1F000E9;
	Sun, 30 Aug 2026 20:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788122175;
	bh=HQU9XuQ2vyM4oUQjsMIT2wBekg3Xu9xTIQ4V4IJxVLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DDzuNu7LCTTiT19EH9rzqtpNd50wSSUZU+rfRE/j9GYINcEWcIh2Gvj8q5jnNgu2M
	 yS7HZdIDc9DzNlxRYQvGs+rE3c73yVvpNxUsUur5eSpkeX71Asnh3ckUu1c5xmLGFG
	 oNush/6nxLUwK6pnfvu8j+bWCaE43zLluFF8MevaxMg9TvfN6CsdnmYtKhB5Qjuql0
	 m7kq8aJLvTS15NUaQSs9SMuM+mGaYpgXa+R1tQVv8WJIp0Lr2nl7K2gKngT58Mc+eg
	 PT1vcQ8dlCSf+Ef+R4y+Am/MKq7q3U+Xlj9+b+eg9n4FxpJfMKGuyn2H1jp2tXtisC
	 NrWnu+21ZS8Sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/19] usb: typec: tipd: Hook up Thunderbolt switch for
 CD321x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-3-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-3-44bc9348683c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 20:36:15 +0000
Message-Id: <20260830203615.7C5CF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Uninitialized stack padding in `struct enter_usb_data` is copied=
 into `tbt_switch_data` and passed to a generic callback, potentially leaki=
ng kernel stack memory.
- [Medium] The Thunderbolt switch is not initialized to the OFF state durin=
g probe, nor is it explicitly turned off during driver removal, potentially=
 leaving the hardware state desynchronized.

Pre-existing issues:
- [Critical] Pending delayed work `cd321x->update_work` is not cancelled in=
 `tps6598x_probe()` error path, leading to Use-After-Free.
--

commit 7c593740c56d0ad285a4bc2f76d978af8ae887d9
Author: Sven Peter <sven@kernel.org>

usb: typec: tipd: Hook up Thunderbolt switch for CD321x

Look up the Thunderbolt switch for CD321x ports and forward cable details
whenever a Thunderbolt or USB4 connection comes up or goes away.

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 522f56742aa9b..5016f9dba9560 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c

[ ... ]

> @@ -738,6 +745,13 @@ static void cd321x_typec_update_mode(struct tps6598x=
 *tps, struct cd321x_status
>  		cd321x->state.mode =3D TYPEC_TBT_MODE;
>  		cd321x->state.data =3D &tbt_data;
>  		typec_mux_set(cd321x->mux, &cd321x->state);
> +
> +		tbt_switch_data.state =3D TYPEC_THUNDERBOLT_SWITCH_TBT;
> +		tbt_switch_data.tbt =3D tbt_data;
> +		tbt_switch_data.orientation =3D TPS_STATUS_TO_UPSIDE_DOWN(st->status) ?
> +						      TYPEC_ORIENTATION_REVERSE :
> +						      TYPEC_ORIENTATION_NORMAL;
> +		typec_thunderbolt_switch_set(cd321x->tbt_switch, &tbt_switch_data);
>  	} else if (st->data_status & CD321X_DATA_STATUS_USB4_CONNECTION) {
>  		struct enter_usb_data eusb_data;
> =20
> @@ -752,12 +766,20 @@ static void cd321x_typec_update_mode(struct tps6598=
x *tps, struct cd321x_status
>  		cd321x->state.data =3D &eusb_data;
>  		cd321x->state.mode =3D TYPEC_MODE_USB4;
>  		typec_mux_set(cd321x->mux, &cd321x->state);
> +
> +		tbt_switch_data.state =3D TYPEC_THUNDERBOLT_SWITCH_USB4;
> +		tbt_switch_data.usb4 =3D eusb_data;

[Severity: Medium]
Does this struct assignment copy uninitialized stack memory into the union?

eusb_data is declared earlier as struct enter_usb_data eusb_data; without
zero-initialization. Because the struct contains a 4-byte u32 and a 1-byte
bitfield, the compiler pads it to an 8-byte boundary, leaving uninitialized
stack memory in the padding bytes.

Assigning it directly to tbt_switch_data.usb4 copies these uninitialized
padding bytes over the previously zeroed tbt_switch_data union payload.

Could this be passed to typec_thunderbolt_switch_set() and potentially leak
kernel stack memory across driver subsystem boundaries?

> +		tbt_switch_data.orientation =3D TPS_STATUS_TO_UPSIDE_DOWN(st->status) ?
> +						      TYPEC_ORIENTATION_REVERSE :
> +						      TYPEC_ORIENTATION_NORMAL;
> +		typec_thunderbolt_switch_set(cd321x->tbt_switch, &tbt_switch_data);

[ ... ]

> @@ -1328,6 +1354,12 @@ cd321x_register_port(struct tps6598x *tps, struct =
fwnode_handle *fwnode)
>  		goto err_unregister_altmodes;
>  	}
> =20
> +	cd321x->tbt_switch =3D fwnode_typec_thunderbolt_switch_get(fwnode);
> +	if (IS_ERR(cd321x->tbt_switch)) {
> +		ret =3D PTR_ERR(cd321x->tbt_switch);
> +		goto err_unregister_mux;
> +	}
> +
>  	cd321x->state.alt =3D NULL;
>  	cd321x->state.mode =3D TYPEC_STATE_SAFE;
>  	cd321x->state.data =3D NULL;
>  	typec_set_mode(tps->port, TYPEC_STATE_SAFE);

[Severity: Medium]
Does this leave the Thunderbolt switch hardware in an unknown state?

The software state is initialized to TYPEC_STATE_SAFE and the main Type-C m=
ux
is reset by typec_set_mode(), but the newly added Thunderbolt switch is not
explicitly set to TYPEC_THUNDERBOLT_SWITCH_OFF.

If the bootloader left the Thunderbolt switch active, the hardware and
software states might become desynchronized. Later, if a connection event
occurs without a data connection, cd321x_typec_update_mode() returns early,
and the switch is never explicitly turned off.

Should there be an explicit call to initialize the tbt_switch to the off
state here?

[ ... ]

> @@ -1356,6 +1391,8 @@ cd321x_unregister_port(struct tps6598x *tps)
>  {
>  	struct cd321x *cd321x =3D container_of(tps, struct cd321x, tps);
> =20

[Severity: Critical]
This is a pre-existing issue, but does this teardown function leak the
update_work delayed work?

cd321x_unregister_port() is missing a call to cancel the update_work
delayed work.

If a partner is connected during probe, tps6598x_probe() schedules
cd321x->update_work. If a subsequent probe step fails (such as
devm_request_threaded_irq()), the driver jumps to the err_disconnect path
and returns an error. This path fails to cancel the delayed work before
devres frees the tps structure, which can lead to a use-after-free crash
when the work executes and dereferences the freed memory.

Should cancel_delayed_work_sync(&cd321x->update_work) be added to the
teardown paths?

> +	typec_thunderbolt_switch_put(cd321x->tbt_switch);
> +	cd321x->tbt_switch =3D NULL;

[Severity: Medium]
Is it necessary to turn off the Thunderbolt switch before dropping its
reference during driver removal?

The tbt_switch reference is dropped here without commanding the hardware to
turn off, which might leave the switch active.

>  	typec_mux_put(cd321x->mux);
>  	cd321x->mux =3D NULL;
>  	typec_unregister_altmode(cd321x->port_altmode_dp);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830-b4-apple-s=
oc-tbt-v1-0-44bc9348683c@kernel.org?part=3D3
