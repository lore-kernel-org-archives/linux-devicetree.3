Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C673A254D
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 07:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806299; cv=none; b=bvWhxGb6+EIAJsM1QGwFWC46kJBc/xiysSdvEeGxWswOLW3PD+1UoVwYuhVG/o9nn2alCpNageGhsMifC68QNJQJKO2amiQgEbduqnbn6jtGfeYbl5iuH6CtwAETP+XUcJp2OVATJ9E9DJ3Oqsp9tU4KLEUW0/ad9hnkYe6hpDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806299; c=relaxed/simple;
	bh=Yuyp8/DcNzTxLCLZ/KgPEbXxPMI+WxTMHBAv85H+9yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VXVsbBfhfDib0mM/aaGTG9auVqqtVQZfyIZ+TuRKpV2joCNFL8eELHgskAh69SqTxIOe6bDAguH1G2Dr2OTs4xw4tyal4OTI2RoUVXTFWPTpu4YqPE1aAx07sabtTwRjrpFTIBBJ15GIertS2SH5KmVzaEUgHSGn8qsFl5urmhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DauG6lXE; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DauG6lXE"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67011a751d2so142864a12.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 00:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775806296; x=1776411096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3/xbbG4SZjH2WvQ1mzO3ILWOaX1Zj4QauzsBGBMWwM=;
        b=DauG6lXEd1dnITlocJJMBxJDrD/FvfCCloYH/BYjkueBTcEfCfcfgKq3fkay3DXj39
         OAgq/faN7MBCZez3nuruR8/Eqi1ze65Gi3W3xE1a2eZpUy5iJpty+8Lbb2UjOKHqeE8q
         pIZJOGM6pQkYgj/fk5VU6lVf+atjqpRMv5R73sxpA4sUBQf/u12YXnDJIGc4oYyDT5T2
         uTt2kAjhGlUU0aqMu2tzorttY6d6en7+N2AHsNedAGAq8mImkBX2Q7gi8vOr9NMwKoKl
         blf6geIurHKK89irbHuF+W9IBR7NkzUkfYwBCzE44RQapIcM02TsN147WUu0PrPKjpVZ
         dlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806296; x=1776411096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h3/xbbG4SZjH2WvQ1mzO3ILWOaX1Zj4QauzsBGBMWwM=;
        b=JvQe5O/mXC0kPMbEVIJ3qm3qXj+dooIGJXCmmvWMdnCycJ0qwzCMr40nNzbdfeygu/
         V8dJU+ZVmKCKbNDq/8DX2qror4dS8wP3sfxS6RC+veVffKStDZ3rclKS9z9g+IzmFTK4
         kp79Yjm0WsPHnLIZGkr2cRDdf1ApBWUF/ie11nKIkBoQOy32YcoRrjT0YdrRHZiByvYH
         NdE1MdPP76S/WzFx/lYT+ExT+LYjowpJwfguHliuBEuPXg/wde6vmtIVEYkDhMdh7zil
         2n5MNrhlAkp0rb860IaC4m7WDU2XDhRqjDxfq2ugdGf7Yjd0e0a+tJT0UQRBeBZpf10i
         ZMzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjkqeaqP9Zu3JbHx68FVKL+me9qZyqPyCRiJQCodVGN+fFEEc4vvR7K7dRlLdIvQcXSvGa2ycdqVtu@vger.kernel.org
X-Gm-Message-State: AOJu0YzPHNmcqB2FpJRuZHGT0yJtxPrHHLWBubRkyDi0esoB9Pe1pFBj
	M6dfK67NogrOO/J269K1b6Hs+vwVR0SyNzTBWhGK5yFO5euzgw6/PXie/1/QuseAioMJyQPg0Da
	YoOmneUc=
X-Gm-Gg: AeBDiesCJmx2c9g4PdRwJ5TmYqaSj2PquAYwV/5TR3P54omo3rVeJSFJzsEYW3owUik
	6RicbwHZeKDfBtlOCWZpmP9Djnnxr1eQrR4sjXZoWy2FYBAh9SSSv23Tv5M+C+e0bCBUUKrCIJU
	CLiv3IQrdjKV+L1gkh5d1DVFMi6FVMhdQMv//7K1xkG3l+FooqIk/iadaJZtsVJbfMfoq8wr4G/
	i47CfTlEGZZFEZPzf+KUTbUiW4j+b8KoOxxi1jTWUs09M1LF4C4ZNBFYDNavuIPf12VG0fgvQhq
	y8cfnB5HMKT2xGaLa5AwSeIbGXhvX91YC/57SmPqulMs7VfNtShhSzjW8rIoXyBgIkBzpJXPj5o
	X72AakDTU69x19ta8LpEi3Y8jm6TB8Hp8iSbDX777V/RJUIEo4vElUthNyJeVHr0u2Sd5GuxLpJ
	jV8gZTcNHzGU2HBlGrdqnzjFyBkPDcJVEjNVKAX/jHO5Q3smF8lLYOJE5mRiqwCuAVG4hrPIzLp
	NBmvg==
X-Received: by 2002:a05:6402:4250:10b0:66f:8fbd:cc45 with SMTP id 4fb4d7f45d1cf-6707aa3f0b3mr689165a12.22.1775806295719;
        Fri, 10 Apr 2026 00:31:35 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670706252f3sm365513a12.18.2026.04.10.00.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:31:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Apr 2026 09:31:07 +0200
Subject: [PATCH v3 2/2] arm64: dts: qcom: milos: Add IMEM node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-milos-imem-v3-2-d215385fa5ab@fairphone.com>
References: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
In-Reply-To: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806292; l=1142;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Yuyp8/DcNzTxLCLZ/KgPEbXxPMI+WxTMHBAv85H+9yQ=;
 b=anuJUyoSQASzl44t4/DE5U2gzQoc25PFfbPsVXMRc+IlvfGKqC2m2B55S5K15oo0ecofEkH9d
 KIKIZ/5DRMxDjafRrzNqw7pqGNE/AZ2IAA7sKYFJpnBZ0jOMN68GS5q
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the IMEM found on Milos, which contains pil-reloc-info
and the modem tables for IPA, among others.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..a8536a873c69 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2289,6 +2289,26 @@ scl-pins {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,milos-imem", "mmio-sram";
+			reg = <0x0 0x14680000 0x0 0x2c000>;
+			ranges = <0x0 0x0 0x14680000 0x2c000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-reloc-sram@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+
+			ipa_modem_tables: modem-tables-sram@3000 {
+				reg = <0x3000 0x2000>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,milos-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;

-- 
2.53.0

