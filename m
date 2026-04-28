Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1E422A4E9;
	Tue, 28 Apr 2026 06:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777357570; cv=none; b=CDhVUVkywDxpimGWdOc+vnJcpZi06oMJY/jq0Shgz6dE30P1nRwn4G80cB7DSA0hrkhuURhpHtTCIRVdzQj/E2hcxFOlpp2ItFSz17Of5koR4YJA8osyEPksHzYAFaNdlKZpihLHdouS4g0b09QjL4ZgQRmo0S5WPlSPReRhIUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777357570; c=relaxed/simple;
	bh=Cs0va9ksutkltfw/gfiQLgiE4WIPRepYv8o4zvP4pTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3hckZRMfhoK5aWJPAd6JtEsnC6Jrxe7ofmF6zljszvyPfc8COe2LWr6oLVoGfo44BRHeL9nysuCNoRVQEwI3G/0As3UeTwWo8pznseDXFMuqvVGywFum+g3si/ab9lYWtlmw9nGabPgHAju2AGVaTpQLQGm9OoV1dqfQVkQ6NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rk9r+wOG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rk9r+wOG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34ADC2BCAF;
	Tue, 28 Apr 2026 06:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777357570;
	bh=Cs0va9ksutkltfw/gfiQLgiE4WIPRepYv8o4zvP4pTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rk9r+wOGldHCWKoV3gZDP9RF3hwTmvN8ykTAcsATsiZU8b/Mcj814GM4viziTI/22
	 Y6v8iKEpQ2JP7L1L60iOuseFkFGqU7oj8p6G+Gci+MJFXUoEViKH1fCnrgY6tj9xbX
	 h5VGUVLJ+NWqXcE9+UKm5G7j3lY1gO3vSpgl6NcYgX35Qw+O5K9m/2D8eTE0u9/wkP
	 FuALcZtiWY5/dhpXI5XEd0hEygD5xqxqdaFYXW4u5caPbctuHTcFNe2v/eQzChRTqq
	 jxD4R7YtJs6blf7zNBhZ4EHMWqsg+XFcoITlkNjYh9QbUlRQ4cKQ8mLlI0eM5c/vlX
	 laScHgn7+FS6g==
Date: Tue, 28 Apr 2026 08:26:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: mtk20898 <zhengnan.chen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [RESEND,v2 1/2] dt-bindings: memory-controllers: mtk-smi: Add
 support for mt8189
Message-ID: <20260428-topaz-turtle-of-support-f5b9ec@quoll>
References: <20260427070444.20247-1-zhengnan.chen@mediatek.com>
 <20260427070444.20247-2-zhengnan.chen@mediatek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427070444.20247-2-zhengnan.chen@mediatek.com>

On Mon, Apr 27, 2026 at 03:04:28PM +0800, mtk20898 wrote:
>  properties:
>    compatible:
>      oneOf:
> @@ -40,6 +55,8 @@ properties:
>            - mediatek,mt8186-smi-common
>            - mediatek,mt8188-smi-common-vdo
>            - mediatek,mt8188-smi-common-vpp
> +          - mediatek,mt8189-smi-common
> +          - mediatek,mt8189-smi-sub-common
>            - mediatek,mt8192-smi-common
>            - mediatek,mt8195-smi-common-vdo
>            - mediatek,mt8195-smi-common-vpp
> @@ -108,19 +125,23 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - mediatek,mt8189-smi-sub-common
>                - mediatek,mt8195-smi-sub-common
>      then:
>        required:
>          - mediatek,smi
>        properties:
>          clocks:
> -          minItems: 3
> +          minItems: 2

Same problem as v2 before resend.

Please explain me how mt8195 requires three clocks. You can prove it by
trying a malformed DTS (past here the snippet/diff) and pasting here the
validation error.


Best regards,
Krzysztof

