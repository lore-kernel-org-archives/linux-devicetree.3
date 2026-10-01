Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5A0393DC7
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 03:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790824158; cv=none; b=ud7NRC/OGvTSbt7JSoSpwKMdkn06VM9s5808TTG2qYAFh4/mTWAlOCgrJ88pW6Bd1PNFN8yP7j7DQFJwKlxgd9cqOr00Jv5EJuM5ZnDqfPwzpfwBV4MJ70xm6X9JtX9ZtM+/9O9oh1KhZtKl0DQqzQRPwb+z5yGg9vp5vWWvfj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790824158; c=relaxed/simple;
	bh=+Y6ho4fGnS+OOcq2D1geI15LucrZk6rDnmXB/fX3KrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lvy2IUWD/JzjLdhYhJXScAPZnIkwO5hT/jVMdqOpFGSMTVALoNVN83v/xbbzjCBnqABy8TpbfoPEyku+e6fQ1tqyr4AIo4akmrGUDQAgRP60EBw7XCcDYGwAnddF732uxD9F40hx+aaslMHZUVXtnbjEuV55hXbittNeR8IlHGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q1mgWLsw; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q1mgWLsw"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso29935545e9.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 20:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790824155; x=1791428955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s1xaYOvgfuKPDqlqGi9mu0d7G4P5AdYn7w9BHWtqREA=;
        b=q1mgWLswOInuXiNLP0e8ys1PsHWWvwHaN4g6NgR5w8haqpvYG4dwewdJ/8YAezYMX3
         7imKNw6VOlRE/VNdeRPVvK2l5uZ8Qq27pC6RnghT/25ms6uumvVHuddUJVGpNE8ctYAF
         arA0GOySYndWA2vRcWifXyK/3t0oNpFEEpSK+F+WXg1WUf4RJlzmLnm8hIGJ0AAKTyTt
         LvYnnwmsorcBl1+C8blDmeMYhTRANuhlVaNIlBYF3newTx+wtcpPU8UVmbyAzF3qm6+d
         wa5d0ki5qngFYLjdNG5AjXIkeO3XUPkCkyRnmulQ5nGTstANT3lshGQdYAH3bHBLoQ3J
         m07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790824155; x=1791428955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s1xaYOvgfuKPDqlqGi9mu0d7G4P5AdYn7w9BHWtqREA=;
        b=DDTinfbp126yBgSAUQKLvzcGjH3Yxtb0m9oGlEu93BgQaVLNiVINBrFSA8ebZ2Jg0g
         1Ksw4IENdmnTxb+KGNOIqiossADtWVg4dzCpv+1AcxCfJ8gfozXwCm6WD1EnHSZETwtL
         ieulvB0caTJbXkur82nAjDdoeGkR53lp64CNSlKQp4Z8X1N0EqTnLsWpRfFl3FBNMcqS
         x77r34HLBbNr08ucXiUbbvVf2LRB+Hojt8FFOpTY1WjeLnVjG7Ipj5qFyX0xtapX9cDM
         /9lwQgvwOvZYtI/p5cotEw5Rs/BmGByLGwBx7QsgKEQtXBsqAUzMGTLETYv6skScUDAo
         5x5A==
X-Forwarded-Encrypted: i=1; AKwUvBwWm6/Q7MqE2R+FDz+m8BBaPdGfIVo5+iPuQzRzA+/ZX5kYTeI4r7owQKcaMcFCVuzH3NcltkTIzmkA@vger.kernel.org
X-Gm-Message-State: AFuF++laBk6w9aWB364Nv4BmEfu0lJFD04UMud8UEBqAYdK3V1zcZ/zC
	Q/7P0uck1SpXc0J8nIxxfioHcfD5V8hJg8i8SDIMuCLK169YmRHhWI+9b6OYDy5ft0I=
X-Gm-Gg: AYBFou0eOmDQC/L6okdlJr+Xs8hkNVDthgSnjH5Gbqw+oM+qfa3ys8A/tKPooEO7OUA
	neX3zgM02xCKvWcN1wFb64Fq35is62oho0FE87mZFw1tszQxCsyJY8H9TK8j8irfWBgH92eeW7P
	lCK1CiPCD0GqMlk22X/ZgEn17fHdglC6RCFlqr0upN7haxcNZidHt5cvMWOaEYBkU1erkzMVyxC
	L/mO0kGpEStSczISHOfvnJ6E5WbLTugjPO7MKoRHp0w6OI1n5qppMvDTZ5jv3Q1IZHxUqy5pA/h
	GQ1No50Ha4iaw031nv0P+q3hqcTV/pmtP7HhpYUhSDP4ebR5WU1Vvhpuowc5kMzqbBOdcs8Uahd
	gahaXsIlcI6pGOJlfRmzS3Jkj6Pd4LoFHvqljR8RxS6rXGeDshqegYJ7xbA/3A4G3nYtn0/IfLp
	YAAeec+0AesVqK/snfn0ncMvnsTc6LU6nYDnZDXYMYsEn2V1Z2MjwdXOFLwKWG1dyMRcm2vskTq
	UhBqV+l1fNtCSDT+qXQidcR893sd1APCUf3HGe4txvBSJJjqUE6SHi04UQMJg==
X-Received: by 2002:a05:600c:3548:b0:4a0:8f:7e42 with SMTP id 5b1f17b1804b1-4a01affad8amr46885985e9.13.1790824155497;
        Wed, 30 Sep 2026 20:09:15 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9145e6sm27091885e9.5.2026.09.30.20.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:09:15 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 01 Oct 2026 04:09:12 +0100
Subject: [PATCH 1/4] dt-bindings: iio: adc: samsung,exynos: Add Exynos850
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-exynos850_adc-v1-1-791b3516bb9d@linaro.org>
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

The Exynos850 SoC contains an ADC block within the CMGP block.
While similar to existing Exynos ADC v2 blocks, its data register is
located at a different base offset (0x08) hence a new compatible.

Add "samsung,exynos850-adc" to the devicetree bindings to differentiate
it from existing Exynos ADC variants.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
index def879f6ed20..90a220e3b78d 100644
--- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
@@ -18,6 +18,7 @@ properties:
           - samsung,exynos3250-adc
           - samsung,exynos4212-adc                # Exynos4212 and Exynos4412
           - samsung,exynos7-adc
+          - samsung,exynos850-adc
           - samsung,s3c6410-adc
           - samsung,s5pv210-adc
       - items:

-- 
2.51.0

