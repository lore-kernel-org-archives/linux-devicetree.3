Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839112;
	b=GarB5ReKcNs1GxkhRJmPAcGFLFc1n+L0h1nBRzZmPuPKzDZJpyeTwrA/2zrekmbn+g64
	 m1YCfcCMOuhWOqrTdGyCz88BPGjdWjLvbf7jk2rSh6DACtAO8Tpxh0pvyeAFZGhJ3BLzV
	 Ccat0STvywbIqytVU/7oRhtva9GeaFLd5RJRlxrurnxahjYZy3lz3Vnup4JqW8bV+jJbt
	 brJIg7ZvBKRmAZcv8OrWYROt883kbiUm+VTUPNY006mBCXm7oBJFoRvq/h4zWV6NzSA9c
	 95QwI1TEkUwNbLu3zd+nii7srqgNznXgCQulqZepxuFGoqxJ/SX4SvhwurG+8flDGPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8droy8SkDbf75L1AVTA69UoLCcieNW/rhnOo3JtrCC0=;
	b=FVqBjvNwFhPDe1CpPOZ/NC+w1F03t7NIDc+epougZlhpA3O5maNJDo/14tthoL65DK0V
	 cl4+WxyHg/nbR+tXlapoaljqD4vFb4RGSlQeybQ+me78FLNYbMMiuvjtgrXXRz0RLJPfH
	 1tWAV+rPzSyE6+msvG3qRfeovqOaZGmsqX2cfXKnqoSr23bAanaZvdM6CckLJrnbfXOKP
	 z7ddcK9Gtf9Eo16Vd+fpw+/AIuxDy326KMn5+ZIu1TG/jLo8j5y4qGw66g6Dw6YdVHyes
	 fxxMPYgfSR/TtHyEKLgnKSRAc27P1OKby+TVo531XFjpV0LF8PeXF1FhIbQSwqE7+tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rdnB+/Zh";
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149E2606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 149E2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rdnB+/Zh
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1843843b3a.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794839111; x=1795443911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8droy8SkDbf75L1AVTA69UoLCcieNW/rhnOo3JtrCC0=;
        b=rdnB+/ZhhgSe+IpZn/PJ9byBPBpOFlpUvLmE+fYt2aOnkTzu8B1+Sd5e9h5Xq7pkex
         xQaovwrY+iBOf9WrkUEehBiFNeNohjpXp98vbuT1y9Y+vw+HONLpB+k+wuCPaS7reV5Q
         1o2X3Ftk4/NGFwHjn0PkRJyeiAhKuap1ciJpErLP7PeJm9VUiS2o34EAV2FE768aJHrL
         EIEoJSUMeLpbszTumbIRh2o5vqgpnbhTy3gbEIjfYaVA3nM3wBMdMN1dZ7q0OQovfZpk
         7pat34Y2NdG/bMjTTzEb03QeMiz5Njo7GWUFr8sWVN2NvSQ9EBGXCyF3pUd0aRvd606Z
         kzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839111; x=1795443911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8droy8SkDbf75L1AVTA69UoLCcieNW/rhnOo3JtrCC0=;
        b=MQeLseU/AQONUkya0doLB35aS7TbTBpWn1d1lR3stJQ50n2yWhbOSdfHF115SXNUlW
         ZDNH0uxLx3pr4GgIySpzpjF0FpWns8dLCtgIU9HhnyqyqjoFJ4RF/X8xY89Li1e+1g/k
         vq+K9nrYdb28X0y3mxiJ1sLhk48gpZ6iQuI7PaVXRvr9MXfxYVi3A9Hy1H69yVA1XnxA
         qt/9VcfAyvLwyKU+Bj23Ypv7t7CsO0hyFYv/U+RYw1Q9Rd82vmqTX7v9zfjDh8qDHezT
         L8q6gRu/ICYIrU+zJBkZsrDQBkJfMTgyt5rsqntBRjJWqhjx93VrY+3mRqDeuy9bzLqN
         jZ9A==
X-Forwarded-Encrypted: i=1; AL+hErFu/YdYjHkEnE+kMunH8v4c1e7sOfWZOIVD31mmpxQkIBSA4ofsJjKINnHA33zt4v/g/AgpJ/L1Qcpa@vger.kernel.org
X-Gm-Message-State: APuU4Z8Mi/FChdH+cD2V/b1BQgnsD/DUJ/K7UTdq69ZB4aRg7CVyacSm
	UPboX20+ssBhunE3QLk5yoIJGd4iegRCg85jWQRg9vlgCimbrcNJS7Zf
