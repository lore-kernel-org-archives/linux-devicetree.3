Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58CB47CA68
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254815; cv=none; b=CbngXGZTU3p+I/RPPqN0qKhzlDLjWUYlxIUg4z5Dt4HEj1oO4tLR2Nid8o+sdrZuov36b+0di2tJX3BWuMh0wzMnHTFP4Kn32LkxExHD6o+xBc7Do+8GwevVzB3S4ikzghPNr4IJGVyfIjQlB8T9WAiiPRdfU0MVHkJoQG//EpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254815; c=relaxed/simple;
	bh=6sYp6gwLdM8q2X0kWDCuDxQHrC8+z3UsdjNuoTgAQ4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBuJRXKSpti58Nkr+t9zQBmto05cLIlZvQRGL4r8bUhgzmLpvTNl3I26LN0fNiUTMZCTxIJDb46GTt8WwKwPLwg11jYw/hp1ALRVGuLaxCVqflRu09UP1ONirDqZLKKm5Hsn/3jYKJHmohi2LhGJJIxyw0587ECZApKJiQRYp/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHygRcta; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHygRcta"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38511175ad3so4643921a91.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 02:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254813; x=1788859613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=ZHygRctaRJM9pKRw+nbcSMGefPFY3imiqe0JEWjuiKrrg8Icfp/wIe0Cjx4RDsbaBP
         p0FofFX9y9KNCdLSSo/mCX8FqD7yp99OWSDCqp6ZCZyltbIZC2UeJmSx98WRQntb/dGY
         EI//esvub1DXMlwgcanmgiWp93BpjQtx7hlDZ0N577eWOqRNqoquCNiyy23JDThiLUL6
         dPPXZUyz08/VfIr1CzJctokv34hl8zSE+qJWIfdA25qcxxPVEj9SUlACQMgE/z/DRrY7
         Xnpt3+d81ZJE/9Bi+cVuZLoSmoL1dw9dKIN5a4p/86k4S4CZiLa93g6ufBDxHsJVg6H9
         iUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254813; x=1788859613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=Bvz3v8RiS+/HX01lTpd9tXF4wj0hFxF+J6whe35J6I2kZ05SJQofkqGJajXQm/di6G
         wHDBm8d397qBOiI0Bpy7yppAWckrrxp2/dTiSqQs3y0TMM24a32e9zE8Oc3oqarq2PGQ
         7m9Zp3K1YOfyIZ52mDqEmXDwY6puDe7/LX2bccfT735sOQz3c5A5YVgQXV5VCKVSH8r9
         45I41bbtl+vAwa/lqR9CP3a2HndmmD8Lrbcfh96WOayQWSTiiai5OVGHnmVSe5G3vOvy
         73v5jywLTkVQK2O+/5LSl3laFdXjnA5KY5u0peKCB81J4Jr16xrzhUG203PhkBuVpuLb
         9lfA==
X-Forwarded-Encrypted: i=1; AKwUvBypdEiDqZv0usruT6bgqqBrmVLCUDSKUsETT3+C1ZR41C1FR+gTMDyrd3io7awOxEHFNHVn/02tSC/u@vger.kernel.org
X-Gm-Message-State: AFuF++mqGMU1p2JgNgGnuadVegSisttV9aduNUzhTm1BGIbvSSctxkRm
	mzpd1IFZWNwLO0JJzI3P8YsCKMdKnhBPa8tioIGg9Wy7wteIEjryRDDa
X-Gm-Gg: AYBFou1I0Yu569TxBHk59nkSQsqCwe9NrGlseV1M69a+Ltkn5LIzCFzy4vyUHikffQ5
	3RHX9jmxqQCB25RA8ipmbOmJReGv7z1Db6CIduu0YddFlT/MU8TX/DZyX+NvFOH0htxHmAwuiSw
	KXiM6j5GXgUzo7OspPSmHopPkaLNHUh3fV7zRkbDJkaxdX6Oefp/mwUlvFOOQWu322mk/3SlJr6
	sJSesKr5b4R8LqDmmzfi5bEjys3Crrpfa43tXBfR7Tuy6A8PZShMZwWAAa6YeC8BEAUFfAZEIng
	POB1Py8p4T1gKTGaWN1+rDmQyeRrNSFKnwyGBTrRBkTtRzJahWFHEJfla7yNj+ncHla5AVj/15x
	zaCc3H94VPwYVJNVQYgcInSO2DdQZlWfs0BPme64yKbfHSA1Z0oqTqIrlBJPCo1iCsnLUHmgMFa
	13360+N9V7BQtcT9oEQ12o48t7me2uxuHI27rSSRimX55Q4ArRvEjGbDSLcCl60yryUJo2O2Zie
	/ACDVRKUJob
X-Received: by 2002:a17:90b:4ac9:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39907aff7acmr8439695a91.2.1788254813186;
        Tue, 01 Sep 2026 02:26:53 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:52 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 10/12] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Tue,  1 Sep 2026 09:24:45 +0000
Message-ID: <20260901092447.3028-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

