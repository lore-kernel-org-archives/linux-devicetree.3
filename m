Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E0642903B;
	Wed, 19 Aug 2026 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132201; cv=none; b=hm7fdUjz1iw76vN1RpPQgAN3V1d8aGV4EsrcBGDXWyIz6LQpB6adGWHPqWnz7bUEIUD+yjlJdSjr1KG3LKCmRamYReyQpx7V5AGj25URbUMl8N7weDKH2PUXTpPxRaKub/VR9PoryPrh24pFvZ0DxF4qDzChkuhxhDRDNFft4MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132201; c=relaxed/simple;
	bh=n3svRHK30rbdPZYNMQk4VRWvQVMSgMMIFJlr2bc1cLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mj5/E1xvw/LPUuapGcPXNgGc3KDN9Y8BSjEqJ+mrJrLm8P5n+QtmXW1yu72nnm76VICCJl1q0RQwQT2i1iSxsV2n9Y9cTtc8JxCC1MjMyxnKs4dGN7mUkao64P4lPhppHeaQJD2uMth6nM2rf67q43HVWIVkz1tGbWd0w7nO6p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8dz3S0V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8dz3S0V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F97A1F000E9;
	Wed, 19 Aug 2026 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787132200;
	bh=hJWLscFbRVLDGktGgLo+Xlm0YKCnH9hz5ghN5J5orY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f8dz3S0VMnruc+gb612jUTlaOz6tc2uV8SRZTsuaCPJZd0A+EQCMPV+Bdh/B8hKh2
	 LvvsGkJSi7tqSYtabV0ffD2hrWc3zdVyfuNi8NrBGkZRnyRgLmORThfYxi92fqTOOg
	 udQF1e3zw7Df3oeha2cBnW6Lg24Unv1kmi3qHvxNdCT4o2iXtMNgqXQHgArdZ9+32+
	 62wc4OhX3VQohm7Is0qnTpD9M00oqwNlGHyygL8R+kiLd1ra//okEKEE+uWt2QgWw2
	 mnf/QomY3Gh7a46nABlOWsaDeifbl5anO976kg4lfIwu5nGcV+fHJB6Nln/yq3MZxP
	 lP+MXI3KvFM6g==
Date: Wed, 19 Aug 2026 11:36:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "GUO Ren (XuanTie)" <guoren@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: vendor-prefixes: Add Xuantie
 Semiconductor
Message-ID: <20260819-invincible-skua-of-defiance-bbb3b6@quoll>
References: <20260817-xt_vendor_v2-v2-1-8d4eed65a533@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817-xt_vendor_v2-v2-1-8d4eed65a533@kernel.org>

On Mon, Aug 17, 2026 at 09:46:39AM +0000, GUO Ren (XuanTie) wrote:
> Add the xuantie vendor prefix for Shanghai Xuantie Semiconductor
> Technology Co., Ltd., which provides the XuanTie processor IP.
> 
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> ---
> Add xuantie as the vendor prefix for Shanghai Xuantie Semiconductor
> Technology Co., Ltd.
> 
> The vendor information is available from the Xuantie declaration
> page [1].
> 
> [1] https://www.xrvm.com/declaration
> 
> Changelog
> V2:
>  - Remove "Add Xuantie C906/C908/C910/C920 compatibles"
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

There was v2 of this and I already replied to it.

Anyway, this without user makes no sense. Post your bindings WITH users.

Best regards,
Krzysztof

