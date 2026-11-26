Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795734994;
	b=Uri8jrsszsszonuJ+E/RnqlrN2SoRkIEgPrAVEc2JHuWBDQ/XJsCoXsw5O8BeNklZ0r4
	 qKbXbzWXXNqFzGpFOPaOkcj6lVpYsQcaQvIZ2xCECLY8xbTkx/87c4nXS1elo46bztqk1
	 F7hAKqh0bvBKVQ8uKMHamWQWmS/2+inVY/dLxch8Vu+QHK+ME/udWAQlUbOLw+a8ckkwL
	 BeuQRmXwE2Wfu/rmY/t7wNjKOeg2+GMui2nuqtN2ZsfIUbJ2AZdbk6YgAb/NL8bxuH67V
	 cj4X9JxgUEMOlzBikFcM2SUDkKpmsr8ohwrWzSrLYvIavELQpJydr1Nqul4X3ecJpVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795734994;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WuZ27z0xovqUdABOavKvYadEvNB5Oq4EByhTvKg8Q7A=;
	b=gPNUdRE3rAKsucuZtYQNdaQFdvr+MVfp9kBlexLUVEb/p7lqRN0Q0FyOd4Zg96Wc69mF
	 r7FdlpVUipk5G0sqMLmgI8R46zJCvnCVXS9SZDsBJwJzTxPTU+6/TWIb1z+Cr8Mt/3FOj
	 pvt49RrVkN5AfyzfXWaUMsK5GaLPeBTeZkwJAoIStuHfuh8vd9GDjDhtczOvqVIImmcyN
	 K570P56X6VzdGopfRYyyA5YWZqh1got6A2utwWWjTRkNwGwmf+we4AzXgIci44s+gG/PA
	 tnUzSXa43b2b3KiGgGBhVYksXsY1utwtzb95wx2mhS6t2nVX9n3vKijizXhuQaLpUmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ouwWjCaY;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906C6606A321;
	Thu, 26 Nov 2026 23:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 906C6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ouwWjCaY
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16FE01A2D;
	Thu, 26 Nov 2026 15:16:28 -0800 (PST)
Received: from [10.43.3.73] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDB783F632;
	Thu, 26 Nov 2026 15:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795734990; bh=CYKtMaEtkCcjimtyMBfEwa8SM8OpN01EJ3Gl7DRXMis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ouwWjCaYfGWDpbcqfFTeIwlm3DfC6T694qEKiNs8bdsaHqD4MbGy6MvdDm7UNCO3I
	 NU15zQok5gZ45ugb2Qv4Ii6FofEOxC9hdpbkUk3aPSp+YkgX+t2hhkp8h3r8giZyPf
	 l7OxqwwcfFo4ZI85tbV5ac0aIE0CYonlKtE7rQzg=
Message-ID: <b47222b9-4362-441a-a885-703aa8d3dd6a@arm.com>
Date: Thu, 26 Nov 2026 23:16:24 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] dt-bindings: arm: sunxi: document Radxa Cubie A7A,
 A7S and A7Z
To: Enzo Adriano <enzo.adriano.code@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Cristian Filipescu <filipescu.cristian@gmail.com>,
 Norman Herms <dockseed@proton.me>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-1@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/26/26 21:35, Enzo Adriano wrote:
> Document the Radxa Cubie A7A, A7S and A7Z with their Allwinner A733
> SoC compatible.
 > The initial device trees for all three boards are> ready to use these 
entries.

Not sure what this sentence is supposed to mean. Please look at other 
commit messages for that file to see what should be in here.

> Radxa's Linux 5.15 A7A DTS already uses the same compatible pair.

That's irrelevant, please drop.

> Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9

Please no links to dodgy vendor patches.

> Link: https://lore.kernel.org/r/20261111134919.90264-2-vinicius.eduardo.pedrosa@gmail.com
> Co-developed-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>

The patch itself looks fine, thanks for putting them all together.
With the commit message fixed:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> Changes since v5:
> - Fold in the A7Z compatible from Vinicius's binding patch.
> - Drop Alexander's Reviewed-by, which covered the A7S entry alone.
>    Krzysztof acked the A7S and A7Z entries separately. Leave the Acked-by
>    off the combined patch since it also includes the A7A entry.
> 
>   Documentation/devicetree/bindings/arm/sunxi.yaml | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 7da84e2de748..7a7f96f21f57 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -857,6 +857,21 @@ properties:
>             - const: radxa,cubie-a5e
>             - const: allwinner,sun55i-a527
>   
> +      - description: Radxa Cubie A7A
> +        items:
> +          - const: radxa,cubie-a7a
> +          - const: allwinner,sun60i-a733
> +
> +      - description: Radxa Cubie A7S
> +        items:
> +          - const: radxa,cubie-a7s
> +          - const: allwinner,sun60i-a733
> +
> +      - description: Radxa Cubie A7Z
> +        items:
> +          - const: radxa,cubie-a7z
> +          - const: allwinner,sun60i-a733
> +
>         - description: Remix Mini PC
>           items:
>             - const: jide,remix-mini-pc

