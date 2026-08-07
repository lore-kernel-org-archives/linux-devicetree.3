Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2D0371868;
	Fri,  7 Aug 2026 12:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786104651; cv=none; b=FqRc5dLvYc2BvVONMD//HRfkc1j5A6JJ8bKx+j5jrIik+NSUgXPWSDd9oyv8lKJ6xneAV3krxglFMd3bIz14RCN5LcFlFHp/9dFulohUXHelAKhrTHwyw5pUsqPUkYkCdPMjqHmzhPbOQDEIkPcEmol1hfFXF5R8DBS905DHXXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786104651; c=relaxed/simple;
	bh=+wjDvq2eizkN0ss8sJ1NAhYH/bsyN/+HkMOBf38/4rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q42opRUtnEGDN8dWYycvhNmXJbLaV9gXvMhPAJRPbvsjNXYbOKF53CNs58rXqVhOPMQRLHfIaU2GybNEH1lfw8O9jAZUpd8v109vPtRX9oe7vKthRTT2ESDSMtkpP8hLJZviH2r7qvcXjG9Sqtalm9vqUs0Cv405n2BUCWju/7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYtpW3Kh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYtpW3Kh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908A21F000E9;
	Fri,  7 Aug 2026 12:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786104628;
	bh=omVmCxufR2KEfAHglCQk1kgesXi+aQ93qmaZVz6mkS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dYtpW3KhvGVbusf1kssvUt3rJ7XSD3jfOcANC5gD/zd7SfjUWvC05YW6fouta61gF
	 zT4bCHfuxW8ofqerRFfgzMhT8glG1Xww+EVzUCQ4eSVWim/7fHUnyCowfRi4oCR5i6
	 aS67jVjMS/ZY2UxdpgTI/AfT5lo3ud0seB2CKTpK4S5awGS6a29thJIjRirySdsoyH
	 WWyqVwi/6Dx1AqHAfOEcQwEVGp2eyKu3kOmYvOsWMvHWAwTN4zZ1UlLr5eNajC4VM/
	 mKgbb+pttEm5WJFG6HYH6Tr3ye+S7aSRfFFimMQHyC6RYXhnF9R6vrEvWmX+qIhh3l
	 t2uKXqQRNeOWw==
Date: Fri, 7 Aug 2026 14:10:17 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com, 
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, Mika Westerberg <westeri@kernel.org>, 
	Sven Peter <sven@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E
 description for USB4
Message-ID: <pu6seb2byma6unnvhzfocxrvatnt4qkviyawhgrhhunrbemvzs@vh7yum24azyg>
References: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
 <20260730-topic-usb4phy-v3-1-ccf0f7ea98b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730-topic-usb4phy-v3-1-ccf0f7ea98b5@oss.qualcomm.com>

On Thu, Jul 30, 2026 at 04:19:13PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some instances of the QMP combo PHY (called USB43DP) feature a third
> functional sub-block, responsible for USB4/Thunderbolt 3 communication.
> 
> Compared to the today's state of the binding, one more clock (P2RR2P -
> PHY-to-Router, Router-to-PHY) needs to be enabled for the PHY to be
> able to switch to USB4 mode. Allow that for X1E.
> 
> Also, add a bindings define to let consumers access it.
> 
> Assisted-by: Claude:sonnet-5
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
