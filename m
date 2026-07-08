Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E109B434409
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 16:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783528396; cv=none; b=WFu/VUortpmB9+LnumfSWHjxSJFJvbKjOrAg6R4Lvt2R6yEUk3KS5U8UYv7izJ018bVEYB2REJ0ZJOAlesV0+74dGtRI3XA9Q7YiQSaFU0yi/fYLcXhNi6vxE6kneI6maGQowsBrQIZofKW52XgVNOC6ccfs6kza5N/Kq/nt2IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783528396; c=relaxed/simple;
	bh=62mslteZhIKHAWAAXWoeCiNpK+rmttXRRahA7/bf/Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K4KK1ZMtCeIaWpzy2PdfaCfizPtuomXquZkgzkQcCiP2Yi1pr/FExx2eX+YXbL8s7pzCIBJp4AxOvvqDktgJV30Fo1VNryH3zfbHP6eu+bmH2is6ebOrxg0G1ptttTwaHfI0ms+9BqV3VGFLzxj7aoQkkKUxjbpl3pfezcYQu2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6OcfKIu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6OcfKIu"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47d70879764so664530f8f.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783528393; x=1784133193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ta7U2T72D7YYjRgGX/nLZ9LJda6iOq9oicgwZdyzAQo=;
        b=g6OcfKIuJ7L5EDWtVxMv4dAffNDnG8+aAeJcVXjmHGaqgXXc/Vvx/B/Awxvbyyq1fu
         vgPAyLVz/QU0hApXqdZUQkHEXOW5e9c3E37G0uGEVXzYw2xjKu/oVYdX+nNNutdEEfGc
         mzqq4GMuUXFbws/O9SpgGhXgtoN1tACGOzjRz+TPBYatlqhCVhCNT/bZFYFok8ds6ome
         SRIKnc6s2ImYRJMlc+LVsy8OSv6yb7wwD9ELs/9mWtOSqX+hg74ih5eO4nCQ5yoT1TZ7
         00C+sFwIXoIIscLNnxS9/u9gp6/M0X8wJ2OH/HZOtlmW8Bh+h1xh+mSRhczvvjmdLY7r
         k44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783528393; x=1784133193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ta7U2T72D7YYjRgGX/nLZ9LJda6iOq9oicgwZdyzAQo=;
        b=JDKXlHOIVzFMfWEa7+itK8PTpC6Gt6DljBAM+zWfzDnxkfOA6DD0LbDMir5uacbTMK
         Nnv6ryeDLa4bUL18BGSemCY2t3d0gZfDVCmYuG85Dn2Z3GpdMnr+q2c2LrJpYyYkQNmF
         n189r3STd+DP6xtxtjhXonKLGhk2fx2gglm/U/2xFRUFYNdb6tpKELCRhZlZ+8u0yYDs
         YetcSdRkiWjkKcTSkDM8BaESoe6zFO5lYvCs1omVVzs/+GSig45TbADp5yz9H/B8UYoc
         hiMb3L7gNz6oY/jWkrPoog4kKs4SWlcLb39NQHC9F2A0QdPECV96GMrzib2BHSwn3L0j
         Rx2A==
X-Forwarded-Encrypted: i=1; AHgh+RpW1JzBY+7/SOpWIafy+4essq+JOyEbBdCn3wrN259kECCAuyQTGn+A1PNS2agSN20WmzC9Jnu7gWp7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywogw65saOPMHXC2wkIxeWzbqr2EUaqMFVAcdnTdjw+ef0NY17K
	6IUs8F0ik43KkV9P+9TRoEndw60QwhJeAvpyIHfGY/FA485H6hENcj2I
X-Gm-Gg: AfdE7clh+3iuTgMQF/yMB/FjkmWGuhTb5JkZiS3iNFcRhEcnU3OXE49+BlEjWpVhOyY
	gytx/sSFCA09vaR/3QTF1VVgSbkyMYuVPcjHKvKvGtywibNllME34LXzlqNvhBs6ynTxCUC0aFR
	45a9aDbMGN8yjEqNxhknp3O9JS0PRyCoc7UX4Jcb0hZBKN5WJL5Yhpan61MEyH0D962HVrixpDA
	aVGgZTQVt+aYR2eBInDtriMmPY9PB1t0WkxJkVIrYmajW0I+rinpiUg+o7KzPZbfG3nHMvADg2D
	gCvuiM2BBCnLOKXc6tjc7hIu50G9D6AzKzvJRpjOMnyQeYcgoe8t5ex7asRb+S/5UdZM5JU/6ME
	LxJkjAugFgO5+1klIu3HPLengSHF3+KfK9CRlPzgI8kyx1pi9eNPo9VcY5MMoUHJKsK9qaTbO8o
	z/xtJD7P6kq8jmMwxgLpGr4v9YKn8AfoWo3No4KYTp73PfkIjDfKQN0PTKdfhvcOkL66SroKkA5
	scbTgAQEFI1A4P7MbDxKW8qW+w9YVI2XUlsIQ==
X-Received: by 2002:a05:6000:2911:b0:46f:9d18:bd3c with SMTP id ffacd0b85a97d-47df07a959bmr3978720f8f.12.1783528393111;
        Wed, 08 Jul 2026 09:33:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca98:2759:6fb2:4aa7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm40184167f8f.30.2026.07.08.09.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:33:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add PCIe support to RZ/V2H SoC and EVK
Date: Wed,  8 Jul 2026 17:33:09 +0100
Message-ID: <20260708163311.222176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds PCIe support to the Renesas RZ/V2H SoC and enables
PCIe on the RZ/V2H EVK. The first patch adds the necessary device tree
nodes for the PCIe controller, while the second patch enables the PCIe
slot on the RZ/V2H EVK.

v1->v2:
- Formatted the ranges property so that the new line entries are aligned.
- Corrected the flag values for dma-ranges property for pcie0/1 nodes.
- Renamed the node name from pcie to pcie0.

v1: https://lore.kernel.org/all/20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Note, the driver and binding patches have landed in linux-next.

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g057: Add PCIe nodes
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable PCIe

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 140 ++++++++++++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  18 +++
 2 files changed, 158 insertions(+)

-- 
2.54.0

