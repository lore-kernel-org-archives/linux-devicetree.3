Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B9530BB8D;
	Mon, 27 Apr 2026 12:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292623; cv=none; b=jZOogLDTcmpITGVgq29JoFcIG/qFGhZiHb+TqosFTLoOAd2LrzzFLtZ6scSv1nsvclTygvjMpbqSNZXN08by+WXsa7c3/WMfdSaldyL5N3dXUoawt41t3Y6KTr4NCdcqJunvcm8izdKFPrLL9Ytd9gd3WEgnqxjGwsIK+Wdz/EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292623; c=relaxed/simple;
	bh=X/OHKLK9kDo/eEf4j/GSgk+opKRo5Mk112zuvIQPfEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QSplwmMEjN51cNmH340I/pFMpc6xP1rWi83T2gkCDfkAk13LLNyM+PnM49uzBFJTBd0CwBg9+YIRqpHcphy3KL2ACYWMMNJKl4hjHB9jkbDlhohW8QzyB6DjlPptp/JMXh3LOoSjJUDFE5CDmYVV6A+uPECv2hD9akhr58LWDrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=JAHewWSn; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="JAHewWSn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vw3V9ZfPq6PThxSOCtgguaFkBodfELaZ7LQ1o0ghpf4=; b=JAHewWSnuM8OEin60mkfTLpvD6
	lgvibbXzHX+q7+T4sZhEHzbGqknD9ub5a0tJprTGpO0pEJu3U0EDT4M05W4p3ivmtfzwbP1YHXwF0
	BzweoJObppg7hBaoLKFBvAX1QCNYHAuLifbpGKzVRCqEtlOeX6khofvE9IOK4GjhwgBIrt7tgtOM+
	uRIpL89sy0mtyWxNzI1MgSDeSchYtxExm0Ycwki+tbvtA28nb4QzAAob7p3C1Zpl85GQtwxfpLWY4
	NtCnnIaJPdFqDfK7KIyRAVzgvquk9D4hfRvjQ4VZ4o7F6rk7CIVv9Na0QMUCxRJvKpQS/PYv7yL+1
	aApPzHIQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sten-Silver Ots <stensilver@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Torsten Duwe <duwe@lst.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable the NPU on rk3588-rock-5-itx
Date: Mon, 27 Apr 2026 14:23:24 +0200
Message-ID: <177729258231.1866089.18432864978582477876.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260413215301.4656-1-stensilver@gmail.com>
References: <20260413215301.4656-1-stensilver@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Apr 2026 00:52:49 +0300, Sten-Silver Ots wrote:
> This commit enables the NPU on Radxa Rock 5 ITX board.
> The regulator vdd_npu_s0 was already in place and since the NPUs
> power domain supply is now described remove the always-on property
> from the regulator.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable the NPU on rk3588-rock-5-itx
      commit: e4f7054e819eece6fd83072ff2dcefc7a36224c0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
