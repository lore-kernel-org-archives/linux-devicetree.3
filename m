Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2DB42C516
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299990; cv=none; b=PNIWXU9eexrJOe1Rdn1xk+7bN6zHbfr15QUWroHLZbmsZpj0f88Hy9cGm0pBqh7NtPKdLIoPLF9uxtLjSM5nxn/Ji5dAYdYRxYGnnub7+5uOKBCUihOBXCfiH8mlq2+8rDZttP1tyeD53ONLm0ymMLx04Gr6ZNc7khvb2IkIbHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299990; c=relaxed/simple;
	bh=jKh+XPUoJmr7fIpNbx8/2EaPd/67MsZW4ebNDZ/8MPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQsBb87Q3c2Gq0WGpfm0ou7ATrA6U4l0hxZc0tcdl9AuhPh5pyOY1gsCfvtHyf1P/PCWJ9UlqC/Gc98W/otLkialwtLv+bQFsDMtO4X38Thk9RsmVG3GCh0eMNvV/Wa1ppa2XIuiqEDr8F+dJR5oWhXn2TZ6n9KYVNVoL8vDbms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cqh1raHy; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cqh1raHy"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso698797a91.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 01:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299988; x=1787904788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=Cqh1raHyb7craUkrjznD0U1qhmV6uN8A0WmbrgecTGldLn7BUeSB1R5WjrQgNKjoGE
         0sI8tbgGxNZJ3YdyriS8frQ7bB86xgOdg9jfbOHkHshVrb4IPKY7FjfPsrF2g7b4vDL+
         4u6nIBhFe68/0qccHY48Ilc9MfnQYnIUvPDKM0w5sJTnzjxtacMk6XPWNR7J0KGXwi02
         Q1T8ZP87jnn7ljKVwdSti5Sn81NCXZGdz7oDuvH6SijiWj7VJRezJ4xpWD+Y2eh2Sb76
         V0fhUQhsj10odn2u0YHVNcodl8Zaezu/ax9AJlUewonKDQBmwsRca9nR16YFilzXa9I0
         qncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299988; x=1787904788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQnqfdvjWzHpIFqKpmfnZN4AvVDc8IQ+C2JI25EK8GQ=;
        b=ffshYqzje814HsSGf7ls4vaauxpDDn1gYIHtekKc/Pq2qE/0Da1GUJ4i4QP+0eV/Lr
         ofQfNlsKaOPATlubfAx//YP+P6l5Bt6HNqz8ytmGc0byhMQTYb8/CdZrFjiES8vP8MeI
         5L2WXf7RoffdYhSEZa0fhty/I1qEl3k1O9coLE/cyLFHkqtbanulvIZe6Uou6oKCnEqf
         omImLHixUCghCICdNwnQ7+4D74CrhwOfbT480eWV7fxSdSb9x5Gaw+hnUVC+MfeZGT0A
         JZXSsAobiYQOnXfVGOBaJ8vPf6tcIAG2LXqAt7edJvyoXNuaVPo46mq61eG+nrGaOb2j
         q8Mw==
X-Forwarded-Encrypted: i=1; AHgh+RrRHwK/dDlctEWfYbVJUG6CSeb0r7isIOWL1u9BbCGh80aeYOQ0+SQPcjMDtTOthNHB3UxLoJpLJJTX@vger.kernel.org
X-Gm-Message-State: AFuF++kRjOnNZ4Fi/mzgTxMG4CguZh494jCDr6MwLeOxUQKA5fIE1JYl
	CtNaUcwqUgASckinUlNgdbz0d4egmtXnFr55UnYbZHs8ZG4U9by+vVJJ
X-Gm-Gg: AR+sD11GUXfrD0CBkk5wfp6QtKlaGnfvFf0HwLmsXygXYSduI2SDvGMwN5gqtdMU2zk
	suyOR48rE93gdp7eGEUanTY8j4B1dEQ2myW9cfqLeWDQ7zJe1bKkkv5Bgrqy0Un5g2cbMMllR6G
	mCUTk7rl69dC8AK9yvAGOBs7z2MJwU729LYDjBpoEEFLzAhFWdnmsrmeFo0PrUTlI8OoC8lDvQ7
	guR5Sb5EasMDjL7d2My2BI/g1nT0cblairqW0Gj8K8PvA8fwSHpokgNDEx1JVVR6bgSclswbYip
	ku0VDP3QnDvenU96USYQ+5MgVcqsw/L62dcI6YjY7tUYULEA1Ea1b7FL52/YuZNPnKlUvulvEmc
	CTxw+j0bTL85msII2MA8yU8fsmVlFrk4ZF13HnEMkChQX+RstKyFy9usQBpjjTJHCgdGZgwbovx
	eqcCS0ZkSm+JAJZeHLCgUgeqPo6pKUfMa3gbmIVNBu4C89wA3NN+D5hhYI85rwLEreCSOpV/BEO
	/OmmMJMJ/Bj
X-Received: by 2002:a17:90b:50c3:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-395c39e6433mr9171716a91.11.1787299987899;
        Fri, 21 Aug 2026 01:13:07 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:13:07 -0700 (PDT)
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
Subject: [PATCH v3 07/13] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Fri, 21 Aug 2026 08:11:19 +0000
Message-ID: <20260821081125.4522-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55..e08441915 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

