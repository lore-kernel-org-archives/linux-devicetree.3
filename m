Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA103CCFD6;
	Sun,  3 May 2026 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777817739; cv=none; b=nYKzWN15jIzR/VB+6PmLAaykq6o/EmL0gs+/UPmDYlXPUuBetIdFx/+j90GQ2LaX6D4J1e7gXF/nLK+PXkZvRdwZ32yHZQlH7NLWb9LYnoDmbpQxQYlYLbVl0c0aoGygTz/Yg78XJ/mQU11wfS+vHYBnAvlWp7cOlYNSp7x1t4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777817739; c=relaxed/simple;
	bh=eWYfpLSlv/ndYigzvviyWEPMVG3zMeSBOpghGOE00EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2HXBgmb1+Q3/h1i8CySQjS3o6cxk4FBh29WTU3w/cAfVzZPc57KhzeADWkKcvs/1KfaxunwYN3sK6KSwvoZbAUnBp9mTZzEUDo8JHBFkATDEjSV4EQCCiX92Wl59WmKcG/wuX6zzEV2jwINY1u18gtfGhUwR2CDdWLuY7LyrTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDlkG44G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDlkG44G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B86C2BCF4;
	Sun,  3 May 2026 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777817739;
	bh=eWYfpLSlv/ndYigzvviyWEPMVG3zMeSBOpghGOE00EQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bDlkG44GmELmssbf7BIPP49HT5D4xLvzxtlc1lypixQLyx5SR0rEN/4xZt1EoX1SA
	 KBYzMshSxpzrFL9SVKYs7FxuWXLy9pXq+osTp6s3pX7VbXGTH9VPXfuq1N75jo8+YZ
	 OzfSe2IiRIGhwvxYCH8mMdqW+mJlozQlAXfNQzw/ntasw9HfFryiIskIlQE0JWLZUy
	 3DSJGw/AsrQAdBMDMvkcq7tHHR4i3sb5JUFVYSFWEOviA0hlzhF8MOz5wgrdfgFtp9
	 BBCQormFmzXJAA9+XcroSr26vw4JYDfAS4wS1G1TgOGamXp+Bo+bFgLvzeyib3dER4
	 89XdLXWqoysDA==
Date: Sun, 3 May 2026 16:15:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Wales <daviewales@disroot.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Motorola Moto G2
 (2014)
Message-ID: <20260503-wealthy-chestnut-unicorn-efa63f@quoll>
References: <20260502-device-motorola-titan-mainline-v2-0-c791277c740a@disroot.org>
 <20260502-device-motorola-titan-mainline-v2-1-c791277c740a@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260502-device-motorola-titan-mainline-v2-1-c791277c740a@disroot.org>

On Sat, May 02, 2026 at 08:50:17AM +1000, David Wales wrote:
> Document the Motorola Moto G2 (2014), which is a smartphone based on the
> Qualcomm MSM8226 SoC.
> 
> Signed-off-by: David Wales <daviewales@disroot.org>
> ---

You use b4, so why aren't you following the process? What is the step
before sending next version? trailers.

I ignore this patch.

Best regards,
Krzysztof

