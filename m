Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452CE42AA9;
	Sun, 28 Jun 2026 02:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782613732; cv=none; b=LQj4QdkfXFFgbp/yB3kuQaDjRn23biy3y8jLt0+O3c6vMB9pTpKZST5i32FFOorhmSSf55sS8Map+I/+uGYaCm/0Am2lnWlQwjv8O8og+i7/x0Ov41s2d39kVXxvdFNLTF9TIiL5pugrYc4UX91qXKbRHMnqrI4oSplGfv+KjtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782613732; c=relaxed/simple;
	bh=Rb5P6FLLBKeU+l2eWT+4RQbNQqPtPqKFt+iwGEG6oq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLbZ7JtQCPg/tY3vAkflPQQCDxszps38BOiwHgvUtAwbMYzGG6Lui1u17yd4hNK9oKg7kfrsTSf4pKQHjJBAo/XmJjMCSRVkWmJ0mv0ib0qfTepsRqJpSJKkN+1EmUVNDrdb3xTOEaF20hl1IrQNfAi3f+7BlhL4mMwoNXzsSS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmY4VOlm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmY4VOlm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E901F000E9;
	Sun, 28 Jun 2026 02:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782613730;
	bh=1gE5MXzxTClZfJ9zDwzoAEPoflVvwE9JcK26E48UXok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bmY4VOlm/qrDTHBXWuwR9vkcAZoDKcH80vBn1+LRYzCCRv5CjArxuYI3gNXixw/wJ
	 dYUq88rp5TyqIFle1tEmKqy6MJFIvoYG8Zxw6Rr5YpNyi49ryNUnRv3AsTd/hyBlNH
	 nRo5qE1TTEZtZpXjGN2nLSSnH7bqUlvJhvxDHnyHlVwMMsHrHHPozkXSeBPlJ2/tVc
	 VdU9aErnvH0deAeNMamJms5voSE6xGvSm7Dp7xjVJSjoUqJT7EcCKy/DqLi0HnDF4s
	 3uBUCoWeIj6jb7JFONso6Ga8aiZUrKXftNEF0UNC9IdoDtF0joX55B+E0PitrVLN+H
	 rW31A4tGr7gsw==
Date: Sat, 27 Jun 2026 21:28:47 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mahadevan P <mahap@qti.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kodiak: Set up 4-lane DP
Message-ID: <akCGiJU2pIlLEi-D@baldur>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-3-c3a703cc30eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-kodiak_v2-v2-3-c3a703cc30eb@oss.qualcomm.com>

On Wed, Apr 29, 2026 at 12:10:42PM +0530, Mahadevan P wrote:
> From: Mahadevan P <mahap@qti.qualcomm.com>
> 
> Allow up to 4 lanes for the DisplayPort link from the PHY to the

It's hard to follow your thought process here, as you didn't document
why this change should be made. Start your commit message by describing
the problem that your change is solving.

> controller now the mode-switch events can reach the QMP Combo PHY.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 0acc6917d7aa..204513a6bd89 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5704,7 +5704,7 @@ dp_in: endpoint {
>  					port@1 {
>  						reg = <1>;
>  						mdss_dp_out: endpoint {
> -							data-lanes = <0 1>;
> +							data-lanes = <0 1 2 3>;

And as Dmitry pointed out, not all Kodiak-based boards have 4 DP-lanes
wired up.

Regards,
Bjorn

>  							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>  						};
>  					};
> 
> -- 
> 2.34.1
> 
