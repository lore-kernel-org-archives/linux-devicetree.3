Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED305312832;
	Sun, 10 May 2026 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778405378; cv=none; b=qMY9KcCXEgz/bwMFzSPIuosQKUxTtk3i3Dj87bB7gBBbtx9EjfvpRHVnHPe73YjI8D+LXQFXD8MCzjdYkqQivsWLReWPxkXcwHuKvNNxrXm8qAHlDH7+HMx9yBOfAE3dJLIpEYIIbltXUIfRjfXMLwBGK0aqQGAlIwOEP4fnnVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778405378; c=relaxed/simple;
	bh=T2BdkQKmtw0VsjxE8NK4OiVQOvYqrt4e3N/yZz4A4i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sn/9H62c1F1VULT8mgfZZ1YQIP/qCBqofeyTiOWXzGZhu/2MeRPItHEqWtcdDh1xfC17GfDvUt4QZOPFGM7gXk9H6r2RmjX4jv1tdd+ATcG3C5ywhFkZA5r0bFTHvM0GGwDqRHLLtQC9qB0emFU63swGItZTRKPmNxCQNg+pzHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qIsvU2Ek; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qIsvU2Ek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32F9C2BCB8;
	Sun, 10 May 2026 09:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778405377;
	bh=T2BdkQKmtw0VsjxE8NK4OiVQOvYqrt4e3N/yZz4A4i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qIsvU2Ek3kJsQU/kys3xWDXNjjLTw95shhd+Al0vMWxx24piQx8eKMAAaqLz65ZQR
	 uOjBIeTwSCiMYaoIE5o/NSaKNuPAyQ5+3bo+VzXxRlMquGdBkhTqJbJg6OobHYKc5p
	 cEjpAsQcNAd5y8tgfTVivzGRo7fIcorr7b8RiirwgdVDo8DcO4CcKiy1IkrA5fzS2T
	 dmLxYuhZ91+YHFvrSgMqWYo56tmKG9RhHz6Gg30g/ARx18rQfQ6fi6jfjq5n1TNmI8
	 irj/wcU4XYyiHJ0P9SeP/SDNtNnLpkQ3CuLS33tRThXbYfEO2lUPhRRsWkeVy9vpso
	 HNHqne2o2ru+A==
Date: Sun, 10 May 2026 14:59:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add USB Phy driver and binding changes for
 Qualcomm Shikra SoC
Message-ID: <agBP_HeLmVAKLFUh@vaman>
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>

On 04-05-26, 22:36, Krishna Kurapati wrote:
> This series adds Driver and binding changes for USB Phys on Shikra. There
> are two USB controllers - One of them is SS capable and other is highspeed
> only capable. The ss Phy init sequence is same as that of Talos.

Please check https://sashiko.dev/#/patchset/20260504170659.282532-1-krishna.kurapati%40oss.qualcomm.com

> 
> Changes in v2:
> - Separated the usb controller binding changes
> - Updated commit texts.
> 
> Krishna Kurapati (4):
>   dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
>   dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for Shikra
>   phy: qcom-qusb2: Add support for Shikra
>   phy: qcom: qmp-usbc: Add qmp configuration for Shikra
> 
>  .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml  |  2 ++
>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml  |  1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c         |  3 +++
>  drivers/phy/qualcomm/phy-qcom-qusb2.c            | 16 ++++++++++++++++
>  4 files changed, 22 insertions(+)
> 
> -- 
> 2.34.1

-- 
~Vinod
