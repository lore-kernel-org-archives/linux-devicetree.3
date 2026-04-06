Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FB836A007
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775461196; cv=none; b=DLsdsLL0dpj+yyyCS3k17dJNBF1MIbZQiZEKxRiBMCUGr+F5ildxRlaU9xFTsO7N7GlaRQXZrMBnxkqBVTokEoxosqQf2wB0sQMkpu6fUa0Hk2ZUbSWXPEGhk2uX/X+0q6vKguBrnMyZFRF/wsQ3UCK2Zy71ygzwO0d9jmEps/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775461196; c=relaxed/simple;
	bh=kB0uaLsDsv5pyYx0PDbhoPEgr+YBzIpHg/aFXf+oWhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZ+laVQhYvfDUnQSsODFxQmhBKGhawSG12qSfoYL29KuFsoYPNH6tPpxP7nzU8cX2kIfeUW8Ehq7WMGCf8QROwvwjB36FJ8vCEsNo9obw5Y8SrkIk5ROlB+ArEdynQPeJdvpo6amBSrkQqiuEeGkZdQWeSyHrzNx85JtaAYJLi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bs96tajw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bs96tajw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b8efed61so65865e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 00:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775461194; x=1776065994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSTYwE59cdM0X+83Cupw2VCvDy7g8S/i6/wXCW+hROU=;
        b=Bs96tajwVX2rIqbR/cYUXFwbLBJRCkrTRL+0XY69sh6KbR2wM85V9MdoniqUUZtfIg
         gGy8fb/b4EbMoR7rsYvYUY22AH3srt8OTNdonQfCEszDVmgA+1At9BeMINKbsOaTueLz
         NKqTGgusALrKWNQqMXZbD7LQ0KK1YaV/4Rppgqfr8k53W+fFvf3FADmPGpTeC3XEP8wE
         Bh2Wkia3nyf+C3JWhjvxp/Dijv678AbzPUDwI1OFXt5my3aXD8cyGfLrE4B0Mv5zml+8
         TnvBvvOE1MrqzfYRHNuDyLUsT6ZcC0j4Mx1d0TWIclJqLSlA9FjEBkoiv+vl2cJIlHCr
         tI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775461194; x=1776065994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VSTYwE59cdM0X+83Cupw2VCvDy7g8S/i6/wXCW+hROU=;
        b=A/OdZ5GCJ1zqfCEApOj+wBjQIgaKg7fU0afJcUBKbW4evpjw1cNbYMOya6i+ys9ssU
         4BT/8UpaY9hI6OcvOIi8CnEpzM64+LoN/7aVuYmMAB9d4MSH/9nPwojtRQto2r/C4Q1h
         4exMoGO3lkn1++4gvTFQORvo/doHO+prViR0vhH+ihFlzlDJjEvlKSKgaJpZJH3CLqH3
         7K8zrqM12sBtn9/jQnXyixk/Fot3ii0VbgaQJU3o/RXLxHjcKO+iktzjTFU9PAKCzu5J
         yYgo+4I5irMDq2leQXLs6LDDW1vPqEpdsLbCoJoHAX65jBtnJh5SIHn2aNKHrCwOWMSW
         xIlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOiM9AO9wApeQdbI2ckp17Sys4DiemZ2FoT397SG+K+IWVLHmNRR6p7n/PYOFuMVX3+Fs1qdOe1orG@vger.kernel.org
X-Gm-Message-State: AOJu0YzAkARsnICeFv4SOljTCp+twVDcCoMpkaxx57Vv5AMSsWKoBh4F
	Cyvgg7TukKsDTtwxbbSSxqes0MeZjrPc6DdDIHfAdrXXXGevnGX5ImJh
X-Gm-Gg: AeBDieuRl+2LfFm0DLP6MbSuMLgQw/kOIEBo9PXv4x/B6xvWumnQZpkzsfAaVB2JZrS
	QE4a7h3U5aX4X4QKFBXQYi+cn9PLWG/4KCbzwQ/x4MLI0zUJG8dd1t4COgovPoMqUGAIjicwQqX
	Nmv08KOdo/I6rFJF876N1zQDo1AQLLDF/tSeSBcaTEC8fSvNzcWr9A6ZzVm/+ocZ0Niz7zkGyEl
	4agUOTqhz0I/GmZiSYOCVqw4D8t124Bq5z7JBiwSO+Z066rsbolCGSv23F3fLNDmdHrxgj8g53Y
	18d0F8am8Pn+iUNyOAKhGs04Z9O2f3ZuB2XA/uYGB1MMreTFAIBrzPv0fbGGIdFGt1E2y9cc/3J
	ytBEC4RuNY6muRE/wux2aM7HJTcEZh4kinXlKo6QisTGTwPfHqeHcyHluMsWn4BTpFI3lXzZzo4
	Vi6g2fsPu0jDm6
X-Received: by 2002:a05:600c:620d:b0:485:fbd2:f72 with SMTP id 5b1f17b1804b1-4889945faa5mr162825145e9.1.1775461193827;
        Mon, 06 Apr 2026 00:39:53 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83e906sm527201325e9.8.2026.04.06.00.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 00:39:53 -0700 (PDT)
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
Date: Mon,  6 Apr 2026 10:39:28 +0300
Message-ID: <20260406073930.24662-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406073930.24662-1-clamor95@gmail.com>
References: <20260406073930.24662-1-clamor95@gmail.com>
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

