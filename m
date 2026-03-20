Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601B036D500
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 21:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041324; cv=none; b=IptxwafvHuoOHkiL6RkJ9h0DZf3v4GTZkkVm+Gaf0j9qYbnNekLiwEcknxSfeszfvbMLEAEEpAZY0Ne5VRLO2Bkr8X5ZqzPQmYk1CJIm3iC4O8b7KJJR7D7W7jl7NvoKvwpCVzNJMaTiWx2ZYUpsUsPVJNGkGuYbDVBcBF9JeHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041324; c=relaxed/simple;
	bh=tORFLLP5Z3xE+++LHG+od0OJITEzcIAfc8OUfQm3olw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nnzVztu7oOG2DUhNaoSP5HKNP22hQUaXuerB8XMsasWos/s0qkQCJ8OIjmA0yeZxnTLU3huhzStqiZAYR2CKXvHshDgqDK673Ou1UwLuPOBxRK6YRvL/djdXKMtgi/tsL11VvmDL4oKHBmUD22gW3zeVRZ4sPW2lBJKabhgSexc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GZcujz17; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GZcujz17"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b49819938so583637f8f.0
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 14:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041321; x=1774646121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MPb6MVQqXHQI6kKZUWd24slmi84GBPiHvGvXcVqCJw=;
        b=GZcujz17vGvOmlznudcNKkx5oG0QauWBtI7sFBTY4Ohf3TvlyAeImWXXaKFCe2Yt1F
         wxHcq/7nZHjw+3gVSxFtfDZhwGDKZKYCxPBCyoZBmBTvFbBmXCSq4/YquEEOHF04BwSe
         gjQuXs7eomJ85Vn0FBGB5lj9B9WbXLiazT0/2QdSAorW/mdxZFX531PMAcyCtzSY+PYo
         bhkVAaAfqSP0NnI6dyThtQLU81HwIxuy8FI2MCxq2IF5v130SxpGNlGKFzdHC81c1/tA
         kiW+bb7HO0IFEoQ7QTcTym4DxGwZC/6/cb0inqMYx0U/+h+vcFkJDqbNrvJ0cnzkObyZ
         MwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041321; x=1774646121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3MPb6MVQqXHQI6kKZUWd24slmi84GBPiHvGvXcVqCJw=;
        b=sc7oty61cJffLgu8YD5v+lNuq/RUU9ahM7xn4WtM4RMK21Zhp/Lb/HlNWJhg3G5ldh
         YbkXSTBvGZVx8GPSbYlVBufbTH0tFTx0uRuNxoIJaYTmFw20/+DI6X40GG1qaLKXlD4L
         3iGGcKPeOsFMM3H3ep7nhh6g0ODsvq4Y4bMu2j57USjQcCUparJPG0fH0HJxugGzE0H2
         4nSTNq0n9g2M29qv2pLzvHSZakViGBoKVYSyJvPkIOyYdIQOwqf38UiVb40Q1q8ezKms
         G0N7Z59EJRxl41+/U7I3khXIaDGnZ5Oq++1hJLRURmDCckL8mcCRcT/8bIGiumP3z4iC
         S0sw==
X-Forwarded-Encrypted: i=1; AJvYcCUOQV4golOSeC0YN4DB+n3VOBnFs9wagwOYzOA9vtCncvwIAugRIsqQaKScBtvd+Y1Ur3r6iJ2moKua@vger.kernel.org
X-Gm-Message-State: AOJu0YzMA+fWq0Zg7B04ySyhxOZpiw+IYgUIyL5kDl0AwWQO0aQtKB6z
	FpU2VK69fdIqHvaEyb/FcEJ3j0ueznJ9jNfOoVI/SbClI4TetycidjJfK23RE6aof9Q=
X-Gm-Gg: ATEYQzwVvMxlMfMdebptKZh097VFsdqeVqdwertNXZGlD8e8Gwi67JMrh+88EIJjWQk
	RXNm9X0ERG7HA/7FEvGx9GjUvF8rXxi05eCl71dQX7oF7pKXUABW2iCPhMqgyV7BFptTkPnogrl
	AxYwf4RRO3wTItZHrVrlHj74EX7p/QTi8n0/zH8pUXSgM4pcmjrP6HgHZN1dgpsIodfhjEMcTvS
	70C0jczlZEKQzJVgYdbFd3aqj+s9CTzhvAl+0XI9wgM8LIUgjNBe1F84CRInmGXGTqHX+vokXia
	54ArWDjXslZ1Dcw8670vNKj9Zzc29OdNoasODJkOfo6uaRO+NNj/xHvjgMAfb2hLz3U5pt+AzUu
	+A5/n6dy0BZWcR6aBbCOrWPIX2QPpJAYexhM8WlSFNmYhFTU+IYTKxqf12nEOBFFjpdv4dli3Al
	V1sBXGh7ds7hnGGzkFlVpXrtn7lOgYSlSrm9VJA06BIZOfOGB/uyYR+s8q5/4Xfq/XXfoPQeTC0
	2fPcbD/f4Hktkw=
X-Received: by 2002:a05:6000:400f:b0:43b:50d6:4f04 with SMTP id ffacd0b85a97d-43b64281491mr7630137f8f.38.1774041320661;
        Fri, 20 Mar 2026 14:15:20 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:20 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:15 +0000
Subject: [PATCH 3/5] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-3-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
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
While at this, convert the compatibles selection to enum.

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

