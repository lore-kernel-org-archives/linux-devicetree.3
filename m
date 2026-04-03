Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CDB3C944C
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228439; cv=none; b=t3OsZbehs4cDox44XN+RlRke3bsZjKId37UItsXkQ65Kpb2B+kIq+bBvsvLke//eInT+mgWbfFUPp4V8WPWdHmotYPMA+98qgSEV9TuyhdiWRGb7XxrKwTNDy/Wq+IFXXzq95bIfkejUsap704H+9D3nrn7aBFgSesUJBjvMAfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228439; c=relaxed/simple;
	bh=xEcUg10QJs8S2JPaCimsNDtQkFrhjDiTVcW8ztlhHno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rI/kuq6oTh41+fVw5yrWgxv/yP9Tew6Yo1vd9U/KJ8kbccyvZAuvWGvW7t9TyU5Q2kz6Ax85AUZkp5cI2VO1SZS7icG+C3AoWkeqMf5sQLtuuaZVI4QUVO7Npxvi0XsSq28COu8HCth6T41uvs+DGXwuUedreXmkmHKqh8X1vNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Y+4HhIng; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Y+4HhIng"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so2717815a12.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 08:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775228436; x=1775833236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsT3+v0EI1c/NqAMJW4AmWQ7Fl9ive+Tf4GhYkRHbCk=;
        b=Y+4HhIngxSql7BmZnRNevpr7KeD/2Vuu0I/A+U5uXfKD5illzIL1OwYfKIRkPZ2Xdt
         Ued+iCV/OCmU7BRV0dqiEuKH9O5J93hvdO4D+ei+hhQgOQ2KZMb3J+yhXIe5sC7lxewI
         OBVDcwqOvyBKnkvwtZFKuS/mPDnEvd3eLP7WtMfTWQAK5clmfIgwd5SMjd/JSUK33uM7
         SyARz0hGlRvl/i1zzARPYKiSGzuBOcbAOveiRfwWzHMSZTPpJGU5lQfsh2NNFG/LbjR2
         vZ+zZoOJWxsKMVsVPf+h2WUrUOwiSxGZ7f0UvZUdBiJmfB0FLNsrj9ZsLVPP+R9Y4gtQ
         boUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228436; x=1775833236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KsT3+v0EI1c/NqAMJW4AmWQ7Fl9ive+Tf4GhYkRHbCk=;
        b=UCSE/2l2cb5bctZFsJARVF2dvl2Nevtu11hU5+Z6rYEfw/RfJfgB1Kw5hBrhk+b6wi
         vzEXKlGoOArmU0cdm+cTucjQjsEqFSHh37LXYkSIDY1cBrN4B8GaOi32Fv3/5AiFfFVM
         qf4mr03UBrG+rKCuNI0VlhMHqwE9+D7Ps8adJePbRGQSnfm7zf4QSuzwyRORdxlluc7z
         JkKwxtCJ8rALLlVgw4pXR/ZraBxlvoFC0uF3sH4MFC6ejj7AwY8QtirN/G56vyWyFYV+
         LESEm+BtP49+mA2WEj9f2C45w5IZQkzEIXeb/uPKAk9I2jFM/tZQZIwp3FyBvDxm+87k
         lepw==
X-Forwarded-Encrypted: i=1; AJvYcCWcf0ou5zgqxq+mAmicv5Po+pQqK1qPhbTZbEgS70ZBX0MgRt+Vqm1INUGIjlx1cy8WGOm0vumpUC5w@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhsvgmkiz1k1tobQZualPaTzccaRuMk9/C2QpdTGrmUsQAf0F4
	0LP4VN6Np0p1PYAU0tpvSxwOl7dVWgwh/10PgjoaUAHEMIBF/h+IWMvWEUGX9bjJN+8=
X-Gm-Gg: AeBDiesPQRqN+anDRGycRiAlI2d2RaUFu+xhHBKphQWGNzdfNmHiQWTyTU+PbFwgJH9
	LqfDEWJwG0QnMngSBbwIY1xPWuvQErPdTu7uh6fGLiUCkL4PJYVGnWWFwjWm3Fa6g358TIBx8zz
	vqu/J71JssVOBvP+rUro9DK3yKNsWG9qp0yGb0x5zpcvgJHh8I+vkGkcSzJ2yUaAlDkfrfk+2wc
	7M6ViLv0AJmO3Rqeny2RFfpjm+TH9gikRJ8cVIctFP0CSz5kY6PfiGiYHkmN3o8LlPO9itZ12Bu
	YD6NSiB252kV3gq01CXs5DjvNZr/3xe2zlUfUBK6/k1HC6QImBKUiJXFgx4JXjkRqjGqiYf5h6r
	tCisY6RiqhwMIvYNU8qAgx8p/gGa9yeh435aJY5skuFe0ZgLOSeLvpxjJFrxDxvvsPDSg6f7ets
	w6i7JKzQP08cf3S5PiDsg0IjMxNkh6bytaj//vztB91lV1hQ4eQrS2yFJYuG1rcg9qdtC5opZLl
	sUfg+PIllFzELZYJKBlQVDugtkRCyX1G3LjeQ==
X-Received: by 2002:a05:6402:210e:b0:66e:55cc:3156 with SMTP id 4fb4d7f45d1cf-66e55cc3284mr1003237a12.24.1775228436269;
        Fri, 03 Apr 2026 08:00:36 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02f389absm1724648a12.13.2026.04.03.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:00:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 17:00:23 +0200
Subject: [PATCH 1/2] dt-bindings: sram: qcom,imem: Add the Milos compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-imem-v1-1-4244ebb47017@fairphone.com>
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
In-Reply-To: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775228434; l=733;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=xEcUg10QJs8S2JPaCimsNDtQkFrhjDiTVcW8ztlhHno=;
 b=eHXcAGeGTKKVidTC9LLJh5TgHssAi6gn6dvlaRSpGWwMzxeU+QHCxxnzf1LRaOMTULHEuBYT5
 0YWKgOWHCKhDzzZJZDvMTcM/kcAtTYoCTZ7dRJgmc5bfK/8h7CpTKL4
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add compatible for Milos SoC IMEM.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index c63026904061..38488e28a6b4 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,apq8064-imem
           - qcom,ipq5424-imem
+          - qcom,milos-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem

-- 
2.53.0

