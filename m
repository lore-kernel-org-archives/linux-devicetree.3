Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2A53B3C15
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 14:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785682285; cv=none; b=Hs9hiWJ4gFZ5L48tqGu7bZDhKgZwyz5JzVaG0WVTAZ5RL/S3LEeTzXXvBmLUEb9BPI2embAHCCTKjNE6M2O8lR7gKMsNAD5mv+hp3PR/Idt4X33n5Vh6RK2uxbwnTfG3SGe7coWFIjUsSv1a7D32pScVnwv34IJFNtkqsX6ESBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785682285; c=relaxed/simple;
	bh=r2NEuqrCzOVhe66hes1V2OPETAdzw4qsfFazaIjsmmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSliDha0uE4FbPqFAbAmsOry0F18Zi7NROQGYd0ocq1lcp1l3efMJRDgGnhRdR+7GDwlflUPUU0z5NaOWm+AJss5+kr6sjF63NYwRem7RCWOnP6A0fZ4iPAQJxyEbB61LUouHd7U1cGYr0YQr7gvJZpvQ4g06pnieOoT9w1dsBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEkzMHvP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEkzMHvP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49802c418b5so10385055e9.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 07:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785682282; x=1786287082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/eSA2+uClIahrAYzEIuh8oechnt30g1zfVwZP4yV0I=;
        b=YEkzMHvPX3CYKL9ZtuJYlVn6JAnFD4PR8QcXJVfzDZzCLNeDduMVRoviDA/pDIjg/1
         mml4KflkMnZo57ay/UiZVVpWWhjYjYm6Pll+pwnYm1jj9Z0HLMp5GgewM8fbd5JGZzN5
         Osp4gqHBVPUxx/dbNbDXa1bH8ess7RtU6/OOwAjPOoT3wrbgQXIDia9gDT1vs8eHeqBo
         rszFsRMWOao2NZ+viDg4dhD/b+6aqtwPakobonUZO+d+rMIkUrsoVoFX01mhpXfPO5iU
         JamShdz4Cgotx3tmKBHszzDQdqK0UV9l/1U3BvjCqcPojftfXx3ZLZv9ikq2SbzvnfUT
         cPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785682282; x=1786287082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/eSA2+uClIahrAYzEIuh8oechnt30g1zfVwZP4yV0I=;
        b=FcMAQxgMYqsWExu1rI2TdH8c5cqsZkS4xYfraIaAGBySFCd6opJkdXg0YYf14ZpClo
         VmuohJiX4M9MmH2LzRmoq0YkePu/jJEdh/IM75Nwge+2v0AE+VZSEeYxEyU57d1VRkOK
         WB47Gbwp1g85ylrhRk2KfNb55+EAHOc7txq00ONeAnBe8+1lzLuXGRAzwHjJ1NOmuWLh
         cTsUkw3UNX/Vin01A15k4ChVK9cpzBD+bnWE1QGgjcdElDRGLgbhlZ5tr26C62xN8f6s
         Sa6MFs/+Xbc7xmy2ETCQJSeWJyZPugU/joZIbZwmpgz+5JQFBfmjJAFJgL1DNYOR2bVN
         cFRw==
X-Forwarded-Encrypted: i=1; AHgh+Rpm3Z7sfq2NJxhaWQ9mp9pv+oDKQAHPu9LSv6sQlrMWnzxLKuJ+WOnmLTeJFJrRzAELATFveJNUul92@vger.kernel.org
X-Gm-Message-State: AOJu0YzZOFTxL/7yRvi/PtI0SHyd68VoB6OSOQw3214yRRNEWQcIXpC/
	xx6qpbn3yT8ZfsXC7a1vRlBAoVg8pvZWjkwL7wzUticgVrX4e/Y47fwR
X-Gm-Gg: AR+sD13AqSuHGwAzXjVWxqpMpV8w38K3tjl+wDxZPsDkAMhpJpUGAwn+xDF/0KSvNGI
	5mZF9dYBrpzoIRONVQ4BoI4ERw5h/VjBgZ947gL0ugm8274p9tx18kihW/6jfdtE/xx8OQ25JzR
	4lk43A8XLin5NflbtYXraNubwJaWnegQr2xdBTHAdfmSqeo15txDy0FSDjpRT02jRu7PJ9MTtIa
	Sirind2C/LY5QAh/SosasJezZHVcBRcPap7KqRfVmJCExwNhjTs7cLOynv2Uy+WnHR0LfavIOP5
	3Pd8RI0KhUkXRjxLJbg+9hqy/p0ujzfESrdqreKHOq8JuQiF1yRkB3+rnHtQK+xA8uUvmtWJkKp
	gVMPviR9QqnZE9oei88iRGtoX+mddIbh3SPpw1xErksagTYAJXpJE+BqrDCE47mH7QN141vJske
	0TM7qmGOlgcQ+HxyYsnjWedqb9ZpL5+t4mMnT3pVKH3Y4JximgX3b2zqdOzjDuWiJEuC4SCjNht
	rhbyKibLTXVjKiPushrJNdW2OZyeHyztsHviATp90vAxH5N25YlgiftfLVzmyXAkf4O0wMp3zBk
	A+la/C0r9VBorgFWAGDnEk8qgIoCx2RGmcE9Admxhk8C+L6HOFCM1j1DhcKuQ3jEo9sq3fZHfNu
	IC/Ks1Bt51EwqE/0G2a5xPE9W+mCuBvCe7/88zYB6pi/Km1VAdIXN8BtaYUcG
X-Received: by 2002:a05:600c:6990:b0:495:4d00:2fc0 with SMTP id 5b1f17b1804b1-4980c673907mr146632395e9.12.1785682281800;
        Sun, 02 Aug 2026 07:51:21 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm234526335e9.13.2026.08.02.07.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 07:51:21 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 2/3] arm64: dts: broadcom: bcm2712: Add thermal monitor
Date: Sun,  2 Aug 2026 15:50:53 +0100
Message-ID: <20260802145109.728793-3-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802145109.728793-1-pbrobinson@gmail.com>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The thermal sensors on the bcm2712 (rpi5) are the same
infrastructure as on the bcm2711 (rpi4) so add those
details so we can get thermal monitoring on the device
as it can get quite hot.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index ae1fc9d728c00..c73ed9e066662 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -508,6 +508,18 @@ hdmi1: hdmi@7c706400 {
 			ddc = <&ddc1>;
 			status = "disabled";
 		};
+
+		avs_monitor: avs-monitor@7d542000 {
+			compatible = "brcm,bcm2711-avs-monitor",
+						"syscon", "simple-mfd";
+			reg = <0x7d542000 0xf00>;
+			status = "okay";
+
+			thermal: thermal {
+				compatible = "brcm,bcm2711-thermal";
+				#thermal-sensor-cells = <0>;
+			};
+		};
 	};
 
 	axi: axi {
@@ -724,4 +736,24 @@ hvs: hvs@107c580000 {
 		interrupt-names = "ch0-eof", "ch1-eof", "ch2-eof";
 		status = "disabled";
 	};
+
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			coefficients = <(-550) 450000>;
+			thermal-sensors = <&thermal>;
+
+			thermal_trips: trips {
+				cpu_crit: cpu-crit {
+					temperature	= <110000>;
+					hysteresis	= <0>;
+					type		= "critical";
+				};
+			};
+
+			cooling_maps: cooling-maps {
+			};
+		};
+	};
 };
-- 
2.55.0

