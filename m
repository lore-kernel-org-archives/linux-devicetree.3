Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CD03E715E;
	Tue,  4 Aug 2026 08:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832598; cv=none; b=eC8HiqBYOXDGEizM7QwC22B9NZfAuNLWJmXOHk9Fz7hUUYdtQ+/rYWx964IY6Fy+UlXAYIXS74RRqGhgWpI8gd+BoQgnfbVx0hm77hHWCLtPi9n2XCXqddzMYJo6WZzAmZcNgIzs4HDpL1/av9AQyNuUw8koRP59chmbY1qbC2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832598; c=relaxed/simple;
	bh=heyr6V9pc5fqm8Pg1u3+bC/7Jv5hFLVtncn8urFynOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIcvEtQHILMirsWijiSSp5xuxeYQHoyc0JQTwhSCvGW9bx9F0HHHX6ctbR6sv+HSkcHUhFb0ZfMiliFX/lIONQMIWdO932/gwyui3Qyn4vTbiEH3JeiZi4m8dn2gSDjP1KQyJaVEk6l8XUNUpGJXgHCtYjA98gdLOFhZ1s74CI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJR8Twl3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJR8Twl3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC9D1F000E9;
	Tue,  4 Aug 2026 08:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785832597;
	bh=64Xq96YRQyhtkBPpcEjutIkSTHiC9n8HlyHblT8xDvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OJR8Twl3a8iyERK7ubpNDGveorBM2Y3IM55x4JejXbJcTrdYhMIf6iH65+9hAa6Uw
	 YGaL5g7SvjNymVqJBG3fKYlt9kku341Ca9yfJpV9lAiDKsY83RsZw5AvR2yQjObBq8
	 PgHoUQfDv89mI+ZvDi5GA8vzjAdAuhx9SGk3xRpp1fk72hx3SFcWB646ihkpKw8d3Y
	 hWJNoRi7uRwAIcS1B0hpcnj/rOjYj+8UJg1NT9mFa19IWTnpfzA3nw1CIh3USyw332
	 hOMZeeW0iDik6+AdEHMBcqC/hdYvAg2Y55Ubr5S4Giftgk6lU73wKjGkqJ8jMX8AbX
	 QeAKO5GneE+xw==
Date: Tue, 4 Aug 2026 10:36:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 01/28] dt-bindings: phy: qcom: Describe QMP USB and UFS
 PHY vdda-phy/vdda-pll voltages
Message-ID: <20260804-lemon-malamute-from-nibiru-eeedde@quoll>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-1-5880630cde3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803-phy-supply-fix-v1-1-5880630cde3e@oss.qualcomm.com>

On Mon, Aug 03, 2026 at 08:33:59AM +0200, Manivannan Sadhasivam wrote:
> The vdda-phy and vdda-pll supplies of the QMP USB and UFS PHYs are
> frequently swapped in devicetrees, as the naming does not make clear
> which supply expects which voltage. Document that vdda-phy is around
> 0.8V and vdda-pll is around 1.2V, with the exact voltage varying per
> SoC, so that the correct supplies can be assigned.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Assisted-by: Claude:opus-4-8
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml   | 10 ++++++++--
>  .../devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml  | 10 ++++++++--
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml   | 12 +++++++++---
>  .../bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 12 +++++++++---
>  .../bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 10 ++++++++--
>  5 files changed, 42 insertions(+), 12 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

