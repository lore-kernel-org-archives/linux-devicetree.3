Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7730F4DB559
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195434; cv=none; b=AofMZgNrGy/6UWTx/zT7RKI6I6ZP/B48K3VYvUUoW0j8FA4TxbUCzrp42PNsF2enOGsptB9unzDycVFrBUhcV0NXp4ELJnngfSYOQfMox71x4WBG6/sy1iKVA9cC4/vJ2xwRkjyyZ9DPtNFk5KQ1brpa2I9EngiKky9/G7pPn9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195434; c=relaxed/simple;
	bh=XUJDd4xUHVWu57IdXVomBU+JbtBGQJowIYaHzRYn3x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uPmCPw5/YYeRJVq9qHKLTeV8W8zH4IrWGiBIPFu7TMWvICFg/SEqK+4ONDhpRKukTiAGv26v+a508ZWwWcLjALOHUKQv2AY6rwActGknbH+kwK8WP5XGiH2B6TRlTcHabNYI8T7WAYcjD8gCVmcqcyKX9qrQmwUa9vzKOUJDT6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQRVbMxl; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQRVbMxl"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c827313dac0so1947388a12.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779195433; x=1779800233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jwCfEHJNxVKEsC2iyhku54hBK/Iu9IeFsnGfdfRF2M=;
        b=LQRVbMxlvP91Cvne5OezB2607R3ROk65uhYknlNMpcF1aaCpkLx9aR8VPbc/3aDJkh
         qaRMU03S0u+/S2dHvp8q8uTTiNDLTbufNCPCkSLmwI+UpBiJXI3icZqXsZmIk//+E3tX
         YVE3jPLCL/g0qPw8d4S+gvq+AKKULRiAOqMio54eTznHYQcj4evxa9vnDjwx2uIlq4Im
         XVBCRqGYMXOwPhbue0YWojzXGceVy7BmpUBNNNYkn6zhiSaNdll3zPvhGE/8lwIkDX9M
         6xuNGZXV9agHNnwZRB2LRezPUtGaYXL2YvbH39uvfiS1yq/Ag650G/sXJdQWU8jFI9U4
         +E3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779195433; x=1779800233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4jwCfEHJNxVKEsC2iyhku54hBK/Iu9IeFsnGfdfRF2M=;
        b=Yw1prkRJ6l6SY4vjljFNW1MS1WTo33lg254+h4zCDUU9qPZHe1aFGpN40MbI7PElY5
         8F/Y6Lax4FpUx5HILuugVCD2TOJdAgyxwjl0BNmxXwU0FhuY6hZlZO7wk6sO0SOBoWh8
         k+iGRhYRvSf8wQuSJ7Qo7hBwwk+//lNaQf0lu/vzsqcqcJBb7E+1aHWX0B3YXlvvED6O
         mllpyP3p5/m08HGkQx/5Zv6yqV9zV+u5zw5PcNrHsJDZ1ca2ZYhweR+cQEgtWkKeZ7fw
         jjYK9pjCU0uNzjZsgEYJaKiwPMkz2zVEfLJ7sBq7eLYc3t1zYqXaE0jJOmfUllyVCnfg
         sKSQ==
X-Forwarded-Encrypted: i=1; AFNElJ80hUJCBfu+M3DNygCTT4W/zc6yaHyqkIINDXIxCE7RZeBE80bqqjsz/nmL5xBxZYLh28sE1TS34BVX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Fk6OGXVdt3jZ20RHs5KG0NzUA7quFhMKzc/ZBKN+26aqAH1P
	d99YO1q31++/6jGzaKQTypRpoEcrVAdbg1fwrTzkwQgLpOwACNMavaVa
X-Gm-Gg: Acq92OF2kikKweC216C9ldRJ/JVl5uugnRY2new79WxiOfCPuEd2K2DwpCq2caErp6T
	AGzV/BGK5jCCICe1eUF9GF4Rr6o/VanfR5sLznIuUiIaHDriQVDB8BTgx1XePOD5W0GkIBJts+a
	x3a2Fy4HuX0SErkAaOoqZ7ezYgedem79rc/NrC0DDu5pp0gJNemIv+c4/z+UgEg7CJB9H7ZKE1n
	Ip94EY/gfQ5t1g5rM+PeMJaj1pZhQolPTGa2WoWI4K//53iKS+fHPu4HjtezI/H9hmshe213Lx3
	C9hrrR690ojEgRWAqFXQKoMtrnIcILCNQ223JH0O2h/OZyUODdHmmWcOKItAjeEPqV8lDluuSR1
	d257/nq0kG7Uirw4BbxSVbfnsF2xxFRnRuoMDkN8SuKRWnWZnCNDJBGBjnf7pc56e99JMPvneID
	Bd7WZjR/38svunFMlnl6FWATts50KdsnN3b3qatcI7Rvae0uPiHz21TCf1xA==
X-Received: by 2002:a17:903:37c6:b0:2be:1eb1:eaf3 with SMTP id d9443c01a7336-2be1eb1ebf1mr47575795ad.11.1779195432731;
        Tue, 19 May 2026 05:57:12 -0700 (PDT)
Received: from localhost.localdomain ([2402:a00:163:2ce9:6421:6644:4454:28e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d2360e8sm194025965ad.82.2026.05.19.05.57.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 19 May 2026 05:57:12 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add prefix for Vicharak
Date: Tue, 19 May 2026 18:26:53 +0530
Message-ID: <20260519125655.23796-2-blfizzyy@gmail.com>
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

Vicharak develops computing platforms and manufactures single-board
computers, including FPGA-integrated SBCs. Add a vendor prefix for
them.

Link: https://vicharak.in/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..1948356337b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1767,6 +1767,8 @@ patternProperties:
     description: VIA Technologies, Inc.
   "^vialab,.*":
     description: VIA Labs, Inc.
+  "^vicharak,.*":
+    description: Vicharak Computers Pvt. Ltd.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.50.1 (Apple Git-155)

