Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621969;
	b=OHjQYsElO/dzDnojERjC1/Uhk6EyT3xqGHSYtVeY0E0MKdbMiE91NTSpBR66hH+5JznM
	 MlfWAM6nk8w/hQFLlDlAocB/FPai0QONKni2oZzR3okXiASYXhlX/IynrUY15IK6dPpLK
	 8p4ircKlj6H1ARoEsaHtzgGfJSa93ESkCyt5El7Wk/VSoz+AhsrAdlwkC/Q5+CjmgK35N
	 34piqEH+y7UlHenr/p3XOIBL3LcQyxrekFrxdTcQpFaXQXOTPAOS+7UUjlBpS7Btx5OvH
	 uOBBc6rtWxmRRSfBdflu6trYKhBL3FRA5r2Kd1delBjfdsE+6Ajr6Dft0YSG0CpnzcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MwHNjXTNt0u+bCEWd1wPqor93Tx9nuqFvKCrmT6b1ZE=;
	b=2dIpv7pimqCFCMWf1N2/coYDGJf7Ok9wWL9fxZLKHB2qtmpsmukQ6aR7Lm4fFMKb+C+C
	 ua0eDtciMHcL8E3sJ9/oO27UwYzwTAevTrnHsa9jCMKCAJyfPsOcTZFCjRIfp7c16waOs
	 p5CEHtlIUB8mKxtSE6fOnUJoG2ebU+1ttQ8RXnIVcQSWeRBwq+O794gCp3f6lnlkaP7qp
	 QTipYCkwJEGlXSE1qdcI5mRHlKTyXhLoW/6/biUny4dQ/DhhNFe1VHj4+C0s4EmWIk00M
	 jwFnjtAsz5txoa68tCfPCqMxuDJ90WchEOeA8zjTyvf6ZMWweixEP/p/jmWTuPWkEwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SrV+dAjR;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27488606A32E
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 02:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27488606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SrV+dAjR
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8446af403b5so1608361a34.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794621968; x=1795226768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwHNjXTNt0u+bCEWd1wPqor93Tx9nuqFvKCrmT6b1ZE=;
        b=SrV+dAjR8I1l440+SPZa5VXt5CnSngO+8rg8puX7LGOii7nOX+yhoTZlMMmqbH3I51
         u0Vk1HzoA1/EhlzQlBItuoEwGYEld6gCwr75pm3TeAAPjaU91IgAKlcJR9ZVdvW4AVq9
         mpJq6UYEBKbYFOb6TsTREQlPXTBpTTnXos1Buh5qi5YWs9KooQMNWjjwsE9Gqm/TmMkw
         xrI2z0i5k09Wflw+52Y4QJrtB/ZeZtI3HlLvZK2tJPAT1IbQYTg/UmN4Ef2UBKp4X5Ao
         kxF4rF+VpYPrR5hB2kQNtCSA6ulsHi+m2Lrf0S3dDW/2ZcvmlqxgvNCtVxTXpSog37BS
         INNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621968; x=1795226768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwHNjXTNt0u+bCEWd1wPqor93Tx9nuqFvKCrmT6b1ZE=;
        b=Qiad8x4DFjCfpaUyRAthtSux//kAEDpYPH0Ul0JbkQ/yQldh/Cwz2ialn09/eZi39s
         zekJ6uNy3L8KyiK7FGKbBpmQxTd7xqMXW7ryYQlnYFGX57rPjXmpoCyNF7bbxg39066q
         VehtJXvNmxDIuh8TVJI4rwxASMOct2KFLIDWZgElb/btvJvOYmOWXMOebShp2NiKhHgH
         iqqMcLnAJ6lC/S78kEFDGCBGqCUQO7WaLxjr3l7g/RaLziPoWRo9e8zGYUzOyFNmqLfC
         hFboEV0ZKuUc1Tm/uDfQSLhTnWK5lrUHVX90WaHhNZFJlS9/qLTL3q9C3xZ037vn/5PY
         +aEA==
X-Forwarded-Encrypted: i=1; AL+hErGK7rlDFN2IwhVnKDI+IGcsM7kuNEsbQqysguKg3AblcnL+1weGkfjqfk+o2zcWLSyA5CcOWe7nt2lw@vger.kernel.org
X-Gm-Message-State: APuU4Z8LCG2ozXa4B5U532q2+7FIGnIu4aKYWvZMn5H7UtWrO+Qqve4J
	v9+qwviXVA0jx9aelvlCEb6y5a3vUHPd1+kP3MLLuJPYAS+a02xqxVos
