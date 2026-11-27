Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760178;
	b=ZXnCwXdO7OhYslWdM64aUHK7f7iBr++vNfoX8ZcvJAwgKrn5KvA3EmbGnljgVaaUM3h/
	 X6X6tZAx3hY9vbP+oRIuj/CPcISsFTVC5zocoBiDhRsXK87k1IVMN4jycLqHaNFhT3DgU
	 BD+Q+I6Cym7OJW4Bjq1Uw+O0HpWpX/TWtEKe2cR1F11vCzO8VeT+vXsfKkbwggXJeW/qj
	 SFoBfslsVnIYH6Jt423IHBXU5SVc/qqYX7stDKEqHDCgS5FvZve05euLmc44GKgQJYE2z
	 9Yyui6Kl7qz518wynZ8ZN9Vv79kLGuqPkMsc7qRx9IGgWIIUH0Vw/FTdJ5t9OnJ62hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OuWplakanAytLhzmNLShOdT3+3TOarOEOpiBZuZmu44=;
	b=aVH5FeC/q2gnsBTBzA7gYWm0MiCxguB7PNSewFQL8VzW9wghPumZ5z3NBrKPk8lSXh4O
	 CwpCN+qd8zNMlz1IJ4HJg5gGK7aGh65VBY+NTLSBLzUjs3wrnHf784lUT1wAgiigOHHFR
	 oucu6k8ZsUzbJoj4tpOV+C7WLwF3mS2hFdnni2oNnRVDjWk1mVpPqNBxHbxRIiAFKYjg2
	 ocdREcxBdzEq5Lps1AkQkuMQljmHWxj8JdCvPFVrkjdN7C9qfEcYS+BULtbvn6imZqG6b
	 CKiBDqJquK1gvpY4xc6icm8rpHp/yFMVuiYrwK2Bj8WIA+P1ugWQEyt333sWk16BSdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I7Y34DHO;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2179D606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2179D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I7Y34DHO
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f02ee04378so60355895ad.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 22:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760177; x=1796364977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OuWplakanAytLhzmNLShOdT3+3TOarOEOpiBZuZmu44=;
        b=I7Y34DHOAl8yhxBGgfwGF4nufA+wi1VcyQUIf89HgsrXOoRaZw6LdnN0xfmwiZFmb0
         5TrFK/syER7E4srhMWHCv9XpP/TSi7uLlSJzDYAZsj8WoQsdklICaahbnYAD28T63EwH
         FF5RrURZuasQdW6x9NEVjKMki/x6tGQp88JkWwflMra1Hu3pkgPm1xGDB5TkcLM+DNFE
         Y46OovXugaHWbyTO958YABnmEy6fwip4tOVyuzfNLbdweEVKhtogvx4GnO0s2abWqwnR
         32eB3n/XxQPNhj6Rzgk3Ah0s7r59RXIP2JNhuNJb7BBX+pQ8110GR3/GxVuwsMuoiDxE
         J/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760177; x=1796364977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OuWplakanAytLhzmNLShOdT3+3TOarOEOpiBZuZmu44=;
        b=fIT9S1j0JeYUS8cgj0KN9YxwEZX2alvx42jwKzv5uhjVpf1kACEo83sxs2y5NnyVpL
         xTzvqHv3sjzwQSaMAnSc5P/Jp6ngt1D0KSuzSS7oOpbAoVmca0wchfQ4S7AXsyf5MEKM
         LeKSQFj19y08zRFmI38mWaXK4MRjrfsVvmp5KsSG5O37SAp7VP+Xm1aD04xYcnLvDVrT
         84KqTHm/mKFrj7VsCwCzjo1gAUnhKK5NgwtMuFbjkMPY6buvjDUUftvc9qdic1Ohdzul
         eyBGj6Y16fz9k/vP4CNnJ2WTvBI8iiNqSooOaWwlVI/ePA0M7jmyCgmIw8y/LXPrDYCL
         ec1g==
X-Forwarded-Encrypted: i=1; AL+hErGFnwldTkMfUyodnYJiDY+jttZeXdrDBPLJqTWBsn2cFwxEzYcR9zZk6inSKhOiZ4+POnH2awPhINxW@vger.kernel.org
X-Gm-Message-State: APuU4Z+ORxtYxCwcimve2IJq4I+yJIJ2Zew45dqt8Rrz5bG57BfjohiG
	rEU9UjNBsOQubTcsgKLERP3KYb90mvT0/GNANROCqoV7ne0VTM3lhz1+
