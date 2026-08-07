Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0590D41D129;
	Fri,  7 Aug 2026 22:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786141936; cv=none; b=HdgXBMqbwekX9TmcDEoZ9TGTDZpmVCQDHAse1kpNN1j2nqR15T+9S7uqB0NRkxTIJqKBB2wXIfv+FESdqtBlAmjcK0IUJY1hXoErjJcYR9ybsln6gsphItrySnqY2zp57phyv7Gz16tPmxR6aCAWX3qPyVYt8AT2oSGdgltfrxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786141936; c=relaxed/simple;
	bh=fJ+FPLbkmdiIgk+937hJhQx3G4f/UfqMK2BKu20WumA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACE0ZGkBv3JhmJY9+cdzr9IAXgNc74ZTd7BcP6Bydazu2ntGmUgr9J0CkH8C1s+NI17wH4YSlpl8/MG2ddKcI5f4Fhf9M7zBKt82q875H6sFfreaAOSrZu8injRmrEILYWb8G/50Ruq/f1SHtA/7OT31+Q1D9AbM9Wg8zi97Bxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfszCiUU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfszCiUU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799801F000E9;
	Fri,  7 Aug 2026 22:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786141934;
	bh=UUcsMklZ1YJdf4MNkh3FRF0YeSfAuEHDm6BH8azZORU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kfszCiUURm5A7BQtkQ1Tcq6znQSSEg6G0nSHVrYZPHVxbRnfmpe67uWg1gy+6Lgxm
	 TUuC/VdfvIS3t26/YqFx+Zq19eCJB4ZRjCuyIvvyzY0HW9YoHcT9E2pLqg1J/v+gw6
	 Mdsbssud3xTV3xxSU7v4p3P7UFl/8agHo7QmXJHBJsaHKPZk0Nmwu6hXMMCDOVNHfw
	 2kWhIn9j1BO4CWlbV4X+0CEzCIklctWVQWAIDRoSpoPSqe8y9qCZcJcvPBUaegZ7Qn
	 ycLMublzzAJTVAuViy1otGlpGycnsMxgoYIUQaPsuZEgEPlq3KF0y0JaOCmcvR3mje
	 vkayScuiBl9Ww==
Date: Fri, 7 Aug 2026 17:32:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Lala Lin <lala.lin@mediatek.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: nvmem: mediatek: efuse: add mt6572
Message-ID: <178614193264.2164781.3666261236764063936.robh@kernel.org>
References: <20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com>
 <20260724-6572-nvmem-v2-1-e58d16a29621@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-6572-nvmem-v2-1-e58d16a29621@protonmail.com>


On Fri, 24 Jul 2026 14:07:06 +0300, Roman Vivchar wrote:
> Add a compatible string for the mt6572 SoC efuse controller.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

