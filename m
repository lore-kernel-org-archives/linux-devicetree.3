Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155192E0B5C
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 17:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782666425; cv=none; b=ELtHi1iNq3xvkLDcRDQqoT01lnk4IJViqSzJtUeEWo7f7ptJX01fZSrrhogAjCHDKodnF24su9TEmmI8IS/e6GeitBoJ6B4x7aatOANNGlAzfoar3MBI28pZQOgpACocHehYKbT05Ui+KHLYfK+5d+eiGPpKmnDI12BbjF6TBjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782666425; c=relaxed/simple;
	bh=DzA4G1y5Qr64H0YZa7V7mNtDvYRatP/4Nwj2bwqCK8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q60q/rJxWi9bWqJz3DGn329bMpj9PJPcbvgNR89VKDkaLyzs2Pe76QDBM2vPtJ+ntubSer8HS9iTdx1v/0iEu7ltakoR9DJgDHeKTW3hVMND7+q6MY17Tq+aREXUpVB9iyYbISs1OGM9I3mAfGX7AEFZ7OGUk7rbEpiNFEyw+oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYBOZuwl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYBOZuwl"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493a613571eso5442005e9.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 10:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782666422; x=1783271222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6EXA0Eq4U3xfkyZSos69NYqUAWxpb1BwEfcIVdoTYs=;
        b=jYBOZuwl5atZWi9BkDePmzcsjmAoKI2Nbkkvr43xa6Ba5WzD4xQklHgN2cMdFjqDYe
         ub9OopPEtbDyClE4jooGokhoPSgLRJ//nO0GvwkRa6H4GvvZ+6J58FDyfuKx+/urbcbJ
         kHNAyPTXcydXc/pqgQ8JorNSvXl5UpymMoHT3GfMQmnwwVtf9AU2N5a/0LXSW7q+LOSd
         jQshOhaIIaYYPrC33l8vcfNYpxnG3JQDFQ+I378MpyeU/RKwY5d+jF08B+yC8wO6zKAG
         N8pIMu1DCmJf8mwyWrFyBjOdz8xUkyZCZKnZ70OmYI/OL+EQE+w5wLopsYaf+h1mXjL9
         dELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782666422; x=1783271222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F6EXA0Eq4U3xfkyZSos69NYqUAWxpb1BwEfcIVdoTYs=;
        b=ov7laqptIYD0NcAR8tWdlkz54B+sWopbAgX+lZQsoIrcGLQrTokoY9cRde4cRFCCQp
         VMZtC14I78TX30lzagYSslsoZEqCxkYWJ8++LuIMjUXXGYZ3Rco6JEpg1BvSlrcXUn9g
         7kZedb95G4+t0dxrfjEDlAoNaaBWULeOiWBAZN3qxlQjjVaEcT3hJ/z/NOapIrwMyIFi
         US6Xr19c0+fzcUbNKRZ1dp11o1IFFcFOAgWRCMiU5rahKsb0ixFnpIlhCiBZJlNxYOpM
         6XeXZu4HNo6B0fhhjj64vMOjqIdagz+Zg7IvmhXyXRcUGUCz2eJAfOKrAu83tvvB8o91
         DJtw==
X-Forwarded-Encrypted: i=1; AFNElJ8gyf6U96CpjPORxMbv0+GcVY2ejTcn9KN828VV8bA1kmNX+Hw3HhX3f2kTcebbmOiNHRa90uwQLNS1@vger.kernel.org
X-Gm-Message-State: AOJu0YzKiWHRH1OLItnwuGaC9dzdCoQMIXCX0ZsjemsfLgeJAVcQiOVB
	pM0vO9BM6Fg2VdGIRd0fkNAXZ4GpoxvgwLnt9eITwLLggusPrW913Kw/
X-Gm-Gg: AfdE7clh/lxQLtPYTFc/Iz2KaaJ1HYjPuIsi+gdoDf8SJoiGJdwqJdi51GRzFB1nIod
	0prT0hemlvW6zRhBucAfP+ffMFOFAbOOSlcxGBrSl37aHiz7//+bbyTmcfbZDNIcouUpaF0iS76
	ahWgHoLGgXRyMYWL1pvUuyfDlArZqkr89jba0TZ69qSyKn0ly5TipntpHbwdUwv2fLTqtn/32dl
	r/I8SN3Zjz5hmmX4GcEeProyytN0LhZqgINSxF7LnOg7IALVeQLBo4zSO9wvarmzbK02Gk+W7/E
	TCohDqqBCtgpgToI8PmHWgtCdjeEwn4Ne1KfdYaqEHB316DA9ev+V6cm/X0IvNJculZSleOrTBX
	G6FZK6VuRDoQGmfJpozkQrdPn2iKi+FV68lwctlIXoDEJPazSjCl8mCCQKKowuR8viLM29+TR6z
	HGGy0izrIhlVfq8hNSMPoVKsvNzoch89iwTkG/TTMQ4cH8TRlZCKgErL0MtzT4Vu8m9VLXZo/X3
	jmXVa3kRoAxQx7mt9QlYv5lTg==
X-Received: by 2002:a05:600c:3e8d:b0:493:a5d4:3798 with SMTP id 5b1f17b1804b1-493a5d438e1mr51953535e9.1.1782666422446;
        Sun, 28 Jun 2026 10:07:02 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a7fd1b0fsm54217195e9.1.2026.06.28.10.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 10:07:01 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 2/4] arm64: dts: ti: var-som-am62p: update audio codec configuration
Date: Sun, 28 Jun 2026 19:06:47 +0200
Message-ID: <d59a4590cab14865f5caa5249c4c6ec7632f7d5f.1782665899.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782665899.git.stefano.r@variscite.com>
References: <cover.1782665899.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the WM8904 audio codec configuration on the VAR-SOM-AM62P.

Set the audio reference clock rate to 12 MHz and add the codec DRC, GPIO
and DMIC configuration required by the board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index be19cbaffc4b..9440891339b3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -152,7 +152,7 @@ simple-audio-card,cpu {
 };
 
 &audio_refclk1 {
-	assigned-clock-rates = <100000000>;
+	assigned-clock-rates = <12000000>;
 };
 
 &cpsw3g {
@@ -204,6 +204,25 @@ wm8904: audio-codec@1a {
 		DBVDD-supply = <&reg_3v3>;
 		DCVDD-supply = <&reg_1v8>;
 		MICVDD-supply = <&reg_1v8>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
 	};
 };
 
-- 
2.47.3

