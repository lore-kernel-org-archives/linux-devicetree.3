Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A248330EF9A
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 06:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408442; cv=none; b=kxgay6puWuQgM0H0HYvRjXHjm4BeNDAw6Caohcjs4+P9T7SiJT8APumt/WRRRMIy8cOW0wKdI7Y8SWulGqeA3MEQEKsaii+Zl/lKU+PtkGwy63/uC4uuCNRAJYHBQMExB7NJYOPky9oLEE56HMUTvoKMbrs1CCp2VV1Lu888xc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408442; c=relaxed/simple;
	bh=VA0kzaE6CPnP30N5ERomNv/E2do/Lp2Hjoj0uhCCuRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VsM4AeQXpPgb8OOibS3W1SDOMwpjhR156keEJwgBze6jrdp09Gx+3vdVISl83FDeOfndBf6GzTEo+bn/pAVZNjyO0pRwsJ2gM9BxvgVuYhB2JNqW46UqLWzfS1DJBXwRLuRGw9gb1aNw3Y2Y+iQZtvAiEg5WbjkJ/4Zt1+W2664=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmB9WADZ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmB9WADZ"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso301045e87.0
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 23:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776408439; x=1777013239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MiuoIrxNKK6hZD8s7gRYWwj4CEpCWmzbv6ZdQWdvne4=;
        b=ZmB9WADZHz9/XBpuM4Q5YWAUWm/t567wIXVASs3YTF2NiUz9c3EevUA4REm3bepr0a
         zufkf8qg7me10XQdRGsYPqRCuv7MVKuE4DlFzv5uM5ht19VbLdkTmqBfQw+F61u2Kf6c
         oAE9LH29f7h9Tzx5RLURtHA9i9/1D708Lr3gLoOWz5Kwfpsy0OL5nVP5v8OYaYqJXkdu
         oXsLNgY8B5CqRbr3O0W7cnIu+k8yvhGRob4DpMmG3XBk9QaviBSvPpNwjLVVM0LnA0yE
         /kEEUvjpoNA/YvZn2DSd/RYp35Zh3ENNLRnuUWp3e2pxvak53TR/wt+bJPSjlVqohwor
         RWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776408439; x=1777013239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MiuoIrxNKK6hZD8s7gRYWwj4CEpCWmzbv6ZdQWdvne4=;
        b=PESypjQ6D4+DfdjHXJ+DCGf7u2PkYE4Bn5Q5YbeY1s/zWevbICW06WlScmXXuEvvkV
         KmMf+iPue5x/A3XsytP69GznzsI5JdFqviJ+01lcoyj+H3+s0GcpPXrUkUhvsoj4b4i3
         BzQFj3hhMZfH7cnfQXlOIv36zyq1NkyE14C1DqUOyEf8S0iBDFA52D8Cql1AokO9HzTQ
         Fjj5K7c1q1QmQ2QNVc7OWyM2nN4whRwte2plkrHR6Ui1tgLjPHlS/DGK1ElLYBRKC38n
         FXhx2LAI0mcXIIh/GXdl+Kf3I+bAz9bu5GT1G/zUiI1KE3x8D1aJbNDH1nwYTZDj13yB
         e8PQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sgy/C41FkU9tPC9yxQflA3FXm72wWIQFtqF5Qw2e4JU9K90BqjXZnb9vZ+qjhgDBur1QLhGqMY8GG@vger.kernel.org
X-Gm-Message-State: AOJu0YxBTyyl+udUn4HX7v8TjxVYX0UM7LPz0TIMY+cgk1I0klr+ksp6
	MdF/KmeTwICt54gVzpWkjuHZqmhmKpHIo5aDu3PAdh6dXyOcR7LAgVyH
X-Gm-Gg: AeBDieuE7Ux3S+zRQ+RXmTgzpPDDef1m2mC8YU3Z4K2PlWJMK6ACzLKJRyhTnBxyS3x
	X+WoG+JwJ91kKwD8sIqR9YC2YjqI1EKzuQgz47ijgyOhr3CTUgCiKYJM7gZ7JyVkdSwK5mjZX5D
	+GhDjLp+qsGeSVBKmhEaDWPOLR5N1q4FE8loMHt1f6SSjUHcEWv0EBgNjw+mjLB3zTVFPc1uef5
	o+9JkzbMEUS6wRwKQSKKvG6e1Ra3chN557z9XoE/jM4Us+myYmUEMunDkwRUSH6zLFozzTF9Gv5
	e5xC6jzOPJc4Yszrpf18/ADruuhwrzTw5qVlY14ofgjudnKCB/I/daKsV9J35rD/mziN86FZ/Xd
	nJT80fi+D3AJMc/ngwht7yrKovfAqAfaG48xSh3YlvEzdsUbG28DqGLYCiWMGc1tzHk5rBheSA9
	O1DUuW11hYFyFlC5DGG7uYa8BfvgD80EpunQ==
X-Received: by 2002:a05:6512:692:b0:5a4:2bf:28b9 with SMTP id 2adb3069b0e04-5a4172ea032mr465325e87.43.1776408438577;
        Thu, 16 Apr 2026 23:47:18 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec365sm141768e87.83.2026.04.16.23.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:47:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1 RESEND] dt-bindings: display: bridge: ssd2825: inherit dsi-controller properties
Date: Fri, 17 Apr 2026 09:46:57 +0300
Message-ID: <20260417064657.20293-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417064657.20293-1-clamor95@gmail.com>
References: <20260417064657.20293-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SSD2825 being RGB-DSI bridge should inherit dsi-controller properties same
way other DSI controllers and DSI bridges do.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/bridge/solomon,ssd2825.yaml    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml b/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
index e2d293d623b8..760645493031 100644
--- a/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
@@ -10,6 +10,7 @@ maintainers:
   - Svyatoslav Ryhel <clamor95@gmail.com>
 
 allOf:
+  - $ref: /schemas/display/dsi-controller.yaml#
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
@@ -86,7 +87,7 @@ required:
   - compatible
   - ports
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.51.0

