Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403902;
	b=cMPNOKjCRwGfp6MipJe6a7/qo8DM1PuuopO0m9GCj5Op4ncLmhdT8cKUmnPmYLDTznVk
	 PSJGox/J0G6qWdR9rr0AKizQUMu/8EYTOFYbLUlOUm6ipniYGQfkpJlGq6zZW6ZJpNkGU
	 I/S+E3POuegeSNRCxBUI+TsGpglPR8GC6RWH2ufi0zUHtuYUYHj08YO3GrPK2jSTJDY4R
	 W8XdfIXLYvGfBJLym3N+LkjyEr9COzyVv7ibgkvTUarUDOUeUnxaGt0YFHcMGlWBm3bpF
	 kWLTuDtMBoYyFWhaxJIQOePYPH5E0hSxpGI+DYJgyh4MshtoovRbfgZ0Zv1a3D2TZOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MqrvWQFAmvLweRdhffijQ7Kj1AgA2ef8bviYk4Ix9o0=;
	b=wIT9x9MAmP8C3KxYty1p2UNJeq+yBZYzgvmLtJwXbOxCUf9yv52Wega91m1ySM4kACMv
	 d3tqBtrANR2b08UwPrTW/5SPB5IWpFeYVyCXXM8x4Me+/Gtv6Zm46WMhf/nVuDEL8JBtc
	 dzSeQUISCf3KZseGZ6zlUUMnHBFpeB9i1MaI4LzcMGWnVohCjIrglYaD2De1eicnzy65Z
	 twebB0WtmoTSPYiTXLHfBJtMbstBbNZsABRB0+m4XWgkvyl6WQgrHGup1KXndpoDNuJ8U
	 3V9mNlGncaD863wAIrUHPfE3iFfIKSpRVxWrCnejefAfXlCoDpaG8yUz/TBy5UkbT8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o6IVK7s7;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B07606A32D
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7B07606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=o6IVK7s7
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1415614f8f.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 05:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403900; x=1795008700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqrvWQFAmvLweRdhffijQ7Kj1AgA2ef8bviYk4Ix9o0=;
        b=o6IVK7s7b0bKyMHvyshYiXsxa4OKgZ9tjNrNl50dXKdePI3A0Pqk0JlPrxyl+is6Ty
         KW2014oGSpgL139lUwhwe5HBOfkABYE1UHDIpS4NtxLArWKgYhhPBkB+/eY7CAfollHA
         GtkQhQnDFq1RM8XuYi5Nk62gPwBi5nm0kUwJm6QbXC4WeXrmJazZiQett8rwlPgmjs/v
         cSm00MbIZkLg1I4XamB4aa3+WhjXv/4JpCIOZgfzRN6+CvTZFQsrhrDf8PrXEp+160tD
         WsBeElXsvNx8PjPdkTrlvHHcntBw7C94K3LtMlQ3o61DSGt1MRIv9uVuVa3uyW9xyFWC
         VGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403900; x=1795008700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqrvWQFAmvLweRdhffijQ7Kj1AgA2ef8bviYk4Ix9o0=;
        b=D+KYW+ccKUuKuw7OKtBJODxcG/oYE3lM04ZLMjT7b+BvTNf4iZYZjDZyagdilnnMR3
         55CPZxgTjHVW58AFR+IJdJ1ObINMC+BUhrtajGI7vyg0VNGDpOBix+Oo9+GFXvFkHrJu
         OVtr+xzyuRhE74fvR3M5zMaTDWRW8H+sNMVVnCh3/TxCUvavNtqBmPTUMFlYGGFr8+UL
         8d9j+jOItMW9Vkhf5vwlTiOWFUlwPjqzC5r3gHi0suQmbqM7z2HzCDqtN8AcZKVhkawy
         Gc3LLNc5dWAj425yXq+IO8qBqm9fiQsM5knwVdMv2KQijtHE2pEuof1D3bnuoBs0NIBB
         UKQQ==
X-Forwarded-Encrypted: i=1; AL+hErEIpxtSZmIuRyTC+VEAkqOvOS3iv76uw+zPtQUHIC07VPSMgJrKf73Hn9wgfUpuxsr4NJikgzAER3mK@vger.kernel.org
X-Gm-Message-State: APuU4Z8tacloNKcdFm90tOYQU3WmZsQdj55n5FGnmrvk8j9iQGKCF/Xb
	YAOwJv1vJKFRYgdPC346OQUwVuiQC2im2q0dlCPe+rTgCUuQsy3TAUr8awkPXFboGpg=
X-Gm-Gg: AYBFou2FbgoFEUvOp5k0flv7QSMEO5fEwQrOM1BprcbljnrhPR1DRrwUAqLri3vd1bZ
	26d4IPRCqjaiFMIoLQn92UyhCEBZCcMDjLUCjbL5XUx2m2JMrr1zkcYGBR78gZoJwowACO9sQFH
	0DCJzc0q4AhJ7vkVrSckxcuunSPT50HbSCHnsWmTowq0TZV7BsgraRRJuoQpiKwlRBoZga1CRx5
	rA1hWusDEfo8s9JjkIPi3oRr672F6QZS95aWcY5GjQtGTPbkT0LWhUc9wWGOpe48qo9VreHw9Qv
	jzpTEai81hBiPpYKgD8VwmWh53nLOWAI/BPmiBuyWLgFbFc1SrEmX2akcqCfIUflHSHLmG3dLXT
	2lhpJBioasiLbydV3yWW8sKDFoN4Aa3fU6po6XeEVYGUCnVUogBH5rADgYLmA7Jc5fWya8ZdKVq
	zsZI06U3J6ayQJ3R9y3N66Ha8mRGJuXBVppfNvDLbA3mjSdUm8uyhj0JYvCTmQJ5HNEBb7wOq97
	up9UG/oWV4X2SKa490NbzHaThmSN1WYopZKXVqS0ZqzlIKNfTFFrTasrllBSsrVUnHsmx9Rr1gs
	xJPVPc1TbugOA86NRPs80fJMtq0EGznGyVG/qTdNZJu4mlDnSB3tabPCmFwzQjaVQSVgqj9/9Et
	cxikwRxqolw==
X-Received: by 2002:a5d:5f47:0:b0:493:690c:8364 with SMTP id ffacd0b85a97d-499c3ba0637mr4190729f8f.3.1794403900138;
        Wed, 11 Nov 2026 05:31:40 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:39 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v3 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add Youritech et050fw01-kt
Date: Wed, 11 Nov 2026 14:31:15 +0100
Message-ID: <20261111133119.1063210-2-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
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

Document the vendor prefix for Shenzhen Youritech Co., Ltd. and add the
compatible string for the Youritech et050fw01-kt panel.

The Youritech et050fw01-kt is a 480x854 MIPI-DSI LCD panel with
physical dimensions of 68 mm x 122 mm, driven by an Ilitek ILI9806E
display controller.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml      | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index 2080d9e0ffac..c2e442c20c0c 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -19,6 +19,7 @@ properties:
           - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
           - rocktech,rk050hr345-ct106a
+          - youritech,et050fw01-kt
       - const: ilitek,ili9806e
 
   reg:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..ac2f54adde73 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1979,6 +1979,8 @@ patternProperties:
     description: YSH & ATIL
   "^yones-toptech,.*":
     description: Yones Toptech Co., Ltd.
+  "^youritech,.*":
+    description: Shenzhen Youritech Co., Ltd.
   "^youyeetoo,.*":
     description: Hong Kong Cybodev Tech Limited (youyeetoo)
   "^ys,.*":
-- 
2.47.3

