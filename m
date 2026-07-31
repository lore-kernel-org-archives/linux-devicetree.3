Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB28533B6DC;
	Fri, 31 Jul 2026 05:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785475743; cv=none; b=uUSyFQfMGgkjxm3RWjDn37d82ktr85ABt6EVRkCnGlaDZBPFxODuOJNcH9+1bU2S4OY5E/T+AwXIOBdWqAiYi3mvLTFkBv9gCIdiwvQw0yelOHzo7MFfr65EJm4/Q/dkOErQxZ3R+VBp+x0LOVCXNF4VQkkngGA1JYRhU9tplyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785475743; c=relaxed/simple;
	bh=pt67IGWPsEHIwsYutTK5pSj5Wjx4cimstBOEWxlGGHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mk9S1OsROAGfFmspIzHFzRwiglE7azJ7Fb0tj6UK7JKextaS1TtBd3Jf/A3qEnXOzFCu0QJ/LCmQqI+QQYcLHUgMC25HpAccVifO8H01brfuBgeXBcgT8TXhr61JUncrS6xZ8ofgrbrRIb9rWPRjybYZeJPVWzLf/qorqRxeCiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bg0I1F2/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bg0I1F2/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D3F1F000E9;
	Fri, 31 Jul 2026 05:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785475742;
	bh=hpfz5C+TfvB14E8wVqu53t7TTO0qpqlRXsVWXcjuRrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bg0I1F2/j6p8OyG8tV1HYGdGQPmp6mSE9FiRqbUb1FzWPnxx/JM5v1izkNQoQtWC0
	 tKVrclKL9zXj0OJz+tCcBCZpejkqAe4eUp4rqyf3fjtOJ0N7Kqhy4CQRPba68ohtQS
	 AzSIFuYnrUCK/+8qVJKLQIE33jAgGX7nIHKmt8X6ydeJhjfZhA87YY5c075HqMXfdO
	 fcRicpb3vosTBt69UmRUqx5kisusV2WfYJQ8kyL2I5zYFT9l05g84lKk09t7XebdBu
	 S6buzQ/m7eZLLtF3f3ctkq0BJPFcZu4hM6yIuKxyAsPTRDRaBJGGkx4LPWlqoB+WNv
	 CnFgg0/B65EOg==
Date: Fri, 31 Jul 2026 07:28:54 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 5/6] arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy
 with dedicated pcie3b_phy
Message-ID: <egwrkt77dvm33qlcukvhefv7dfwdmyte6kzctlimk5ywodbbik@kvfimxcpm3nf>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
 <20260730-glymur_linkmode_0731-v8-5-a455265ad8bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730-glymur_linkmode_0731-v8-5-a455265ad8bf@oss.qualcomm.com>

On Thu, Jul 30, 2026 at 10:13:54PM -0700, Qiang Yu wrote:
> Unlike Glymur, Mahua only has PCIe3b wired up; there is no PCIe3a
> controller and no shared Gen5x8 PHY block. Delete the inherited pcie3a
> and pcie3_phy nodes, and add a dedicated pcie3b_phy using the existing
> qcom,glymur-qmp-gen5x4-pcie-phy compatible.
> 
> Point pcie3b_port0's phys and the GCC pipe clock parent array at
> &pcie3b_phy instead of the deleted &pcie3_phy.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
