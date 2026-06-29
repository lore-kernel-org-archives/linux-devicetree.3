Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062AE2C08D0
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 22:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782770978; cv=none; b=Xmd++m9Y3ajtXN+i/1TfJY553R0c5RQPH4g6hXzMl2+CxOegwRrNsDKRuc8ozViM35xFCAwDhsepnny2EbzGzX1nw2lBGGgo0PlIdSrSFS28nDffZNeJmBBGP1ZJKfIsb/YVd1oeTBaf+/9QPOTcaLQqw9SW1zXolLI8fogdV4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782770978; c=relaxed/simple;
	bh=3ZvgkqijbuMRZHZyVD7vTyjiiO3/fzLq7IsUEDeI/EI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sPn7lyNNkb7BlkTknpPaiuA57yW9Ml7U1vIzw3E9/6erYMf1TSHxgZp4a1Xyiw4D4Afm6xMnw6l6rEcosPRjZM2x+ku4hTmSC9mqVyd6I1m9F6xs4PHSmB+eZxkjORyEJ7jisXC1GXjjgqjoZz6WGeXVeXFJhgaFugj/HDtDao0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nfyv7T2a; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nfyv7T2a"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4624a44e152so3514753f8f.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 15:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782770974; x=1783375774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eWtjIYRwzsZNUE+tnUUrysdcLHF0sFz6gPY6Xuye6sY=;
        b=Nfyv7T2anmPIoTxMsdqt6/qvJe2Z0w1nuGNBBMDfI7Tj/Laacjf84nwbemPcE8xcS1
         lDCsvWFTAztPRcjGF1lfnVEn6qRcEGcr395/RJzQcTvjqexHyy76ZFzCsyBUZTPt3AmP
         cdeClix+O+3EXoyKDyIihifyOflHujd9cjD1WIpGCBiRkciOmAybz8k1GMe0670ayxIN
         kB0PFwOj39YiZNSjjrGS/XoB3R7ysQZlGOnF4V0v4yLEG8HpVlZ3MocYGDVZgcXeeewP
         WeeXr5uUI1fD3rWFRguueXv+z48MVq0zLRUxpbgUaBWLtOM9j/MBdw4QeznMrWAoRHHW
         UuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782770974; x=1783375774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWtjIYRwzsZNUE+tnUUrysdcLHF0sFz6gPY6Xuye6sY=;
        b=SxIkWVR/VORR9y5KBXSQTxOsPhof/FxY938rIh5L/A8Wex1NbO2UwfzUZbG/YRafqu
         eqEFL68XNX+YRe8fxnkbsWJXwH/pDOcocBDF1kd1PAqs+Q39Ml3Lcv/PW1/pxU7OMxR3
         /Xz/6X/lgdWu4YtrM4buVdjjGIu16SaQGd4t1O3W5xD7O4wsdkKufzvz46E5DdD7BgSi
         oxgO384pKxAQqnr6IK8plknO4Z5r56pe+nqgEoLoNomBkxX6yZXpMzNG3ElnyZe5YEDU
         ysxnWCstCs44i4CFbkGnTEUPCsIfvACC3JywK4ljAi6alZpztnzg5a70U6Yy1oDg+bs1
         37NQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpe0/ZZYRB74Q+96tL3Bt16XMaJRYJalE4g0RwY9yjoT2M+n/KmgntETpdk/EweB7UjwrNm3/000YGK@vger.kernel.org
X-Gm-Message-State: AOJu0YxcVu6aFTL59BHILMujmtfJn413ti1pmqV4MgN4Db2lBX7A3Gow
	WY9dgywCoVYP4JeXBaBK4QkGJFJaajC8ch1zpE1Gbs7wj0egTMa0hdYEThwJkZTv
X-Gm-Gg: AfdE7cm0rOsWRElqCK6c479kD2tBwgC2AjBmCReCr/RYod8tz580h8F8ZolrO+LOE4h
	QUYBX5Mx/K2gmZa+TTMU194bgVAHItyE3Ru51g8iK5TvsaOTanLoTm/XD8rumw+Y5x7OjY3s8p3
	kJM5MYEnfyy+hEg3Td78aeVgLQnLWH0Wb0ql861n/i6H3C7e+yZP+9e6mW1xK/WlcQnriWtLiCN
	rvk2CZkM8Jq9mG25mQqqDn3dj8C19VQYZx8wr69VrZ1E0VHHIscjSgvMzew+E7saR3P8hINCv8I
	lsKOfYE622HtGt6EsUaO66J05voRup6U5s+kDvJvbMAd1gJ2cW661dRGqNxgLNVmsVsVfQSkJLS
	kK8Cp8Aldee8HzhWf8+oNvp0+kaSiPlkxYxvbmm0NjDG9OgkASi30IfL6JyOcOiPlVt2MPZJi6l
	XgVrJ+qaVrWtJV0ooGVsq29Xr1b8lVB7/OqBgA4mHqUK75jsaae81rffeWdgiI4e2En/TEyPu+P
	3WlgAW3VjVeuZK0BpDU5p1ov3thKQ+bcSxCsg==
X-Received: by 2002:a5d:5d04:0:b0:460:1301:dec6 with SMTP id ffacd0b85a97d-475506e994fmr1291051f8f.10.1782770974226;
        Mon, 29 Jun 2026 15:09:34 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:dfcc:acfa:dec0:e556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195b3sm1644670f8f.8.2026.06.29.15.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 15:09:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/4] Add PCIe support for RZ/V2H(P) SoC
Date: Mon, 29 Jun 2026 23:09:28 +0100
Message-ID: <20260629220932.861445-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This series adds support for the PCIe host controllers found on the
Renesas RZ/V2H(P) SoCs. The RZ/V2H(P) controller includes additional
features for PCIe lane control and supports multilink operation with
two independent controllers.

v4->v5:
- Rebased on top v7.2-rc1

v3->v4:
- In rzv2h_pcie_setup_lanes() returned early in case of error
- Added RB/TB tags

v2->v3:
- Dropped using linux,pci-domain property.
- Switched property to phandle-array for renesas,sysc
  to support multiple controllers with different SYSC register sets.
- Parsed controller-id from the "renesas,sysc" property instead of
  using linux,pci-domain.
- Updated commit message for clarity in patch #1

v1->v2:
- Dropped RZ/V2N DT binding patch as it has been merged in the
  pci/dt-binding branch.
- Dropped un-necessary new line in schema.
- Renamed RZG3S_PCIE_CHANNEL_ID* to RZG3S_PCIE_CONTROLLER_ID* for clarity.
- Added locks to protect shared lane configuration state and
  prevent concurrent access issues during probe.
- Added cleanup action to release lanes on driver removal.
- Reconfigured RZG3S_SYSC_FUNC_ID_LINK_MASTER in resume path.
- Renamed num_channels to num_pcie_controllers for clarity.
- Updated commit messages for clarity in patches 1-4.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: PCI: renesas,r9a08g045-pcie: Add RZ/V2H(P) support
  PCI: rzg3s-host: Use shared reset controls for power domain resets
  PCI: rzg3s-host: Prepare System Controller handling for multiple
    controllers
  PCI: rzg3s-host: Add support for RZ/V2H(P) SoC

 .../bindings/pci/renesas,r9a08g045-pcie.yaml  |  34 ++-
 drivers/pci/controller/pcie-rzg3s-host.c      | 233 ++++++++++++++++--
 2 files changed, 247 insertions(+), 20 deletions(-)

-- 
2.54.0

