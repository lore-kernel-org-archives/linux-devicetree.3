Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964080;
	b=Rs/v1ltjAh8Il9914mYh/kw35tYSkjY9hr9yaTaQCgnYjlNNckwVKUOidJOpXu78ksAI
	 mEfJIuty6iww0QLpsCD/+Zc0aWbHgYtxMzfXR5OONv/dTGRPJ1E0dHFu96rKmypq+u0Z9
	 hyq5cKNoRqFDI1ExPa4/1Di0HfsErnW43ypvV25rYYbOFTkWnszd5pRGuPLbIiTBwJAyH
	 00FX6uYPDA+PTPwkqrn56Jkd1D930ENDO1BRLTbsVmN8+eKDnpWohZzwZ8KJXIet5Ienu
	 hL14oEVJO9Wa6z9iCO+mEEuepHBGHTNhhXH6XFCfNm9UylWUXja2tRUWYySntnRHFxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
	b=BJZMDET3yVaHhNzLvyPa2E7gsO14AZ3Om0M79ljUA31Ddfyziwizi4NeCYHn3msiDZUk
	 t+clg1oGi21izU9vJcpmkJQdV6GvTsH9/MnXEjIklJZqUiOX5PuRZkDIkPzu+e0I0OhPH
	 aCRleLc/24sf4thZBJ+2XiKN8Y1UguNY/HNKMGeaho2olLzJ4SH9ZTUAFxL5chtf7WCYu
	 0kT9Z3nZQvnhuZkvkqNSuYknpeHtKZJNi0i1vZpM6wGG58SjFwbDmbfXka6GkealCa4eF
	 lOLq6ariuiCW6aOM+l+Wb7VgAGN1wIT7+Fup41Q5myDJfztSoEry2KtStJLYPjTsZdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bmWTSGeD;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B578C606A331
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B578C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bmWTSGeD
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so4631495e9.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 03:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793964078; x=1794568878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
        b=bmWTSGeDEyRgw3Rr66WU71/HBLPF++E77hiVxVe5mQUGqMlvwX4en0t5YLXeCl/LZK
         LmUf1MywC1/4VKgZRiTSmty35QLyBqr5/5CkKIsTNGZokKe2LtFmjMtz+S7ni2H8xZBd
         38uid3mLVNQdJHng0L0lA71yHJtG6KK1IMrhqnSTCq5spCmstYPxpbJHu0QQupb2ZuTu
         9cZA15ZBFUTUTwLCvPSM3+nku+epbwYDA21+hsx7ECFiKXawrZTSBHckAEXeSutOl8hD
         6zmZfEyQDuGUDrBRw1MqoinhTvoUFBRa4FJ0H6U8udsZ9/mqEYKNRhY7l+VlILdZWZjb
         TntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964078; x=1794568878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2yTl4PVSyd+fgLTgPgtlO0e+H5KFW8y2uBPZ5q/jBQ=;
        b=Ld08Ut9BoprcgXuafQHv7ymvKE5uHgaA6+oIVWivMB2VKFLniHV8gBwUz1BSlnkFB0
         DTA/gqHqoCeJP79271aD5FlVGmE2N6FDQvTqYjKvMMJqClRcDwJ2mW8W8ezaMidG1IWp
         QeRvf64WjRLe4GGVGnwPFekE/pMaBXdABvRa7GofUaSVfKjy1g7zhEiBoFLl4jCMxUba
         NUQvfE8i/gmFblTSCjiWTykjQ7hycvmrSQRx5AFFiM/ViQvBtrKRq0+pKIpPAIiEEl+R
         vXKdM/Dn5hpKojdwkpDHQb2O77F+PrW4YXy+elD5aXs/mHUplJNUQNv00XJqWZcbch4L
         bn6A==
X-Forwarded-Encrypted: i=1; AKwUvBwkV6Ayy0pJI5UL9pYzKx7s8DsUaWvmKuTnPWIPOfT5bmdf1W15MMIEPbrgNKxc7lJcH3lOQKyje1T9@vger.kernel.org
X-Gm-Message-State: APuU4Z9EgL0lOTI/0LbAquLNnTBGhBjA6H0vgwB81HnNYL64RQrBsmIe
	dxmREkWLeBeli7k50+NCj4HKoPURohvhOJ019CyeCgUEzJg5pFAeAGO84dQ+Cmj0r+U=
X-Gm-Gg: AYBFou199xHjU+cxAAztl5ckqwvZIZTYG5JZtuos/ftoOsieQ1Dd9E0XD4hvJDMG6KQ
	kew260MS19KbjKXBM5794RxIlWKF1ur87RtGsi3ECJvCmxMCcATcBTDYf9hebNNhhjwZsJoHOu6
	LrpE3Vntbr5ZzxzY4Sg/wTZ/g3l6Hag0a7b9pRPEChpVOjulGHGfFg8885dRGAUSTACXmcbGU8+
	u4/WVNJR8cKonvy2kv45eI/jqRjJMfeb0Vd43WQtUoAPeBQAWqhTR+lt8IaPc8r+b8VaXVNl6uw
	vofqy6bTqlSWl7uhDfPS23kBxao2hGffD1DR+UZ/Lkz0dPHzFanwhoQRejiMl7S+V6hhaD8H/xt
	hKB6TYHkBV+s/S3hxNJ+iIOnnLqOFO3Mp+aM/hqB1dOmhtaqfpbpXEwkkxH7bwvXTkxG+ercQKx
	LmOQdjZeo8jpr9qE1rw033nJ0z9y8BUZGRwH7xF+vBedTz/HLOj6iM0Ea1u4ZZgF9sAnKLG/qc7
	t93K7Tu67TPX3XhaBopqbURYxej/ppFTOfS3U9Cw7w6FZ07DBezVoF3aZw92cemABM80b1v0YFH
	LXlsktHrsf8Sm7mlJaFinm2+vOX9VT2gCRd+kUW2S/o0oHVO/wxc1NTPyJ1e+6I=
X-Received: by 2002:a05:600c:a015:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4b6df11d637mr31306905e9.15.1793964078175;
        Fri, 06 Nov 2026 03:21:18 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2028d9bsm102404695e9.9.2026.11.06.03.21.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 03:21:17 -0800 (PST)
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
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add HiBy
Date: Fri,  6 Nov 2026 12:19:56 +0100
Message-ID: <20261106112000.1612-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106112000.1612-1-olivier@mgcrea.io>
References: <20261106112000.1612-1-olivier@mgcrea.io>
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

