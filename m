Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222273CBE6F
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929216; cv=none; b=HXUTdVa2aMAaqxpsH9yRtcuO+2O/OLyU0D0W1QpI/Qzva9q7yx9L9zfTdm7R+VkNof/Y9dKaY0os9D22CjS2vcdu5fmKH4WsTP2QhgQz8aDQUolb85cDcGMbelog2N9a24AdjflWGcajA02Fb+7WbVsDpl9dHTZrpj311OqWdBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929216; c=relaxed/simple;
	bh=Qd0jDxwQNZbi1ul0ROIVUYj3DsQujXROy5T33O1q+w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fcoR/sgy7N2cvsSOn4T8Rvik3aoRycu9Jt5RwBp/PMO0bCUKhaRFs5wOHK01mocSQOxd3vZpMbrGi0F0p6NsKoM8nCX7zjJsNIGjD+jRedUX+XK0VJ/L0GvBZlqKEDahavmPrwdYbc/vbZYgjosR7SF3HV6zhYwJhW0LZGhDzwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZ+Bjsj9; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZ+Bjsj9"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-beb1bee8c16so574265366b.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929213; x=1781534013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiUCmAGCnrYS6f22hVVaVmaPrbP2Cs5yaWaXidbeTmc=;
        b=jZ+Bjsj909YxLR6cvqfX1ZVr4iehj0qjus4RhUiYwuxooxwE2e8M4uLxjCZqu2CTVh
         foJEzKjyPN04qO4UbY6S7EXs4uV/RurIwqR84GNlAmsOhjFNHyqqpcbZfD9g7RIRyh+P
         5lF7FUnQ/8Hlf6+mXPBExb+TmsXCO2+anCwGlnae8o0I3T/bIxwelfhj4+4zTOvV+7ZT
         rFbXsdehJiso5LgARdO4Z1w/q/jyCaMVkgc8HGhB+IDjTpjpjQMXT1mtsnlaf3egSsP3
         L50ln/ZmxWghe11HwXKe+zeyEjEhCTgyRDM3Bpin2OYA6DQdb/fj/MftO6/YNrJ+Fscf
         HTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929213; x=1781534013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oiUCmAGCnrYS6f22hVVaVmaPrbP2Cs5yaWaXidbeTmc=;
        b=rk1GRRhMk3tE3EuFEU604PXd7zeGPYLAa+llINH0grb03KPKKv6S9zBIK0rgs8tAwt
         d+7DF2Kunxla2ESgl+KVBS49Dt+CAZfb/Drl6YCG6oUFf2uhGle/iYZ5I5NWzkRttgl5
         CgP6zEMYH12Xf0DUz9X9Vg+545wlRMT02PuOWNFPDUVYoEip66/fu/HQnfgBh5IXZa6Q
         GGU389ZHEkuhCbsPMN4PNFe+uQC9j1KhlWeqZkLlWvuDwAkHN4LoMsOwKo0JFWTxXbwp
         p7iQ2QSt6yz9rjFXuoifBbTqt7r9IShmvl0hO16dd+b8A/ApFkxjQ2xlsPH507tB3RQe
         O+bw==
X-Gm-Message-State: AOJu0YxtKh8abBWXXfDUxZpVnka9N2xmh6zUTeAi8hptDXRMfzlJsTjd
	k0aXPUEnqXm2yOsvnQEwfiRQYGq9lg/PmwJWNO1J6VVcPdl2DA9gJKNnQ8R+77FJ
X-Gm-Gg: Acq92OG0ROU5rgY6MCcu4accS8Xxu0HJYTD1HJea+EXQBOinIuY2eX4/CZmuamnHdCe
	196AEdIjJA503K7Ui/h3pZYg00JMtGnCVmgDg6zMcnGqOtynJVUYJgMCYJPGI+KutoN+fiFJCAS
	kFI0laj4sF9b0fVQfX4IN1V5zO7n3VqrkY6If+5C00sBxPdU/cUbEOM9y4HF/d8Hf3i6Q+xZLns
	ZKQRISS49NUdcFciOP6/SwvekFJUN5SYF6l2NjTafntGeRK5ZgQ4iqJzrUAzSYnFbLQAoGA/lAk
	8rDL3bZ36qS2BWb+S7uyzTGXf9sQi/7+9CjUNQa4rcpB+582Ac5nEpeX76g448AVc405vZUrhVD
	J0+RpYLvRWv0Rvkp27cvk6gS0NKyFg9RYEEyIYiQu1lmmCF8TKL72uYXPJf+ueSn/3PmLjJWr1Y
	kPPsA/YvfZzNwZ5D/DZ0eWc50UMA1vxoVqpDoDfhuvp9i5xuAXiX+mHba+d5IoAyAuH7E=
X-Received: by 2002:a17:907:7212:b0:bec:1632:ece8 with SMTP id a640c23a62f3a-bf3a840d953mr705250866b.15.1780929213175;
        Mon, 08 Jun 2026 07:33:33 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051d82a31sm897743666b.19.2026.06.08.07.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:33:32 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v9 1/2] dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
Date: Mon,  8 Jun 2026 16:33:28 +0200
Message-ID: <20260608143329.252033-2-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608143329.252033-1-zstaseg@gmail.com>
References: <20260608143329.252033-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xiaomi 12 Lite 5G (xiaomi,taoyao) is a smartphone based on the SM7325
SoC.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..575ca67c940a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1041,6 +1041,7 @@ properties:
       - items:
           - enum:
               - nothing,spacewar
+              - xiaomi,taoyao
           - const: qcom,sm7325
 
       - items:
-- 
2.53.0

