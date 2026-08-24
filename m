Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B426C28E0
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787529839; cv=none; b=HETV7eHJQgL6WEgr3T3U+Wd+C0ajf1YtHnTCZwU05tKJ2gpDIOYFtOjICh5Q+2IEXk+goeA4ihmy3+HdjD1ZPr5luQQ20GAqQXxCruuHlZIyvjwmWnD1iYkNkhLZ/KzDXQ1kWEpIvbVU8qH4gzR9PXJ8fQi+6vjBiySv+GynvEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787529839; c=relaxed/simple;
	bh=Xy+kjXanicX8kUmLnzlC7YYBUjN37OBEgvVbJHPzWz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RkpyNLNRPWkc1DfhNl4/fDIB/c/eDEyK9BS8rNMUcWgluJ9pamgTbvUdM64ikqTpE7KvtJSmWECwnj8MANFTjYEaekXPogV279vNXF5pnDxurMqJur7IuYj7+PoYxHcDRSNPPx2nuVopbz4OxuwcYCBEwI6BN+NjyYUf/zlqTEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGEghqT5; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGEghqT5"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso2378669b3a.1
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 17:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787529838; x=1788134638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rWm2gOFF46IKwvZet9m1yBgyP8pz5pmvbsrAu+4BmRc=;
        b=aGEghqT5tFZZDbllNLVN+9D+s+KrqpRA8csGgBKDL9NqBy+pKtIKLu47UUXY6wn2Gp
         OlApmdgc3gGe8cY2h6FSDssMTG/FuNbOSIGgZohD5Ook8GCVBFRdEIOc4X+0JuoA8V8R
         5ctf6z0CuYefDQvFJY5BRLOeucvPWpmbwALxy+nPnuGV9HElNZ78UIFOnwaTwCddlEHX
         ClNE9pBU/oHN1TUJFo2ZwF5u70y4dg3RRdp+Eieih0EKsIH+UWWPS8s76kfW8SIbTNhE
         YdQBi8hY9f4dolVineyo+1awTuYu0Z+gHWQiNezyJ29bnIAbgL0MA+0NiNUU9icBxZyi
         c6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787529838; x=1788134638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWm2gOFF46IKwvZet9m1yBgyP8pz5pmvbsrAu+4BmRc=;
        b=RRF8nu2o1jsaj8N6GPC+XS1IDN08CJMZsEs2NzFZtSL5Vy1Fw6ikceCpCcCo8Okpx5
         XiVXvgskKAcsqAHbye5cefrZAG6LW273+/jaf9XpGP5FljX//n4c28SugIHm+KWGqjU0
         OFJpw3VlwpmySMaS1KvPNhcyZHBZ+V/4DHgz/1JJCh9vLtvf/iAvKqIggIB5kHw0SETn
         OBdLgp6leIIKTlIWCN6N01OgJyojnu6JYpvZsf3jCpEz4mLpZie/B0ZVFBpwG4XWnu5s
         1OMxST3IfAdeqhmgOvokyjjkQEDniLOz4UtF67EeA9gVq6sR4ddYspLd2iaFfEkSfsMa
         vXVA==
X-Gm-Message-State: AFuF++kDdEMSgkW9xdVuAf+SWSBHbw2itxMoIikkjC8T/8QQbtf96ULt
	uDBKLTW3Dy9c+nktLLL26JsF4yJAFrM0238w7GUloafCidFf2Hk5AeqqwUGoJA==
X-Gm-Gg: AR+sD10/Svv4rEqof92Fg6ow+ElW/Nq2BAbNjkAH4Uz9o//KwMFGCOqNCj6lw7rLuwK
	ClVkduhF8syvC9d8kZbslu15dXRYY3HLWs/Yc4cFTTi3EnfOTEZA0nri4PriwsjwcezfC37RhDf
	mdw0Uz+b7M6sKpYrV2+j2dnyIRHIi/5VHBEkLbVJItEW+jScgRZoGVDv9JZWWetEi4GhFlhZE9h
	qdZRXdys4KD/mRA9duCyDuZrm9ZC1STcxykHBc7DdXp4J+pvsMmHf+hB55FSuz+doMVvm20lCfw
	os6FVLSJ+plRUVEur/JATe58VcBBg8Oxo9dor9t7CFiGhi2yGcJxC5bJCGyludeuwbXGBduc159
	Qn1nCNHe/7TzVkArnKR0Ao7VpuEilR8SrsrTxGOc0fuGhHNE9MsBP3147896UY1uFaT4zE82rqH
	+Hiou6Qs/6hYduAaTxP1iOOAssu3KSshRTmeAfXIKRFLIhPGoRIZL7znBRvIaMMlec599sc7dDo
	7DvrQKJEt9NYFrOJcPAQw3J3IVmCufuRayX9R5aDc4IMVugVl8neudWRJGIITmeDIDvLyeWfKft
	zA5deS2JHBf3vg/+LxxEwSLE+C+6rvFYD1qDMatOrNYPyiH1
X-Received: by 2002:a05:6a00:1407:b0:84e:c851:a058 with SMTP id d2e1a72fcca58-851dfa0ac9amr27654239b3a.10.1787529838013;
        Sun, 23 Aug 2026 17:03:58 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520ef0c76fsm1393108b3a.18.2026.08.23.17.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 17:03:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Grzegorz Jaszczyk <jaz@semihalf.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: armada-395-gp: drop unsupported SDHCI clock-frequency
Date: Sun, 23 Aug 2026 17:03:56 -0700
Message-ID: <20260824000356.79844-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDHCI node carries a "clock-frequency" property, but the
marvell,armada-380-sdhci binding does not define it and dtbs_check
rejects the node as a result. No driver consumes it either: only a
few other sdhci-pltfm based drivers (imx, mcf, iproc, arasan,
dwcmshc, xenon) read that property, while sdhci-pxav3 derives the
maximum clock from the io clock rate.

Remove the property.

Fixes: 356645123581 ("ARM: dts: mvebu: armada-395-gp: add support for the Armada 395 GP Board")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-395-gp.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-395-gp.dts b/arch/arm/boot/dts/marvell/armada-395-gp.dts
index b854b73a64b4..fafa204387fd 100644
--- a/arch/arm/boot/dts/marvell/armada-395-gp.dts
+++ b/arch/arm/boot/dts/marvell/armada-395-gp.dts
@@ -59,7 +59,6 @@ sata@a8000 {
 
 			/* CON18 */
 			mmc@d8000 {
-				clock-frequency = <200000000>;
 				broken-cd;
 				wp-inverted;
 				bus-width = <8>;
-- 
2.55.0

