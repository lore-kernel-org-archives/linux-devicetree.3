Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4C242FCCB
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380969; cv=none; b=JkgNeFD2IJI92VYhtefis35Jo6JkpFeuFXIwDcO89zc4juciWH1anlUDU7/+e02OjgnCpgXzJbdCGdAdSYxqF/BbK5XTi3wiRNX6u+0s/Llvi3xCJKVzSRUFmUZP/smunicWkP44m+IpbLv7N0n/7VsbJAWfbdCq/qj8NVgitz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380969; c=relaxed/simple;
	bh=GvnbzUc8c9NU+oo1TqfezYXxZP2QutE76bVHLE6Elxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=km2GenPQo31180YpOPzLJGu5XV2fZFbkOeCbCXnomCbPgx5UNPsvaZrblEBSseih5BEr146lUStifekE3ash/slKzXrvNG9wJ0rUWM5WP39AQtvDO/5W1GPzp9En1+Eaxx/HGj1/y9HxwAEwIOD1pEsz3UxCfSBQs2MkVru+va4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3heZb5l; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3heZb5l"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4994c49f588so953835e9.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 09:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786380965; x=1786985765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iCLTOXabaj4z0hqf20GvwqmNfb3co6JWnXenjDC6Bg=;
        b=G3heZb5lHuZFsxw3LyHqIqDCLEVaBl0V7La+p40ULfl/mL6BT5XmPyjlVrIk9ShCP+
         Pe5tvQighSX2/XPN7JbBuZQ4KaBOdScIW5PRnKDp0oI1AgNR3Yj2/hd+dVxxaLwYQU64
         BUl0IOB4E9biLkjNQgtblazMyog3Y1FRnWW6SH6t0HfCF3ndWnAIL7rIsYrm8HWk09km
         prdXAnM6IPPM71gnzXwl0umVg6t8n46HlesoaabW8dr1GgDwPetSPzKrUhhupqoq7595
         sMRfBdxHgrDxYgWrTLcatt4LQz4EjKWjBDm4Cxqq9HRBiDzbzRjtxVWxUVu2tKpiN4Kj
         KPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786380965; x=1786985765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iCLTOXabaj4z0hqf20GvwqmNfb3co6JWnXenjDC6Bg=;
        b=BZ/qRXt8+eNzzasXLjPJMLwcckAvnETvdswriDz855vreuHcMf8GbhGVDrCytW04zR
         fgsY1Ww8oll3puRr7+yC09UGdivtu0XiY/S38yrd44xWkU007qkYmqYCETUCg4hK8jVr
         nvKPBE1B1tnkJFwOzwCQCh4O6nG1YbkXiAmYL/8rFLK8zV6nGTrRya8JE/QV2TPVMsvN
         wh5xMKsoxiTri7nK+U6SuCMdHIh6793tHfQu+sZe5dVoIYCv0adYyS7Pb7Px2FvhwewQ
         KeYmr/dq31U+RrpWh7LNszd+RzXO+b+zlmyYFCSxKp/TcyfxnjpQRfZ+OTQzw9nX+PsK
         8aaw==
X-Forwarded-Encrypted: i=1; AHgh+RrZYuYM2BlkuJwyp7Qvha6VbEJIgmxngzpAfkVh319j1fs9SsmWrUNqFavoK66KfblRCrKpHtcxlKdL@vger.kernel.org
X-Gm-Message-State: AOJu0YyMwiUMyNOStqAg5a+fyh55NzkNoqgy7wDkaE+XQDuBrHmiCLli
	iLM3U8WwouEKos+Q2lkkqpMzXh0nyvSnfMTgjfD7c46HvRZy99eFoQeM
X-Gm-Gg: AR+sD1281aigcjePrA0Y9JxO9ocQecL2T8C/nHZ5Ov/tv7nfJkTrVkUCt2ZCfTGKR+S
	Jbuc/STCmL/aNCXPL6krLmECJ9OOVYrNMsPbN1tM/lcLLXNWLGLaFi0yXeZlzLxQtmQd3Nt4q96
	phIDuqggdN7IEfIG6zFB9UKf1ebXmnvT5fYwpIyn9FSffTf2ocK41/2z9zlmCLRz8QZjhtUSkr+
	m1eiGy7wGDS6mb2ZasB9OkKBpN9P/rilW1iaHF5Tkjy+8AJ0W+47+gPRpL6wXykW2l514yV/1bv
	fu2ecMZ+Hkh+t/qP5OwCQPpx9t26zETHmI57OjharGkeVe/TJ9ahGTFIETl2iNAwfk8dBSLP+tO
	tONZ2SmpS8TRO/+ciOrTTtAhdwdTWyGQmB24bP211av4vPZhoMO3mGrc8CRNj0qSP8fWq4G1iz6
	KKpAYEH2BJmHaG2pXkuB4d5n/ELLNllIL5WpIeLb958OIlujgdyWWfTWt7j/xwhapJug3NN72US
	ymFCjywshICp2AACi/cKQje
X-Received: by 2002:a05:600c:4e8e:b0:497:ff5a:38b9 with SMTP id 5b1f17b1804b1-4996247e640mr230932455e9.9.1786380965439;
        Mon, 10 Aug 2026 09:56:05 -0700 (PDT)
Received: from [127.0.1.1] (83.31.73.193.ipv4.supernova.orange.pl. [83.31.73.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c69c8ffsm238472635e9.2.2026.08.10.09.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 09:56:04 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Mon, 10 Aug 2026 18:55:35 +0200
Subject: [PATCH 2/7] dt-bindings: arm: qcom: Document Motorola Moto One
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-next-patches-v1-2-79a779d76173@gmail.com>
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

Add compatible for Motorola Moto One(deen) based on Snapdragon 625 SoC.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..289a3de1d24b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -292,6 +292,7 @@ properties:
       - items:
           - enum:
               - flipkart,rimob
+              - motorola,deen
               - motorola,potter
               - xiaomi,daisy
               - xiaomi,mido

-- 
2.55.0

