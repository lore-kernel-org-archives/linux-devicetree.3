Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C431380FFE
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 17:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779125461; cv=none; b=WByWf9k69VEe2mre0wNe5PaTRSUB5JT5EAGzzwZGwDwwsYv+Ankb/o52u4uKllO3eNaInhsctmLDLKDk3pberOMMrlpN8z2TzaA9OVZLfZJzD3eB62K1xyvKYr11bio56gvjfe3fOuKEx3vWqpNY87fWYFSubb7BPonWDTHWsEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779125461; c=relaxed/simple;
	bh=sWXGDROdLAAxc1znU3J1G6LN8LWLspEasEGN1GIDqlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j2GbarF383VgFcd8h4MUgZUDnGWDysy1C6gHxgm6ISr5sHPKKYLFSpRi9y47ZF+6NYr0ZminxsfbD1I3LZk9lQLe1Ff9KjH/rTp0UKKsY0+N8gKgmqxN0iWDb35dlhv/uWQA6yVZEKJwvAiA1VIY0CtiHVz/ScoiAco3+XWDbf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noNR+DU3; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noNR+DU3"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c7980c060cfso1100496a12.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779125459; x=1779730259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbKO98VWeQCsamIbLilIR4AFoxxZutdjJvppZiVALns=;
        b=noNR+DU30SWirYe9geS3sNIm1E/JG3FOt+0c0zJYf+SJqufbHO2QEeeaiXqiUZ2jIC
         Z3Z5VFG3oiKZtRS0b8GMyA0Ah3raYbxhdaApFHKTRI+ZCOwYIY5D8cuVX2JXa5ShUV3F
         jwN01WzJqY4x842Emp8ZJIepwIW1NALFaJJ1qYMD3dWCMJUvYWwCJbjqn24hbg5yAAwE
         LStz6+BbN2IdRB65KunwidcGuHhrVrmEeiTs3H461mL89uQFCiuW+kA6xb5U8J/coZjt
         thbtQxsW8HyHKYRhECXULxYJxvBe2LumCgI+becdKZlmX2HYdqng56J7n7TSe17O9ich
         yaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779125459; x=1779730259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbKO98VWeQCsamIbLilIR4AFoxxZutdjJvppZiVALns=;
        b=BkDPn9onKz9QvXciVQaN+TceGvMBxLMX06PErH3099/ReJClaeKtZnkVjdbVr/zmLR
         ZcucI7QcUQ5DgZ8MTqze3nEPsPMOZGe0g/JIOh/Zj5rBLsO7tcga8AL1aN8kFKiGFPC3
         1wpTeHv4YvadMAy79ThOxEMOr3a1cK7Orp+JM8EmWck+aNVuLbX8hKqNZZQXO9xYYuqY
         alMnCFUZ0ez6zB2zAfy8IArahPeBVef95Cq93UE8lFrzd0mV21R7W/p1WeplaAiUniur
         Cbb0+TzyND7fD8sHKFKixjZ+tZ3+OrEQzcNfWG+MAtwlYngPtbNie5sGgwu/Xk0YAJL9
         BZ+w==
X-Forwarded-Encrypted: i=1; AFNElJ9C3R+rZrsviJfSAUVlPP9Am/wWgnC6hadw24QMzjld2dDL8SG/MjhfST150GPiadcU6hPSW13EKh6J@vger.kernel.org
X-Gm-Message-State: AOJu0YzwO1+ZxNfhn7Di3Yuem//CFI47U1143Xb3K4yHmvHwMUZQsawQ
	flhQv70EsAm66L3AIUdY3labP+omHux6ipZ6gsjOj1frkZLVRSMClBF/
X-Gm-Gg: Acq92OEXMy3oHyvC6eXCSjLq6jbDGV6c2p5GT5KH/NRakOP87yU0ZfmDVuLrD2lJVQ5
	ayg863mupYoybhLg01M7vQqKEC67zooxzBA/jVNdhkjIEUhld/yIiyE6GxXWLcXjjMFZQHgAiBt
	0rU4o+1qZeFR5Yi2/3/oELf/y0Apjawa359Sclt1RzJ7cJCVBTBN+ghwximPxlgS19EYCIzAMIU
	YsoDWxwez+7h9SUi/iHreGdPDBVH6W1MmMjRcCIlOHPpsLsu5GxHVSQogkqYr5vDg0kQ+LSQvqi
	MZLJF4ZtEKaA6QzNOGbbhoPTczcZXIppZ9hhA8o1Mq+9UGulqRapt+q6gXi20/kDULKOXFUjduL
	JWquYks9qQlkmZIsnmPwAdQ1otj3YDGRu9WGnRqagsybK/ZivnOyzcswfgWpImSWksD+zLlfcNY
	3bM6+EMZ3eYnIvTlnAnHc1Xss7itQb0FUittIezha0GkO+uBjkS1IFAI/7Wr6WJv1vJ5MgBB2Xo
	dkH4vW6ZQ==
X-Received: by 2002:a05:6a20:2594:b0:3a8:9dd:75c6 with SMTP id adf61e73a8af0-3b22ecfb1e8mr18040124637.51.1779125459382;
        Mon, 18 May 2026 10:30:59 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:88b5:f305:5cbe:64f9:8c32:7cd8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb116860sm14118696a12.25.2026.05.18.10.30.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 10:30:58 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: arm: qcom: Add Vicharak Axon Mini
Date: Mon, 18 May 2026 23:00:38 +0530
Message-ID: <20260518173039.20592-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518110435.16262-1-blfizzyy@gmail.com>
References: <20260518110435.16262-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Vicharak Axon Mini is a single-board computer based on the
Qualcomm QCM6490 platform.

Add the top-level compatible string for this board.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..6924bfe7b949 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -361,6 +361,7 @@ properties:
               - radxa,dragon-q6a
               - shift,otter
               - thundercomm,rubikpi3
+              - vicharak,axon-mini
           - const: qcom,qcm6490
 
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
-- 
2.50.1 (Apple Git-155)

