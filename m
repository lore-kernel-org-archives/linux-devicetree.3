Received: from mail-dy1-f228.google.com (mail-dy1-f228.google.com [74.125.82.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75686381B16
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 03:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777086623; cv=none; b=akJj3aG+y1O6PGT76lHa0iuNgHr/m526OVJaT8j5b9ay6yQkM0+h88f6pevyLtM3haHbiuAUm9kpU23lf2KePrMM81K1Gqi1/neypeQscCfko6gZGi15P/OrUJQYw+uTBFwlbgkeDiKDyphIa7mDg8kPaEKNZpEbPc42WmUtcM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777086623; c=relaxed/simple;
	bh=EomO8GUvelqLXDubCER1A+Vz7KxB3mVjAIPw5M5syiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A4iCzThkDdLmvFdk3qUbgpheHJNTwkc78uJ/jw6QOWkXSJuGgUzfG43YB7MmMs5yyNgKnBLPqFlpT10jodZGWoRJdP9nEmnYmvTYzy3lDTt55550NZDtjudlUyF9jCiuNfdSeeSlmfuKQSx/WQXu1VMZfY1pvLVPsnOJUMiUiJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=dXAgOZHa; arc=none smtp.client-ip=74.125.82.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="dXAgOZHa"
Received: by mail-dy1-f228.google.com with SMTP id 5a478bee46e88-2de831d2b20so2211775eec.1
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 20:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777086621; x=1777691421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2siy8AgvZkarnaqQ1iRlbYdPe6np7TX5Kc2BXRw5Y4=;
        b=dXAgOZHaavoh+OAf9gG5bmmEXVw09BzzrG+qqrYS+8DcXh3mymEvoDtub6tVb29o/+
         u/9M1pmWuf3nLs/D4pxiRt3Hsi9VLVUqc/UZn86F55P33426TngfFcNd9z2wmGROm/ul
         bEIe0q1HymmJthvFnyo/gno2ATA6azVukTXprQHjDHnjIFSXFTsny10sypW9hrq/uwLW
         pnuujENaSQ1oX4EFVW0Hi6VknnN4zGetk6srxMsk48rRb6o7lm7Np7loOrJpV4LhF465
         PAewmT54dzTuLnE2QI964CyCYB1XFgB2kbuqcl1j4NlFpdVlKhOj6hZdm3nV3EcmEe3M
         exdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777086621; x=1777691421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2siy8AgvZkarnaqQ1iRlbYdPe6np7TX5Kc2BXRw5Y4=;
        b=LaK2YX83231wNP+Xkh/2x0ELjK7IDT+M4f6wXbkfZ+sln/I8MUx6PPc9cyCkRc/GDW
         KsqY1sg5fEeCy1QFnfKUvd6WKsRpEm84CdZvPoFctHkw2YpC6Dmv193Pb4Qy0wPLHWDA
         A9bJ+v+010Pwdif6xI4PMcSftC/aqNyT/7ce7O90T7KykvdoBNUmpQZ/i++ONuJ1K+CN
         w5n+3BXMbCaLE1CmhTvr5LiRZf4b9vDZsXgHns3yXKCJ+nLn5Zn1ZGRF6TSaH2rsIJeS
         j8z2e3Ug/o8ypZOlLo1Mw9IIL5jT5du5dLSpoIbh/z14RWdLCMq3iWndHbq7faSuUPF+
         OMYg==
X-Forwarded-Encrypted: i=1; AFNElJ+L3zXOJ0XK63jKTRYAgu4hPfyk8c7SZmERGUXqThI+uERBsBRHliq41nUy+Y7q2GCvCxDVNrhC8/MC@vger.kernel.org
X-Gm-Message-State: AOJu0YxKB9f2fRYw84wNWSrAaH5h68HV1GlZRFu732RendynLdafaIDX
	QRqyTGiayvQFymq1WwcXNf5CjC9YIYFhP6ylI0Edk0eQ1qnNp3OvUbX9sw35+Ag2Z2jJdG7hWIu
	/ujj0Cor8UuqRlQx1Afi9UNdN2fJJ5qRU2eBy
X-Gm-Gg: AeBDievRkx+hlg5TrcUJIONB5U4eY12eyby1H6pqyEJ4naYnFPX4WVIwOj5if3HS38v
	tLj4GNGOSH+z9sqo1cyT0MStMBr4Sj9cHn78/ICxkZXZwBNeU+1gCtWyyg2Q2Qmlia2S1QcNsO4
	xLQpCdwi9f/oXWOqXdzJOxn6U4Jhw2GEhMJMSDGhACnzlynJ6K8xA/gqZ4UO/8OYblbDFPGSl4q
	jMEUKndQWfnoDVXkguyJ7rk/LNraxFLilfiMePCw7+hUCwK+bb2U1ofZa/9EAEVocWmwIkTHNd2
	dLwtwMQo3bRNSgHiZVyq3BQ7c+3JEhl/3rcbYagk90sPdMAp0fneXlYI7Yx309uDnGHFHyr+as8
	gzvImnQjxyCVIERGoHuxGhzAZxSq6kRifvp911/yhBQsQa3dcCZOBr5Q=
X-Received: by 2002:a05:7301:1693:b0:2d2:129a:1682 with SMTP id 5a478bee46e88-2e4786460f9mr18795386eec.16.1777086621591;
        Fri, 24 Apr 2026 20:10:21 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2e53a3ae691sm1728646eec.11.2026.04.24.20.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 20:10:21 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 3/6] drm/bridge: simple: Add the Lontium LT8711UXD DP-to-HDMI bridge
Date: Fri, 24 Apr 2026 22:10:08 -0500
Message-ID: <20260425031011.2529364-4-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425031011.2529364-1-dennis@ausil.us>
References: <20260425031011.2529364-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
to HDMI2.0 converter, designed to connect a USB Type-C source or
a DP1.4 source to an HDMI2.0 sink.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 8aa31ca3c72d..42c1f3d5ba0c 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -270,6 +270,11 @@ static const struct of_device_id simple_bridge_match[] = {
 		.data = &(const struct simple_bridge_info) {
 			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
 		},
+	}, {
+		.compatible = "lontium,lt8711uxd",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "parade,ps185hdm",
 		.data = &(const struct simple_bridge_info) {
-- 
2.53.0

