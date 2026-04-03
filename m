Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC9E3CEBAE
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234647; cv=none; b=Ow1evM+ApEoQ+0Zrv6M+3WTuKEDqjJx4yxQxe0QCV+rRyW7+wuXhFSauzl8BvbgwUCXDOTRcD1b80584ATuSvG5efMOUO+16CWsXo/sYGCA1JB99twreiG94OFhrNdiH4+hSI8hjOKfA0wiWNwBZXgnBdRe4FlyaYDOB3WDjPsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234647; c=relaxed/simple;
	bh=vDbmeaqL6j039OEqNItmPJ9fxW8hfiNnCv9Ev3C9C08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFfL6Qq8aZXUduWLC9/sZEnlwxYAUofW/kZNJOGb3lTtWQzkQjgFuat5/vLYggnh+YhZTT7w4SmEUs4Da5LxGBVxrQPEdsEhR2HgkZkNekhvVB4Ii+xDP/1KKMvcRuvXiwD4p94mQQLSGbgsLL9m9REu63eF0HKJOoD5XsC66JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KhYjomze; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KhYjomze"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66bd4e0560fso4279424a12.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775234644; x=1775839444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7CKDzUVCGIYSeYc4ZNCps7II5Y1x+X+SqlRkbx3cDqc=;
        b=KhYjomzem+V7R0EavqlwkPcYjpOag4mY5muiXu/ykKnnWBmH9iwZFhAI+hgEccWVS3
         65jYrBj+GQ0kS4rwxQtNavczRNoXqwR2selZv66jS4VAlE2gtfc5CTSCQ2tLp9lupyrg
         ewZigJ3/noibsB3Qy8VmoDoe/9tihmzhAJfC4NCn2OQns23pSYQgNQ3K1PwobndPcWW0
         guG9lrogxQ7zc7bWff4l4jsyGmCaYMgKOYbRlWNl56Q4QX6vyug7Ttrk5tm2YzkIZDnV
         V5JuIlvYoB2rCkrFLuar5Knuv4QNf+2bnfvh+P3B8o4IQUI+sIj9kgQppisu4pECed45
         EdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234644; x=1775839444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7CKDzUVCGIYSeYc4ZNCps7II5Y1x+X+SqlRkbx3cDqc=;
        b=a27/LgO8HuaXPKlck9pByCPy9buvmL0pxwqsD9JfBpFBkN0FmpKv1YdsOBZUhcz4za
         vBTIiHE1E7iaRgt5QncWqW+ZY364HxsA43NVglALoriLGuDJNluhn9erWrtK95qSAA+p
         fcQiHFeIlBFhlAWCJdHPmfKwl8qLifMaLo0iiqxJHN/gearb2tSg1uSZUFE/vS1EB/n8
         ggUbMBNk6FbHNNoKLYPSceir87qqcS0LbNh4XgtjmLlrYpFzhOTxfo63FKIWRuriyZGL
         dl4Pz0I1MeSwopYCVkrvcc+kSuSNhX4YmHYeFFz332hygyCuaY8LSp73uQRTUg6KOfel
         nRiw==
X-Forwarded-Encrypted: i=1; AJvYcCXPwaibauW1P6i47x3OVwfJSl4+m04aY0qgxfScnjjWkYVu3Sd2qv7em+XzmgDGYEco3XwzYUgibQCk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgfz5sjZhNJdUH4OEffP9+0a+QEs3K69tv8Er3sLEKOsaeKnoj
	55TwhzvHBFSq5csWhYuvbxWXgRaRspaKri7fmxU0sV7x04lLt99iQ7Vb9rsesogjYgw=
X-Gm-Gg: AeBDievOZmmCp/GQqcLgdiH3sJGm0V8/AwRkF8sKvGgzVROaTFApCLcuZueGwYSJCmF
	0XUmBjBUDY4vOnxNI0KAO7CXfBlRqeLxZJ08e5MDtgqkAD87EMBQWkvHq4OL9sahQAgOKnf4T58
	OgfMl3TJ12UBjHMeP9clJ33AbVfvDnwBXRbjQCaA5QxxAruusKVxjiKYo4ScY1LZ/wdAx5po+cb
	qzyWp1EPZV/mVlny1JuPNF9CiXTVw5IYtYoP1nUKozDjnrtkijlji/45WPtuym/oeqbsrUxuBhj
	RH21L5gd3ceWLDsc32zEb8ZwUxUBAnW6ZXrJ2Z2cs1Mq7+kO71rbM+XNkYZWFaf+WvjviDQdIMt
	C/LdAGOjk+XE9u4g+bwaXe2msCTvaEr3A4h6v/iPmelLnzG9nys27psrq4bARd6hJunmaiyW3ZS
	OPBdilffODloInin//lZ1Mr8/GWVBmlju8v/qXULIvB+F0N8YBluuqrpNQjAX/MbEZWnJPnW8zZ
	4SvYBGGPE9FXRLlUU5o8ptheXYeFBmZ1zopow==
X-Received: by 2002:a17:907:3d0c:b0:b9c:7b62:7bc9 with SMTP id a640c23a62f3a-b9c7b628bf4mr89943966b.11.1775234644481;
        Fri, 03 Apr 2026 09:44:04 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca9a145sm213492566b.25.2026.04.03.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 09:44:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 18:43:49 +0200
Subject: [PATCH 3/6] dt-bindings: net: qcom,ipa: add Milos compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-ipa-v1-3-01e9e4e03d3e@fairphone.com>
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
In-Reply-To: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775234639; l=699;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=vDbmeaqL6j039OEqNItmPJ9fxW8hfiNnCv9Ev3C9C08=;
 b=mXWJEgU3e2IoxjKyItffyoAa4WLNpmWiImybdREDj076J1O8EJOtjTJ/7E60j+8rTZskknyqm
 86UuGN77F5JBZbIiCMC4s+p6WmmcYX3+n9viols85CSHwizdDPeijAs
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the Milos SoC, which uses IPA v5.2.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index e4bb627e1757..fdeaa81b9645 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -44,6 +44,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,milos-ipa
           - qcom,msm8998-ipa
           - qcom,sc7180-ipa
           - qcom,sc7280-ipa

-- 
2.53.0

