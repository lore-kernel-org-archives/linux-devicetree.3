Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AF3357D0F;
	Fri, 31 Jul 2026 05:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785475651; cv=none; b=k2YbuTzrWkkqaHe0Qj3yIPx1U0RNfMgh3ieLsUk5khaW+qokKEmW2DnsoELClnrmTfBHCBhvjSuWCqzEUnKYZXhzqDD+mB9b+WIRpaGbxoNGw66X+lsnsAK8iT0qAT2xLk1fDcH70nugTtTjvGpsKZW08e3EuM7ur9qMvJD2a0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785475651; c=relaxed/simple;
	bh=hX1a+sXJOKLarJ5rIrdEQRQtpwzhWhyHHfF/yllNWnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eaUeFTBuczJJBsWgKzQCT+FWVquK3RAZYg/PPt9s+rBW3Pu/+KTAOy3cTJFBL0NkWJykPCBkDbVF8qQ2Kp5p2Yokv7dWb1M6mHM0JemNcwDxT3Yw9XCVNjVpFVWlfsyRTLaJWVmTuK4caf4YnHYCUTUSyacohdS0u3wtFl674pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzcoW82U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzcoW82U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3635F1F000E9;
	Fri, 31 Jul 2026 05:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785475650;
	bh=glmNOIapH39s42yHTpL/3rw+JUP5lYtLMkkGCOnbKMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HzcoW82UEpJuGs86aQvgxaqvXL5DseJO8lpiHIBUXo71WjHCZ0AVIzURoVITNdNpl
	 zU3eraVEtxOcINLMh12dhBkBdE9awA1X5sQlJ495t3ieNe5HrITr+0PbotcNl49lFA
	 0qKzSSN77U8terRN5eOgEWXWAChNNqdsamiaOoW4DkPxkfuggzG89T8OCe0allBmUc
	 CuIJFr44FUfSkM4HFArvg+E+DOko5QvN2qMAESGMYLh+0Z4Y2CBjteW79odjfq3mGD
	 /P9CIbxdY/Tj0Sf6lpdzVeND2vtIQflzScNO0/mSL07pThVxMZXmOpMrnGFZDs3Png
	 5cYtEp31lWqXA==
Date: Fri, 31 Jul 2026 07:27:22 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/6] arm64: dts: qcom: glymur: Add PCIe3 PHY and
 PCIe3a controller nodes
Message-ID: <mh4ekjxyax6hu3scoxamkryqrikdzetqyq3j626c5pqce7vyic@qlrpckswgkx5>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
 <20260730-glymur_linkmode_0731-v8-3-a455265ad8bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730-glymur_linkmode_0731-v8-3-a455265ad8bf@oss.qualcomm.com>

On Thu, Jul 30, 2026 at 10:13:52PM -0700, Qiang Yu wrote:
> Add the PCIe3 PHY and the PCIe3a controller nodes. PCIe3a and PCIe3b share
> a single Gen5x8 QMP PHY that can be configured either as one x8 link or as
> two independent x4 links (bifurcated).
> 
> The shared PHY is modelled as a single pcie3_phy provider; each controller
> selects its sub-PHY through &pcie3_phy (index 0 for PCIe3a, index 1 for
> PCIe3b). Update the GCC pipe clock parent array to reference the new PHY's
> clock outputs instead of the placeholders.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
