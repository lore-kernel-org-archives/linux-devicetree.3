Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10FE384CEA;
	Thu,  2 Jul 2026 19:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019111; cv=none; b=bhIlNEh3Nwq0p84/X9riXffepPFbSwNksd8C4etl+aP1GzFpwOBdSK0gN554H3sjQTJ9YNS1brBK0rGAQx8ieZqmQuMUbe0RuO27vGiccoXvdc1HuYVI8S1BCBpkXHCQLsg3gSnqFMc7e9vHhGlVo/gSgNyYQ7h+WrlCfIZYrNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019111; c=relaxed/simple;
	bh=qToBr4ug+3EbYfVYf1VS60e8ezaenLxAN8QUDNbeoV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cafjc2355jXAcpeGBS4RB6c48tUUi7CMjpPQJKHyji72WQJGnMGyT+KTfYWG9lpG6/CzreGr8qWX8Hn2IZobRLkD5iLwCBPCamzcXFlpMaijlAE8WzyP8Tkw+ABtQ+1TGdhKc5hW1aVBL0kqSBDLW7xgk5eKVaWu2qE3FsGnyWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=tzVMbT8l; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="tzVMbT8l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+Oq1SCAGAkg/fhNyb4Dij2RBKiVngEznFtGkk+Zdb+s=; b=tzVMbT8lbygAzCdhc8BqUypZKW
	yg5nCOEQKKL/33FmiKBzgAXdOW69t7yuWKEAeZuvOQxGhc4h0t8KtVW6L8xoAy00o0/gs1rSUEu4g
	sXuSZOMRd82BzkcYMUqJfi62TLAR9HA3bCtl9Fsvh5uwHBifwuUVIqu+xIUPMxTuXGz/wM7wZRJvU
	kB7TNA8sgRO2KkKf4m4reC97uQJf9O2qMb+0Y2g1JsDWJWYd7aF2fvqavcGvNmq/+gipt39Fdfzih
	8OiCRoIV2EILJapHv+K0LFkNh6jUniCQzxcsTagsPzzf00wFRYSUh2eAYsM9YAvvzmrXEaO6tG7ta
	MNWYj1kA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Add HINLINK H28K
Date: Thu,  2 Jul 2026 21:04:49 +0200
Message-ID: <178301901910.3838694.10638773555392224178.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610100006.366963-1-amadeus@jmu.edu.cn>
References: <20260610100006.366963-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 10 Jun 2026 18:00:04 +0800, Chukun Pan wrote:
> The HINLINK H28K is a dual-gigabit SBC based on the RK3528 SoC.
> 
> There is a version that SeeedStudio distributes called LinkStar-H28K.
> It's no different from the HINLINK H28K. The schematic can be found here:
> 
> https://www.hinlink.cn/wp-content/uploads/2024/03/20240428015024130824.pdf
> https://files.seeedstudio.com/wiki/H28K/Open_source/H28K-SCH.zip
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add HINLINK H28K
      commit: dce1f5a78a4f645ec3fae9b45b1453b989d3fc69
[2/2] arm64: dts: rockchip: Add HINLINK H28K
      commit: 145d4af4b204e1fb565a498c6c8f801525cc0a4e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
