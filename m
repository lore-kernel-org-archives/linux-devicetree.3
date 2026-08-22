Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360A886341
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 02:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787365042; cv=none; b=dhsPjh8MvENXGkVUYTVmZWA5KX+4V79bS2E5OFYEWPDu4W2zHtpzR5YXcvbJVxj9q5N1/LIVRCUvhHji+czgAyanR18oRY3Dpv3q7TQ6cfolZv+swg0L5gMmsjjwZs1fAv4nCTX+alZBgWOBzPdtsKdoZfHLnsuFt2Af89Vpm/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787365042; c=relaxed/simple;
	bh=qc2anr7nuQF/LqCHg9nhqL04YcXIusix9EyDPOqm5RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObFGEQfwwO/9ulmQtjsxwJcshiZT2HTWchgKdq3mtOqgW3G366a/kjwi7uCCO6kx7745O3lE6GqODdaKlNpzFTS/xyML4Zz7qf4jDdp94bRk61z1eWlV5U60H7xLXe5UAM+NAGzo4bsbWCmxMSW1vu9WYkiPCaiJUnDIUfRnsNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDopI7qY; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDopI7qY"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc11a30a259so1666372a12.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 19:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787365040; x=1787969840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/PxFsvPnSSLfiQZIwj6VRATAaTC/AW3c6fVX+c2YbXM=;
        b=GDopI7qY+lkbL3WHix+BtAdEqZHHz5pM7Je5HpVI5PczN0r6ndwmG72MDRbu7KXpYK
         l2ZuVyy32+dcrrxl5/RicT/P3jANr1FMRBSiRFG2Z/PaQ9T7+9lsoprofgfANAmfSTy0
         C2SUlYU0FcucJqvwwJny9gx2pv7v9ZExrHsDnXKivYsRKQSO74sSkG0tXUWbCi7IRnRO
         ch1RcANeo+w3T5OyJwr/pAdCoT1YVNlNsx2Wbrdbjbi7q0kAdftGNAuRtfjHbyqdk6g/
         e3vJeQ6drYW52wIMu3BRf1BoobGoQ2t2dajOOebdMcagKGV2G/od42W7IG+fd0Cs9F60
         BMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787365040; x=1787969840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PxFsvPnSSLfiQZIwj6VRATAaTC/AW3c6fVX+c2YbXM=;
        b=EaqNlh60kN+CXTGcmH9HrYhD+IcmMsZPeoUsUHCPtFBrrgKMyCMPxkzocSOqPlLLvG
         dSOR/yH+txeB7U81FSQw1jyf75sk04N0Gcxkp7fvdvsLAyeyffShGIw3b67T4qFGYJ2P
         oCJO8O1T4QsQrWAxJyejTRgLxN17MAGY2utw7Nrj5hBk/PeKZK4WCpFaN8h6D5TGwh2c
         3o0WdM3jQA8Rat///+A/7y5HHgHQ/Z3a2mbheQYU6oJl/DPbTi0MEzyvkGliz227XZjc
         NYI6tW2CzxXBj+sO5LT/jdsTrLJJIaxk9DQSFidhWkUE6gUv7dRW88JVDgRUd4mHnzQZ
         F6jQ==
X-Gm-Message-State: AFuF++nOjsmzaQqiLSkvjWo5urj7qIE2l0zK1N0wySZ9HQo5w93GF7qM
	axCilimLqSm3oSahJo7IjRqms6SS6tBznhDv5ENA+LiXz0L5JWGkGdex
X-Gm-Gg: AR+sD11O/+MSsyEHytxjSIvZSjb0X+BY59W4m81y+plxpfHpeDE83EiuIi5oNRPtagX
	HBxxj42V7Eii5lKougnmbIuOebYNN02ESYQq0KKlvS/Nj181UwMC5QpoP5sDJKRx9pgEDpkyNIj
	AcJIfg5iyMKqc6Pvyt7geY+ZX2O86smgVUdT5XQ61EzQTdOrOSvHxeS5STliC7oTUFQ/UpBFYCA
	PTLrGcHObEJGW7g/apND+WA/Wa9geG8RRe8ng4rvOQyQFjHrmYM7ag3QIDhCscwHi3zROXZcgc5
	x6l5rTaqt3K5bH2xrEkrpBKRBK12Zg2H7MM6/KLoTvHr2i4f3niU9fMpnh8SdTWoIHbgIrHB/ug
	S39jDxmVCfY3P/b2aqBAlE+iqBXoiTHafGffnA0K7B3cSFq73qQa3ay2b8A/Sr2AJ2XJ1MKSmEt
	HKuesvugVofJKprlJRn62vs8sgmA50xuHyjpUTy169Ip/JIL9L1KUMuGNEqEif3TZCcEMurg==
X-Received: by 2002:a17:90b:5790:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-395deecf08fmr5441511a91.7.1787365040304;
        Fri, 21 Aug 2026 19:17:20 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49b406bsm961123a91.8.2026.08.21.19.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 19:17:19 -0700 (PDT)
Date: Sat, 22 Aug 2026 10:17:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v3 1/5] riscv: dts: spacemit: k3: move USB3 phy to board
 level
Message-ID: <aokGbT7XTCbxUQzl@inochi.infowork>
References: <20260819162115.2252812-1-aurelien@aurel32.net>
 <20260819162115.2252812-2-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819162115.2252812-2-aurelien@aurel32.net>

On Wed, Aug 19, 2026 at 06:15:42PM +0200, Aurelien Jarno wrote:
> On the SpacemiT K3 SoC, the combo phy provides 8 lines that can
> either be used for PCIe or USB3, depending on its configuration
> (spacemit,apmu). This configuration is defined at the board level, and
> assigning a phy line to a USB3 controller while it is configured as PCIe
> results in an "Invalid PHY mode" error.
> 
> Move the USB3 phy at the board level, the as it is done for the
> submitted PCIe controller [1]. Keep the USB2 phy at the SoC level as
> there is one phy per USB controller.
> 
> [1] https://lore.kernel.org/20260727094726.890179-3-inochiama@gmail.com/
> 
> Fixes: 46380e4b1534c1626cecd7f4d0abb5e0cce09af6 ("riscv: dts: spacemit: k3: add USB controller and USB phy support")
> Cc: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 +++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 5 ++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b084a35aa00e..171bd2f40aa6 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -328,5 +328,8 @@ &usb3d_u2phy {
>  };
>  
>  &usb3d {
> +	phys = <&usb3d_u2phy>,
> +	       <&combophy 4 PHY_TYPE_USB3>;
> +	phy-names = "usb2-phy", "usb3-phy";
>  	status = "okay";
>  };
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index c3f2dce0969c..3e24054d2084 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -452,9 +452,8 @@ usb3d: usb@81a00000 {
>  				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
>  				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
>  			reset-names = "ahb", "vcc", "phy";

> -			phys = <&usb3d_u2phy>,
> -			       <&combophy 4 PHY_TYPE_USB3>;
> -			phy-names = "usb2-phy", "usb3-phy";
> +			phys = <&usb3d_u2phy>;
> +			phy-names = "usb2-phy";

I suggest removing this completely as we can not determine the
phy we used. I think it is suitable for setting this in board
file only

Regards,
Inochi

>  			phy_type = "utmi";
>  			snps,dis_enblslpm_quirk;
>  			snps,dis_u2_susphy_quirk;
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
