Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDD842C511
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380967; cv=none; b=cc8Q+8Z9C16NeDn/5ZUruvF7w7Cg0ZtlPY7s5LyMkLIOwEI8nO+col3FNP+pad1fKrHIIjG1RL/7VRR6GnAh8l5HFy1ynXWYgYlG8gwumMFYG8qOTQ8mhP0b7VBA5wAGBTBL1sFUeMapaa0gjNv9+yW5xCIvmGinB8Quo0gLcvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380967; c=relaxed/simple;
	bh=1QK3cTT2t5BsbTp2CghYM4pnPFZxEX5FAMOIRXPEdno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fB0UL2wsEwMwFi4t52P/+sNxXCu8+MA+D6ajQmXqBfsD424FkDm5lMGGbvbZLCUwuRJVHqkjFPAw3U6cOk7uv1ZxT/T7Kapnc6jZsQUkhSjAe2wuy/HnP/PWU/CP4v476o9K62gfHI6d7A8rYshooFCtazqhvNKx43HE3Sr8RXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXK4250D; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXK4250D"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b966dd74so12964335e9.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 09:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786380963; x=1786985763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsOwVJwKnJHY2ExLl/CYmRtzOXIqsyEdBUQGA5n++9Q=;
        b=gXK4250DU5xEwzstcZMuP6zi4jo7P3WkZhUYSKiiwGeYCc7ZtGOrHs+vOQxksIm9HQ
         YZ/q2japhMkqhGeBBpU/ZkCthSrkuO8OHzb6rSo+RC0Hyf2QQfG3n4sYNwSOFPzpfHYE
         xlkMppRGopi0A14U3CzsR9UWi3qhHKjQChEUN9tbkQsghDU84VJUH4GXF1rCAmRS8zQR
         qhhonx0F09gvH+F22dEYgw+xwBJHIzYV/9qxW+kxakzT61zNg9Z6ftCyBugQeGWlpNqX
         JmsP7FFOzY3DwPASMm3vIkR5Een3jOY1rAIzBMipF1olArGNoC+U/o/QaGAOpkF+jaye
         SGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380963; x=1786985763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsOwVJwKnJHY2ExLl/CYmRtzOXIqsyEdBUQGA5n++9Q=;
        b=pZ1zcP5kmsInu5s8BB3MDiSk2lObIhZHeC9Wh2xNEkH448avTb26WzOrKZwkwWEQ4+
         Az7QRqI3bJvw5fFVuvqCE9JiObVudKounqsfl9cg1EMp0/TMJ/8GBF5N5tuT4lCzOB9P
         fkDfRJxSxE3D32jltLhvkTEWF3soUeVfe5znoiaD+sOYY2vROk//xTEF4zlU2lTPndui
         cqsNANLX1vsNI+Ml4ghtJfSjVBFcLQpFEemsvPripjeIsnUxcW5RtiIA3Bj/Tu86wi9a
         tlMO646BQQjdMAfCRvJ9xN6Chwmvp2G1Q3YonsdW/gqyGtkRaTgfrtZgk+ONzxDT6qul
         N2Sg==
X-Forwarded-Encrypted: i=1; AHgh+Rrx4yZiJ25XzB4s8y7xRdoQSiIQAFrxTt3gIX5PEJg+1NTjwYcSBE+gPawWe6wxuQnTLYF3GGhjiXWv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrc2obPueLBRH0KvWYt4ZR1upnhOXOKaR48O8hAcXXqqrvIFLe
	NHmV4lxSvcBYRtg/jttMh7qMvnN32y0ci24KEz0vlg+R1mZWJ5bZaGGT
X-Gm-Gg: AR+sD10Vk75W+MQ4S7nkVe9i8UPeJgcRjPhaNKUqbVR0o6hYxSuC5Mbmb39h3Epvkhn
	of6hZXAnWFmBmTx4J6F6n6CqwRjsNd817IP2JvKNhlhgDB3wJGhc5Lf2nGNW6zEtbbznwlmuvXn
	O29uilEXYpJwSdjs38/fZqb3UV8o3ccO2lmy3Mf2y33xV1KKTeNyhO2TBrbGatlikETw6SH+5t2
	dYHbZR5YQguQ/LId33LmZuStFFlocmdv8JpSSMWxjfhvn4MQ5lF43lJiZKwtQu+fEdv1X2fdSzE
	cZ3FrXQJ5M2zWP/YHbzG8cnoKCzWTwKOwRVfZnkVLaB2tSNZZNJ9MeuY3o5i03g9q3TB5N2zD41
	65wTEr2xiPkBjy298S44Q96/1LhwVhdyCmY546BInP43U/eZ/GWQ+ctaHbRfqPbYDoKEFHjw/2w
	kwWm2ctRp9UpACXnEyo0rEsFyZfLPDyysc6xYKMcVhTRcPRoudocdlqIdO9PKsYP86rX4kG/Zpg
	vV0vhWXPV3oa9MOgbmLksFQ
X-Received: by 2002:a05:600c:5489:b0:495:6134:6d61 with SMTP id 5b1f17b1804b1-499727d853dmr45181605e9.19.1786380963049;
        Mon, 10 Aug 2026 09:56:03 -0700 (PDT)
Received: from [127.0.1.1] (83.31.73.193.ipv4.supernova.orange.pl. [83.31.73.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c69c8ffsm238472635e9.2.2026.08.10.09.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 09:56:02 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Mon, 10 Aug 2026 18:55:34 +0200
Subject: [PATCH 1/7] dt-bindings: vendor-prefixes: Add LeEco
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-next-patches-v1-1-79a779d76173@gmail.com>
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
In-Reply-To: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
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
Link: https://www.le.com/

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

