Received: from mail-ot1-f100.google.com (mail-ot1-f100.google.com [209.85.210.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADA0388E60
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436139; cv=none; b=DnBxXybOUZdrWsW8HWRv33SKTjOhIW4ooeanrNURSYfv/aFPBYzfl5SGtfDgd5WZvJahxPBr92vRQJTQiyUz/v8yZWNXishZXBjWNIkAibqz3mwxhOdKROHzu1sJ4n5U+wZrUq8VZD56DWsmYt6fl1yodAuBkebmXxU9DXOHuhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436139; c=relaxed/simple;
	bh=Utc2QGdKsqyPoNlC4WG7Q8Z0HLqtqz0lyRmUliqchBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0YWGgdIwK5gMBCXkbfT2BgJPUGHahLrUkYkXMURgASs7CsrVQTeQQZgLYuJJ6YXwEDEKAORONEXEmoZOlTxA0HUb9hzbxlNCMdytSWM2/KugSnzL2p1U8Fte76pGlN/gix7jK1ZOwW7fN4x9DCChC3Etk482tF4lx12X3kqvVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=CSl9p8L1; arc=none smtp.client-ip=209.85.210.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="CSl9p8L1"
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-7dbe437b072so6964774a34.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 21:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777436137; x=1778040937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhsANxfjmjB7vk5bKYmWUGk+7KV8pJM6GvanWdmMMRI=;
        b=CSl9p8L1ZdYvcJUgMGmodko6NG/Y+uTlwZ65/oMddTqEne0yzirGG4OmGTKrfU33E1
         Hg08duwiYFbKdwbJCYqgtfT/2RLErk9fn8+ugYuMUPol2U2aIpfoxdU5vtTxVeMj6tdx
         vuU6/dfSXd2qFC5EqeJePZwf0uD62oeG/c+DmhFa5z2XAYfsrdfcuO0DD4ciKe2VWQ0M
         W7RjjnKHERnbSo0dmK5+/HDRhD1hhOwkykK9+BVVPrYxA2RJntkUV85BeOxkg04YgvYd
         iTM8EHEjUXKovULB62fSVbsW7B0E0vPQhbNeaRhpDd3jtCVszG+1lBcbGsnC1o3jS2QW
         PtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436137; x=1778040937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MhsANxfjmjB7vk5bKYmWUGk+7KV8pJM6GvanWdmMMRI=;
        b=IOoPsvSKWF/JVFikREKVw5BPZrrjrbvMWcyqFeFFDMH521raecmRjy2BQWzSDQHpWs
         xc+Eq+oIMTXwte/VtHL3MjtXqc3e/sVyrwZ21Ds7w5p0nOuNHCyXx2RcB+MCwPG5D50q
         /tuFjYYPHMkTn6LJHMhwJL9QZOpCwAgxy+nEr2H1gDubfKnS/oHrUAgGls9d/rw1Hv0e
         nChJiN5MA71EBtIG2LteyTCVhYJhYKZnqz72Bzl9xR/qh9OWG6wqvAJiiPN9Ipqruz0G
         05lDh+nDKfl7vX7GnpA75xezphX0vFujDeJ6PU2Q62lRNP8By3FClIOV4qONTtQgBe/R
         H+sg==
X-Forwarded-Encrypted: i=1; AFNElJ+mltQ1BdB1aNfEhcS3GRCIi0onUhC7Q1AdeItxBQuvE3fRjIgRdLxArElj/KDUEFRDkqlJ4MlriEqw@vger.kernel.org
X-Gm-Message-State: AOJu0YwrRzALHnveBm3b0x5NIhqTagVBnlZjCwuoPGOwIYU3+nzG0MBf
	eouaNi8pgsnurZGDJLn+xpf5A8vMtSLS0v0VUpl83cGGuMvD9AXwpUgG7AoEdde6tQa1Bnk/3dH
	MLO3JtmN2EK9aBhg/deb4zlK6IrEz8P/MCQ5+
X-Gm-Gg: AeBDiet1Vc5dggHJULlZ8PoSFZsQpuad5+g5R2Mhu9hBNi+JSpUQssZqYQW0iONhszn
	LSVfaeUiBXz0hi9GLRYUeamLyD8Ca5xg6j+j0KCVgdl5x5yetVMq9y8IdMq8TzJc4MZyqfetj9i
	6TBF1fIQ4eAizf32rqkmT5FURT2Dg3yzX/rExdcMK9/pxjj0BYH+mDWHZqT0S9VWGP/E8vWABrj
	xKbMYaW0R0FwI1utrtGKBNO2W7TJOzsCHXq66AWmMg/wzQnawuJtNd/6hdXJVa18mfjOJEuagW8
	GlWz+Ct/tjRRTIHAJxgS3WhU5qxEPkxt+DwzROK0+pNOHtO4gu2O6JNOZw8EGv0KyvSAFWfpEuh
	apPrl/F+qdobjBdXTNhBcbGAwHUCGlSiu557H8HJqpqQ1WMupJEf3DAY=
X-Received: by 2002:a05:6820:4b13:b0:696:1bda:5dbe with SMTP id 006d021491bc7-6965cbce522mr2941455eaf.56.1777436137366;
        Tue, 28 Apr 2026 21:15:37 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-6966baf952asm41557eaf.9.2026.04.28.21.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:15:37 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Peter Robinson <pbrobinson@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Dennis Gilmore <dennis@ausil.us>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 2/3] drm/bridge: simple: Add the Lontium LT8711UXD DP-to-HDMI bridge
Date: Tue, 28 Apr 2026 23:15:27 -0500
Message-ID: <20260429041528.558254-3-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429041528.558254-1-dennis@ausil.us>
References: <20260429041528.558254-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4 to
HDMI2.0 converter, designed to connect a USB Type-C source or a DP1.4
source to an HDMI2.0 sink. The device can be run uncontrolled or it can
be attached over I2C, this supports the uncontrolled mode.

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
2.54.0

