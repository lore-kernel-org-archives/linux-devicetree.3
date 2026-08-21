Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBB748425E
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 11:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312207; cv=none; b=HzzNo9TQtftHaJ7CnD1ivrHaJ/rIlGKYaz/C4wgwzylBkAl8UpbcHeNTvH02S8ndOmZTF2asmWJTQnBrWIekm+YB0IJkcAfMN4xJBsQO1wNa6598Kpli6G89u6p74g7G3sdfjFahdqp5Aovbup4hSor/cgyPsrJCAJoFtsx/nMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312207; c=relaxed/simple;
	bh=lvXJIYHg+Za7wwIfyKwrdptP8jCEhBX03Cv8tnpa48U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VbdfG3fVCPqFc/StxoZ2QMEMLDi48eZBHEIJl4qEEZXcXVuqi2FRBlN3+gVds0TGB9D9sZCgv1zuob44m5ZNvnEdzrz8MZUYx3cQl/5aez9wIO1Z/q7Uw68CUr+G/a3btqzUxtWGjKEZ92ElMiq09Txe16/bNBjOicuw7SaMjAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/7FjvTz; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/7FjvTz"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2020421077so153929566b.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 04:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787312204; x=1787917004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pna/XzfqXxr5JhHe4C9RpqDZzth/Iq1szA4HTr9J/M4=;
        b=k/7FjvTzxGwOMerqKVcH/tvznm3QEx6uJ3E4sr2qUvfwzlA2iCXw9VQ7iXIfyquInD
         0vfuxpCetQZI5S2EIk19N42YAu9aszH8586iWBybr+suXjSCSKR1uJcNWb5/cyLJNM/Z
         5RU9piVX3ERvP/hJCpQi3OrHUnGbZ240eCqKnCduEf5vJdNQKm97tIrrQVo8CMOi4z5X
         CXtC2IuB1qJMpKeKuWZwkci3q3y9q8SqzcF9G05McC2APyhLzkwFJGC6y3RWM3IXWa6B
         DtujIqDGozc+ISPfyXA5ltsFmkvQJjQ70Qe2LY1oKhGmrvxNAXPJnBtDowK3L96YqbM+
         9ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312204; x=1787917004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pna/XzfqXxr5JhHe4C9RpqDZzth/Iq1szA4HTr9J/M4=;
        b=XdHboNdSL21o7XHVs9xMaj6YxuLC3SovK8ziIjy4tzQrmN9apq2NGn+TVa3r8as5QQ
         Clopj3T0KoWEHToHJJ3eNpZJaBocaYLME3ZbGikMnWo+SdVidNhk9imvIjYku/EMwgPz
         Vo6nwlA+Gymh+a6DTp/7SzISS6O6eBsELJQkAvvBjpxNvylYxKnvzyGQmlwNPsxPdOio
         aty6wkMa67cyAHI13JosORan0l5CtW9f1WcGKsnMWqvf1kqfc3fqbZ9f82r7L828zWu7
         +4eaBW00gDmJg7XWU583sk8L1YmqbKEIePyFWn3uiTBLDDKbtI3VpVaodcqhQjOVshtq
         n7xQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMeKUIA/sitqPmXxdrjTMgj9oUklpA98kBGHIm8yh5eyqWVJgg+0EFvWxkWB6DpWfkw1CkgdLGodKK@vger.kernel.org
X-Gm-Message-State: AFuF++lbvthbr2EiTOaZgjUoCa6K8zgMRZCNfop3ONjHosuSpjvv+hwI
	rbuYb1rg0/dnSfuh2ph274AA7VJ0fcyhnHd21Win8nYGbpoKLR5HqVzozykx5w==
X-Gm-Gg: AR+sD11rzNBrO6D/akbhf4/jF8nBaNfLJ9bfhP+oymaOpPGFUDwWRTXy92Hr6tNMUYn
	uk+0XQ6CgpVjVK4f+0UDPBmVJC8xyXSz/Sgz4aJVgmFlzkjYHlQ7dUWHpJPVfkbxSfRexeQWsWB
	3UcW9KU/ZwfGrihMAeRPCjRdMxcSRuBgZxdjwnmsfZCZWARHsFIspQz9+EhWHyGMLYA/Hicg4w7
	0ZNnHB8Oxos3pm42Bi6QbtneiHvG66Ar7iuOm7n9lHZgtMdn+GF7JKqVYupo6yAs71OtJ6SdPti
	DFFsyHGS7xDbYnYmcyN19/j6nshBmZU2py4jM7uPe0hsVZ0/XQXaSCVqnE1HlBHupqK/z4oP35Z
	a42IRuz49D2hTczMiYncCnDSeJW3km7sOG63vBYRjXIc0gyR/R3LbEb7U/KcQH1YkA5nN2IFXRK
	4SSrePpobUzgkXnx/bmGKgnYiz1BM3G6B9SAOvi+Bv+mp+UkfTRDg7MvmMRKQaV6vlbuUJ0dej7
	2Fo6CQok/0H8z7FpkP4zFI6
X-Received: by 2002:a17:907:da16:b0:c20:f4ee:7c97 with SMTP id a640c23a62f3a-c246a4aa1bemr559160166b.5.1787312204319;
        Fri, 21 Aug 2026 04:36:44 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c3491sm6204661a12.10.2026.08.21.04.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:36:43 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Fri, 21 Aug 2026 13:36:28 +0200
Subject: [PATCH v3 1/7] dt-bindings: vendor-prefixes: Add LeEco
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-next-patches-v3-1-cd64bcef6e21@gmail.com>
References: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
In-Reply-To: <20260821-next-patches-v3-0-cd64bcef6e21@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.15.2

Add vendor prefix for now dead ecosystem company LeEco

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 136681412501..dd0762d3334b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -947,6 +947,8 @@ patternProperties:
     description: Shenzen LC Technology Co., Ltd.
   "^leadtek,.*":
     description: Shenzhen Leadtek Technology Co., Ltd.
+  "^leeco,.*":
+    description: Leshi Holding Beijing.
   "^leez,.*":
     description: Leez
   "^lego,.*":

-- 
2.55.0

