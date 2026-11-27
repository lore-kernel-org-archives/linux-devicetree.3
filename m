Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780933;
	b=vt97VYlloNYeu9ik4nfLsV2UZsHOABHrQg2I+FGH59ku0SvCyaiieY3y1bBEQE0GU2LH
	 JPnOeVJ0Hbb28fHP81DA+7VlQSgEPyK/ZP9UTDKZiisgbT4DIF/fmaVLn2gcFLsuuuXzf
	 KmTVgKzmVoOVldomSGSZ/JMROijDqyGbVPrvD3JuYCHU80I+ZeWwjlbAg+6dyqFCatFNA
	 sbd0muTbYy57usru/VuMcTPXwnlQlKfWXDqpZAGE7JUaH7xGawF7jSRV3Fm+FNdRWNMcK
	 V2Yav61Ha/PW+sokJjOkafiEZ53Y5ar/vqvZTYfUj4mBwadE9wA3hy5DBl8Zq5Zv8Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XZeii/VW214rh0vsKwtrU2Ok4yszGoZRil5bEJfNkjY=;
	b=5aO97yn87vMbmD1Xwj4bsLN5cE9XdF50i6ySUJf3eKnhTzbseq3+mTNut3+ornASoKYt
	 ku1PqLkCHdaSF6CseQgSPZnIKxqSJbh5EIA1YxNHJ0ep+AkKdvsFLlzO5iF045baYOaia
	 vj2UswPeIsNvjg58hu5WzucCCCwZjOM6fuXm2cEkOJHMbNgCEHPMNW7A7tXz/8NoJm0m5
	 kDdes6EctbAUiKp8ND3jW3qjVsbtXn2swm5p24GADo7HoMDhzkk8RxnBZysjvhqo2k1W2
	 UMD8fwwKoiPb5VOlsBpxs/4M8IU3TOHdxgqeCg/la11qgWhvi2RnYKXMNKbcb5C/y+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RRDTRz16;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3324A606A329
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3324A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RRDTRz16
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso76411265e9.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780931; x=1796385731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XZeii/VW214rh0vsKwtrU2Ok4yszGoZRil5bEJfNkjY=;
        b=RRDTRz16Zt0/O4FKZhopLTpqiMOk6RPUugJugCum8m7+uN9oY8xFO1ZNReL6uPo22j
         UyGWZhlb3taWYNOtadLD36mEseSOZBzrGSQCfU7qMgmRGmuRoWzRs0yjiqENeBrbnBcr
         dzLe4irNhqx7GC9xFxMxN3K0ViOF7kubJ6qoxXrNhU+aU1fAvr9NAQ/ZMfXEz8pMjS9s
         OaWemYsBiI6Arkrf+Ti51oy0ZNRIwnDJG9RFDbNGtbuByUiQEq7tH3aKFjiJcaWea75n
         rfMXEZD2IdrGEQAphhj1ThdIqLtVOYu5VisOhSuIPniuoV/otVtVj1o7mAwh8fR4gxYM
         aJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780931; x=1796385731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XZeii/VW214rh0vsKwtrU2Ok4yszGoZRil5bEJfNkjY=;
        b=wSUF3qYqZPxgCuEPJUWP67XvZm39w16Pt4qE8pu57oapHp249XhI5oEprElBtnsiLA
         0QupGSEHWKoTgmqNNIM36k950rQfze3NCL2smr0Gul7mO9lXPBaVTlvaI6evFQv5KdCA
         wkHdboGq8DqmXOjUFJO70tJhYNHRiYvBr9VajY4ImV1zg7WC0Vf2tKxYrUpuTDpRB9o8
         aKo7XEiakYxzXUzKoALImLBYxJFNYbh9ue1TicVmZB2i54UCus7bteKNe0LMzuz1poqi
         OVwhNXnDmR3J46fPeDQB+L/XV3KPsNbDyfco9PxWZEw/jxYftrAdZgo2DTmTTDVmpplc
         CfWA==
