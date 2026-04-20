Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8D140DFDD;
	Mon, 20 Apr 2026 08:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776672980; cv=none; b=Lzx0DXGzyedz9JayCPHtHYrM5YbJjTnfTgKkMhkN00ZzICuvWCCk4mhGKGlTCV9ff/Hi8L408DVLVmd75ar9goH1/Wmmw4ZPsAUvIIODX913XZpQZkqb/JFqAhnJYeD1nC9s5HrMxikA8qrQgwHUMnHW+LV/vTSpVx0YB4zldqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776672980; c=relaxed/simple;
	bh=IzxlCwsydoFwgJC24snSSy/dRo8R2oSHkGmQfzrslU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UoKvJ7ZLqDaUS6SYVVzNvYC4QvqOs6fn9Qi9JfSTFTyhngiVo25mTY10QZVl+o5ah6AsiRXPKyF7WCLSAE1ydqRe7+omaHKIm1+VcKk7tB0iysj1+CwTEjKSsJKtv37vRjgrOGrdiv9Tc6UjSHOgi+bo3oTn4ZxNvzpJovj6jPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNp50Lt9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNp50Lt9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D01CC19425;
	Mon, 20 Apr 2026 08:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776672980;
	bh=IzxlCwsydoFwgJC24snSSy/dRo8R2oSHkGmQfzrslU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eNp50Lt98HtjGhSR2OscNGARBUjt8lPLFFRnQHDGUztNSrJ5stNp2xAEfu72feoJX
	 FyFq9fyZ2mZVxoYF+gviIPU++8S1nxInWZ4St/pYtuYCva0993LPGRJklJUPDw+Spg
	 Cjd/xgzAm8Tx4oKKClrQOt1qgZcxZ/sHv3+6VIUC2nITv1tcq810NgJP5jPW9tlxCg
	 UuneVS6nbqTljgDBLvYHienGLSXJZMrrQpo3/bxTygyOW3eAhMO/Cn0754rW5GbIvT
	 JhKGnaQKkCAxSs92FLpO/TXzymm5eZhOG2zfD0DCH5X5C+YrVQ/JjxJQBEr0ro5ms+
	 lprsvRMq1TTsw==
Date: Mon, 20 Apr 2026 13:46:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC
Message-ID: <rqjdh72kncyjfkpfo5ymd3uvyy5bzrqzpomdbggobk2spcfpwg@irlwojm3eme7>
References: <20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com>

On Mon, Apr 20, 2026 at 12:01:41PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Document Inter-Processor Communication Controller on Qualcomm Nord SoC
> with a fallback on qcom,ipcc.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index f5c584cf2146..0a86230a2b18 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -28,6 +28,7 @@ properties:
>            - qcom,glymur-ipcc
>            - qcom,kaanapali-ipcc
>            - qcom,milos-ipcc
> +          - qcom,nord-ipcc

What is the difference between this and the existing 'sa8775p' compatible? Are
they both representing the same SoC series?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
