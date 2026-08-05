Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFBC355057;
	Wed,  5 Aug 2026 21:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785964585; cv=none; b=g+zlzzyK5azGVUAsypPIXdsizmRPFd+Jeh9dhcgY/Lvwu3DSxJ1XwplCnM1Dily5ngEBsvXKR3KK2U/XiywaLknRf96W1nP48ONsUSe4te7JX1Wp3UXVYKW2hWeMzu10vlklHDznJf8ExF/1XbvYa5H2XOozQMhCxeH0JVqxq2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785964585; c=relaxed/simple;
	bh=y5/zlUnzS+NmhJldVLybMEPPspy5u7ElHIzvKXIveig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bray1wDlo8hOmqBxJHKP/DToqE7++sfy2MaU6HYX5j7JD6wPcVbu4mrkyIGP4e66BM2gWfHBXCz/YVSuI368eq4gtv00WzGBVoJXZUsaOXp9tJ5zG+pfqP9/aYml+ts21v0BdvUSEP1Sp0iziIcVR0p8JMrrtGfnkdK4uO7tmu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYvh5spa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYvh5spa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885991F000E9;
	Wed,  5 Aug 2026 21:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785964570;
	bh=qi6DaOHm8fU+Zc2dzygRVTocGyvXu5pObFA60wyLq6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aYvh5spa9bGgp1SVDTQhbA4J0tdbbaEC+avBx9eARGO7ik0Xpta/R//sLAVul+22W
	 bc19JMah5RhKxOg2fufX4ZPioFa0AFMwn0zr61zzNAIetJqU267cfTEhRY452rvzRg
	 06UhlCdC6k2LasomBpMOSUgk5xfCg/Vn2Bw4JouFSO9VruDMttoirE7wOKGDqzj+SP
	 oA14qm/bie/a7UVQ/XILl73Y20+GqubeHUTQZecW8At8plLV9IPYfNGD81AofBXdSW
	 YutVfJRXbTw+46YVvoClGnDCOlKufx+Ln6mcwrASTx53TWpmdGofWEv+AdIW6rWSt1
	 eBOjDd+Nx3M9A==
Date: Wed, 5 Aug 2026 16:16:09 -0500
From: Rob Herring <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Neanne <jerome.neanne@baylibre.com>,
	Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: regulator: ti,tps65219: Use generic
 power-controller schema
Message-ID: <20260805211609.GA1796517-robh@kernel.org>
References: <20260804-regulator-syspower-v1-0-b05af2081184@nxp.com>
 <20260804-regulator-syspower-v1-1-b05af2081184@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-regulator-syspower-v1-1-b05af2081184@nxp.com>

On Tue, Aug 04, 2026 at 10:37:52PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert the binding to use the generic power-controller schema instead by
> referencing power-controller.yaml and removing the local
> `system-power-controller` property definition.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/regulator/ti,tps65219.yaml | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

These need to wait a cycle. The dtschema dependency is not even in a 
release yet.

Rob
