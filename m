Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6190137F723
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 18:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788720431; cv=none; b=qcB/0TQRk3AL7VtSJXl786tAE2WzX8pKJhaaWL4WTB4QK1RhjIrFK15LDQU0yOyxkz3aWbbR8UIVGhlaUsnPpYIV2bwwy9x+USu/X7uruanY6W94KQxTNVeIBTdT7AVXFdmmI4a/gVHHqvDlQ1b1fKOQHC7FNeXJeDqFkNBJB9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788720431; c=relaxed/simple;
	bh=VbBrH4vXfvwBqefzdUXCh/tC2hHq4ts+R6eDdQatm3M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hOu40g3uEVpLP2z9Kt44zSaILcwq0RMdoktPI4TVj3HK/b18rlD0oGuneZV15uR2+mjPCIThL/u3BDV7CuMWrJi5t9cGAU/L8/OTaMQtxpRfacMduNNnlMxV7dddCw1ETiuHeMDyRUPXZ1FoMg99K5xlrLkeNnGTAfMfgZDTQlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYR8OwvK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYR8OwvK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20081F00A3A;
	Sun,  6 Sep 2026 18:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788720429;
	bh=UiKBICWZIhlK33+q+QoPfvmRV6b/jPwaoC4VuuiflDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KYR8OwvKl6UAbbUb5tYwXjPQj/IgIGWXyyjQeVOdZPRAB3B24Db55G/OpJ6ry8p2R
	 2UZArKfl7h4uCziIg5tfJbacnBUBGpOgox1vGtvoyVuZIWrdUhEfWLIQFg/2rmoTHz
	 Cc/HIsi/zvNORxYjM0nMA1dIFo7PnDsI/o4MIcDVT3dWbScjArD43VHkXBypnLaGqW
	 mno0Y90fxoOQA7cNrDPrkVcbEdJOtTRYVX0MgZMryyygMXgY8SSLaugktPVr+qlIQH
	 uowmxRjno2iCyHlmgeFyUa68/mmbIR4o/apYxErMxjcBHpjIklji4X6Xf0m1EGImMq
	 M8L3RQWiC6Ijg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/22] usb: typec: tipd: Register a USB4 port mode
 for CD321x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-3-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-3-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 18:47:08 +0000
Message-Id: <20260906184708.B20081F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Probe error path fails to cancel the delayed work `update_work`, l=
eading to a Use-After-Free.
--

commit 09cc2bd0cfd69f839367811f9385e5cf074438a8
Author: Sven Peter <sven@kernel.org>

usb: typec: tipd: Register a USB4 port mode for CD321x
   =20
Register a USB4 mode next to the DP and Thunderbolt alternate modes so
that negotiated USB4 partner modes can be linked to the port. Identify
it using TYPEC_MODE_KIND_USB4 without an SVID or mode index.

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index f76f563dc42b8..8c7f93d4270e2 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c

[ ... ]

> @@ -1371,6 +1386,8 @@ cd321x_unregister_port(struct tps6598x *tps)
>  	cd321x->port_altmode_dp =3D NULL;
>  	typec_unregister_altmode(cd321x->port_altmode_tbt);
>  	cd321x->port_altmode_tbt =3D NULL;
> +	typec_unregister_altmode(cd321x->port_altmode_usb4);
> +	cd321x->port_altmode_usb4 =3D NULL;
>  	typec_unregister_port(tps->port);
>  }

[Severity: High]
This is a pre-existing issue, but does cd321x_unregister_port() need to
cancel the update_work delayed work?

When probe fails (for example, if devm_request_threaded_irq() fails after
connect queues the work), the error handling path in tps6598x_probe() drops
into this sequence:

drivers/usb/typec/tipd/core.c:tps6598x_probe() {
    ...
err_disconnect:
	tps6598x_disconnect(tps, 0);
err_unregister_port:
	tps->data->unregister_port(tps);
    ...
}

Since this doesn't call cancel_delayed_work_sync(&cd321x->update_work),=20
could it leave the asynchronous work scheduled? As devres frees the tps
structure upon probe failure, will cd321x_update_work() dereference freed
memory when the timer expires?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-apple-s=
oc-tbt-v2-0-1f80085f93fb@kernel.org?part=3D3
