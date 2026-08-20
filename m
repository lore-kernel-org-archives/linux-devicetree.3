Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774DE1A262D;
	Thu, 20 Aug 2026 07:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210743; cv=none; b=dEFX0Zc2DsBxbTT28jON8wzCFNJTPemXz4Z2xswSGblusXfbUzTkGXb+qhliE7QLtdh/YTdaMuoFaZfVcsZr9QYW/Kn0CnXit6gLk5hMbmTreXtSkQDCPGUp1P/V0Cp33R0Y6i8kxtdE3pDeGKfoEzVmpmx/tDaGHKjGFojbI4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210743; c=relaxed/simple;
	bh=1Cj2Vcgqn5krhfvBamvQXC8qXV3Ha/g6efKHf4VCBXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5qlXfWK4buLsxImBkiJt11ya41C6gu/b3Sc0qWQIRCVOQAzk126wZkJAFx23LW2obH68rmZbNN2BMQRgvW2h8CxBzGNA9SwDdX8W8AgBhdxrxObHrEU5whRw9uB3jb33IvJmYFswjAcbnYJpzQdXAWgxpN8QTb3V17agpZSMS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8g8lb6N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8g8lb6N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E750A1F00A3A;
	Thu, 20 Aug 2026 07:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787210742;
	bh=0RrODx3V1Px/U/AojeH5jmVTwASzYYtIbWBrlSirhEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A8g8lb6NMK3qMUbPsHmj3OZgI+IecMWiyT7M+csIZQ50OySFgpqMSptFxiC3hhSxc
	 p5e1zKBhe3arBFSnS6gm1Qa7uPkGALrG6QKlpRptu5t4/ixp+3Ld29ou+UOirvferl
	 jFzsQRIIZ09OUBcpKkS/XinDPnINzc+iFt72OlkBH2VTgNYihHLZiOFii6yHek9hhj
	 5eWWf6dD1F2jkMV5uj66QH8b2hhxdaCPfNu6kV3IkmPXK2s9lv5MhiFMQ9tdx2kppl
	 msFOh3/ASo48YOIHd/UCewTKQtqstshEIJ/0xNHKXrnGa/TVVmtXwN+8yEVZmdR2c/
	 K9QNC2Fib7M1A==
Date: Thu, 20 Aug 2026 09:25:32 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] phy: qcom: qmp-pcie: Add qref and refgen
 regulator vote for QCS8300 and SA8775p PHY
Message-ID: <oxnts55ylqdejsawsz42m4fc5ajh3jaypu3hkpdld5jmdyjjoa@iigp3bxas2qd>
References: <20260810112735.1326807-1-ziyue.zhang@oss.qualcomm.com>
 <20260810112735.1326807-3-ziyue.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810112735.1326807-3-ziyue.zhang@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 07:27:33PM +0800, Ziyue Zhang wrote:
> Add a new sa8775p_qmp_phy_vreg_l that includes vdda-phy, vdda-pll,
> vdda-qref, vdda-refgen and refgen supplies, and use it for QCS8300
> and SA8775p PCIe PHY configurations. This avoids modifying
> sm8550_qmp_phy_vreg_l and breaking SM8550 and SM8650.
> 

Can you add a small note on why you are now voting for these supplies, what
issue you encountered? In a nutshell, you need to explain why this change is
submitted now.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
