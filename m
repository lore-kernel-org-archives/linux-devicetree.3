Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEBB32D0DC
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 02:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775096428; cv=none; b=Pn6GbiDGGSRAI85Kek96kuXHPHl2Zgwow8ZmZ0agUrnRekSnnq+/AvVr5PN0nqO7fC0EGxthFUWwWIC+B3y/e0Dea8F0Pk9K/OOnC6PXt/tQydV0WeDqGgBEtFz21sU0RQSj0XLYCpEqeEDl/FwE5ybqi1/5X6YiRpeauBcxeM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775096428; c=relaxed/simple;
	bh=WY9gRm4aP98ntsWvJkYIkAqwVc/Juho8BzwfyqFKlMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DG2TGWhnBWUtQjQsPmTNz+9i71uX8N2QRiwfR/V73aKc0zRGxehsNr+TSzGULTxfal1ihOstgAjD5cgKs0BXMiqILtgPc2n52qWDSaZ9BJVwPEgjpnP2NWF7u7h1QbtpB/nNqSpNbGnnzidGY2jxOKA5IkrIJopAPcxcfVkDjMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNvhQc5B; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNvhQc5B"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so2760685e9.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 19:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775096426; x=1775701226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cd/iu/aYoTfiHEl0xBfUrFFloW9Th3t3xU+FRrPDwNE=;
        b=FNvhQc5B0w74VMgDKD6kxXTw2FglG9b3mATR4ZFwxrzvgZcZbi/+u0VYTFTQq4en0x
         9YrePKVBHkiv6YScy2xqaCRWstBo0P2Sxe7F7zDyC6F2w/vBFKIQSR7O/ARGxO/vW1b/
         YQ3sTvMGW4kwqpNJOd6g7i+q5+9MGa+QGPz+IqyQmJjBQAjk/CmpR1GQ0f9MPsuWs8cB
         iP0dMsGDVJoz2Sg0Q9xquB/OCBkWAYzYU4dcAGWOW/gbPrWB5fubM42lDHlkIo7FKByR
         zGgUJHaW0vEMz7Q/aSotJUjMoyghg50V4AHlQSO2K/pR0Bx9BindNkhPfyh2ISAURcEf
         ybAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096426; x=1775701226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cd/iu/aYoTfiHEl0xBfUrFFloW9Th3t3xU+FRrPDwNE=;
        b=R6eYWKu+WEO0Fus085dYGAaejhla+Xo1JysHp0xeTbO1I2/UFu3XF5f6wow8JqXCqZ
         RqxGZxgq4PPsEKf9iihPKrTshxX5bB+gwAWBcnn4KlbqPzVSQoYQCBAsfVtYt5V3O8Cu
         +H18DMPwjXJzDjFf5iWMz4C1DKM9rOXFuLQBAzFyLFtv+ijgoEgpvivJFhBJAuLLcPVS
         3CrRv0Z43KAajxbbW+uAx/vv3GOUKyTA3HttkS/Ix6vr5guDYULRFPHiFKFNzY0lB103
         rq5k7HtsYWt2ZeysOv5tu/3YokVB38R6Ax4NlVotHH023je2jaFqrnOVagTEDoKjOd6d
         MVRg==
X-Forwarded-Encrypted: i=1; AJvYcCUPpVze48MwvNQMK84riIaHbBaP2ESWg5Mq7ILxNydKIr3XbHNWvVL4TGlcFzX0p7vswmJOoEUFrVuw@vger.kernel.org
X-Gm-Message-State: AOJu0YwQlaZcbR5txb8svGXiLGMLQlFx4ULYDNVsCT6FW+vBCrGIMgTd
	gXjzsshmSJrKJdW7Cuu7rcaWmoXepDmP21BNz5kZR/O///37Z4CkVdOjnlWJSDbyX+s=
X-Gm-Gg: ATEYQzzJ2vK4kFKQadzRAOk296BBoIklEgnNOR0lA74uqz9JdWj31jV//VcDGurfPX2
	wbN5+ARaWuQnEqbEcihEdJwbk04tb0kFXZ0umsAhj1K7yxYgJ4sX9v8a4wYjWckpV5fXaU7tsQS
	LqjF32FUweS5vgBOd6iMXqw2m46CAFuPMQW7pd2Neis0OFSHOMq39r6kJqEcFI7t4cZof5JlJRn
	OEf9kzehutCaNCe64966QMfRvXNf7qspWm8w37RSakh2t0hmezHMkjiuRUfmIkqD7V7d0n0/ILk
	nzMqkpSvsSkwuv3mEW+uAwAF6F6NPJ5sNxmciz49w3vJFQLPWsXmjogNGyCOy6AQDE54raW8/et
	9gLzM4SXIfMcQ5GsAki8t9VIdn2E/GAjujp/drkshnKAioyO5n0PA2KWasEPpG0KmUsh1kpco3d
	UQS0Ga+EiacScIoyUOdG/xsxb6e+NziaNEEishDLIWzGPSocXraJ+SFYLvsvTNcpzfQgJtUDDNm
	MWxb/B+sCg66Z4Z
X-Received: by 2002:a05:600c:3421:b0:488:869c:eda1 with SMTP id 5b1f17b1804b1-488869cef18mr45133425e9.15.1775096426011;
        Wed, 01 Apr 2026 19:20:26 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aacb88fsm56379725e9.2.2026.04.01.19.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:20:24 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 02 Apr 2026 03:20:14 +0100
Subject: [PATCH v2 1/3] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-exynos850-ap2apm-mailbox-v2-1-ca5ffdff99d4@linaro.org>
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Document support for a mailbox present on Exynos850-based platforms.
The registers offsets are different from gs101 mailbox, but the
workflow is similar, hence new compatible.

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

