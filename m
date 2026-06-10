Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85569383992
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091569; cv=none; b=qSNzTENhuv5/yWfqwvdSszxoesG8e4FnoAZnkV1mybA4UFBHizKRM8ML3c1x3xnFg0AsCKEQtBXQKRoAXEQijSLh/G/Tre/uJdMp8BF2kovF73Zjy9Vx/c2+OGbIr6j7qULSlIOaDhzDzk3De/tjMNl7XW+qwefbADlIwIR7pdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091569; c=relaxed/simple;
	bh=yWzPcHOx9Y0l0sp44ZHSshHjrd7t8NWvm/wcwRs+4y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHcDoiyL27T+T/Kgp1fQSXQiFkT/fy+XD9ARkxdMsy4ODN7CCk8hBjQSKMzucUFYSzyjqrsT9m1Ss4YW6DAwabsZTuJ8kD2gzGPAmN/ThIJAMTGSAOHiiFAKf0mWB1cprXlLVFysSJDymlkJQ09rjnObnHh2m0i/l9wWk09OyqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJcS84ar; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJcS84ar"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so4953202f8f.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781091567; x=1781696367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=rJcS84arLuPDEGbQ//g6zkTYX8ufd944J15qvPtiApO5xQjyXtn1niYKtlgYqtzDyQ
         XXAlL3T12CUJ2YrrAUIT+Wq0NK7MWMWYE9lHGf9UUPzKlPCdbTwlkYMG/HjeDSyjdH7e
         MtYGsAFvZjOnLiJSL0i9EVM+vy+R8nKm3WlEcpyKacFdeRycJs6fJLXa4VxZMVyXmUo9
         sJIXPwVx7E009a9pAY28DBzTNs7b7E/UhdI3XrJ8EZzFtQqFkrxisCtix99N+GioLSis
         wtsoUXwBJ4dNMX1YTU0VHFcdnTbHANZ338SR7HFJm01/Sv1r9vntm5vvVxhvsIjmtRiL
         XyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781091567; x=1781696367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K7SvbeeXWrfwUxsbhsnjjrs0zVBJg/7m9sutmS4WppM=;
        b=XdsaCOJftxR8kuC2WIFe6MxWjxtHdxP9vrown55vm8Wq8zQyC1ECMX+Yi9Xu8ex6RA
         VJhb2mTeM9gi5LRwGesArADwa2ezGUqsHllRIxuEPoS7LoksUOubpBaX5bABIICfWmg0
         7FdlJdCPS+RAUp2FSLoyyZfgFSk9rD6SSF2BI/Y7yFI58YC9EN3qN1eOnPGZDrpaE7tv
         /aKUYtbadkhHA6Ym9LrWZBzj1IpxsadhnjGvm50Ynnb86nXV/d1CJ1lPVqsUestLEz9r
         owAUpEVcHhMfkiyLQ0p57mp46NT5EEpoaKNxJJiDBwJbp9nMhkzwFQxmc6kn2jcDnJbJ
         CwWg==
X-Forwarded-Encrypted: i=1; AFNElJ+wsKA/3wryKug2xKbN6QVHdFf+ybzeKNHntG4TdrhsNInaJwxrmUWJWZTXRdgev4wV/hwpwBREVUuA@vger.kernel.org
X-Gm-Message-State: AOJu0YynTOuh2M4G/i1G4ml5N7m5EfIy4xoeqBwO/W9xbwsTPn1MzAAb
	zdtzwy/B99nECjaL8zsNH32sO9pwJe+aTKAPknh0vcDLkoUdQpj6e50E
X-Gm-Gg: Acq92OEwfNzcXhBe450T1kyBXDZT7oZpzn+AjXb1U0AubgtdvYBhwUtsme4cY2Nw/tk
	cr7ljJ3nkpKKGGCVbviyvuUCaCuaVWb8Jo+n0DlpgCEZPkAVH7TLSRjE2lPMExDpUbQIN0QtTg+
	LNjfDcywRAE59lWYJfhIgxZfwwkO6SBxFnE9C7eY/v/klRiQP2xsy/S87zEAomN4/enIxcB0iOH
	T6s6L0JXHICuM1jhTss3wm5a2CPrDKbOkPM+pjrI9c9sghx/YQzWLWVu0JcPG2uLYtpJNEx8ScX
	sIh6wNgNEpatYIacnDhPoXERKytz87WciagZ5c33/9zPzm+NoXe5CV0DO+RdqF4gpwEBiQLUUQv
	QrTyWt9E8jNQS0QHFI1B6dpHI0IlHNHvhkq64lLrn+UPv9Xe8TAgBkF4HtdAV0bOx8VeXTp5RXQ
	t6n1DsQgf22MYJnq+lguQm0s6gLcPuOc1U56HXN+A=
X-Received: by 2002:a5d:44c6:0:b0:45e:6518:21ad with SMTP id ffacd0b85a97d-460302e0a3cmr27231696f8f.3.1781091566969;
        Wed, 10 Jun 2026 04:39:26 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:7c0c:c5aa:32d2:49d:5951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm68042009f8f.19.2026.06.10.04.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:39:26 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 10 Jun 2026 14:38:57 +0300
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Add Sony Xperia M2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-yukon-eagle-v4-1-763d5698bd2c@gmail.com>
References: <20260610-yukon-eagle-v4-0-763d5698bd2c@gmail.com>
In-Reply-To: <20260610-yukon-eagle-v4-0-763d5698bd2c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Document the Sony Xperia M2, which is a smartphone based on the
Qualcomm MSM8926 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..851d1b4d74eb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -99,6 +99,7 @@ properties:
               - microsoft,tesla
               - motorola,peregrine
               - samsung,matisselte
+              - sony,eagle
           - const: qcom,msm8926
           - const: qcom,msm8226
 

-- 
2.54.0

