Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73673612E3;
	Tue,  7 Jul 2026 03:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783393519; cv=none; b=I306yYgK8PvBQy2HFzKTFUCNxTNqF/3c//BGnBrHgV+UZstZCQZxM8ugahZvBRiz1rdDL0j+fH7Z2v47uqXIgcXUjcexUGfMpjAGEPqxZhGcK8biQWvz6+pPLVgtv9tf9nkfTpqh5LMvE96hXrFhcYoAbs63Jyb1dtVgOXdOQCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783393519; c=relaxed/simple;
	bh=VoQLgFeNnksyQc9c3QR7TaCo5ikHt+z0VAbggUNW3fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nI6U/QaiFOSIFPEEkHPOXTMZZ/a/7zDT1fofC8vCHLwIeJFU+DAKCKPIRe/SvNc+dZ2J2hXKe5NftEOKLwsFjsG1CT5kvPD+/dBhC+Z3ATfVHW64zl4wpPyk5z7mVEyyTBVbN6FfPurYSlayi9c8QfINwQmCgTfpk/tSUcHJ0HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XH15bNxd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XH15bNxd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8101F000E9;
	Tue,  7 Jul 2026 03:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783393518;
	bh=jQlXSu2274V/m/Tz3fJwubgDKsS8BOySYapvXQMnXbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XH15bNxdE1xM34RqG4YCgcWZSpzGFr5J+n4bgswmqlnKrsyd3VxxC7rkmM0fOJgTH
	 9J3YMARkFeOC+pMzkJufOsPHh2Eefdb9BBW0UZ+g6PqYikwlh8sVadjIVlORID3Ch5
	 mW6hc2hk0rrmYX0tLhGsfGIJUiplMi/l+NPQ6MLhE3twARV4hm59ys+2PLmX0kVnzn
	 bioa14+HK18b30nWGqExntqJPT5hAoiALKZ5DXkyBH8qjJLg7gxbmc1ocDfJvIbBBB
	 u/70Y7iuB7un51fJNTjizwRaX2WVaDqA8OWYr8MZIsNF6JC37ewTHRkYampuZy1JIE
	 JfffaFwrFkuGA==
Date: Mon, 6 Jul 2026 22:05:14 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Message-ID: <akxsUQzZoPMZq8lb@baldur>
References: <20260703085809.2573214-1-sarat.addepalli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703085809.2573214-1-sarat.addepalli@oss.qualcomm.com>

On Fri, Jul 03, 2026 at 02:28:09PM +0530, Sarat Addepalli wrote:
> Add IPA nodes for Qualcomm qcm6490 board.

There's no such thing as "the qcm6490 board" - I have 2 different "the"
qcm6490 boards...

Please start your commit message by describing the "problem" that the
patch is solving. 

> 
> The qcom,gsi-loader and memory-region properties are provided by
> kodiak.dtsi as part of the IPA property consolidation work, so only
> the board-specific firmware-name and status properties need to be set.

That's how DeviceTree source works, no need to document it.

> 
> Link: https://lore.kernel.org/all/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/

In line with Konrad's comment, it's not clear to me what this link is
doing here. Either help me understand (in the commit message) or remove
it.

> Signed-off-by: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
> ---
> Changes in v4:
> - Removed empty line between Link and Signed-off-by tags.
> - Added empty line before the status property in the IPA node.
> - Sent as a new thread instead of replying to the previous revision.
> Changes in v3:
> - Rebased on top of IPA property consolidation series.
> - Dropped qcom,gsi-loader and memory-region properties as they are now
>   provided by kodiak.dtsi.
> - Added Link tag to the dependent IPA loader series.
> Changes in v2:
> - Modified firmware file extension from .mdt to .mbn
> 
> v3: https://lore.kernel.org/all/20260702105509.1360340-1-sarat.addepalli@oss.qualcomm.com/
> v2: https://lore.kernel.org/all/20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com/
> v1: https://lore.kernel.org/all/20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com/
> 
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index bdc02260f902..7242695aed97 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -619,6 +619,12 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/qcm6490/a660_zap.mbn";
>  };
>  
> +&ipa {
> +	firmware-name = "qcom/qcm6490/ipa_fws.mbn";
> +
> +	status = "okay";
> +};
> +
>  &lpass_rx_macro {
>  	status = "okay";
>  };
