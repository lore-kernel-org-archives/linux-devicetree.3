Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750063AB272
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809032; cv=none; b=RV0BJ0mXjjf8J3pHE6Wc+q3S0JhUwK2pisz0SZDNYuyWaWhsL1PY7mxCuos8OV9Yl2U39RngzLrNEI/Ut9cfqUiXkZAw2H64izRHeB2ob+TDXAl2IXJwLEGoSW8poiKQHxyoW989CfgSbgSoohyQLLCa2ksHWPJ81AfCjzu06D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809032; c=relaxed/simple;
	bh=ZWAwfG2XpfdLjaNvjdSryOsAf2k7DtBPb8gqj1pmol8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7w0HAMYYPIv5ju+LfKuhG0ZmCftia35v9P1YidxZn/Qp/qX9ier7GdQSAUjZFuA22dWkAKeb8f1K4Is6wFIZrvQE/9As22VtVRs8XIu0yX4Ztg8e+3+wkxiQeo8bawmW+GxsFFlzeoM8QsrybZO2XeDRrLDl5k2yWSmYPY6eYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Khm1Bwjj; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Khm1Bwjj"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67011a751d2so204718a12.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 01:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775809030; x=1776413830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jfAis8xEuy3S6/A9q6uSPPvDO/GKDEdIvBPSdbvLIY=;
        b=Khm1BwjjBY98bw7AtfiXvylnp2bWoHU4oHJkUvuIzezdXxYH16m6pUoPbmk1CWb/1U
         JvjOfPT8gL6uvwoeo42RIIvvgfMNtjjaJicPEHaZsORAYeIzJSjuzSm/h9yF2S5L5n3q
         7VHFvNauxgj/AXJf/uqgDXV/HBDNNtps6sVvJAbjkmDORO5OErXlCcVjfBR9rvhipJML
         rBUx3FShoJ3UC7VvmZnxx9jVepDu8FPBve7UbbQIVHvNuVaqFwzPRVxLkncrNg5UHSjc
         ycuhNjff9TTWM/95zou7oWxShnFqT4u9azy0B9YtZWKII3mV6jXwIeeGnhBq8VCI6+/6
         oaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775809030; x=1776413830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9jfAis8xEuy3S6/A9q6uSPPvDO/GKDEdIvBPSdbvLIY=;
        b=I+754z7RUR9jQSxBn6OSNClmHMt2iwYynuV4t1OXmZyNm/Wj43RJCVA4in9YhsEeJ1
         VYuQCVpWPZ74gRonAJ3JoF8/Dzbuk3ZyNYs0SzeR6wce8qfMgOnVqV1mKpR2ihnnjoYz
         NDTyBvCbbOaRDk9zX/SJUHpM7VtEa6gDDfZVJ2ua47wBuMnZ4KjFQLyR7N6rfcdda6Us
         ZyM5e/I8PU/mcjc8VY3pbHlK7anGyBbDVXNziq7Tbw3Ga5KYLCtxd3kQrkcfAB+bFFaF
         Qo1IANRJYEPwOf9Re6fx1h+fpTuZWCNxQpQLaVJ6PgS6YavCkvNPpsb+wJe0o/GNrR9I
         lY2w==
X-Forwarded-Encrypted: i=1; AJvYcCUYpyZTAvqYW9v58K/vo9HXx1gEJQgQniDn+RaEFAlfiy7kd3tl5jD7JxhDoq+SgrmLgej2vcWImnGi@vger.kernel.org
X-Gm-Message-State: AOJu0YzIX8JVwgkzTqZOocZ5UeyKmCOKMbYv/HOs4i971lCrn2ccCMZr
	DOVML7dgK5sEQeopd43IiNnud53kajE1L79TY9x84cnTEUlGs3lesPIeXSIiwuMrR8k=
X-Gm-Gg: AeBDiesSI2nFOc7LajY2qcu+rOUxqcaH1C6lXBZV+w0vdbM1/DeTqn0DPSm3t4o+HlS
	yhhJFJ26E8Mokr5Sok5r/gEO03Q8fy2K5PAumzUWAPjvLKQUOdT/igxT3jt2bwVQcLWFl/AaD8d
	/kB//0p6C6CNZOWU9lxa+V+f+Hm/cg2ta3DYpKNN9nK+66AAle54KeXfJ/NEEGKixq5ldfNaPk6
	pb/qbHavhfNGGyWJsxesAIAluTyfsBb3aCSfD+/TTXAhRyxwsQDHP/sr2ynpfIPF1bOYtJrEPNa
	uRg2zYgpOJSGRAAsAVJMf70YjcnEVaFM81ChRlNVJuXUbPg7pOa7u/zQMoo97atjGCKSErBJTqr
	l++BGu6rfkuPr3ASff7sWj3PpaONUWyx1c0lcu6wExKVvuSryAfoFJUzjYg8F8WxAb39ain5SOt
	VwKIGXEk15VwtVaYr06ZdeO5QaZ2VbGpBOecgPo1RdaFMxU2C4z2F9UDSDpOvmjb2AINSBF/ahM
	sInjQ==
X-Received: by 2002:a17:906:7947:b0:b93:51df:dd23 with SMTP id a640c23a62f3a-b9d7260deb7mr144752666b.16.1775809029729;
        Fri, 10 Apr 2026 01:17:09 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c7c81sm58488466b.43.2026.04.10.01.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:17:09 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Apr 2026 10:17:01 +0200
Subject: [PATCH v2 1/2] arm64: dts: qcom: milos: Add IPA node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-milos-ipa-v2-1-c699b6b8cf27@fairphone.com>
References: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
In-Reply-To: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775809026; l=2095;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZWAwfG2XpfdLjaNvjdSryOsAf2k7DtBPb8gqj1pmol8=;
 b=2F3uQtPsmuW6aLuY95NW9p4XavfYQkw2Y/tAn/kVBh4PvE+t1QufBsg3D8AkyGaO4imBU7cR/
 0K3Uz4rqUaBADqvZcAcTkOA/s4ZZWEhUUESH174ExG66JLXRjczONwW
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the description of the IPA block in the Milos SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index a8536a873c69..9ef103d0e00c 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1599,6 +1599,50 @@ adreno_smmu: iommu@3da0000 {
 			dma-coherent;
 		};
 
+		ipa: ipa@3f40000 {
+			compatible = "qcom,milos-ipa";
+
+			reg = <0x0 0x03f40000 0x0 0x10000>,
+			      <0x0 0x03f50000 0x0 0x5000>,
+			      <0x0 0x03e04000 0x0 0xfc000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING 0>,
+					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&smp2p_ipa_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_ipa_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects = <&aggre2_noc MASTER_IPA QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_main SLAVE_IPA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "memory",
+					     "config";
+
+			iommus = <&apps_smmu 0x4a0 0x0>,
+				 <&apps_smmu 0x4a2 0x0>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_ipa_out 0>,
+					   <&smp2p_ipa_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+
+			sram = <&ipa_modem_tables>;
+
+			status = "disabled";
+		};
+
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,milos-mpss-pas";
 			reg = <0x0 0x04080000 0x0 0x10000>;

-- 
2.53.0

