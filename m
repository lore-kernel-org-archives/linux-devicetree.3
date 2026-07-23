Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9EA3E3D93;
	Thu, 23 Jul 2026 07:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791045; cv=none; b=JysbwN8oJqWCSsvi+ny2TLC3PGdnuslhNuwYiOi1agYgiuTx9ZzsiaQKC2iCjtqRWw4OVH8NKnGIJxJt0uQogwMLd0lLyBo8lpYqmNMMdVRYFo3aiohAOYx3QM16wZTuBDyPPAkO8vuQAdkNH4D8ZEs8aSmL+Ia8veZFhy1i0bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791045; c=relaxed/simple;
	bh=tAx/fLosqFu1pevF551XEPo5MkROyCU1nCSi8ZyDMjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BD6LOhjwI+17jEeMnez4MRsAxs8OZcWDrz7vj60I/yg5oQLccPDIOLRlelaUf0Lldjl+TFyBixUDi/1y7m/mBTacKooCHzoCHMSIe8tSIvWIA0jufb2f6vTZ8xOxHuvMrXXGNZqeRhhJ61aPMqkrUqsJ8IYqzubEOqZsj+EL/ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8h6+fad; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8h6+fad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E16A1F000E9;
	Thu, 23 Jul 2026 07:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784791038;
	bh=L2dHxw1+FjBVaynepTYaddjUmqfLavHLp027eVP6FcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y8h6+fadHj8vEmJO5CecJFS/etgHP/NeFcQzd+PL0aM9CsGr+kd51X/e9H5ZbJf/2
	 Xn+1MN8+2ylNKbNgfg8wipS1dG11z61DkMyNzXtAh9Ph8EV3zo5bha8ZdQDWLY2UZJ
	 UpK/eV/WZIAo4CklIi0lasWOHDKaZ+zgrr/HGNbNzHL3fZ4Iu0Qs75pQMtMJ/0ePZY
	 iG7yFnj7uSfzLtLwRIaQAmpwxuM/gkamXA3ydT7VuVIJolXtWxTb6ApNxvTAd3BX0/
	 fIc21WxicxeDKqALw11QFWSSou72wqGyd/n+8OTVxX41sIAgsQ+bpf5L55l7ZEJXd0
	 X4NtzJmzS39Hg==
Date: Thu, 23 Jul 2026 09:17:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: phy: qcom: Add Glymur QMP PCIe
 multiple link-mode PHY
Message-ID: <20260723-rational-caribou-of-prestige-dcdbc7@quoll>
References: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
 <20260722-glymur_linkmode_0722-v6-1-bba8156b8cbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722-glymur_linkmode_0722-v6-1-bba8156b8cbb@oss.qualcomm.com>

On Wed, Jul 22, 2026 at 07:30:18PM -0700, Qiang Yu wrote:
> Add qcom,glymur-qmp-pcie-multiphy.yaml as a standalone binding
> for the Glymur Gen5 PCIe PHY hardware block. This block supports two
> link modes, selected at runtime via a TCSR syscon register:
> 
> 1. x8 - a single 8-lane PHY instance is exposed
> 2. x4+x4 - two independent 4-lane PHY instances are exposed
> 
> Keep this as a separate schema from qcom,sc8280xp-qmp-pcie-phy.yaml
> rather than folding it into the shared compatible list there, since the
> two PHY instances active in x8 mode require twice as many clocks,
> resets, and power-domains as any other entry in that file, and adding
> Glymur-specific properties like qcom,link-mode and reg-names there
> would only apply to this one compatible.
> 
> Document the required clocks, resets, and power-domains for both PHY
> instances, and use #phy-cells = <1>, where the cell value is the PHY
> index within the active link mode.
 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  .../phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml       | 177 +++++++++++++++++++++
>  1 file changed, 177 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

