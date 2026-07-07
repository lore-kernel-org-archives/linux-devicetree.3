Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D04346E43;
	Tue,  7 Jul 2026 03:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394515; cv=none; b=kcHAfFniYesG0l5B6ddF5blyFW94FH/7SWHPUFb6VwGBCJx/yUS/W//Grwiu69Fg4Yhlcdq3uh+o0QeP2ro0LHVA/4MiFoexNbBCwezqx+E1FuVy1W+bIMHFNcLmQ4oYZ7X5QUFlpa7mo9eFs2tMlWBxmzlm3gm3GrgSdaRH0Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394515; c=relaxed/simple;
	bh=Vhe9j4OfzbLYR5+UWVrsBoiadw9zNAX1qU1dlxvAxSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n9HtLgrifaTMqeqqtBcqDoSVUbakADhPyHhl6DtesxJHVqeu/LStWgkznX/1J5N9SnRIpQXx5Ol6DZ8blNeiiNy+X9NaawWxiC1hCiq8OUgL41J5Nr/flqA2ut7+zIp6AfGDedetu4NqAoDpIIdRQhfqt5lm2kyEqF29qcTe2tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aag19dzz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aag19dzz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E531F00A3A;
	Tue,  7 Jul 2026 03:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394512;
	bh=F1ExEZWoSqCi2LJiFy2bO54NQ9JwjdHq7fzZfVPzYJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aag19dzz+sQBsmYNHzi6R05JuXwuYR/wdYPjx3u6SzTA/hMfmD97jc2fn3REEOdJj
	 rTgY2hwrup+GTFhXM3QkD4FpdDQPtTvBgi1NyZTRbsp2guH1F7hm1z37CBrLYSjHM9
	 1yDN7Pq6W1dD+NInJ214oXwyiq2az1AklAwYSTJrdjFCIt5lUHhdMRzRolfLfs1voe
	 vSjJ22pSD4wsPy61iFIq7hfH40R55lz7XopMPwCNb1E3MKgkU4xEiyLaR4cNM3QRJN
	 Tzpn9absl6xemSXZBS13DKCDta/sIOONBkKmm6ecnTH5iKik88NG6MkfljAUs2Z02q
	 nxpOorPvu7Pmw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Fix clocks for HSPHYs
Date: Mon,  6 Jul 2026 22:21:27 -0500
Message-ID: <178339449938.1938770.8541746827454941690.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518-topic-hamoa_hsphy_clk-v1-1-d85203756505@oss.qualcomm.com>
References: <20260518-topic-hamoa_hsphy_clk-v1-1-d85203756505@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 18 May 2026 11:54:39 +0200, Konrad Dybcio wrote:
> The tertiary controller's HSPHY has its own toggle in TCSR, while the
> primary one is wired directly to the XO clock. Fix that.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa: Fix clocks for HSPHYs
      commit: 115894bc201b0cd1799d239875a1b40924f0ef7b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