X-Gm-Gg: AZFdTZeCJ8yxxPRTPgh5TDfWhJ9hmS93/GHGFQvaigpGIrQHxfySg7Pm7jCYR/3/MnA
	kMcQGeaC+Yyd3IAS1W3pAKNdgVwuw7UPUVknermemqzzIUwwFD+nxjjRsObIiY5DyAU60230BMu
	RauFKcCG/gjt6NfV3kzGdh1qLXj4kLVfWLHpcSfJWMDJTeLlwVvWL0YBf4YVvYhLnd8KBAbQd5w
	ehQ1CgXXlbv8/wNDOY0IqInCX/OYCXWyN6dGEwgqx3SSP6RwgHlQvKD2J6sE2dgaVosvPe/aAuL
	VNV79CGgIT3tL8jFCAGOyaz/ULm+kHXP+D7e/dr/DKM9DMUyfyUzI1e9K9LPKD1GOgG5YW0xHLW
	rSnngtsl8KE8qrv0vaArJ7U+DzOPHnnkKAhT3xrlmuLt3egYDbKZAoX7DvRYtnFEpz0wQrUKuCl
	Er9lguTQhtYQIjhbjfr0MwUhQ34aLgAEtKQdHX4x677IOeCVTN1BjNFPWMjpr6kCBOeh9Nuizyj
	YhbN76Qd+Qf/V9EWZplLc54Z2H3zmyxRWqVBAiI8575BwmCu/SePBaA/RBeu+EEFG4A3/uQ0/cc
	s4LfxzgyBNQtoBenE+sexw4ttOWxmJkSjEYdlShiMX96sICEslS3/piNrszRX5nx8eqBjlP71KY
	BPmuraWLBRH7ePdzuv+l9YUJDQhmKWM4QQHtVXpAId2gvgwfhZt/HKeAI6R9p8rA12qtlnQ4nXZ
	wV9J1nuAjW
X-Received: by 2002:a17:902:ec8a:b0:2f0:446d:30cb with SMTP id d9443c01a7336-2f0446d312emr253910605ad.15.1795760177447;
        Thu, 26 Nov 2026 22:16:17 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm114829495ad.28.2026.11.26.22.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:16:16 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/6] riscv: dts: tenstorrent: Add Atlantis platform
Date: Fri, 27 Nov 2026 16:44:20 +1030
Message-ID: <20261127061432.17306-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
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

Add initial support for the Tenstorrent Atlantis platform, based on the
Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.

The series adds a bare bones device tree with the CPU, interrupt
controllers and a UART.

Patches 1 to 5 add compatibles or extensions to existing bindings.

This version drops the aclint mtimer binding patch, which will be posted
as a standalone series along with converting the relevant boards. The
Atlantis device tree omits that node for now.

The series has been boot tested on QEMU and internal development
platforms.

v3:
https://lore.kernel.org/linux-riscv/20261109051050.105623-1-joel@jms.id.au/

Changes since v3:
 - Drop mtimer binding document, will be posted independently
 - Remove mtimer node from dtsi until binding is finalised
 - Reorder properties to pass strict style checking
 - Use the correct value for the timebase property
 - Add cpus label to cpus node

Changes since v2:
 - Fixes to prcm_rcpu and aplic dt nodes
 - Drop uart1 clock override. UART now depends on a working PRCM driver
 - Drop bootargs console=ttyS0 in favour of stdout-path
 - Justify aclint mtimer bindings

Changes since v1:
 - Rework mtimer bindings, fix reg property, update compatible and use
   priv spec as reference
 - Drop Drew's sob from bindings patches I wrote
 - Add Drew's co-developed-by to dts patch
 - Correct aplic num-sources


Drew Fustini (1):
  dt-bindings: riscv: add Smrnmi extension description

Joel Stanley (5):
  dt-bindings: aplic: Add Tenstorrent Atlantis compatible
  dt-bindings: imsics: Add Tenstorrent Atlantis compatible
  dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
  dt-bindings: riscv: Add Tenstorrent Atlantis platform
  riscv: dts: tenstorrent: Add Atlantis platform

 .../interrupt-controller/riscv,aplic.yaml     |   1 +
 .../interrupt-controller/riscv,imsics.yaml    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   5 +
 .../devicetree/bindings/riscv/extensions.yaml |   6 +
 .../bindings/riscv/tenstorrent.yaml           |   4 +
 arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
 .../boot/dts/tenstorrent/atlantis-evb.dts     |  29 ++
 .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 467 ++++++++++++++++++
 8 files changed, 514 insertions(+)
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

