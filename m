Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9F533E360
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 05:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441562; cv=none; b=MhjmZA71hsWzR0u4unv11VqZcHD92v+7Zy2jwxEcJP++dNAPl2QvSgmqtolBlhBrgg9nWDZpzt/hij1wd+NoErEaFcDnNrHThLKlLUKYa0CAcIX+quxpDLoCtvFcMEYfBD/b1c7Gep2WglfjQEkxDQOXJKTV/hUWIqXNWeWiXnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441562; c=relaxed/simple;
	bh=OCr2Hcn0qix+hqJ1KxJxOzUQfs1MFEoU3VKInobzy38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R3MT37MTStWA5kzYK1N+ZG17LTHRnaXhG2/r76EJl0FHG1+LrFmKTqSVUA0Y+141RTJoHN1n0t8gnOhdbNKitxkZwiWsm95C+cPzvf7UcT1CWLhES8QmS8PqL9W/MhumD+CrnzQoRKwEAWyAeqZjG3I1d8KTe+zep1hFi/JVOqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyiSOy/a; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyiSOy/a"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35fc258aaa4so7652985a91.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 22:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777441561; x=1778046361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHweuBk06mfMQKKsSg/CDUzFihaXXhNJibA/Sa+cnuQ=;
        b=GyiSOy/ab8c2XAf6pqJR2S24XrbGw0RSw5SL9oYsBpxAiqVcwlyLUKkNRyafkHe1T6
         HWyWO528qjNYxssuwf8YHH0EiaPP703mJuexNdYdjRPuoix3BHijzfGt1M23UJ0CrOEr
         MfE7u2HH4WO2uNl8NZID4pnVMVuhdBG6qWkeB/06/Wxq0+hLEpfyGPhO8UGVUCi6HSQ6
         n8CnudrkMvH/K0x9hC7HK/AuCgIvLu3LEs2OdIioyn7jNbid9BsKUoEXO+olWJ7fPz6T
         4ozF6NW5ZQHXwYIdQa/urzZIbFK79IdgS8c335BZuMKmmG2/Ax1oAWx1wP+vPi05ozKD
         ht3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777441561; x=1778046361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QHweuBk06mfMQKKsSg/CDUzFihaXXhNJibA/Sa+cnuQ=;
        b=sFZdfqVwb+m7kvAVImLGxBrTQfOnEYEVKBNuxCzYCGi5N5JwNyG1j3jHdlFOfMFUV1
         od9icScN/ei+UywVhSccNPtBAIY5xPWqvL44Rf1LYGO0kG6y15v6dYklrVnkXt/hHEFG
         NwGIXTPRqISnGqw5/8Oxp0tJWpScXvCMNpuP7lYTidb/70AA7yvR9fIa//SOx+uvc6MS
         d1Ba11lzhTg0Qr88o9U4cMcoZ5wqSn2wTs2tU/YQS0SATY+GTsTnd6GXLC+qItVovcQ3
         7thSTDFDEdkFjWnabG6/0XJPmluz7ziK8sYwdIREBD90FW2jJf92/B9nlNpDeeh4ny8g
         nvdg==
X-Forwarded-Encrypted: i=1; AFNElJ8gQvxQa7d13Mc/vcWBzpi0pZbCgnvBHzLDnp0a/Au77zSqxdJVWyyKCHH938IzW4Qwip9XcExN+rAh@vger.kernel.org
X-Gm-Message-State: AOJu0YytypqiqVnvFhEtEa2+JMHUHHn2CBCG15GgU46PpJTCUx7bnAcA
	MJujTmK4sd5zEfcyqhSGsDqJID6rzDR8RCbXpdv79IngZA7k9pcOHV+T
X-Gm-Gg: AeBDiev58NgTjx2+7bCHBSQmgYpGYhpegsNAIf3QI3PtisK4kUFGlQQgoJfM4lRAmR5
	Sq1bNLNtecD+YxZ+Dfxl3XOfYP1jAgbFXo+IrhnCwHXEI9Pd7d21cHimiehbbHf5VumIRMtGvae
	g2Ah7yTS2RIQXKE20n4JxzD0K4BC1kC8VeLQOpR+slgCcGiLgJsEOa74HJC/WPntTxqUPYrk7zZ
	urahpEFarDCSwcr+szDDQBG8T5lRNLP4sHDtVtNGBa1t2wSQFXxSZtEqB/cZySyKMubw7X+NyoQ
	tLJIWsjoiz5bnn3VnLnsUY3DXRY35yas7/HAM4E9ArcNDKzDijTd2CemyUvtTJOT4tP4FZOaElG
	e1duaPix0swW8WQlguLLP13o4THPkKnMcYFd2RfZUC3sEQ/9VyuaQykiZJdcDt0VqVcBgclnNAf
	2I0JjBa1+y6/h8O3uhDYo8keIr1qNe5zXxOXVDCQ1Tc7T6AOSyjbQXy5i3Kn9j2sb75w1/h2aJl
	/ZjzZwuxG/gJCOvLwNzIerxMtsUGIJrkt/vsXYedev/4GQyYg==
X-Received: by 2002:a17:90b:38c4:b0:35f:bfdd:f5a1 with SMTP id 98e67ed59e1d1-3649204d630mr6255254a91.13.1777441561015;
        Tue, 28 Apr 2026 22:46:01 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:5fb:20b2:c2f6:85bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98879656dsm9346365ad.25.2026.04.28.22.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:46:00 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/11] dt-bindings: iio: adc: hx711: add VSUP supply property
Date: Wed, 29 Apr 2026 11:15:35 +0530
Message-ID: <20260429054544.123862-3-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429054544.123862-1-piyushpatle228@gmail.com>
References: <20260429054544.123862-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the optional VSUP supply used by the HX711 on-chip regulator.

Keep this separate from the HX710B support so the existing HX711
binding extension stands on its own.

No functional change for existing users.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes in v5:
- New patch split out of the old combined binding update during review.
- Document the existing HX711-only VSUP supply separately from the new
  HX710B support.
Changes in v4:
- This property was part of the old combined binding patch.
Changes in v2:
- Document the optional VSUP supply for HX711 nodes.
---
Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 1ea60dff98d5..a8eaa1f18de5 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -33,6 +33,10 @@ properties:
     description:
       Analog supply voltage (AVDD).
 
+  vsup-supply:
+    description:
+      Supply voltage for the on-chip regulator (VSUP).
+
   clock-frequency:
     description:
       Controls the SCK bit-bang timing. The value is used to derive the
-- 
2.43.0
