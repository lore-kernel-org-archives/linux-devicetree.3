Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257194;
	b=jecKy8ANbPLnFxttztCOBmKVkFcQ8TZKOsl/zKcWSZvs6iIozK3n69XzzI1zJpvEw95F
	 gA7e/ften8n4VXt70NMn0wTI6iFHGnPiFPSIs0mY0OlkRSrzGLH+xTuxFgekG1QhdnQtN
	 dZLDr21iD65MavZqRPgfqbXDd4FNWwnhKjX0QWWFr0zpc7YWELVARot9g1FXClfaPxjdv
	 VTIi7DSyl6/jdFWWUNoscFuOh/XT7/V+d0MIKX1OW4IlddF0HwRXHbChNWUqLVeK7kD5M
	 Nu070UIY8lJZ3NRYvNLsDPOY63tNn8BYGSPIwBGBMO8RJi6+60RxNAV9YOOLQkLCDCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257194;
	h=DMARC-Filter:DKIM-Signature:In-Reply-To:Content-Type:Message-Id:Cc:
	 Mime-Version:X-Lms-Return-Path:References:Content-Transfer-Encoding:
	 Date:To:Subject:From;
	bh=T59pDsr6tSYSA2/xk2S6/po3pnlTyL9A/hY0kf/Q/p8=;
	b=AEBJlc0uSfyPrMPappxUM6JyEJtoVU4x3bNoUODBh0bBKnYH8MEngXrdkReezOLereMY
	 q9HWyMwb0hm+46wqcVM1ml8/Ey7lmRiThJIkNxh21tEA65XvK+pAHR9TEYEO5rx1mAGMZ
	 Dp4Wy+/9aZovZux805Dj6UTncOI5mTPAH8OrjW5REvZToVHejAZ0sBrqZmMWsITuHxI0Z
	 Bwn5c6lviA76KZOBz2eF9Ftd9XwKxQR27m5HcXhYoue+cW8JSXhQUwcJop0IqfdLVPe+A
	 qcR8ltTth0pjfHfkt1q/sXXIxaPEPS4mZg9TTY7HVoYJLUKLywMoCdYUp3N2p5ArcQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bedmex.com;
	spf=none smtp.mailfrom=bedmex.com;
	dkim=pass header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=E5NitpAC;
	arc=none smtp.remote-ip=209.127.231.16
