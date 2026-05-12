Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562DC3BB66B
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 14:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596903; cv=none; b=Ffa83S/iCbHI5ZjU+8kv0rDWFKtVHIyoDWLPFgEhNkcB146kI8butDRYr4s7nZD+z90pucKbkoumQ7ZK+TUyd7ouzFpq4HjGLLQ+TwDdYkMpM/RldRosoShA917wAusCMe0itDEebfkInra0+XtdTyhtiBqUCKeK1KCebs95D3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596903; c=relaxed/simple;
	bh=z47JWqFftcX1RYznDaw2fH3SlQhw/xMXQT4fkCyVtIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SvCmq/qY4zlZfhyv6jDOWCCiBqvfbpRklA1ab9Wtot5QlhG8htj14PCIpzURZqkGNFrUfuNqQtjEWf7focDA16OABhzSVUeifIMI+4KskrA4cRTlq71zK0XdHKA6yjkqEVZKBx4LqAwnVMX4mGnD3eu84Y5FUQ1V4tsHwZIYJyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2U2krh5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2U2krh5"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44b052142e1so3163908f8f.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778596899; x=1779201699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZnXaO2XR/XSxB1WPtMHUkL50ezRh+7N6eUtxXGLRy8=;
        b=f2U2krh5d/VxrA1sGxo3RRTLvytCuV8Kcf4u9ThMl8A4lDI5breez5jKh05hFjqRD+
         TWgGkaQIMSQT3BHKCzYZ295O8fnGCFUmaSUWQcuDCcEw+SH04FEm1CfXrRb6lQ9P4DAX
         miiP7HTwgE76ecFyp4LHdT7aMN0uQj9QTuktWIB/SqF1Q2p6FdzCrl/DnAErS/kk6rMr
         IT9Zp3roYHfs2nLhoxS7rQAOOtBNJsx2X6B40pIZCE7U8tD/LT8UCcvhgOrTppJMbGcr
         foB3bT3EiBXvvwjzzCifSFkKpk+i+t/r7XP91baJvcnrO6f1NQdAV5vZMDzqJZNy6UzZ
         q8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596899; x=1779201699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZnXaO2XR/XSxB1WPtMHUkL50ezRh+7N6eUtxXGLRy8=;
        b=UzpDOB0/j0yJ/AUafVfXdun19Tk6uf7BkiOdM/01l0AKy2FEeHUaBroHlWN9xmhxGH
         Q15uV1c8JUMcYmY/ASkHlJTJ8pwumBqYOMDdOD4N03qnrD7iS9ztx7N+bQNkVQJlI71L
         VPi0+jk6S55TMRUuRZeDne38eaYGXjf14WughY3BdM1Y7Dv8SZa1ZzkPyBjBSAjGw9YY
         zog/hisIRHW29YASTCR23nf9AJbGXvaC+ETBne3kEUaEqnAw5Qt+s6on6jonmUI9yi4F
         GAAYeMLLL/GVc3ns9cMrHyIyI5iVMWbdiHFfRlnCDhanKrFywBX0BnlJYV1FNwkZM9hd
         uznQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZSTfbHBFBhZrykmiePWlllJJY8GcSqMvohhNXb9/6QiX/O9lU/Z721k7EazJjLtbR0K/SwNdpR1a0@vger.kernel.org
X-Gm-Message-State: AOJu0YzjRu4v6BtDDYAsmrJKvRrij+gAB4E7fGzbi11q3YsOmxnuC2M8
	Ft27FNUDMzZT4HonTwQjDcLdCPZL6fYcDN4O77Mutv+f7oGJUEiWJnm1
X-Gm-Gg: Acq92OFOfqpn206AgjiiEwxNNHF65aIqUfg0DQq1h5us3RyHMlKA6o1AnA6HTjdE6lp
	2yCNohHl08EIXrtMqmjybgwHGoDRPiqMauxuB27GMLIdpsOoSKCZSsd42aVZu7ORiTiIsnJ4/jD
	zpQ6aJAmp/Nm6M5cYvg9R11kf5HXeMp8P2HeYjbf7XnethTLs0pwCxzhWRs7f0dHqzILZ14JBGL
	jY61qkgbJLfYaeC220VVnniTwjgkPBVT5EG39v8LZhU8Ui89M1moEleawYZFr9JcntloWLp+c+4
	zmwaq7QdDY3yMxU1o8wDXBH0ihXF9FAEHIgcyF402Ts+4TgbjLV4Dij7ghehOd/NzVKv2vTb7yT
	kGrUMcOzz9MwY5QIQDYTSSE+IzgJjJ2qA6wJEQ0bDuh+LeMAaMYoDlTDEN5zhUVOyhVaTsQcAVw
	Fe64CYDAQAwkdd7+SosGyoGNdHG2LQpKV7X+QzbQn7uq5JTEXuUZah4kdhi65kb3+jd84F8gvr3
	gOS1yfmp6Nk7CC1VfcI/9PxVv8YohBVD20=
X-Received: by 2002:a5d:588c:0:b0:43d:300b:2285 with SMTP id ffacd0b85a97d-4568a2785a4mr21502140f8f.11.1778596898639;
        Tue, 12 May 2026 07:41:38 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:77f5:545a:798:321])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491cab9c2sm34978713f8f.31.2026.05.12.07.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:41:38 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/5] Add DU support for RZ/T2H and RZ/N2H SoCs
Date: Tue, 12 May 2026 15:40:59 +0100
Message-ID: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series adds support for the Display Unit (DU) on the RZ/T2H
and RZ/N2H (R9A09G087) SoCs. The DU on these platforms is
functionally similar to the RZ/G2UL DU but includes some SoC
specific differences such as a single output port and explicit
DPI output enable control. The series includes the following
changes:
1. Add device tree bindings for the RZ/T2H and RZ/N2H DU variants,
   including a new compatible string.
2. Make the DU reset control optional to allow probing on RZ/T2H
   where the DU does not have a reset line.
3. Move pixel clock validation logic to per-SoC constraints in
   rzg2l_du_device_info to accommodate different clock limits
   across SoCs.
4. Implement support for the RZ/T2H DU variant in the driver,
   including handling of the DPI output enable signal.

Patches are rebased on next-20260508 and apply on drm-next.

v2->v3:
- Rebased on latest next-20260508.
- Included Tommaso's patch to refuse port@1 for RZ/G2UL, which was
  previously in a separate series.
- Moved clock limits from device_info to output_routing to allow
  per-output constraints.
- Updated commit message for patch#4

v1->v2:
- Dropped the "port" property in favor of "ports" with a single port@0
  child, to align with the existing RZ/G2L bindings and simplify the
  device tree structure.
- Updated the commit message to reflect the change from "port" to "ports".
- Dropped storing info pointer in struct rzg2l_du_encoder as it's not
  needed.
- Add Reviewed-by tags from Laurent for patches 2-4.
- Rebase on latest next-20260507.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H and RZ/N2H support
  drm: renesas: rz-du: Make DU reset control optional for RZ/T2H support
  drm: renesas: rz-du: Move mode_valid logic to per-output clock limits
  drm: renesas: rz-du: Add support for RZ/T2H SoC

Tommaso Merciai (1):
  dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL

 .../bindings/display/renesas,rzg2l-du.yaml    | 21 +++++++++++++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  9 ++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 18 ++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 14 +++++++++++++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  6 +++++-
 5 files changed, 63 insertions(+), 5 deletions(-)

-- 
2.54.0

