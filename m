Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA123403FF
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206927; cv=none; b=tfG90rBhaC1foV3Pj7igeLauusBoD3panRrgHX71kWyPc1yxE6eaxOQMoY756lcOtqMSLlhvxWQ/k7oX0OKONwtukWz8SnuLr31aPH9Zg63+W7iZosWL5q2kIeaH+u3bt5HdfjaZ8UbpUJILFE21f4JMb5W7EnC7mmiO0bbRx+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206927; c=relaxed/simple;
	bh=bXwOZVfZPbv9p2fk7F7+mYAIFUci3SJVGmVm74QM+E0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MCCyWbrBeSCbTWv7lBMVgxLYRDC1a2OlLsPAkne6mahz2Tf1HVplD3NEeBhE1IiZzK0Ob72ofPWi8mgntFFUiLe0R2Tsm8bNtmSjJVy+WHxXnJOU5MIS6V11ueGFQSsSogfUYgRgicnQ0VenWBwjga7e9rG/iNRmRg0V2YCe3l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmBmIf9l; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmBmIf9l"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso31973425e9.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779206924; x=1779811724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+Mm35+gyRUpU/UbhRPzGueGup/98gF+lABSNhHuAq0=;
        b=BmBmIf9lLkK3QHu2DL9GovQBijYpe8AkCe6fWY1DZCM/Gu1eAmFxtqerQ6W2SXG/H1
         Mm5ODHyakrIYD0AL0g5pQJXTCeh4BW93lv+BqLLrSQ+Z+gj3ErA4cfIuP8192WtNkcFE
         mcKl8njr9EA105NLO3RszQmJRc1lQr9I+hvcQyMIt1qEMxyW5h8zjnGSOoHnk/g5YbI6
         A9DQqjHMz/wtFvdOiiVV4JS97NEzrYJBW73Bx255yA+p4Qgk8kCiTT41AdwAobFNB3Pg
         7yUoiKkpt69Fw7ncXemTO6kzznuMkKfwLQkrY1bJwYS1TAeMA9XKIpbMb/6fqgBnpCPO
         p6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206924; x=1779811724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9+Mm35+gyRUpU/UbhRPzGueGup/98gF+lABSNhHuAq0=;
        b=VeIZQv/qQvw1nzyjYA4Xoz6uDlHUy/M7enTVFHY4CWvzLIO3XqNfNZOKcd4Zvt9U3D
         3NL5wK1qDUzjjkc/pu21Irq93LxJtU/K8eFeelF93cjFY9L7Gk3iN7xpiamyxK5ONk2s
         tF2ztGrrOnUle3COV+OV3KOiNmgS8eT7mGI+ZEAvljdqW8c0HOPcgLDCEteaJJiPRD2P
         P5A//1/cAwSOq+IVWssw2d0463nhcFUjDqX1VithB2zCEJT4C0WocasDfabdfVrKhwmu
         oD+mnIk6fjyejTP40U0+7JLzLnfVDFayV5FBXF3wSp1799P1CUoQzui/2eyRoHhE9ADe
         21Ww==
X-Forwarded-Encrypted: i=1; AFNElJ/HY6U9x14lYcN/PyQmJsfEgn+2caMKbBQtX/z+qOLjyCUwuRLKed+A3e1NdY16L1v1p+K68W8M/aXb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi/kz5lH7R8tianD8t9lc1cCyn1biX/XEOESJ4qiidIhJWZXVt
	kwSW53FVO4V7u8n+MucwWMNI1LWpUHtUcAjj8ydXaXvs5nnZDMQsDPLj
X-Gm-Gg: Acq92OFGAn0NKwMisDMOC85/kldsatKgl4GxreGsBcvQOw5exNJTWKE3euL+aCLffo9
	5D/JFHCfRcLex6a8Y5LoUSazDftMUem5FwD8Oriwc3C+ZcQj4jkoSKt1hrUoxQv2nJS6j8Abrcm
	maMtyMUdDn9nXt7pOB+VHA7Ayn8SLsUrXmc+7QSDTtgyo+ygg0Eo6bcr4YiGArOZ72uOmWgEAGb
	n6mMlQhmeaGt2CLogBPgkm30TvU0d3EqYirsUBT1fkN2xGtIgF6ENX+GAgkUSawwJxma3c2zhU9
	J+BqPDWnNGbwK6PuuVYKp47aYKtzPGkGm1xUVuUA2pzqog/QawIl3YjFD3rFHAYoWQ3LKeGN268
	VJGwbhDKP4TMmYMvfSkhrKaBskcRZS6TpiOCYthySQ9kh0jUR5wKA3wtJ+7t9BZT667M1V8TO6b
	/H0NKjgusovCWCsl/srxPnAycKAdVJVF/rc7A9LmM2N+a4TB3jOfgkrEwwvujjUDbLjEde4ogXx
	BgR5b4JZ/YeQ+Sz+InIPL3ky5YwPBDaN7fTSQ==
X-Received: by 2002:a05:600c:4e47:b0:488:a977:8de with SMTP id 5b1f17b1804b1-48fe61ed3b3mr335858345e9.16.1779206923936;
        Tue, 19 May 2026 09:08:43 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f5e:825d:a98f:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab527asm372645305e9.11.2026.05.19.09.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:08:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/5] dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL
Date: Tue, 19 May 2026 17:08:21 +0100
Message-ID: <20260519160825.4082566-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

The RZ/G2UL DU supports only a single port@0 DPI. Explicitly refuse
port@1 in the ports node.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Added Acked-by tag from Rob.

v3:
- Was orignally part of separate series [0]
[0] https://lore.kernel.org/all/d1e0d4e0fe74e60345a3d043fb4f9128c1057638.1778141145.git.tommaso.merciai.xr@bp.renesas.com/
---
 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 2cc66dcef870..5add3b832eab 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -102,6 +102,7 @@ allOf:
           properties:
             port@0:
               description: DPI
+            port@1: false
 
           required:
             - port@0
-- 
2.54.0

