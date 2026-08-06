Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DAF3EB0E7;
	Thu,  6 Aug 2026 08:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786003473; cv=none; b=XF9fjFLul558kHjjQghi0uYkOh4m+fiKtQtp+lt/t2xgotRmxW2WGOEuVAD0s+rqaPKxPjLH1IlGgAg5bozgoaprFT3WNdoxQzw5UNMRbIZLL3pO0eCNsVn6m0Vato6UETTxTKgcGMLe+PIqyyTFrGCbdr7Jfpmyu1iN/V8p5ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786003473; c=relaxed/simple;
	bh=/Pl5nQN3HE77o2ahvWRJeyXsWv1+acQaWNHUbgoRBO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tiNlUAWN8pR53Pn7ll5u+YqxZRijsVVw0HDw3sPuSvU+k6MNVUMz+5xes9nIQdiztHm1p90xgBspkj3t8CLecw4yYcR4t6SiRc0h5w4W0rbck8JkmyBfT+N75gdfGO8z8Dl8LJH2Dal5R9IG4wB6MW08jJhYODqJQabOxbk4HSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4NgQO8Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4NgQO8Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097F81F00A3D;
	Thu,  6 Aug 2026 08:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786003467;
	bh=ZW/JGrz5OFsg8wBorPQ+SPx/P/cxGfxTHqpna7iFxkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D4NgQO8Z0iwCT/ON6xG76n56frfkl8t4zK1ojffOQ+UQPnEx/60p8pQm36BK77nnh
	 XvS4ncMXApI2phTveINWzZlgFsW4NriQY8LzHpVGIAYGaalFIDbYtc1Ry5xGaBfHvQ
	 R0Gfc0yTrPLciylaD637N1gJnwqgxzLRPlhg8+0jJXrCoq2EL156Q6GjgJ8/Y24TF6
	 JO3OdYvOA/YDd/Ty4+08LZMiyqdgwLwlt1jUBWm6jO9IpPgXYlG3yDDgZNBCWDcm6J
	 PTCV8LqTikYB8Z8IIk8+VNmW/KFcS6YSz91t5Kev98XOQv7pNcS208TwxyqOBlUnTQ
	 GoFuE5/E+YRmw==
Date: Thu, 6 Aug 2026 10:04:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: qcom: fix PURWA/HAMOA IOT SOM
 compatibles
Message-ID: <20260806-angelic-translucent-shellfish-3307c8@quoll>
References: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
 <20260805-hamoa-come-v3-v3-1-20463c43eae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805-hamoa-come-v3-v3-1-20463c43eae1@oss.qualcomm.com>

On Wed, Aug 05, 2026 at 06:30:00PM +0800, Yuanjie Yang wrote:
> The compatible strings for the Hamoa and Purwa IoT SOM platforms do not
> match the naming used in the official hardware documentation.
> 
> The documentation identifies these SOMs using their IQ product names
> rather than hamoa-iot-som or purwa-iot-som style names. In particular,
> there are no SOM products documented with the names:
> 
>   - hamoa-iot-som
>   - purwa-iot-som
> 
> Update the compatible strings to use the correct SOM names as described
> in the hardware documentation:
> 
>   - hamoa-iot-som -> iq-x7181-evk-som
>   - purwa-iot-som -> iq-x5121-evk-som
> 
> This aligns the DT compatible strings with the official product naming
> and documentation.

These are already released, so marketing reasons are not enough to
change the ABI.

Best regards,
Krzysztof

