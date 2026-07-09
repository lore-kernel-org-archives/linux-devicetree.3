Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCAC380FC6
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608343; cv=none; b=Y4DCLCJgStYY6XfUgor7AtIILq2V6PlkPRqCPqndA60XHSlEDYycFeZ04mPgFQq4YQR/JibfMDtKxCg14II8NnkjBffQrnDOAXPBz/MIY6hM9K0hIL61qToyc1jpoKFGPPjyEQ49RHCQDkL9Z5Yfwpq4M14hw1N+SaKTXgZfFqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608343; c=relaxed/simple;
	bh=7Z3yih5dD+Gsb3wABmKEFV3aH7k8cqoROjarxbshbP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bUKTbOeayZXkz6VRI+0nIlazqjfPdor8o83JzCgG64oBNffMqbOyIt7ZAEBDDzw/rrJqO+wE19bEHRrWAGHZlj4c3e98CdtSiWqBAHH8434re8x5jnQ4fI83z1X2Fo58j39u8bEZR7LHkc8JwHh9LfT65/u6V/Q+G6xBC2IbV0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BUSUkvTP; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BUSUkvTP"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4759b4f0897so1147169f8f.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783608340; x=1784213140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bktDzvvSDnTVQSEknn4n+r4fNa1uNeKA3U3mhbAncEQ=;
        b=BUSUkvTP9kCsvgd5TJMhFuyzT12ALftMYjBJl/wQiYoYHzCD4hxs8zH4NasSjsQD3R
         FLlI9wPIi9kl8K1gVbX2fjPhZQYwBA87LydyI0e1/guAyoq43p387qJKdi5VwXukj7AC
         i5Dw4R6CHURo7+0iCzR+54+woDrz/uhgDT/4TG1lq4nvakbZzZxNsG7c9DYr28IeHJj0
         cdThIw+Y+uxI+omK+uEEUtb+qwICrHP5YxFCoyYcDHdy2AJGUjbZaEfimba0cgC8vRYC
         qHs5377P8tqT9ApwhusLWFNwXqXZ36cPTuck5LFNwiWJTiPZ46ETuYGgNSkF3/zKmfS4
         5+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608340; x=1784213140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bktDzvvSDnTVQSEknn4n+r4fNa1uNeKA3U3mhbAncEQ=;
        b=YRb+nGpiOFUlYawR8dl+PiDAw/gWHfxYuJ9YODiEAH065+TMGwswW4mhBWQqib1udF
         RBr4OraCIqKOBaNrQoeIm9IIHh9G1TFcVcM3vPrNyxEMmuBtmsFKtO78u1thJe1h1vEf
         wvyQ/iBlkbFUQzF9/t+Te939SlSM//erDMdvxClxKAhkNaz7kXD9J4US4GhBCK781WxL
         ZAtHhHd52X/nlZPQuwoocip75vnt9AUEFLCVuDtcQ1mo2FRuga6k9iMMPFEI0oexieAM
         p/m0BGRunDewH3+l9jHPzf6r/lXlxrrx/OhXyChRv3d2hQOwq3TA9dUxcaBhlivF1OmI
         CWVg==
X-Forwarded-Encrypted: i=1; AHgh+Rppw6Tpl0Di/+FzYPzuK/eFys4oBQP7Ey/dY30bvFc8LaGxqLfHm/s+2NrVmrdmiAiadzPr6xbMKPmj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi0ESyZhFjQFLAvZT8SZoTxaD20495yn7c8P/pFH/yHlhQMhWx
	Os/jxAG566Hdvtj+3gsofoSOVp7iwU1D7DZUudYrisE9J+bFj7URYDASAuKGbx1UE6g=
X-Gm-Gg: AfdE7clbgNCGTc+DvOahtlsxcVbnbC3DUCRsaqg36WevrUwqBEymztHa3iyRkvhKYgh
	kZlqjTgtob5wn9TcwQyh+4lcENZqZA/l79tEX+mkyta9Sik+bs6BGiveJrKHQfpFAAGoz0aM45L
	+PabbHzAXBbS2IYOCW57dpG/XjzHE2l+44C3u4H/ti1Onw9hmTnEgpVgCfxwHpzxAA2+/rTt/sx
	AeJB0HnXLIEkP2nl8pWWInCGDp4WMXTwBtzAkURcjXAT20xeTSea1HA2uFL1N/CRflmzVgI+Dak
	OV1jEtTytowyo3cHD4FMn92hpOGMk2lOpQn0rGz58vUBnYex0PXAfEK1oq+DGO119DL/OUw0nOe
	VPWbIkADk5XwBnG9yL14/4bbP82X+JwZP6OgdIT9tmATwnLp7HgR5jK8s1Ws+F5lglesmvVKRBM
	mbkXG03nlOoFW/jSFWm05tmhw2JnpNw4rm35XCtu5YYAXK8bIBhpZSNLtZVUeIJUCibXagvvraa
	82D
X-Received: by 2002:a05:6000:2004:b0:47a:c103:8a2e with SMTP id ffacd0b85a97d-47df0808ff0mr8297411f8f.45.1783608340408;
        Thu, 09 Jul 2026 07:45:40 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm50995732f8f.28.2026.07.09.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:45:39 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 09 Jul 2026 15:45:36 +0100
Subject: [PATCH v4 1/2] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-exynos850-ap2apm-mailbox-v4-1-caf2fe9a237d@linaro.org>
References: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
In-Reply-To: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Document support for a mailbox present on Exynos850-based platforms.
The registers offsets are different from gs101 mailbox, but the
workflow is similar, hence new compatible.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
index e249db4c1fbc..c109c1f7af24 100644
--- a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
@@ -20,7 +20,9 @@ description:
 
 properties:
   compatible:
-    const: google,gs101-mbox
+    enum:
+      - google,gs101-mbox
+      - samsung,exynos850-mbox
 
   reg:
     maxItems: 1

-- 
2.51.0

