Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD833A380D
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 21:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774907270; cv=pass; b=F1mHGFRnXvRKx+JdCL+sE3Ayetv0cfqbjW/wAmp0jmbiajKcr64/Gi9VfWAGcT7ZH2GJAt86XzveTwnHIB3aUT8nskQqje+23jBhTqRjr5+g3vUZLnxBGDGqGvLo/9vC6U7l5j89QGrTSovIyTpy2Pm6Jj9y954Pl5sDL0g7Jxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774907270; c=relaxed/simple;
	bh=+hYVKSg9ytw6axWoUvWj7c3Njt/BrwbV7Jo1jvjAhhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDhhTMmNW1iNj+ouj167m0V8wa6Cx1owQ48MdA5Z7YqOhrhbwIN7/ze8NFdB12MIUVb7YBEEezDRm/nvpinCK8ghSlhefHHt7NaP/j8SN3kh6QWW1/qHOce+PXWABiGaV8M0COCjVGib+6TdYJvDk3EjBtS2dCgq12Tpao2HiUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=DQfm1kky; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DQfm1kky"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c76b0cda2aeso43616a12.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774907268; cv=none;
        d=google.com; s=arc-20240605;
        b=eQqFmdN+U7BqAhZ8/nZbuNbMgIqdq0MgHfdN4JNhE2IoxyqvHQBj/3Ts1u8Vt50dwc
         FOMECUOgB7J31sBuWB0OsnMu+tUicLWyYU18geVNN9zCrzhpj/a01rceBnX3tiYRIQKu
         a5ZbtxjMBTQl40NjkUdV9naUpnOG3gs81/24qoMqt9C1Wso6ffPIGS+XNQv+FRqSu+kn
         zdbmF3vxMri7mAblOr/RlXQatksDz7Fzf+5fV/6A9ARv6VsJsGr0BQLDVUGLnQcUMbwo
         FmGjP0fnZ6jPdurDz4/Rx/XhAqhy9TuMCyrJ/PnhwbFDl0hXnHAmwpnSkMVrv9cpkeTI
         SDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+hYVKSg9ytw6axWoUvWj7c3Njt/BrwbV7Jo1jvjAhhs=;
        fh=fWx9M+rvW0OcTZL+CTt5/zuB4jgCJzIEOsU3R+QCqxM=;
        b=RsfxOsG/9nBVTiGt/x9xfKnjEtqeb/WAaPm7Qtlu3E5w5InXSkZRUuVw/VE73j3a8H
         huxMxGRqVyx18EX5CnRODAlnfg0fqycTcZ0SL5fdAVz1RTTVpxxuCctbVtpvL5AF2Uqy
         0w7lmDv0cp4rriE/7YvoLIISnRKJymWcl31VzkPThYJ71h7PA0SfA/BXvzg6WvcvcT2O
         ui6UmViYQj/5TYvnd7oOZL72Ug8xZfQMNZNRRzNLcGN3erw7tCM1vtygo/mmDrF5pwTd
         czz4u6VFwHpuJbgLBLinpNzudnp+/4uo1xrrnNWFyGeG9ZjPFBGJ23BtpPWEUdZ/ZfzD
         iHQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774907268; x=1775512068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hYVKSg9ytw6axWoUvWj7c3Njt/BrwbV7Jo1jvjAhhs=;
        b=DQfm1kkyMXe8TSILhCfIbHtgqbwW5rof8lKqZHaRxYDHEwqIoq713jaLowLXqfNXe7
         qSs2i8bZv2LhNHkXtIOc6DnrSWzF8DHylXY1qgu7oeKYbCFlCwD9zljob2EAVoA4WkT+
         CDcr5WuyntBz3qpG5zpojV5ZP3VhQNIjaD9jxov7GRrQpPHa/7cJofVfOeb5Mu1OgNK1
         C/7E3BiicRc/+kVJbmQ4gG/7kgAp40TA20TooQQjfV6lmMEvYACLvlmvent7lhHGiopm
         IuqAFDwvCLx0HSry6k3+7H2bSTIWR6iLwaxFktHJ9RGYmDWMeL5Dya9cNJwEmM3EEUYM
         +5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907268; x=1775512068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+hYVKSg9ytw6axWoUvWj7c3Njt/BrwbV7Jo1jvjAhhs=;
        b=qelStIjICi5PkxwtoyV1dr0r64GgtbWnQfQz+8uitOZ76w5t9h3H6eZXuaRRpA7U8o
         2JFj3hye+ywkypCIr0/ikPz/42QaCYmXCuFQ51NphFxGYKYErU27BZRs3wWx7vxPCHCO
         2cVb6Hb3alx3GN6UpG7cJ5rzQI+DKQ6ImyOTcbAKxE/TtA1Ociv2YzgHz4Zr1iW3KF5O
         PTkMY4aFJQt7tnTNs3eIJbfSXiqztYzCbyW9h7KJYOKPhZxOjjcUNYIiu3s49H3+HKA4
         v6/pmxH+P8eeC5UDxytyl/7aOZSX/yPbPoLojCiFFsKKnaUR7cj9TCdbdxXDjqm728m1
         7PoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwDHWnQWBolx+u9j7gu+nttELQU9LqoWMSS1Wyv+erIhYWqCJoDMmTvrK6P10RSbeXCEJC4kT+lx2S@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7bHw1m3LqPRAuExAFE2PiXnV23DS86MPnsgoMQk4fI+d5ILP3
	bfGNsiv5Y4OaF6DH9/nnz/LFpgScEoUFk3OeQFNRidDggLlSLKK4wW2VsEuxu2QDbchzE5PkOgZ
	WkEx0O2Ec6ZpflqXK2G1IXd6kzhi83no=
