Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5713A480DD4
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153297; cv=none; b=J6R0zPJ1xfsQp+uAT6lpB8ltODI33h8bTyvtqLj2UQgi/dBIi98wEvAcHblOIyrl7cV1REYmNyEjrScTFdrxkDLj7DpAlnZGQFlMm0p/bzhVuP7DnyQxTUvDSQgF2719l0azVRB7k6+PG57WtTQ9QXT0JqQxT0Qpu/spdQxEQMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153297; c=relaxed/simple;
	bh=u2Yu4YBYm2njILlYS8QED4Q5XuAaD+AtoFT/SlvHqq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxgbp670oGyJaBDh12HF+R4qBYgku0aof+ERnCb06GpQGMUiSv37AdSiQ14p023KHcyQRVVsk7nz7w2/ZbcbeOJcQJFf7KB77uFb6srmySTyWghvLWmZs4Yk01PVIXmiddWsn7kCAbnHOn3iBaL1agCf527Hyz1Oh9ZOzymFMfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f87GJ0F9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f87GJ0F9"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc61541f8cso110945ad.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787153295; x=1787758095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEFzlhBjAhuEe8xovPGxxPJuQ8Ojqn67sRBJbsAP39c=;
        b=f87GJ0F9CgoxS/V3fp0BO2vgvBXL4YUzhJqblmGRG/tFQrfZq6UuqdRPjAvE8LjnfL
         VmjYP+RKg28MJf+GTTls79ge2iPw6PJc++/RdyAb0LP3RZTPTXQVUYaD/PLNzJMVSzta
         UOwV08k4VtLwCi6kdAYRgWCPz1mzaHesFGtgHgeIV60IEC0lwX+Ojph2youlTf76kD4c
         aGlXAUWGmkeXECo85hcyohfDMWOjk6lIxhXs68L8Xbi4/LyaydoOJ7e0goIbMlFRGKoS
         NYsqyHeU4BNS7Q6iQXeCsoo/LtfTccg0KaH33zq6z6t7GLM2lnX506nXSSxVqMa5+t7M
         XHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153295; x=1787758095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEFzlhBjAhuEe8xovPGxxPJuQ8Ojqn67sRBJbsAP39c=;
        b=jP4T3db/QjK12ngo9EhYKuFDRm1xt45T4qq07AWt+cfaGHsZ0MhanQkCLB/Vapu6fZ
         9VfexKH2qc4vGXfkz52lPn9G1w8K0fX18r9FYBgdig5QdR4hBnm1otpx/Fx2oxUWJh+7
         aws5F9l84My/CE1bQYqMwqaKWzD+x+lGd+41yKByYNupAHpsJQ1CV9Ctuy4FF+ttaXbE
         5uX9fkmE0uJI6fCFdhKE3kF9N+NbBKuujd0bsqEryGP2reNSTVr3RpEjGD+5eiGInl9Z
         TGFisEcTMcFfJJROGGt3hWBdiCDh1f5vRnhU6FIP+EqUcpUluoxZBJwVa+rFzov8JoUO
         F5OA==
X-Forwarded-Encrypted: i=1; AHgh+RpOp2omx7c/KqDtiUkvLAIXSZSFQpWEVdiuPJUQFIqkV2Gt7JPza2+SgJXL8p0GaMRXh3x2g86e88j1@vger.kernel.org
X-Gm-Message-State: AFuF++lwmrviqhGhZFXc7B+vJ+XSTZ1LJTMgZgSlSfDV5E0fLJKy/cGp
	Ppq8E1iuxot7hZso8O/dUZmI0uUrOo+Dsdi0rnHQVSEGG9Gg8vw78W/a
X-Gm-Gg: AR+sD12FCSnpy5Rax6BlmC8zKjWvcH1G66Yb9z1xEFphGmfuIvuRs7PI6r0xyjZ0zol
	9aArqnZT9don1NPV4/bUClQxG7beGkGlzyk28MVsw9XwDEcdYgdwdno+szrRjaVgGpqI69+oyUT
	n98lvVpk3ag8rTHQSN1XjjH8N6ASvGCPMEM8va/hsBfWr+p4o9Ewyk0ORUOBu/EB1MlacdEz6w8
	gIw02Cw3ZUmBzo7402fc+6m62DE8IygItPvA57qdN0+rGpScEPjwIRigghtiq4RROno8u7C3YXa
	lC4KiEqmHsTaneLEZN7TZy7k79HM3VR30kJ6y48CupDLmLRoEe2TN9hcdvin+YhHPevOZq1dgEc
	s62Lo/UoPQuPX6pE3q40oUTLu91fWeYJlQ5WNrMA60KiM40Sj/lIddmF8cBgFUQWITdtliEeOF/
	qzPgz4QF2S8wdsf7rhwUWe9QieSl54UdH5AoaSFUi5nxPIJ6tbQOJ4PoumGx3GYp4BXbUXbRjph
	lbH6THRjWE=
X-Received: by 2002:a17:90b:4a83:b0:380:ce69:2669 with SMTP id 98e67ed59e1d1-3957f8f49c0mr6838442a91.9.1787153294591;
        Wed, 19 Aug 2026 08:28:14 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm8232838eec.24.2026.08.19.08.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:28:14 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
Date: Wed, 19 Aug 2026 15:25:41 +0000
Message-ID: <20260819152545.3934-13-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152545.3934-1-sreeshankar0910@gmail.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..2dc2c265c 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
-- 
2.43.0

