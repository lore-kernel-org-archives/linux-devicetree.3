Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F16241D202
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040549; cv=none; b=LfzWG9Zv3uyqvoBXivboDo1ZEHkeesbbxC4vFRPuop7tp/Y1TavjtVQsUCwRl8ngHQqNN2/codZHPlNgJkRP8Zu8yIyQmLegkdPamFE2QWC8qFDzs7UAHhrJ76KsxeNfMPV6C5wG0YKL5R358IoDpZbW5RJmQTRcIu4XC258vqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040549; c=relaxed/simple;
	bh=9lh6SnLl8V0+6EkqXPMHz3NbVXtbKUgYWv5JtTJxcyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3a4lWKX5jn854cRz0yO3W4ch7dxW7Jo4K8/d+/5vhjbrI1hjvLQobU1ED4oIVuOle+FPcaqUyMXi2+mQS7hW/QcaCkvdxaftE8x8/bY+Umlm3DfxZfslP2f+6DEwd5MHmJgLVNBTQUFn0NV1/2r0fdECa0DchMqPVY1UZ+OOEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3mAW38B; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3mAW38B"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cca0c5799eso40264125ad.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040548; x=1787645348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ovohQRp3uO6IS6H5dgbCzXT2FrwL8JP6NNpNzDBnNU=;
        b=h3mAW38BsYjZeHUgtpAJqG0AzgkNFFTZlrl7UcAxllu952+AKrEXOd8Th1rzGLwLJ1
         akMsfwOVGolyAcDf8RaLje6Vh25fXnKfg2MUktDBuSPz3Ia3YluhJmX2+DswYjZ2Yduu
         Y7PUULH98cIbQvs/b+UUzYQTKBpM/H27yepQsFG6aC+QAr6VukzY6ihHcq0Ezcgm0/N/
         +ipa7vsyULKl8v3EhpM4CtAoebJr5eSifAzxKsJfYU+4i304KMD+aXTLI8GBO6umqCwG
         0TLps4l2wj93rcM+82fp2FYYmemyLS+MZHKdCfjdWLYmC+g85YLZGrWhLWGbQ3jt65tJ
         kn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040548; x=1787645348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ovohQRp3uO6IS6H5dgbCzXT2FrwL8JP6NNpNzDBnNU=;
        b=Sr0EEAFr4tiACmgWK8mYHzWd8JQxdfwFfqBhxt1Tr03K/FqVAj0dhQ6QXBOwfP9z0h
         vi6kOFrtfC72qa+GYIFKYbKCsgAoycIPm99sjl60eedZCGp04tSUYbWR7LQ37+jmWX3U
         OoZtKB5SmC9GEWaGVCUqdBxJB0mtrSulHdqytpNo5IiuEK5mihg0UN+FFtdc/6pJi+fU
         tbCj/CLCVyD/yPFOxXsCKQc/KVnSLYWdXMNwy5yd/gRaqdZ1u68fdZk7IqrMiFST6nqO
         PA16ZaEEehSxeCTKXUh2fpqVsLn15LYSP0FA24usGnauZTYVk3YgGNj+9/NOYLm8pB6f
         /mUg==
X-Forwarded-Encrypted: i=1; AHgh+RoQE9el0gCPIy8K+RbT12IXVYNwZ+PYJ8z5tbBW4AIrxyz9Ur+hjAhrFSzMLA3PwXk9ZyrGoWUYtTDQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6OI/agQnuoriRc4RiM/NBWAeeBz3svYum2mtJ1Qafa/5W/vH1
	ksMLocVY0ST8z5LCK0Q2XEEn9NSYXx3krdf6/zvAmdrwHGBZS1F9zo26
X-Gm-Gg: AR+sD11mZITXjNzxAxZAwJhDSrnshmna3P3bFTx0ra2jPPUpbj1G775xbPudKa47ZG8
	NUWb8i6G/vlJ8HmEiLaRtfXsV8Be20WUE2hfFgtTXaYTNGt3nSbPHSZWY4Vc/0WaIhQsO/rCnMx
	esNjTmTVIke2eCoYOhuLJ/x5rDBQBYHYdGrDk0/retZVkjLuA9JnXdXdmMsNGHVO8SfSvcdNfXq
	w6l+sHDUJdl9Mll99Z5gQ1GwrQJ43C2rNUfOINolvTNyNiSzv0jeG/tVgXqz1kU3ysLLuXpcPzH
	OEeqjoW26mUjunpEsH1vW7xg9a0h04/cixDURR2sJgO0wNvUmnkIWhwpTD4Cobva06TuV9YjPBi
	I+8BajakWPRklLV3SHwQ7kwOG5RYGcezfg3sW4ETw/bSdhu1Uqhp4aZvGBK8TH3mIZGrXWtYwej
	LjCXTAVJJWkhZlz7ysEHMacyqcc7pX+Yw4z1bBS4VtWlmzSWIkCLFqVm4q4evSR9IN+nBGofp1a
	dQ+4kMIFPRnkW8JYHFNRQ==
X-Received: by 2002:a17:902:cf03:b0:2cf:ca89:499d with SMTP id d9443c01a7336-2d3b0b1f7a7mr335017295ad.7.1787040547743;
        Tue, 18 Aug 2026 01:09:07 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:09:07 -0700 (PDT)
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
Subject: [PATCH 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250
Date: Tue, 18 Aug 2026 08:07:47 +0000
Message-ID: <20260818080754.4362-6-sreeshankar0910@gmail.com>
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

Document RPMHCC bindings for clock rpmh driver on Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b3386..df9e37f90 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -38,6 +38,7 @@ properties:
       - qcom,sdx75-rpmh-clk
       - qcom,sm4450-rpmh-clk
       - qcom,sm6350-rpmh-clk
+      - qcom,sm7250-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
-- 
2.43.0

