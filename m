Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF0F547055
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 05:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789796979; cv=none; b=t9frXbDqzC7oSeX4m4cMNVfkLdyrTx6nTMngB3FduTReZNFzt4Xg9mC+YS97gcTRBC4JMEqG9KiRp7hgGcabgWI+QkHeMzoi8yyB+/Ys4QLIrKC1JviVJEk+nCYobJPKO7Svxj7eDHDMol2WCFWA8h+6hJbwA4OI5uNtYVcma+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789796979; c=relaxed/simple;
	bh=ADlmP3cuIVH6XDELJaBXIFK0o8CQXGLyOKUW6Gu2JKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WU+TI10lCleMzDmNvalveAv4A/GWulwoTOyrILlHWLbqqBFtDlBmrYKmwTxxOSHuAajlYPZksQwa/llK0ePAf4Zv+EG5JPp19fKUNP+CvNhosovWB+dhbAV7Yzt7ibHJlPZNB+9wlurHNoLSSefxwg0VTz8QqWd3BfW8kimAL6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKFh90yZ; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKFh90yZ"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccda24afso1123044a91.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 22:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789796977; x=1790401777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJw+LFtPFh6SoU2BWDHxw9/YHsXZDhQ0lOnE3Vh/h6c=;
        b=dKFh90yZORs92tY4TEA/OqSxrCgpF8Ov7q5UI4RFeE29yqiYXBkxsDPBIjjtDw8+d1
         EFXsTncfUi3jgsvX0S3fcIUWR2PjZnsP/WPxuLA3TyB7wggA0hY7Sz/nnjm6ePYzQ/+w
         70hn62B7sR5u5lh+iuSQGF8jfc6EYd9ndV6Itvp+QjuAcmYBR2Ofer5ZWFj25x5yV8RX
         1hrVFkrIy4akPWKdwoNniX2W3nieJq/uFaM4LucMjdA7S/XFDvn6Hl8Bu0IzU5NK+545
         C/I3OV3KakFIkj8j1HmTzuSPOjsntwP42DkUbZh/iabQ06E+5r0DV/7QAwAG8FLWBK7A
         /3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789796977; x=1790401777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJw+LFtPFh6SoU2BWDHxw9/YHsXZDhQ0lOnE3Vh/h6c=;
        b=VkjJTZ2006Wx90Ni1miMUNzvco2UUPsBVsMzwrHF7J6Mri97isTp3VraoHIVjTpd8H
         aIqN+cyRcnS4Ve5qdKMZY1Ok9w3udReOB0D0gTc7Hhcn21io4zfZniXXr46APQdU9tgB
         X+E7hgFNu1kHfltzAUeF9a3y1dW4CMrHanJrOCDSlFEw2E9OoZc73j6+nlUtFbTpBgXc
         CF8upBxl1loD3f71wLPkY62Cxhzq1kYauHNu8raKEuvZWjjs7y9FoOM7GPJk1oJG8ddO
         EPEzJIQrVfBfD7gRYVkWKseVJ6YuDh6hrAJRIQTpWFFT8GA3FtoOF3HPiNt2SdEZN1gr
         v2RA==
X-Forwarded-Encrypted: i=1; AKwUvBzs5y3pAFLOQ6O1ZRJHpQr5lLCzwQnaBxZndeWxiF3hNSyrWpb1XGTkKkPruXXgla8j2ZTCvTlUzO8V@vger.kernel.org
X-Gm-Message-State: AFuF++mpmALNlk8PVmtTXX/cxerZNBsF8rKadscCG5pwCVRffzcKMFgV
	VgZpC3ej1nTlTF6t6Hg5ESYN3Jz0pH2XKnuy9tdNr0aklVVHDGwi1IrW
X-Gm-Gg: AYBFou3rZamuE5/dJT4ehoZDRC5uHoQMaBpwAbpIe2ANJ7lcYYpw8OJ9SfGq0EG/m8H
	3ZQR1t2Q15WaiQL21x+F+KZDolyqybFxHw7MJDQDhXG5xR0+5jXX5Tl9TT3Bee0Y7L5CbtuRtJt
	iaSPkMCPK4/JiAEBdYBW/1jFPYDTmMkndUkYhdrCXlXomwmDmeApjg0GHlcfsl/dZ0M8wfXoYZ+
	vJwrvWSbf4dggtA8uYwFVd100oPGkZm3Be0HSingxy7Fxg4PGBSVxLozl54XkdCHUMSmhOqQpoa
	Jgs8RTIk8/P1QtDxBNLSGOHt3z5Qei48+7MJYgnRuYI/XmiWp6gxbemce8kPx5744uz/W5/rYkB
	M85pU+41I/lEMppL5Ksbsnn8OUJIas1V3gwRbStCW47dJA4ziScSzdR3zB4p99k2P60DCorVONz
	99FxRENJ4h0dRywHLDJGKB5OjH8uYZu9Z06fr7yfFYl4rhTW6PKg3GXB2W5zTgNurMMURQwtWZY
	BcIY5w7dzjt0ejcRBkFbVwztl/AvOKzykL87nXOGmKC6OnOKsbMmms=
X-Received: by 2002:a17:90b:3bcb:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39e54eab3e6mr15914399a91.12.1789796977038;
        Fri, 18 Sep 2026 22:49:37 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb400c3sm2791939a91.17.2026.09.18.22.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 22:49:36 -0700 (PDT)
Message-ID: <2d07e535-3029-41d0-9dcf-8772f7330434@gmail.com>
Date: Sat, 19 Sep 2026 13:49:31 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
To: Joey Lu <a0987203069@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914031859.385224-1-a0987203069@gmail.com>
 <20260914031859.385224-3-a0987203069@gmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260914031859.385224-3-a0987203069@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Add the USB subsystem nodes for the MA35D1 SoC and boards:
>
>    - usb_phy: standalone PHY node with #phy-cells = <1>, covering both
>      the OTG port (PHY0, index 0) and the host-only port (PHY1, index 1).
>      Uses nuvoton,sys phandle and HUSBH0_GATE clock per the binding.
>
>    - usb (DWC2 gadget, USB0): phys = <&usb_phy 0>, dr_mode = peripheral.
>    - ehci0/ohci0 (USB0 host): phys = <&usb_phy 0>, companion pairing.
>    - ehci1/ohci1 (USB1 host): phys = <&usb_phy 1>.
>
> Board files (ma35d1-som-256m.dts, ma35d1-iot-512m.dts) add pinctrl for
> VBUSVLD, PWREN and OVC signals and enable all USB nodes.
>
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>   .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
>   .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
>   3 files changed, 137 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
> index 78534d613486..0a068abda6e0 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
> @@ -97,6 +97,16 @@ pinctrl_uart14: uart14-pins {
>                          power-source = <1>;
>                  };
>          };
> +
> +       hsusb {
> +               pinctrl_hsusb: hsusb-pins {
> +                       nuvoton,pins = <5 15 1>, /* VBUSVLD */
> +                                      <11 12 9>, /* PWREN */
> +                                      <11 13 9>; /* OVC */
> +                       bias-disable;
> +                       power-source = <1>;
> +               };
> +       };
>   };
>

The outer pinctrl group node name does not match the MA35D1 pinctrl 
binding. dt-validate reports:

   'hsusb' does not match any of the regexes: '-grp$',
   '^gpio@[0-9a-f]+$', '^pinctrl-[0-9]+$'

Please rename it to "hsusb-grp" in both ma35d1-iot-512m.dts and 
ma35d1-som-256m.dts.

I tested this change locally. Both affected DTBs build and validate 
cleanly after the rename.


Best regards,
Jacky Huang

