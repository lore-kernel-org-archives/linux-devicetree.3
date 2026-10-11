Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9963B42D8
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 12:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791722879; cv=none; b=MGJUd6CP3AmQbpkgxHeHTm/UPzPKSvmVh0PrT/6qZBHmi9ZTZWUv54G7TIYonzbXjhZGddyqOd6yt7kGWJGbhtDQM2NTahE2oTIaXLcowexDIL7g9dQvYNp86lEHqCoZHdZPDLPtHAUKxzCRLieMn6l6On1KtAxXr1mfjLYdh0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791722879; c=relaxed/simple;
	bh=65FsIsY2eglM8xMKgNTFAfDsHtD95MspamnEelN3fM4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VHCdDvuz5agLDGsp1twSJFRorPT/TvWEDHmQnwf0D7X/EsxyKuBhJwiyZBnCz+7ItQZGFiHgYspIJov7ianu23rb0hYKM494qmRzS7TB68QxyPzcuO3r/Eoe0ACkER3J/5b08KKfBNjdVBJIs3oQmAaJuUsIHU5wV9NpU0H7SO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPcrJjpb; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPcrJjpb"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab2bf5e75bso496204a91.3
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 05:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791722878; x=1792327678; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cI52cNV0SAj9KYZseqFKYYVaewclBL5lcykfpxtwH0s=;
        b=XPcrJjpbpcD3Cm24ktG1KAWyjg8swimzqT25YFiiZ5wA+MUclu3QhiidYd5TIEoF7w
         STIqx+3ckjFjqxZwwdeCqX3XpF0+pbMBCGiwYEdKuyL2M60qxkF1xXKul9Io5TRs0Hfd
         Zwd8IpiHaCUnRZrrTqCfA0f9GKV1C2axryjJa1ufp3mo1/38JGupVZGtMG5DycERGbxU
         AxhZJxIRxTph7T7Aqd6LdyKUUbdh+NmCYvhZRyHTh61FkgOSamkL56fyQ1E37dHtiRrZ
         vTviqStm3NG8s2qmmsHMhM3wttx0IJ986xkKFDYUou5DgHmBmyVFBbv4Gh47CfaoCb+f
         Epxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791722878; x=1792327678;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cI52cNV0SAj9KYZseqFKYYVaewclBL5lcykfpxtwH0s=;
        b=Ym2jDe74LBvQ7brmx0SrdqC5hS6Ma7Wz9dcXmM/gc3GQUtR9QOuvJ33rJeVm1qR4KD
         YEpx2ojS2+QX7b1MxjIxE+IrQYjaHvBKm8WGsN3jLOzbiksFIG2QPjcvrPvn9/5rDwJt
         SnCsd+yr0FRA3sDr3HBxfLLHtz/NX9CUwRD/tuyBYBuzyo8ZRDr6z7PXlIrrAbXrM2HR
         c0FAo4cm1md/hHwLQujaHcaFx/p9DS7uoYN2Ys8g2A0eVb2Ou800Mk/ytlSL5bWR8e5T
         om5Ev/qs2vJ7BPA5YC34shcGO4PI8zFAAhWXRa1D2k2kWu9edfPEVHsxTbgao4e5cMos
         ehvg==
X-Forwarded-Encrypted: i=1; AKwUvBy1O9Ku6lU3olNJeAaTMzAvYidoPGz1F525oQmUR8k+df00wr9dY7aMk024yqgmGEgm5noqOdRMrZfw@vger.kernel.org
X-Gm-Message-State: AFq9FYLD+951Nt7hi+mYQjmMWpSQeF8OeQHyKnBpsXScZcSTNaz5w3Kp
	FVKtyuToOTf285cAgYBDyCmUDB67hY9aS5VLJkHpzD6oyKgWXysP25Rr
X-Gm-Gg: AYBFou0/iyew6yS9dtSmAWR2Ms3rvKyAEBnY5HWtLkFUqsD2wisH9pqIvnRykQgqy2c
	837Fd3EL46LhCvVLkI0QiDMIMcqb7qHHv2l2dCIGXpwB/J8GM862zWTUA44ydmyBDZQUJIhKch2
	n4GDBavLhjbaAlUPJ769suCL51kXXWdkCe6ry2dsnVbVyDlVSSNsYXJFdGbNBBifz/ahWnKNLra
	r2Uocri53kivuvhJqE7djVN1yHaT1MVhW640F2ixi292SITjgYz+ibIhOtL1Mlxmg3CQFCvCSgQ
	oiLv6ydE0D0UKz3dcIujv804mpce10V5POmHFZnN5E479YkvnrMR6srlym3/2nsI76UbevsbEzt
	F35Oq4gQC00z7SNgrPvmAU5eVn++T+8C7s6I1i6oldqko0QBv9g40HzeGncRVeHM/lHISmzyQgc
	5VO/jD9EVfdFo8lAIPVMYv7FYkDS9goU6xrbw3iyGLKFFX86bSwV7JYiBQIKR7cRSMKrMU4aCKf
	U7eJz+i2TT9b3/G1oCWZghxYeI2et9uNiNWuuB7uu2wRybZbgpO54/3Qy2WJbslbj2mOvjCxA==
X-Received: by 2002:a17:90a:51a7:b0:3ab:4262:1a3a with SMTP id 98e67ed59e1d1-3ab42621c33mr3830705a91.61.1791722877717;
        Sun, 11 Oct 2026 05:47:57 -0700 (PDT)
Received: from [127.0.1.1] ([121.165.170.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9639bsm11623603a91.4.2026.10.11.05.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 05:47:56 -0700 (PDT)
From: khaliforce <kforce@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 [PATCH] riscv: dts: allwinner: Keep MQ Pro Wi-Fi powered during suspend
Date: Sun, 11 Oct 2026 21:47:02 +0900
Message-ID:
 <179172282222.4040500.483739720170904755.mq-pro-sdio-suspend@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

The RTL8723DS driver requests MMC_PM_KEEP_POWER during suspend.
The MQ Pro SDIO host lacks this capability.
The request returns -EINVAL and aborts suspend.

Add keep-power-in-suspend to the board's SDIO controller.

Tested on MangoPi MQ Pro.
RTC-triggered s2idle wake and Wi-Fi reconnection pass.

Signed-off-by: khaliforce <kforce@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
index e2bb6bc16c13..b2c65560d6a8 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
@@ -87,6 +87,7 @@ &mmc0 {
 
 &mmc1 {
 	bus-width = <4>;
+	keep-power-in-suspend;
 	mmc-pwrseq = <&wifi_pwrseq>;
 	non-removable;
 	vmmc-supply = <&reg_vcc_3v3>;
-- 
2.53.0

