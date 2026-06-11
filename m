Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2051D36A379;
	Thu, 11 Jun 2026 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166074; cv=none; b=sZ1OIWD4TApyVO4sqrMPCgWYJOq6tJTUsk+A7YOMEE8pW1YOUqxvs/f4kHDYhkSqG3tT5bwQhvFZvTLHPgz9gVuQCWJONX1Kglyy+vzqjHSlGr5JpIXG4LXY+vScPSMkaGhC8/fH4mYKHxvtcpGIELisg0WY2w7t6CUM0ZCbvio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166074; c=relaxed/simple;
	bh=91gjGVVSU9JFe8AqrAREfPhygEBgdMFA5Qf8ZRola4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGpW2KcgKppLnUysYeqzfImuMGeIpMn69SGI42rv5H6L6JDEmH/XxOUXVkIAYgMKDLlJ9e1pKRlPXl8QusIw/eFZkeAjLD3bRg72xT5hsuRWQl3HD4E9iKMBgYaCF4nZM+fbRY3wJTevWQd3NbMKx1G5kSKSabm+mCki0infvHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jw71aTjJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jw71aTjJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A451F00898;
	Thu, 11 Jun 2026 08:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781166072;
	bh=8DystJi/J+n75a0MQ4yqnrjh1EgH4OWWf/1bAsAyNH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jw71aTjJhDfC7QwqT0B5242fX8E51Ivy391ILfKkqASbppqVlWlaheOp/8lwa+q0b
	 LxvHDC4M1Q7gB9q4XldQbZeB5IvNBt1opBmw5tr+U8SD96e6t1aZ5WLQcL3KEkXDOI
	 Dn6GOmpyFkiQa9e9347fwzAmQlbuVdrLMaO4SxF2N0OpDpDC+BVOnI89z5ziK/X0fq
	 Vhcwkc0rDnCyDm053+pUajXK2Ee/jQDFH9KudoiCILD+J2LwDtQ/W/n6hDZYsovNXV
	 K79EP5g1eF/iut5+wkq2mq+wpnOlIm24RHrCTa487rs4hoE/kx14wSezO+Ft30SMca
	 eWfet29E9t8Xw==
Date: Thu, 11 Jun 2026 10:21:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Message-ID: <20260611-talkative-formidable-fennec-ad135d@quoll>
References: <20260610-pcie-phy-v3-0-334011b378d6@oss.qualcomm.com>
 <20260610-pcie-phy-v3-1-334011b378d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610-pcie-phy-v3-1-334011b378d6@oss.qualcomm.com>

On Wed, Jun 10, 2026 at 04:46:08PM +0530, Varadarajan Narayanan wrote:
> Document the PCIe phys on the ipq5210 platform. The 2 lane phy uses the
> ipq9574 as fallback. The single lane phy is documented separately.

Drop

> 
> The ipq5210 has one dual lane and one single lane PCIe phy.
> 
> The dual lane phy is similar to the dual lane phy present in ipq9574. Hence
> qcom,ipq5210-qmp-gen3x2-pcie-phy is documented with ipq9574's dual lane phy
> as fallback compatible.

You are repeating the first paragraph.

> 
> The single lane phy (qcom,ipq5210-qmp-gen3x1-pcie-phy) is documented as
> specific compatible.

Because? I asked last time - do not repeat the diff. You explain here
why it is not using fallback.

Best regards,
Krzysztof

