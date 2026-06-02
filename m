Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABC4306764;
	Tue,  2 Jun 2026 00:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780360596; cv=none; b=Nb6p4SUYaJ7aU3obB/IVYar7SCXSfde4pgrWy3rvjKYhqFWuyHvKyS6Bfp8t3TU7ant3Y4pEGm3Gh7qXLHE+ibQ8cs3XUpVIZbyE7a4CYcRV8WxhFQ5TTAXBUHpRcnfc6VxRVzJvXHlsiiF8OVk7fViPyM71HcFhyYwamozDdSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780360596; c=relaxed/simple;
	bh=c3UzNSSEFZjzg5paLkc2P+kYdgRXHIZrUe15p0HN/vU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5M+uXUU2TPHXUkDIqVhuiHVjN+D0F7HwyAb85mDQRZPt8ckZE2WuivEnzCsm9sP0dkrKX1EHMWWDv2gQUDcvFsVgtXZhW+8Ax0fSwsZtz7Af9P7Lu+w/W11mXsMU5zdEvGwOKVyqS8E+Vfd+aKiE7e0Qdksz8ZTWZWRwH+3f7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSqJrRZF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSqJrRZF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D0C1F00893;
	Tue,  2 Jun 2026 00:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780360595;
	bh=y/dxwY1WEpokhgJ5nQvecX7jCg2OKT5h+ULfFFtw4ik=;
	h=Date:From:To:Cc:Subject;
	b=XSqJrRZFQ/lNGszqIDOMOixI2WwSTbcm41JHgyLifD/Vya7Yp+5wPVG3yZx4Dd0D7
	 zufZFqc4R/rIFT2AmPjqXBsj4AVAinOA5DVgzTnzfttuXAgR+Pl3spCMKkSPiTDeFo
	 nFv7eldwT+0qsNkSc4c4VBiz4tx9SN1XyBPWb2PeXm62KJYfXcDPBXIB7ZnnCs9I7M
	 x+MXNKCvlNe7EiwMJJlyF6+/fX9CuL+KQ1FYGZ74kXoac1VxxsT8jLDLd/eGDM+ieq
	 Q0PcgoO7bN1gRwFI7vEwQZ7hwmlBSAf+NQ6hTAOWv7SIvxfEzTMKqZJrophHqYHcKk
	 Ph0oLOY9uxBig==
Date: Mon, 1 Jun 2026 17:36:33 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	MoeLeak <i@leak.moe>,
	Thomas Gerner <thomas.gerner@muenchen-mail.de>
Subject: [GIT PULL] RISC-V T-HEAD devicetree changes for v7.2
Message-ID: <ah4lkWh2eD6l7W7n@x1>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v7.2

for you to fetch changes up to 3a5791956edbfa84d7256224167941931cbc46e7:

  riscv: dts: thead: Enable wifi on the BeagleV-Ahead (2026-05-25 01:36:56 -0700)

----------------------------------------------------------------
T-HEAD Devicetrees for 7.2

Enable wifi on two TH1520 boards: BeagleV Ahead and Lichee Pi 4a.

The BeagleV Ahead board uses an AP6203BM WiFi module connected to SDIO1.
The Lichee Pi 4A has an RTL8723DS WiFi module also connected to SDIO1.
The module reset line is driven through a PCA9557 GPIO expander on the
I2C1 bus.

----------------------------------------------------------------
MoeLeak (2):
      riscv: dts: thead: Add TH1520 I2C1 controller
      riscv: dts: thead: Enable WiFi on Lichee Pi 4A

Thomas Gerner (1):
      riscv: dts: thead: Enable wifi on the BeagleV-Ahead

 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 48 ++++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  | 47 +++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 11 +++++
 3 files changed, 106 insertions(+)
