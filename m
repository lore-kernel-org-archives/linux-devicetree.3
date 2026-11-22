Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335541;
	b=DzNIrJ16Ue4d/GLxRR3xVydJJC2F9EUynjJqbfvWXiUiwLYYACyFTMOgL/0foMrHcbGH
	 Mj23GggfCzxs+D3jTx0uhvfiHRJfBhwqgE9J+i5iZU42MyJlcbkp6BFyce2WCtE5YsVwu
	 ESqpIbLYHjtgje5+RQ9brV/NoQ4bIRQw3lta6ibHYGw0zwIglmhKGse7BP//3QAxQzLUD
	 L71ZmuKWi1VDGaTHDVqJp35IUb1xQHzrBzmiPEpN4qxTAeceOQMlzNckoHc/xVvPTzrHS
	 1P1mxIl/MpIuIA0CKEECUsqbav6feo7NK6cKU58T7ktO2lMXD3Wmdqguo00E4VZJH3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
	b=RE2Pj75/m7F3t80dJj6Qi/KoCAQ7pHOUn9DPBdzYyNtLpUITE6Ro+mqCoDEBQhKT+vzE
	 16eq4tcjE2dPAhwWitEvEcKwyyZ/MdJfJdLg2ydkreShl/P3zaT7g3dLhVhDyj8anGI/t
	 KyHucFx0QU+WnsZqcZ+iI0OMlywT6xEg4RHIoryOLHQyKxdpOJfWl3o0i4BYc9J6K+nvT
	 pZKKJqWw5SMC1OVpQdotYo5Pxty+e6gWqjt4FyK8Je+g+Mm+mAJg+CIimH3acLMtZ6Txf
	 xl7NbPRNHuvfW0NlIi6gZxg3UxskOK459fqWfx1IKI20A5vg8w81s8/VN1SS6TQklRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L5Q/M8uY";
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A94606A339
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66A94606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L5Q/M8uY
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so2716056a12.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335540; x=1795940340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
        b=L5Q/M8uYIldfVMCbG9nkGWzhI3yv+hPggYAhcn4NsTzzrXBGzMTp7AuuPmVkTkSGR2
         2mw22jkytpEuAUQsSe+4yA5TJ6cIZKARXPKtVKjrAmjASOcUDWDpDMU9VIxAWB4SStlC
         DndTBSLCid+Y7rvo8KXmt8mJuI9OVteBzMKC8Z2wM6zisQa+v0E4jMmTTcyvYAK8LTC5
         c6T45HGE0k/3jEcXxD77c6yDb11Kx2ZZPLRXxfqDOKFauoeo5reLvdoaWo+G5YOW3Wy8
         RQg7AC6NP4hF/7Pks1DnI8GdBvRgB2mSSfaLuoTGxmlmt+dxYNuZu+JxcdR0ew72DGBl
         mtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335540; x=1795940340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
        b=wP30mQsq3X07DyZQh4eXFHNpoWxiuDGHaagGbwzpZaldNrLodBA3PTkiywC5yuZi//
         LDJ08AHlKJl8olINJMxZWBOaZUw+7jG5kjYwZBpAjSc9rjv0HaF+y6tY9BfxKAPbLgdD
         PA212WDBAut9YTW6pc93qFUkOfF2oZzBj5hWO7R9YOO0POkRfSXLTyzVByyQemOAw+wJ
         gyp2E8OJxt/RWGoh1CnrUKcg+lW2RkxQLdWpQWC874ixwt+/ZB9iDsFxMW8tIUujsl+U
         GTze2v87LyfV+Rhgroj5oaSdKNQfqXCvg//aq/Qtg1kEULsXmgdr3W1AN9n2JCgLhGUY
         rnCA==
X-Forwarded-Encrypted: i=1; AL+hErEAFErA16Cuj3hT1hy73N2SA6pJ7vGT2JlL+l0r++ts5iE/yKwbOcVo6/opBh7G5Z9VS+o49ZgTkTmT@vger.kernel.org
X-Gm-Message-State: APuU4Z/K+xye35jf8IS0ng3Dte7i4lD08hMEgeFKFXGbVr9XV3jjfu27
	8vvSCSjArxhMTRSFDT9lSV3bQXNco93GGZ8BRgxrlPpD75TJ6fo/0shd
X-Gm-Gg: AZFdTZfA6/v87pfWsrm2OpiCqKE6cr3bhzV708CdUbWIM9tcTgnDg/tZSx1rHIWNyRl
	Ah7ImAvjPlLgYszU6/wLM8lmoo+EPPXMry7Q4qkET11AMdOKp15qoXpH9WRWT8zMBtR3dA0aqJg
	PMfsZ5jtnIe2IQQW4Oyy4VsUPAgWGhMbXrE1eEgxCZO3f++IQxVqoZ+xZnyntzlJuVi7pySFMMi
	/dcMdDpDMTlGbuR60SksBi4MHDeX285Y0McsJvjUSQA4nRZksDf/ILJM4gmehV+Fauayhqut/Fg
	lzx9/UCeti9IFkVbzdz8Jx3mWUQRRRQuGJZwJN0EuR28oXrniYiwguRBoPZAbvCV66Jnzl6nRtu
	56ijzpzmeKjLM5JRb+cStAhL6XzyNDPEf5Z/48x+DsT6dIhH/x+6Q5OYVfR0FQ7sBu3XdUXXipE
	T+469CQB4CU6lqDJkT1JPhdBgY7TwHtKCdzuFNB12889pay/iNTLRBuT/PfIJ/JHTF8Bt6g4UlL
	3Zhe2lnnQAgmmWgs5Mitmh2Vva/gZunh+mwVcdf3sQl6RgFrsEgGv6TeqYrrbTSqQVAMYEBzqLH
	06Nuz7KW6HuoUHvFewiLEqcSRYb+G+JniecuRL1ciZjSQF008P5kzMv5+TinOlgCDmqnsljVTpI
	Ay0TCOZQxgA==
X-Received: by 2002:a05:6402:210e:b0:6ba:9d0c:cc83 with SMTP id 4fb4d7f45d1cf-6ba9d0ccee5mr480982a12.31.1795335539667;
        Sun, 22 Nov 2026 00:18:59 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:57 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 07/12] dt-bindings: display: tegra: Document Tegra20 DSI port
Date: Sun, 22 Nov 2026 10:18:15 +0200
Message-ID: <20261122081820.53199-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
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

Document the optional port node, which is required for correctly modeling
a dual-mode panel.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
index 59e1dc0813e73..0f4837648d179 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
@@ -83,6 +83,12 @@ properties:
       gang up with in order to support up to 8 data lanes
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  port:
+    description: specifies the connection port for the dual-mode panel
+      and is required only when the panel is operating in dual-mode
+      configuration.
+    $ref: /schemas/graph.yaml#/properties/port
+
 allOf:
   - $ref: ../dsi-controller.yaml#
   - if:
-- 
2.53.0

