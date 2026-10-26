Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985899;
	b=L/kjNLydCIV2sgWMaU/0ghwzCCpaZKdViNBmyPGiO4ZOg4UIPTJAZEA0L6069XNYb3Ka
	 ucjf2qX5RrnDC555qH5rsr/9y1ws20iNSCsyCoEdYCKi0VYQBoMv7V+x0GEuNbWPmeEGy
	 Vk3aQyS5zwxeXw4Y/FKxRRESq14GIkcPNAmlRix3MOMSCED5BCV5ErFuGnRNuSXDx5134
	 eMWhcKaPduf9LyrNphW3mDFja1zhAY6tSJ5VDTapqtBemWJdZAFbVEgoAONG4ljnCuO7+
	 77+cK1Tw0v5QZfqVoEILooJ5Lv9I3gEsAKmb2fJm6L3Wv2gZmBrBFrUDGKxaX9WTDfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LJ/LLdUvbUXDscVG28+mEznHp6VW8smsqWPUjig3N5U=;
	b=UCq7XseEQyizBKuThbz/tEgyUU5Ve5F7ohYjWAbrfRQsJIbmGpm6CAjBJ8zdbXWmp/qs
	 Cize8adbNYps5OlzoAAJUfOTVdmBbGtY2bmgv5rDwSzS+vV+kPGbSo8RVWnFx30Oo2wKJ
	 ntb6z5gSGbGCmRQ30qWOuXyAbo4K2e7RRd5qDpPE3YYCe6NtbbvDbJkcAZHN0gp4jgf4O
	 eflzLfOcXCeMLDo7q35HK0l0W11DVxOKAdGvFVbdnyOk3I9CEE/ZF4XpDMiE5Rrx/LA6x
	 PPTCd7x8BPXd2uSjmNwmrEvSwvD11Um4ynhvNb0C7uwyjTJSxb2NJURLZ+ZocZIH3kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Uweb9oov;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD29606A32D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCD29606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Uweb9oov
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-89f85edd210so745498b3a.2
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 20:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985898; x=1793590698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LJ/LLdUvbUXDscVG28+mEznHp6VW8smsqWPUjig3N5U=;
        b=Uweb9oovCFOPVbjTBnMFzyJ1Nc7wOGjEHPhUf4YQFw3iAwtiQ0UEl4AoACdSZ1bmSq
         ROocwGSExTI9NBgmdQuvQssZRafLezdMdfqAP4Bc03MOy2w5YNSaTn0sxwfedb1NcW3f
         v2XQkWB6TJkPB21OOEjzj6pqK14i1QVE8j+6sSWqouxzgd8tmxwn2GrUWTjUlXpSIK/s
         XofvlStI+fb1YhEEBiRbjVGazw5Qtm/l4YLoVzEKl49fJaVMIOBqXLYABdhr2/yTkSTj
         w48O/b4PfACywXevHfM383vGzSscaEVm5wkNwNdF82MAEDlVwC7xw8RptDMWVK/gxrYe
         fYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985898; x=1793590698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LJ/LLdUvbUXDscVG28+mEznHp6VW8smsqWPUjig3N5U=;
        b=diPFA7I8vwBpBziHbTjw3a8X8BZVHsKDhV221Wsq1CXKM4B7xbjRbNLY04lVTKIi4t
         4eZ4v971dTZIgq6tQER4qdyvLV57A6QKbHVKXYDwUOlqIPuz3aV+tgUYMEFUvq4YOLSI
         27OpKxV/SRJ2961IKN+/8AvJf8xjXes4e2g5jnobPdXCiNagrV8cUXZ+hyzhMgN7hudL
         5Fm1sPaJdWXIbZNHkjwrJHzRcSSdEGNEqcb1sSkTVI4RCrBPlLte4py1tvVnzveVJpa7
         1MEuj7c3YMqMjFo9Zvgr9mSs9/UoETJbTlRtFdzpZQkDOZwQ/46w4sJcGSON8qYEKRI/
         N1rA==
