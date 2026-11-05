Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842400;
	b=YVHR1BsLYp4v6GxBeXUVzQk5TuX76j3h371Jh8UOznQM4fPlWO6lJmhIPZaWeh6IS6+Z
	 ODbLCMK+bxYv6WrvMIuyfQzQIGO6Xh1vgpx5ZBag2rXqULmhsTneVUp3ylvoOi2VQFdYd
	 qQYPeSYbuwAtAWbhavZDNw1yDtwzdQY1N1vFvAJlHLNtJpelUt1PbPSyB6JFUNCEwPEqF
	 qCIfdPILxHSw+97TVHzCaZ+Qu2sWFStRim355VZGbQWs7FNdUc/lJUBqlDp7TbEQxnCkI
	 KUfViiAKUJFjq6n1sBgP5xkabsrepMEFp+UjBP0wndWaFxVgH2xcYb1qujP5oGkGxIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842400;
	h=DMARC-Filter:DKIM-Signature:In-Reply-To:X-Lms-Return-Path:
	 Content-Type:Content-Transfer-Encoding:Message-Id:Cc:Subject:
	 References:Date:To:From:Mime-Version;
	bh=/d8AjzMR8Kwx0Lf9prj+CTkH5Cp2jbRHWYUWf3O5Nro=;
	b=M+oZz8qHDvRvFBPoiJixhmeYeSw34qBd5XO/65FzVVJoOxiiocgZ2axVj2QKoCMZTyiN
	 A0AdUQ17pE2XGE4GsK7n9VvWKy9xCAgZdQ5Pkr392A2av25dYISBMyT72tGwDWFC41n4V
	 MceEEwL2xDuaK6QKovCfDeuUXpGxMeaHVBk9i65g9cARqnMeXqW1vM9Bw1sOiRKwpt8PY
	 7Rp65kJksBnLL5dWNH1uMqREbUimOOSGCuK+NT/jfagAXJka4+0jjsiwSWxuHFI46iYy5
	 FcD80IkZ262RAHhfLNeh+aG0flHeAaJb1hb2YamJIeb9B5tTu/c8Y7C1J3KmeL6Nq3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b="NW6/6Jnh";
	arc=none smtp.remote-ip=209.127.231.28
Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EA9606A329
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 01:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49EA9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=NW6/6Jnh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793842388;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=/d8AjzMR8Kwx0Lf9prj+CTkH5Cp2jbRHWYUWf3O5Nro=;
 b=NW6/6JnhJJ7Wt9dub9t9fuM1m8qckHGHDpKh3GXjqjz0Vr+TdtP1ra00SWhU3x8wRj7PW2
 9pXuWHG/Kr194TjEzZ9CmRZavFFjUK1PV+c6B2bBc2o0gxW7wpuVqEH8gy3cGgRrljADYB
 oov5K/UdoXQpTHYN6NJHGuZYWPA2OjY1tOVf5QLVhkJer8CWfu57Znyof5woiFWcHkEuks
 pl+xOIIIPyjEVQnRcTTIEmICcoAx7A8EUyp6SOwibG0XwGE2V7YkZnj469DhudYX/eqMo7
 g3fKh6lmbN5DC9khyprdt9uJyxHWhW8zV9M18bCuXqRZziUtObI9nJrQYhhzug==
In-Reply-To: <DMMVRQOY5TBN.J0PHJAAZSC2F@linux.spacemit.com>
X-Lms-Return-Path: <lba+16aebdcd2+5d3c37+vger.kernel.org+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.569e40bc.e0a4.4c5f.856e.9977de981adb@feishu.cn>
Cc: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
References: <20261102060012.100623-1-sandie.cao@deepcomputing.io> <20261102060155.100679-1-sandie.cao@deepcomputing.io>
	<DMMVRQOY5TBN.J0PHJAAZSC2F@linux.spacemit.com>
Date: Thu, 05 Nov 2026 09:33:05 +0800
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

Hi, Troy:

> From: "Troy Mitchell"<troy.mitchell@linux.spacemit.com>
> Date:=C2=A0 Thu, Nov 5, 2026, 09:20
> On Mon Nov 2, 2026 at 6:01 AM GMT, Sandie Cao wrote:
> > Add the device tree node SDHCI-0 controller for onboard Micro SD card s=
lot.
> >
> > Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> > ---
> > =C2=A0.../spacemit/k3-deepcomputing-fml13v05.dts =C2=A0 =C2=A0| 22 ++++=
+++++++++++++++
> > =C2=A01 file changed, 22 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts=
 b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > index 84f66dd8f962..4471338a9774 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> > @@ -184,6 +184,28 @@ &combophy {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D "okay";
> > =C2=A0};
> > =C2=A0
> > +/*
> > + * Onboard SD card slot:
> > + * Plugin/Plugout the SD card before power-on the board for secure.
> How about: "Please insert or remove the SD card while the device is power=
ed off."

Ok. I will fix in next version.

Best Regards
Sandie

> > + * It works as a boot media. so set it to non-removable.
> > + */
> > +&sdhci0 {
> [...]
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0non-removable;
> [...]
> > +};
> > +
> > =C2=A0&uart0 {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D "default";
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D <&uart0_0_cfg>;
>=C2=A0
>=C2=A0
> --=C2=A0
> Troy Mitchell
>=C2=A0