Received: from va-2-16.ptr.blmpb.com (va-2-16.ptr.blmpb.com [209.127.231.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED3A606A68C
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 10:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED3A606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bedmex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=E5NitpAC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1795257188;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=T59pDsr6tSYSA2/xk2S6/po3pnlTyL9A/hY0kf/Q/p8=;
 b=E5NitpACBHpbIfleIJ52idQAsKM2EfO7caNmKjpZuPBA4O5ZMcDOzq7d4IJRKEON3kjG3X
 6IYULIq/oEVbYk69WrvrTFFeESWaWJm0wvx7VtlYU6Y6oLLM6FV9dlmCxABH6c+6AOrqqZ
 01M1DPx2YdwPH7XJQPe4TJahvt1lXJWiByIO/sXWcy7HM19DsdavpvmERKSjweYFpBVFLm
 qV/VJl5Y9bns4F6YMKDmxImhztQKgpQ33Zc4hfo7PBkEVrFX6mOZUwZ6V95wx+OlQT1zaK
 6mdHUaYq3Jj/kis0rLlbKSP11Ks5qlBm2RpRYR5o+Yb1PUqu6SoFogtrcQbifA==
In-Reply-To: <20261116-pygmy-partridge-of-defense-e039a8@quoll>
Content-Type: text/plain; charset=UTF-8
Message-Id: <0c6903be00b92ecb18f2e74fdd9f8cb39e4db47b.a32caef0.2b0a.4db2.8079.1f11d8d5855d@feishu.cn>
Cc: <linux-wireless@vger.kernel.org>, 
	"Johannes Berg" <johannes@sipsolutions.net>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Zhirun Liu" <zhirunliu@aicsemi.com>, 
	"Dijia Xu" <dijiaxu@aicsemi.com>, "Chunqiu Liu" <chunqiuliu@aicsemi.com>, 
	"Liheng Wei" <liheng.wei@bedmex.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+16b017362+4df84e+vger.kernel.org+yanli.yang@bedmex.com>
References: <179481380235.4.7388336477392853157@bedmex.com> <179481380242.4.1693438763870948060@bedmex.com>
	<20261116-pygmy-partridge-of-defense-e039a8@quoll>
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 18:33:05 +0800
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Subject: Re: [PATCH wireless-next v5 4/4] wifi: aic: Integrate the AIC8800 SDIO driver
From: =?utf-8?q?=E6=9D=A8=E5=BD=A6=E7=AB=8B?= <yanli.yang@bedmex.com>

Thanks for the review.

> So all these five people will be providing reviews, right? Just don't
> add random managers names?

Yes, all five people listed here are technical engineers who will actively =
review patches and maintain this driver. No non-technical managers are adde=
d.

> Bindings as well

I will add the binding to the MAINTAINERS entry:

F: =C2=A0 =C2=A0 =C2=A0=C2=A0 Documentation/devicetree/bindings/net/wireles=
s/aicsemi,aic8800d80-fmac.yaml

> Why this cannot be previous patch? Why Makefile entry has to be a
> separate commit?

Agreed. The intention was to keep the driver unselectable until all
sources were present, but folding this patch into patch 3 achieves
the same result. Patch 3 already adds the remaining implementation
and the driver-local Kconfig and Makefiles.

I will fold this patch, including the MAINTAINERS entry, into patch 3
in v6 and update the cover letter accordingly.

Best regards,
Yanli

> From: "Krzysztof Kozlowski"<krzk@kernel.org>
> Date:=C2=A0 Mon, Nov 16, 2026, 19:10
> Subject:=C2=A0 Re: [PATCH wireless-next v5 4/4] wifi: aic: Integrate the =
AIC8800 SDIO driver
> To: "Yanli Yang"<yanli.yang@bedmex.com>
> Cc: <linux-wireless@vger.kernel.org>, "Johannes Berg"<johannes@sipsolutio=
ns.net>, "Rob Herring"<robh@kernel.org>, "Krzysztof Kozlowski"<krzk+dt@kern=
el.org>, "Conor Dooley"<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,=
 <linux-kernel@vger.kernel.org>, "Zhirun Liu"<zhirunliu@aicsemi.com>, "Diji=
a Xu"<dijiaxu@aicsemi.com>, "Chunqiu Liu"<chunqiuliu@aicsemi.com>, "Liheng =
Wei"<liheng.wei@bedmex.com>
> On Mon, Nov 16, 2026 at 03:23:22PM +0800, Yanli Yang wrote:
> > From: Zhirun Liu <zhirunliu@aicsemi.com>
> >=C2=A0
> > Connect the AIC vendor directory to the wireless Kconfig and Makefile
> > so the complete AIC8800D80 and AIC8800D80N FullMAC driver can be select=
ed.
> >=C2=A0
> > Add the driver maintainers, reviewers and linux-wireless mailing list t=
o
> > MAINTAINERS. Keep the parent build integration last so that intermediat=
e
> > patches do not expose an incomplete driver configuration.
> >=C2=A0
> > Signed-off-by: Chunqiu Liu <chunqiuliu@aicsemi.com>
> > Signed-off-by: Zhirun Liu <zhirunliu@aicsemi.com>
> > Signed-off-by: Yanli Yang <yanli.yang@bedmex.com>
> > ---
> > =C2=A0MAINTAINERS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 10 ++++++++++
> > =C2=A0drivers/net/wireless/Kconfig =C2=A0| =C2=A01 +
> > =C2=A0drivers/net/wireless/Makefile | =C2=A01 +
> > =C2=A03 files changed, 12 insertions(+)
> >=C2=A0
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7336600952c8..4e327fd62b26 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -746,6 +746,16 @@ L: =C2=A0 =C2=A0 =C2=A0 =C2=A0linux-scsi@vger.kern=
el.org
> > =C2=A0S: =C2=A0 =C2=A0 =C2=A0 =C2=A0Maintained
> > =C2=A0F: =C2=A0 =C2=A0 =C2=A0 =C2=A0drivers/scsi/aic7xxx/
> > =C2=A0
> > +AIC8800 WIRELESS DRIVER
> > +M: =C2=A0 =C2=A0 =C2=A0 =C2=A0Zhirun Liu <zhirunliu@aicsemi.com>
> > +M: =C2=A0 =C2=A0 =C2=A0 =C2=A0Dijia Xu <dijiaxu@aicsemi.com>
> > +M: =C2=A0 =C2=A0 =C2=A0 =C2=A0Chunqiu Liu <chunqiuliu@aicsemi.com>
> > +R: =C2=A0 =C2=A0 =C2=A0 =C2=A0Liheng Wei <liheng.wei@bedmex.com>
> > +R: =C2=A0 =C2=A0 =C2=A0 =C2=A0Yanli Yang <yanli.yang@bedmex.com>
>=C2=A0
> So all these five people will be providing reviews, right? Just don't
> add random managers names?
>=C2=A0
> > +L: =C2=A0 =C2=A0 =C2=A0 =C2=A0linux-wireless@vger.kernel.org
> > +S: =C2=A0 =C2=A0 =C2=A0 =C2=A0Maintained
> > +F: =C2=A0 =C2=A0 =C2=A0 =C2=A0drivers/net/wireless/aic/
>=C2=A0
> Bindings as well
>=C2=A0
> > +
> > =C2=A0AIMSLAB FM RADIO RECEIVER DRIVER
> > =C2=A0M: =C2=A0 =C2=A0 =C2=A0 =C2=A0Hans Verkuil <hverkuil@kernel.org>
> > =C2=A0L: =C2=A0 =C2=A0 =C2=A0 =C2=A0linux-media@vger.kernel.org
> > diff --git a/drivers/net/wireless/Kconfig b/drivers/net/wireless/Kconfi=
g
> > index f4f969fdbc02..964e633898ca 100644
> > --- a/drivers/net/wireless/Kconfig
> > +++ b/drivers/net/wireless/Kconfig
> > @@ -19,6 +19,7 @@ menuconfig WLAN
> > =C2=A0if WLAN
> > =C2=A0
> > =C2=A0source "drivers/net/wireless/admtek/Kconfig"
> > +source "drivers/net/wireless/aic/Kconfig"
> > =C2=A0source "drivers/net/wireless/ath/Kconfig"
> > =C2=A0source "drivers/net/wireless/atmel/Kconfig"
> > =C2=A0source "drivers/net/wireless/broadcom/Kconfig"
> > diff --git a/drivers/net/wireless/Makefile b/drivers/net/wireless/Makef=
ile
> > index fa3100ff3bf7..47b999e8014c 100644
> > --- a/drivers/net/wireless/Makefile
> > +++ b/drivers/net/wireless/Makefile
> > @@ -4,6 +4,7 @@
> > =C2=A0#
> > =C2=A0
> > =C2=A0obj-$(CONFIG_WLAN_VENDOR_ADMTEK) +=3D admtek/
> > +obj-$(CONFIG_WLAN_VENDOR_AIC) +=3D aic/
>=C2=A0
> Why this cannot be previous patch? Why Makefile entry has to be a
> separate commit?
>=C2=A0
> > =C2=A0obj-$(CONFIG_WLAN_VENDOR_ATH) +=3D ath/
> > =C2=A0obj-$(CONFIG_WLAN_VENDOR_ATMEL) +=3D atmel/
> > =C2=A0obj-$(CONFIG_WLAN_VENDOR_BROADCOM) +=3D broadcom/
>=C2=A0
