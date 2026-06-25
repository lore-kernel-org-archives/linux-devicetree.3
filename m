Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6443749F2
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 21:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782424571; cv=none; b=If4JpVjPELWHE0jPdBk6FnvHQ87vid8QJ1eDxQt1xML8Zoz0jBDZljNrgH4XnnLe+Q0svmQrzBv5R+bLBrk2kaNyfMXI2JiWlU5MR2FstNFIS6ebsiY52937K39Nfnq+qXuwozixT3VBDU/QVtm+FJqxAJq8mz4ZeKBgCPV2JjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782424571; c=relaxed/simple;
	bh=VWy85LEfrVWzy8r8aFhzYed+srWyhaQYH2vSfHYqpZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V4Rrc98yI/6jEXoU8lyEi/dE9q0H9cvHBJ8cI6LK10wAceR1jHV7YM8XIJX+kR/+kjv9VGRzEAUoNoFXTCS7B1lnbh3UTTkC0dQOg6F0KE93Wi33+aCXx/6Fuv1K8t1P52b6TR87N2GsabU/f02a69MtA5Qs0WSV15cVb8xtNtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RmZ3K8BI; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RmZ3K8BI"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6a0a38a013eso289114eaf.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 14:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782424569; x=1783029369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FynzaPS+sv8vCcJukNIoA2douKl6UjmHADWDXV8MsxQ=;
        b=RmZ3K8BIOEu0q/cVp3DYt0GDZxir2PB0jdg1MOtKUBQ9c9PT0zmH4FUhcmOkI9YhO6
         cCPU5HVwYRxaU6Kyh6HayWRcZM2dCD/vgIFHFEKyoPhCFXgAjKfjb0yWrZRo/+Dd2Iap
         lSU7HTBA0LN8iCG1W1Xtdss5N2OEOk2MBhhZmYfdLNrFWeQngPtg84O4uH76egXmc0vT
         R7yHteHL0XrzgFX98YP0H+w/XpiRG7CPRm6Pac01glx6+1QKwza2I5D54Zcjg9hAva3U
         qan87E4OJazb6/gkq1znM2cfPRZiAIm05kBWurkVqWC2YkuNyMnC59CqQNtike+6BKPK
         Be3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424569; x=1783029369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FynzaPS+sv8vCcJukNIoA2douKl6UjmHADWDXV8MsxQ=;
        b=G5tJd6aCyk3ZxlPKPyehDCaLGRRMMpECo/FhKTBNHVMl80dii/WRmaLGr7mhQUMfKj
         zwfyyGf/1W1drsAh6g+WsJgoSAZZ5FKu/8CZ7YnBd6FRhwU19K37gNR0jkPX0O7fv49j
         ELGjE7H9oXdcZAfjFH4JPf+psnA2e4uZwRN8G3ZIhTgioQ5DnJfLJLkp4kzxn0YccrSY
         R+MhbLUAVQK3hFmB70ti/t9CE0AndSBbhm7GyKrpivpOwz5Sb8QGD3lG16wkGpt0P3SD
         g+NrxqsABI/CI3N4S0TeIb8Q3MeShk72nKakqkWuhI17O5mdMomm/yHD1guxuw1+8osI
         Wfog==
X-Forwarded-Encrypted: i=1; AFNElJ8jmP/zn3ybZUSIMlxjctajXANt38oRX1F5AHsluzEv7JaXkLsRsq5/rRAfwjttPzx9VhhfZ5E9Dj4G@vger.kernel.org
X-Gm-Message-State: AOJu0YzWTwIFontD0wQNjWzWhgiqE+1IZi2xtzSHXmPamH1P8DXwHAXg
	N0oLQvAooNNhG1DeeAj2p+3YzTCbaESbOFUB/DqTwzElRfZeRPEXunrbKs/pdaFN9t8=
