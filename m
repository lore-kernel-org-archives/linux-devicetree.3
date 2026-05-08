Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F2B54774
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 15:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254029; cv=none; b=T5YKArJq22RPVNOuO3fVPTO1LisafmTMuo4MwRisBB4U7ZogqjGe9DCG5/3tMXVhN7y0nhceeHtrBF3KEdjBFH8zacGiZUwFxS+3ylSEKX7pc65b2AsdidjpOBsMCrwHNbkQ8Ba9TMbR92kSvCmF+b2+UnZxDm7rYVhH8Hni5qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254029; c=relaxed/simple;
	bh=IT9hKFqi+NXwIQxrrHDq16wfzGZE5aP5iqbwqhp+jw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=diOC6JDAkG9PYbvRxibET0wQeNWfMqwRq0aIi0bCPLzo+nDEofHKyaP/g86zjTSynyN/LoGLqhA/O9b9C0keCPQZHgYPrlcgagPzX/+tKR6PbokrZG3kzk56tq5mNaMu0gj7g3jIgtpDzSerBIHPSWH6GTq7w5arvOzV3Tax6wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSCiwAGv; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSCiwAGv"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c156c4a9efso2871288eec.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 08:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778254027; x=1778858827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AZLkoMPXwZ4+vxuE7rGxM/UFbOO9EmAVj39oI/ALNs=;
        b=aSCiwAGv6u2vwzpimVbC6qrU0JTFy36QrTPreFqDn4gI9iddgmvJn/zylyasiLEbc9
         vGu2rndSZY3oRTEICiGC5V+xCm10wK5Guw5Fc0hC2kpJ/sqc8cSujcJyRTWZH4PwARMm
         WYIIfmFKTUgv8jNwsxHutZw1I6pROu/8N7cn8w7cUpt6cVXrgGnnOplacSLpCDqcOl0Z
         x6+/DGcU1QC2uUzcXrKAiHa4vHSBX9ZhYchh1Giq6A07KKjsYKJ4TAEe8Uvhi5fqOgNc
         PMG5E+DmHClTuQcvBjbRrK52UQN4EYZYQktG9Weapy1DrgZRq2Szy4ipzhVoZmWHoPfa
         CjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778254027; x=1778858827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6AZLkoMPXwZ4+vxuE7rGxM/UFbOO9EmAVj39oI/ALNs=;
        b=I7csbc4K7MMR43AAFyOzsB/kDKPaaGo8f/SprinGvI8NKynynKZUy/v3inZZBeh4BF
         SMoncKa1lMRh2ObLP4SNDfSKdU7Dtd6a5dExTR5P3fh/dPsa6zLNrex2hGJVXIvmxtpI
         CjFmrBkkKb1ZCzGGwo2rzq/UZT0vwEf66yA/vNXcDduCWDgh+dcNHowsqczTI+PQqtS5
         AT2kSGxLdqXr52H13TrRO5alt15ZzG3REJe6rXUw22Uc77AtN2KDz9Qh0eg5YsYLAO18
         tVfvxmnG7Ju+wFZWWj+UvcfCMYmqVhnrr/kht37s/J90IbYtfOgkT2r8DIJmuioRW/KP
         FQJg==
X-Forwarded-Encrypted: i=1; AFNElJ86Ij+kNz6usMczfost0xfVP47+NTYinY59qFH4UIGs8+I7cdC6QYZ8GvEUlxdsKyiIuapHHOEToUR7@vger.kernel.org
X-Gm-Message-State: AOJu0YzY0/9Ug6pw7jHs4DG+KjA0veGb5aL2DgPvZcxdX0QNCZMMAFjA
	LWQPQP1J5Ee9IwJxO7I38ssUGQvgfICoA0FIi6IooZJJ4ql92kCoCdp2
X-Gm-Gg: Acq92OFw7Kq77zAMLWgC3e61f9gk2UR3Hf9ttNMhKpuwDg4VMtIp74gAHIElfQLlYan
	Nv5i1/8H6j9sc0sOH0O0VjlDXnUtdlzpbXqRHViX4kVA4he2PlWEC/t5oDuwNxwAvAcW4LJi5jj
	OLBvWYdgS63J0kcv3X3Nops5AYrvMIkPmJdAcXXoUbzQ2TYmdY44U6CwmXFxOnsT4XaKV1yKSEX
	b7+NKmivhThSGJMzbmNIEtUK3qhhe41V260vI/TmjZM0O7FJrfBApTTD+qjxpjFGmSDKixWFg+9
	9XYNkizfkSXbeRud3bJIZ7GOzjorCeV7p6tMdEwzsFnbEHD5Jg1x09EmKfcB4keUQecPea9ALv2
	MmUe+8rmx3jlkW6fOenzIaC9n2Ehz/PqOF4GMTm7/m8nf7lJ4AWYVmZnH9fVh3vxABx9TkxAVmc
	CaudvLPo2qQdKqYZBPVqpVOEzp6aresqkzLRVksddwWxCLO1o=
X-Received: by 2002:a05:7301:1014:b0:2f2:8857:180a with SMTP id 5a478bee46e88-2f54d69aff2mr5899190eec.7.1778254026776;
        Fri, 08 May 2026 08:27:06 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:27:06 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Romain Perier <romain.perier@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/5] ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193 shutdown GPIO polarity
Date: Fri,  8 May 2026 23:24:21 +0800
Message-ID: <20260508152435.21389-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sn3193 shutdown pin is active-low[1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf

Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
index 258bbbecd927..c528d42bade5 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
@@ -147,7 +147,7 @@ led-controller@68 {
 		compatible = "si-en,sn3193";
 		reg = <0x68>;
 
-		shutdown-gpios = <&tlmm 45 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&tlmm 45 GPIO_ACTIVE_LOW>;
 
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.54.0

