Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745301;
	b=qaQfc/Z8+YSE3brGBjOzqq6bNangrYn2ru7H7+M37zsayqscTCmUmbWR8LndBGNkvFyj
	 LxEHNv8r2UOT10vn2JDNAop4SfKyNaBWZqRH6t8LicVnEuPeqCU/VglfqFYnAOqZHNqPr
	 PZhDW9p3WuoRftLD1h+oBWXnvh7XRd2sLpBaaV/fJLGggIeij/Hdazj+k4+UsDv1W1Xmh
	 YFMkADf6e225jf/ffk2+OGggC3prOBRpLJCF/nUPhGGZt47vbTheBZhrIZ2f90KfGopCD
	 sBpoSCndjPjB651fFBQFX4BJImcov84GAn2dEfKY4p8Rdrlhkf8ZirJqyY+D8qIVu/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A5HReqGtLLp5CEvytgVMxYdO2cCkWTCzRi2iOsig/yc=;
	b=ORkyxM9zL7kDgwId3kE9M+cxS864gThsRMdU4r95OuHdILR3beDRZr/rch7WHuMGL3rP
	 azexMkFEuU2ERQiJyndpKxJB/cH+U+061Qfh+9yjR1Y6t3dw+8RioRG5DmBTRBkkZB+V2
	 F8VZ5Q6bBYOuzvcllmTDvPCf4a3AHqs89MaFhrcjTWua5HOJMj3rK95Ddr8v14Z04sdPh
	 uX/fiy5zw9cthhhhyXMAGR/DFE4eX0dLwCHDKauNSlbEIrZ9Z//Vc8SqoVYEmpyFW+84z
	 dX8lxQw4gjeytbwkdwyh7FdWy7eK445LpjrcJF90f6giI0S2qImgqVme5KOgbLDiDKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CfM/0Ols";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE2A606A331
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE2A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CfM/0Ols
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-497614c95f0so4330720f8f.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745299; x=1796350099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5HReqGtLLp5CEvytgVMxYdO2cCkWTCzRi2iOsig/yc=;
        b=CfM/0OlsH62WuiyT77PxTB0L3F3uM36rJaeqxxAYh4mYoEDoOrwrNvo33O+fDrsuPv
         opNg69QfuIatHRJjBAUPWrNVkko3SJVQzraEpikhFHdaKE+We/fjdoB45fgLVM/TaJUv
         WNbKAgSLoLjT8JI9DxcTMKaFsvNHmP/2K5C+Zzjk5oiyraLwXHWRLkY+Ihpg/fnOVp/r
         ikwz/0qRzRFRGdfIoG9eI5NrJB9+t4Q5YXEkjEW5CMOErqeWOLhht1GX4rwyzDrnBTW+
         FMxQue7/ZicEoyG+m3NYqR2B69+IoCvpgbAxWC9WVKwuY82nxs7nVnqBEpwXpT5HqZvV
         ie2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745299; x=1796350099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5HReqGtLLp5CEvytgVMxYdO2cCkWTCzRi2iOsig/yc=;
        b=Wv/2qw6LcGENVmabeE+S5S1Df/pp0XuOH72Ly1N/khoRh7CRBKGgzOZ+AiyuMjqKy2
         wUE3GuPI3Afk2FrepzwVjaSehrWomdAAn7L9Qxil4nEb+b5XS2LcxshQSdq9EIJuNd47
         WdobnBHeAi77WdcAlBKstF9oxMy49XKZ8+pSY1MMUj9bNdN9n6+dvMohAp4ME5kX0LMf
         +K9wAqk+gJlppSOcv9LHgjX61uhTSNmKU4yTK5k+QcH8Mx4k8JziUQcmXRWJN8kxqbXl
         ETrFzU5OrUMpFLWBUm6pWBJfwibHu72sT3tluzm5Gwcx2GvENH0IuVcSIwZilsoYqsxz
         z2Iw==
