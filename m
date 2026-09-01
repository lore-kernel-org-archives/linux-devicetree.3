Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3633D348C50
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245116; cv=none; b=ChC8VEAfU4SZKR9dFvdKyczlk/9NFgZH9uljmK7eqYjCRnNQZkFnNfHucTpBF8AkT+zxJXxoWVIh7ItR4j7MYItgVAaePG7NUjhsVO3Zn3VkHg5cbwWE255wa+1eNfFS5VXlToLcnIaEs+rl5IyqZ69FCTA/jQVmgQo9fBOrBC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245116; c=relaxed/simple;
	bh=ifqmFvQHebUZje8XaAAuBMN9RaGf9xFULb+csDNh1fU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F4h4WL9eWspKMgy3WqcUh5NfRXihE2J7y3P6kY3NCv/wBuX9SV8fgHeaockxCrbiQoItitmmqLpSg5zrZP1yHGAbjpdA65YSPuKaTcAzzENQJd1mqRyIru5pTOLUnANx1NcbliEa9UeOcT+Lm6v7jcY1VGkfLtoh2IHoV/KmJ9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFFG8HKv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFFG8HKv"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d71a50caa9so6790095ad.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788245114; x=1788849914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=GFFG8HKvpsRmln5VbeHUfJpZvtDvghuA+ojtTA8N4VJLFqHFbie/X5pRiUJ4DbK4fA
         xlJZAbeudTdeN27dYxfqXRkY06aIkltR9AcPbadIs2uqAZgnGhIfeN7slLyQkBdtAJSu
         Iyb0218BDQ8dehh4BPWhPGLWpLkjPIuUOJTDtLWcXBtKGpYr0kffTkZgyvrAOPgf7kbc
         UyzW9wNMqZTLVYfrO58HikiL4xJbv2JcBdLzj5+J7dnRMw3wFHGHIGuC2cNEqBhnBtat
         xR0RhONmM7zdQ/jT2UIhw9cvq2qK2XS0Vz+fpw9J98TtmJPg0oAJyrjXbcxtjBZb+npJ
         uJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245114; x=1788849914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=mRrJZ0pPWMm3nowIu4mgTOWgt710bkxjIYV49euxYeQtq1XZKps6k45uXbAl9MCl4f
         sraq95hZj+sL9AWBh0s58JqJdBY98iMr3qcAzhctfZZnq7JhaNmHjqQWFndyUBlycB3g
         qJKlWaWPG195z5HQY/mrE0DBhDaOkEoD6MaVQRAbwmQ7FwXm6qsK1qysMZqrcmoDi2ET
         ZmVgMae79I67F43ljIEJvqmiElRrCeJt6xmAl8nFemCgztfJmeyZFVIdRcbVRsCQbFel
         Q+xmtQgH+KFJP9pLm/QoPrsWbuhiOXUIIoNKQs33bduM0wp4nI4HvmpcW1qmKPZI9pN+
         gl9A==
X-Forwarded-Encrypted: i=1; AHgh+RrifY+fjQvCGek8xOly/unH6BRv1xQ/bXPQPB8PwTs1nXEJw7mkCnSB4ioBcKD3pHVfrUfokWEbI3nV@vger.kernel.org
X-Gm-Message-State: AFuF++lFc7eO14QaIwGYfjqq+fmZcmgc1sEC/vxb20Om3ZBFBAztPwML
	dI2V55cLOSO/d5WAWr2N8KEMxn7fk8jM6KD0mYkpZzf1KYN23NNF5uwq
X-Gm-Gg: AYBFou0I5Bv8zDWYkPFXJkVneo2hcvFuouyVp4RhC+3Ss70PCopuGlAZqYzmnwujzRY
	mKPEQkkJegSRWNbWLio9ID8Y95a30yLO7VJx144P7ttGHdrYq+114wMCTZx7TpXmoNAhwPcmMd1
	LNTVXZQK+fQPrC6n6ppx2vQ0w9yrqqJh3OEhxl7W6ITQt5giNlPdtH3YXr8uXtMgzLtoXgMBrt9
	Y3aBv4WjhGcIp5+F8Y9VCIJE45cRuzMMx3zQuIf9qX1l4uC9HTYM+PaEek8WdBE12AdVUz/Uwxc
	8I9HAyKCVgd4OkUysMWbPdWqrLu1+fabbnJYqRbqc+jmVto41DTOIwEdz5wxZD8PFGlXtNlipD/
	6HTTGrzo3IvfWouim6deGiinqbDdjjuw7rfIWmO+JkVAgsIJ09qYUjHyecpR5LZMOMxyRYg3+0g
	TYEs8Lot3MaHCDkYQC3aS3/EiTZSaq3dCClg9CByMQ8P+GOGCCDVqW1+sZM5gMpCOUH1ce+zcxH
	Osq+SbKe9LjFp/VyQFRlz0=
X-Received: by 2002:a17:903:1b44:b0:2d8:d4cc:5bb1 with SMTP id d9443c01a7336-2d8d4cc5db8mr338679535ad.17.1788245114494;
        Mon, 31 Aug 2026 23:45:14 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm37019784eec.27.2026.08.31.23.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:45:13 -0700 (PDT)
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
Subject: [PATCH v7 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Tue,  1 Sep 2026 06:43:50 +0000
Message-ID: <20260901064357.20055-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901064357.20055-1-sreeshankar0910@gmail.com>
References: <20260901064357.20055-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RPMHCC compatible for clock rpmh driver on Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5..45d3cc861 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,sdx75-rpmh-clk
           - qcom,sm4450-rpmh-clk
           - qcom,sm6350-rpmh-clk
+          - qcom,sm7250-rpmh-clk
           - qcom,sm8150-rpmh-clk
           - qcom,sm8250-rpmh-clk
           - qcom,sm8350-rpmh-clk
-- 
2.43.0

