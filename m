Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB1B3A5457
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 23:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778627541; cv=none; b=SzPlEFS9vb8nIpYrz2Dwj7SMFwP8EHux78hQ7WkRvdAFuLW/+5SellB4dekACgaiw0q42GkH5Skh+n/cVAq2NtgFts9tRSRj9ND0SVLiLQdZOU6ZNeah7+Q/FBxfvrelLELNjINrMQpHZnwNbL+WW9USxHt2mCfKIPAUE7EYoOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778627541; c=relaxed/simple;
	bh=MKDoKv+U4AbZ5taa+fSGH+o46ov1RsxI1vDLHg7S71U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Adn9iX2PHhSQ+NiEKSA7IOzPKo3/Ttznqz0C85hL85zhH+r/NOReB514NiqMyddnhBqnJOKxFUGCYmid3gSqxrayyWUpgBJOADi67N6A5oRp/gvCFRfJsP5OnG78ZuB2ydVXd67UZZZbrlftgvLF5Yp767PZzdMTJ3ckMFLKdTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bGb99TEr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bGb99TEr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so54577735e9.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 16:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778627538; x=1779232338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgDS3ViE9NSujWIMzNrIZdzaFnZBEociQgn363+PsFA=;
        b=bGb99TErvYnJAEE9CwrFVthpUjf+F0/AAZyeZ2wvjOmEvI5WO057Fxm+CKIEDy6gSH
         ezhzxoTIk0T5TJYNySwJDlEsQz0TUgBdbJ07JH5QVg19TI2A1AVBjbqEGTypv38BbQES
         UjkTIMRmNOqu18pOltys/jVxi/vpwfVWfQoZlE3UlLvh5XdSNyan4dr9aZsjm8O7Ye6B
         sow+7owkyhcevy4lNVg8xGhmVgT5yKfHQXfR07U9+wH15ypkY4U5E58VTaNgUdynZUOD
         zYumoiPtFuh4hik4KKahc/QqvdwZLDx7bPoznrW4VEUBklksOU4mHrnTMEHrIYbnf1tP
         orxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778627538; x=1779232338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WgDS3ViE9NSujWIMzNrIZdzaFnZBEociQgn363+PsFA=;
        b=dlLcDXeon9DZwtYB97WN628/IDJoEdiaVeIMKkOGkor9qg0iEwqdbzc5uiTairGHha
         eRxUoBmGyDStgMY1j09hnsyu7htOStdM5n1DHM831ECZnJJgBXSp5QjcZ3c3y6B0IFhm
         n8xsu8ZV2DYUAb7sygXqFTTVplr6gLdH6i2+tCKHGPZ7YckmV5oufeSd7KeVTM+6zeoi
         K8Vjaqg7kn1KXOyf1prlyUALdBvYwl9TCv3iwldgZ6oZ5U0ZA7nrxiycfeBStwOXYZKn
         94cCs2DB4jO0iicBH2yEInLE+ETXYl7ikWsnZVBD1uBBOBEHvDoOwFJP/aMHJKKoUobn
         3pzA==
X-Forwarded-Encrypted: i=1; AFNElJ9jMqP3rp0CK5BhPWJRdZqWKASaBSI0QT8XLoJrA3K4n8D+a4HpqR48U8PQUVBjwOA3Nu66X3mgo/3P@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Qv41u6FTpOLNwF/4wN6eeoiRjEdLRlAL/XAPJPik4XtGRV23
	TWYYDA8EXOcaurEsNouJLAUJsUdgDAdD63UE3moZPe8QjBjxwsXbkg7nSDzkaKkd+EY=
X-Gm-Gg: Acq92OE5Bis+Bb1QG6HrfevqmsDGi6MtQ8ZzPvhHkpa41FGwdc7H1L3Q8VV78dmRy6d
	5KeLXd33iOc/9bjm3d62OQZKivHjwtgNjOyp9uObA3nA2DVxA+XwZ2WCGBlgU1x/CRY+/UPdlDO
	4teE7u3DXGZv459ltW9xWU5/HotgJhCYtuIZGHhbh/1TUooSkyvEhL72AWmonl87/WyAVVy424o
	mLlSAfF489PNUwF7jwLthQHqc4P377oD1d49ULvR5UfUPJLWUKtNG8Vn7f+lrTUCiLOTD/tulTU
	IcJVjRvMyHJumFbgYmUnkngVmOeTRf3aMRyQ5uSwTbMEhow//J/8DZf4bF/98AFDsyzqHvGrvxV
	gHZM/l5p3KLk8CxLfnQazFI0+jV3KS7v/xpzHw7Lo0e7xsq9UK59TLaG202w0XWHqTZ2GzWFkWR
	quDbWIdzBmXaLWIFBHcMJZB/R+kfcS0OqaOi1CPreNaXrtQ76NkVb3s6HoLdgQFN6Vl5nbPhXY6
	lbW8K+LuK3S00DM
X-Received: by 2002:a05:600c:3144:b0:48e:82af:d9 with SMTP id 5b1f17b1804b1-48fcea18dfbmr1307925e9.29.1778627538335;
        Tue, 12 May 2026 16:12:18 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e913469besm20712305e9.14.2026.05.12.16.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 16:12:17 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 00:12:11 +0100
Subject: [PATCH 1/2] dt-bindings: firmware: google,gs101-acpm-ipc: document
 Exynos850 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-acpm-firmware-support-v1-1-3858d097e433@linaro.org>
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
In-Reply-To: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

The Exynos850 SoC incorporates an APM co-processor. Communication with
this hardware block is done using the ACPM protocol, which handles IPC
messages for clocks, power, thermal management and PMIC control.

Dedicated compatible string is required for the Exynos850 because
its firmware utilizes a different initialisation data base offset
(0x7000) compared to the existing GS101 implementation (0xa000).

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index e68f9c3ca5e2..511c873280fe 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -22,7 +22,9 @@ description: |
 
 properties:
   compatible:
-    const: google,gs101-acpm-ipc
+    enum:
+      - google,gs101-acpm-ipc
+      - samsung,exynos850-acpm-ipc
 
   "#clock-cells":
     const: 1

-- 
2.51.0

