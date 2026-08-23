Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0792376475
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 11:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787486034; cv=none; b=XYGScCcq+BJCYIIcHXlYKUI6QB1BOVlJ4OImOwIhaCJadJWIoljIYnKkSRQGdE6z2j7RdpXfH31u05HiPhvERFmmgut+YkQZEho2VuahbT6tVtT+SXWTn1AfrWqQWdk6G8oU2N8hHYNwIv7Ecg+h//ICD4MMDUkqDim1BTfAY3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787486034; c=relaxed/simple;
	bh=CrC6MmS2IBRgSJykWWk9kQbtkszePmpZSqrPmvMBpQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oysyuTvjBDWo2zrOJY+rFK+aSi4Fs1nZqZdmUGhEpae+/C4t0UCJ5o2rAD7isf/EPidI0zdHRj4HyUaTSRkP9YFuBvv4KAx+LjZCn7Xxh62ECVYo2jMs4/3TtOxnQw3fkk/dyWh6ddcDwm/EyKokaxI0T/FCr330LoGlyl5GnXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so16224765e9.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 04:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787486031; x=1788090831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=71w4/rq4K9yb8GmFJtMWkONctoSy21P/XVfk3Fhsusk=;
        b=Ua1k1ilsRKZpsmdaWbu5Wl1SMuowmKmUp3m9/VFY3MKM/nOtBTO2Uqm5Tmyjs+Led/
         pml44DPh93dytWz9aAGe4s+8oW3gap6F+Ss+4qzWWPuSNfIi74J+CJUAg9O92ZF5V0fk
         CNtm8Yp9ONf+FT4loabp7SvT3IQ+UBKyi/+AQernqKdtJLppaAZDKoosoj8xkwbrr1iG
         MOQvLI6I/ZwwYTeQjriDC2gvZmk2B8TVt2rEyKj7x0dK+Ji1gzHClXPKLUMYsZ8d3xtv
         lW2eKjfgi6Wci/qSHfOVZOJLDPPJI6F8qqjpPmiF4i5eIcBtsK+UJMIzFycmDwpKr2iA
         ri3Q==
X-Forwarded-Encrypted: i=1; AHgh+RoyXX4OW8b1dKfDuZ1C7kA3KHOdrOzBpiOCZyVJ9DoDb7bzk6OViJvxafuYvLVQa8uA4CDuG/C3+9PC@vger.kernel.org
X-Gm-Message-State: AFuF++m6xEAaPY9ltOduZn5T+AWWy8V5e0/sa8YrKWYbBxrxPWMKL+2R
	WbD40oV1X1OMXCnoqpce7G03SI4CBkYtGdZY0Q2KspnJk6QgNFJMjEG+
X-Gm-Gg: AR+sD10yYZL1ZDNFlxOKYABPtH3cxxOIqpgjqhIvmPkt4rD2cvF8cuWtExyCFcEVKwF
	MK3dbc3RBIFj6ICzlX5TWiR7VnyZ09VH6mLLAnG2AgomSM9UZ5xauzeOPGQww53RgDjZXVtVRSp
	Einerg8ipgzcN1RykHbgFj6+Aifc/V1z9fgZWU3Mm+jlThpDxuzH8/zpxuZ7TQwjNfRVVX2rFcj
	5cISXXc84XzpQigi7DkIQ3acig5wMamgHkHqzdzeRyuTWIeo2JWcwEWFIYi9W8E28fgeX9Cx+w4
	iTxRjjChS2qZNYoTPtXbZl2624XrgVTgV4nucgKZX3DL7r+L+O+oF/Je6aNYa6GkucWy/zAkBCn
	2Od+jUL5LMR6Ja6aBaDe+/s6+zID6qY30ZRRC9Nxv9XSd7/+vDWbpey/oBpJSddkc3wPSWlckE4
	Ssb8XZ34ET9GsELQGHr7t5rzlRMJXnT6WRVZiv4PpJKLj/JEodJMx1rgaPnbrMPENsOsiQcjuZX
	+9BfluEYsjOILXX15nb79n5/2cUpPrvmRliVQ==
X-Received: by 2002:a05:600c:1548:b0:499:841c:2016 with SMTP id 5b1f17b1804b1-499b8273456mr224164355e9.0.1787486030800;
        Sun, 23 Aug 2026 04:53:50 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c355e1ddsm48680935e9.5.2026.08.23.04.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:53:50 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: amlogic: t7: use the real UART pclk
Date: Sun, 23 Aug 2026 12:53:34 +0100
Message-ID: <20260823115335.102219-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823115335.102219-1-tanure@linux.com>
References: <20260823115335.102219-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uart_a listed the 24MHz crystal for all three of its clocks because the
T7 clock controller driver did not exist when these boards were added.

That leaves the real UART bus clock without a user, so the kernel
turns it off when it disables unused clocks at the end of boot, and
the board hangs.

Update the board DTS files to point uart_a's pclk to CLKID_SYS_UART_A
instead of the dummy crystal clock.

Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add initial device-tree")
Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
Signed-off-by: Lucas Tanure <tanure@linux.com>
Assisted-by: Claude:claude-fable-5
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 +-
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
index cab2ee9ea0d3..ca7536f772ff 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
@@ -33,7 +33,7 @@ xtal: xtal-clk {
 };
 
 &uart_a {
-	clocks = <&xtal>, <&xtal>, <&xtal>;
+	clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
 	clock-names = "xtal", "pclk", "baud";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index c41525a34b72..75d81ad6830d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -266,6 +266,6 @@ &sd_emmc_c {
 
 &uart_a {
 	status = "okay";
-	clocks = <&xtal>, <&xtal>, <&xtal>;
+	clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
 	clock-names = "xtal", "pclk", "baud";
 };
-- 
2.55.0

