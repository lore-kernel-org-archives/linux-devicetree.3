Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B6A35F19B
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777270896; cv=pass; b=jfAr0m72IXNq2DYqtEdJVw6bJVjo4qmzMqVOpqUzve3Cd6qMC4BPGoglXKvOLjnbAsbvaezU3uiAyvfSR0GPyAeJewelX4IEwLvXlPrIpVdvH0CA/QDE4he1Ws2Qkyb3pE+kkOtRSSmfH1TEtIebZNCWP4nsRkbQ3Ek3rFqz+Xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777270896; c=relaxed/simple;
	bh=cJx4Ml0i3L/4hVMTEGvJHmi/r9RzSaVF+1uTD1zxi0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqmIAf1WjfHZ6S6eJY6TBDAfAnK5CRJqdBdMNYupOaQoddj1AU8WU5e1O5RxES8ihI6yJatynYKWsFJy4Qkp+/IJ0vVoZbp9jRPQ4meov6113McSq4frYFidXNz7Hc1x7GJ53ZSRorR1PhYXyI8ohRMUGGRBARwn4kwxTb4lvvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JT8mIdXC; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JT8mIdXC"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d73352cf2so8223999f8f.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 23:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777270893; cv=none;
        d=google.com; s=arc-20240605;
        b=WnuCxBSR1mQahBC4yUAfveVuqpb13slW5lNx6FcfnbKxDGI5ttowgnhmIMTxOquqU3
         xOjg6Vyf2PhGjD/q7uoJSF6PkFi5KGDLhcRhrOSbVgaOHLSGYUkkGWf4ecUV4yNHgQ/8
         49SV+Jb9cUy+Gu2RzKbtenXZnp4QUpA89vryLHJ1ZFSgDyqZqVHZ05BlWKB1YP+Rvqsy
         y9g0IqbFDy6WQa96czoq30kd/rYw5rCve7KlDBri6oS8d4CnJLAnR3g889sD8DwCqaar
         LBlcgGQZTW8RhT1eJ57X5Ws6uUMqbzhyaempT8XIsWW0rThyB7bRduyS/xJiyAyjWmED
         UGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=26Nw5FMPOIdr6H5yY5vEPu6PrXUhZvl0rF4GQFiyc60=;
        fh=MIIjKpfBEZwWPv16oI7u0/9951h5hOfDd2WN5Rc6we4=;
        b=Ll26bz5kfMV1OXquESjGUaH4JPqsTgv7G1vMn91ZLw9lEegwPNMAHKL88rTdLXQw/l
         N2Fpgb2k4J16YOeEAYXssEc9+S/IVr88F5W6cwknvQ74/5X0YlO+0ZkW7WphmD+dLZEG
         dSUpn27sRjkO8vvnqdqFJyo4IdCEgldL+d1hmyY1/g0dsYeXVwib0mVBdgZJZSMzF0Lp
         OhqKZbmnedZiUoff4erbOBfLoMzzf3hLoOjx7yBYGGJs9xs90BY+RDUbhYyYJNJL3MnN
         AwJc9U96f9fHn6NQudqpT3BdaiVLz08PKCvabXbhexZUNhzq338QQs1tiThSR8GBU5at
         Gzqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777270893; x=1777875693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26Nw5FMPOIdr6H5yY5vEPu6PrXUhZvl0rF4GQFiyc60=;
        b=JT8mIdXCyQoxPslYfAOKsy2ze0GoAHoXcGgpvYEbVtjPDG8qEbvmp6AwAUJF/IIU3D
         BQX47sE0KuepkVvoi9T5faY7UrbrVM28/Br/FChmuwfRWffs4f3kAKAnxV8PEyXHAN/U
         xpqe4fIqLfXkZ6d594GMoMVovJmFXXuLjbLQFJ5xKGkBbc73ZlSogXG5QRh3gPxV0qeH
         2VCokMAr4RyISO6CpPC97holDlCZt0dM+R4TJR78iJCD3PB8LHW1WtfLia/3TLc3dLi6
         p5uu0Pp/W9S8UVI9ncddSCuMgADXSY4fLq3BgT1walwxJ50LjODNvTf+guFfiw7doxps
         3hXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777270893; x=1777875693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26Nw5FMPOIdr6H5yY5vEPu6PrXUhZvl0rF4GQFiyc60=;
        b=lZaGpHgzFUhk2gAofweHLCk3o8evhG9wwrRUIzKigJSX7E/wpXIefg2A21TG/uYyJk
         Wt1bP+PqjrJAto700CVQmVBTUovMrxgGCjpmDjmpV0eIkdyviFEts0hkOi0rL4EHiMkI
         ljtx3ZVuurZrFdi63DBvMWuv1CDDhr3T1D41oIP5TgI//OxBsRAT+E07H7sq1JoM4GmF
         5uyUTTlrrRPqAC3uWV1LOuKOnj5IKVikoaS18gOq4WCtXPvCRXeqTS91ir+nDlypPXa6
         kKHKU52JUcDv1cURIFvJzXOp47e0XKXPPQ2tRyC2y3ToKtQ+uygn4ac0wC7K8a2PBH3M
         csPQ==
