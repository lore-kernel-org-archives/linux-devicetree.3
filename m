Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F6D3F5BE6
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 21:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419966; cv=none; b=dm+ALpW7NhGEPRCe6S9pAehdxNHbG7DDgBLQukOQOUDW5v8egzmT0Hp8KZUUlKa+HLiFgoIvs9wxMGICLUE7k1X9DPnQ8X1P+UPgrq0JhROuT2bFhXJjPJIaE33+WD2qglejelm6fdKmMBs1koje/DpyJw3lrjsfT4w59Z5Dqcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419966; c=relaxed/simple;
	bh=8Hpqna4Yql4B2KSm3n4ept+rS89EMGziH5WyeFW7i5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZPEVTiisf5HJ9l9fbadmPSA4dPBRV2JcuUfzxTUT3MOCAtaBBAlo22jxuFIB+X/uFDFp6L+SpmlxiyYgGOxCoDgVOD1yakK742uqmJwybT9rOGQeokd19EbbLQu6b3BbVzKYHm1igHUJJdqglFuOmUcGSJIGguNNazz3+oJWUM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WGgDhAYf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WGgDhAYf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F073E1570;
	Mon, 14 Sep 2026 14:05:56 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A725D3F882;
	Mon, 14 Sep 2026 14:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789419960; bh=8Hpqna4Yql4B2KSm3n4ept+rS89EMGziH5WyeFW7i5E=;
	h=From:To:Cc:Subject:Date:From;
	b=WGgDhAYfNXwFRuaOJ+oVAAC+STmpKW9AObcf50+DOL658q0o9xZlltQ8haUAj5Jgq
	 /TAfrNRJiuj4FgJf3giAg3B02pWEuGt1XdbADVS2nOYXo9ndLoBe+MIhkDcaQOhWA3
	 M6w0VtZgaJhL+8OdzrjZKWlyKbQIujX2WlMAjRWo=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] dts: allwinner: Add Teclast P80 tablet support
Date: Mon, 14 Sep 2026 23:01:12 +0200
Message-ID: <20260914210115.28151-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Teclast P80 tablet is an entry-level tablet with an 8inch screen
and an Allwinner A133 quad-A53 SoC. There are other tablets using
the P80 name, this here is about the "G4" version from 2020.

Contains the typical triad of DT support patches: vendor prefix, machine
compatible binding, board .dts file.

Please have a look!

Cheers,
Andre

Andre Przywara (3):
  dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
  dt-bindings: arm: sunxi: Add two Teclast tablets
  arm64: dts: allwinner: A133: add basic support for Teclast P80 tablet

 .../devicetree/bindings/arm/sunxi.yaml        |  10 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-a133-teclast-p80.dts | 205 ++++++++++++++++++
 4 files changed, 218 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.46.4

