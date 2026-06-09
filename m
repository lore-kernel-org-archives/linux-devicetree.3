Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C22383C95;
	Tue,  9 Jun 2026 07:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989595; cv=none; b=qdi+uP+hQfKT5GPOIIb7uaUrvd0qXKAgWCteOdlQhz+njkTV+uRsPB7EdfgYNoybLyiUk7WHEsBYXmMonRPlxHiYiSG1GE8HAc2bn2xKW4biCreRb+TpAg33ODruYU1FClID25ONyjktLf6oLudUAScatY0KrH+7PQE+WsNDnzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989595; c=relaxed/simple;
	bh=MZwiDHuAt1zR5v5iZPKDjhJjLK0FPjrE2wc1inbDoeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4D5n9PyC5HVlqotfrQg4u9WWd0C11TGy8l+WBp0Xs2bYJMjXMO5prBDO2dqvTpSf/bKaB8mWUxIQEOofYFGJMrsi90PmzJgm8TIP/ip593EiNH9Tc/bl4s39N7c99ty/DGZFpYzB/upP3JFtc8TX0bdx02OV5sIZJ9jJnrwHB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIZwfDlP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIZwfDlP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9461F00893;
	Tue,  9 Jun 2026 07:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989594;
	bh=vkCP6b4OrlIW/YPpqmN4QaEIE1n3u/k0VTYfSKF2ZnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oIZwfDlPg3B9O2qcn8pvuJoYYZDDkHh7O8GNeGzBiTJnjH/yVPNoc7eWWj97Jnlyh
	 mLPUFa8qLI96o3vljxZFwRA+BpRStZ+n5txbmcsvdNd9XrbIv469K+HVo2K1heivFI
	 29w3gdD2fn9O97509HVK9VeN9owj77n3O1PTtusxa0TV7y7+YvsqaFOtbXWic3LHeC
	 spluMgxeGaAFCoVy6Lar+Du9AQ0usBmYmcuKgmdCB3jN4cWmzOn95NMlPiBy639CRn
	 nUPVbeI+VTdjgmuz1HTGXlTbbPy/tzoaMBGH9+GRewJkg+/jYWu3JOHN4nh6c9bRWu
	 DhaVi/Qgb2LIg==
Date: Tue, 9 Jun 2026 09:19:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
Message-ID: <20260609-quirky-rat-of-criticism-aea1fe@quoll>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>

On Mon, Jun 08, 2026 at 03:20:22PM +0200, Stephan Gerhold wrote:
> Add the qcom,mdm9607-nand compatible for the QPIC NAND controller used
> inside the MDM9607 SoC.
> 
> On MDM9607, there is only a single controllable clock for the NAND
> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
> around that by assigning a dummy clock (&nand_clk_dummy) to the second
> clock ("aon") that is required by the dt-bindings. This is not really
> useful, so avoid doing that for new platforms by excluding the second "aon"
> clock entry in the dt-bindings.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  .../devicetree/bindings/mtd/qcom,nandc.yaml        | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

