Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A119243B6CB
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 22:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791239481; cv=none; b=DQCcEmYpTmP5poKHB1rHKrmajSp13BzIIZztwHWFNJQoRZMdDkrjtDxmF1AiXjzScYtJcEtmh1GKLrpz2XUdNhzT23M1V0nSBPCkC6fgde/CCAyudreWgrdzuzwF04M47qwPjdazDe++pa17gSInL0TE63mzKXF/sWN8AbNabmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791239481; c=relaxed/simple;
	bh=77hqLc9J7JNzbmg7AMorhPOB16l5fiuXalMgNBngkQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hVjRqmvSJ2e/NYWUrnz+gEA8m+kzgQlJSXTS0aKHrPD6ZjCZX56919IRzqA/3u/Q7umuYqCl59eSHGRQyKOtl4ebSr/JqisbhX7FXDWHHzxPKhVko3NPdIDDdY62DdvFsik/BgJ8anfHYwEllHYT+ifWpU8XKAV2pT+PoJvaDYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBHF6wg6; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBHF6wg6"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e2f352108bso11097175ad.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 15:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791239477; x=1791844277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=cBHF6wg6EN2brUIc7EjrlTuEh1tDzRMsVH7OmiGsYDdf75R46+l/kuhJyeGa9KYtuN
         LLiiqAmtKXVDYXQDL1Nx2OK62JMwjwowIonEqGIZuVrs0QLVQUCTB/tw/JnKJFO3bsNc
         OT0hRe4TUv4wONJI75NjnJ0tw4tbAXocNcaNVj85d9LS1r7D3IWvnljBNxVrsd2ze1aJ
         BQLG4wOICZFXPwPBtfRdYd7DWz8gL5Q2CLyAr9x/kseFV3dC2IdXJapDqtQzBbxlcHEp
         Y1koVCLLwM6w9/ZmfT2TaGdcHAAF+eRIXDHbXh+6ry+LJfDC2vtJhQRBdgJZ3t2Kw5ab
         Ifpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791239477; x=1791844277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yY8SyQWcSYsDi8cm3rA+aW2F8vWLi9p/feyMtYn7Pcg=;
        b=A8nDjqDjYI5EBCP9PM9dRuMwQpuJcoaVT/4AOwGKzZbZZgHzEWe8/WddOZEAFF7hWG
         Y2BhKv+uHcj4j766f0vtzv3RD3tlY9dl1KSW3GzSI/gbrusUVZQ15l1C/3GLUvxVclqP
         Ig90nv51sf//yPil8Tf5Medi75Dlxobi5I857KGeY2UOpVYLrF4/nbVzLDF2x65Jx4of
         0oA5hOtZpoCQnJLebTV23HSVZUaEpvdRzn6uiFtTR/tujtpTp5gbzm+Fy8YBaSklq2vP
         /GK211+RmFafxv7OvUEZjYGj8OkjP0QZ3THXB+zCSFTNw6q0dkZZ5l1teQinSXGGu9Fr
         PlYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXoyz14IsAI/t2OiY/HPFUETFpyQqNK7NFt2wdmqdFmrLAfWl2zOIbs2g57GAwR8S1DqQ/Dizo32QF@vger.kernel.org
X-Gm-Message-State: AFq9FYKvAvVrY25FGqUzMWvGMND2PoAUhO33WPOXwoc5YHZlDrfXh54k
	z9sKP7d38bPnSaEi55DtCUxkhZY7xIFAf90IZRIaj5yPnPcnzBDCCc3s
X-Gm-Gg: AYBFou3e1TEO8TAM+kfAUKepJn8DXWmacf2RAbUWUddpgaD7bITjuf8vIePxMsEhjH5
	JmQY/XTZrS2TA9ELA3IGyXuogvbtQPvGV+ygXPTTuFcM6TuXGBUL3EqouTM7man6QQk8QM8ZBaJ
	20cKKjpm8E8jCbiP8wBOvgvzp6MNrDn5hsrs02jIEdORYBd6mTB+yNwRkBINa4/14HK5B4RgqmR
	p0XE/V8I9mgUDyy/8y9vxv51csQdZXkVRNwG6/QGblJLvDDDV9A41vGNnRvloQzf51wcqyR5yZN
	VE1LRtgAiaWAzHOWTJpK2Y3mrS2YV9bqiG3vKgecTsKz02sjA4o+P2f5LiD9BjBUgX4CE6kuds+
	aVoo35vJM/QkFzKAjoQqiAl1PPsvgmqmLw8YJnKN2xDvgFM2BnRoZ6JlDOPRaLCPAD7eSZI6Xv8
	+Nw+V/cptL7B2BE9RHBVglgY9b7zb+dFXrq8GxQQ6L+H+sqqTUhqvrg2SlfC7dxOeN++he
X-Received: by 2002:a17:902:f60f:b0:2dd:c053:82f1 with SMTP id d9443c01a7336-2e49b6290dbmr124418145ad.40.1791239476903;
        Mon, 05 Oct 2026 15:31:16 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5f05321sm13203705ad.78.2026.10.05.15.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:31:16 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v10 6/6] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Tue,  6 Oct 2026 06:30:08 +0800
Message-ID: <20261005223011.1124347-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005223011.1124347-1-coiaprant@gmail.com>
References: <20261005223011.1124347-1-coiaprant@gmail.com>
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
index 65e8a4b5c90b1..2f0f46eabcf54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23757,6 +23757,15 @@ S:	Maintained
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

