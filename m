Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDA035E1B9
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787281414; cv=none; b=A/pn0FH4hOdV8z+J4yM8ose9EWwowSs+VyGIgodoVFHpJLfO7pkjc4rGLDkVvhKVwyuniModGjzP7rf8thAyVaf3Htj9+4qtIRSKZtKE71M2IIbAXMiQOJVpQ95qtqeHs8OkemVf/Bn1VZOTq2PUQHPy09OtsFXBMdxgbHjVplo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787281414; c=relaxed/simple;
	bh=UIFM5M3YdbW6mYCh+6wGdniTiIWoponM/veuMwUGqD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kZ1FFSgKCZUlXp/EcPqCtFacSwo/Wb31qp5jvDy8Gbaxdqfi89+fxjJJQuvFXSUoQXtSiLFTl25Nt9vF7PW4t6H6WYQVps+l72L2DDFZPk4Gor0mdKlNixJSxLwmsMEQG9OUshSWDjVaj+BMmYQ94rf+k8yErm4KKTD+RLgVQEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me; spf=none smtp.mailfrom=mswin.me; dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b=bwz1mg5O; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mswin.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b="bwz1mg5O"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1670dad7a8so95033866b.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 20:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mswin-me.20251104.gappssmtp.com; s=20251104; t=1787281411; x=1787886211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/djXBvzShY6dqn1dOwwRCbzxLVbePc2HPBHRPfCh3w=;
        b=bwz1mg5OIKujiLlokKFrYUsNon0ZCo0obMVZSe1X43vhCZ2ZMh8NMfFicTHN/UQAFE
         /d1LjeuOd0ytM6kyzzWeDrCRhqiPlZpgE6vGc31NS5tIXMT2gDkmKUb3xDR7vmQeDrNk
         QLvSndwAOwGv0AdRRTqkfzoiOt/LFmG3AI/fam1fXXcSJ3XhEcE4Wone8aCLvE8P51xA
         OeF3bjvsWfd0OztNzIRZB0ej5AULfCsdQ3vzWK1oE9f3iMFC9f2KyQhmaV6c72kpw9U8
         S5cDG9zZJBwF7F6z02bDO1Crzr3yO1zJitA3iNYrDEzcqcuzPKghxMEZZrGu/bvwo0aB
         ZEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787281411; x=1787886211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/djXBvzShY6dqn1dOwwRCbzxLVbePc2HPBHRPfCh3w=;
        b=o+76Ow41WUXLQgy6R7ehVSEJHH5oaAfvtUQI37fwAbhS0cpv/yt4XZHlIwJn9qBtDO
         ZDLGYLnf0l9ZGFtlNcRXTIBQjHtfrkWsAnfXDbCwk3LaZtB2gbQWFxM63rDS9+3Sk+8V
         io5ScGr1mcSL0JGPqXgK0BrmLZBX+JRnpum7/VHqobDXjgPpvB3z61t2qwEjDrx2G3X3
         WHgVywaCgZbBpFcOMc9Fdcw7MjT0Y3XuAJIcpWDSeNGgVbIVqhdDzZSMUZ2wPXlC57nU
         IynDAzbbIFDsnLA6mspfmcKob5U9sAnxQKFjbSgZwwGobjjGK5K8IzQJIu7KrQURYLle
         mu+g==
X-Forwarded-Encrypted: i=1; AHgh+RqALinsR/gqdZssMciqqLV1bTq0FFpqZFcfwtUxhHoTkPgLPW8faLyvbJwKoWT+FM7Xd797YvQfYyTX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8FdyHabWv6e9DBZNxksMgckX0HAtfXF1EG07OaDd5HTuxJ+tt
	O5U1TMa1rFmUx4pyCQXuXwWdI2JrwjRwTPnH2LOXyopPHug3X8asDOCCoZMLZhcJrVw=
X-Gm-Gg: AR+sD128LiJlhwFlz9O4GG5Gqt3PZfgNh7w3GmwXJYzsWjnEDoVvSoIWcMoJ+5Yaq7G
	f+YlQ2Lbbs5CZXO+iBCJgONOU8sZNW/41L7nNqGsa10Z5/++4EnYgkcTtolX0zs4X1ct2JIsAks
	mdp3GjjgG2IJ/h0TMsgR1/uyQZHqG3TnETjCG9NexPmO/k2EMRLPaiEqlLTW1ZQKiYOpNJsG5xz
	SwbCFWn2ZF1eUA1o9XsbPW1huh02eQzisAdPWcOYYHWxgskVaKf1Zc9MhFoXOYgEfJoO07QqY+N
	RKXLZ8O4isXxzoKoAo68WSl2elgDVpQR4muHVgX0y1wnX79O93oaXghZZrOcyYlHodl4GZk5p+n
	lKbdkwxP9IZi/tEjYY9SwjILxwbR/Kc9MUgjfqL1b4UFsgRVXEeHqL3RgNakUIX5AoRRfVtSMkd
	o9GM/aO+kufnkQjPbMyFC4l+Ku7RHWtmJC5DJHvjRXiNYdUdj6p2oI482/RocqEEYnuQ==
X-Received: by 2002:a17:906:4787:b0:c24:6f60:3f7e with SMTP id a640c23a62f3a-c246f60404cmr227752166b.2.1787281411245;
        Thu, 20 Aug 2026 20:03:31 -0700 (PDT)
Received: from zephyr.int.serkovo.ru ([85.17.200.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591df293sm274875866b.45.2026.08.20.20.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:03:30 -0700 (PDT)
From: Roman Linev <admin@mswin.me>
To: Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roman Linev <admin@mswin.me>
Subject: [PATCH 1/2] dt-bindings: thermal: qcom-tsens: add qcom,sm6125-tsens
Date: Fri, 21 Aug 2026 06:03:24 +0300
Message-ID: <20260821030325.1823829-2-admin@mswin.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821030325.1823829-1-admin@mswin.me>
References: <20260821030325.1823829-1-admin@mswin.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SM6125 has a TSENS v2 block with 16 sensors. Its register and interrupt
layout is identical to SM6115's, and it needs no calibration cells
because v2 self-calibrates, so it is generic apart from the SoC-specific
compatible.

Document it in the v2 list, bound by the qcom,tsens-v2 fallback.

Signed-off-by: Roman Linev <admin@mswin.me>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index f0efaa834..cb808ce5c 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -78,6 +78,7 @@ properties:
               - qcom,sdm845-tsens
               - qcom,shikra-tsens
               - qcom,sm6115-tsens
+              - qcom,sm6125-tsens
               - qcom,sm6350-tsens
               - qcom,sm6375-tsens
               - qcom,sm8150-tsens
-- 
2.55.0

