Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7201118EB0;
	Sun, 29 Mar 2026 18:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774809853; cv=none; b=P5CzrQ4DzHIicP9Uqy9YjVm1PwDRhLdPc33YevMuy/X/1ghtDSth1XQhoUx2DiTHASWRckRicfXSO20AEDRO87pSkbS3A7Ggk8kdEVKBNlO+ZFNB2Tcr/5x7fyMI/D2XaHiUU3uVuPHo9lFS7yaXSxTYn7L/GdbgmScsT9jeVz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774809853; c=relaxed/simple;
	bh=A7qxJ2hT4DkPy0kLPUOXaYDP7gwmFTJJDSrdzgfZeyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XKGuHjcOU+TJVqiCKPOAnBKx4E4qU39OKwn3wKlXuQayqZ+rmaqC8T9sOgEBoj9YJux+HAruHFNyXAwtJ5uSL18vkthL6RRHx8i4DqQSPdDW48rBN70nkO8XZ0PPn5AWDR/ERfVDJuZXHkbgW7HadbTUM/JICnePqr3O00TnLWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feSHdLXJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feSHdLXJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC58C116C6;
	Sun, 29 Mar 2026 18:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774809853;
	bh=A7qxJ2hT4DkPy0kLPUOXaYDP7gwmFTJJDSrdzgfZeyk=;
	h=Date:From:To:Cc:Subject:From;
	b=feSHdLXJmSuhFm+2gPkUoqmuFqZtEtZ1cNs7DGLRhBd1YyVq4T0cNPgxLbAxAq42m
	 0fVU1pV9Ulm0vScwTDZkBaqBeaEi3MRKkSCTOKJaS4vPw/3aO8czPOl7gcYH6dN1VL
	 rwRlAThjWqOR55xMvbriGpRB5gZnxT6M5apDM37QnhSS8rJh1v17D51CKBvvUsYF6H
	 S7kNrxThZD5gmUvGskhqHPk1t85eXZKajNDxdvb57OMn1QfC1FtfxiuvErYj0Y/J+T
	 D6ahhsTSAA0VDVUNfLycUzT3Jp+bUFPBU3SzeM7LbJDfi99qsgCDQCqoJjAwv4I0qN
	 RpjZIQXv799lw==
Date: Sun, 29 Mar 2026 11:44:11 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: devicetree@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Jisheng Zhang <jszhang@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Fu Wei <wefu@redhat.com>,
	Robert Mazur <robert.mazur@imgtec.com>
Subject: [GIT PULL] RISC-V T-HEAD Devicetrees for v7.1, part 2
Message-ID: <acly+68IaK1lWE2p@x1>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Two minor improvements that weren't ready when I sent the originall pull
request. They have now been tested in next. No problem if it is too late
for this cycle.

Thanks,
Drew

The following changes since commit 9c99a784d9117a192ebf779d4f72ebec435ada97:

  riscv: dts: thead: lichee-pi-4a: enable HDMI (2026-03-14 09:19:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v7.1-p2

for you to fetch changes up to 74ec3d52c0035b662ec295bef2bbffad68446391:

  riscv: dts: thead: beaglev-ahead: enable HDMI output (2026-03-25 09:20:38 -0700)

----------------------------------------------------------------
T-HEAD Devicetrees for 7.1, part 2

Additional updates to T-Head device trees for v7.1:

 - Enable the display pipeline for the TH1520-based BeagleV Ahead board
   by adding the HDMI connector node, connecting it to the HDMI
   controller, and activating the DPU and HDMI nodes.

 - Add coefficients to the TH1520 PVT node as the values in the TH1520
   manual differ from the defaults in the driver.

----------------------------------------------------------------
Icenowy Zheng (1):
      riscv: dts: thead: th1520: add coefficients to the PVT node

Robert Mazur (1):
      riscv: dts: thead: beaglev-ahead: enable HDMI output

 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 25 ++++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  4 ++++
 2 files changed, 29 insertions(+)
