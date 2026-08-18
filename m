Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B38141D13B
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040594; cv=none; b=D8bG/1a0DH/XRo1lYu0e6+zMpqUmtLJw+u0PIpjkQd6pYh6ANVNMOIz1DRxluyzAK2eoL70HWyFacvc7l/NF/4mr9nmI4uqaCKtQ5f464ibUqkp3u7giMY/qTuZl5AKi0JKAnWNk98+MJDJjfVEOVbUCPBU4YVlXi5REtSazpyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040594; c=relaxed/simple;
	bh=R6Ql6qBhxv8nRfMWDl4ii2I8yaMmIwHS8a/lEb+KgZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Acis3r+sPkxRSK6xn8/TxsyXkBfQaX06fkUa4kr9ab2rkMlxi+WiK5p84oyj3lAM/5ztiyhU/jPodUVnwx5VbVMaNYRHm68B3LtvZhPye2BSiFv4G3JTX/CzdRSR+G1Ah2RV4+KJ2nSSudK7Zqb/Pkgh1RrI5YtzNCd+9KZR4Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqF0OkXv; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqF0OkXv"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9aea40d799so2475396a12.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040592; x=1787645392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xro5hLO6XYdeO9sCaq310qk5ul0LDKCYcbgwbKMsfxo=;
        b=RqF0OkXvtql/Sg6zAj8GbAFhLm80lL97I3T5Zd9Gkaf0mfeenzHtQ3F2IThpdlGxPl
         0AKNqagT6PBkqI33PmpWn9dZ88CJJ80rFrvNfUI9ea6DkbAXc/RgegrD7F6RnLathQm2
         QWe9fLQqD2mu3tepMuAMST+NP6rxhjLJTJnfkHLScU54zEKsWk78JkGpnTrWiA8327e2
         dICxHo6ivixJSLyu4BhM3Lio9DiX9VxqJeChKgq/nnF4J/5DO/+IIGJyXdKU3Fyn5Oa9
         TZeMwJMMxjicsK1ETNEoG3KGU47lNzGLAcpl79o4jf6U+51jlVUbPmWAyr6RbPTy0p/Y
         ptIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040592; x=1787645392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xro5hLO6XYdeO9sCaq310qk5ul0LDKCYcbgwbKMsfxo=;
        b=LVE9ijTv+TN7qQpJNdsoLL2XavWOiOo8CCtKdckeJECShTQDg6e9Dvi/3/1iZlaDra
         4QucFq3xwyfXoRv61KAH1wCI8HR4NyFGMhBwIVBPNa1FblNvMKK1iEqo2bTNU7sNRdM0
         tVvR+ha7w+ViMLdEHvXVFpVRWhwy3nFeDgjA+0chnwRmCFyH6Xhx2TynSDQIWk+47q0w
         TBcoXhm9YBv7aX16TeLu6sBeu1RrwTMF277nKHIZ/FenDbtFSc38I3rEvtKx9Hamw5ks
         2sNY9F+n1G9BgvXzZGR9IGYQIvEkR4OdwIVbOZRJg/CTHSImv2CiE+K1ZeSDsLXDWioD
         Kj0g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+rSF/mZNrw8jamIUqFqeHO8AELiVNc3duDDRU7rXcrpHbzaClkFJjAuKgELXXWZCQsoK4XUQrfs0v@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3WwZn5T2WCu1/1fp1E2xc5VSLCRqNWLLoi/X3qn+IHHZhygvB
	DZD3+nikq1RqCCENFnZ/1inN++H9yccboF5H56q5Dpp31VAf6poY57ps
X-Gm-Gg: AR+sD10PiaPOTSRprNCJx13zJpR9qDd1g/vd8a+Xtul9DShoobx3j+AS4rIGrkIOW4z
	xdukatK3RvOVOSS7haZX/x+qAXxn3wTRytAfwDiO6qMfcYcrzT/lITlobYzkvr/K264hpXmgV8p
	shf7Cg6BqDoGxszb7BFKizuuiHdpSDCkGz6pA++LHj3sX8uESxEiktVPrRp2sdFOzSz/4gxPSn+
	w15elHy3Ny6FCyeO6hun5twdcT6mG8X9Sx72+LlpmnT1RkYut/lOHL17rjR5xzlnBsT5xJFxB76
	7aoqDaXYq7MJylU7n3GbyiF2i9FefYnoPR6J9zXBUphcLQjbCNC2KveIHCHjxo34GlcdP8Yzvg4
	gjKirUTvjnYtWSgQnEEXfbhJWlyWyuJoDaipFgBRuOSrUMOoycmcy6CS02aOzSG1BMfgselcJgY
	qNTbXirBrjZPrn/Elb1j37HI+ijrnHDVd3xJF5AnF6EKbJdO+GfEgG8G65c/5mafrfgpYDOzBXJ
	lmPYBIFpAcjnFC5CqwyvA==
X-Received: by 2002:a05:6a20:9143:b0:3c3:76a8:c0f with SMTP id adf61e73a8af0-3cc7196e809mr31096183637.4.1787040591855;
        Tue, 18 Aug 2026 01:09:51 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:51 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 10/12] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Tue, 18 Aug 2026 08:07:52 +0000
Message-ID: <20260818080754.4362-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacb..7446a54eb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -72,6 +72,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

