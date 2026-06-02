Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC14A3B38B9;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406704; cv=none; b=c0+/Io8LddQBwZO9A1woFHq3QfNIS+R1HmOu36t+qKuNcY3NXL27vaiwZAONtZQ8h1ZmsuEaT1y7Sm3yvfGnv5ve4Yv6tuoMz5CKbDPLkADZlZMfb9kHW26MfNF6vPztf4XNfDLcnJZQ+1Kuw8BOdlctfeRuXlu//1YT+1Q2cyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406704; c=relaxed/simple;
	bh=nFbJfV8A9rkTWO5rSUCpM/WiuDOGMVCW5hVMnvc7Ax0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j6frMCo67IloLgMcPY//AnrRgNIigFR78Veu60nn2ZssxzlqFCRYINfeemY9sAfrrI7x/NeOzYw9/fB0OJiAGdUK2Epzw3Jd0lwZsF8yC8x1EvdRvR4v/Ud8rJGrscgLIJJBGMyLXIisAVWnYX2MXJCS7T5Dj+9qsCHw3pfrQBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5tEgZq4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5tEgZq4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A963C2BCB4;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780406704;
	bh=nFbJfV8A9rkTWO5rSUCpM/WiuDOGMVCW5hVMnvc7Ax0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=t5tEgZq4X1gosQV8d/ukdvT1TI1zfLnZB+ZqY2qSACyfR3SYRPCElc8fy7LIIT8/W
	 NKUvNkv2S5wx/ZWf889SK0joLtwPDqq/oQFLDI0VsQ8q7aWml89vPJmxlQ6qm8m9M4
	 IRnim1raOVidZDFD+oyq6qOynp+eJEyhygV4MTOaIL//aLbSLYr79++LUPdldAHFPN
	 waxYLeFgFQQ4kkDLKEsAYwDvQRjBgShleqMZA0gHHPuJSaq4mrW37oizGsNIJsmzQ3
	 PL2akodSbDiwl+P/+osf5ZATcCXwHtSR0/mJEF+RQ1V2vLvym14/fdcvuiveRyd1MS
	 XrqSJeW/Xt1sg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61372CD6E57;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Subject: [PATCH v3 0/9] ARM: dts: aspeed: anacapa: restructure devicetree
 for development-phase
Date: Tue, 02 Jun 2026 21:24:55 +0800
Message-Id: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKfZHmoC/43NvQ6CMBSG4Vshna3pDxZw8j6Mw7Ec4CRIm5Y0G
 sK9W5h00vH9hudbWMRAGNm5WFjARJHclEMfCmYHmHrk1OZmSigjSlFxmMCCB95iGp3nfoCIW5D
 FOSDyUgrZ6k5LZQXLig/Y0XN/uN5yDxRnF177YZLb+r+dJBe8qe6N0aayYPWlfwCNR+sebLOT+
 vSa357Knqk7rWpTSXP68tZ1fQNF2GVHHgEAAA==
X-Change-ID: 20260407-anacapa-devlop-phase-devicetree-4101d3f312c0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Carl Lee <carl.lee@amd.com>, Rex Fu <rex.fu.amd@gmail.com>, 
 Andy Chung <Andy.Chung@amd.com>, Peter Shen <peter.shen@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780406700; l=2654;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=nFbJfV8A9rkTWO5rSUCpM/WiuDOGMVCW5hVMnvc7Ax0=;
 b=9OYO2EkCb3s9v4KIZOB5CzKtPjN2qZy5OYCUH6Fz2p5VAS0oEFBRGKho+OiFsoj5tC9LPmRC9
 uuXDJTnkyjbAPzvxpLix2GwjKXE5mxRmXb2d5+1JJbL30aFl/2s93uf
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

This series refactors the Anacapa BMC devicetree layout to better support
development-phase hardware revisions (EVT1/EVT2/DVT) while keeping a platform
entrypoint.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Changes in v3:
- Restructure the EVT2 devicetree to inherit from the EVT1 devicetree, making it incremental rather than standalone.
- Add the DVT devicetree, inheriting from the EVT2 devicetree.
- Enable MCTP and FRU support for the NIC.
- Align PDB fan GPIO numbering.
- Add an EEPROM device node for the NFC adaptor board.
- Add an additional EEPROM device node for the SCM.
- Add shunt resistor values for HSC monitors
- Link to v2: https://lore.kernel.org/r/20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com

Changes in v2:
- Fix dtbs_check fail.
  Validated by following command:
    make dt_binding_check DT_SCHEMA_FILES=arm/aspeed/aspeed.yaml
    make CHECK_DTBS=y DT_SCHEMA_FILES=arm/aspeed/aspeed.yaml aspeed/aspeed-bmc-facebook-anacapa.dtb
    make CHECK_DTBS=y DT_SCHEMA_FILES=arm/aspeed/aspeed.yaml aspeed/aspeed-bmc-facebook-anacapa-evt1.dtb
    make CHECK_DTBS=y DT_SCHEMA_FILES=arm/aspeed/aspeed.yaml aspeed/aspeed-bmc-facebook-anacapa-evt2.dtb
- Link to v1: https://lore.kernel.org/r/20260407-anacapa-devlop-phase-devicetree-v1-0-97b96367cac3@gmail.com

---
Andy Chung (1):
      ARM: dts: aspeed: anacapa: Enable MCTP and FRU for NIC

Carl Lee (1):
      ARM: dts: aspeed: anacapa: Add eeprom device node for NFC adaptor board

Colin Huang (5):
      dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2 DVT board
      ARM: dts: aspeed: anacapa: add EVT1 devicetree and point wrapper to it
      ARM: dts: aspeed: anacapa: add EVT2 devicetree inheriting EVT1
      ARM: dts: aspeed: anacapa: add DVT devicetree inheriting EVT2
      ARM: dts: aspeed: anacapa: add additional EEPROM node for SCM

Peter Shen (1):
      ARM: dts: aspeed: anacapa: evt2: add shunt resistor values for HSC monitors

Rex Fu (1):
      ARM: dts: aspeed: anacapa: Align PDB fan GPIO numbering

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    3 +
 .../dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts |  178 +++
 .../aspeed/aspeed-bmc-facebook-anacapa-evt1.dts    | 1179 ++++++++++++++++++++
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    |  228 ++++
 .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 1077 +-----------------
 5 files changed, 1589 insertions(+), 1076 deletions(-)
---
base-commit: 7ca1caf017d34396397b19fb4de9ecef256f4acc
change-id: 20260407-anacapa-devlop-phase-devicetree-4101d3f312c0

Best regards,
-- 
Colin Huang <u8813345@gmail.com>


