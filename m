Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6963876A1;
	Fri,  3 Jul 2026 06:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061281; cv=none; b=GYvLylWcFSkYaOjUDlVFZm61KKhMvAzJHr8b+oUV6WZzHxK0aBEiFft1sJpCeXi0Yp+RaHyi6JCP5C3xe3lWurdAUdLqz6oTwIGWXcS75+DgdSY+vKyb8qwusadr4tW3QgxJ0L+m6KYGCNPGuiIdQfowhKTYAf4GtDWmCng8USg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061281; c=relaxed/simple;
	bh=EyOz9gg1C4sV0+3WpWIz+Lf7QvWT6ZAZLPJEbwxGQ3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clqXGbXvFkjCKACUIRCthUcoWY2sNf/70N+t4oLWG+Mf6gS3jHv7jt3LWKYCjnuOCoPeckWw/Oso5T7l1CkqZj8aYfM7xQWpDaws4C8OF6wR/sgPQbjvjoMcVjrC8rp//6UCK3kl9rfANIvN1OARJsD0qeK+mget7CQMdFC++TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gr/DdCED; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gr/DdCED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED581F000E9;
	Fri,  3 Jul 2026 06:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783061277;
	bh=Cp3nH/XuIMoiIpAb5TPVkBKID8l1rVRQ5+nNPwgAmWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gr/DdCEDFqw0a2XWo5YrWm+7l5/fvehobRxn4cvKnWXlztheZ9FuIFweqCUAFV1UK
	 7Hz1/yCTc+AwCamVZdDtslCKULrKLCbZj/0Q9KhB1MhiLIMBY6ZvZxXUaFd6HwgMvx
	 tr36Uak10QiQwTpsrJqkSIT+voeirRODelyIrjRg0wkm9Ofjq2uss/3R2jNKt9vsL1
	 pTUozmxTvusWoMFsOavQs4LwtJc45O9F2UzomAoepz+yTQvbzkBnUTE5MVWb1ILRRx
	 SxVHkxJex8Cp1iK55PQYvCrZr2f/iWxAnAjQmk4pErIz61BSadYwN+vrCif7bpjy1G
	 zAIGBdYDIS1RQ==
Date: Fri, 3 Jul 2026 08:47:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] dt-bindings: regulator: qcom,usb-vbus-regulator:
 add qcom,pm4125-vbus-reg
Message-ID: <20260703-quantum-quartz-grasshopper-13ccf3@quoll>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-1-6bac2bac7131@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701-add_pm4125-vbus-reg-v2-1-6bac2bac7131@oss.qualcomm.com>

On Wed, Jul 01, 2026 at 03:58:03PM +0530, Rakesh Kota wrote:
> The pm4125 PMIC uses a different USB VBUS register layout than pm8150b.
> It uses a 2-bit VBOOST voltage selector supporting output voltages of
> 4.25 V, 4.5 V, 4.75 V and 5.0 V, instead of a current-limit selector.
> 
> Move qcom,pm4125-vbus-reg from the pm8150b fallback items list into the
> standalone enum since the driver handles it with its own match-data and
> register layout.
> 
> Make regulator-min/max-microamp conditional so they are only required
> for current-limit variants (pm8150b, pm6150, pm7250b, pmi632). Add an
> if/then condition for qcom,pm4125-vbus-reg requiring regulator-min/
> max-microvolt instead, and update the pm4125 example accordingly.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  .../regulator/qcom,usb-vbus-regulator.yaml         | 50 +++++++++++++++++++---
>  1 file changed, 45 insertions(+), 5 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