X-Forwarded-Encrypted: i=1; AL+hErHVLFUlCkALN2lVKXFBvz/K/R6OOanVOYB2Z0lvgonpT3dGksCxELfR/hh5AK5uC+0SiI/uZet0I1C7@vger.kernel.org
X-Gm-Message-State: APuU4Z8kEn5uev+g4hD7EiuaGxke/6lMDqbPH5YLbWzVT1QWjMXQxwkH
	7MdKJHkiVFGYr578ByeGyfBA4CgSHdBMgLRHLuBl5OP+cS0dkLRkircO
X-Gm-Gg: AZFdTZeshzDdMORrnNL5j17dcP9EwIAzGVrp1W8TwkMCxyWHWXH31jGnsnehkVg8Z/0
	rYcamvkeuNKwzzjChgu8JRFAIkjy5Xbu5qzfyGSs2X2fKn2wQGnJRgyFMJ2S2Om3oVL4Fy2eFW+
	+VRUNeHpjR4MeW3gknLMLQP+2Qs+TtaU4WOySJUJZjwxmUFBeMznfNn41NI3x/7XqE7YdgC4on1
	jgd7mkzuAG70XggLCyUXH9uAmyIKtY6lszkk97kiaONBjs8ip8vECxFRyTkAhRVWoYTP35rvFyP
	4m/abGQjS7BmJcYifjUez9+ADOCdPQPMDxudLmDcKw6Voh4QWFxqi3PIUzuvF1Z8MJ4wlZD5Qpm
	LsDHati7GJ2aQ0MHHoMvVxahf62tC9bEWUQ40+M3P7in1ZJHAZodPcKnrHrDc6MHDByVsQJDXMz
	HkHPvYP1vPWzcUkCQ85dQx8vPgw/8+Bth9D33DcjAXQqGcx+//5EAOMHq6KmbiM1R/iB1nkxxYF
	ItjIypPfKJ7xv1LCMbf7g6kfoZdBzhtnxptr0YWikeEBSrx1KLM3TEEc8lsTxOqUB1h4RmqlRWH
	vg5WCPrflmFcN5MFKcPorz5dYFu832u0K/mHYlACcsAo/B5x4hLQ0Hv+j/YrvEYJ2Myr
X-Received: by 2002:a05:600c:c173:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4bb88800134mr467671145e9.11.1795780931338;
        Fri, 27 Nov 2026 04:02:11 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:10 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v14 29/30] crypto: amlogic: drop redundant A1 platform data
Date: Fri, 27 Nov 2026 13:01:02 +0100
Message-ID: <20261127120103.1532882-30-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
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

meson_a1_pdata is identical to meson_g12a_pdata; drop the duplicate and
reuse
meson_g12a_pdata for the A1 and S4 match entries.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index c11d7d8250ea..d11319425d5f 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -305,14 +305,6 @@ static const struct meson_pdata meson_axg_pdata = {
 	.support_192bit_key = true,
 };
 
-static const struct meson_pdata meson_a1_pdata = {
-	.descs_reg = 0x0,
-	.status_reg = 0x8,
-	.setup_desc_cnt = 1,
-	.hasher_supported = true,
-	.support_192bit_key = false,
-};
-
 static const struct of_device_id meson_crypto_of_match_table[] = {
 	{
 		.compatible = "amlogic,gxl-crypto",
@@ -328,11 +320,11 @@ static const struct of_device_id meson_crypto_of_match_table[] = {
 	},
 	{
 		.compatible = "amlogic,a1-crypto",
-		.data = &meson_a1_pdata,
+		.data = &meson_g12a_pdata,
 	},
 	{
 		.compatible = "amlogic,s4-crypto",
-		.data = &meson_a1_pdata,
+		.data = &meson_g12a_pdata,
 	},
 	{},
 };
-- 
2.47.3

