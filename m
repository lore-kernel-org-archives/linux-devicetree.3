Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE99839FCA6;
	Mon, 20 Apr 2026 13:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776690836; cv=none; b=HwLH8OTzs4HYIV7LKrDzSQo17PzE+TtgJ5nOYl+ElD280niCUVCHT9jR9yANfldq38Qd8/Rnk2UPR7t0RQbNgCKaQCQD8T9GQ0JhNOSsgQwh58UlmXnfOhxgay0yv/V1No0Ls596y9gzy+yYJr+LIgtaGtIWxTZJFtcu9evDeZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776690836; c=relaxed/simple;
	bh=+ZX5e3iV5znp3+mDckn1TlQ8dB2YditYBVMIdfVkcSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HGeKDjy/9QYjBZ7O7o8srtpFegb+9+x5N0y/4Vj9hHE/V7ZxWBmnKnYyiaA7tQyA6csEcyOKw2WDyyjhoP7V/pWPgclR9+DQz2MZG2ZdMTOGYWE+QVf4+9e8WSALyrlgrU5so/jZyJacELI34f3FquW6QhD/obA6+hLFUtY9vG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qm1spSU+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qm1spSU+"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49D492688;
	Mon, 20 Apr 2026 15:12:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776690736;
	bh=+ZX5e3iV5znp3+mDckn1TlQ8dB2YditYBVMIdfVkcSg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qm1spSU+05ciZuW48R0ul3YH6iD0Ci6CrLgrzBfo6fUVgnToTUPwhQl4k4YAjx9xb
	 wtfprfr+H6uJ1VTPQJAX0Teyk2B0lFQX9cjXMIcPMDqpF7I9kYmuznDD+1KWQz9gv3
	 UdI5tcwiiFquje4laGW0BwKP+IxzZpSKw11BA2DA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 20 Apr 2026 16:13:35 +0300
Subject: [PATCH 1/2] dt-bindings: display: simple: Add Raspberry Pi 7" DSI
 Display module panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-rpi-7inch-v1-1-e68d5c9c44bc@ideasonboard.com>
References: <20260420-rpi-7inch-v1-0-e68d5c9c44bc@ideasonboard.com>
In-Reply-To: <20260420-rpi-7inch-v1-0-e68d5c9c44bc@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=+ZX5e3iV5znp3+mDckn1TlQ8dB2YditYBVMIdfVkcSg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBp5iaOMQC9iebaQi5IfDKU5u34WNTBLV2jKrTRa
 vOWAcQ9T36JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaeYmjgAKCRD6PaqMvJYe
 9ZL4D/4uAdqadFN6ZukOFmXOq4EMESGoDm+MEXyEA8NYxZB9Q1ad/EIYb74ivKBvh/0dTTUnzNO
 +GWX2L79kiPCvliffIz7NJPzlG6KYui1IT8iypn7AzT0o1c9L0ZWGjQz74w/Y+C0peyUwF9oOJX
 4QpUbx+FGjtQfWYazN0dnL90Nv2TBS/OYYjKqzkYj3sFgANVYJVdQNFnzBJ0ANkwI1UCrrj5k8z
 6jjmSgvHqqpLum0hFLoJy3Ps4t4Yhsr5ukaa1UZTMap6BKKYuS4PtKBqe4j4ylH3Dzu/h/M/b4R
 KRN9PyNYQG1bac8XivQ8KfCHLz4QjJ24j4ioZEW0lb0mSilsFVfx6jVuvffwPqkgErGZYTVi6gF
 mJb2XpiRSbTXJmQM1LdtkqvLXxRYm2OupepgalOJlyutZNkl/iYfEtw+5zObYUn7mck/iwfs17A
 vQ1mQDJPl46doAA611F5m1SkZP5OecXs58w7gZ2zz4rXKYDSOzQQum+BICVVAq7cl3QMPyUj0Jc
 ohE4J2VLuL9XyuJTEpVbb5x0n6Ncjc/7qk6fkQXjTZbv64Sq1xmbPETKhYTIS+vNf+ReSRJudCy
 12i1qP0YltjfBWEAZnCRXaBfS3/IkdVCVlGfx+tW5RrjBXhwe5byhvtWFWp6p6VJqdrg9F1Ctzu
 tNEIthHhDM4VISA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add compatible string for panel used in Raspberry Pi 7" DSI Display
module. The different display module versions have panels from multiple
undisclosed vendors.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 868edb04989a..a71578a99ccc 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -274,6 +274,8 @@ properties:
       - qiaodian,qd43003c0-40
         # Shenzhen QiShenglong Industrialist Co., Ltd. Gopher 2b 4.3" 480(RGB)x272 TFT LCD panel
       - qishenglong,gopher2b-lcd
+        # Raspberry Pi 7" DSI Display module panel (multiple undisclosed vendors)
+      - raspberrypi,7inch-dsi
         # Raystar Optronics, Inc. RFF500F-AWH-DNN 5.0" TFT 840x480
       - raystar,rff500f-awh-dnn
         # Rocktech Displays Ltd. RK101II01D-CT 10.1" TFT 1280x800

-- 
2.43.0