X-Gm-Gg: AfdE7ck/fc1PB2Pk2S6Z11c3B0TMBZ16ectU/pe35iVWCW0gPR/7DtlfkPOdruUaKQd
	qJzQMLKNbuVNEOu54nAa5xFDc6rHcYubs6X1t7pYo2UutVMxkilZU7gpr8lBtdoLfH3O+X+bYic
	9oIW3YCxkCgcj3LZVqZRaEaCndBTlavmsouY8CsKHc6Qe9abtrljpVbHXUnurAOu+O6wERLW6of
	ME3fUGYFrqV3TsuMmvts0x3J3Fti1J9GFkXL8G4nKD5twMxoC1THq+hz1qCrfoc0ayv6yYWUW9+
	bAyXKBWxNBE1ZB6el/32XgnrImQh+8OZomg35cKCiSJyaZ5yW8pq8/zalSbPtuRGYEUgnbGJOwA
	Wyd9wruOedm4fqwFagC3084hxX7ujaM/vflvmTWFIy6jTn9U7uxZP7qrcD8zGmCLjanS/1dU/F0
	5jyhEX7GA7FyH+XQifVw==
X-Received: by 2002:a05:6820:1528:b0:69e:8976:77c8 with SMTP id 006d021491bc7-6a1343e02bbmr2899530eaf.23.1782424569670;
        Thu, 25 Jun 2026 14:56:09 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:f1f0:2d9f:2f31:3426])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa5e575csm206058a34.11.2026.06.25.14.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:56:09 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 25 Jun 2026 16:55:04 -0500
Subject: [PATCH v2 2/8] dt-bindings: iio: adc: Add excitation current
 sources properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-iio-adc-ti-ads122c14-v2-2-ceb9b0b561cb@baylibre.com>
References: <20260625-iio-adc-ti-ads122c14-v2-0-ceb9b0b561cb@baylibre.com>
In-Reply-To: <20260625-iio-adc-ti-ads122c14-v2-0-ceb9b0b561cb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1967; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=2mTtWfiW3vF0hopNPC35EMHNjfzB200e+sm1z35kVJw=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqPaPIwKTAEhZS9OyTk8cgEew61qspOHWajEbM6
 lcSG9DwiIuJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaj2jyAAKCRDCzCAB/wGP
 wJNxB/91x05mFt6bX7/+Y18WroHy8wg7MvwQ85cMaQTswqBRE2quSnYvJcCdsu3YIAFw5LJ+JE6
 pDMgDJOFnHwg6yf5zE24n05r+3pfqVsynaCbI4mjBABm4dugWeMRI2Jag4OO+xf1eLtMU+egh7N
 go6iUOeA0yhmVSuApsxoWGA+hW4SrFwpP1S/bM/FT05qSpYVsbmtXraiD+rL5ca692WhmyT29Xu
 OJjqp3H/Q8IPSo0aVtBJGFUH43zpO4DRgkdQSnuuhLYos4Bjw3TuUFVspR0Lw9NMCCHJtq651p+
 I/5UaCMVfi2znSdgdCVWpskA4geiGCdKrhx6nVQ+NA5y+gbz
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

From: Kurt Borja <kuurtb@gmail.com>

Some ADCs incorporate current sources that provide excitation current to
resistive temperature devices (RTDs), thermistors, diodes and other
resistive sensors that require constant current biasing.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
v2 changes (compared to Kurt's RFC v2):
* Make units nanoamps instead of microamps to fit known devices.
* Drop bit about allowing single value for multiple channels.
* Add bit about semantics of the array index.
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index 12800737d4fb..860601ec5334 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -81,6 +81,26 @@ properties:
       ADCs usually allow choosing between internal reference sources or a pair
       of external pins.
 
+  excitation-channels:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Excitation current sources provide current to resistive temperature
+      devices (RTDs), thermistors, diodes and other resistive sensors that
+      require constant current biasing.
+
+      This array describes the mux configuration of the excitation current
+      sources.
+
+  excitation-current-nanoamp:
+    description:
+      Excitation current sources provide current to resistive temperature
+      devices (RTDs), thermistors, diodes and other resistive sensors that
+      require constant current biasing.
+
+      This array describes the current configuration of the excitation current
+      sources. The index in the array corresponds to the same index in the
+      excitation-channels array.
+
 anyOf:
   - oneOf:
       - required:

-- 
2.43.0

