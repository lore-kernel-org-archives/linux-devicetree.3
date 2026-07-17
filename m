Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC61372EFB;
	Fri, 17 Jul 2026 19:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318380; cv=none; b=Q4evWhvOu7Fz+KXUprdZRkt5+vLdJP5+ENp/6c5wseubW/nKHXmhuhV2o795ksM6qXZxr+KQg0Lq1/TCjq5Y4OXXBFGuLtpGtl9ha/G1UriUD3TEGPX7nKlE9VTg4T/MAeqKNEeTxtNajxh3SPEYGVFeBumlH4zqx2LPGL6RDIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318380; c=relaxed/simple;
	bh=88+R/VQrWAwzxw1/lScsXDfAETd63wKvbLBVpcyiBEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjfbZZIxltZgDz/eEy4GVfZg2eHKQNBjkJ8+ghqJCSJ8MF6yRXuyDnxoVLpKwex/a5f/U2NGiGEWtyvO9FFimHv5SPq513k1FEMtm3jmwGVRgZN9ASI7AmD3CkuDU8pQptDCItlrxK49QVgT33qNQ4ctxgJbdd6sYyrSEKWBI+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJzp6IY2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJzp6IY2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745E31F000E9;
	Fri, 17 Jul 2026 19:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784318378;
	bh=FOQnC3ZR9kL0lGh3noW5T0qO8jgS2NrQL/DNGhgVjvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PJzp6IY2xeS9/4p2I7YmPYFltinaiR78ojdZX3I3uxLRrwHrUJmVLmFpdF07gqqc+
	 76Qc6yaDF2GfXvWOsgq/ifQFtiDRnji9DqLBJQwG8JG7x+phR2RwmOqtO4HhN8AIDm
	 V4q8qxUIj3l0YhVkCOBeKCLm90o+R7a0M62a52Zm34eUL1PGEiClayGv0goPEiSrJ0
	 nLq03cs2+6MBhHEwOV0EluGeGT9MRTW+DIKgGAR8PH5xWPrP9WmwKUvWLqNFWR+Aav
	 zzD3TmGknGXEucq1/6Xy/cz4Ok4e9uFrI92x+Y4mAhMsB/5TurTPF7zEAfhleLystX
	 3DGM2bJpEEkOg==
Date: Fri, 17 Jul 2026 14:59:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Felix Boucher <felix.boucher@savoirfairelinux.com>,
	David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>,
	linux-kernel@vger.kernel.org,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] dt-bindings: vendor-prefixes: Add DCLTEK
Message-ID: <178431837732.2207960.14757839702768025610.robh@kernel.org>
References: <20260708213500.1867092-1-marc-olivier.champagne@savoirfairelinux.com>
 <20260708213500.1867092-4-marc-olivier.champagne@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708213500.1867092-4-marc-olivier.champagne@savoirfairelinux.com>


On Wed, 08 Jul 2026 17:34:58 -0400, Marc-Olivier Champagne wrote:
> Add DCL Technologies Inc. (DCLTEK) to the devicetree vendor prefixes
> registry.
> 
> Link: https://www.dcltek.com/
> 
> Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

