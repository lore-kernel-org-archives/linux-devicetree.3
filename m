Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793215131;
	b=5UJcX1qq+mNRjSmC10T/MJoLbEADiFlteonTJNs1VNfNVIKS8wC2Xk8G9xElj3vYGtHK
	 pJEUAE6OdeklEGchAme3L/ZQbHbPyogkL3xaIZpaE/h0mXWJlOFSihEZIm/aTzD05VUMp
	 71odw0yCg7/CqrbF8WNjXl1/Li7wS+LOSuoz0FgfVUt+EEJ2IqLe+rPmyzpFDjrSBSSBn
	 t89KUX4GX5nDh55FTlfaFwMMv2e6nOWCW4Kh19l52MfyWkIOSVKMxKeKir4njgkVmTjTu
	 cfOP0/akZ8XoEPGoRIKf5l0CMYKC/6WwYfy0yNAThXPXFbnwDOQIMjDEMS9mPJ2MFtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6vZ6om9FYtHLuxxt/jURe4tARN2iOgMfaZorU75wv6Q=;
	b=cZbgL1+ctZTI7f9ZHEEYpKNTliiIhW3gdf4bNTy0F4fIHZLYIh6vZeu7BLelaX+wTNF7
	 T1mBm+7k5iySe/kmJWblcUPm4nch63dyvJ0uIuBQyvCWysIUAckEj2CB19hHAbR6A2UuL
	 gR9FS45kRbEd3G+bxUCTJUL6dqCbnTaeXlSzDlBknY/cxdGqUvl174sYFdli3CEB7zG5n
	 S42Hv79w91tOU0nq6z1I/Sl7qHO2Sj9VohLoKoMCdGhmFqETNPAeZFvG2J9JO/vlxVbql
	 moKIWLEidj6yK4/4jRYagJVZCfHf1Hdw12eb8TWnDbwJb8J0ND+AW3JQlpe7K5zx4Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+RuMQEl;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEA9606A32E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 19:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FEA9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+RuMQEl
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a71d0c4233so653097fac.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793215130; x=1793819930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vZ6om9FYtHLuxxt/jURe4tARN2iOgMfaZorU75wv6Q=;
        b=J+RuMQEl+CDTv1rs2v9if+ss4fqRXbOFUOBe2GhOpXnYmU7dtUpjkqOcgPbWfcEwsc
         2xzL4Imz6fjBvp2J477zmWlEOZH6B/DAz+NKXHPQC+Rspn5nAQDRZICCmEmsZ6Pn7Ynr
         cIwMSU1jE926r8CMKTJvIfv9Ga2Y50fEREkdeVEl3pLHRaMjjpflA8cGuFrvoOL75JHh
         xfpk1o0RRm0eMi5kPKOe8qTawIUCfqpA/WT0b6bOKco5C25TzEAfTsfd9ldF62YfiqYk
         7yECTGl5T68dL//nguthVLe5tM02V5NrTOallrtKk6xukvgJvDQ3plPQrdR8nN612JOg
         zC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793215130; x=1793819930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vZ6om9FYtHLuxxt/jURe4tARN2iOgMfaZorU75wv6Q=;
        b=Q87apwtN2VA5zj2M/TwfjkoPEgeg/5MfcpWyGloFIQPW6zABDwNe/HM6xkxjv8G0Ek
         G2iSTJsX6Lf98uWfmkef6Ney3yEgSdEJgx/rSEXMWpma/2FjShr2GYpCyPQuPihd79+k
         FCpCI71UH+AEgrgJCPJPzJwuCYL7i1HzCW52i2A07Z/MzCn5nBA/MGa7GjoSVX3fkQs+
         bm6srbgHNY9wVQKsu84+X67egpaObJG50AzYmfXWCXAEsVUlmqUkJXgSIreA8gNPAfUj
         WwCMmm+FGyaUwx6ykWioqCF3MDLncyDfMJxXxTXLoVwmhDw1/kqDxhOA0vAY8Z9ZoQYH
         iPMg==
X-Forwarded-Encrypted: i=1; AKwUvBxSswWUmjRu5UhLSvDEXKLhwxqjQjza/qIm7SvKINFRDDX2r6kA3xqGHD69+bAaazzBAWGylK2dEsZC@vger.kernel.org
X-Gm-Message-State: AFq9FYK2n89L1YbhFhmeUMpoxW9thLoAoHKSLboBXPST63o3Th+i0xz6
	vkPlCRz9uJhhrCvPn4mzmK9EfCjgjvYdmc8g0NgCuy3G2Dt5TR4Ti5V0
X-Gm-Gg: AYBFou14+8e/7iBkGF3LPboKsj2gJsWyBbvi3QUcdUJe6VOIt3T3sGWJm3bc2yryh5I
	33ygF5yenRoBaFUsTYB6w2dzG8xToc7jbYPzWqTAQmdevymEvpH/9aZ5jCnRlGySTsPHMpGNZeo
	t+sVY7z7NqrIcIyuCtnv9DO6svQghNHU3oM0a3teGGBYINGYSWCUyXT+xW2v+6aOaFN2QZxPVxT
	srg+graDbyoajJ44+ARfFKs1ogujXq8esJGID4+QJioVrK0o5QFA9yv7DALlH3iBn3571ONQc6e
	m1cvPPV7BVcFsmhBmrxv0uWpBH+padEWgTqKi5bpBjCzZ+yLFfCnJxAiFytQbZQhreUJ07ND4HO
	qdQJC9yDHLSurT9zfv0rdPE92JP2IfnwFADNN8uSL9TxsiChglw3GICYMnuXi8PdUFNfxVJcWGC
	tSoG/P65zi91seHIoyk5gA1fQX+3VT8dlGitxvODP/4wvm6gR8KM7wfWz18SZ7f56Ok6YYpIbEZ
	QycFfGBz3T07S0blPSlQV4czWZg6qp6I/iI/I7M397gwP8VV8cAd1/bF91A8nKayZkIbCsJZpl+
	WzDX3IDnifhJAPJgMOiar7CnUlmaH7rtBEIOPp9l9EaRaeucb+gd3O7E2g==
X-Received: by 2002:a05:6870:f114:b0:49e:7c51:3b19 with SMTP id 586e51a60fabf-4a8bbb059c3mr2712734fac.48.1793215130440;
        Wed, 28 Oct 2026 12:18:50 -0700 (PDT)
Received: from jeffmr.mynetworksettings.com ([2600:1014:a112:1526:f26:718f:8dc1:b185])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b785d108sm3092916fac.9.2026.10.28.12.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:18:50 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Date: Wed, 28 Oct 2026 14:17:59 -0500
Message-ID: <20261028191800.27829-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028191800.27829-1-jeff.roach0@gmail.com>
References: <20261028191800.27829-1-jeff.roach0@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
(Snapdragon X2 Elite, 12 cores) SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..4dd57e8663 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
 
       - items:
           - enum:
+              - hp,omnibook-x16-cp1
               - qcom,mahua-crd
           - const: qcom,mahua
 
-- 
2.55.0

