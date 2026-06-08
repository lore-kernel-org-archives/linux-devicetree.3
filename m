Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD45B4C81;
	Mon,  8 Jun 2026 20:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949095; cv=none; b=NHgGGnorEpIPt019QbIJbmkC7BJvODH76+/yZw+WmzFKNjzvLhPkJgO3NKo9Iz31qQOta/Sa1bHYdLS7Rcj65ODHM93sDOKJ4RXhhyDvEHIlbFSElxmKYwlbKpM4Nf4+9sojwtgyQ+j81bho0e6Y2ewqCR7PIsjE9UBs/l5NdEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949095; c=relaxed/simple;
	bh=eHsJ2NpTViD+qESyRQDjv7UDJDg/EGyflH3yf6RtWcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OY50c3O6IyqUJTxX6p46EQ+m9MLFrgIS78C1cg7oMHxtxX8OYT0cjgacjyCRotGRcmAtuLHh1k+gvUjI+HRfeOIN6qNZLGZaO7YPs8Mm16HKOg7SmL2wyRhwXrjaDBUqs3KJzLpppoarZXLX4d3ODWJDpCcOmiOzXWacezRyepk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbTtcTbC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbTtcTbC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E16A1F00898;
	Mon,  8 Jun 2026 20:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949094;
	bh=D5NzKS0xhmGk+JRUCJkpcxI6S6sOuzdQ8mS1ZEWHGcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cbTtcTbChXSDQ1nlyUoglIUAL+t4T9t2iwwWZM+F49hrrjJfdddqIv416cP/4TjH6
	 0V5EGx4IXOYhCFLimJvUBsZSJwzPSrvKSQb6VZAwgpAIil9jWHPTSkwXz0QQ1mOb5m
	 RaARMPMd9BfgFzTWH5NRnwRq57thsGqCFPyczLrVs6hL1VoZ1kHbp81CpIvOvWzqQB
	 3534xRhk1VFTtXy1Lnxy8e/lXTFuC3fjxKEBmW+VNK/s/IbtO4GRkKfrDiwAG5fDet
	 pRIvSKTutaOmAFw/hFfITNKdbYMiRBPP5z1fH3+SkM+knEkrrTA5hEhZOU/YKFkLQM
	 omy/ecPtueHsg==
Date: Mon, 8 Jun 2026 22:04:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_wcheng@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom,qusb2: Document IPQ5210
 compatible
Message-ID: <20260608-hallowed-labrador-of-acceptance-bcf2cc@quoll>
References: <20260608103344.2740174-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260608103344.2740174-2-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608103344.2740174-2-varadarajan.narayanan@oss.qualcomm.com>

On Mon, Jun 08, 2026 at 04:03:43PM +0530, Varadarajan Narayanan wrote:
> Document the QUSB2 PHY compatible for the IPQ5210 SoC. The IPQ5210 PHY is
> compatible with the IPQ6018 QUSB2 PHY, so allow it to use
> qcom,ipq6018-qusb2-phy as the fallback compatible.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

