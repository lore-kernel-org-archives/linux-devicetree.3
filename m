Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491412D47FF
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 17:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782666423; cv=none; b=KGScnzVQgPP6L0CBGw7f0t5u2s71brhooz0gg4Azg5zhvFBrMC7aXaiOZDL8yjTyKcNo+yMbiZCPnoKobVI8dlghmnjqcz2LE7uevBPA/pQNX5BQcd9oqWZck2ZztpOpxwJldOE6rvcLzJ+1gBJzNoRTjmLLGanVOVbFUvJ1GPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782666423; c=relaxed/simple;
	bh=y0ODj+Vibp7d3Wn4q+1M+LcJbKa4KttcqEIN38Om8D8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lh43eLraMQhQ0CTVgcizhoIjcoN8ih0pptKVT/vaSUemsWSQOwuKYsWa3cupej8drK7xEsOsD7I99SIA46EoJWMFHafaZ2VM3dKbib8idv/o4r/Tur1Fpn9bSlliK9XRoAxQxWygLOUfbJxesfwyLRCXSrlFz7M4w8ttldpolzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOiruVsY; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOiruVsY"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-46ee68c3b7aso2137547f8f.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 10:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782666421; x=1783271221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMtfhanLoaWIgc8kmg+9O3SBgKkKprc+QMTR2Mj1PNk=;
        b=aOiruVsYBGeuIW7EGJ/c7WRSXWIfb3dYNeocBAzEdKFYpQczsgpcvASTeLtk71EMVI
         Pn35sbn3aMKXSW2SP4FHeGJY7JbAx1/mhwOksdsG5angtw1FZq1sJ7lorkkow7/5uWWp
         LDg2vc/jgxjRZCaNbXbj+3k5GusUYOEa/AC52brqI6cYBpRwdg6LLhZx7mwEafhhi3tu
         2mPR5ev4H6iMkCaI8xrDUuOM+nE20j3SsPr9AGHcNQFey/8bIYoMk60KVS/IhIijQkSO
         yZv4IunIEpWp9KtwoWNwi+UHEyWknMpi0Yq/nJ9rkouCnj4BFn1YUB9crEvJFfK1L5w2
         VveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782666421; x=1783271221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMtfhanLoaWIgc8kmg+9O3SBgKkKprc+QMTR2Mj1PNk=;
        b=oyPIg0ILbSKT5LPabAwoyj3WaAIooR6kRfnl87gHV6MLeVJmPqMbLPhCBUTt37PNQ5
         T7ePjBbtunphv8H3CNozMXDE52eyJBCc/zDGD2v4LalcYAC2HdCXX4okOR90N+GDpttA
         cOmP3sQ6/+qsxCinkYi/OOfhEdB9tXLyuX7VOesM7xci2w4XQVE+lTBoOJtMNUpty58x
         3i9K0JqPXXBxaa+49V0wDRML4/FETwn05Xn9a4/a4Vbrr8g1i3hdMsTRee/3mCuoqOU8
         aE8obS1nNVeQN/BUJRujx4wl9cWgOEQTEa2LzQoDrtCfHNVXnIED2p0WZAmEgpK52aq1
         yqFA==
X-Forwarded-Encrypted: i=1; AFNElJ/GAqYOfzWhD3EM6yhVSOfLlVbMAqNPdlMWJWkgDtilhBQnqHET1AHof+LdB8Z4w117prwh3cHFvTHR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuei1fFIbXHOnUxkv/JOp8sF8jFo8HVFgNYJzpP+B0dP7elXDp
	6aR7DuDDtodEj9NzkFlEtBSNfp1jC1Mjl4C5sx27z877Ju9u1rRHbMXt
X-Gm-Gg: AfdE7cnGfkGsdcn5HPlN+uFKG/sRDtduFqU7OEHLXFSfSZYAm2Fa3pCoBQHZ6PzycQb
	kzi+HIiuF8zCJqb4tS+Gk8WOjKRtUxc0ZwVT+o71tUU+67Ajvjlsb0ZNRMUqXMUW8fm0Cp7h1Uu
	V9VSoS6ns3Wclut6JrN2H/UJw0YHYC9xmCkXvKJkQZbh9AEvjWDxVrD8+qUm4rZhncg74GsFWhO
	KJYidV7F2hCJ+Tf2Bw6H1vm46vSmJ/BLdZ9Ky8hEit5O2lsjbgdsQFK1WmUI3zXLER6snI0gzuA
	XjW7JY3PebspFsOENMyGOrh7A2lbw/pXs8jAWf65OaKPth3feqtzLniwBLC1jm2S0LN3eeNiDaY
	tGEFcqcyJVsNWxXn07/9K14LZLE63vx+4hxXng4uTn5ia99pJ9NSzcOk0mA4aNuQ28EQoHA19U9
	CUJ4XAMxFCgCh1mtyZtfJEyautXzQpoIOgP0S318t7MMghDrWRspGInGqMani1iOHcYjSc1kqCw
	6V/xAVJNmyEC7f0j90D+Dpe6g==
X-Received: by 2002:a05:600c:a403:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-4926689fab5mr175303385e9.25.1782666420234;
        Sun, 28 Jun 2026 10:07:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a7fd1b0fsm54217195e9.1.2026.06.28.10.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 10:06:59 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 0/4] arm64: dts: am62p5-var-som-symphony: align DTS with hardware revision
Date: Sun, 28 Jun 2026 19:06:45 +0200
Message-ID: <cover.1782665899.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the device tree description for the Variscite
VAR-SOM-AM62P and Symphony carrier board to better reflect the current
board configuration.

It aligns the Ethernet PHY description, updates the audio codec
configuration, and adds the touchscreen and TPM devices together with
their required board-level resources.

Stefano Radaelli (4):
  arm64: dts: ti: var-som-am62p: fix Ethernet PHY configuration
  arm64: dts: ti: var-som-am62p: update audio codec configuration
  arm64: dts: am62p5-var-som-symphony: add touchscreen support
  arm64: dts: am62p5-var-som-symphony: add TPM support

 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 43 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 38 ++++++++++++++--
 2 files changed, 77 insertions(+), 4 deletions(-)


base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
-- 
2.47.3

