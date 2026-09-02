Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578914A385A
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 14:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359036; cv=none; b=kg9lFHkaOz7I9X7yrgEPyFfMup1MncJ56UhHizvcYkbLm0hrlicgGXkI7pDpKD6gQ5ltbpAl+RpznkAOauiL9GTQ02gaoM25+KyvkvmpM4+WsKMSim04gGN/I+1XONA/b+401+/F3Z+Y4272YZAFENnqIh4Khp4ouqBKsfMFvlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359036; c=relaxed/simple;
	bh=eLcLdB61xgQPGp9TGH/pxR0qtBZ/5ekjEqwjdW1d3UU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I+76pt7JwVDWmhzhv4h+NH38ENmQUM2l5Nw46OFKrC5WSibJxBUNL/QRfEMqhxNvR/1AvpzeIeh80EtIXGTMRmSsTIIbyiesHN8+wNrLLwhpeEJSbKHXTNsNryrUEoD5cU2UueMjM/VUzV9M4IaA40RdPxKugmmBCaiut8cXDiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FC7rUtWe; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FC7rUtWe"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso17954935e9.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 07:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788359033; x=1788963833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5YoW1Jzw+xb5Cvou5QkbkZo1EXSEsUxy2Wyof2lysEI=;
        b=FC7rUtWeocOH0+p6IP5JWUcQx6SEIuTbOJP3QMwEJooMIo5LWixMg625cjeNqfcic4
         KQFV49YTZSojD0EMjHVBxTLcjkpK7ma5HmXMBk2aAtc6U7uGDPHIvSnUCLvEs2fLU2iS
         7XobeHjuHEf4Pc+pD5nqQGWJzz5QyXwVK8PWzCXipSNQwozOLYd0wOiEZt/kqwTKjTn6
         NgpyzV9QlEsGoeHlReSzN2pYhMY2lp+xr66amynNdDGSd+FrMxhVzjlUuOKZmzzwCh4d
         kUxBnWIubU4UjTMV2lSTDthnp9hDBRVlbKHSVx4SVvZfgW8kMCO3YxMR3oFC6u70sCf9
         GBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359033; x=1788963833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5YoW1Jzw+xb5Cvou5QkbkZo1EXSEsUxy2Wyof2lysEI=;
        b=PmWK92w57oZShlyy/N5vspAJSZlfh3Lwz7sIVt2DA4nmRPA+p4RX0rmRTQz/Hl4jMa
         5k8TgfiCl9x1J5V/Jr+pi7Let7XvzuiCiohyCaFhPi5qPTgSrKLsEqqOjLyTqGcKHreI
         PemUKpQitNxDRX2glMvZa/+HSNb5vPTTgeMyWJ0UxEAljZ7VbhIXqX+DX56ciM9jFlir
         nxiVSe7MxkUl3y6ACZsgdMYCvaKt3EP22Egpi5I2i1fs9rw0PK8x+JgKrG1Gs64nMhsQ
         SGJzRDuz/rQLcBtJxSbDDtnZcVeSJzzpKlh/nlGuqCH/72+n7CfZ7uK/ld2I9jPwAmQU
         W8IA==
X-Forwarded-Encrypted: i=1; AHgh+RqWohqmhcSRZRd9BlK9zpcHfAiYPGo8zVAoPGKjQWzLWOzIRVIrq9dWSciDMtNF7BrOaPaSMA1C0V4p@vger.kernel.org
X-Gm-Message-State: AFuF++nq6BSBA6PzD8bT0qDF+doDCM9awTn6OhSEKXJcvfYkvBo1+miV
	UHaVwv1ckZGbzkdwthsBiwJpXDfL7C7pMUZLs84Psr3pPrJQtnEXnKJE
X-Gm-Gg: AR+sD10GK2+/FIUVjqoSaRgxRxqmaFVtNON2KVtFh+xERzcca6ulMlhDwXuNeg3Ja3S
	SDtmOYTKaOTLAYtLMUxVuNzS3E+THig2RbMTVhdt5Sw6MY91zCA0sldGAJ82lMl/oWuMM3i2BPb
	TfSgl/I4Vii4MbODPJfHNEQ0TerUI2JRE+ycTTOVOGpId55PTiB657UMdo+CvBh+5LaId2Gz3Wx
	zgayRmif/WYi3lzb/PJ9U3rOwJT/AGFiOfQOl4cjuIiCAIRD+r8cMCpugv3Fe13IILRkug2TLrH
	wwwjkNtPzgAqO9u+FTOibiGz4S+Jqw3RL74IonrQJRqfTrRIUWj2pIc7hC7L/CnCJK8Kyg+6mCb
	Uo+QUKFxnivzMeHhnI2UENwmIOMcXXxxGFUiM+Ej823D40lBmmAfXnKtxEcH2oGQMBAmc+3wst7
	1EFvIhsPkK8y7JTz2FpAHeFPBw3JVM1aQVDGQlmPpJ966Oer7o0m9qAdiJSRSChrJX7r11BlEQF
	L21A7Z7SzuxBD5/k6G0PmRmW9tSk3tLnRIULzGvmXU8JxrVTGE7mUfV7nA=
X-Received: by 2002:a05:600c:a10a:b0:49c:eded:44e with SMTP id 5b1f17b1804b1-49ceded0475mr11064115e9.7.1788359033274;
        Wed, 02 Sep 2026 07:23:53 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net (mob-83-225-30-215.net.vodafone.it. [83.225.30.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm58999265e9.1.2026.09.02.07.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:23:52 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	devicetree@vger.kernel.org
Subject: [PATCH v5 3/7] dt-bindings: media: ov5693: Add clock-noncontinuous
Date: Wed,  2 Sep 2026 16:23:17 +0200
Message-ID: <20260902142322.73523-4-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902142322.73523-1-fernandorimoli11@gmail.com>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com>
 <20260902142322.73523-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sensor can gate its MIPI clock lane while idle, which the CSI-2
receivers on some platforms require. Allow the endpoint property that
asks for it, as ov5647 already does.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
index 3368b3bd8..0d8ca0a51 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5693.yaml
@@ -82,6 +82,8 @@ properties:
         unevaluatedProperties: false
 
         properties:
+          clock-noncontinuous: true
+
           link-frequencies: true
 
           data-lanes:
-- 
2.43.0

