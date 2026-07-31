Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C073F21A434;
	Fri, 31 Jul 2026 05:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785475682; cv=none; b=VkGYXkJysqvJWBe38R1gbhJq8QgcgObxpP0w+feF6ktoWFUr91/HqId8p6yUlnFjLGg3GSu4gvxrqfYq6owIc2VbbDrS8XOQPqcOSec8NtRjs0+MZCpTqkweY2pKDqVCFSvxnqRcFKxhjkGREQPp83jw/PGjZXyD7jQ2MUVbuQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785475682; c=relaxed/simple;
	bh=KWi1K41crDNTERkYDcudfvrmGdeO/82qinPAMRrsdHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3mGqYkv2L6yizlpHwe6Ia1ZfKkXRuTEaDasfgCj00Z7YL3rNRZioU2TFn8nPSiH3z/il3s1hd3TGdCWzMcNSvm4Uu0fD6XrWaOSEFflM3SYX+eO/wOlA8XztHrmBTPcUTOtL6xVc/IwC9RRbG+H78Cn+9a2UQn3AJZxdofLD2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJzeJ7W3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJzeJ7W3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBA71F000E9;
	Fri, 31 Jul 2026 05:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785475681;
	bh=RWteTQyx9kct0DSpGm+L3leDy8X2DHVDiMmA7czI59o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MJzeJ7W3RScyt5gRZQJTWCq+Tfl9AdBNSOwuDc/vJsMiThtBMFz2tr3Q8W8CEi9y6
	 DemjszdJyG/SCOPLZuPe3RxfcZeB2vbyrips38r9M3kTVyrRFbt+29nz0D9RMiw5Fi
	 lmT34z41HIRki1f/vjgOqpDYCJyYXE86pWYTgi2BrVXufM3SoIfJeMESMxiNVpI7GN
	 gY/wQ+Qdq9PEOucNNEiW1c6R2L/vYVwyNRnOu9+ZDQlt7nuRWBtp6Wwg1QofEnCZ69
	 GinUF94rgna8urRH42hw5i3gJYQA7sDtFjfMkBQ54Xy8aJY+54ZDCMi2XsWLLG7/iY
	 WjLh2s8nXSCeQ==
Date: Fri, 31 Jul 2026 07:27:53 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies
 for pcie3_phy
Message-ID: <ax262nrs5rnnrmt3dtemfaqk47th5z5j524ayi4dktacgwzzac@yik7hriuti6s>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
 <20260730-glymur_linkmode_0731-v8-4-a455265ad8bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730-glymur_linkmode_0731-v8-4-a455265ad8bf@oss.qualcomm.com>

On Thu, Jul 30, 2026 at 10:13:53PM -0700, Qiang Yu wrote:
> CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
> board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
> vdda-refgen0p9/1p2 supplies for &pcie3_phy.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
