Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102452;
	b=uA9rIhqvBD/mZ+FTYmL7LBK2s4nhEr/7UW+kPGqkJRzFrpl75hTyEmhACaONfVCbeLCA
	 s6atKsKrftbAPNZP3GNHvHQMqxxFdOoJamS11fa/6AYpoYJYJmNp1F2uY7fTrheiuKQJk
	 /oXoxIHxUw+3K4hEHuD8bsaR6v8saYLKwcS/FyvvJclndTmR2dbFeKu3bcqgsMz7xq6WV
	 5ElkexhiBLs2p33vajra7uCNIo609Fc8dBu7b07bn5LTBsoxmzvFI7GkUgbDqurQapse8
	 4b6RUJMr/uhmSjzPyp8OWTx/Xq0QltOGg1BsaJFZaLBLaZxRk3IoDkTaXQ+cyXv9QLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NUqVSXLAstwlQX9p2ri4V0g23CqSWbBN5EVVq2UQPOA=;
	b=5T9SybkWGm1LUpZp44khxGgG7+CmM/SDpUeWI52O/uFvt8wdWdUbUH3/w8S6+4jP/QHH
	 bu8cFLqJIIWoAzAkqrZXIyS+hzGk/UwlWoZLwbZ8HzHdyCNBQ6JkRwiwV/V2ldr/Q+6Na
	 QNvPZpthvL74Ifa+JPpQMz/QkE1zWdKal1EChM0UGp4gNVCrEijr7TarJY6Xc2RAdPG4m
	 AqEHGrTINmZkH72BsRZFIhBBkn0gUTVoDqs+VZJ1S51wOrlSfWNPZpC5eR0a/heXcyQWs
	 iU53MIbFc3Jspp7WbyX1UeFCJSEZNaJJRVUfPZu098v7FoVTfQI3ciy3QB2WM/bPXeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENAmsw4N;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4ED606A324
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E4ED606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENAmsw4N
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so5903914a12.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102450; x=1793707250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUqVSXLAstwlQX9p2ri4V0g23CqSWbBN5EVVq2UQPOA=;
        b=ENAmsw4Nw22yhGScbFjLDocGggraBRH99Rars+0xxe2Oj/WqHA5Lji1MtwB2XMePKU
         0L5NRLesKErQISbxqHgyLlyfnbcDV+noK2ldPPhJ2VfxpDViDLvYCyBaj3SBy7NYTHb0
         y4JzqR34d2BUAPCsGiW3+xm2787/IFgQ4vfATDc8Mu2HA+II+no/Z8hRt6X//uw+KVhX
         HtPXnu1bjduugmphhrxFGxDNZnVLnQ8dvEkDxoLCDHwIC7X4qLN5MDl/aAAX87pJncAG
         6qMWZjVQnanbI2LcQ8KSessBYQKaDIA3qUxUhBPVELSHctBBeuxe3Nc1VrDRRE90mKE2
         K6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102450; x=1793707250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUqVSXLAstwlQX9p2ri4V0g23CqSWbBN5EVVq2UQPOA=;
        b=Xoct/CrIhKK/jpiGXmdD9fh8pv5QUOJXJRtEBLrPTR//ahnisKUjgu0Ozo3Ph8hFLf
         g60ggKZeRhhJa6D4uPGMxr1KUtT8UpiO0gaweKCzQk93RBBTyw0D1OmIv5nVMZpxHjAQ
         nMbP10lguLaWV7OCOlEkIE4g7Lg4nz0pTmiJLUCQ8AcPMkTHBXNpdzrBgebQDLvbBu9/
         4uo2E7SHqr5cIByagrIQRb1bmESWfwwdXRpSALKDCy7ExQkPdhiOzFblswZtaZ0KCtI5
         uZ9DiwbU9SSWrHsL9UM+cJh+hPMtBjbdi8oqBi2H3mKqiSOZzaU6X//z1DETaphIT8MR
         HClw==
X-Forwarded-Encrypted: i=1; AKwUvByGiPEuXPwFCHB+VxzkwuDdENE+nIt852V0RlEfkyelcSHtZXEsnA/6RZ78ug6YqwOV4sW75uxpOb5f@vger.kernel.org
X-Gm-Message-State: AFq9FYIlOb1hn5PDfU82H/ZfL6rfN1QlrFItsgvB/930wNn15XMUUUFu
	cx+PY20/2JnVNU1jd7BuayQApimM1QNrF8ODR76w4ZaD6O9OXWbe+fPn
X-Gm-Gg: AYBFou3tiFKlrWYj9gn/2JsE3+ZU2B+vyZVdXBX1G07hK0lqes2+BROhoVY27DPV9vt
	UQtQ06lGXNIQ7SZwvezAlP8CkNrX1Pe6Iybi3OUYPLtItjUcinfAQ6Xr0P4yzy/dvTUXNr8MRkN
	YT9w35FHSRRdSmunCSOoAhr6eR8r+JNrcWUGktOOINDMZ33FDidrdHDnYYYqz4sROEGxixFuzwy
	mzBLVUevMbir7y9dfz38VkFRxGgWkSfTAV0iulierLmTzFo4+IJM/rwfOsoVdfIZyJ7AcwyKA+P
	C08oWeGBFrdfM2pdDDbtH9w5r53L/W5L/b9DocjVA4G5iLapNFGXr3uVSNCZVN3OjGgkS8ZlKJK
	euuK5jeumw3QMoj3WVlL5qWa+VJM6IhiYJ/vyjOxU3SuSkK6Lv4Iq2+nNevyYcPRJw+On1UIajW
	goD8oCt6nlqbGYrRnzBQLzP1K1MjszjujBaQkMKEFIChY0l7d+HTwYnxFazcg8FgSzfOjYtcQpE
	pTrB1aocPsrs/0D25iIkrFYyVIcGO6uJrkInDYdalb++vsNPRL1Mh1Q7cfwbP/BDMzSsz4xhrji
	Ts7do072LrB6yseYycxzVw==
X-Received: by 2002:a05:6402:428c:b0:6b1:ef5a:6720 with SMTP id 4fb4d7f45d1cf-6b442fcfc70mr10159119a12.16.1793102449777;
        Tue, 27 Oct 2026 05:00:49 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/7] ASoC: dt-bindings: maxim,max98088: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:13 +0200
Message-ID: <20261027120019.93611-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
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

The Maxim MAX98088 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/maxim,max98088.yaml         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/maxim,max98088.yaml b/Documentation/devicetree/bindings/sound/maxim,max98088.yaml
index e4a2967e1e818..4d33fd705cf8e 100644
--- a/Documentation/devicetree/bindings/sound/maxim,max98088.yaml
+++ b/Documentation/devicetree/bindings/sound/maxim,max98088.yaml
@@ -9,6 +9,9 @@ title: MAX98088 audio CODEC
 maintainers:
   - Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -26,11 +29,14 @@ properties:
     items:
       - const: mclk
 
+  '#sound-dai-cells':
+    const: 1
+
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

