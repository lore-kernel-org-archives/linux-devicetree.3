Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792838053;
	b=Ua39IOfVpEakxuzAOiaLewmm/nAKDZJojU9W7EtVEVdeOksFbIajbepmVn42vOUieyUH
	 ek5QfKff1sSmq2bJwgJi4mZNFCurBWZxylqcvsNxcNaRHzFN2BqKaksIyBPdaqo+VjUAT
	 LZrHtXws5A7fCbeQNHp5TmVSPlYwkaFnAfeBA63ZSH/wjzpm8ZyOBJB+qWoF06qiTN7Wu
	 1KEU7Pbl8c6JBRjZYFY9KiY05a2UwjuniFY7kqgjAFXNEzMgO8jRJE6yY8PMdFSn1TltV
	 wrDgkBqty8MstnfvWy90rjeVYgHMY5pBwfwN/t9ZzrWOVZWyoNB4IViD6NUZJjSVt/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hCXXvkDREgXehAsGvMm5K0+I2Qb1ZrSjqYAiJ+UTLTc=;
	b=qwHK/GcdAS7sSRkj5PbnRfCI2B5NG/sKgp3YIc54K4cuyC+ptmyfk780Ei3xle8g16+9
	 +Zh+pCjaPztIZ/8/td2iT9TsMl+ikX9JZ3Olpt92IP2PHjHUADHOdLdHSHyo4dvX2hYfN
	 Qpp9Oekyb6pZJGbGEa4Jnrfur+OoKv36nM43YZ5C1Cid0sCXbRLAbsWXzXpVdRYdOyQPg
	 HNhGvJvkkYDfkvbgS+kQ9tTelI5h0z2QbFsWLgyeR9XzjWFitNJDrcLiEiV3uZ7LSRGw8
	 l6sBnmH01OWPCgRrjRg7TJ57v7EWl5orEv1EwrvYXf6asTCAAI6jEE1JxFETlEACr8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YKgowXyL;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E14606A31B
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 10:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28E14606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YKgowXyL
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b060ec084so1005286f8f.0
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 03:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792838051; x=1793442851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hCXXvkDREgXehAsGvMm5K0+I2Qb1ZrSjqYAiJ+UTLTc=;
        b=YKgowXyLWBwrg7I++LDP8W180Q8ZiqniVMWkvWW4/5iaBMr2iDr91+cTkh1b3/m4Sv
         Lea1ql+KOC7EtGE/uJDarJSmpxelzCuHTBIVoce3HLGWesCapXCXBPK9wSsP4E9oE/KW
         um9D8prowuOKuB8EHFlLI02pStgKNsLQlt8oLKhxZaLgwHA23puRZtrvnWuj4ryDGqBW
         /K7w/9mWlK8LlfeKJwraHbK5ByzlQAUDD8SUCv0eVS0kEIfuyUEm3uF1LnCMQ7em7eJM
         vYoWLjhE3IDHpIyjKzsBeLYQawgqgrYl48ympnOHRm4P5/xSLaN4WpJWZpdvcR04WiXf
         8VOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792838051; x=1793442851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCXXvkDREgXehAsGvMm5K0+I2Qb1ZrSjqYAiJ+UTLTc=;
        b=ggxC6bvmBNNzl/k4YcaN1ebG9QpECROzTaAXThaK12N8ueZ3dU917QosIz9jGv6DPq
         g1RZIIJcqLG9nFawxTDumoKMCje7KTiMoXQiOiJZfF2He2knHTlHwTGzTvovF8m/0Bt6
         d7CkHCCrPrawu6nA3s72+bvaofBEwNsMh3TqlaVsViKe4Lw9SCwS3RQe/TxNx+vcUKen
         Rwg5gMvzARD/sIzLg9lqQd0/TQ6u1R8r6pwb/KzAm/VkNEMCfJj5LrRsVQi4JJI5garU
         CXg8QXdKbzOQ6hpufnSkaF8ZjWIQt+vd/cDImtMKlMVfER8ikYhy1+9OMRq3OmU4axlZ
         7cYA==
