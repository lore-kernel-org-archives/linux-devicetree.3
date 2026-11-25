Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616622;
	b=WW6hwJdS7fD88NIZ0SENES5R/ZZkp9799IggP38+GiGZdvs6X1udfYjb+k3H+gUkZ3HH
	 mU8NO1dIN5QbvL8BMFmfIfqCKEHTyebGQC2lbmNkN6KGeD+BR15p2pIXlSjZoXFX/zcRU
	 NQvxKdKqWN/st+yucPL+Zx9L+Qb+M42MEm+3UTVuJODu72G5Utvpus4gDnhBDIxJ8b4Tl
	 YVccoKHfpDJgitbmUEKVr++JuPZvuhleXdHOwdvvey7ve9eBUq1colAqNdYKEDNXJoYKB
	 X2cw8+eusqsa4rFYF3m06K/17/RSACVUvFQNgcvSsqB4zG39q1DUS/jW/nPFOYBETWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KKiLkuiHStesk5TE8OyB7f604YZ0z47hf89flcQlAyI=;
	b=RVGL9VHrGyWH/wjqFV8ymIK4c7y6BqWnM/fMO3k35q4oXu1SpnwayL2EtwABGFp7FCf1
	 zS4Gjymh4gkHL8sEkkfSIFWd3MlzHda6DE6J/2vcouhtUnvIDhTl7ICmVUs8MX+IRejyf
	 LGEdYdzKApGNVHx5vu4AexBz1LqYtC4PlPeUbODz2iNJPk3O8TeSFsUojuY6fGhSV25mw
	 q4XUSnvBcK+kDIacVHaBKlV8Zi037Zy4T4Rd7shGldhGcbxBZRty6EG0dP45Yajcddq7S
	 7cypxu+LJ3KCCiGxAHzOH+cfFxaX8wXIHwVal7t9MqAtdt67F0aYIvFNz0BvvwYfeuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="gg/btqQS";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9332E606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9332E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gg/btqQS
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so4769161f8f.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616621; x=1796221421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KKiLkuiHStesk5TE8OyB7f604YZ0z47hf89flcQlAyI=;
        b=gg/btqQS5JggZWL3TBR5DJZDXCrqBrKtiCDjEW3U1VgUBoIKe/l0584+imxrJZ3Qml
         GW+Z9qFJDUSQolFMA4ISs3sWUKXpeKX4V44CMTWwUCKE7KcjCoDktCxaEDL4ZXV3wjA5
         kLOVWN2tWPwrtu2uMg6xL7whDmSwfN9W1sOYybgw2bDqmm3K8EbEgaVPdn1jSJJ2NVkX
         ajq+L0ei0ME3Pf99yPOR31DhDDyp6wweFXm/hvGih1zNycY0kNpgKzhOVzHIrEsGyjIM
         YPJ8gzEZ83xabgHMKdMnKX3d6JDh5Bp6MF8ktuthl0nK+liF8D5D9xyjGKqmkHDqaWGu
         UMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616621; x=1796221421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKiLkuiHStesk5TE8OyB7f604YZ0z47hf89flcQlAyI=;
        b=1Jxiv4BtZXqfN8XhhGvJpXUBjj+Xk4SGuySJBP6SjSroF3mW3CzIkcIyzJIVHFKTl8
         GvvpsP40Lq4cIw3OjGfrzJDlN16+RUkCiSpekSR18CXYY2RYpRgd/6l4RtJyRQrfuqxu
         PFWBm5LJxmJBW1lStFiu1FSJc0nP/N6KJa0btQ+OAQGtbTSyzP0HbIdKuT5n+HFNJqiE
         wKFlT+4GtyTwXxQTSRQNKwxf7DviK435zUlCnSdAImHvY9rz79FQmS9hCOKCX2+JWTk1
         tMmH/RNmhfH6x16jkbgvyCPVSLwSW+yBsZfQmnasSLXhpFkk+X24rdwjXCIkdegGKBIh
         xTTA==
X-Forwarded-Encrypted: i=1; AL+hErGH2unAMrcZMNFEQSC3FtmfjisZZ89z4ocdEVhWvgiqsaB8viAEswjaz3vxk0fvsGQfugq2ej8dyfTV@vger.kernel.org
X-Gm-Message-State: APuU4Z9U+o5mQIU6zrwxid7+hlqemKJ0DipT9YEGxUkG74mVLNvNsrF8
	bxnfvQhVooZWDKtgdlhNL60tMs9K5plfu7pPtkb81wvKylIRDikQ18Icpryj4oj0KfI=
X-Gm-Gg: AZFdTZd2D6Lnb3kcLGEm2qFYA0GVB995YqzGxB2N8RkqX3V29LQEEyIdkS5HFaS4MHL
	cxKblSA9JoVbZuSQcWUBe/D1PveSxXXgV8sV5pfGlxO6QqsHT9qCnoJTLu1N/5otdx18iEjDXTZ
	dwYhAM2u9xDqR21UQK+bk2nMxLlf1tRPxuDGyR1yJisMJzyNbsPky463nFCoeeYBwcge27RZSUk
	qDih07qbpkzExE3AMrSegoB/Ds9wstiG0hSG7xRa4e9DD2kRLdt+fum/cgOqamTOlVqBRLmP+eL
	E2pvNCwB93RR+QH/lIplegXjyksWfbWn4I5hlbDHty4yYjm4NyocX+IMVUljLut0067C7ecNF3k
	ELwMj+5mvuUrdXuxlwzUz9Z+VbNHT2aN5LVORi3y9GPVPmRsycr0Fn+IxSm6AnX5rSJkm0tlZeU
	Mxmc+0eUWOHoToy7Zghrrb+I77qTshK0lB1tOTpK1bvvdlPahQlpuBR0rLy4Lwa/3srv/f09SkS
	926ghrD7axDtC52ZKBCchrkALQHzEKknPXnIlCPTLwUQxBsKxEQDQWor5pg/qQY19ObTQOZMFCl
	BsPTslCeCmEi9yJ0IYg20cZjWJnowKPU5Br+Elbx3F8/VkHBuiMui4lxOUh/4Xq96cKmXT4Dut0
	jPCoeknlLf/igIsglLYgFLw==
X-Received: by 2002:a05:6000:41d2:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-4abb0c5d65amr34428066f8f.18.1795616620901;
        Wed, 25 Nov 2026 06:23:40 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:40 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Nov 2026 14:23:33 +0000
Subject: [PATCH v2 1/5] dt-bindings: iio: adc: samsung,exynos: Add
 Exynos850 compatible
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-exynos850_adc-v2-1-26de1c6f1717@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
In-Reply-To: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 Sam Protsenko <joe.skb7@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3

The Exynos850 SoC contains an ADC block within the CMGP block.
While similar to existing Exynos ADC v2 blocks, its data register is
located at a different base offset (0x08) hence a new compatible.

Add "samsung,exynos850-adc" to the devicetree bindings to differentiate
it from existing Exynos ADC variants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
2.53.0