X-Gm-Gg: AYBFou2aNehLzjPBmTRtal61m0hxpVlyuid3I1pkaDH2fFbizP+L8BQ/3DgnjWCStON
	kB9E/CuKm+n6NNtZiQbERaAIbWqJlCk2ixtG0H6bdYIiMdRx40c1PijNYeZQ/CoLjp+zn3n7++X
	NpsvErrP+ddyZCUOm3D0h6hBBdCGaxSOv0wUeOPH7N5vC0ATGMTQ6s30JG1X39BbBB61CHhafjN
	Me1FVmkuh4GXyyzZzWrHF/egJHW1wmrxC3QPY1v8A76xY1B1daaWc2ghEM66qTyOE6/iwzwmMr2
	BwOW6HLZctfnyRuYBNxxp+jjPLH3DrUWPMQae7UKInMkSeczRbbT5V63RFPutjl7+HNi8cp8/3B
	TOrUB3m/7sFubHEnsVt7jVq59vXUpM/lEgfVabprd6T0QU47z/1ntNx8aTUZwilgvH2MdwrIHsg
	8bATw7YoerXr6pBhhh/uiJ9kBafBun0aFguz+5U7jWJ8F6b5aN1ILKCP4eZdIgmS4Ng6N5zJpCf
	L2CoOxP9IR4tLw5aRWQrTjDkZY3GDlsYEPwfBNxYLW7y3eaqxZBehMmiIhPzhPT7hD/Bb+2Qjsz
	NUKGMcAmm3p6Xvb3nTp8qQA2xBvK0kJaU6eVzcQugRXmZXJZ7a7doXE9LXaV
X-Received: by 2002:a05:6a21:8883:b0:3e2:2234:62a with SMTP id adf61e73a8af0-3f7a84cef9bmr7584081637.55.1794839111006;
        Mon, 16 Nov 2026 06:25:11 -0800 (PST)
Received: from arch.localdomain ([152.175.35.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2053d26sm3834158b3a.36.2026.11.16.06.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:25:10 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: jernej.skrabec@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	james.hilliard1@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: allwinner: h6: Enable Ethernet on Tanix TX6
Date: Mon, 16 Nov 2026 22:25:03 +0800
Message-ID: <20261116142503.671907-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115171148.37784-1-jernej.skrabec@gmail.com>
References: <20261115171148.37784-1-jernej.skrabec@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jernej,

> The AC200 MFD and Ethernet PHY drivers and their bindings were merged
> in v7.4-rc1. This series adds the device tree parts needed to use them
> on H6, starting with the Tanix TX6 and TX6 mini TV boxes, whose only
> Ethernet port goes through the PHY in the AC200 co-packaged with the
> H6.
> 
> Patch 1 describes the AC200 in the H6 dtsi: the I2C3 controller with
> the AC200 on it, a pwm-clock that provides its 24 MHz reference clock
> from PWM1, the RMII pins and the EPHY calibration value in the SID.
> Everything stays disabled.
> 
> Patch 2 enables Ethernet on the Tanix boards.
> 
> Tested on a Tanix TX6: 100 Mbit/s full duplex, about 11 MB/s in each
> direction, and the link comes up both after cold boots with no
> Ethernet initialisation in U-Boot and after U-Boot has used it. The
> TX6 mini shares the same dtsi and was not tested separately.
> 
> The arm64 defconfig does not enable CONFIG_MFD_AC200 and
> CONFIG_XPOWERS_ACX00_PHY yet; I can send a separate patch for that.
> 
> Best regards,
> Jernej
> 
> Jernej Skrabec (2):
>   arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
>   arm64: dts: allwinner: tanix: Enable Ethernet
> 
>  .../boot/dts/allwinner/sun50i-h6-tanix.dtsi   | 40 ++++++++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 53 +++++++++++++++++++
>  2 files changed, 93 insertions(+)
> 
> -- 
> 2.43.0

Same AC200 setup on TaiqiCat (TQC) A01; I'll send the board enablement
separately once the H6 dtsi changes are merged.

Thanks,
Jun
