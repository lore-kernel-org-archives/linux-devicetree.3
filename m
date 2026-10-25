Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792925015;
	b=H75mXu8JAmi64/hbxYKjI4hswc3DMSFwIGhLabu4QG9TROXvZeWCcmYGaFpuXFd7MCX0
	 naggA89C06q8q9FJC5Zuvxj478kTq0uGILcgczvqAFDThlO4LtOieVdQOWrEeOovb2b+9
	 Uc9ditrBDJXzXzMD+YYIK3qrUqm3nwPZ28BMwMQT4AbxmaUbomcDoIWSbl58gdqp2ZkGu
	 kVpf6CNM/q5TgYB+ssT9nQKTrhH6Dm6+nCjOTSCp6mR6Pr3ZVUg/EPlceA4vj3poQa/p8
	 W6zUxgvtzAIegkazOwG+Zvwp8Altrphis01k3JE3R2cXztJMovzXx8FwZRUZg5DjIdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792925015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=2nhVqeDWML+DyZIbNVrMj09Q/t6YqRPgh+lFp44NdbU=;
	b=c12FUV4EX7cZEVYDmmDPaGiIMCqgFHbq0MbbzzL6cI/dwGTt22f/5p7xLKIMSsshgR1T
	 HNJXsXcP/N6PqBvGlDS1XLxZ/Rtmaq9gAzAKl8dRjR5Ea47Z1QYCYMKcIQuIABBwFHGPw
	 239M2XdNJkkqbDtpBpCFNBCwnY6YpSP39zfk1f9BOwz9dnNxbnI9Vxu6AYpFdHKR4KhLn
	 wNXOIA+CvRNfeIi5iwouk7sS+n/G9qkdB8U/irk7OylmzQxCmvnWnA7M+tAAsDRe02ZFb
	 XYVz7QayJulcjYfImx8bs0SGs+2F3IZvwKLmVROuIkqHDQ9f38kBzad6e3cpXLTuFOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rbt38REz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72808606A31D
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 10:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72808606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rbt38REz
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so2672679a12.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792925014; cv=none;
        d=google.com; s=arc-20260327;
        b=RteEyGrMycWpg338y3JQ5wwOBspJeTZcPllTIxzVSMpOLI/GU/lr2Yg6aomy+++GkK
         7mRPm79B6GTGrE9xbuHYzhkDvD6gSaKrwQgA7FEyjFGxWcyDjG2hLZN1ON21rjAtMz+V
         8fHkwxy4fQQPlkf0q0lTPNU0iZ0o6SEZniWeD7Q1KYImNAx1jAUm0Y9fSXI7Kl0dRbZM
         dqmBbDa3yCxxzgjsaUtFfP6Vn/M7yPNnNBUX/cpV6jBnGFzNJWRUzr4o9kwGMkYVzFbi
         eP2N9Z2olcwnCkCLlkGotwuhr4bbkjUhqHD39njm+A5cFBbTQOh83sdXs0F8dMpR86pL
         Qztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2nhVqeDWML+DyZIbNVrMj09Q/t6YqRPgh+lFp44NdbU=;
        fh=iSeQpTrY3QkMPByVYeN2GFGatPrH40sPWVQPsQXSPac=;
        b=LDEitvwcSnauJIC0i3OP3W7NG0plkf6A2j8Bw7MRDfgQnilKB0ShLQSVK0+ToziMBt
         e/PAguLXuBhloiH5yCewbZ/dlNFx0VdoPg2mJtVXCWw6qhTj0/M5nxoL55RTEOgh8tFP
         66DemkZag+jlZCMSJ6/Fb4p/58DOctjjlhPmVSmT2mhj09iiUfwB52FAOn1ERjCAP0sg
         IcGEd70zmL523nfsAZUbwTMgCOM7VLEebZat9EKfQOquOCBS8/dDQtb6KC/h4V9z3Ath
         Grb+2ArzwAvJJOv2petaMqQuTAvFet/EFmQ91dYGZLL5IU8m8grlzhdlKGyluQU61nbl
         ahCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792925014; x=1793529814; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nhVqeDWML+DyZIbNVrMj09Q/t6YqRPgh+lFp44NdbU=;
        b=Rbt38REzAy+sj6ZjpLOT+mVNyxZj6UqGJHgMQrw0MppcvV85pE8CtuLLb9hWrJ5MZn
         BIDRHdjJFWGCbHVvxxXxgt03fSFR6yIofwtQtO0cN4x/OEeQrBru0OMr1vx9tj5aRFmJ
         vqeCzDfDHUWYVOH0G32D7lHGuCZ3DfRIOyiisMx23EVkzlHfe1wugq7IAYpYqy5RyYI0
         DwnEj9UfRFbldIimFSvTe9TZab3uhQnHNvUTEGae1o/d7FA2pSPJhclP+URG1VGJP9BC
         yCExYq/OXmwGVreIA6v7Yb3h/AEISO+z10zhexnOUWfTg++d9TjVrr2pwHzsDV7MvlHr
         IXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792925014; x=1793529814;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2nhVqeDWML+DyZIbNVrMj09Q/t6YqRPgh+lFp44NdbU=;
        b=EvjvqJvP4S+Z6VA+19lbHtdzgDSq3H2U7L4Z7axIbZNZLnXgnvsU2QtTzPTAiyjdxA
         dCcKZCz3MB6+sudB6szhjjNRMaIl4lgxCMgHd5cVHwBa4e2OT9mcIr1Rse4wr5E95Y/m
         clNncVQTPnUDeNDjaNkp5pd0cZH+mY5oiqD93suSgo+UjShHsVE32XuJxYmSwv8WTjA7
         pmBpi+foCdd+iEYsNWNpk9kszrWKqdsyhTEM5XtLvwlylgFS3EblTqUuJqJ3zHgw4rNS
         Rk7FiuYhd4jm2P3fmm3KiGMfBBu2yz4qnQNbbwB86RF9McN4MbT6r1sQPKnzFIEoOEVJ
         4AzA==
