Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B064CC63C
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828678; cv=none; b=iPCyR1eTwTRwUInyaFrW4jKfLb7bczeIMSj9/pLeEPR5dFtQmEA8F1IADkJep1pYJmXMgCBRZUaH899uyFxTZ4UTRpts/zT7IzbKW0u7XDGXZiEGRhU8f0xoM2yIPG3vOPC7zR8XCvp1IoMc9Hk+iHtBvy1dpTj9xLReePu3f7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828678; c=relaxed/simple;
	bh=ke74GPjOiVdcLhuz3rtphO6+a7fMHTX5+RkRMzBMbnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JdBZb9J/n0RmZB7+SFN7go7BQ1gH25eYq277hl3wsfpwmQXmBNjeYhnSB+uDM332Ma085jo2QJgMZL0ckwl6AKqaB1qMXBTAg0OD1QktdWjuhGxYW+PU59BlfR4p0y4b+YPr7cm1015dqfKRgW4EQ1L9brM9DmTQnA2twTjyPKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=v9fHjtOC; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="v9fHjtOC"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c34bff61551so202415666b.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791828674; x=1792433474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+lZKGmObmd47/Y9rOiwVSAJPnc99rNMg+8rnP10wQQ=;
        b=v9fHjtOChy4q/9OnQ73899fI/4sfIG/BLv7pBMW/RI5vsbLtIqqPCq/T+lmdVlphrw
         CGKKZYEycK/5zuZlbbTiOcqc+6xNwbLsp4VRxxNXpvSSJfS0akjLAHd6nV99mZN/v9O5
         K/8qz3syslxy8Bm99kGmKmS3rHqbASCcAeKRhLYMrdqfsZgfmSziL0uiuevGbAcZb1c9
         VNjqPvJFve0tq0w2v0Z9g7A9Sebna0BHeM7qcOe2zDDSLsNh3PPMyhRphrBvGkylWsrS
         LYeKfWK55sfmgf06pSShB7lqhIvGxrsmYRBVGaZin1F3BGEriCgmomQSWelIsmrDFN8F
         3DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828674; x=1792433474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+lZKGmObmd47/Y9rOiwVSAJPnc99rNMg+8rnP10wQQ=;
        b=EsoIDC2ZZXH/WigGsn7Lmzs4hyioJ1l4hfSW0EN7LevqhvTuk+zwg4z2Mb3EfmPgJU
         xj64sDOC1+yy+p6H61ifaeXSIoGctqEQhN2P8JWsdwxdWtwqdWyhfiBWJNGYZK9oN1Oj
         KFYtAdiRKwtzcuDAmKTL7/85x9HPWrWr/LwCoE2py+IcPK+nfx2ARt8hifP4md69x5Ow
         lXSR6EmPcRwWEr5LE8Q+rLtRPfmtC9NlRkuQ8wqMjLEZ1FsC2I7zNLVigj60Pls/E1IX
         PpeyySWe3df+CO/x1wvldE5aIQkt35eOQnN8G3hbZxU/E5xr1YuuxanKd4daPgAyerH0
         XXjA==
X-Forwarded-Encrypted: i=1; AKwUvBzVQG48FOY+PhwcCiOuO8T8ZCzYASmW9LjT64bpwbQM/hDgqA8KJQ9yJuTUOy/JLXZPU4gcmA2hTVUi@vger.kernel.org
X-Gm-Message-State: AFq9FYIIzML+P4jVz8Efq8CWpQkpcCQgWinnrUqsPdsWYogOjq/ZwyyC
	e5xxao7wtM9iiiKSPUJjju4rmSJMPwlMrbokiuINIEGwHEij3cwF4RxT9k9A2xgBAXQ=
X-Gm-Gg: AYBFou3KXES1vHttGSdkO9o/6wC4Q/2OP7dZBfYjzbln7z9B5UUPTzkANkKaigkpSB4
	sa/ioYxtucFiUW7ZxMzs1DDR+G37zhSof2h38R29rxaC5PE/OQdhJQrNZ7SIMTc6DQKusCgGnZJ
	lPbCfbnUUUTCxbC7OQBpHquoS32PuIMT8zYX78NKqFAYX15AOQjBcIvx4G8qYnv7Px7H4YDv7d/
	9h15iIWe5JMYiFtBbm3dIxwIm625oEEH+yJTM49+6l4Pz9yd2P5ImdY16R8Gduct0z2zbKnYh2h
	6IiJLmavlHno/TEsgDRHiNEdYbK/nyplxbYcO5H97SaxRFTbAKE9cVv4faG7l6L7lUb1Pipvk/n
	sPY6hECaMaAhxkNWPT9Hj94ccncYPm/fh4QP/WhoqqvQCjtbjkl6rnuFkq3MooTMEVPPuH7JCg0
	sJ3sQL0drjj3YKa95lbaq5lby45NPMVXM2mGV1z67C/3yZAzMm+TNB8Sc9vyYykYqikvUCfm0mI
	p04tTH2vtJIQ2AmU+HO139gb5YwGKm+4u9VjhogbGC7Aj3QlJkg6ZSLgbwun6yqMvUGJ/VI8tbW
	Y0ZKRf2NYReK6GBqLlc=
X-Received: by 2002:a17:907:9690:b0:c21:450d:cd88 with SMTP id a640c23a62f3a-c31a9a3361fmr925645566b.6.1791828674339;
        Mon, 12 Oct 2026 11:11:14 -0700 (PDT)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac924dsm498415466b.70.2026.10.12.11.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:11:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 12 Oct 2026 20:11:04 +0200
Subject: [PATCH 2/3] dt-bindings: arm: qcom: Add Samsung Galaxy Book2 Go
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-book2go-v1-2-7188e7ea7a15@fairphone.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
In-Reply-To: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791828669; l=1131;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DuXzIQSun3W9jTWkn0omnZ8RlHXkIOkrEU0r1GCIViY=;
 b=oxiEWLGe3H8pzO7bcR/tz+NQOoZwruYk7HCL2vpDG8HwyoDuSCTZdpze9SQqgYW2Wkw1J2FDY
 U1pxGlyB9J1DKCDaaTZsaiNK+mo0vI89+6A63YfyKvYFP379CuXN+2U
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Luca Weiss <luca@lucaweiss.eu>

The Samsung Galaxy Book2 Go is a laptop with a Snapdragon 7c+ Gen 3 SoC
(SC7280).

It appears to exist in three variants:

  NP340XNAA-EXP:
    4GB RAM + 128GB UFS, WiFi-only (NP340XNA-KA1UK)

  NP345XNAA-EXP:
    4GB RAM + 128GB UFS, 5G (NP345XNA-KA1UK)
    8GB RAM + 256GB UFS, 5G (NP345XNA-KA2UK)

The internal code name is Hermes2-14.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..5048e878b7ca 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -887,6 +887,11 @@ properties:
           - const: google,zombie-sku514
           - const: qcom,sc7280
 
+      - items:
+          - enum:
+              - samsung,galaxy-book2-go
+          - const: qcom,sc7280
+
       - items:
           - enum:
               - lenovo,flex-5g

-- 
2.56.0

