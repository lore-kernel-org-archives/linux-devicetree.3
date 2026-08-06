Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1059A3033FB;
	Thu,  6 Aug 2026 08:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786003506; cv=none; b=t+AEjvZarwz7oAFTDW5wkodFsdKXGQ2PkWOXHFW5JlYoaPFsQziUZjBu79rPSUzn3Y+717/nUfA3S0ugSrFBSYXcioMv2b6XoWEpoRh8JT8OBSbkkWOp6GwARWBXvsdtHnA2wM/0jS+WTgDZ023ANNnphIRa+NSdtwxwHEH+a9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786003506; c=relaxed/simple;
	bh=4KWQHoL5+rSbXn+UpnIdj8hoktkcddXrOLykFml7kGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnnJL6aqZxsBZmilwklBpyYWsW25GcurKUn2Cgslqya/FhwiamfdNum0ZSf4ec8VfrIi0V1dwxJIWdrR1LcjEVzSWiqbmnkdPaibiKF/nUIOw12iP3uQRsosc3b7tS/xJkVE3QIHSoP2qUN4XVuw0sJLgF1EHwfVqWlcAVm13K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTq/jvqM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTq/jvqM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C7E1F000E9;
	Thu,  6 Aug 2026 08:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786003504;
	bh=XfQvgRfl7wqQjJ5CVHhdNguT8+WuejQa1yZhxYKOG7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WTq/jvqMBnpig0fWyI1nWdYp5n7Rr4my8R7F0SLIAhj1UKax7W5TiCCvqsxEOrYp5
	 OriMML/qJPD3ZvP67HDyrIAGnIH7qKEnvK9Vyd+1ejF5qsV7UEnI8kS76XOXuPsDyN
	 kR2qTNgcHVtnguGGG6tNEc2C6A35reTdU4o48AvHTdfPFJZhoiYolDkQN6mSxWvmZk
	 eF9QrspcbMbzhFPZD32AtvE2xis9oX8cxUMxa5aWY+Ybbjp65J+ngSzPbbraEuBuop
	 v7bFv0adCNj2k7w5pXHlF3Teh2cqrBMzCkBATJjMcJilStgqjtOYCga5koz+1uq84h
	 m7ut8wMH3PN/A==
Date: Thu, 6 Aug 2026 10:05:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v3 3/4] dt-bindings: arm: qcom: Add Advantech SOM-DB5830
Message-ID: <20260806-notorious-strategic-mongrel-15506d@quoll>
References: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
 <20260805-hamoa-come-v3-v3-3-20463c43eae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805-hamoa-come-v3-v3-3-20463c43eae1@oss.qualcomm.com>

On Wed, Aug 05, 2026 at 06:30:02PM +0800, Yuanjie Yang wrote:
> Document the device tree binding for the Advantech SOM-DB5830 board based
> on the Qualcomm X1E80100 SoC.
> 
> The platform consists of an Advantech SOM-6820 system-on-module (SoM)
> mounted on an Advantech SOM-DB5830 carrier board. The SOM integrates an
> IQ X7181 EVK SiP containing the Qualcomm X1E80100 SoC and its supporting
> components.
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

