Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D98036CDF8;
	Fri, 12 Jun 2026 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254929; cv=none; b=IJC7E4Rj5buV4znDGiyy57tH6afFRgJwaK+fyQZZoB1lgRGRZ/fTvSfhLeixkKgSFpOpWlsqpKO2/Dh0B+3TYLCdNf9bU6a7C3NyC/yBcvMLVnKtDuxuBu9Uw1S0lDiVI79spt6k+nJenww5sqqIbZiOP3AylEWGC4ekaPhgT4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254929; c=relaxed/simple;
	bh=tu2xAk5qFbJG2QKRAEJmp1lC67rd9ceLoy9+wQLguac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIGYxQZeWdsX/TDYQ98LO0uiiCGR2WJS2u4gj9w4jZwFXDW9G79MNHWz8Il5hqhahWZdQAREtNSpfNnUkpz61S4ZpknoIfMp3Jjd7z0OoFgd5YGmRtTM3dxYxd9FMooi4DraL00Lrb68S8qdEQTt0b7msf0FEpOi/gZaBEAhC0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuIi4zux; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuIi4zux"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E801F000E9;
	Fri, 12 Jun 2026 09:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781254926;
	bh=aeOylT+eihs6gL2pjmAS512uSbrIDD/DuZ/cRWHkn68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nuIi4zuxSVI0XBk5SI13iIqnlhqWnn5fdDqBkugHXLa8XgkT7LbqBKPaiaCMiQbbz
	 DS0xKndqAwrHchrPWnDJFmdL4kdOEgwjkCkhR2z7T/RwaHzUXK2fABbl3qaVRHJW6a
	 x1C3THWvDNpITh3M+csrq7+2gBQQp4XpnZPTKHxspi7OREdf0mmh92B/DUsXFSqGwW
	 PhYYrd0D4IhDPfQhFNhCsTgHYuEsDywP6IDQuQZoi6bNsQ2VN6e9JEQrRRSoSRUU8+
	 Zb+QMle9P7pxFMk5Fvs+KrYPs03RXKVOOLqVXTRfjxhCiJTBZy2nM+3AFKmstfO3HE
	 k5FLmGC5CwQTw==
Date: Fri, 12 Jun 2026 11:02:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] regulator: dt-bindings:
 qcom,sdm845-refgen-regulator: Document IPQ9650
Message-ID: <20260612-blazing-brainy-firefly-d77a6b@quoll>
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
 <20260611-ipq9650_refgen-v2-2-d96a91d5b99e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260611-ipq9650_refgen-v2-2-d96a91d5b99e@oss.qualcomm.com>

On Thu, Jun 11, 2026 at 02:33:17PM +0530, Kathiravan Thirumoorthy wrote:
> IPQ9650 has two REFGEN blocks which provide reference current to the PCIe,
> USB and UNIPHY PHYs. Unlike other supported platforms, IPQ9650 requires the
> REFGEN clocks to be enabled explicitly.
> 
> Document the IPQ9650 compatible and the required clocks for it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


You just ignored feedback... From me and Sashiko.

So you got the same comments.

Best regards,
Krzysztof

