Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD3B3B6BE4;
	Mon, 27 Apr 2026 12:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292623; cv=none; b=TjmGN6+FyhJfP3XPKy69u6ayNHh5ET1IX2xOuIczO5gt5svH7iuvFCG3P1fJE+ah6juUC08WIr26CFiXkzXY4gHEr3Rq9OyoTDx4mN+Z/7HtT4DfBhvrTD9s1t3weDVAuWn6CEFuqxhxjMM2MSxATCaDcL33jPnh79bR5f2hKsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292623; c=relaxed/simple;
	bh=knmh3yY+I/ih9eGk7DS8BGnjt57mgXG1uGiFPY7N51M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oy6i13utw7TB9rsn8nSi3lRMApiOdaueeRokfgvEE/yar4BpoiVtCl8oVCumCpA65KblqF6Qq7fxml+XO+zZfZ6cvw5wd2suqqArdmBexDJ51AwiZClMkmryBro+UX2HoNbboRpB5QdREq6P4bnaYuwFbcgr2qaBoYj3o0xIpoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=wgaVrAQr; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="wgaVrAQr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=sHPMBhXxp+6B9raEClgP4b7fTnQR4Zw3lXf5NCEnyIo=; b=wgaVrAQrH8VPCzvKDJo4DzshHu
	qkAyTfXB/yMJi9kt3mYX0z2VjWxxlYCtTJxj0McUmAqDVzlhXu7Qp6GN8v/In3DF2sR9A9WgKxwlA
	pqaG3A1qpg256pAuEoQXXxqAVZo7CttBb0OnM5R4uLcG8hqGt5lEi/+yN/3v2V3tDETvf5TNHgogx
	GndMKNt5qL+DtkBxNkvNvUc8OMghQDAvW+28PljPoJacwsXpk4xablegJ5nPQUT+gqZiisz0h0jcf
	Xoum0h8DF7yDgqV3pMOL+DKBEheWsi+2zy+p0zVdoRIJZIwdo9viA4zwA2dU14+gdSC3SiN7kQqkP
	C2VIyYBw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <diederik@cknow-tech.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Improve gmac0 DT config for NanoPi R5S
Date: Mon, 27 Apr 2026 14:23:17 +0200
Message-ID: <177729258226.1866089.4215675452095780346.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401131551.734456-1-diederik@cknow-tech.com>
References: <20260401131551.734456-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 01 Apr 2026 15:11:37 +0200, Diederik de Haas wrote:
> These 2 patches contain a fix for an incorrect pinctlr definition and
> replaces several deprecated snps,reset* properties with their
> non-deprecated replacements.
> 
> Diederik de Haas (2):
>   arm64: dts: rockchip: Fix gmac0 reset pin for NanoPi R5S
>   arm64: dts: rockchip: Replace deprecated snps,* props for NanoPi R5S
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Fix gmac0 reset pin for NanoPi R5S
      commit: c83c4a09d4c01c91d6c52d6d4d77a06892a3e83b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
