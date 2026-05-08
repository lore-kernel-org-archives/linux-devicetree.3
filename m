Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4B1393DFB
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 11:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239073; cv=none; b=PEQk8LxkBU+P8caJ1EAtUbBYlVyFPKEjODFkQfWimyzZghUJrNoCaUmcSvET6/TbWVDwtNdLqazUh/8IWeACZfu25IeRKXOgKUrwsTah5KZioEOz6Z64G+M/FviIjuxeQUAiBOsHp1wdGuYzgF1LlwT+Y/1V/A8p4ZgMka46oK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239073; c=relaxed/simple;
	bh=cih7KlGPpFgUEiNss2zxTKa0s7P9pJ/t9FSqGyajF5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OSKA8CV+QPmTNw3RQjjFpJ2UkrWnpLB3gXScdIvMDLXzsSSpbJMTAqlPjQ9+i2uCP+Zhl4Ri90N/X60d0IZE37dKbPu3Ig9pjMCKpbiMdu3Vr2sMxXsxJ8LiZHtVKC1uwph3GFq26lYjg2dWPkiNmTFEygrq9s195mOCeCwImoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qoQW5PU/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qoQW5PU/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44a044cb827so1481676f8f.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778239069; x=1778843869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a++Qkbe0N+QcN8OOW7PnS6Fd5+vAfw/HCIN0DGOehPI=;
        b=qoQW5PU/ocOIDWH4Y4s1oi2scwRHbI8lKD7J12PTQ0ZI/1EbMKUbd0vmPDxKRnzcGH
         CptoQxgBX8jNYjliO8zdQqt9xei8gixbQsEICZjIwOTFnqSXZ5vcMaVmzDWQ1vWmI7m+
         p4EGjSVPGkK5p71KlZpfTwaOEZOrNI44RyNtdSdcdwshkg+Yu5VYejBRtnfLexKYTHgm
         J3Zm4vywuGXGxVg7Hia8pYvG/4XL7l3WsXDMFH2KpUMVHq+Q1nsik/1sLr4EPxBblpWW
         1weuKoY4+8YhSWwkiisXfPP+892r+Mq5ihScQKOTpexCFizXhu4xSqHeKtMH88Z7lfZb
         40fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239069; x=1778843869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a++Qkbe0N+QcN8OOW7PnS6Fd5+vAfw/HCIN0DGOehPI=;
        b=FOzj4bDc/3/r7rv2WiM2cSmIEZtUKM4Dl8CAu2trmO6PDTR0S7wICEX7ONI5aL6OvS
         HQT+uyk8NMhvnxaEfkzmqYbI86KPzq1eR7/uTKvxf2wqS7BNbHweve3d6DuZ0GHasVWO
         feTxQrbSTloE83Je7VJCOUPZZ2wboQ/tbMJaBdWS2co2WLRFD8V32IJQXEkfVP8GfZaw
         4uXn4YPOucXhe+KuaEZZ6NY9TBc5aoluZRYXpQzf8K2n+h0Hv0QVP46bE19Il1xm3o3G
         wQ/t5jggJdmwqdyQLkWBCjkc07sAur06or1pykL77HXp8CK3op2+lsDYcMzTZTI8aSj1
         7owQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eNOc9H57kVHamkRyLGtE7DskI8mEL2H9iYm8INWszdcmuS9SGdfCg6wfrK6vdwALGNGVs4c5Hoa47@vger.kernel.org
X-Gm-Message-State: AOJu0YzSeit7RUcyfy69cDERaT3F1y9coYmtCdPTPG0HF7WxqyjDygu3
	T7RIgLp14tBjlf56ddKY/BrchZIAVHyyT7xy3cLoxrnvTl8N8L9ReAw0
X-Gm-Gg: Acq92OEy3oPGCYBw8T7z7iTT3RkyGIwf+FV7dTljSCNdPjrT23bavnedfcwvzKiFywh
	HuYuIoehEsMF2ei6d8nui82x55Yi+OZUAMHfrXYcdmtoKt1nuOp4Q7dxOnF1RNgryw6hcmae54g
	zf4GMZr2/MyH9hx7yCa8tHGoUGevqtDvVRddsce/8UL0UIjIWLdTw2vdiQEPQOSlkU76eYbn46c
	r+7tqpS0+wnVfReQhxWpSKL15JmfyAtNNqfQ46YurHPGHa/fHAa7bxOYtrcc6Im5hUBDHiqTpxb
	ZsughbMDokoyd9H6egQFyFK1441DMH/y5e2E041iGgqNWCn/dXO4HTSyVvsk6u4kK0C8NmBCa02
	giNEcmzj9mGgIZGQWFLoMKhWj6I1oQjUcug/U+liN0qSMHG4dQQKPDexRbNedcVfLfOg9Fw1k/3
	KcwMND7FDU/Z9hjyQzuiS4kUdpsksTwZL6Sde9tEeWrRzHmFaWWU/EKFqsbUYzXMroeapFraTQL
	p+PRou8WsimfYJX/TXlYkHXmLuSPdnZ6oerA3+F5DM8H779
X-Received: by 2002:a05:6000:288f:b0:43e:a8ad:975e with SMTP id ffacd0b85a97d-4515ce1c8damr20978761f8f.27.1778239068762;
        Fri, 08 May 2026 04:17:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:74ae:919a:e57c:bd9c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454916df968sm3535563f8f.25.2026.05.08.04.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:17:48 -0700 (PDT)
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
Subject: [PATCH v2 0/4] Add DU support for RZ/T2H and RZ/N2H SoCs
Date: Fri,  8 May 2026 12:17:40 +0100
Message-ID: <20260508111744.771659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Patches are rebased on next-20260507 and apply on drm-next.

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

 .../bindings/display/renesas,rzg2l-du.yaml    | 20 +++++++++++++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  9 +++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 16 +++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 14 +++++++++++++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  6 +++++-
 5 files changed, 60 insertions(+), 5 deletions(-)

-- 
2.54.0

