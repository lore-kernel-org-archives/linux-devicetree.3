Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3C93264E2
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 16:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786897135; cv=none; b=qE+sN3g0hC50Ju5xMCeXKLUkfnf7UsnVrbPIITDpPVTsZ8vfGL4CQOGQYNuBUsaXNoJmNgeJntoOvFBQ+5WxGdRPDraLgJnVxLOlPIhzO395Hio9xpLe4r9dQ1McJvQbChj6lDVeZPUE/cjtkY2Rh15EoNmaEHs6wmN2+guU7E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786897135; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0tI3aUo5fvcDvkJjyM3d095R43nDgAnKOZy0G0eIqycpg8gHKkt29elPYAm1Ux8goZQSGWo7KC4nmkCCqMnohmW9bdNJkOJG/3prgncgY3dKWp4yUijbzcO1hgbWRJwltyA1kMSCA9Ai+BsAspbQiDgYjruJm6IWRy3JfB+6Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImuhsS/M; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImuhsS/M"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbee846deecso2828644a12.1
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 09:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786897133; x=1787501933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=ImuhsS/Mwk/Yz1rLEMcy0Cp6IBxKn9BWUjFvjfUPrRYCrystTH9RguigxB/8Z5GYHi
         vRg8ao5g2okxXtNK7Fi3hpcHJ5mpT/0nBW9JRdBQALxG+Cx0mNbIzDUIB4U033gOJJj1
         PyDDerYtutuPTx0J3v/I8z6tyK8EsvGcU1/I/gdbr29M7v0u5OPbRmzH34+xAjY5NguW
         zH8CLbRMpsvl6rQ2xfoUK5c32HZ2R0EE7VNqDcurvbRaUtgvNDAq/RjJExk80Vh8lOKM
         4hX5moN4cM8ycu2z9525wVOe2NhCpm+V8PQjXyfTqR1xjAt0ws/oG+BQRXyu005yn6xR
         cXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786897133; x=1787501933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=VGJ7EIMHbGYHOQUUobOLdkmPNRfKs0MRUGUuSo8047diJ+coE8ZDyf2/ahTEZz4bf1
         9m77Cco1T8650wIMzn50P5eKz4cm3WRWNW4OErha36IE+qfqOmIqzS1qtG/dM25s83nF
         Il9oQAGlHWg0TyM6tuxlE36l0o04nMulZbYXmDxC1y8E2w+Mf1ThfF3TOus5W4uqhILC
         aybr7/gNfl5SLcNDyWArrmoynQ2nI1kyhtbgHS8aeAeeMWqWIzaPgNlJvuxBsS2tLMo4
         6OHxI2IGAlNbNIbhLF/4gfouPds445MteZ3wIFx+fZn/SD9+wM2SJSgAEqHLOn9ZTK+O
         NsSg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7dkrM8hjLeXVw/vPyJvz1g2p0KrZKzN9SexGFKuoF1of1aRXJ2hhdZsDyuatLyr0GdVpi3d11k+xf@vger.kernel.org
X-Gm-Message-State: AOJu0YyM9P+zivTKICDitEDWJr2x/htsIZxKJPzrA3t5hDd5IRzUCZHE
	ZDFtGDoccD4Dx5OCOmrvoFPbasmwjbMV21R+6oCth+fs4MNTfyvQkqZP
X-Gm-Gg: AR+sD12cKqf0BFh/v9xusaqUyBoAaKtdW2IKGR5jRxbOIt9Dm8gp1IZzkY45RKVdnnq
	c4IIa8UAaSMHZLcLYV3W8rti7ZWXhCG3KWgppmX4M3mr2khkgnMN3PGDA6Kg4YKo/i3d3MHgrhm
	roADTkyjNJtU4pgEcMvEYvE3pAXDADmAPR1i9BbNrntqR/R5Fgx5L9mDF4NtLYNhiTRTs8ZNBtl
	0QcSHNsjg58u7I48vVe7rxoEfDjr5+o0d3jc3U/2nU3QQduV6h8gvYNE7rkMEQc4dxgTWRktuQ8
	ZrmV/rJ8rvKKQtTYjrs8iFZJlHhvLXlmEZBfzBf3OlZJjyls+O869v7SQTiEcd8E3+2Iu6+I+Wa
	7aDf4udmJypMshSYo+4dLYmFkeot3iUPu+J5+y4AeO9pD+X1eoXT5IxuvnRXnxXXODRxlD/jMZI
	5v6ivXGhxjoeDQS26z7wEGtCOCp/zCtYMMruBLF/4pJ8We9PUHzz6Ir5p1R9mQTEqaFRjTpUKKF
	3wlzXwpMGHIPSgFoWuKse8=
X-Received: by 2002:a05:6a20:d52f:b0:3c3:859b:9178 with SMTP id adf61e73a8af0-3cc71d82711mr24321365637.34.1786897133174;
        Sun, 16 Aug 2026 09:18:53 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9679sm28969988eec.3.2026.08.16.09.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 09:18:52 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: lpieralisi@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 5/5] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Sun, 16 Aug 2026 16:18:08 +0000
Message-ID: <20260816161808.12419-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816161808.12419-1-sreeshankar0910@gmail.com>
References: <20260816161808.12419-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

