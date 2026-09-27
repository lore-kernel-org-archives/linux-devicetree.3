Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809E138E5DC
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 15:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521946; cv=none; b=Q+mfU4eNi7yqE/3JZMqGzvvj7vM7r9B+8TqiJWRI/XXLr+LjoeSYiH1PKLwAIz3+zPidJfBjmPc6Wtqh4/P7ynjw5fONNwRanyl/MBmZWO3FDUG+TfgPc4IR7efC9TxKwwn0lhljIFQruUJJpTYhJVbMC54/+S/jBJKN654WODo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521946; c=relaxed/simple;
	bh=IKu+NW7V12nnMBgKKHdP7rj1fpU2GspG4UzSnncTVMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jh9ZopZngWD0K6xRqMe7JteitZ9h/uHDkAdupgxScHvINaX77NulG5JUVPPxyDDaeFavQnXyUsR1y5NG1dysh+7yv/QiuYjv577aOk1pRLzetsqHP/tCVlMsmf06UCFS+bfkCGFCTZgkTsy4zyxoSIokA7m8BaIKW2I9yTpGyU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sS6wGcck; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sS6wGcck"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so1310237f8f.3
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521943; x=1791126743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=sS6wGcckEDtm5nm/bbgxYKujuHVksCJwzBWS0VFlvJh8D3ZjkPtgHohVPCt2JHwkFk
         XXx0pgrTViRD8Vg7NItBOYBOt213Mq25IiEMtkWGasGXRpw0eXCuoVOAoS5Sfl5dtWdy
         /mh22AsYrx0oByeS/lSQMzY//VRUzILCu25bTGNMUam/jmftNDuE75ZdYe3vHpd7MOgS
         SMvDFQPNLkgsbYa0gN0UDijYaQ5TNeLvdcbfZrUw8BJ1evu3JlIUbI/6R7y7zEJlesOp
         O/lvwVdiYzIomhUcBwcN5blykfj77Ja3hB7XjpbnezUBkg8BzF6FLyrJBCFI8Nc8c5Li
         d98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521943; x=1791126743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=Ad1HFY3nenfsb2LbMLZ4Uogazz1YxBCzx+RxyuRV8t97+CC0nV0n4Sxi9lVCR9cUAE
         YFvWa5q2TH8k+0wUJDgxXMXql/0/FEmFq+Q00/68n/kREOLuGQfna6PknC8F41AWweVv
         FnjX19aA8aZg66Rv8RwMfaTIDrlnmG0n6EP/AGpWKLcD50/LWzkgp3SVm64OQwckQopH
         RDF5qUh0EURpWCSAmTw39wRdULI18OQAOJ+CcG8wlm3nfonUIMxgDH5w5ZhWsuvxVWZw
         reTlUPgO5/QNvVp5Unk/x9fnjnmX2H6Y1D1n1BsLmFVw6U6tfHmdhkCHURdr2OGurWDE
         nRcA==
X-Forwarded-Encrypted: i=1; AKwUvByGYrbefI9AMkmrmUiu5NZtB19qi01LMDwlJuN2jKxgyqP3lb489ti3GKUkWL3EnNguHqFbPlvPnZA2@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ6S8hxmrDCe0Hbm1s+xSWKPdsaA0Kj274+dZTB/3dNGaPlebE
	wFTli88ZeePVhMbiZwSfAp0m/m0A2cbZDJ3I2K87ENABoJ2Pp7+Fjzrj
X-Gm-Gg: AYBFou0cUk2XlOGFoPb4+nxHID1+ESAd2DZ2atVzy/EcMQyStvN9JaDJDC4oR9ZaK/g
	RZHYtzgSf/+/ZNY+sHg3LFYwy0h//9SDUlhHl177VxuFB68Qa1OZ4IRq6Lm7f8JkWLNlZ+LawrO
	pjgkVDtOZsKHEKs+td7rBtYYv8Pq/F48IUcxxUh6dFV17P+zHVzg8sMDTXJ9wPZV3f/w2UROhGr
	oiOO2WfcL1GufmlCkEcKdQH7mKR5X899WAGK5x7VWJR3euVWGAe0DWxLbTP3IoLiJXs5m3vjQbo
	ntKkdGEB/Gu4Qgjm1E4Zl7vzS37Pk3D70qvrgvukb3kmu3PCf85o0dpVjmeXJFZxWV6epYXuzh+
	FTHOCFTwkWaG+zGT3PtHcTWg978YRLW4ftNM4oqgP096NHnd2K24n5MxHwNRG7qQLnKif3t4rvW
	cLKf+iwNTQFEHhEJ6+zpga27aNAsFXynwHOfbsoU3DbuBCzhvAFtAnk3qFrkrQmNRU1p+0h9NOF
	lO/Mybz8C9dGR8XU+gB1r+QtodW/oXg
X-Received: by 2002:a05:6000:4693:b0:487:342:d141 with SMTP id ffacd0b85a97d-488774f4f02mr11163439f8f.23.1790521942896;
        Sun, 27 Sep 2026 08:12:22 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:22 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Sun, 27 Sep 2026 16:10:10 +0100
Message-ID: <20260927151016.186493-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 RTC wires one alarm interrupt, not two.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..1699e3576b91 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun6i-a31-rtc
           - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-b288-rtc
           - allwinner,sun8i-h3-rtc
           - allwinner,sun8i-r40-rtc
           - allwinner,sun8i-v3-rtc
@@ -162,6 +163,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.53.0

