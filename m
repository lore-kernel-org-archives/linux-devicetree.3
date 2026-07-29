Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06EA456DF5;
	Wed, 29 Jul 2026 10:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322021; cv=none; b=LcQBrSu2CMhsrlY5AoE3tWZRxqtKgt3wX+jPmcyEKzlQCLjk/b+J4xCqZgZpeFkfIo0r8NW2ozW4hmfABF4lO4pZ+RKbIA5v/1KfHsR7/OMeNtd2NbyY3L5JqfW+p3h/yh8GX+Y3K7vN0oX7aztem3qE+N+EY65ARsp9Iq2wxjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322021; c=relaxed/simple;
	bh=+zbMpoSvO5dTmigMgM9Zh8HIUefj9z0gzcu7rVUTGP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lWwas9oGxXW9+keX2xqEFG6R81/ZVGhsA0SStGxtqnHWk1LLMygcnq2Vdzxk4+oYiNiKjtY9GIenrf3GZYi9uB/XYNOcFr+0UDgAVn+oA2RGsfHaTDfcYW9d/ngb6PIYnPJhHRbTZ2i0vq68T+jtv+BWHLo0SOg8DZYdYUyRgW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRhIwXZb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRhIwXZb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983221F000E9;
	Wed, 29 Jul 2026 10:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785322016;
	bh=74Z/uXvJDOwbv6KZf1czBU8bA7PuO4+gnSVtPQO+r3s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DRhIwXZbEjlna4C/Bj7/DekTL8tunvYtKfPsIY9/FBrSVvp16c9IlThNwkYCRa5BB
	 gRArv3UoSIne72o4IHAhzakzyj2KPma91xr/YeSRm1P1Pi+sNFDt7PFVj5JxzqlSLj
	 C7ckO1f+SLdusk+l3KjqlzXkrn0NfNSnqSHE/c5h6IhlO10EzdWHKijQ+kHjz9rzvs
	 qbfc5KDCp2OMzoKxOhoF/aSFg/xZeVSdHJvA1KhD5MyzcyxzNdW/N6sRSda9/4b6GF
	 rateMBepVyiffZ5xEEg/EczAMfieXjCtBDMV1iPcslG8OvG8fYKHvAceZe6/aB7RUz
	 c9veo2Vd5BP5w==
Message-ID: <8dd0680a-901a-465e-898d-88a17a9a71a4@kernel.org>
Date: Wed, 29 Jul 2026 12:46:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: hamoa: Number usb_2 HS port and
 add M.2 endpoint stubs
To: Wei Deng <wei.deng@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
 shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
 xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
 <20260729-hamoa-m2-dts-v2-v3-1-4d7ef9274575@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20260729-hamoa-m2-dts-v2-v3-1-4d7ef9274575@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/29/26 12:27 PM, Wei Deng wrote:
> Number the existing High-Speed data bus port of the usb_2 DWC3
> controller as port@0, consistent with the snps,dwc3 binding convention.
> 
> Also add an empty port@1 endpoint stub (usb_2_m2_ep) for the USB 2.0
> interface to M.2 peripherals, and an empty UART endpoint stub
> (uart14_ep) in the uart14 serial controller, so that board DTS files
> can reference these labels directly without re-entering the port
> hierarchy.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

[...]

> -			port {
> -				usb_2_dwc3_hs: endpoint {
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_2_dwc3_hs: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_2_m2_ep: endpoint {
> +					};

What? Why?

1. what's wrong with assigning the existing endpoint to the m2 graph?
2. this breaks bindings - port@1 is supposed to represent the superspeed
   connection
3. why would we have two endpoints for the same physical HS connection?

Konrad
