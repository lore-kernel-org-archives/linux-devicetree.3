Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38813FDBFD
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294676; cv=none; b=VT/qoebjtYWVq+3urDpHR9i4qcBvJIxOu52Qz8o5KJuLVo0wDXYB+pyX9VYFqRHO+XK8kshapM0ymDO5UaURzY1YhHF8TpxqNbQLaoYCSRf1/l+49kJcQ1l0UPmZo/SaInNz8znmpExdssqz5HYdKahgUao7vVefiN3uCFmwT2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294676; c=relaxed/simple;
	bh=236unSeVwnwnwtnjaBsb30cBdIDCZYuX+cT8wVq+Nds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmqCur4apEWeIgNVzRUEUbs3C/ReuU2ZsmcSF1bXNP4CqK+l/CIPIPqFWgUFyjRvq9yUqH/llCFw9YPkdE0cSKXUW3QdyrwtTsmzEzJPqSist+VhRUC/1JloJEUeeFplFnzjodK/tLTzWCtgjYf0Gg2E1zqM3UkuWaisa08fGCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhasVj+3; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhasVj+3"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47de0093c42so3634647f8f.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784294673; x=1784899473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VsQ/KzpbmIPz/ijHmyGGKeW2JGVH1BkLtqfTcLEshA=;
        b=ZhasVj+3BJhuyVhJ1xyd8VPTe0MsyIqk/EWMosXu66gfQryQTlT3GfR56UnsGZRsdy
         xzTkSVUPaMBosLXIgPuyrLikyye1x6v6ma/FiN69h96FxLZalR1kbSs4qoObacKuZB6c
         N366HIvI7K/T70jfyponyuuF3CWRbieTtw+CglgYq65UVV38j2xUJdT0/mv8SRTqBFNH
         Pt0ML/R9WTqoBkiyp1jbwgnZzwjIXPOS3PJSyi6I4HM6vyncjbG6xtSIXjFySNLXY4DX
         TZw5d0dRNarnaKuRoy199u47TfuvbtuMcN/i17Mf2vdXdaP83VKCkCOa3LJqgCL0ko+X
         WM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784294673; x=1784899473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3VsQ/KzpbmIPz/ijHmyGGKeW2JGVH1BkLtqfTcLEshA=;
        b=MUxPznD0tyYwSkYp4U01LsqmF4bpVo16qOWuTTExrIG4O5BlyB7d2vuamjAnDv1F7W
         sxu4XCzT9MP8bMH+ohA11y/yuw/yKgBclmv3M4FBdAqexa0fosGPVIflFfDQMYrE29Je
         TOZWuyHNGFG967WJFqu5VFVnDRB8VegE0VhKM3Ixl2OxG99dkzAs2+EWQYR76IepGaBY
         85DkyBdUB44Q5OBTk718CkVk1wYMCSA3/LWHSdD1RrVceoD4xJ5dcmRowtrpZfpe+qGs
         84jFOI7Ft2nkMhL6iUuVub9k34OEe3I+h1rw/Hk8xFbLxURcUTckBIV04rehZGqVE4ZT
         V0vw==
X-Forwarded-Encrypted: i=1; AHgh+Rpz/+juk1OvTzI+Nd2ob/ohS3yoYml8LGvvq0W900SbqnLBWiTB31j7YUoSkzuJv483vu9nWn9ZpQkz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6HRXNt+Vs/ofQ16R20NxG4RyrlV/5jyH5aeZo3Xd8HM1E23bM
	F2KmfAbMc/iUu9FJWBgVIa+MlHsxH6cg4aOE0mpNQ8ialFmRG2lyRH9i
X-Gm-Gg: AfdE7cmAvPONBAN4klCRlG1fxsbvZydo+ERGr2pDVE55R2sDn1ZOJjqDu51cp/2dZ5v
	HSAejF653Fm7Br7paCoE8R8It5Ykk/FXrHpQmZHjmQ9RPhgUWQOZJnRDmY2uGyeJoRg1p5Hv+2I
	qi9jEe9iey4BJxZKhXIvZtjh2HdCmxSXdCmOdywwExjGMQBxyhP2oHS/H/spBN+TOQcoYnOoCJG
	USY0oUH4AuXPD71a4+2miQJLyQExNa8YotF1e8FUxKOzZtEF6lP58U2DBp2FUmGd7HfTpAJjcOw
	+D9Bbg0tG5TC6qfTeLtB2MZTmxkuh92iYxs9tvaP0Q1P2jqtM/htYf+XH0PDdG6LiZdhpIUuN6V
	PTQu2JZ4cwzMCCMbKhQoOT/jzJTtI7l4xdO4dT4e7ViEKY71JSfKWJRNNL/XwSfkONm34ckY1wD
	Wxyl5aKU13hWJ5DWXlD0g=
X-Received: by 2002:a05:600c:3b9e:b0:493:c1bc:79bd with SMTP id 5b1f17b1804b1-4954a41150fmr30040545e9.20.1784294673034;
        Fri, 17 Jul 2026 06:24:33 -0700 (PDT)
Received: from localhost.localdomain ([151.27.210.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49ab8sm4288423f8f.5.2026.07.17.06.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:24:32 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add Xiaomi 11 Lite 5G NE
Date: Fri, 17 Jul 2026 15:22:17 +0200
Message-ID: <20260717132218.27007-2-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717132218.27007-1-oleksiionchul@gmail.com>
References: <20260717132218.27007-1-oleksiionchul@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for the Xiaomi 11 Lite 5G NE, codenamed lisa,
which is based on the Qualcomm SM7325 SoC.

Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0b4c17419..494d1425d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1080,6 +1080,7 @@ properties:
           - enum:
               - motorola,dubai
               - nothing,spacewar
+              - xiaomi,lisa
               - xiaomi,taoyao
           - const: qcom,sm7325
 
-- 
2.55.0