X-Forwarded-Encrypted: i=1; AKwUvByTKoBcHk7ZkAqtZjb1suuY+MTYpmoToHdAlFw/7jg1gpBePcDsJvtzWKQja8/xPE2F0e+hvKuy3FMc@vger.kernel.org
X-Gm-Message-State: AFq9FYI2JKAOO7XULhrA5bQfX5RTD1v7Xt4ZqiU7zEcqzePJNnTgGtls
	8dUpzgvfTZgYsIhmsy65f8DJ9GR4jdB09L3pUtNh1mSUkxtYQEWO+hxZ
X-Gm-Gg: AYBFou25uY+SP157O+Qy5aPtZEBXpxuL+fxMIx12fWFhZpEDcLpiKJrbqDdZBxrDOwY
	+g+FJraxAW7oR6MIxwPEWGJXkwGC0oIBHF89qhC4mIj/YU4inHlCBUD4xK0gOze2Rm+0aTozO14
	eWFkXt7hbJEAMnT9WspKilGbWCMjcwwZjIpK6sBhj+vbx4yoO4UqPlwNGrKT0vT+AQCDAYk4cUX
	UoaypbP4JURCdr5MIpDK9TLy2Rw8tQcbiD2Dl8zldbEpNX4omPCvPM6UMK1LK/daLRF1Ato4g8R
	u7FqmkcbEdyq7KiipxGbptH5mQwfrKN9X2/+bRCBvAC/McH/3pR8a5rHO68AgDL5iHSRr1POO5H
	xylhLBM/oDAU/smaD7AE+Xp1WVhbFjSEAmv7mjBT6Mfup0RzGLe8TEHez+oXXWmlpqWiddbMP4j
	bkZbmu2yvBLfWsYS7WEpUtze5Mrknj8Mzp66szuGLPawYiFAuVY/ALlcmaCuyGK89IOcO1wWux8
	Dk/EFgHSHNsgMirYkhD4/VdU2u9QIi6FyZUD3lySg76fBbmlfLC8qLq9xHFSwQ/uoMMf9UqoOpC
	9NGDTH0bX6eBfzsxrhBntmfp3g8EEw7NYW8eJU6PD9McdKmbn7YD42otHpNUAcm1omFkcDyIpPe
	dS06pEz9DGE15Fy8FZhFule1/A0F7meyxpB5O2S6wI3AR+FSd5zJ/pALJ
X-Received: by 2002:a05:6300:6bc9:b0:3e1:bd77:2c92 with SMTP id adf61e73a8af0-3e7cd4cbe1bmr3717741637.68.1792985898172;
        Sun, 25 Oct 2026 20:38:18 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21017sm989192a12.10.2026.10.25.20.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:38:17 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: E Shattow <e@freeshell.de>
Cc: dlan@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Mon, 26 Oct 2026 11:38:11 +0800
Message-ID: <20261026033813.432250-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <813d3f4a-66a9-48df-b9de-6a46b9388d0a@freeshell.de>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <813d3f4a-66a9-48df-b9de-6a46b9388d0a@freeshell.de>
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

Hi E,

On 10/24/26 07:45, E Shattow wrote:
> Split the patches in this series so we have a clearly defined initial
> changeset that does "Extend the BootROM configured peripherals to device
> tree bootph-pre-ram hints for any SPL loaded by that BootROM in SD,
> eMMC, and SPI NOR boot modes".

Thanks, that makes sense. For v4 I plan this split:

1. BootROM: the fixed clocks, the clock and reset controllers, uart0,
   sdhci0, emmc and qspi in k1.dtsi, and the SPI NOR flash@0 in the
   board files.

2. DRAM setup, as an add-on for Yixun to take or leave: i2c2 and i2c8
   in k1.dtsi, and the EEPROM, the PMIC and its buck1, buck3 and aldo1
   in the board files.

> Capture all the BootROM SPL loader flows
> that we can understand (USB missing currently? please add this)

USB download mode goes through the OTG port (FDL button, then
"fastboot stage"), but mainline has no node for the USB2 OTG
controller behind it yet. The DWC3 is a different controller. So there
is nothing to tag for USB today, and I'd add it once that node lands.

Yixun, could you confirm that the BootROM uses that OTG controller for
USB download, and that it does not touch the DWC3?

Does this split look right to you? I'll send v4 after the merge window.

Thanks,
Hung-Chun
