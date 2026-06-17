Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8304F38331E;
	Wed, 17 Jun 2026 07:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679678; cv=none; b=rW/fqpzqiZ6XMSRc0BvjlXkf3S8TMs4fu5ezy8HAWHaTlX5OXDNsURaCuxbnY1C4pNG+qzZticexu8VPCzbCAFJ0Cr5jweF/TWkNbM0qoSJ7Yg0CUYpaR7kTtbgoPtDdb7tKRYzjIfv9HmUKapjAiAzxldvcVqsgFCOnBbIYZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679678; c=relaxed/simple;
	bh=MOsWgoE/r24tOgeMG5RWIafjJ8WGwXz4VBP1cvLOT58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hK84IblRCGkYSA20EeV1LCcfFW69MX82LaR7hjrgI2y9W8/iQiR4auPwJ/vnn/1B+1LYYRFInmRdmxhzxFBrWNIHvhf5E/N8OxQzyisPPoz5QcX+bCGtavKc0mmetqHsmSVyE9RsJBMMjiUa9ulpGCkTV0xdyCoU/sFlhAqzjF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFt2Onba; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFt2Onba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6D71F000E9;
	Wed, 17 Jun 2026 07:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781679677;
	bh=5cP3ZjuvlgY3MK0mjyMxLKDOV5/e/Yce0WqJYxlF6L8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YFt2Onbae9dFb0xLVhdVNSyCawe/a+3kWd1G2fyWPTVi60Os9MIei9k6zQWONwCx8
	 UOm4FuTTSSoal7O45nKRnYyAlqnC9u4zFUfU3nFH0Hx+54e8XMiHWFpnDnmNdFtBa5
	 l9hI/XdkdX50Z/D0m7B/jdbccP5mSPrw4dvHgFwJPNnAru4jAGjxpOcjE11nARuufJ
	 LPRTr2ouwZL2THdEVAeC4wtvMZ/cqE3bhE7RamDdh5w20ywuq4yJHG7IPYbfaZdGWg
	 vx4/rKEExwjOBCGtFvNbyqhtwwWZ7VLm7QoPF5wCpj/KGRUmkAnvjwJRe3YsrQxqkY
	 OSH45Axt8toYw==
Date: Wed, 17 Jun 2026 09:01:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Message-ID: <20260617-musical-trogon-of-conversion-cabea0@quoll>
References: <20260616-pcie-phy-v4-0-504677c3d727@oss.qualcomm.com>
 <20260616-pcie-phy-v4-1-504677c3d727@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616-pcie-phy-v4-1-504677c3d727@oss.qualcomm.com>

On Tue, Jun 16, 2026 at 10:34:41AM +0530, Varadarajan Narayanan wrote:
> The ipq5210 has one dual lane and one single lane PCIe phy.
> 
> The dual lane phy is similar to the dual lane phy present in ipq9574. Hence
> qcom,ipq5210-qmp-gen3x2-pcie-phy is documented with ipq9574's dual lane phy
> as fallback compatible.
> 
> The single lane phy (qcom,ipq5210-qmp-gen3x1-pcie-phy) is documented as
> specific compatible as it uses a combination of its own initialization
> tables and some of the existing tables.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

