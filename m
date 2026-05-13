Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B1441C30A;
	Wed, 13 May 2026 12:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676753; cv=none; b=DD4XxtXexsMC63XYn5tWl2mGmcfU6/syOKwW9guk4etHL3BnbtwAaV73qcRQXYJaVu713EqteVnZ7W5saaTCu5+oaD65bh3ayTEwSJFKYYHaDvm9lnuReMzXAQuhfKEEPM55uOx+x8CzjW+3gUFR9XmD5b2X0G56RzKmZZer0u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676753; c=relaxed/simple;
	bh=T5Y8Y+Jfx78zBcXFBUqVs7TAaKUpc/ozWNQ7FnHu9+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4Mru7S/a4l70heQb34jMwJw/9lpMoi+4qJUlu729N5dcDUtZuBnTLmeejFByuzfa8uTUQgtmLaGYWbh/6OovusUG2lfPyRcpTylKSkzIA81HpFqitVD89sdNC2PI9/XC0eYvPa+mGNYNUT+SFOGZrm/sKiWy2sg9c7Adia4bDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQ6xz7v6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQ6xz7v6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0DCC2BCB8;
	Wed, 13 May 2026 12:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778676752;
	bh=T5Y8Y+Jfx78zBcXFBUqVs7TAaKUpc/ozWNQ7FnHu9+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qQ6xz7v6vn0u164dsz+1O5a3MHNkcMGGpa1qCGRnM3TVeUbZ7chr8mTsly++CjNOU
	 pj+YpHwaBuSEfz/1mr5+zPZHYYF7Lz2i0b3zKhU6WX8bG3y6zfL2WNQXsACaf0OZcH
	 2/QzLA3lvzGgmLarMHtK32cebiaTJVAePd+PsSeqDnhreAH4V3kxTlOr9eBh1oGoc8
	 QB0hT2n62LVMflDpDZiMnIm+YIuTy9hpkkvVuQwxsm5jjW4w9tVU/fl9oKALoresyf
	 wLkEFIb0j2aOLC5AXIk2B4hGss7lZ2Xn0wiW9SLowWcBwffPQT+EoQAiFSIhvqn9Qw
	 /Bjh7vea2r9Iw==
Date: Wed, 13 May 2026 07:52:30 -0500
From: Rob Herring <robh@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RESEND] dt-bindings: arm: cpus: Add compatible
 qcom,oryon-1-5
Message-ID: <20260513125230.GA593492-robh@kernel.org>
References: <20260427004619.229843-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Applied, thanks.

Rob
