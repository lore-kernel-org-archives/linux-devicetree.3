Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C53283C82
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 17:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784394861; cv=none; b=b+qsaEjpsnw0Xu+ruFfFPfMuGprHFl1QiDJ1iFs3TzLjYe+HSu4TDKHlQZJIUpx6JAcDkhSe8YcB8P0JS41zJWSjv5Z1NxOMW0hEclxyKGlbfXREZv0uhEnhfpoMgZlvzDFSGFSs3kKzC8Knh+nca4xbN7CCEct5D2Ag0vF8Sho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784394861; c=relaxed/simple;
	bh=ZCbHDVfiJPfk2cROSvN8J3ws8d3AERl4bM/JHB/xbCc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dcoXHbbhPOM0h7IxC+iJZTl1ssCOhgkMo0PyTP6I8j9Ao1lvQPXEs5hdw6FONtkaule7+5Q374liNA5WiYkJ1wvEGgS4iawcsJw7ynH6Y5qatip2Vnbmrs2WLQLZj9n+xM6/AgyZ61Gqt/KH14IlmY/4KqrpAfcCZREdfzBJoM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gREL+VSH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gREL+VSH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9781F000E9;
	Sat, 18 Jul 2026 17:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784394860;
	bh=EsxF2jK2k7o1gUXG+9gHdpepA6BcZ5aBlmijwzpTvGk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gREL+VSHuRjlNI7wSrtJ7xJxizRJY0My7zw75+pjTY/gZ2e/YvJ++daxf7RYRMQ02
	 qmewJPzDGv8wi5rb/0TfYRF+7GSTCtfkLZTz+TjQBATsbELQ0UvttpIxAs/VCGgLvP
	 PuSlj329IDZ1rbo9j0/ZbaloyNVrPtn6TAm7Exeh0mOG/Ly7AjHCNhaiLCFfXJzwJU
	 r3MD4gqS7GlsuFBB4dmI7kVXh1tICufM8/JhImPHKbJyxPTstsIedVd8qhUD5ff33w
	 Ca56JJw158Pw7hut5KRGQE5GgA0sU0TaOT/PJBm+s5tWAKjNgHhk5VSkVaypiBQKiL
	 OhUvbbg8YzAqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] usb: typec: ps883x: Return -EOPNOTSUPP for USB4
 when parade,disable-usb4 is set
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260718-ps883x-disable-usb4-v1-2-cec86d0b909e@oldschoolsolutions.biz>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-2-cec86d0b909e@oldschoolsolutions.biz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 17:14:19 +0000
Message-Id: <20260718171419.EF9781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Encoding a temporary software workaround into the Device Tree usin=
g a custom property (`parade,disable-usb4`).
--

--- Patch [2]: [PATCH 2/5] usb: typec: ps883x: Return -EOPNOTSUPP for USB4 =
when parade,disable-usb4 is set ---
commit e075e4adfa41dd9a2eea759527c1bbbc8a97f7a9
Author: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: usb: typec: ps883x: Return -EOPNOTSUPP for USB4 when parade,disabl=
e-usb4 is set

This commit adds a temporary workaround to disable USB4 support on the
PS883x retimer using a new device tree property. It addresses an issue on
X1E80100 platforms where negotiating USB4 results in no DisplayPort output
due to missing software support in the qmp_combo PHY stack.

Link: https://patch.msgid.link/20260312101431.2375709-1-krishna.kurapati@os=
s.qualcomm.com

> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883=
x.c
> index 64e0a61b776a1..3fa26ce01a9c9 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
[ ... ]
> @@ -249,6 +250,13 @@ static int ps883x_set(struct ps883x_retimer *retimer=
, struct typec_retimer_state
>  			cfg0 |=3D CONN_STATUS_0_USB_3_1_CONNECTED;
>  			break;
>  		case TYPEC_MODE_USB4:
> +			if (retimer->disable_usb4) {
> +				dev_info(&retimer->client->dev,
> +					 "USB4 disabled via DT property, rejecting USB4 mode\n");
> +				return -EOPNOTSUPP;
> +			}

[Severity: High]
Since the commit message notes this is a temporary workaround for missing OS
support in the X1E USB4 controller and PHY stack, does this approach confli=
ct
with the principle that the device tree is a stable hardware description AB=
I?

If this workaround is deployed in user device trees or firmware, wouldn't
those boards permanently have USB4 disabled on this retimer even after the
kernel drivers are eventually updated to fully support it?

Could this be implemented as a software quirk instead, perhaps by matching
the platform's compatible string or inferring the limitation dynamically
from the dependent drivers, rather than altering the hardware description?

> +
> +			/* Normal USB4 handling */
>  			eudo_data =3D state->data;
> =20
>  			cfg2 |=3D CONN_STATUS_2_USB4_CONNECTED;
[ ... ]
> @@ -378,6 +386,8 @@ static int ps883x_retimer_probe(struct i2c_client *cl=
ient)
> =20
>  	retimer->client =3D client;
> =20
> +	retimer->disable_usb4 =3D device_property_read_bool(dev, "parade,disabl=
e-usb4");
> +
>  	mutex_init(&retimer->lock);
> =20
>  	retimer->regmap =3D devm_regmap_init_i2c(client, &ps883x_retimer_regmap=
);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-ps883x-dis=
able-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz?part=3D2
