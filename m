Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445753;
	b=xFoTbcmvkr0v6cy5Tf6b8+LAxKd6c+ugkuR9CdJWUkTmfay0bveNzfwjXFbm8e+Awrxa
	 kUVl7JfxW7Hlje271pEFYF1XdksxPFtnG9KeGzHJtIpeCAqD4oqiNLUupfR7DV3U8cyNQ
	 xANAl9t0OlmoF0ht7LlWnSWPFpKJUjlSTrSsbbI0iW1zBHzX3LO+mVMUzoojGvh8xbASb
	 a0ZnXSiCtHX8CLVARb34SUBGgWo4AeERK1pj0hBqy8Z2xpmV4lKfSpgoN2Oeby5OEXJUl
	 iPwM3vWHovaBYintj3tmO9K5JO8Ey3auOekUnuthm+JpKV7LSIIk8L6ezXm3ZNM+9Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oz6HnaVkQNp0wlnmYBqQmR1f2nmsjZ3gtDQXQzDwKzQ=;
	b=zrHxHGoyQut0te8Cb/YTQi4ahdBKRRiPg/VQTvrtehg2Ee7ltCgSzM/vWZ/uOw7ceuar
	 C6SX0Jg/GebzSpjt4Jwxsvd8GGeMJlOmv017HQP65ubWGUXPHF0bB26mEmvlAze9XTmm8
	 GXRIU8TEwJrvjvqYCpS1QjvfFHTLCF6F6wWjNTWBhmj7B3dptyz15ps8UZWGxYOnTVzU9
	 5M5zEVQP7xnrMJDXps7ZlHeDmteX1x/iIWzeDjKzjtHwLUgwk3axXklMF3PgfZWciTsWx
	 VgG1j53UbVgIVjsg3v99D7heR1mZREpOMg+Pv8Mcv+5m3LrnLivV0F8k7FPH1hNcpbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oo29KnUP;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2F1606A31F
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 11:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B2F1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oo29KnUP
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab12c074f1so4082131fa.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 04:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445746; x=1794050546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oz6HnaVkQNp0wlnmYBqQmR1f2nmsjZ3gtDQXQzDwKzQ=;
        b=oo29KnUPaZOU4KVt+d0y6XBTsr0pOWuWjB0K/xrOk2rMsFzRHKI+fkVoPOROmsk+Kg
         tTKq6IgFyCeCbErfG1rBiqrxdJP6wHcE1fFNJo7Y9fSBBnn8tRl06vjmrPZI9DtCaxdO
         Y58hZ/wx4em1g7rrdPI1p9oYDTYgW8kqsvXvFFAYboQu5QGd0PgBXd8oiNF4jLtse82q
         8HvTm9SsN957LsRUrdW4QDgv3aFl2IFp17Kz4xPzT3Gy37HsCaItmvdorXxcOIyucHcg
         gzG4Azl8SJ9EcVphQrXJFcza0de1ZetjOC3jPTEEWaRPfjDH0s/qRLIGbaN1aje3QDYp
         +08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445746; x=1794050546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oz6HnaVkQNp0wlnmYBqQmR1f2nmsjZ3gtDQXQzDwKzQ=;
        b=Sjz8Xt4ewG2fifooM/r4OuwX5OAy6lEG0Pi21T+Q5AmJf41txa381FzekFMIKMw2vv
         1M9YWOCx6zsgT9u5ZFjdvcpehwpia78AEhYE7ynnuNbhvsv1xhTnEiZoK+v4CIVo9WOX
         SLmlslMdI4o+Zu7JmpV3wE4YH+uww1qG6/algO0u0HkAXkjEqDcDoSnXAcaNtersscdp
         cSdPOTpeaEQpIIdoj3C51rDDYTssEFbwbX/Gho93k/7wh69rcPXdtaUCkWx7E6dFVOxI
         0hzqG4w9Kk4WiABNuhyEsx4fTf2X2siy6zIi7vPKnFkkmtrkXg55qRl6bdDfmj27WA88
         CQlQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7v3AE0gNsohYZGx9D4pUDgxYwIogeHRfYcP8GWZZFJJXmCF967F2GdBn5ID6i2bcqjp63jK6+Gh8f@vger.kernel.org
X-Gm-Message-State: AFq9FYKT18D9XLVXMtTB2lPTVhEd1UoX2XGm0rh0Iu+roMFXyq+Jv7Zv
	nAEed+yA/hjRFwAL7UrOXC4Pr14uJvZUYnOSqZUBA+BzHLP1g9L1i+t8P8l7T76BwHs=
X-Gm-Gg: AYBFou1nkUkuUCD5h9F/Vixjp6DCp9qreu/E33PU3SbbG1SyelV0THUATocZzVdOvvu
	04cxX0frb6w1YIJNSQTlAJMUnyKc2fTzksxRTjpXOl45KCDCzTi7eES2ScfyhdKyFqptN/9Rhtk
	qYTGGs0+NkVNyFuPyMI3FRdmUYSQUBV0MiaQFPZI+Jp8og2IMyMyBGNbHja/tM5tHF07TmG0rkQ
	tjLOBc7XMz4EAZk0DPQY0zQg6ediSrLv5KJWlXakvAKKPFySNN4XxAyI/gBJ1wgEoWUqtEbyMu7
	csqM+KRiZBz/ip/TogOKMxuleyfDgVXF9oKEdBXsetAa8h2MxM+FiOj0SQpH5vv/7u5FMcfHdi+
	Lj0CnDaWqG95YYNR4uxjQyVV5W/Gvk2C/OLOaj2M22MWHXIrR6oowU82nxVnfKhoCsNehPybSkV
	dMS2f7maN9YRoGIU1Ej2pW0njodn1laV4qLXfuqQuaVsCvMHotlYR63WLzMn9D9X7hM/30HvRxM
	OfRO8EcYu6MJffR8QUR0kgWTZjzj7mSTqKldidP8+DY8j2lpFyt0a3hBu9BpX6jnwnq0I/SQyiH
	GvOysK+NacgxYYHRDHcbuY5UyPsne99/y6dGNI/PwETZFMww5YEY6ep63qcd1sCZ7J62HA==
X-Received: by 2002:a05:6512:3341:b0:5bf:b963:7167 with SMTP id 2adb3069b0e04-5bfd97a7157mr1898007e87.6.1793445746192;
        Sat, 31 Oct 2026 04:22:26 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:25 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/6] media: qcom: camss: tpg: Support TPG hardware version 2.2.0
Date: Sat, 31 Oct 2026 13:22:01 +0200
Message-ID: <20261031112203.545319-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
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

Qualcomm SM8650 CAMSS TPG blocks version 2.2.0 have no test enable bit in
TPG_CTRL register, test pattern generation is started by a test enable
command written to TPG_CTRL_CMD register, which is also used to reset
the TPG. This is the same programming model as the one of TPG hardware
version 2.3.0 and 2.4.0, hence lower the hardware version down to 2.2.0.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index cabbb2638cf3..a83f9a80c2b6 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_2_0                TPG_HW_VER(2, 2, 0)
 #define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
@@ -170,7 +171,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
 
-	if (tpg->hw_version < TPG_HW_VER_2_4_0) {
+	if (tpg->hw_version < TPG_HW_VER_2_2_0) {
 		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
 		writel(val, tpg->base + TPG_CTRL);
 	} else {
@@ -183,7 +184,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+	if (tpg->hw_version < TPG_HW_VER_2_2_0)
 		writel(0, tpg->base + TPG_CTRL);
 
 	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
-- 
2.53.0

