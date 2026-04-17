Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B56137105A
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 06:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408608; cv=none; b=VBiG6YlcQ3ubBp/AwWIhVC8zmFjaCkI+RINOTCS2WxoiuJsX0R5dJCL4gK1x/e5bXOSebNerBEhuY6OAAhaJcZ3LeJrttUHvobhwoDOof7/5+fo9YvP9Lpl835U6+3B0Ug8ZJrwcFsTkJ3/ugKg7TjpBKLJymbAJ1FtKdR+115U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408608; c=relaxed/simple;
	bh=kB0uaLsDsv5pyYx0PDbhoPEgr+YBzIpHg/aFXf+oWhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJadHOl62nHVyDjFMPgtZ/vHLMnmm3D+2TWo6cOf7xLg1rSjZbkkPPsCC/jOzt3u3dqFRQeH5/FqS1hqTAHZ5SE9CgfP4VUXSeIeCZ9WxcJ5tSNis4luhb8QPHFrliihofMSyMuTF+bBRm3lMy52CRYsAXppl3nimDRqBb4O29k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIn4YPEr; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIn4YPEr"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a3d42263e4so322201e87.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 23:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776408605; x=1777013405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSTYwE59cdM0X+83Cupw2VCvDy7g8S/i6/wXCW+hROU=;
        b=bIn4YPErXjOWZFh2CRH1JQEoOoEaUE1trRK7Nnw3leEy/IdmjVxIc7vidqX3PQhPwl
         ekLlvwVJPXczBMrY/3V7OadhvyseetZMUva7W8IeT/kqMTG5ggD01LQUyDaUBGnGL0C5
         JInQwexd7q0ZibaZaVx7g9Xex2UAo8ZHtJMP1h8N0uyd0ot4niwjdCMpkpbdg2rfGna2
         ETRha4d3TgqI4A2onssRhUHSPrczENKF7Tykod2mfqetsa4yYNXncGKtqmlql1kY4/AQ
         MoobS46fuLhWePhWskl7W0Pa9Fy9sbVGax9tJiP/sceotTUaMmnKDHauIoZ/rMkburAf
         x5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776408605; x=1777013405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VSTYwE59cdM0X+83Cupw2VCvDy7g8S/i6/wXCW+hROU=;
        b=Xv8wrVz53l5uxX87COHZ18H+wbSOwqHucXYHi0iyNxMq7tpETqBuKOHslehtgNOauv
         CcW/Q95LYpWSukngOkHPgnx3aj0ZcxLgy6VuQ/3uwBX1972wOLYGYE8df5aFXjOBZ5/0
         Xk7q88qR/w9Sw2qzpP8NjEJyLXDEyiJxg/rcQEyITkXtvld+SlBxUctgI9vsuFumzfHd
         /J2fwE5BUV3+rhO+Tq3828LZKDi4CtoT6uIEvG6N2Z+ML2ocBPF+SZwxvwW9IP2pR5Xf
         g261RBdbfM64mSrrwvhvuI9BgB0BA2Niw9EDsRgaI5ixjEdGtsS/GYVSu0eTH/+KFGPn
         sTgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3GK/qy5aHoZ7uRdMng+/SxfDEHyuGTl09RbGU6lFG4Kwc1XiEFHtqnZblSCqB5VWHYu+TcO7rClc4@vger.kernel.org
X-Gm-Message-State: AOJu0YwTbMJkVIgPHY0WkYoficQ5+P6jQ2I3IpeCWR9++ZHYoaQNaPLU
	cCvPBF4E/xmtg3WG938zTGfMOKQe5Ve0pw6u3n7+aVhWDyuPGyIVFx75
X-Gm-Gg: AeBDietLosCGrIzwDMpn+V+CXDA9GFd+yBwRxioJBwytQKmHlFG+AJ/SswliPmglgll
	bondSHIK8JiIR+pFPAPCxO4EMr/aoN5Sg1UnfmzCfOl5NGyIbvP139+QymTEZxTW2U6vWzoc7Cp
	DKeEqF+vZizGuOOrZmo7QKZ9mVrr9ud196dOTSzs34ypYea6fMdQ9xInL1iI2vFryBtMMMAxPxo
	8xQvA/pt5YJgwc6aTknjc8GPkgMWaKc3pg1MBb5h7r+2FtCvjD+mNWzE3zYy1atxC4Uw7mw05p1
	h4mJN7okUppJqbtnErg16Kei9d+NbHewjOJTwZNbZE8s6ekf5h+YPDCrkfoTQo/5i/s64Y5MAK+
	A4VRwrGpeIJAfS5mworaU4Vt+eEbu1fH/LTt5YA+c7z+Uwmv1EJ1EYdT25Sxbc7Gs9H3zSuAvki
	Opcu51sc2PVC+xl/IyrqMa5XM=
X-Received: by 2002:a05:6512:6cb:b0:5a3:ffc0:882d with SMTP id 2adb3069b0e04-5a4172eabc4mr447159e87.41.1776408604501;
        Thu, 16 Apr 2026 23:50:04 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad143sm153202e87.7.2026.04.16.23.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:50:04 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3 RESEND] dt-bindigs: display: extend the simple bridge with MStar TSUMU88ADT3-LF-1 bridge
Date: Fri, 17 Apr 2026 09:49:52 +0300
Message-ID: <20260417064953.20511-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417064953.20511-1-clamor95@gmail.com>
References: <20260417064953.20511-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A simple bridge used in ASUS Transformer AiO P1801-T.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index e6808419f625..7636c24906ba 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -30,6 +30,7 @@ properties:
           - algoltek,ag6311
           - asl-tek,cs5263
           - dumb-vga-dac
+          - mstar,tsumu88adt3-lf-1
           - parade,ps185hdm
           - radxa,ra620
           - realtek,rtd2171
-- 
2.51.0

