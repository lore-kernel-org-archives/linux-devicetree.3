Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018344;
	b=MqQ3WGqqiOXHdU2fAURBZeXlSfDYrWpA0z4Yfr+DzM1JNy/V0ss0RKCCY1hg/jHeZuiN
	 A0Ip3ZfK9HSXmT0yi03FktaZWdNa3rf/ecLCqHfPRZQFP3yVtnHVo1luTp7ZioBKjoqBN
	 CCBGof6/p5xrRc47zS3iduOWItggaAPIfC8OOxJBDxxz7fBLMyJXS18mR8jq5jXUBQ60+
	 oyZTssHdvceWgpKR5qeq62UDgGBg5rr5iFvSa5bAHxD9ssOxp98QdLFSlVtYb/n7Ii71O
	 CPTcWMbebxhZnX2wV80WEkQz9Ld/p2a5jR8Hp//RsEMlXhpyJehZqBThakuvQdDuTaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HFL+js96RhWUKHNhY7ivcgh9lYpkZ9o/IpqO+CIG0rY=;
	b=E6j3iUxvz/zULsc46fK1rU3eAIyjX8xqXaTHiORu33TiMwajj0TbmHXSby/PpuLklVPP
	 mT2vltiq/moZnsUw1KmAAEF4Kdz0aemuGE5ohwaH1+TVGi0/N7Ly3ni/FhIw5MP/SPtH/
	 VwrUl+6u4VPZ4QtNY5bvLd8hPV1FY8yIJb46MNg9jMmlv+WzLtaK0/xo3bM3F2/BpvPJf
	 3JkhhNe74aODIZrSZMNjrU262wsoBG1ZAwwCaDGCm8lO7iNk/NT3P2269S4p8AdG7LhoX
	 iYv6F79BqZj1wfOy3F0AXec1prCCgfg97cy2+AcoSSttRotNUdCBybXjEyFBpG0wN7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RS1WIsuF;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA16606A334
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 02:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CA16606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RS1WIsuF
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9908e3cd939so308728241.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 18:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018343; x=1794623143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFL+js96RhWUKHNhY7ivcgh9lYpkZ9o/IpqO+CIG0rY=;
        b=RS1WIsuFV3Zo+JJfQ0Nq1LTxl8pMNv56SomsNARfTMz4rFTCcWpWobBqR7e2nJgfz+
         1WiBN8YHGaI+QlQ2RJtYTxsrZHFqXl7OTDCzOB4To789OgmGhznV64Kw5V6IsoYKfpix
         yu+ja344GTQaER/9Iuc2cfGGyO6XJ3c0PzznQAj97VqoNhCC2rD83yXDvgMLAH5FGz+R
         syInVSEcd0arJNNUXM9/gENtx9JvFBMIgrBYJVoq7R4LtyeGa/pBL/6DVOdDWsqjWraS
         k+IDxbuflUSRrM2GZB211GqttPaz018AtkdU6cy8kZqchGA8cuoDGhDfxv5iUQQGrLr+
         eUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018343; x=1794623143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HFL+js96RhWUKHNhY7ivcgh9lYpkZ9o/IpqO+CIG0rY=;
        b=bJi0iL7UzVUmQhTQnbW2tNxhZzon8gZtlrOXCJ+OfcpPrnXDS5qsEV3SnwYk8PJAyk
         gm/11bC+fz0qLPGydEdFs/5ZQQf4U7jdqosEvjPoV4OQqpjl3v2e6dF387HU27ojVmqi
         Tvu8l4J1B1Q0RHv2PCKIIbQgJyaXHQTET/oq/ae+06hp39QEAG1ZkzDaxZ5L90sRBf2S
         ICg7K58nk4rnKdap3Ip560WTVeBPpY/yzAy1jARcx0DErbCIMzmp0IbrVjvUF4Ma2VHI
         WKDgym33EkFibMOYQUxaCCLOjIcAHprXjSb2TqRcQ6lLiW2s2ULW/jPscReI8Smdzgfu
         v2YA==
X-Forwarded-Encrypted: i=1; AL+hErHf26uRgkFkmZY6ko4rEgCSLpAcGR/uyK7cfSDMK4bgV2E03Eoodv8wEmfpzwlMNh760kW4kMJg1AoX@vger.kernel.org
X-Gm-Message-State: APuU4Z9Zj5QZAkbs5AOEYSpKL41M/yl/PSkXBiisNeyNfBFy0K6hgJbb
	e/6HhWTk+popzhynjCNpbEwN1cKmL1KIO8Nuycmx9k1Rzhds/+4C9r2g
X-Gm-Gg: AYBFou2fKCqzz4CKBGMtfpWFt5s2yK07pO8dTFRo0b5TIMgtiP9XlDpUCha/JJM0CG+
	OaW4zLkinbv3tIdFFJj6hO2b5+nhaau0H4vTenuUXV7og2hBu/GpxwOzmCuFIrjqCuk25bvrbWD
	shEDztINncuo3Mbliz0ZUB9CJVQyVOCJ6fOTVIjKM/O6arQgQ8GUppZ1hp0MwsBSXYfLXKKTGTg
	YCzpN7vjMozxkcmauhWM7zNPJ0lia857QDx8L24q1ZVTUsS16at8H7YdTCe7wVyAIqNGjYjhm5G
	Tvh+ypQNc5kgT/X/Yke+KLQ6ug+Q2PbISCI9iE/dV/wUipUy4vPtWSUIDYHSvKa+635T8g4xuJr
	Ip/0NrD/MgHNx8wEpJAxjbLp2J3t/tn14qaYLHUpz1tLmOqdK6ZdxxHimHGTdaV4AVmQwhAtdkb
	gmEY5+Vy2adWZxEyu3AN025kHur+sT6frdjoFYZc3rcQ28VYXERs4iqaxuIGiAok5plDhlaWy8H
	y6vPYbf4vHvqWsc6kl9RdZj3GtMP7k4Sv0KvoCbtYUtZu8zbrudFh6Hv+gm9bpPclpyFqN1KS1g
	Ff0xI5t8Ili9XUzS8FdlJSPtSXsg
X-Received: by 2002:a05:6102:61d6:10b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7d2a526b9c0mr1163316137.31.1794018343229;
        Fri, 06 Nov 2026 18:25:43 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99bae2a7ea9sm3221365241.7.2026.11.06.18.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:25:41 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 3/9] dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
Date: Fri,  6 Nov 2026 21:24:47 -0500
Message-ID: <20261107022453.159341-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
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

Add the compatible for the Audio DSP on SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 7e8ecae8e6cb..6cac1f77993b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,msm8998-slpi-pas
       - qcom,sdm660-adsp-pas
       - qcom,sdm660-cdsp-pas
+      - qcom,sdm670-adsp-pas
       - qcom,sdm845-adsp-pas
       - qcom,sdm845-cdsp-pas
       - qcom,sdm845-slpi-pas
@@ -128,6 +129,20 @@ allOf:
       required:
         - px-supply
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sdm670-adsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: LCX power domain
+        power-domain-names:
+          items:
+            - const: lcx
+
   - if:
       properties:
         compatible:
-- 
2.56.0