X-Forwarded-Encrypted: i=1; AKwUvBzL5yDGjFjr750fvOp4Ryy9x7dpggiYTDSe+PX8FfkSAlRo1TgQcaKeRCZxISPQWGiDsEs4xW8pMFBU@vger.kernel.org
X-Gm-Message-State: AFq9FYJZJmKcrH+BZDAvhLIKOktLAL5oWvHbyyZeopIT0bOfeSlhI8Qq
	c4Z44zM9bte/6KOOu25WS+R0Ooe4vsJjzeL8/fBVNst7Ddd2yGnc3OgO58Tx9Si/O0o+Od+cxFw
	OqWLNwiF7TJnSYRB2f9b7kaqz5fZKm34=
X-Gm-Gg: AYBFou3/Hm6IJHjh7pZCGwuAqjODLMI5l5+u5NPLPmE6IOONkNElfQJc5cbkA+LCCW+
	oEGYRs7idJpMSECEAVvFnMYN6hau+XqeMsmJVOIQCAlg2Svvm+zwbyhYZ69h+Bpi1K7drY70Ruy
	B56oERX9o9Q1xqHdSDAWkAPR0DFL5h2jocgHK++uG17TMAMHBYWiz94LOdBssL4c/ycsBOsIrgo
	ORQgcztY20dobbxBf/rK86glsz+lGWSsOPZ99yPjjHYb4d8C6apLABZsyVBWCHy+bbHOFwOEE+h
	0rlVaKzlUb0OEXzaSrMx6w3JiG102N6bje+wWC8TnO8cWXWPrcrKlaL19tZhrzYKPZxYuj6psUn
	FWQMO0m7U3O9N7hBWd+i5gw4udl9tWAAlNiY=
X-Received: by 2002:a05:6402:270c:b0:6b2:20b:aed4 with SMTP id
 4fb4d7f45d1cf-6b4430199aamr5305867a12.38.1792925013523; Sun, 25 Oct 2026
 03:43:33 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <20261024092558.143621-2-alan.tseng.cs@gmail.com>
In-Reply-To: <20261024092558.143621-2-alan.tseng.cs@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 25 Oct 2026 16:13:16 +0530
X-Gm-Features: AclHuK-kOeWVKlgsWorJqSjEZdHZLjS8gQzZJLPBLsv2jCYHjrUYgUabSVC5ZyA
Message-ID: <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC
 nodes bootph-pre-ram
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, E Shattow <e@freeshell.de>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hung-Chun,

On Sat, 24 Oct 2026 at 14:57, Hung-Chun Tseng <alan.tseng.cs@gmail.com> wrote:
>
> The K1 BootROM loads the next boot stage from SD, eMMC or SPI NOR into
> SRAM, and that stage brings up DRAM. To do so it needs the fixed clocks,
> the clock and reset controllers, the console UART, the boot media
> controllers (sdhci0, eMMC and QSPI), and two I2C buses that every K1
> board wires the same way: i2c2 to the EEPROM that holds the DRAM
> configuration, and i2c8 to the PMIC that supplies the SoC.
>
> Mark these nodes bootph-pre-ram, the phase that sets up SDRAM.
>
> Reviewed-by: E Shattow <e@freeshell.de>
> Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>

Thanks for these changes. It helped me a lot.

Could you update the pinctrl and GPIO configurations, including all
necessary pin
assignments, to bring up the SD card, PCIe, and Ethernet nodes?

Please ensure that the required bootph-pre-ram properties are applied
to the relevant
pinctrl, GPIO, and other dependent nodes wherever necessary for SD card boot and
SPL initialization.

Additionally, could you update the regulator-name properties for
vdd_core, vdd_1v8,
and vdd_1v8_mmc?  On all the boards, the SPL code requires these regulator names
to locate and enable the corresponding regulators during early boot.

I am verifying the changes against the existing U-Boot board device
tree and configuration to ensure
that SD card, eMMC, PCIe, and Ethernet initialization work correctly.

Thanks
-Anand
