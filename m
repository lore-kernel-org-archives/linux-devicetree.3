Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABD34F68A4
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015210; cv=none; b=Vxa69juVyaQntgcvwWbhak/gZlRdYRzUvi/GMLDQ92yj6aAS/Kf9XPUvA7w8tgy+FtnJxjr8JS0H2uBaKgK1u63EfE6T9fkj/6mcky8AZxWP9uKgyfbOlevw/VDy4WNWjnnJVOCla6dnOM0Mu1B0TMguPfKgBf8hcB/8BYXmfqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015210; c=relaxed/simple;
	bh=VwbZX5OKRfnwYfN8IYd6Y+pjQ2UgswkkATFt6jJEFeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CCK3IZbIl9VLK8sTQtwUtswiHO7tXMO7p+iSWvucdvNI5p0N5XhO2SnXWu+hohMG1PHdCcOYD5q32diDnJFe6w5/ck63R/MngKDrGEnVghI0Nrz79vV+75WWcwVxvDeGzlgB/SvvFxP+2rz9H2qrPVOsOsuDjZKWdzPmBSjmsAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=FlZTpMV+; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="FlZTpMV+"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633ece3so2567124f8f.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790015207; x=1790620007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XIDaYsmUghacwPnCHFIq+ZA+KCqDvLae5+CGWLLqcE=;
        b=FlZTpMV+Hkwi/p1ps8ZGiKhVuyxKigCKQZysBXZMSIikjHaw7UK1P2kW3HpIn6t+bK
         n4UTUIfnN5bvlu/xl85113F+aPoBm953LCtX5vhkQkfd54hi/iUU8IBBpjQlOJVL6lqS
         gu3HdfsTAJV5tkVjTdQQrGz0BBfRFKyQ2p9L8Ebx6cSpr2DyXPayP1/F1I5Pq4XKJ1OH
         t4HmZmKAaY7P6AioglUnVCrzturxPZUbW60QWE14qMMFmrhshY4FqIHNGd2xp3DeERm+
         ueJ7Ip1g7ScuOihwD8mGbbBjrcTKpbDgj+bQBlDZiTk9igFCD0OZdR1pZ/P2qAE1NapB
         wuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015207; x=1790620007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3XIDaYsmUghacwPnCHFIq+ZA+KCqDvLae5+CGWLLqcE=;
        b=vWn3Pby38Vas/IdnNrqk8siY93QPd4+K+wY9YlgAWmdHQIAsBz+/l2blJvxH990lkb
         S4/Pl3uUSItIraS3MI+gv9keOirzbvuiCmcCHwXPwjvhRgQg/CprqNcjQ17MZSNGD7cF
         nAevU+q3zXeHWsRjCWykmqpHtbK69aZS9RBT+5xlYzDHLKHO3aHKA8RGtoiOAIPymGlV
         yofH4P4yCBngvvQGXEDkphueSgaes5ApnQpdbkoMaPDV920+2bPVL9Yx4xZirDBigphO
         xen/kCWs0r9CAjhEkdiwiMf2wxoTWkvX2gxQEmihS3n22wG8q814htVNo15Q+OFeSGFQ
         J94A==
X-Gm-Message-State: AFuF++kkRr2Q9XSo827/IFYdBLY4KPWknz3e1YvvNZdA/mWJW5dLDUE0
	Aa3IVWCxvltEMvVhlZuCWfvlfc+cgQIPgxNFNBgtNwlFB9P2eFUGl+vtCViSnkhVHqk=
X-Gm-Gg: AYBFou1HWMEQRzMuHj6FH1EMeg6xG/POgIOrqXxtBYIUvDORGnb0WMAOxvnfc2bTsNT
	HMg2kH7JIzVTJL7zAoeaIERPPhA17JNRaqX6EWQjIPoIWB7pyLu5gbkd0P5K8Tmk+I8H+YaSN2g
	DdQnYm7mfB1OOv5L9yxy8hCqkISDuX039op6ATXcodn4K7OoyFqHDQ7alCVPxkTPQpnDFjWAEVa
	29qa+PIgzXgXRUjYn2eRvk5wJu5HVCTmuOXc7OTxsIoNzmumjTtLqTTZP4DPU677FHoK+sw/Yzq
	hW4355AjBTkes2cXpuf6O/4KbjIMF/f6dwhE4s/69bgSclBNDNpQ60M9ZVFDIOx2ZBbC+ycZAmd
	fzFJOhzch9qcYvZEp3i8NtnTmHBTYqKlpSxPybxiOck6NSMyCxxhF9DvtkZKB/f0foxdLbCqunB
	mgyzCi+1kclpwn3zFqWqY+FwZPgkA40MoJTnjK2zpA3ZpUYRpIjtcELuRcYebNFPVTKv2f5UlSi
	F0S05F0Am9NEnsdTrY2hIQ92pU2qvtPQisY
X-Received: by 2002:a05:6000:4685:b0:487:2385:e19c with SMTP id ffacd0b85a97d-4872385f827mr9198374f8f.0.1790015207103;
        Mon, 21 Sep 2026 11:26:47 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872446067asm25126184f8f.12.2026.09.21.11.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:26:46 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v3 4/6] arm: sunplus: enable SMP via PSCI on SP7021
Date: Mon, 21 Sep 2026 20:26:18 +0200
Message-ID: <20260921182620.17597-5-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921182620.17597-1-ag@ffroot.co.za>
References: <20260921182620.17597-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SP7021 firmware implements PSCI 0.2 via HVC. Add the psci node
and enable-method = "psci" on each CPU node to allow the kernel to
bring up all four Cortex-A7 cores.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi b/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi
index 493d32357e4e..b73cfde7ace4 100644
--- a/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi
@@ -24,27 +24,36 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			reg = <0>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 		cpu1: cpu@1 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <1>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 		cpu2: cpu@2 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <2>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 		cpu3: cpu@3 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <3>;
 			clock-frequency = <931000000>;
+			enable-method = "psci";
 		};
 	};
 
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
 	gic: interrupt-controller@9f101000 {
 		compatible = "arm,cortex-a7-gic";
 		interrupt-controller;
-- 
2.53.0