X-Gm-Gg: AYBFou0Q0Hl35rspCWLZDsH69GHLmmjYJ+v0H8YGQWu3h+9nlCzyxFQcQoILy2Pdnas
	MHQj8NW6z/iW1QuqO51K7jEfSs2Uo4UAFuJuLbQgTJrIiiNbTO3qR2yBwFHIbOw/GT9i23YSL0u
	DTPTcF+LRbIZd4/Ae4f7okOvDcMUGyfJzPukYpIB+SIaj/IhcMIqlN3prG+VbCJzUfD178DULPP
	4zuznYaH1FSN0lR1rNiFumzGCHHeq/HyHos4IRF/oKnEVJOY4659bd/4YmlncMQcdbGcoxKFB49
	q8sJeCulDrnwV6aH1otJ5YNJaHfyNdhrALB0Cce/sUhfMbC4wxgJTkuzYLgLreTajd3m1Fc+wsf
	K28VvNiA+IuBddCq5V6Vp4boMYmlUSuF7LJjHc8/hyYBuIBuVgdGgkE+hj59fjGuWLSk3YScSoD
	f7vDQRg6xdaNVJHNkrwhsy2qamh4KF4mRhofCje6XEjlBAyWe/Jv9FwUmcT8uDMO6NNptgcWaAm
	drTZiGaFzYGSvfS6t1R0XmaswVAjG4na9x4ncUo1ILWJaT9I+s4BGKg2FTahc0QOJcpIRqYhHDE
	itrOVOZhHzyz8OeMmTBvdh3HIDKlRust3eiBggQgnSXeVgI+9u7l
X-Received: by 2002:a05:6808:244f:b0:4e9:7d56:846f with SMTP id 5614622812f47-56e640bc904mr4002307b6e.41.1794621967148;
        Fri, 13 Nov 2026 18:06:07 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc3f179sm3385433b6e.6.2026.11.13.18.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:06:06 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Fri, 13 Nov 2026 20:05:06 -0600
Message-ID: <20261114020509.632311-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a device tree for the HP OmniBook X 16-cp1 (board 8F46), a 16"
laptop with the 12-core Snapdragon X2 Elite (Mahua).

Tested with Ubuntu's 7.3-based linux-qcom-x1e
kernel. Everything listed in patch 2 works there, including suspend
(s2idle).

Notes:
- DisplayPort at HBR2 needs "phy: qualcomm: qmp-combo: update DP PHY PLL
  programming on Glymur" v6 [1] (tested with v5). Without it the stream
  runs at half rate and the monitor shows no picture. With it, about 1 in
  4 plug-ins still gives no picture; replugging fixes it.
- The GPU is enabled as in mahua.dtsi. Tested with the msm driver
  patch from "drm/msm: Mahua GPU support" [2].
- Audio needs a topology and UCM config for the "HP-OmniBook-X16" model,
  which are not upstream yet. The headphone jack (SDCA) is not described.

This series was written with the help of an AI coding assistant
(Claude): the device tree started from glymur-hp-elitebook-x-g2q.dts and
the laptop's ACPI tables. I went through the regulators against the
ACPI power votes for v3. I reviewed it and tested it on the laptop.

Earlier bring-up report: [3]

Changes in v5:
- Drop the &gpu and &gmu "disabled" overrides, mahua.dtsi now describes
  the Mahua GPU (reported by Sashiko)
- Drop refgen-supply from usb_2_qmpphy and use the common l4f1. The ACPI
  tables vote both l1c1 and l4f1 for this port, so they don't decide it
  (reported by Sashiko)
- Drop the stale regulator sentence from the commit message
- Link to v4: https://lore.kernel.org/r/20261110202445.14100-1-jeff.roach0@gmail.com

Changes in v4:
- Rebase on qcom for-next: drop the PMIC includes, &apps_rsc, &tcsr,
  the SMB2370 repeaters and the phy supplies that mahua.dtsi and
  glymur-cob.dtsi now provide, and use the new regulator labels
- vreg_l2f0 is now 944 mV from the common file (was 936 mV); tested
- Keep refgen-supply = <&vreg_l1c1> on usb_2_qmpphy, which matches the
  ACPI power votes on this laptop
- Move the pcie4 endpoint under &pcie4_port0, since glymur.dtsi no
  longer has pcie4_port0_ep
- Link to v3: https://lore.kernel.org/r/20261028191800.27829-1-jeff.roach0@gmail.com

Changes in v3:
- Set vreg_l1f_e1 to 904 mV (was 880 mV, copied from the EliteBook) to
  match the ACPI power votes on this laptop, rename it to
  vreg_l1f_e1_0p9 (Konrad)
- Add Acked-by to patch 1 (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20261026154001.9323-1-jeff.roach0@gmail.com

Changes in v2:
- Add static data-lanes to usb_2_qmpphy so the PHY uses USB3-only mode
  (reported by Sashiko)
- Drop the Assisted-by tag, describe the tool use in the changelog
  instead (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20261024044650.9936-1-jeff.roach0@gmail.com

[1] https://lore.kernel.org/all/20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
[3] https://lore.kernel.org/all/CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com/

Jeff Roach (2):
  dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
  arm64: dts: qcom: Add HP OmniBook X 16-cp1

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 647 ++++++++++++++++++
 3 files changed, 649 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts


base-commit: 14825c9204bad7f4e0bd3a528cbf4a7e24e757d0
-- 
2.55.0

