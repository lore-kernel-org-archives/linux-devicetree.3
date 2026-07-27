Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A04D3C4562;
	Mon, 27 Jul 2026 23:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785194559; cv=none; b=onbphxtoIBQrOq+txMfqdXdgxNaF+DImfJpT5n4JrnN59fbTkBoy+fxfGaXPNW8CgLq6yu5HckM32a4XfVOuLKj1orscUwXvgobYwdZ3GpCuwX4iVHIXn3A/KVVmkE9CRqYL26v1JhkX04njykX7JbG0LWtA8buVj7BffLVwWN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785194559; c=relaxed/simple;
	bh=GkvysQoi7lAGbiNcz1xE4ExI0Rzu2/hM0vGrEmC6/8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jhy1L5RWW9YoPPt8eFFYR4s5FWLaKQ0WyvaJPU6UcgHVM5fwwQ9Y5QBS92km6l9dx7oZDnPrYrjEsCim5SQAQCcztY8rJEZs4sKnTaLfSEBN0wtzbTYR9RR0XWAohl3bUt35xrXJnYZRdQCY5+WXtZdvfZO2nPhz6Gxt1ZxHsSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTx9qPTT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTx9qPTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBCA1F000E9;
	Mon, 27 Jul 2026 23:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785194558;
	bh=CpSwG5Ys9tkgTGeHbMtpzIYROuVRaYNK2EhvdQM5134=;
	h=Date:From:To:Cc:Subject;
	b=WTx9qPTT/ELd7WXtd8K0yP1Q+3b0YJL3RZsSW1IrpPi+LFd43DEFEtXC8uvOdN+BV
	 qtciR0uxYEk99zliLwJMu94YInfkzfl410YFRFCqJcb7azM2Tvj/0ulUeUf3f4TwDp
	 oWtWMzrkx2t8u8Ksl7GLtdBEq+haXc0ZT+wmpbbs/PqVr2trbJj12Bj1I2RC7ARJfp
	 6oQGgHb5QQ8S0bkzoYiBywP4LiKQhr/VMU/F3H7dn2C1cBDf01hpsKt3UyqWgzNt/3
	 NM/ljAQzGuKGqLqDuVMNSaqfo5FU/zMOyJ75DuhCGoQbR0zCemczjQlOYx1jubZxgo
	 A2WYvdB3yhlzg==
Date: Mon, 27 Jul 2026 16:22:36 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V T-HEAD devicetree changes for v7.3
Message-ID: <amfoPMED/cB4zinU@x1>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v7.3

for you to fetch changes up to 15d32aaf6300b832814a9930fdbd20efdbc9adcf:

  riscv: dts: thead: Add remaining Lichee Pi 4A IO expansions (2026-07-22 16:09:00 -0700)

----------------------------------------------------------------
T-HEAD device tree changes for v7.3

There is just one set of changes that adds the remaining IO expansion
chips on the TH1520-based LicheePi 4a board.

----------------------------------------------------------------
Emil Renner Berthing (2):
      riscv: dts: thead: Add IO labels for the IO expansion on I2C1
      riscv: dts: thead: Add remaining Lichee Pi 4A IO expansions

Icenowy Zheng (2):
      riscv: dts: thead: th1520: remove pclk for I2C1
      riscv: dts: thead: lpi4a: sort nodes

Thomas Bonnefille (1):
      riscv: dts: thead: Add TH1520 I2C nodes

 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 141 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------
 arch/riscv/boot/dts/thead/th1520.dtsi             |  53 +++++++++++++++++++++++++++++--
 2 files changed, 157 insertions(+), 37 deletions(-)
