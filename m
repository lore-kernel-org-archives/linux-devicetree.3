Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDA74A1E07
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263760; cv=none; b=uZy1OWh3SaXyfufXcEw8O38z5XsTBB+2ygVr5hwMFbRqVqakxoAZMOFH6btpQSNo/OADIbdeuU7n/OcdyquatF/7lWAJ4ewQFXopPylDmaOCC+An6mtYnGq6T/wT79Jap9yPw2R9+9VCVTz08hvau7YoKAF9IAwXo6gwhNDND6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263760; c=relaxed/simple;
	bh=gJ9ftD1d2EfioBXUGyGjOPvuTpmoSQYjEu7aTN6t6Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGAzGSAWGWKzJb2Jg+CgZy1vphzWf7YyKF9kMSTzfGYJn45/+dKzoO9gIiO6XuKr2JiKlP31sq78PhoAnQ9ZY5BH0GlRIXV9u1UOcKXRqY3r9V/wOoJUvTzmfKGcKBENpI3U9ycXLqLCLEAQu9xicQjFcdpTWx8vqar2v+t28yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=GOXVRolz; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="GOXVRolz"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so1406485f8f.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790263757; x=1790868557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lfUyHUk2zZ/QkYHtpQQyK/B+snglAnaCGVydv2fg14=;
        b=GOXVRolz/XRN0vXk/dPynReQX2IJViybSFLEbLfHd7FLV5pHn6a0qn/lkSnQDlw8ov
         l+L7I24RbkgyzY/IY1i67+M2Do790/HP1wZY8eyv6NR8zJ2SYHViNEYdTNeb1zx9Tqb3
         RYo/1gThcdIuQPgo6o+5U8ced5fz9Rxfq2Rw4CDh1Gm+b/ynFyGrwpLUYwSvFLGBxLN7
         lxkUUKN0NsmZ0hZ+0mlJyUAOAU6mKyB5w8i9+vuqasEfp9DfP1SfJLiIZ6DArW3lVUbo
         uTr71QGaqmX9TRfuHXmPMeLNIGp8wna0ycAYjPEbA6FzdOTDsykOMKq51i4IDYJ/3wyY
         YdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263757; x=1790868557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5lfUyHUk2zZ/QkYHtpQQyK/B+snglAnaCGVydv2fg14=;
        b=UdWP+yhPwqyYcyEbF8KCAsMZNvOk9x9+eRQol2qKyeaL4l8ka/AMpYfmKjI8UvzUwP
         mw8Fn0fxlFe0aFQ5UA6mSWqHXpskcaGEfi3DkA1FTLHlH3W3CcRJLmHyO5getwV6a9j/
         PmWZtOLJrDpo1nMBwS+13DbgBCQEjYxkL60KLdF4pkMbdS4RXUVFvFhqzx4aczerq1c5
         t3FtOmrDKt3lHrvRv1P6KDbuJBVdFx+x82gKu4YKNyOBTbVFIy3Wp/55j/+qOlNG0+r1
         YZJZrJMttUZmy9reh804B3o55uM2Cfy/ZzZnYhb/0TJM/ew1L5m3WsLn3fb6+ZqJoewD
         stHQ==
X-Gm-Message-State: AFuF++kNfGYrj1rV/L1p09tptD4EqX04Qgo2uhDGpSm72ZybGjdF+3ZY
	3HKon5hZXjdywvpDX6NZfc523G0GoMcDAqCeR+VztaxLhC5lOvC0DAUI/8txLnRrNlY=
X-Gm-Gg: AYBFou3cAss7EsFQ4zq+Qt4fZ7YRl6K9WuM5Q1bfjSw1rhoEH+iw9QS8zlIRFEXFKLv
	zdfnr4P9BStGd9Vu1OqPwVgjJDMBtCTIntpGkusDN/7E6S2v1NqpdTzHlP4Ko6UqKmlJCzunVgz
	NXnxT5/7s7gNqqHGwFHHiCZTXPhokulUnvqXtx7BU6IlU28S8y48GlQGu5q48m+ICIEufVn5QI7
	DdwbQHDH6/OSsT4suucuvXH2qa1nLohSSkS2bCekbo4VTDKKPAIwmF8MvhHi/mw+4MEKoyqY5/g
	yoNDtmSbw4lfKgG+cej8XlG9QbLQPAm3Y4vr7K9Dr6aObeRWh6U2ZFw3Tsr2vrcsRdqh9qSFodL
	DwmnLcpcTBYB+Mj7whRUd0GvGJs0lA04gPPjGZUuW0c09PUil4GMHAZ4YE/SkeyZWNxtZQpNDaW
	OQYIrSGfmX++0UKIO5A1wsll1yumMNCbdPLnj93HOf4fQhSOBSy1+RiqWw5GcCY0dkOrfuPE4Om
	Wa12cg3E/bSx5F0EWkwRavxlRvegADe75dw
X-Received: by 2002:a05:6000:4010:b0:485:ac96:7273 with SMTP id ffacd0b85a97d-4887170e2e1mr4826526f8f.10.1790263757380;
        Thu, 24 Sep 2026 08:29:17 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm14781552f8f.0.2026.09.24.08.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:29:16 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v4 4/6] arm: sunplus: enable SMP via PSCI on SP7021
Date: Thu, 24 Sep 2026 17:28:42 +0200
Message-ID: <20260924152844.81705-5-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924152844.81705-1-ag@ffroot.co.za>
References: <20260924152844.81705-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SP7021 firmware implements PSCI 0.2 via SMC. Add the psci node
and enable-method = "psci" on each CPU node to allow the kernel to
bring up all four Cortex-A7 cores.

Verified by boot log: "psci: SMC Calling Convention v1.0" and
"smp: Brought up 1 node, 4 CPUs".

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

