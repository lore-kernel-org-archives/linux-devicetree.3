Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12413C9ECD
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228440; cv=none; b=h1qKeZoYqgaAiv/N1XYL784axEZs28r4Hor+yJtNN1RXo587vbFTYm8uCnAYkEtujvc2W/ulNVpMhtpTu3SIUgiQRjKbcK1JitePFkRO+L/8wEkFCWL4ozz0aOjqD7xTxmivyD3rT5OlQzizj1P6GGHT5xQfqN/r/fH3DL6ytT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228440; c=relaxed/simple;
	bh=TQbe/biy9htlzVQhWhB2WMPTK2E7zpG9vrUxoUGpEvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TtQby6qWqwqmtJ9B1qtTDhbUafBU8SVrRMsDPb/sKAEGR6llRLPwRT9Gv6eoKUjB4VQJr/ums9z4LCovalwQ4/rr27bPI+/zX0GlWB7K/dsLTOlfNmBdwciuwXREpgoEADuN/bQKn+HIMBB5d20S+2Bn3/QmKdgS/6j3Au2sH54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IaqiGgtn; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IaqiGgtn"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b941762394aso259408066b.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 08:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775228437; x=1775833237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gu4S8y7arrlye5B2e+gfyyz199/jWDrWD1f/lej6PM=;
        b=IaqiGgtnD57PD+EZwhTfwVxBsgIdHnI0Hq5hMakuxQzFuGOCuC0YCqgIy+GEHW27IB
         CLTB8dQBlFdzKfsihtllMSkkYV6nwIC23/yR+Wyt54veEYYvMQbyrqAxUvJXUHVb5oIj
         Vb80w4D0C32pW1AYDiN5fg/XVMecKy+3wKvhECw9OiCpRQ5uDC4+0WXziKXd2QtrtFbp
         o0T8wFrLmNp+LKjXXqhiEuJBNEtsZrCN+ICRDRLzN7o/YxTm2IiivX5XNWuhIDN9CpXj
         rO89Ve1jN9WrHJZpjQqiUOp/uO6RViSrha2UAWofPN62883Sjg/YIdX4Bt56+5JYJGB7
         KIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228437; x=1775833237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7gu4S8y7arrlye5B2e+gfyyz199/jWDrWD1f/lej6PM=;
        b=qKpct8cZkyfqlgdoCACFcUvWYaVlsIXKndy9tocWyH5dpmgy9E45OiMk75pW0uNGfv
         litroO+uIz7n6g7d8HRHlhhJfh3jTIyqFJxWvlntOnSipC9eeTzzCV6l0IgNdL0/MNkD
         ePsPZcInNeRCACE4PLm+x4GjHyf/+We0cUIW9UL6Zx1aD6+v/ZooFbKfQfXPHDNJgHRG
         0tZIqQzBMf+YOuLAe76m9O5iNWdWBSBCgzu9mbGndeP+VZNjLsUhi3+8kB+dZ/bXl/vU
         ClI4bXPStyyyf5u5fxWYgh69gex4qo2nairaiC2cmbvx3SKesGXVHnG50nZHMZULpM0D
         4QsA==
X-Forwarded-Encrypted: i=1; AJvYcCUkSyghTZ36hReFJJL1/tixk2/cSiDkLmFnj++O1zXHuSgWjdaXAYCCG4r1ddTfWsCBgwsL2K/DY+9z@vger.kernel.org
X-Gm-Message-State: AOJu0YxlfB3hi/MOC8vd062+0ACIGBGzwKRKBO6K1k/qs6ftjOnZ9e8+
	ifns706jO+ymKR6/zMrX4Srx5EtgBrRpDxkPEKH1z6dmEYX5pt2g8i1EDKTpML9Lx0U=
X-Gm-Gg: AeBDievNqQ2+FinxAyajDmUSkyzlLheiD4cjegx1uqLpdA5Q/3zHLCCaCBVD2qEvF6D
	ZeWw4y2Mb2CIfGVdF6a2f1QbFp+wGNfRTtGpYLP8Q8Zy4RcIgwSdyUqvb+VwL1bpUijKV+DSvB3
	wyOPdSH5wntGbu77KtkV+ynCaBd8WhDGWUp3NxWXWp+5Cw/fttlwAMKi3qEv0aCWCxAEMMSUsUY
	UxpthHyWHF93LXSUBDcjjmr/9I2WV3ojQ3LoN/ijhGUo4WABfM1/0p5EJgBXl2OQQUC1DQfJ1TK
	+poilFbIm2wBCTRvu+H4Tbf/5C0BLSU+YDEB1xDUBq06iYLXUM4y3Ki/mP0FvNQD9j2PdbPrrxN
	8DQV1NWXqu6fnQn9q+lUT9KbCcnC/iv0S4L5pXUWUEllsh9JgI+zyJArE8tYhoCnGAQA3UHEwkC
	08590+c9jAm9xW16mKxcuXJFB2geaecIS89DMiJKY8mHJeWlgZ9qxwf4j8q5YYoqOuXl3f8L058
	Yff7KyeqrUCYNRHkF6Y9MajUgsiyB+Bvyr78A==
X-Received: by 2002:a17:907:c819:b0:b9c:5357:15e1 with SMTP id a640c23a62f3a-b9c679a5e68mr178381466b.38.1775228437171;
        Fri, 03 Apr 2026 08:00:37 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02f389absm1724648a12.13.2026.04.03.08.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:00:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 17:00:24 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: milos: Add IMEM node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-imem-v1-2-4244ebb47017@fairphone.com>
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
In-Reply-To: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775228434; l=1119;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=TQbe/biy9htlzVQhWhB2WMPTK2E7zpG9vrUxoUGpEvE=;
 b=wtds/FesU61DwOgHwI2IZtmUWUdtpEuRWDzS9r/ek2UT/3mzDGVqZwNz+x12BgknKrrzIUS5u
 PFjJEXku1ERAo1kOHDG2e6tY2RmIyv/Bvk5C0tdY22r67Uh34eoFDlx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the IMEM found on Milos, which contains pil-reloc-info
and the modem tables for IPA, among others.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..1c045743ef77 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2289,6 +2289,25 @@ scl-pins {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,milos-imem", "syscon", "simple-mfd";
+			reg = <0x0 0x14680000 0x0 0x2c000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0 0 0x14680000 0x2c000>;
+
+			pil-reloc@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+
+			ipa_modem_tables: modem-tables@3000 {
+				reg = <0x3000 0x2000>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,milos-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;

-- 
2.53.0

