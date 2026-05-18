Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C2F46AEF2
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119623; cv=none; b=uTxyquxiCL82Rf47Wwu2tVIqR+vwrvTzDQ6FRlG1AjaQeqPzlzNuARYZlL5Rz5clvLG9P2ngyBY15zUE2qeBMjwwVSsBSULOCgXjBTkINQ/RsFTK1Z8/GaipfeKgPVB9W31fwckp5jo+0OpQkhnPUGoobqwojsWo3QsznJs6LpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119623; c=relaxed/simple;
	bh=ilxXJ6f6ocM13VA/URJIbBBqXtBkN2Q+ruqs2Cl8XYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fl0V5qnHSrmxboC/PCiR5N8dxEs2CRIRjf8lZw/AxpQjhEkEA9fZ3Pm78AfUEHg0R0CnWwS9cWBwi6Kli6LOd/BBH8eHrKMliRZW4WrlmDQOPihI+fu68u333W1HU6aq7T23w42XjmZ37w6weOUxz+WF7ripANheyGFJxpcraAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gooXQ9tM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gooXQ9tM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48d102471a4so20269775e9.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779119612; x=1779724412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zmgE78suZlMwwBJChVhs0s2vjaTS32du2erStadTtvQ=;
        b=gooXQ9tM/GQEQRs8OsgB52bzqkPnODTR/xxTtxJX7Qi87/5Y6v5lmiY5CxCW+ReCKl
         Dt+cVV7oYneyVB7uPlgJ4abvdmzrv5AVq2nQGH1GxdHXok4NlpAOkKG0uzyLfsDidHb3
         RGkKocbrqeNv5kjxFD6tabvxEkMzzrDBDSyxDm4SJQsKe4AT1h1b0G88HbbJ90AJAGbE
         r6+z6uDDKrci6dVLE69QRbuEd8hjQSBX26Ys9guPengfpbf4AzaAilAe01I3qfg2yld3
         w3Ut/LFpRffT8hcyCkmYVGpYwzS3XeoO1+MNgc03l2BmMeD8Iy6twnPsAeAFqc1Ub4Ou
         dglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779119612; x=1779724412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmgE78suZlMwwBJChVhs0s2vjaTS32du2erStadTtvQ=;
        b=Y46dgn3i9i4Qb1AKO10H3+0Ch8sWaedGnZ8g+6DokcqKpfVxRDs/Lq9oYVY/m4QCIf
         he/dCgEuid0HdvNOBMtF8U+4hV01n/L8GBIXgtSFHQ4MwoyDJJwubVtb5Nznx8Tz5cNl
         a7ayjSxTG9NW0YUOxL/LDL8t5C6TYyOxfzehWHY+1/w+XbF15fSUAIu6vSwa7h3SmQi+
         HV7KHEVORrTlsLBhNNgv0dutUY94JumGK/U3gmAmMgvLKsIf8OxvyJfn+/XwzT/Gu13B
         mZ1sPH5cwcCyRKah7YwL3oiEDQbxjnLzQlZYCCWaxWNLmIpOjB0P3LAe4cHU9kaLjoJr
         QNwA==
X-Forwarded-Encrypted: i=1; AFNElJ+vfxy1ChA7gG06PTXxo57KrpPJAg6Z1v5w6gtPYzfqxKfLk2pQH48epg3mcQN+dTwiCxkBRHbiXFcd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyza02e//cQqjJd4qDVlF5H+lhmDHX6EM+28KcYRCbqDDItzrb
	uO94jLFMmjGx6Jb8IT4i4DgKE/wAL0Oagd2wOfmHig4wROPgJlO/C9vc
X-Gm-Gg: Acq92OHHufmRumZratxx7O/AI1VGjJvK6lPU9ibqWqN1+iJo4l4EBdUpHuDT/A7MQel
	CiuUC8LN+iO/JvjAvwCslxmvX+rD1hyqETzauq9nzL3ijf/vDbv4G1PAL8z+t27oVwabIz7Tpsc
	2MNuyBC8K5wicOIqMpJABi80FKows/aB12DbXwJ2kDvAULLmCT1XSRopRhJw/23zyX976bWCp52
	8Rj7+wzJgSlwLmR/c1x9Ngg8TEy81Vr3E7vk+Vmjw13cOyzz/mAzS278Brctbs8zaEG8FcYXgS2
	U3Sde/DBQ7WgyXVizVpU2Gv6LUqOk7OzfJasIvBRPAuszq3clnFXE4hgtC49MP5sGRH5B/eaKFQ
	XpgHDKtNUZ8CdW+VG2481VBR8OBZ18BIV+t5lHBfkNj3LYwHAxg/5yFg2jn/iHE8KGYiqk6/LW1
	jdjDpA2MtD562++cj6uFKYznBWArSIWzW9lmRHBW737QGTvj/dgtRmAY9bLzcxBSbgD2eIYwpLF
	8QxWU+ONjBOgZDRavbqMkeleP+IDptf07F6/1PaXFzW88kA
X-Received: by 2002:a05:600c:4e46:b0:48a:75b9:5e07 with SMTP id 5b1f17b1804b1-48fe60d576dmr255690515e9.11.1779119612345;
        Mon, 18 May 2026 08:53:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2409:d26f:6d8b:b2cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm450054575e9.1.2026.05.18.08.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:53:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/4] Add PCIe support for RZ/V2H(P) SoC
Date: Mon, 18 May 2026 16:53:20 +0100
Message-ID: <20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

note, the dt binding patch applies on top of pci/dt-binding branch.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: PCI: renesas,r9a08g045-pcie: Add RZ/V2H(P) support
  PCI: rzg3s-host: Use shared reset controls for power domain resets
  PCI: rzg3s-host: Prepare System Controller handling for multiple
    controllers
  PCI: rzg3s-host: Add support for RZ/V2H(P) SoC

 .../bindings/pci/renesas,r9a08g045-pcie.yaml  |  21 +-
 drivers/pci/controller/pcie-rzg3s-host.c      | 229 ++++++++++++++++--
 2 files changed, 231 insertions(+), 19 deletions(-)


base-commit: d2fc550dfe13eef91b065af7a12348ba4162ac04
-- 
2.54.0

