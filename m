Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13603CB2EA;
	Wed, 15 Apr 2026 08:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240382; cv=none; b=uVhCF27bjxUcPCwYRngTDumEJ3kCJoDJULgzjLSS/2EtGO0yQKZV5H7CJwHzCPHnUdeCcimPPkynAMvMb7CZ7nOBpma3zFxard3v6jmklAdDwive94op1AW8AyBm5BTSts8g49ZcGvx+rCgkMnH8wei986fEkdNpBQJZy61Gf/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240382; c=relaxed/simple;
	bh=MSJUysqVgt1QUFc7uq+PpRAh/iOmjbKOQGfVXqW2iGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bn8NuutgkXSbRQ8G2Oy4G3vuOuhrOJZZuXPvq8K+y2R5QAge51KkZNjA3T/iB3dvd0onR/HPsvhMhNbS+XHw3INVH4oHkQBOoqnnBMDB8J/G4iBOkUuqlO7QVxCkWgppzGfBPtZub7+/FZB4AXRAH8n+j/hXswNZ3gVxzbhFQWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nri/vLHG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nri/vLHG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14785C19424;
	Wed, 15 Apr 2026 08:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776240381;
	bh=MSJUysqVgt1QUFc7uq+PpRAh/iOmjbKOQGfVXqW2iGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nri/vLHGbGnwm6HJFES4MIwV+2lYUglPI6smarMNGpx5Fm+iQQI4QyN368R19Zl7N
	 GciIs+1dMlIduO6Dmh9OO0wcLOel4ZROmLkgN1sJHAjLDmaBNEyt9pzf3epGRuMUHd
	 PzbzteNS4GGoaWNLxOsZpmNkwW4gnXJpe3Ot63JbBIMc07JfRDqWjiB22veA/O1GxY
	 DRag8tiyI7qdBEE9tcYKQ7we+kd6d6ITXOrzCXRJJwty6Bok9xQ0nF7lFVNXTb6/Cm
	 7WE0QKUnzeJEYM+8RvFz2oLIzT0xzi1xZYvnJcVJ3ORajDqdkg1WvlrfIE9r264HRE
	 LrtRMfuGZVr0A==
Date: Wed, 15 Apr 2026 10:06:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Gene Chen <gene_chen@richtek.com>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] regulator: dt-bindings: mt6360: add buck regulator
 supplies
Message-ID: <20260415-spiritual-sloppy-sidewinder-2d394c@quoll>
References: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
 <20260414-mtk-g1200-pmic-cleanup-v1-1-2a7193ed4e93@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414-mtk-g1200-pmic-cleanup-v1-1-2a7193ed4e93@collabora.com>

On Tue, Apr 14, 2026 at 01:44:10PM +0200, Louis-Alexis Eyraud wrote:
> MT6360 PMIC provides 2 buck and 6 ldo regulators, that have each one a
> separate supply.
> Currently, the supplies for the ldo regulators are described in the
> dt-bindings but the ones for the buck regulators are not.
> 
> Add the descriptions for these missing supplies.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

