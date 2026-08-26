Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455373DA7C0
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742392; cv=none; b=ORPX3/zHI45PqKdBeQLrDXVDqzCTtd4UNzurO0OE9t3WcpOp6EPooZfg+PHmXQQPAn7FHi+sgIzt7KZHNZdKS5MxSpgP0vSFSVbgeJNIkMmI9pMUghpQ3hX693KoLO9oA3im1Jqq6D4oAEymAH1E4IaC0izI2rS1+JMTBK+iNfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742392; c=relaxed/simple;
	bh=qom/OyExKO4KZ1jWmd5CK497/gNZjEJO6RXkLHus6us=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D2fOghiARvWJ0r2yNHyfs6u3WIMqCZvsr/v6rq49L9f/YUWp/20GguO/VUecEEgaLm2YYN6u3hUKkiDN/rILyskmLM5lVNtWLEEBxYrB/cJttQVzg1TqOq6XJ2j2tAgtGvMnHACuPzHcAwBg77sWIxbQrQH3tygtT6MCaYu/SFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXrFGLs2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXrFGLs2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BFA1F00A3A;
	Wed, 26 Aug 2026 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787742384;
	bh=y2PnPGsGcUEmy1hYUf6d6iCQwqsR5sk2J6Hf8fJJCCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FXrFGLs2ZeB/UvmF5rP7wGv3AlgJZCUR2CEKmz2EEX1kPwRl2oLAF6MjYJvoy6YKR
	 e1EJNzBZ31XYhYJ9QnYUozn/fdtHPUG70eMMC0x2HlY/buWjV/277TcNEenVPxkcdC
	 4HJDXFY7VPUurWO9eQV2cCa0DUOI6D2yk1+MzauZYKJYBWMhST3FynEuqBv8Qmg6hy
	 1OGrRmRhZnZOtPtci71/Wsi844wyRmX4NxSuW25i7TWQ42QUzj0pkOlhEvukXowU2y
	 a7mAXhMrvEHPTJGdt5CfX5BoDX5xU75bHJoTMaCKAAlZthKf3POV7KFLj2F/It1Pv4
	 op8qkNSzJaLJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] usb: typec: tipd: Add sn201202x support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260826-tipd-ace3-v6-3-e919f39a93a2@chaosmail.tech>
References: <20260826-tipd-ace3-v6-0-e919f39a93a2@chaosmail.tech>
 <20260826-tipd-ace3-v6-3-e919f39a93a2@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 11:06:23 +0000
Message-Id: <20260826110624.34BFA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Delayed works (`update_work` and `wq_poll`) are not cancelled on t=
he probe error path in tipd_init, leading to a Use-After-Free.
--

commit 547c3b2aceecd19f6dae9a6a5703b8abccb6b9fc
Author: Sasha Finkelstein <k@chaosmail.tech>

usb: typec: tipd: Add sn201202x support
   =20
Add support for sn201202x (aka ACE3), a tipd variant that uses a very
similar register map, that is exposed over a "logical register"
interface on the SPMI bus.

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index fb7bb68731bc5..64cde3a290fe6 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
[ ... ]
> @@ -1950,11 +1950,32 @@ static const struct tipd_data tipd_tps25750_data =
=3D {
>  	.connect =3D tps6598x_connect,
>  };
> =20
> +static const struct tipd_data tipd_sn201202x_data =3D {
> +	.irq_handler =3D cd321x_interrupt,
> +	.irq_mask1 =3D APPLE_CD_REG_INT_POWER_STATUS_UPDATE |
> +		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
> +		     APPLE_CD_REG_INT_PLUG_EVENT,
> +	.tps_struct_size =3D sizeof(struct sn201202x),
> +	.remove =3D cd321x_remove,
> +	.register_port =3D cd321x_register_port,
> +	.unregister_port =3D cd321x_unregister_port,

[Severity: High]
This is a pre-existing issue, but does cd321x_unregister_port() completely
miss cancelling the update_work?

When tipd_init() calls the err_disconnect cleanup path on probe failure, it
calls this unregister_port callback:

drivers/usb/typec/tipd/core.c:cd321x_unregister_port() {
	...
	typec_mux_put(cd321x->mux);
	cd321x->mux =3D NULL;
}

Since the delayed work isn't cancelled here or in err_disconnect, the
update_work or wq_poll can run 500ms later and try to access the freed
cd321x or tps6598x device structure, causing a use-after-free.

> +	.trace_data_status =3D trace_cd321x_data_status,
[ ... ]
> diff --git a/drivers/usb/typec/tipd/spmi.c b/drivers/usb/typec/tipd/spmi.c
> new file mode 100644
> index 0000000000000..a165ec39a8ed8
> --- /dev/null
> +++ b/drivers/usb/typec/tipd/spmi.c
[ ... ]
> +static int sn201202x_probe(struct spmi_device *device)
> +{
[ ... ]
> +	ret =3D spmi_command_wakeup(device);
> +	if (ret)
> +		return ret;
> +	if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies=
(100)))
> +		return -ETIMEDOUT;
> +
> +	ret =3D tipd_init(tps);
> +	if (ret)
> +		spmi_command_sleep(device);
> +	return ret;
> +}

[Severity: High]
This isn't a bug introduced by this patch, but could this error path
trigger the use-after-free mentioned above?

If tipd_init() fails after the delayed works are scheduled (for instance,
if devm_request_threaded_irq returns an error, or if polling mode is used
and connect() fails), tipd_init() jumps to err_disconnect:

drivers/usb/typec/tipd/core.c:tipd_init() {
	...
	if (ret)
		goto err_disconnect;
	...
}

This returns the error code, causing the driver core devres framework to
free the memory allocated for the device structure, leaving the delayed
work active and accessing freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-tipd-ace3-=
v6-0-e919f39a93a2@chaosmail.tech?part=3D3