X-Gm-Gg: ATEYQzzQ7aOkjJY7IjUh1hofl5NTdFK1dHgllDX97VivzWjlXJtTKgGiGDdF9d0Wi3d
	uOHbs6wuWdjuigOqPPIqz3Zd/gqqutnu8WvNhuRnOTVzE+mJA2djPxxCZuuEQgLIGal0eAdC1DA
	3F66XU5yduIZyhoVG+PVRTF6qiS6eUaVOgGXS3Wd4jneg3FcAyskKPqP6/09xh441uIkermzSUv
	TUdRQI5+OzJ360zPesftMJ5oLplVXpB7p12SVWGs+FdJ2stVnmcyGRDl8dkPxWOYvtV5nGflRpo
	IWShFvnXQrjcjtUeyFolmYpmt/l2Yd7j0d73PjXe
X-Received: by 2002:a17:902:ea05:b0:2ae:c816:ec5d with SMTP id
 d9443c01a7336-2b0cdcb047amr144282745ad.32.1774907268370; Mon, 30 Mar 2026
 14:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr>
In-Reply-To: <20260330-fix-invalid-property-v2-1-228c51c8de93@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 30 Mar 2026 23:47:37 +0200
X-Gm-Features: AQROBzBvnmRKRGAIvSjOHMEU9BCTQO4Sy6Oph-BgTLAMA4eX_eDJ84xw0oCF39g
Message-ID: <CAFBinCAxT3Nz4VfJZWdvE0jPN0J0Ux8Q6NQrD-uCv1ouhmMuKw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: t7: khadas-vim4: Remove invalid property
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 2:15=E2=80=AFPM Ronald Claveau
<linux-kernel-dev@aliel.fr> wrote:
>
> Fix introduced invalid property for Khadas VIM4 sdcard regulator.
>
> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: regulator-=
sdcard-3v3 (regulator-fixed): Unevaluated properties are not allowed ('enab=
le-active-low' was unexpected)
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603290828.5gt393t6-lkp@i=
ntel.com/
> Fixes: 60eff75ac67b ("arm64: dts: amlogic: t7: khadas-vim4: Add power reg=
ulators")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
