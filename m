Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0E937F8B1;
	Tue,  5 May 2026 10:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978119; cv=none; b=RSk2RgYDdzAWFj+VEofux8eEzpH7qE27EbMwsdegzam801gDKE1VUgdPeafuR/Y7jf7VqU1QIG6D+95Ln6cGdJAvDwQUKn3zKU5sPHXJko/K3bjrClCUjF+mLcwXPcGa4hfyZXOyI6goEgp70H8DvkRHBO4djGtoaQc58xuNBcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978119; c=relaxed/simple;
	bh=k8wxVOeIqz80WLZwC1r+QJNmKJWrY7Q9ApKvYiR8V58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoZLmZYqoMczHZYHYoaZjPmmAeWt1IUSz4oi5OAd/cAqif7xzVHl3xLscWVvzAMdFEXjN/rhdXW8BVdadqhDRYXoXqL900dfTXECsyrYLMPkrLBsstJSwKYOd1W4BrIK3hlEFmNSKs67cbKxKy35Dbtrj54hGZ/9x2DfPMQV8Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdEu0Okv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdEu0Okv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA45EC2BCB4;
	Tue,  5 May 2026 10:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777978119;
	bh=k8wxVOeIqz80WLZwC1r+QJNmKJWrY7Q9ApKvYiR8V58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gdEu0Okv8KAq+vMmxhT2whlVNE4DPIR43AErGtOblFB92fokuogyc4EBWQ9m6Dwmo
	 DExwd+9VdJIv59EG7Kvk9P0Qq+lXD+iCjbjRsGbQxYRtUtILtXASG/RJ+LWKj8JlML
	 +8LNUPFJLdg+ySo1PaTcd7kRDWpVzeszhv/6RHf7p9bRY10joZeAi1Yo3lbTTU3xAc
	 iaNbvNWtMDha9DivrGAGcUsXQRV+i7HUlhfibqRN3COdrtKpEWia/fw7bAKWF+jnt/
	 9eVszCPocAa4OuPvoy0jJvelHXG3MdgmjEPKHR3wJTqgGvQIiUANnlMB6WWovB0Ft3
	 xHxVDTHscIrbw==
Date: Tue, 5 May 2026 12:48:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, Johan Hovold <johan+linaro@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy
 for Shikra
Message-ID: <20260505-gifted-bulldog-of-opportunity-34dfc1@quoll>
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-2-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504170659.282532-2-krishna.kurapati@oss.qualcomm.com>

On Mon, May 04, 2026 at 10:36:56PM +0530, Krishna Kurapati wrote:
> Update dt-bindings to add Shikra to QUSB2 Phy list. Shikra SoC
> has two High Speed QUSB2 Phys.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

