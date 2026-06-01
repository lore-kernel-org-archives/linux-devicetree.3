Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4B6344DBD;
	Mon,  1 Jun 2026 23:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355201; cv=none; b=jT0lH6pEkJ32B/NBVooM9sd0VguDc7s1Sg1eOeMIns0dQwV8XIFkPQ1t2JDuhUcIqHwjAEMjhfiDz2ilMuaAdMOKPyIDIwv2mHs3Rke1nIO7pBREKzaVAApgMZMkv8H9besISxZfTq0cTNbU9qT0zj/MZXruxLejL/OzE1zBvrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355201; c=relaxed/simple;
	bh=F8YTtz/I7qlJdKNeHgBgAlnkSKSiLGNHUK9K4wlzNnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aihl0cqpTeikwY4+mWzCdpNbuRom6syTXK5ApsR5el9MOSfSCSWXC1PzcpmG8b4eLlRXvOOP7ETsOIyJ/Zw8QQy9ywwGXgrWeJs2lO78UpJo5LM6shIlmhiZgjJNE9sfS4/5D7a/rzzcrB4Z4MIVeicHAKYAi7PQBQHhn/VOhMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZaggX0EN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZaggX0EN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76A81F00893;
	Mon,  1 Jun 2026 23:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780355200;
	bh=i1Iq/t7YJ3lzwEzZSDZNa3Rv0CFkmzQDeIArbCfLbks=;
	h=Date:From:To:Cc:Subject;
	b=ZaggX0ENXZ/NpWeqheKbjjq2533fbiCDgwuO/RZLYpUcvYdkGvAtm8kHPLdNVNDHt
	 M8bhgZ9I9G2az1quJHDfgku1K7qxAFZSWodmteMB1BoAJfX1VQobDaLK/W8/HnNiNN
	 ioR4XXRs7TZoCUa75ASKMWYGKExcq7ruPqVPa1DwFWmMdHLXYWdw4BcKh9SL9wALqo
	 BE1ImbY2tn8ljHsYP4r3+surVR2hfTnlnupB41iE1Kx9/JWMsjWGPDUdeixyxW0LBZ
	 psvHmcS7VZblM9IKvPSp7q3eUnq8rvOUKeQUKppvrUHuUjMA+60+lOKBK7RrgDp5tT
	 CBi4c5I308Mhg==
Date: Mon, 1 Jun 2026 16:06:38 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Joel Stanley <joel@jms.id.au>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Nicholas Piggin <npiggin@oss.tenstorrent.com>,
	Michael Neuling <mikey@neuling.org>,
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Paul Walmsley <pjw@kernel.org>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Tenstorrent devicetree changes for v7.2
Message-ID: <ah4Qfro/wUyhByF8@x1>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git tags/tenstorrent-dt-for-v7.2

for you to fetch changes up to 33583baeb1ba7d328e6a9775d889036900b74cdb:

  dt-bindings: iommu: riscv: Add bindings for Tenstorrent RISC-V IOMMU (2026-05-23 17:14:35 -0700)

----------------------------------------------------------------
Tenstorrent device tree for v7.2

Add a riscv,pmu node to the Tenstorrent Blackhole SoC device tree. This
enables OpenSBI to expose the SBI PMU extension, allowing Linux perf to
use the 4 programmable counters (mhpmcounter3-6) across 3 event classes:
instruction commit, microarchitectural, and memory system events.

Extend the RISC-V IOMMU device tree bindings to document the Tenstorrent
IOMMU used in the Tenstorrent Atlantis SoC. A second register range is
added which contains M-mode only registers like PMAs and PMPs. The
binding will be used by OpenSBI and potentially other M-mode software.

----------------------------------------------------------------
Michael Neuling (1):
      riscv: dts: tenstorrent: Add PMU node to blackhole for Linux perf support

Nicholas Piggin (1):
      dt-bindings: iommu: riscv: Add bindings for Tenstorrent RISC-V IOMMU

 .../devicetree/bindings/iommu/riscv,iommu.yaml     | 59 +++++++++++++++++++---
 arch/riscv/boot/dts/tenstorrent/blackhole.dtsi     | 48 ++++++++++++++++++
 2 files changed, 99 insertions(+), 8 deletions(-)
