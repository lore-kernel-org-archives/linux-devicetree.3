Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246479;
	b=wrUm7sEyyFDwhWHZHB9i6BYefmkTpAZ4lr25JehxpovMUlSHloSebRZ6HM+RvgVox3kh
	 DSu9o7vXosxi9N4zstOVYPOX1xeaHOkpjiz3VYuc2KjCpS4SeirsF3mfR6oa70XP3B5VB
	 rZ0bGXF9zN8u3bWiMtIm4rPH7fwiDbehGXIfS1I7IVCJ/gFqzVJjDY4lrBqmisxh6jVoN
	 aqGoBiWxF1RFdDc0aREdb6MkYmGB1bzXxd8UeOydoRB54cMsXhZ+YscW6ya6UdYXupo6F
	 FTfFbDolnsUVGnnqFLZyzBqdC8w8h7NgysvgUlDDZx/8bsFcafCkObjk1I38n5/BsXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
	b=m3TYNB4fRAPYz+fO5n3M9geR43VKkeSau4Kt3xPudsJd0HqlonYonyiyy8Q15qaaryYc
	 bxVU1UOVR2Z85lD2esPfa7cL72zbactr0Basq6ikjEs1f3TQhCdmaybDsbPsoRQwPN4z5
	 /h/qX5FijxvobxdqadAs1hH2zr6gDe0yRZiz7GySCRrneDKlMMu2z+a1vMu5gA6wzQcbn
	 qSrehCjXA5dUPVfLgE83L4ckxGGZ6cH9fXIdqHSIs5MLQqoTnOdhOd7QYvYti95qQHxny
	 Kqc9aWa1zXCfg6CW3ou+v3HhsKa7naf/qEUrhj2aTmFXDMnmGMkMSWbZw1nImUg/URg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=MFMPWOpo;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324A8606A332
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 17:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 324A8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=MFMPWOpo
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso527918f8f.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 09:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794246477; x=1794851277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
        b=MFMPWOpo43dn5I1qLYVi+siaves6bKUxpU+2z6KSLJOGW+k6XXXCZ/2Zq/3TzkKRq9
         rECDoRbS+9RSxP6R9UjtOXuRjxwLpqWKonygKkfVyZY8yQjaQn/u3wYCOjPf42hWeCwa
         CIBnG7qOVkvrOT7lqfXuY0b3qC+lOYprtBpVfQBB86zDLQ3oFaJEYufBcEyJib12Zlqh
         0yvxgJXlHscZ+tfG0XB2HKmEl8VYO3k9LY+LQlKUHRtktaRfYwBr9QLN3Ha79m/TyaKt
         npmafvEiuFD7uPqa4LjQ0IuZDAWzZGMQP6tZDSEtUa62nOo4TMBBQoUcfFVPs1K947wk
         oQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246477; x=1794851277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
        b=UxF2A6EzoUr7hv+tMtuEIAGXXCED5N7KurIsXVztwJUsf/XcTIA7hfMKk2uEJXfygS
         TMf8nRwV+uRn8dhuaNLWM4PsFK/zk0AedcNg0xO1fGXySD6J6CjMQqex6PrXTyKQYtut
         KvsS1dlBGmm0wa1F9h51LmYuW4Y7G2zL3HTytx4//pHzy8f3+a8/1ozea3GU+V9Gr7wq
         Djc+IzhFgbpOGwwpLbcKK7nE6Ho+Dz6JlR8JUcMzixSr6UIyVlERGK0hlY6Iihpwvz8x
         0lCabPdca/H1kcV7DAz7gFlHkVBOk5/lcv4cLNMIbcSk55/3JssKF2U/6kr/h4ZB9tZe
         nUYw==
X-Forwarded-Encrypted: i=1; AL+hErHXCymUL+s2JsTT38r4gOEVxybfaa7run640vDjfobmaVUA+KdWr/f3Y21kA6i1Avbnbxo6DSPAb+SU@vger.kernel.org
X-Gm-Message-State: APuU4Z8DenzTUKwMQICeQCxu71IbmYixKO0K2fwkWu8hs8viPN3uPSUB
	wzjq0H4AxcNKodmvVrWW8ZiFNZPdz5FI2o3v5WU7PdeluJZwx3CUcSQiu8noo6aJeqU=
X-Gm-Gg: AYBFou1ScCMmSAgJ/65luVqqgpFeGwTVVuBl/aYJCkVdd+uFpeeVzvVFpo+1pYOk6ws
	+HUSBzI2Xtlh//5+Hinm6l8rQqbzKeVEWRge3ZXz/qfCOud+N3EYKsmzAiL9ILFl3R64HZ9fbKB
	XBO9q1iCUHvEvvvY0xF7MjAFFhz3zlRkh1yVvaM6iT2wzRrMpcdrrIuDda1UldLBcEMfRN8aetj
	zfLprUbgJbR22kqYVAudWvBgUnqqrYs/qR0ALOqs2oa2F5Nqv+XD64OXWFniDwufMIlfGPslqLt
	7Yie+3hZm1shHTdRUliKFD2lDJWgHnhkWHCTLwILWQFiJVUZVWQ7Mq6FLpoURd9wOqWvQNu445z
	/Tz0R9SBCxxsX9GImwaE5LvgBcmRKUS4b6OGkuqH5zXvp98DoZARJ5cvh7xUSv/FrfytP9jpZt6
	Tjy7w6AwcWibZAIO7qJQmrBgIikV/UC5Q1xGqaiOqfso8mrdXhIs8NNa7mTILd1Bc5F2BsoaK6l
	DeaFxIO5VQuS8+akXER0oVNRzBEHBugA7tMDUsvzbGp7uOL0Bw3AI2WxfzqQywhqOpsrSETVm2j
	YD1Ncc59B/P+g+V8AlAb2J5oHl6zS6/8lAentGaqQPGRxKY8JGwIgmbq3LGXGHg=
X-Received: by 2002:a05:6000:40cd:b0:491:4e13:fde5 with SMTP id ffacd0b85a97d-4982d03bde3mr421828f8f.8.1794246477535;
        Mon, 09 Nov 2026 09:47:57 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm167322f8f.53.2026.11.09.09.47.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:47:57 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/5] dt-bindings: vendor-prefixes: Add HiBy
Date: Mon,  9 Nov 2026 18:46:36 +0100
Message-ID: <20261109174640.96951-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109174640.96951-1-olivier@mgcrea.io>
References: <20261109174640.96951-1-olivier@mgcrea.io>
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

HiBy makes digital audio players, among them the R1.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 7602034374d7..0bbab57d6c25 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -732,6 +732,8 @@ patternProperties:
     description: HEAD acoustics
   "^hechuang,.*":
     description: Shenzhen Hechuang Intelligent Co.
+  "^hiby,.*":
+    description: Guangzhou HiBy Technology Co., Ltd.
   "^hideep,.*":
     description: HiDeep Inc.
   "^himax,.*":
-- 
2.39.5

