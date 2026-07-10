Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E2B407CED
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 22:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783723918; cv=none; b=U9nItsDyketspiG28GvpWVoGnp8YFpo4Rt5uKYSzH19in9C5lAjCGUGkPJzMbYHsXLvvr3YbIt80VMxDnumxWsQwDnrnqbMC1ouIKaItWtRAxJbmE97rHxZ3a/v8JUKiUqQR9sV93ZqGgHX+o3E/8EI3mCyyeyID1XkJIJOKcd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783723918; c=relaxed/simple;
	bh=V5fWst+0b6cKzAQMTeg3av2XEUe1OOXEPBymCJlGpMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5SsmZM/ZeI4KhTYdmLTNcsiXxvXksnG/2XgEknb0oHmNLglL7xLEgbIpsUCAdfAImOKCudbpmG5IEsZc9pEL8e/qAneyfpOosr3NXzwtZvRosSn3mA+xavnOjyRCiP79r/71gOK4Rdxe6i1IWeuki9DPJ1h7sFi1V4WK57MlBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=F3Yw4YmP; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="F3Yw4YmP"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb64085c45so877781a34.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783723916; x=1784328716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZdHmMmCay69oBUIlqzo1cr3jDiH7vEkdEbVbyYcLvkc=;
        b=F3Yw4YmPO/oRC806KwdCUiepWIT/WsywW8o7XVyU5TSUCH/ML5DOAZP/LnFx5ywAfk
         PmawXcYBNBfEe4iTVEKsMRN3HZFESQtl98FcAylIApTZtrTnFykpQ+X5s7wcdfBQpdqL
         NQ87oG7TnjIOZIuED0r5bN7HDoMWFZtW1LP7hzHZbTT4yPFqhHKBMMB9J30Ck19NVNP8
         C07WVPuqwkkRTwmP3k8o4jG/uQT9Cjfc+U3kTx4U6tzKLkLkHfXMxL/y7BqzAP+rpyzu
         yQbVkkmwySe7nnB+cEBgEeWRWrFRQihWX6gLUOfeik7fB5WiXOLE3AzjG4pjezsvyiED
         9b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783723916; x=1784328716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZdHmMmCay69oBUIlqzo1cr3jDiH7vEkdEbVbyYcLvkc=;
        b=E4EAKbxQMTRVG7AR6D832OjIloRCPC4fSWnKGi8es3sucK+NUdKB2iBKBsqtOIAl21
         E6Jv575LDGbzU91A+QmidLzXMw8NQ8syQXrUUSWo67QcEcZcpyRRkYPq5o/yaARnSHIy
         G1bSbWlEaFym9wrbNd+ERk7wwsl+c9K8KJCfTefGkXNSazE1kqjuUZAY6OfLFS4caQe7
         8clWRNzij3tOQNgCt6/uA5DgYtLIGMdydh8JYUxC8qHKN9P5tpOhWeuz+WmQ/MCPRDiH
         GTFvGtRcFD0TxVGOtoGQNGzPVXbYwRSMZnOgYMzP5SR0fL1MabZ3X9+xM6KA4gfyeXoi
         zIPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cpxJfoKvkiJvX9OBBwHv4jrieTx6OdUfxqeJgGFeSUk/RaP3A//qwUmNA4UamHadAAcA4DXHUB9Kw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy66k7yWNiFBgQCePOtRMlZWhulnSbzJu9fVEe3bifwpxt469wM
	obtcHFxXD5uZH1yHjhTx5cdzZswzK/BaLKTqdmwtDcMD2XxNZhqOmoUQqJJdC9LLFCA=
X-Gm-Gg: AfdE7cloW7l0ktjG/0gbv9RDrRwchUtrdVUkM3Ix5Dk4iTKkWLLxddI0cttplW2fEf7
	5qSEZ/GzIodvOB4o0/n+xSYn5gagF590Us7ft5bXVgoum46EEpPxbPjtSo4MnErfiiBINS5RgOa
	4HWAAP7f6Q4jk4OGLRqHO23Q89j+eWeRxdFqtigG2JXFpYkt6uifcigPVhp24Fa2un38Yb/5IFB
	Oml7DoT2MDScrFh7NWcwedC37q3gYEIVQcyHK2X1U4L+t4NSAUwKzEzKsU5hHGg41yKf/viSvR0
	ImzpXPWFCvXX0iivVRpG+p10Q47Wj4xecR5z0SpWlkjfPMsKWZ1B2+4sqELKLSI5JS6ZE0Nah+R
	i+Y/mW46j4ZwOoZjLhmohP93STA52HmdLUcky4EDCswY28xhWI8cZQt8mpEfFFOUZqKji55sG8L
	lAYedbLhz4w9RQW4k8
X-Received: by 2002:a05:6820:168e:b0:6a3:1556:7a5f with SMTP id 006d021491bc7-6a39a8281ffmr740962eaf.58.1783723915693;
        Fri, 10 Jul 2026 15:51:55 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:1b03:95c:fbd4:4d00])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcae177c5sm7613512a34.5.2026.07.10.15.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 15:51:55 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Fri, 10 Jul 2026 17:50:37 -0500
Subject: [PATCH v3 4/8] dt-bindings: iio: adc: add input-chopping property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-iio-adc-ti-ads122c14-v3-4-746d52cbf1d0@baylibre.com>
References: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
In-Reply-To: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, Nguyen Minh Tien <zizuzacker@gmail.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=V5fWst+0b6cKzAQMTeg3av2XEUe1OOXEPBymCJlGpMY=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqUXdfr2AfRGcSbBQp9gUXYSLRFDFyW0fGGy15Y
 yaW1INWfA6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCalF3XwAKCRDCzCAB/wGP
 wB2oB/kBa75gl9Cpb8iM7Otl174qGVgR1fEOu4WEFz0tndxfU5yGdiEjyLPXO0VHTndYtBQIsia
 Z8Ym7lTpzSNazYMXGXOt3qhA7v32qGPu246eA/9Stz9/O3CzPtEkuNbWr7hZsgsKJXIjJhqvewm
 N7FAuu6YrhUPFyWdgJmNXjbnbn9B6AgRwCKQOUMRR/nnTRb1DtkqZ6aTgB78Fifwrd/+wMk9yYp
 /gj5+kCJNsAP0YFaKLYVICfa3FRBg+LoCo4cBczAdFW34CuKRMWqnrR7LafQN+IoUFpiVoTWML5
 KzvIXG5vyC3OVik8HqY0wE5zH54qnduPtoPbocJeSskmizgE
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add a generic input-chopping property to adc.yaml. This is a feature
seen frequently in ADCs that are designed to measure resistive loads,
such as RTDs and strain gauges. Enabling this can reduce offset errors
by swapping the positive and negative input channels on every other
conversion. This can have side-effects in timing and filter response, so
it is not always desirable to enable this feature in some applications.
Therefore, it is best to make this a property that can be enabled or
disabled in the device tree.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
v3 changes:
* Renamed property to input-chopping to reflect more common terminology.
* Removed "allowed" from the description.
* Extended description to explain when it should not be used.

v2 changes:
* New patch.
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index 308857f11220..c408feebd46d 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -80,6 +80,14 @@ properties:
       ADCs usually allow choosing between internal reference sources or a pair
       of external pins.
 
+  input-chopping:
+    type: boolean
+    description:
+      If set, the positive and negative input channels are swapped on every
+      other conversion to reduce offset error. This generally comes at the
+      expense of added settling time between conversions, so should be omitted
+      on systems with high-frequency signals or high data rate requirements.
+
   excitation-channels:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description:

-- 
2.43.0

