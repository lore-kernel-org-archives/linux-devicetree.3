Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578254;
	b=hUFl47VpAl1smlFfS4Gd/T56aRfr4yi5ViRkRxaRwBJ2HLX+g8kaMmG0SI7W4e93ccNk
	 rszHNybZnTvmHMNM6IZVGAAd+s6potUQmULGZNsXmTpoYbN/KciHibux0pMA3SY/1CTtK
	 Fi3nDj+5+FsfEtw+WKFgI9T/RvPzrAwoa7aFFhOS6lL4P7tD9z8mrS3SkycBHiTPn4zOO
	 4YY5BXQmERiasW/RL4DCJ1sTGIqngU5sVQaUUSMJ8erDpUjXxF/E1icU8Lm8Bl65gmgRW
	 sSl7gQUISMC+yjiBmxs65t2oCvqch1yTZl3nyvMc7WS68sc3g+lQh3GOSfo+8GfBRSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0gMkbbLOot3bX7ZvRSJsql+Zsoh4W/ttXNIHMpReErE=;
	b=WUcM/uBvUF4C/L6VQDhC0g4YlgHUeiFRJK8qja/2VGL+B+NIAoZ2OSYCLs4BPQFUJXbf
	 FHYb3RT9lJxRMDdrzA9ia3L7S59TP3fbDe1rX3XxTuemuZDHMmpo0DIERWTcyuWCZaLin
	 xdKGqkhc7aKOiiNoKC4Sh89KFnPDAV8yNa+ui0PmIbadWuo2q4iyjUuy5tLsDLQFZO8jU
	 PNByCbYbZP/HlIEYGagJ0pT0ZFZkmgVMkjBxF9Us6w5CRDrBFHv1PxwKnZiyIB4wzmnla
	 VRfGVzurGiGHK9qx/Cpoqpy82F1i5xQ14y83ojz0uApg2YvoneF7Ca8TzW2yiBPU4+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lEdBuKcF;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA04A606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA04A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lEdBuKcF
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so51567405e9.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795578252; x=1796183052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gMkbbLOot3bX7ZvRSJsql+Zsoh4W/ttXNIHMpReErE=;
        b=lEdBuKcF0JncIpcutUemWRCVLwcBptVk45nftYoXdUPaaPEMjOXhRvlDgUBMqszRSi
         GjVW7ES9OlK67a/2KLB5I65GkIV14Ylzo/LfhicqUla0tHCcqXUHFVnVhyXZGsWk1GYi
         30KWFrA88HI/8R90LcNab9RdDuPnarcq6aW8IuA8Dbg3UasrVz81iXsAmAz52FFpSxkl
         kwCNrdjoDvsHBIUIV7L7pGx49IZu2fqgEP7oIu858HUHqjSUGsKRfpJS4Xm/DgASvkCY
         ohconOG9BXS7zsTTxG601/wjTYdl90IpxPDLaEEQRmhw8dfhpInmpWHAFkRnignmsUL1
         jNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795578252; x=1796183052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gMkbbLOot3bX7ZvRSJsql+Zsoh4W/ttXNIHMpReErE=;
        b=JVRmgV1oUxZd8JM1CW+GNBQDS7rpRsWIjTyM3jR5dj4azBmf0qM+w2kSLt0B08znkt
         qtqW0byPhya+KUrnE8fXTZv5HmF0gSRtr3txwI1c73VKilx91MYZCR0LXZQMJU4aht4Q
         t03ywqFI5219hoBiIpHJ0+q1ihI/TicBItBMGpplqDK9xccZDLDvTS3MQ4i9EPIyzIo4
         UZYa7WHiLMm8zkl2LUpzzS+7JJO6cSuNrWux6a5DE4RKxeuTMxt5/PNbD7E1C/UQGWAz
         WC2a6tU4bHXK/pqnkcI+1H1taD1iK6cwppXN1rBVvCIFC/g6j2ffd3YG5+ISw6J8GWbG
         QhdQ==
X-Forwarded-Encrypted: i=1; AL+hErHqfufdE8eYcU4YAjPpTIqfqQbVrkO31rldUHl6oE/X5pBn2XiX/dOdcwa2z7LrXbjunQBhsfKw//iH@vger.kernel.org
X-Gm-Message-State: APuU4Z/ltxNKqsRThvVTblPDSv0VwVzJeeyHh9NXkgd8r+lX5tpW6cGi
	LEVbIHjcolWR8ggC0YU+aOb6MjX1xbeGWQO0xlm+g90oOrbJkhtp8Spl
X-Gm-Gg: AZFdTZdTh3ci3IDXM24ORriby3KDstuQEUw5eILNlR+W8+Cz5jmbhoHIh07DiqAP7of
	VvJ0wm3csCWzlepGvnISaY7irP2kalOuB0PeGxEdblCuxJ2rShPQVoGv7mzJFx+awZHq0qWmiiD
	ObZ3OkRWyC6x/Te6i9x3IT2o/oyoeqE6xDSWyyOAw/tKVumZR/FPNTvNz5eTT9N9cs0zfjtyCfS
	O5V8lfxvFj+nOhh0fNc/a9TXeMoocAbCUBEnILjz0lDvnzzCZGldzCs5BWrV/n/9yRN74LZnD3/
	Z0+FDA9IHe2ybKnZD24eVS0NtYAqYL233R6AsVOxUCoC70OvTLXhyWISvVDOcgqovzVnhM3rTy4
	wy1f6tBY+Skz2L3A85CQjy1ou2NmtmMZMVDhbW6MB8dPzzrkn3ufcMhzOm4RMiY0s7MY3sMD+zC
	Ya+PEDBMdBqVqzA0W87C5CoNeYHJTuMap45zPcIuEvpWwd7lFTstvtJtYeCLkDMzpM+K+PkVyKo
	M9KJSf8khpeQ3jUmAdiaAzW0AYVX9boRzuH2gqFUtwRiOYdpOg2cZg3oUknXkK5h/gyP9YkijXn
	gfhv9PcLZHUq0cbQWpmxVVJFgL/f1oFWnvUgc+L3MiCLwrDZgmZPtuBgtLY=
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr399963545e9.12.1795578252392;
        Tue, 24 Nov 2026 19:44:12 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm391107925e9.0.2026.11.24.19.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:44:10 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 25 Nov 2026 03:43:04 +0000
Subject: [PATCH v3 08/14] dt-bindings: crypto: qcom,inline-crypto-engine:
 Add Halliday
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
Message-Id: <20261125-halliday-dts-v3-8-5c8311c0b70b@gmail.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795578204; l=991;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=iODhhsd3yfvGtcciUvxgx8qkDXgsEtkBlczLh6ZRfrQ=;
 b=lvcDevXHoUjfOVIKmGcAADmxVZULBy9zMoHqx2H32a0E3wUM2ikLAFlGNM8+8Y16B1yXdXwzE
 0y99BcDJDu0At3F9ibFbmmvIZEbRo82dQ3K+iKDoR8DVQfXtRsOln6S
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Inline Crypto Engine on the Qualcomm Halliday SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..1512fd1d7471 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,halliday-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine

-- 
2.55.0