X-Forwarded-Encrypted: i=1; AL+hErHZIBjjrS3+w6t5A5aG3OVFMUAOUePYH7/PBpXDhZGEQn8lPkPBB5LwjHwV8HEOePaEigoTtzTrMy46@vger.kernel.org
X-Gm-Message-State: APuU4Z/dJwF3MCoiU924Awz/qFZ0maIA1+ZmA6AGjlHV22VC1D9fXJMr
	3Ya+84HBkZSaUx2dtsYJEv2KmvqqrHl6kO+ttnBkoRq1d6hpjjy+Ne95
X-Gm-Gg: AZFdTZf+nCVnHx0gZm9eAOWezLoerdQ78y5aFqNqYh/lonB85ldyUJypCW8/AGx/HN7
	XAKCBnxmFhyH0EZJLTWo/AWbGsKFmLsTWtTb9J6iWopYFhn2z5se5cLvzY+sO3Y0SVhWyztsKZv
	7WQ7RDvsIYJ2Nw7C7mUlvzpiPSX5aE6BAIDouRDyZyuUC5mxUm1yUFEhQcUbSYj2eQlr0tU5wfu
	fi/NHrS5Ga0swBmVquccWQ41NPeu5BYI8uV54mOKn9ccrgPbbKC4HzVHeYvBwqA+oHe2+x6cE5u
	ZUUY3vjDICasNwqliW1xz3oCSkBg6pM4HH31nxl2hWZL8CoTX8JznThUqw4aheBJGoDRCQqaujD
	B6LmQGJ2G24lU6HlsuSjx/HIxpDVzEw8Lzjp+9AiWTkq9iyFxvmmq0vVEmZc0WproWbhiJVtn7Y
	EZGFZhfp6YBTDf0cNvVEkc6jtOQy7GWyDPJdpk9HWjVjZeiWWjISS69n+D8gy+Ojo2Nk9GFINTr
	ax8apG5qbrjS6cI31HdiO1mtYn12ktO1AsFeYIlGWhmGmJsRDl10mMJ+Pix1xVgTtzUWzzM+joZ
	NXCbtScxeUNX7AmvppA28Mv3SZbrI5DbVjP/+GP5R9RzfnuZV4VdTjMPWubdBub6SKJ7960EQWP
	Kv9Z/b4bbSWrybU0PyLckfCJchibzyKiSpPNpc7rCACEyGQ==
X-Received: by 2002:a05:6000:41cb:b0:4ba:a47a:f21d with SMTP id ffacd0b85a97d-4baa47af4fbmr12166998f8f.1.1795745299448;
        Thu, 26 Nov 2026 18:08:19 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm43390844f8f.49.2026.11.26.18.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:08:18 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 2/4] dt-bindings: display: panel: sitronix,st7701: add the Miyoo A30 panel
Date: Fri, 27 Nov 2026 03:08:13 +0100
Message-ID: <20261127020815.1621790-3-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127020815.1621790-1-romain.tisserand@gmail.com>
References: <20261127020815.1621790-1-romain.tisserand@gmail.com>
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

The Miyoo A30 handheld has a 480x640 2-lane MIPI-DSI panel driven by a
Sitronix ST7701S. It is connected over DSI, so it has no D/CX GPIO.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/display/panel/sitronix,st7701.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index 3ca9aa215b7f..8d9bddc8118e 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -28,6 +28,7 @@ properties:
           - anbernic,rg28xx-panel
           - densitron,dmt028vghmcmi-1a
           - elida,kd50t048a
+          - miyoo,a30-panel
           - techstar,ts8550b
           - winstar,wf40eswaa6mnn0
       - const: sitronix,st7701
@@ -89,6 +90,7 @@ allOf:
                 - anbernic,rg28xx-panel
                 - densitron,dmt028vghmcmi-1a
                 - elida,kd50t048a
+                - miyoo,a30-panel
                 - techstar,ts8550b
     then:
       required:
-- 
2.43.0

