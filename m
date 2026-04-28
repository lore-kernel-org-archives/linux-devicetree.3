Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CDC3A9629;
	Tue, 28 Apr 2026 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777360573; cv=none; b=vAy0fMyLaiu6SNOOUdJ2+JZpDujjE+MOWhKy/MC4sFSby0Co2h9a72RuvIXs1C16d5Vh1gFqqUk17YuGD05SY6nuxQOx5n3iJaPNoolvyqkBUK3YvKm5gC/dbCfbI4IDSZoHsZ8ugIFHplzLkE0dxS8tlZrin1rSlm9sgPm3hR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777360573; c=relaxed/simple;
	bh=F+Bedh6UQky/XLr6sa/YBINvFDV9SbHhf9607gOUy1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePb1+uKu5xIAlERyGgXZoSIpfg6aLUxsJMYcsH1012m0qGhnfzEwWxPyARsJFpHSLlN6Ik5kZfp2eg1+me5j/z6IA0fr/NQwBa9h/w+y81jn0nbnRbyAvMxhwFE0c9rXAIV3Ij3/NM696RGH+oRNkIzeaQmZM8wdMsNZK4Ya4po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Az2yAtgy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Az2yAtgy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D62C2BCAF;
	Tue, 28 Apr 2026 07:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777360573;
	bh=F+Bedh6UQky/XLr6sa/YBINvFDV9SbHhf9607gOUy1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Az2yAtgyMj+n9xe/FVDCLwhh5yVZktsoCesWX1u/Y+MZUET/sm/8zTQq+BfQp93a4
	 2RCDJV9plrqyFwj20aoh0zXQeAcibhnsXVY+HidZutTcqX1rIglO99NWNsKlf53TiU
	 ZoHH0HmrfxQNSuzdGaC15qV1rO93NhztcPWVuqG9UIijVpZ0jJKcybwMO/ZkFum/H5
	 OIJ/wj1KakM5Hu3GeGPXfIETUqzHT9qv/IJ0sKaB9KA+ihjkkUY6fTYS5qKsTShcKC
	 N2rJa6UKlkRPVxlpOQk6jq9KecZm1/QSAzTqc1HAOYz+Ki23d56Sz3g1aqXTvpZ/8N
	 XwzR3qwjyilxg==
Date: Tue, 28 Apr 2026 09:16:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RESEND] dt-bindings: arm: cpus: Add compatible
 qcom,oryon-1-5
Message-ID: <20260428-spotted-azure-labradoodle-5ddea4@quoll>
References: <20260427004619.229843-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427004619.229843-1-shengchao.guo@oss.qualcomm.com>

On Mon, Apr 27, 2026 at 08:46:19AM +0800, Shawn Guo wrote:
> Qualcomm Oryon 1-5 is found on Nord SoC.  Add compatible for it.
> 
>   $ cat /proc/cpuinfo
>   ...
>   CPU implementer : 0x51
>   CPU architecture: 8
>   CPU variant     : 0x5
>   CPU part        : 0x001
>   CPU revision    : 4
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Notes for resend:
>  - Rebase on v7.1-rc1
>  - The user of this binding (Nord DTS) can be found here [1],
>    and will be sent for public review shortly.
> 
> [1] https://github.com/qualcomm-linux/kernel-topics/blob/early/hwe/nord-next/arch/arm64/boot/dts/qcom/nord.dtsi
> 
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

