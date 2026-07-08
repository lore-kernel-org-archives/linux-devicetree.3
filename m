Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D467641CB51;
	Wed,  8 Jul 2026 14:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522666; cv=none; b=Fy9i3i5To5GW4yWaB2e+43dZOH83r+zxRYHtSlt2A76ONKjpWpVdzRchEMF4FeG02SumQXwfMeI3htxDVKdJMBCjbAjsTu0RYpQVf9KC8brp3XvhArtIFiCf2asvfDUmSYzWDzMBRI3k/AFqTs3kn0NC3kdhrWhbaFVJ0gPO+Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522666; c=relaxed/simple;
	bh=EbhH+Uz/+5IziXxDDvUpyvdEQvKN/MzeDjRgcTx4OE8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RPZR0xlPRvP9hCJJF/038XRcwwMIV0Uf9lVNtV6bsDatascV8todM/31Xepbdaza+0bNT7+njGpHTavxN6Zck19hZhiXQgmIPqzgtVzJH67tYlh+vOaiZHWefrFeGrHggDsWfngTj+t+CABV6Ss3vFVwUFDUiQd1uEMedPbH29s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvBOVfdq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvBOVfdq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DD91F00A3D;
	Wed,  8 Jul 2026 14:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522664;
	bh=Mrk5N+xGMgJl2efkFQdwxtBddmsSxaLRpPS0k4o/tYs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=EvBOVfdq2nXLDa+82zlZVvI9amqVXAN9kMCBDuyUAuDstzcgtQMyaV3EdWm5xkHqu
	 +IIwc6V5YAkgKXEip98VQ0HOwNt2cHqLi0K0imZtFMGlmUvk3jZB8fM5GwOtw3sPTT
	 Xdf100c909kcNxlltN5iRn1iFC36TaqY0Urz8SlKTMeWriaRAwMbxVcz0YfmsfeLZW
	 cd8B6NICti4lghbUowS9PaqxeBumprURawJDCTD2iogqdATtt37LgDw1w1hTBXek6P
	 hT6tZELWhtMK7o6Z9tbJc/KFagJIvdKGfwjVfaFPbAB4xGDr9fG0yivThr4reQZW/Q
	 v2tqWRji29SqQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm670-google: add lpi reserved gpios
Date: Wed,  8 Jul 2026 09:56:45 -0500
Message-ID: <178352261610.2235436.12501139853646973897.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602021722.30760-1-mailingradian@gmail.com>
References: <20260602021722.30760-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 01 Jun 2026 22:17:22 -0400, Richard Acayan wrote:
> Add reserved GPIOs for the Pixel 3a, which blocks access to the sensor
> GPIOs. The hunk in the original patch was dropped in the commit because
> it depended on an unapplied patch, which is now commit fe9f4a46895d
> ("arm64: dts: qcom: sdm670-google: add common device tree include").
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm670-google: add lpi reserved gpios
      commit: 71dd62dac8e2d03f952587f8985a859fce422815

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
