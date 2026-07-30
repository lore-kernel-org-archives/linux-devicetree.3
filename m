Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A87536212D;
	Thu, 30 Jul 2026 06:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785392950; cv=none; b=UrddTXJIXp5nHdvwRQcgKD8J3m5+Fyd4RVTVAcT3TsFD9wUlXm95O2NJcnj/LmMMvDcaKaDBW72FfHIbugRBCKy1Cz/r79x8lS1Zwqd7K3eVY5gQgctGWik4wt9Qe9rbNhWqMrSRodBfNWuIHMBrWJ/hV3lOyJDeCGHvNF9+iD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785392950; c=relaxed/simple;
	bh=SihBfag8yk1DMcWJxTzkRszFCVT8AuUGby0CTAPrJw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQI+W7X6A7YWnb2O0OQRAJvB9YcPATc6MNf81LS81L5p0wxsqzto9htQ9yEhIQUAqiB/lNNt/FlMQMC50sFzOAgqbM0jrc4cF3Le/6EX0LMDUjU9xvbxfMK3UlM7VVpAWO76TfPODSeckgNhjj8A7uUS/Pj5G7unZNhPRivoENQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geLT90Tv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geLT90Tv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFA01F00A3D;
	Thu, 30 Jul 2026 06:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785392948;
	bh=e5nUPqOgBUcCps4UUa85WPqHhpCKC3YB8Bzpg7kK8Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=geLT90Tv+Y24wq1uH6GOtIrTXp+SnxrMMStS7FBAJzrKAf3j0BaJUxVX2s97hRgK8
	 lhkgwMpPXhtHBu2iDSJ2QX8OMEDiMuX8tEgddscmKaXa8ZQ7L9nv+2Xk6PjUMjKHAa
	 Mx8g8D8siScKIicdab4rJL/qbzmtjPLpLiLX93ZKXHX6oe6hSmDgn6luotXTmTczHA
	 nl/e9fRnmG/t5KGt4j/gHQ7Hzqdmw2S9rkEsUcuJfXhMuMW4h0AqALe1PQBSqzBIp8
	 4nAQ1eBDzVlbadOfua1kskcV8oLSif5xuX3vnWOOCjMiHNYtlLFI+tQzbF8EqVqlFU
	 X8Qw1sqq7MsRw==
Date: Thu, 30 Jul 2026 08:29:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alberto Robazza <robazza.alberto@proton.me>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Alberto Robazza <robazzalberto@gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: arm: amlogic: document Orbbec Zora
 P1 board compatible
Message-ID: <20260730-gainful-helpful-kiwi-90beaa@quoll>
References: <20260729175134.92909-1-robazzalberto@gmail.com>
 <20260729175134.92909-3-robazzalberto@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729175134.92909-3-robazzalberto@gmail.com>

On Wed, Jul 29, 2026 at 07:51:33PM +0200, Alberto Robazza wrote:
> Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
> which is based on the Amlogic A311D (Meson G12B) SoC
> 
> Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

