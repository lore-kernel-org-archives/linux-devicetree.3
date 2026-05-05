Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C709218821;
	Tue,  5 May 2026 07:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777966722; cv=none; b=Eawhtd5Ii2IMSHblSx5bz9hIa78jN1DO0iIfeUcWmeby572NI8o0IAtTUFlauLX5+CJybgroMOtpxoCQujKQHRpKZr3GQQcbMc0QfdHZPhRc5ig4VLEhxp+iMWXf3qBoR5Qn3TPwknJLoScMJSPZizTKkSQGphQydGNaZ6JDntE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777966722; c=relaxed/simple;
	bh=ywPxxuDnmp9Eosu4CWKzEO6jPTX0XZmGTMwmBYiGgvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHw9+m2tKPIm+8aDmDiVzTvsksuv8PLwBgc2ljWT5/LE3mH8b5YYrRCoPj8qVDzlQM/lMjyI0kTW1jGEE6va25yw9eNZ1diHJ6XpAUfghc89IY+ZPpA0N26joApJnXHqwxEzZp2cJGWoGW3gXC+VP2HGiYrn5Y4vZzevTiKdTd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNfCTRNf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNfCTRNf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907A7C2BCB4;
	Tue,  5 May 2026 07:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777966722;
	bh=ywPxxuDnmp9Eosu4CWKzEO6jPTX0XZmGTMwmBYiGgvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CNfCTRNfolOEjDv7Rx39X+4rWljsO1EWRGpqRejg93V88E6vXOnHoKZLBBtEcjs26
	 3AtxvveEMTuNAEswIPArQg7KhjWIvBNEhh8QmuWTjWxWWuETeJQEDNaGBeSzuSgHZg
	 SOh9ZVMQrdegAZTAki8xPMeeJBaWWYgjvKR1l2I2yrsZkVTuap9nDjJ7G1FStlodBW
	 NI3mPMn7ikwEcPiM7m+6E1qLjsByFx++tafv41NgbO7W39vrZkGCp7I4gTrBDIbqHT
	 qlNFcqipTYSNSjUSfohmxbInseBB73+20vzFz7J2cuF1vtj7rERWiYDnSGMXAHoXKT
	 pTTLZkiZSwGTA==
Date: Tue, 5 May 2026 09:38:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document
 Nord QMP UFS PHY
Message-ID: <20260505-ambrosial-nifty-manul-b9f40f@quoll>
References: <20260504081442.825908-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504081442.825908-1-shengchao.guo@oss.qualcomm.com>

On Mon, May 04, 2026 at 04:14:42PM +0800, Shawn Guo wrote:
> Document QMP UFS PHY on Qualcomm Nord SoC.

And here you explain the hardware, IOW, that it is or is not compatible
with something and WHY.

> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes in v3:
>  - Improve commit log to drop "compatible with" part

Devices are compatible with other devices, not with a string. And
previous commits could be a guidance here.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

