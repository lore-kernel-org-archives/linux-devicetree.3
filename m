Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88CA499F20
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398990; cv=none; b=ZELSqjEiOF+VyDmiXc9pSDelmNtmOTmv5XnV0E4b94H+nr44K8A4hYvZBOuvE0uhlqn52pQB1q6XQ3sQK2cotF+Gz+mbB/uFNcCcLZzdxJx9l8QpfCwo9qNTe+ajiTmAZrI7mQB4te48OPwmAWS2B6Q6nnLMJzVpXXeIqmATbo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398990; c=relaxed/simple;
	bh=WNP9t6TIXZ0Xl+cKQ0K8b690KUl1scppTVbII9h9hh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHDNRBzBtjJrkYr0n0mOUcYu1vXbrUI8deKlTJeFcYEE5y2dOnkdApllIfjsa65AkbpHzBDYakXzkEi/2wsot6fmbPWUYlR23Lf89EElzrgVDJsfne17oxCgc2ZP2ic85gFO+FHIvEKU/Np20yi8ILVisl8B72EkuUDm2eFWDdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VD5S1t1A; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VD5S1t1A"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c423b145922so144542066b.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 01:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792398987; x=1793003787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZCkslrjV5YGHVR25wzRLTh0GGDFeMzjCzaLuY5/q3E=;
        b=VD5S1t1A+M4ysbBYWBNahSQ0jaxLgmfHy6uYYITP51oOxcuzMNJ7W2qakpzzcyZgkX
         atDOKWMVlcatHAPpl2VDMxqNm+cMsQSm7IuujPD0HqDAxcisaTXYs5ruTS6Lj/buSXfa
         zPj4cXcja9FZr/NRRMr8ufAdHRhKBIiWbKkZ12SHtntkk9ZLVg3mM1AsFhC8FeD/rec5
         szjtVwpNJnU3WS9benbANAd2Mj2dl2XV3OOeDaSmmwywyH2wdnfLnzxcAHoM3wwg6HIh
         vHW62bANfFLeYrLBGRWt6XueLdCwFkmG/xroIAPhXxZaY4Iv1kjVjuA1MD5S4cMxL+36
         vbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792398987; x=1793003787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZCkslrjV5YGHVR25wzRLTh0GGDFeMzjCzaLuY5/q3E=;
        b=ggnl7sxyocvl4GmxJqiZcDWLjpf98bRgo4cveNLWgg1uDSz7VLMfuI9MzzP0JYHFKY
         bXSzCvAbUhgv1vcLEOQC+M96ExgpH5hQjWeI4SvVe4UpzvViIyLYiG9rrtewsAuEIlrl
         KnsGa0JndBUY/zhB+XJwyZ6YSqOXMMfg0Lvd4OfUr9eAk3AxdMg6S6bvy1b2whGSR8mB
         U/uSPn1SwMJR13w69DKpEoXh1PWNZp3vOqsOo8iTdjFqhcgKAb08g6GIjoS2nVwZUJdl
         9MqcmyeH/wklJ4h8pBn++Qt5D1DWcn67BsaZDL6+XuDR2Lw63OmCKnFLzlrLVVWNlcWl
         39Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwKpBkDyB5sRh4O7CHL9v5G09x6ALmDbBvMGfJlYgKJc87/VBJrfgkEU3iD6VFhAlM3q1ZTOJffi4b4@vger.kernel.org
X-Gm-Message-State: AFq9FYINERg2g1S6I6nVonA1TGr8pInJnZyBqHrj1aKc2/arkrElft1L
	gxWrWCLvRVsiTG6J2tLXkfq1Hn0IoHBUfkDWuXIInr4LlgLi0YMypfdF
X-Gm-Gg: AYBFou2zFW2+YzwTQHn5FAMevBCZFfbIgEJZaLiIS0n9NExTcDJooa8EzHrH3otDRwN
	joK3+OoagDGpiAB9/htCV3tCLRyCnKuXdpRPdejkvNR/dpyQaslk4bH94ensPBj46P/JBi0W+8a
	ADNc7kz9AQie+q7Jf5OnLxjyT5sfSdIGN+1X/Go5xSELPiy5OmdpmrICz1CjmAJb0KSWT6f9wBU
	aKj/b+A8TsizylXuExUIEdfpj+S8Pga4iAwnCsa6hBV9mSg7vDuTFIkag8TY+CbFu022r9LZ5Lc
	EuGN5I4B+m4BtoJRxu/QiuArpF+lAjMRHU3dmNhP85FLcFG0brnumH9rwBnsN2sXV9BYvMSwSvo
	Srt+bNXP3tjK/r6/T14fJ/wlWwucwl8CFF520SlpXmvavWxpnvnfqjR4uDjYiYttfymFgFKUnow
	cQwhR4YbXCbk7cNygtNAC1Om1AtIk98sWnGEVKtTDq4EI9FLlND1TGl4QvKRmaFbXX1Bxa67rZk
	EDZxySdIMzvSY8SrSfqpUrKbdEzUO3Nq1LVbkNKyVXacQgKugUTiz7hiopKoYltx9ffDt67dmzl
	Au0Vm2svVbOycAoDoUPncBscBEk=
X-Received: by 2002:a17:906:c142:b0:c25:91bc:ff55 with SMTP id a640c23a62f3a-c419e639cefmr500101366b.23.1792398986916;
        Mon, 19 Oct 2026 01:36:26 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf98fsm323106966b.13.2026.10.19.01.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:36:26 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 2/5] dt-bindings: iio: pressure: infineon,dps310: Add Zilltek ZTS8032
Date: Mon, 19 Oct 2026 11:36:17 +0300
Message-ID: <20261019083620.1285782-3-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019083620.1285782-1-paulius.zaleckas@gmail.com>
References: <20261019083620.1285782-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Zilltek ZTS8032 is register compatible with the DPS310, but has two
more pressure calibration coefficients and takes its temperature from a
different sensor by default, so it cannot use the DPS310 compatible as a
fallback.

Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../devicetree/bindings/iio/pressure/infineon,dps310.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
index 1912a1b0b4ba..416117dfd927 100644
--- a/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/infineon,dps310.yaml
@@ -11,12 +11,14 @@ maintainers:
 
 description:
   The DPS310 is a barometric pressure and temperature sensor with an I2C
-  interface.
+  interface. The Zilltek ZTS8032 is register compatible with it, but has
+  additional calibration coefficients.
 
 properties:
   compatible:
     enum:
       - infineon,dps310
+      - zilltek,zts8032
 
   reg:
     maxItems: 1
-- 
2.55.0