X-Gm-Message-State: AOJu0YylkjCGhOYkTbC+bI13lqaIdMiSmgPRuotICC0BO6kgd2skcKaS
	RmpNhcqBahyuCebeatai82+Nzq7SKlPUY7ThIMHPc5yCGk2pKBGqkY77HgsknYxl2NkG54W5wp8
	1fD8jaCTot9H7dMyofO56GSY0+zyx2A8=
X-Gm-Gg: AeBDieu4i/G8bPZH6tm70b/z8tZU4dyFYa6BxKtBv1ezdr0Ahn42Pl+KEYdhwORXfan
	BHw9GFLjmNF6KCZMyGp+hhy0kVL1hJ4T6OVxK/xhHmAZJCfDuF0zUPoFBS01L72/74KnX0+ha1X
	Ab1fv8KFMJmPuI6lChSTV8Fu7s8S5clDFfNiOCDwmiR+wCs9LjmUuSgCX6QZzfn8KkfAr/l8+cU
	YIIT08/hDXO24yGL+kH2b1XEwPvhC5NnUxeIbowIoLVqUQ8Bg9CTPR5/v1oIUeFYTuNJNbgieZS
	7nEApk0SlwXa1kVWpow=
X-Received: by 2002:a5d:5f82:0:b0:43d:7d6f:f540 with SMTP id
 ffacd0b85a97d-43fe3e237d3mr67161314f8f.45.1777270892625; Sun, 26 Apr 2026
 23:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406083404.31359-1-clamor95@gmail.com>
In-Reply-To: <20260406083404.31359-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Apr 2026 09:21:21 +0300
X-Gm-Features: AVHnY4LZgxzaEN3NV5oR0MAlVNP7HdThFbK1ln2A3qtcWIQrHlR3mniE5zkfnow
Message-ID: <CAPVz0n0--Y5PGM_DDw549fWTu+z9COLmGHAM-a_ysx1vD1HYuQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] ARM: tegra: complete a few Tegra30 device trees
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 6 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:34=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Configure camera support for ASUS Transformers, Google Nexus 7 and
> LG X3 devices. Fix RTC on LG X3 devices. Lower throttling temperature
> for LG P880. Add panel support for TF600T.
>
> Ion Agorria (1):
>   ARM: tegra: p880: Lower CPU thermal limit
>
> Svyatoslav Ryhel (8):
>   ARM: tegra: lg-x3: Complete video device graph
>   ARM: tegra: lg-x3: Set PMIC's RTC address
>   ARM: tegra: grouper: Add support for front camera
>   ARM: tegra: transformer: Add support for front camera
>   ARM: tegra: transformers: Add connector node for common trees
>   ARM: tegra: tf600t: Configure panel
>   ARM: tegra: tf600t: Drop backlight regulator
>   ARM: tegra: tf600t: Invert accelerometer calibration matrix
>
>  .../tegra20-asus-transformer-common.dtsi      |  22 ++-
>  .../tegra30-asus-nexus7-grouper-common.dtsi   | 128 ++++++++++++++
>  ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |   4 +-
>  .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |   4 +-
>  .../boot/dts/nvidia/tegra30-asus-tf600t.dts   |  71 ++++++--
>  .../tegra30-asus-transformer-common.dtsi      | 159 +++++++++++++++++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts  |  41 +++++
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts  |  46 +++++
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi   | 157 +++++++++++++++--
>  9 files changed, 595 insertions(+), 37 deletions(-)
>
> --
> 2.51.0
>

Hello Thierry!

May you please pick these patch if you are fine with them when you
have some spare time? It is ok if they end up in the next.

Best regards,
Svyatoslav R.
