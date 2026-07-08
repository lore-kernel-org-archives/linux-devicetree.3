Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4491E3EB801;
	Wed,  8 Jul 2026 06:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493909; cv=none; b=XSG5MWgsxWPkPNO7H0qkpsxsj9QUqisx4zWb9mU3PaEQ5gIAKNl2L6KCJNxEk5ENUlmAgAuXBsFcR/uCtMCK8qPQ168zUy5j9owp42+ZUahXdXgPz2c2n3WxdoWx2coB1Z414OlVA400Y27EhAAYyEgOeaPckWbkI116qcx2ZPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493909; c=relaxed/simple;
	bh=ldfmY/Y+yI1wfCJwB9atGu1Zvo/0qC5p6vHO8Iy9DU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEeY/aCpgPn9c9t4a8pUyEBd4HqYEa7sukbpY1MTpm1CIg5pt6KNY6ZMTfuIrPzVV14MhE7m20hTYh7IhQ7BBPaFsqmjX+vQUAhkSSnXAFdUc7RsXs0me4LlpOwhi8Kbtqq+20cOfg2GJhsUyA7A4FW7hTL6vky+LrjiuL/Jf18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHSD+LRB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHSD+LRB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB0E1F000E9;
	Wed,  8 Jul 2026 06:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783493900;
	bh=a/4YSUUfuB30Su8UlrWbkyIcLZU/UfOyniL5vbZUaJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dHSD+LRB+UXtfMJR+uSFaC41V9w+Ejj78NN03o1vwRDs6T+YeEh/RgEMIYLbHAKmk
	 iYjVHZvIT/ZTca+6HDYuCnV6Id3QE7sbs/nehRvhSAlip3KStpC7IJP89kMhAeMczx
	 jrP9AyxOAMmTcfBmin51o8/L1NthBEtb5GNvcTTn7nxvsYdAwS0ZbHgP9RrXp7e6ez
	 lha6sId9crEWTMQhzQmTWewurpnIGpKfzRV0NmWfaTVWmmjdadyZspBsqUq31uS7Zh
	 ICJUjbt/oHINXeF2oeZJdsODqLDo01Ede0tN73pCOJzUnoPZW6xiWclnDqRUiH43ME
	 s+3L/3qPbXdog==
Date: Wed, 8 Jul 2026 08:58:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, daniel.baluta@nxp.com, simona.toaca@nxp.com, 
	goledhruva@gmail.com, m-chawdhry@ti.com
Subject: Re: [PATCH v2 1/5] dt-bindings: soc: ti: Convert DSP to DT schema
Message-ID: <20260708-ultra-starfish-of-tornado-0bcee8@quoll>
References: <20260706085917.835875-1-egbostina@gmail.com>
 <20260706085917.835875-2-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706085917.835875-2-egbostina@gmail.com>

On Mon, Jul 06, 2026 at 08:59:13AM +0000, Eduard Bostina wrote:
> Convert the Texas Instruments DSP bindings to DT schema.
> 
> During the conversion, the following updates were made:
> - Moved the binding to bindings/soc/ti/
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../devicetree/bindings/arm/omap/dsp.txt      | 14 --------
>  .../bindings/soc/ti/ti,omap3-c64.yaml         | 32 +++++++++++++++++++
>  2 files changed, 32 insertions(+), 14 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/omap/dsp.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,omap3-c64.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

