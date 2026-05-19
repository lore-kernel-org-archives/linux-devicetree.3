Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058C82E8DE3
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206926; cv=none; b=XNNjuE+XFWoz6wyv+mrThtbqJmZ869wY5pW5HheRxE6bVUO8Hhq0TqnvECfyaVIPqZWZizYRCUt7bhc9wACJpVa2MDQGcUU8a13za0Thrffre1yYSRAqzkK9rNXonE0VezD1ZkqSESJtwzkBWZUZE5ZmFo2u449TspTXrhIfiqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206926; c=relaxed/simple;
	bh=A+yoSoKj7bowNjrT/qO9FE96PQ7mxA4+K9JfLWTgufg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cx/2bu9P8nuhZ2SAx34XQRrysKhcFIUB238463GimMkNPFn5oWgmWlkibsd9dnAntIrX8U7ZbiqaOFLWdg8+qK8oqQaefOxiHzI2mxq8J6lsOsoHXZsOqfX5bze3L5oLoDqsF3lnw2NyD1ukPkfgddIMgoZI/onmm/B0vdNbjjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3w/GFFk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3w/GFFk"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so36814855e9.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779206923; x=1779811723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wxS3QQnk5GN7d0xeWk5k+vZ7DrxTc2p5byKRqEc/Aw0=;
        b=K3w/GFFkSkFhGUM/8iRFReXCNW3BopNaZX2JdirSq1tkGIgO4Rfb8tUU9f/oGVW1oU
         LHczQEUzfEq88fvSwpCzyAXdk5OFEu8t7bsnkJx+X3O0nMzjEa8tPn5WlJzuRi3r2ruQ
         85xooOnNM7YufRNGM/CJiyrx4MpkHA1UJknPHoGg0E67DQ2bX5CNO1XaTd2BHHYzmmsq
         lCFGMV5+3Kt8/gYREkKJqwYlKaQkAJSY4qVpYNkWLtLuKoHFVUMr9QHwzZNGcA29YSu+
         psoZhMUN9tvFewT34NSkt83CvgvvhelTvLeX0LPzfKVtRrAlpa64xAoH6V8BCs4AWhEf
         9VSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206923; x=1779811723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxS3QQnk5GN7d0xeWk5k+vZ7DrxTc2p5byKRqEc/Aw0=;
        b=ehdljrAPVsaVPPeXjDb+YjRznrtCPNEa7zGFAlpZRzQrU+NvXXmfdU/YBJB5RTlqBP
         PpAjUTIVIM6AIlMHt7uhDUYhNygBD1McdZtBT22uqq3V1nRqwZaC08smMn1azIhQYIxe
         IcGVNL5MxZqhhKPVoi2ivqXli4hMwyBKL7LwFt9EMYQ1FHwQsk93ixOihyM+gedXScg7
         o6MBuCLv3fcO266k4NShR4FHkSmtxm98dZvbaNFyF08ep7FzY2q5LFaRX+WrIub2/Czx
         jL/NZ84MqyDOMmUEH+R9SMBVtLj8kYFip5CjL3BR01/GozkB4E0hDW6ZB9+aD3DABL8v
         0XCA==
X-Forwarded-Encrypted: i=1; AFNElJ/m8MrPWALrHCjSrdKFeyjtG62SlvIDtx4MKhRFNtTTxDHtns6GgCltW5x5a+0TvCAPBCqoTNZAGml7@vger.kernel.org
X-Gm-Message-State: AOJu0YxsMj4cqfvGRgm1WuiHtz9L3DrHZJw3VGxp9nIPul70nZxt+S19
	nwMPWgBYfazjXiKv8Hf6qOOlE836aN6SYClaQdugkELbR+PHS6SaD0oe
X-Gm-Gg: Acq92OHfrdCRbiqHRaku6pz04z0PgU/73EbnK7i1cdG1nBE0h6QlGZ7SNnV20eri+9L
	UrY3uHZTvuXE1RG8IrTj78T7r3mz4suhHQdKSJa2BsdcKlqGoqheF/Y02MJSt7uBYVjv1XkrUym
	usFumrZHWHqSFwx1bdGxYFPOHbYurYy6lyYc5NeaYcba9KCXZKasofZMEXwogq8z3pd4TDQLCMB
	V+BTZnI6Mn75NqG5gPA13aRX913pVWG6zf7XO45MZnfeZi6vDkSuuZ6GhIQvn8Y3KQKIl7eth5T
	aqB+7UhesBX6teI0LhyK3MJQuyaQTa2mb4q1HGk4Ie+Nj3zx/xqdJkvXZ0xxSsRkqJZvwc+ApTc
	hBjFv0v5QV0nwmHKxevDgnWQgTn9Sd7Lx1FWkp+0quN1hoHwz7MumN+1y7nW0lXrguL3jlTkOLV
	Wkf3ROsaqkBMnfl460wFrV6VaJ+ds4cYN7XO7tySq/7YCLJhT0RVkcNtIMpf1BWQt8KJgRmO6Ql
	oy3PByR1xZuEn8FqrWApKtnR16q2k45ZQ1eYSivwQx9yOUQ
X-Received: by 2002:a05:600c:491e:b0:48e:978f:c45a with SMTP id 5b1f17b1804b1-48fed455991mr192575895e9.19.1779206923119;
        Tue, 19 May 2026 09:08:43 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f5e:825d:a98f:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab527asm372645305e9.11.2026.05.19.09.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:08:42 -0700 (PDT)
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
Subject: [PATCH v4 0/5] Add DU support for RZ/T2H and RZ/N2H SoCs
Date: Tue, 19 May 2026 17:08:20 +0100
Message-ID: <20260519160825.4082566-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Patches are rebased on next-20260519 and apply on drm-next.

v3->v4:
- Added Acked-by tag from Rob for patch #1
- Added Reviewed-by tag from Rob for patches #2
- Dropped per pad limits in patch #4 and added
  a check to return early if the output is not DPAD0,
  as the clock limits only apply to that output.
- Updated commit message in patch #4

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
  drm: renesas: rz-du: Move mode_valid logic to per-SoC clock limits
  drm: renesas: rz-du: Add support for RZ/T2H SoC

Tommaso Merciai (1):
  dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL

 .../bindings/display/renesas,rzg2l-du.yaml    | 21 +++++++++++++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  9 ++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 20 +++++++++++++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 14 +++++++++++++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  9 +++++++-
 5 files changed, 67 insertions(+), 6 deletions(-)

-- 
2.54.0