X-Forwarded-Encrypted: i=1; AKwUvBwJ5w/4sA0INj5LaMeGWL1I243JdMyNbOg0Sla7lBWgd9GGuFHCk3961YtWyOUAdVqeBfu5hTZrvxdc@vger.kernel.org
X-Gm-Message-State: AFq9FYKJWULKJSynjNWR1LR7muHnj8VSO3bkD445bwRvHI7f9L6v9tS8
	cvtNcCe+J1hBtiKgmd7zDucVcbhqsG/PEoHBos7qANWEDdxsk3/klN4Y
X-Gm-Gg: AYBFou2zsTliMqjfn/bYbQ1V051SZ286YHs8i8Re//0u1eIm1KLx4xH5xPixA24+3FP
	obtCtoIY8Q30BaDVHXTqf4UAjBfdaubOpTSnXCVmCUx8zb49IDYRx02x1ozK0xQL+Xf0wfGnc2r
	fIO/Qv9R7bqU/xixmknJ/1GOS6KjZCsJxv9FXJkaKDn78eu+BGq9yx7t+2sZi4neBWNhEMujZ4w
	xgmX203l51MYlsjm3Go1uomK9p2KSfrtUimIFQJ5p3pprAWF8gArbKGHLD8At7X6hVOODWUtNP1
	UvM1LGL4731of17N/B4d9HKhiXbWKcgjX6c0NILNDAj1sJ+fQ2EyfMjLwHGCRYocJefPH6H4BSM
	efzBNm1PY+MP1ipAcNC3MNOKKrhdXEa//U1e2Ru+d3wgxkPNAuFR2kHxzGWBSMnJ+3S7KPG2G/H
	GkgB/gkFwCpID80RyxWFvdHsDxKOf7mC54KRCJ0OLB1VKt2/ggBrvKvEUbmaVLIMr2mzDDBvSwW
	u8FY3wahjkrFminrwT5PGSgpfhExvYv5BCQDEgnSOrpFaqkO+6bJ9eezzMlzApBQexvlrkqfNn3
	l4jRkEVsNPUDYul+eySCaG9YEWx514htljXbCU55jjUO64Q7aLzGUPT3Ph4X27AbF67AydXPm38
	5uM41WuM=
X-Received: by 2002:a05:6000:2312:b0:48e:e98:8b64 with SMTP id ffacd0b85a97d-48e3eb8b45bmr2346024f8f.19.1792838051352;
        Sat, 24 Oct 2026 03:34:11 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-024.globalnet.hr. [213.149.37.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm3544825f8f.39.2026.10.24.03.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:34:10 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH 1/2] dt-bindings: clocks: qcom,gcc-ipq8074: allow CMN PLL bias clocks
Date: Sat, 24 Oct 2026 12:33:09 +0200
Message-ID: <20261024103401.761125-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CMN PLL in IPQ8074 provides 2 fixed clocks to the GCC clock controller.
In order to describe this in DTS, allow passing them as the inputs to GCC.

This has a benefit that it avoids doing a global matching by name.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
index 00d7df75b3d6..d489c6332e6c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
@@ -29,6 +29,8 @@ properties:
       - description: sleep clock
       - description: Gen3 QMP PCIe PHY PIPE clock
       - description: Gen2 QMP PCIe PHY PIPE clock
+      - description: 300 MHz bias clock from CMN PLL
+      - description: 416.5 MHz NSS NoC bias clock from CMN PLL
 
   clock-names:
     items:
@@ -36,6 +38,8 @@ properties:
       - const: sleep_clk
       - const: pcie0_pipe
       - const: pcie1_pipe
+      - const: bias_pll_cc_clk
+      - const: bias_pll_nss_noc_clk
 
 required:
   - compatible
-- 
2.56.0

