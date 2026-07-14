Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA48432E73
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784071369; cv=none; b=H2jFbIl1EsK9C2iy/4lAbwFxOFVEpZMOnoStivkr77hNDCuMceEvlkZ9fhSf67lLxGPqv+VbDsh5SLYpW65NMQJH1Dv+/g1O+1Yi250u5SjYh0pLZ8mf9BSQG1D2kAOcpEneA7UwNbunETi4Xx+gtBT+dv2aSpm32XDn6HV0pFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784071369; c=relaxed/simple;
	bh=TfVJkaOJjR+FVvEc3u4C1RbJVpPaZ8OuJ8zPygdP9l0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XclUR9x26b6jVnH9gve5Wl0wBhEr6RfCebWhbs1xRFfo6HYMiSxMSUW46SgK7betGrHY2AG3x0Zo2e+nloUG+aD4rJKZAbQkE0GbVV9MFueG+lzKWnkexGNBxz9A2+nUvim5EfPQ0pz3wwHTXpfZkMiIhnyoj8xZ2vldbAjESCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=T1GT3o0c; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="T1GT3o0c"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6a1888969ddso2792547eaf.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 16:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784071354; x=1784676154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6toAopr8F8rTSSWjDWDH2rtjDknkrCnbrvnm6omNuY=;
        b=T1GT3o0c76FuNUkSFWHMuuPVTOfezivPGnTZlW+h0I6vLADo+HsiHDNYtpoAukeYlv
         4abpoHzayrS0SVJH4YCUUi4cizuEVV/C1YToev08hgrhwi5Ys0XwtKY9ClBoWtD9FLsH
         Bn1WFOgOko9md19FLM+fT40KwsAdBYFo+2vPTBjZIFEL0AfwALu2z5WSeFx1i+Gthqju
         ta+xDAF7oalrTDJ7FgJ0FM8yPFTWFtPjJaVDVRfL5xCcUMtefnYUV6EkKGQ/m8n0dHse
         G2YinPbmqJbll1TQp+pi6trd6t9/cGJoyoTgHC/mFCW8lcynU7OkT5BdgD0pX9lY46Kr
         4VFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784071354; x=1784676154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6toAopr8F8rTSSWjDWDH2rtjDknkrCnbrvnm6omNuY=;
        b=Dw6N94xu1ZjqoLz6SXIEi8TQMraHiDBTbaN+5/4C+ZtBuyVA1hIYqql79bG1I81TuL
         Kf/5L8/GxU7RIL2VcM3Esipd1rFj/fU2prHaHjKOgZBsuyqjEa0XqZdjs85yksKfCpNO
         D6heH7iAhzWXDScMMyluVaD5neSycH9KXPmmQh+X2Rb+3GHAQwwjRRn5ubb7M3ACBHyH
         I4JlITjWjN41g+/dHDbmGO9k78KlkYeX3TEnec1x+7t/vHbZM7cqGNy0EMA7q05o9iMh
         fkLVgNY5/qwI7WDMuBbKIRNn4Fe/8B4ZmqHwSWj82PqYwSskRQYq46bH1gUfWw6sVKOF
         AiLg==
X-Forwarded-Encrypted: i=1; AFNElJ+uExACpAeU9mg53axNztzDcQTWMxUyg8hv866SsOuOhmdhfRn86deYb7jlwLEUbW73QCrfuttS8yTn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9MOhcVBw1/PyiTttwLrwmWdYVUUh958mA8SxQSzcmZtfdq8bm
	TBNiGhI3TP6LqVmXjxD5A6cqqj+1/1hWqX7B/9JGGP+iIGP8FpMGa1Y0FzTrFud6Qeo=
X-Gm-Gg: AfdE7cmH3PdNPQWhl2j3NwYojAL4Jpk58VFU8fFd1txU2vzOzFELeQT1/GV4ihDuoMI
	wcLwfopYwe22glArj3Ogk8OGce7KS5t0y24j8ROQumc1thSHw+0jnfjEm97od9Of0/+I6Z6EEEL
	WwPjI1yJJtc5ywoxn7tD841sqTToybqvh5AwfQI3Hyxs+p652gNFZSZDDt5M9ocERN0E0KhB3L8
	q6mxXf1WVY+vLNjVdbbTC+x2+cTrK2DKgkcLMqHrw2/4S9aVtPAwZ9AKB+FAd14wWmBW+hF6K/0
	cON9OU0aSZiL1OYw1hO+ztEA0c9A27cBWiZ1RsM5aQr/bJs1o6y5itEAgvXUzBeWHXomwllkZzB
	QBY3+9KPLl+wSGHumRPxEhuQwPoTNigy8vRZTe6/iydqdidoCf0NyUP2eH4U2op6ot4rWHKTtC+
	+G+osDYwQRTx+UbOIa0Q==
X-Received: by 2002:a05:6820:174f:b0:69e:b41f:1963 with SMTP id 006d021491bc7-6a3cbbd4a5fmr2341508eaf.48.1784071354502;
        Tue, 14 Jul 2026 16:22:34 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:280e:69fd:7612:d5a9])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a39af0e953sm7561978eaf.3.2026.07.14.16.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 16:22:34 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 14 Jul 2026 18:21:25 -0500
Subject: [PATCH v4 3/8] dt-bindings: iio: adc: Add burn-out current
 properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-iio-adc-ti-ads122c14-v4-3-25f8e3084485@baylibre.com>
References: <20260714-iio-adc-ti-ads122c14-v4-0-25f8e3084485@baylibre.com>
In-Reply-To: <20260714-iio-adc-ti-ads122c14-v4-0-25f8e3084485@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>, 
 Kurt Borja <kuurtb@gmail.com>, Nguyen Minh Tien <zizuzacker@gmail.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=+GUNuuQMtib4Kibx1H+tAJiwv94cfO9xjtvXTTsu6EE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqVsSK2ikdAzyGcKq5rUo+8ZJ2AvgO5A2eHZ4U9
 CcKvt7ojLuJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCalbEigAKCRDCzCAB/wGP
 wJysB/9XlInnk9loRJLMo2JjVVmYH85uIxCwTOFEILsZbeDdS9cjEofLQkwJPzqRzQZ8qmQKvjS
 FQP6yw//jnCqzuAlzHSUwbWLQ6W7HkqJuqrTbcRUrYiMd3c4mz8Q8KKlLYlrSWR2ttwl96ptPI+
 5iqB4ae43XBtvButX/ehtkUdNgEuW46lMiX8ueBMvFx7BSQspxVgeqqQdZ++A+u57X/aRvPvuA8
 ywTOuIw+EBAtp2ukaipdrnFGGQENzVyj7yM2aO+0P6xaE3uLbxw3IjjMgMoOfB0+zRC1I+ZW5Lu
 Y1O6AZlJOwBmFHtZQWLcIAX31m83L3qlc3FlXfS/CmfqQDbX
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

From: Kurt Borja <kuurtb@gmail.com>

Some ADCs incorporate burn-out current sources that provide current to
the channel's input pins for open-circuit or short-circuit detection.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
v3 changes:
* Removed maxItems.

v2 changes (compared to Kurt's RFC v2):
* Changed units from microamps to nanoamps to fit known devices.
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index 9f7196d61ac3..e1da63119648 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -101,6 +101,11 @@ properties:
       sources. The index in the array corresponds to the same index in the
       excitation-channels array.
 
+  burn-out-current-nanoamp:
+    description:
+      Burn-out current sources provide current to the channel's input pins for
+      open-circuit or short-circuit detection.
+
 anyOf:
   - oneOf:
       - required:

-- 
2.43.0

