Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4694756B8
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784820602; cv=none; b=ItrlAJOKcXpGf8dvyCJE+32bPu2C37RT3fnRnGNdzu6GjJq4lkvMgdIuhaXmwKj0q+p9AZNvv/B4UmrIGy3/60WwOSHsUZTAVKLIbVjqXR6kpn+DFrP71MUn7LiApRPgWT1ltXCfQnpUfhAQ2TbGBGff+kGidIhKjF6GYuHlSeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784820602; c=relaxed/simple;
	bh=jwiBqgpS72CTHm9lXAG2OLJMZUi4KFI68Q4tUffnH/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EITW8H4BnpDRdWNZZYnJR8xVZoShKzbyIgK1zFzs1DN+1ONWV6TFeoOs0lWIQ9MRq+ta9n5AiXlw/oR5bG6IScGUHqGSqlk86Pg8WIc6RjzcTT6d/K1FazXgn9fqaEp9gbXES2+OYeOYp2VgyqNWAvNbAjgd23+SYNOc0A1ooYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tkQjpw0P; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tkQjpw0P"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so5826675e9.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784820594; x=1785425394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvvA47yK9RFkS+3kJ0N4nXWgy3089ah7H4jN9EcLvHQ=;
        b=tkQjpw0P7lyU9bNmNHmDI20/+bNOME+KN7wW1i2eVaFDXe+ps7DAvH+7x1w6A31Hbo
         Ug/qS6eQCY73P3UIp25YjLOMdsmkRqMfpuHRh0kLs4AiFZ/1XgJbTISL5C4IC6jEP8Vv
         yNPp5cfT/f769aPZ8QAXDFF/Xe7WdIGp2YhN+dUncNGyk/PKJgoBTQ5A9Hj/JrZxaTY/
         YvGS+tpNB/r6fv89Jox8k+dYjqEsXhODRxXO0HOF9Do28gErpKnhHhCXMA2VfLqkMeqD
         4hwNGyAmoziO0K2Fx8iGBMN579vmGtA+kWyzk9A+6aWQ6tQEJ80M0kpSTSI8wEEW9YU3
         t3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820594; x=1785425394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvvA47yK9RFkS+3kJ0N4nXWgy3089ah7H4jN9EcLvHQ=;
        b=s2xmcOlIEa8i97vJ/uMIGj5eSytLURaSdsX3IIyX4IaIUZNO5Alh4yDXoJyHyQio21
         TFxKpJsn8VEvhP1v8ncNmOz7go2uX2NMhwnvjZzxOyDjRiONrBI564rYC1e/JN4w8Wz8
         WaKZkr5yms/CCDWMs+paEStWrf/MLhQlBdWUhPCaPI8QxbVX7o4oPr2oKrYfi8C0yiy5
         Kd5b1Rd+AC75N5lM1vp0c9AB4722CRKo0o4qbNYKbxZCwytzyPwjy9jMsDct+KML8pGm
         ndCwOWD9bZuUWvX4me1jDN3yOkIlvYLTis2XA0dh7JLR8E6vfGbfM9pjX1nZnyBIzHD3
         Oj4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrYFNsXKi+xAiTMz0Gvf0X6QuHupcA6xsgvpGtb2xGPWjakNqvHLJT7o0/ZbjumdwyNOosOo7/4j4Pv@vger.kernel.org
X-Gm-Message-State: AOJu0YxYrmbvXM40dNhOIj5E9zZBg0NM/uB/Xuf5LNTwAYiPEkW75e5Y
	VHBogMb5DOQ4v2v1bYJz691DLxuFVTg0Rq2Ybre+n/cTqgzVx/uDgZIrIz+Xs1DzYNQ=
X-Gm-Gg: AR+sD12Zrb+dGhO70sp82PicnDi/MF+jUDQZX6XH4C5/4W876ZYZ1TLPXoQfyG6wUQY
	Ajv/x+rpxLXYygoeouMZVO8eOoRaPcYUakC2J3F5u75b7hsdNWAIpUBK3Sxh+QAJYCLomZSL4qE
	r46UbHICO5E+I0f0Mj6mtdZrWonT8t/Ehgp4GqtXEwBkIeioTZPqeBYrWLEJqk6beDumvygH9i4
	S3TXyvH16X9Hm/QiY5TSvPtXpzfclzdc+NSulaEvCZ2IujAhDgxoXcFJKppjlMVGjxtSIe67aXX
	EMGmSnPreM5unuw5Ot/iz7pbEPZAeDZi8Z0Ub+nlHFo82jq0HDfr5cKBOpvCcxTdbvQOxU4Z/uR
	LGVBtRKXFO5lfR1GMKq0eymg+nyDIlXiS5jApCblvyZlfSxEe6rWTdcJuo4CiU8teyKc8VqZ+2z
	04z2TaY4DXVU8N+iyvKXa0UPxyZy6DwcSx6I8wEd8QxukK/IdBCWrPaYqgnYVFNNJW0Q==
X-Received: by 2002:a05:600c:654b:b0:495:5375:2510 with SMTP id 5b1f17b1804b1-49573cff63dmr26167785e9.24.1784820594260;
        Thu, 23 Jul 2026 08:29:54 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49574653f83sm36952525e9.0.2026.07.23.08.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:29:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 23 Jul 2026 16:29:47 +0100
Subject: [PATCH v2 2/2] arm64: dts: exynos850: Add acpm SRAM node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-exynos850_sram-v2-2-c94968e52f42@linaro.org>
References: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
In-Reply-To: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information and configuration data. Add the SRAM node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..9a8d92aae9a8 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -917,6 +917,11 @@ spi_2: spi@11d20000 {
 			};
 		};
 	};
+
+	apm_sram: sram@2039000 {
+		compatible = "samsung,exynos850-acpm-sram";
+		reg = <0x0 0x2039000 0x40000>;
+	};
 };
 
 #include "exynos850-pinctrl.dtsi"

-- 
2.51.0

