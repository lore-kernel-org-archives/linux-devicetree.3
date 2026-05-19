Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBA34DD6C8
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195439; cv=none; b=QZvdIhHecs5EQU/TJm6hR9bZQ/uikMrEMcBKGP0hVH4ZbTEizYNmwDQ/J7kaleWEwL+CQA780nRcW47f/ZHHQ14nbMxr55rWdpxKb2FGyUnMch1cKQ5bR8X8j0izw746OFdFmlnDdRbpZfmpk2BuxgkCKbbnlo8PmDJB89/Zxys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195439; c=relaxed/simple;
	bh=mvbYsq6s7d7W1oouiNX7rgDJWbcpYrxcLw9VH/gGvVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBJDYUQGLNiVPFTSehyYaAR/8UDUVniYsCnZgiKXJpCbzGxcESUvYN+KlLepiD8RhMm1lQ/R+tgzBbuzZonRXSDe599m3WdpD/4cxtGcK5Uw7jEY3UySnhMeYBdOWWk1onruDcYRvH6hrPIu15+ORKKLRrHRBN2zovfi2bxWkYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asj50PiD; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asj50PiD"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c8025500cc7so2696777a12.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779195438; x=1779800238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pKNoUwm+VouMr3Z4tAY1A3s0+1K7EgEZOm34M+sxQY=;
        b=asj50PiDc+ubVpiM9b0J3rTS2FjsbdJsIVPLd4hGblIkjZeM7NruhLr3IYQEjYWrYF
         LOGZgvlRpVJS/2LQa5fm1qnf5oAg4MtFuudZNvUmEy1a08wxLV8MDcw2N9TamvFN2JPW
         IaRqwhcOAUSNTCiffCesX96U0H2+vCjbhoAOHLnK6C6xOIV7m+y5KNjbyqg2hxQmX5XU
         7iswVgvK2qqo3b0grdCzkd7L4CPCOAQC+FwRdkG2SH6v3RnaaImUr/rBiwQYFimFWm+B
         e5c4Xtx7bn+yg4k+XUG0WlZcrAYtQMckG5wmTPXrZrxIbLZpDLi5HCDxP1qwu71e8nd8
         ZGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779195438; x=1779800238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3pKNoUwm+VouMr3Z4tAY1A3s0+1K7EgEZOm34M+sxQY=;
        b=Ku0Z9luPj3UIeqPOATFwgHd8otzU+JxYH1857ziuzUGVKnq/AGN8vLRLQ1oizxIpfz
         VLJ0g1szuZwSEI8d+w0pFScdmNkgQPH6SBqQtSNsFKBQwgUqe+a76WAC0bZSpMdM/yfp
         cqAerar8GmaHuWv7T5zacP/lBcxUNDVlUTZ+5QKfIkEWNjw9JikeUjw8l4YPRzKPQCUf
         yut3Yp4jaXciXzX8YuHS28dr9XEDYhlPUgyDhPu07QQmP6ZBhnhh1j11Cfn+UF2raz9v
         G3Rytx9TbbRbsFk5MelwdS41WfcyIZl4MbHWHF+xv/We7Q/AYp/xV24hfU/kSpMtZ60A
         b9ng==
X-Forwarded-Encrypted: i=1; AFNElJ8yQhENSLlnLv7q/pCrtkF3xLRvKIEjskyAxZMzL6iwDIhySLRgRxTkOpl+0fKsryNNdogMYYn0lJzP@vger.kernel.org
X-Gm-Message-State: AOJu0YxcDzPZWydjCg2vOrlb70l6Q2j09kT0ZFIJTtX8Hu+MZtVo+7f6
	pXvaPo3xl5Ar2zPK+zSC2xPM0kcbiN/vS7TBGbotB7iFmfLACCysiZ6x
X-Gm-Gg: Acq92OEeIUh+NDElnXHFq5KYiSjY6oKc0l8GmrCZsMHH+J1lc7yExR25caP7d/J2+aL
	F3D136PyiGI0O9erzVwa9hxPPh0K6bgFMFaVBEudD1AF3aFFN6387HJWtRDbI6H7skwfqpXtCg4
	RgQESCG5jgVMpLdCQf75xT9FZR6UX4tmooRS2ktJ+KtbujZe0bIhVWDJNI39XaQQ/nqoqpZoeCG
	kG3OLmBEIgkgU622DwEol+c9xzAXJB1O4DNj53/TaaNpoSx3MJEOZU7HUnn+KTqD4JEXPF7S+54
	JRzdyYkJrtkZEGeONhIFpZ3y7/p4w0JAIvQSmHgpfISBBTSBXxVvjrOyyVmMnzFGCEU3W6joboP
	A7n+mNEL6WcYedhyI+UVTDc844k6hpKemodAAySH9aR6Ox5dKyX/vhbNzhgND6cUdKlwh2FmSh6
	MU2X+AHeBUF2g11+vSI6iK90EvbizGg3Ri99kzbdOlCX7WUJCZGE1aQ/xyBg==
X-Received: by 2002:a17:902:c412:b0:2bd:c2ec:eec9 with SMTP id d9443c01a7336-2bdc2ecef7dmr117382595ad.18.1779195438116;
        Tue, 19 May 2026 05:57:18 -0700 (PDT)
Received: from localhost.localdomain ([2402:a00:163:2ce9:6421:6644:4454:28e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d2360e8sm194025965ad.82.2026.05.19.05.57.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 19 May 2026 05:57:17 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: qcom: Add Vicharak Axon Mini
Date: Tue, 19 May 2026 18:26:54 +0530
Message-ID: <20260519125655.23796-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260519125655.23796-1-blfizzyy@gmail.com>
References: <20260519125655.23796-1-blfizzyy@gmail.com>
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

