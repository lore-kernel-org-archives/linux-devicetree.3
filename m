Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE174BB7E4
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 20:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107528; cv=none; b=rISQ4fyQRJSYZesbMXicBWA/+yly6Q15QDja4KONWGv2quUaoBJVg9HD3dAWBx5XbZRANS8mupAROw6961MX0dqFkNcRys3Q+d8kulbM6FlPoJ1RoFYe1sJUdsnBDwhDmCbiMnAunCL0OHWZP+vho+hD871mVXVryg4R/fv0L2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107528; c=relaxed/simple;
	bh=fh2Uu82ejF0DtKt0brgXH//fEo0R202bASP2cymwUFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o8lNO7ajf1ChRX4aNB/fp03Syg3b9i0vnWzs0+2I5IIiSb1Q/u3qLVSlp12LLX+H9omg6V8sbqAWEjyvoroxaFYO5RpGhg70ia0hih7jOFmSnFZ7SbuMMHJEE0kB+k4nmtDsSziHZF/9GCvElry0CzuQre/ET+WYk85yl87GB4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdSVq3K+; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdSVq3K+"
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2df5ab2f7b4so758385ad.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107512; x=1790712312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdJAnLwrz+/OjIyJtnetxy2JKy8P0MsUYxFs2QuKaus=;
        b=UdSVq3K+yojQHpnGmXGkAEkPTwJMk03Ajk4hF9OLMwsODOjQCbvDf+WSAgGPzHIWq2
         nRgmIJdoOtiaRZUQPD/DhCTuMORzVe9/jqNUoQDo7z8ZzIP1FdXm3Jbo7tZViUWx/m31
         mfF3kkwqEvFh+8FkrYN59yqQKqKabszHdHIUpi3BwZZ4l9FlpmJHXUFjaMmFfT8kaew/
         dqm+gs3l9v5N45jo9WZ/YYs9i92/yVuHWd1nTp1K2lPxtAkEO6cXxCakPlh1XJj13VRM
         YMCFM8YYrgdAsN6HoQjVmGG1cS7BIFlI4ER2QtgfLQl7oyIKbQBmNofZOf90LUkmEbNL
         KdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107512; x=1790712312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdJAnLwrz+/OjIyJtnetxy2JKy8P0MsUYxFs2QuKaus=;
        b=TQu+CBGrHCy7WYwFarCQbL47U4duGMZXnqqzqdkGkdW0q8i6933hh42MnQfK8CIvHo
         Awf3VMKsentKwRR720GtUU+Q0NOYqb+bRT0FHRvZDMqyGk5ZVTk4DBruzqZZmPUNviz8
         0U+AL2sTkYWRZeXf2dcvqTMV3o0nlICcJWs3vLSRgL6WZAwyqv5EQgUlh7GenzGmJM+b
         rJxVqprKcKWga0J5kvSdQz9o3tDpMZSZtPVl43APj6rE85p9M2sA4JI9pmvIXZbE2A1g
         sz3GgoOHaqe/0+SgKZGZyPlxJOhQ7cV78Ec0xCuFdEN0e5ZTUdxfnx6Vl8n2bAR8kn/F
         jzbg==
X-Forwarded-Encrypted: i=1; AKwUvBzzv2Oa8UHFfyXe5+jSzHV0XRbvcwF8gYiXFHpVU5YcL2ar6QPIipO28zywWQfmoXePGnozAnZdr7Az@vger.kernel.org
X-Gm-Message-State: AFuF++lecQY1mH85RWDxiSZczXlbCPGtiotT8TeWNbyGcC96ZwpVVpTX
	Te2DEgp/LsiC8iNlBfnlsVuF6lQdG0mboL2XgE1cyJTaoy03cUx+yxst
X-Gm-Gg: AYBFou3VLUkc0R7xO/u7e0xBC3rJ0G1bL7HpeXpAiF68clSTYEw6wHiE9g85W1snzu4
	t3ljw0SVRi50PvDkasXG/S3Sj0cnXh1m4xO6LlEhQUXI0nGN2msh0zPy9KaTQbeqyPWi+nk+hVM
	wdFZsEEQ2GmPAnO+i1ewyO4NWjj1kG4LEJSiCuGnA6TZBpOhX15LSJKl675OX6hYnTyXFq2P2LT
	H3GcMUbid4WfdanYc0C5MYlXZ1emYy+HyyBbGOjnDSj8Z2+iy0BZ2W4ZjLycx7jjltyDccAxgXO
	+ANdRlxUK/NVFejgttGx9FavLrTGOX+bqYDk32ESU/k8nAECPhWfRcVe0gdi/6nyzbr0mqz1E8r
	1XQ12BSHhPnvTC3+XLNyk/D9rGg6rCB+SLcAAh60m0rlDYjuSLGDhYZlTBjALQzrHnbuOsaLM2v
	n6T20G9dVDKDthCL1bzI34DVgkDkTJoajNDkkcW7j4SWgz/HqbcCOVewanaNUp84yGKpV3
X-Received: by 2002:a17:903:234e:b0:2dc:fcfc:bdeb with SMTP id d9443c01a7336-2df69d3649amr4211185ad.22.1790107512560;
        Tue, 22 Sep 2026 13:05:12 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:05:11 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v10 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Wed, 23 Sep 2026 04:03:35 +0800
Message-ID: <20260922200336.2201212-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922200336.2201212-1-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b3..085589b8ba65e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23740,6 +23740,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3

