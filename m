Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D66D3ACF11
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859700; cv=none; b=flkoG0NL1akjik6cKl13+bTPgEMkwOYPGinNxqTBoF8mo8JOHiC/RJ4LlJdmiI3vG8TGjdv0gY6DzAIBATLNNpLyiFtscN+Yyard6jv/5erkZTfJZJ8PimrgxC/NLqZ46uxYjXc3VMXp44sP/dyyO1DtfJr36eQhUpnqTZENSYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859700; c=relaxed/simple;
	bh=FU2BsRVbMrWT6qiM2syqQWN6DWesWvrlwberUpLr0fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NCPkSawXLOi0XhS6DAThDG936sUmP5Pqzox+2vmvWTxS+lF4M29CUYS85g76M+ptfg19v1PjzaunuMjxtwHBRWfAwqcbL3x4YChamEsTZhdKp5L+06n+IYniF0enb7CIzgrqVErEXXpK3hYh1qgN9K1PHGMCWGRki5vxVH6S7xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+dgDGln; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+dgDGln"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso36847215e9.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859698; x=1775464498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOsQBpsZfzg0bt0W5kexVa5Sj6fg8I/sbfWtcta/yXE=;
        b=Y+dgDGln1750vZomOqURGjyIKmofKaL0nUFwnb3/XqxNvnnSFDk33oEbNEGE+33d1z
         3nCXkHrGWFRVMKEICzBlKBc6g6PY93L+PEK2G11Sb8qd3AxZ8AG4CgT8GFBG9zRmqonz
         AEoL9UlWowIJvlZUSy3rX3uZULl1RRZuOB0g5M1Ko3zKsr5QtIPUIyJ9vfvIg8Jpel3k
         Kw0EHXffbvepmNdk/Oc0PH2BnnVfNa1LqJbMm78vZ8NHlQbqRMa2AslIRo54gYlcd2ip
         PfHBH7Du3Tsk78SzBx2sBJVuzkdCp7dFFnoj1jhakMo+TC0DV83hGZDES8zfw6FFlbnS
         wT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859698; x=1775464498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kOsQBpsZfzg0bt0W5kexVa5Sj6fg8I/sbfWtcta/yXE=;
        b=ExErABwaohvSOfJZYmB6pZph4YaBAdLDVXbMjR1Y07nrwcX9aCpMKhNyX5szoBgsNc
         XlclUo2Xx29Pp0QVSaCYVzpm9h4LD7wXgD4B261LcD5DXse5aOhb5UuK85LjzQT3xEKr
         iPU5PL/+aMGszwfZcrBQfOoLJ+Ls9/UOkXi+e0QL6nbwygIEVzLzivtZEKTX4mb+LThk
         +KjDEmMUyVc0oQYnAtZDqzLN4EhRqgmcHdAimTlWs9mwVMtVH9YBt/R2GGeiSpQWXmpn
         H/ER9IEOS7Nn7Mg4XRzPhvraQwYAL8Dq4rzuo5MD5oUW1gYsN99bF+3v8RdbzywsKujm
         x/ew==
X-Forwarded-Encrypted: i=1; AJvYcCVw5O+oUVZExmHntbT6GbpmQRq+/sVxt9hrVG4NEk/oByCES8xZm6sIojzyqr/VHww1+4dFuTnMFNPy@vger.kernel.org
X-Gm-Message-State: AOJu0YyOpOZeagk3hknATV0mi2lSjw1J9ow6w82avcb7bgBs3mRM1xwE
	cS74VIrXUXvML9oY9LvsHw+n4glIR8UJcHNwouwU7TdNG6k+cOBVU1lY
X-Gm-Gg: ATEYQzyP+ifMoBBads+MBCY18JencXdxAZYaZeK5I7XnUBQ5OlabYc5GrxL2fRL4KAH
	ebRERDMLGfo1dlkmK98Ddrk5O5roF2BAvuq8aQ1l008lv4c5dTzl5sXzq+PrPDynGXgE0VFh4+h
	af+jXlBOarTBfX1KmJYRLt733P4HlYG9n4lsVr2XIg/gWhmIesgeG1GvxLZtwjvYlmyFXWQ5Lab
	D+VbjC/6u9T5NIsZIjY6NariRvFbS0a6AR8/3ydP2qgTs8mfSZz/2sLrm5p+f3w9fjwdH3trrI2
	d7GjukoJUwWxpX1xwhjlIb08xfeRKixfFw2ttLAXvTOmGGnVvnNWGjehmYm4PaHLQ5KJir8p4IQ
	RpiEIUvQXfCt2SvvgVkfGssTd5LR5b9VXF3APfFYfAvF3F7cQwFMamBAdSdpw8pzmc3zYp6VHzF
	PqOPamA9lb3dqSW/hHwQ+NltbV2Xjnwg==
X-Received: by 2002:a05:600c:a30f:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-48727c81e54mr170906055e9.0.1774859697668;
        Mon, 30 Mar 2026 01:34:57 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm508329995e9.2.2026.03.30.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:34:57 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Mon, 30 Mar 2026 09:29:35 +0100
Message-ID: <20260330083429.359819-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330083429.359819-1-l.scorcia@gmail.com>
References: <20260330083429.359819-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabien Parent <parent.f@gmail.com>

Add the currently supported bindings for the MT6392 PMIC. Remove the
required constraint for the regulators node compatible property to fix a
dtbs_check error.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml      | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 05c121b0cb3d..bfad018cfbf3 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -68,6 +72,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6366-rtc
@@ -99,9 +107,6 @@ properties:
                   - mediatek,mt6366-regulator
               - const: mediatek,mt6358-regulator
 
-    required:
-      - compatible
-
   adc:
     type: object
     $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
-- 
2.43.0

