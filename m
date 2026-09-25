Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC8B3DD847
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790319249; cv=none; b=k4kwnS25YVRsMOHDdWYIqqfK+aIol1uLi/kfcbNALd7QHwzkEVwcXdwBAAAd/t8Qi3y5P4WfVjcDegbSpQKR4A+TTLmGjxdL3JqiTUT0EK8aO51gWCAfuZvXqDgbkBD3Xc1qF4cdvTPukXlsJeZr1zdEeKijRq4UIsSisHJVzSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790319249; c=relaxed/simple;
	bh=9lVcOG/0qmYCrGElXpVRLeq0ACqpkttuIHJFI8l5byk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WCv22XxaC/H4mCSg7hrNZMSidUBCN4M4szii1rYO3Ud4IjI6voh96hWlJ+OQWGzUGzEucjxL2/7vETqw3p++hRNBMkwT1nyD/VOyJVv3IeLyE4rX9C3AE867Yvgn7pRJWEGLVRU0BGoTaypIJNXKQ9iqkGCAlgVy7WdoQNSeXiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcpgxTiL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcpgxTiL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so2984425e9.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790319246; x=1790924046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VgDBfAW0/uUjgMOzVAN5aNqMskwgUXEaSSIIPtgLXDc=;
        b=pcpgxTiLntwCDlDAI8mLX/8n83P7H2NvJnOqjcskR8PwNuWeU046SVrj4FGrosULP4
         Ip08TlGdy5xblN5IhyGRTSE3zjuDNVQMFO+gfedo0xOwFBgVgaS1nA6GNYBHMdYXI1cp
         Jd7DJiW+Kt8uMF6eXQ9Bgyq4UZYqEC9p8frVKjM75y7TUmoPVEw4ND9K1/YmElbp5PpQ
         60Qb5p6d3kg85H0uVAxKwhZqvi6eQMzPjrOL/FGXKVVoyED1kMu1Js3DcoUkAzbpz2oF
         GGz/Sftxby2t31mcqJdnBdlvuM0uUxpKgn6WxjfEj5Mfzgkm+9ouHEyUQHBoWelFZUs+
         0P0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790319246; x=1790924046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgDBfAW0/uUjgMOzVAN5aNqMskwgUXEaSSIIPtgLXDc=;
        b=p/d+inKdEyikjvl68sipez7R/y44dnfEvnI77O62ZGzXaFU/TWTTWi059kYoBKwPT/
         qA2qIkJMdLEi+1JWZ1iomOkodraEN2OmpzeMqkvpGTWXbeIelvi2pakFyg0pA9hZHJWM
         EqijrwWRGnaUraOsOKTZ+0dI92kxOjb+7WtBMgROdeXAPVkOEcZ6PhpCwCBPwiWgrXTp
         vu3ZhbKoJCfo8TgOMdTOLD4igWeYTx55xEIBmDv4tE2ToFO/A3HMHO+M0ub2IldWteMt
         hWP90epJquKdVLs4XJsLrmKng+ASER4ftak4aYwpZ1yCvx20D2k5qBLlK959UE21KPhb
         4HiA==
X-Forwarded-Encrypted: i=1; AKwUvBwgUun4Sn/Uhemn0YqXnd8rfy+qWSIhy1yFudgHMZm+D09vNxzfFjeqUhd1z3hiz8kcW7FJOALfXYH4@vger.kernel.org
X-Gm-Message-State: AFuF++nqSfIztvP9lBve82syQDgpoNgHijGsmciraY2R76CsNVea75fm
	L+wtezTaOSQJI3Gw4YgaQmbLzEBgSCwejMKlDMRfjXcLfuoVFqeMn3Sf
X-Gm-Gg: AYBFou03+69Iq6OHMyiHiD9Nft8Ak6J5zsm1wzkN+kVpmV2MZP2JpooWb6Mz1NqsY+j
	LivAMkkZh9RTnhB+Td9eVRaiXBNU5oiGYoGNqVGhVsGHMK7RkCEGH1emjGcQW/gS4cU0gsBPa1n
	MrVnJZ2M2QeyFRZutxrYRuniQD/tNENLZZCHndZ9bB1dWJ5ULnco3gCrC340TPptSUFWol1gOlB
	ZiRoUzVaOLckjFM//Aa/ayZIG2HJ/JPWrLOOR1oGlSoXyqLbi7ZGAVCt01ETcAbARpp69mMeV2X
	N3P4mYgRm68G1F/baVHF4JE/qActbrPLXsIB7ldmvk/wMlH/uuVtVR0rdz5qSpAyBJGr+chqjoh
	4/pLirxAEAw5Crk3K3nxZp7KTxVJTC2nMvD8Lpr5ZplPChbGDfdzyp/0j7VJhebsyXXWnPg0s1e
	7NIeQVXB9Wt9SPHPRQbdLOeC6sGPvOfSGDswnPkyWUE6kz0IkBiqRpIAUKwW7kp1O9kJPczo4m7
	RAqgekoS0tXAOKLMq7xpvF72n2EPF6/tL8LuUOwEZAPmuWJaKA9TyhdQvFDdqaumMd4yInXBGNb
	0jVzmSfPnEnc18+h8cfOJJhcR1gboYDu4Augs9Ah5DgVGoPYxdTFnD4xas/4za1GA8K247BzwUR
	oimYhVmtIs+x0PHgUiKU=
X-Received: by 2002:a05:600c:3510:b0:49c:fa20:cbfb with SMTP id 5b1f17b1804b1-49fe66eaae4mr79133295e9.18.1790319246025;
        Thu, 24 Sep 2026 23:54:06 -0700 (PDT)
Received: from cypher.home.roving-it.com.com (78.45.167.195.static.otenet.gr. [195.167.45.78])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff044406dsm42144905e9.1.2026.09.24.23.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:54:04 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm: dts: bcm2711: Add wakeup and alias to cm4 rtc
Date: Fri, 25 Sep 2026 07:53:48 +0100
Message-ID: <20260925065400.2248660-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pcf85063 on the CM4 IO carrier board is capable of wake up
so set the parameter, also add it as an alias to rtc0.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
index 1f4ebec68370c..8e45de01d2ad1 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
@@ -7,6 +7,10 @@
 
 / {
 	model = "Raspberry Pi Compute Module 4 IO Board";
+
+	aliases {
+		rtc0 = &pcf85063;
+	};
 };
 
 &ddc0 {
@@ -103,11 +107,12 @@ &genet {
 };
 
 &i2c0_1 {
-	rtc@51 {
+	pcf85063: rtc@51 {
 		/* Attention: An alarm resets the machine */
 		compatible = "nxp,pcf85063a";
 		reg = <0x51>;
 		quartz-load-femtofarads = <7000>;
+		wakeup-source;
 	};
 };
 
-- 
2.55.0

