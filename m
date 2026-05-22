Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2048F361675;
	Fri, 22 May 2026 07:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779435300; cv=none; b=IwI+w2iVUlQU05SFluTVvZ7aJ26ZTm2vsNHSfJFwRm0+8R5Mv2+jBPHfA0vTFjv5XkAyu4JO8jmA+HrpSXv3V6JXlha1/45+TjanfkBdyBhvmQ2ltclriS302yAMHUxATr/OrLcQ5g7AlEnfcDdF8dQaFE6VPKjqgOplVlBUk40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779435300; c=relaxed/simple;
	bh=yBFYgONEIIizhvC26AS2JTpA95c8DssjkUjhuhSjJvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3bgQUf2smmkEN9LJrOfo5Fk8Ci1GMbLG13Hi6p1s/WoOQM8ZqG4CSOg0ztWV4ZnFFTj6CeuQxlqDhfy3wpQ+Br+oXau52E53XCfaBCe4TCPEsJ8aKYZWwCPO8A/H7jOv2C39vnUa5jOFL0ZYLNNmAob1GWpV4Jn613/IFTXlww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=VlgEkmUP; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="VlgEkmUP"
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id A2CB91F94C;
	Fri, 22 May 2026 09:34:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1779435289;
	bh=Cy1vpTPJxzBbbcL4UR5MpD0A0z+QwCRJEL5GQWJ0QCM=; h=From:To:Subject;
	b=VlgEkmUP1LeZ6d/1LrOi2YEOStTsBaBIiLGmNfnqjcxE7HnYazX6OI+NntkHEHLW9
	 8WeDKAQkbxldtkAgehhtJXXJYE3N011+gG6nYx5vkQ99jyqOUXth007X3K/zbu7wmH
	 dUMrQ+0zNVgdWfsMkNEWS1HwQloA5WdK4qvHfb43jRm7v21DtJt3o33lFHm7z3+GcV
	 SZVE+QM92bdM/SU1PYdH0MI+OQu50ELYho2uJicItAvV2es9MkmC7nSUgQjve+14a/
	 DTSLEeNXOXlxuemlXShlCvcVTmS2KExl2DLCyPGGcascdC/PHhIsd2e2U82eDqO8V8
	 GOB7NdaJ2+dtw==
Date: Fri, 22 May 2026 09:34:45 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vitor Soares <ivitro@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 13/15] dt-bindings: display: panel-lvds: Add
 dual-channel LVDS support
Message-ID: <20260522073445.GA25589@francesco-nb>
References: <20260521150038.103538-17-ivitro@gmail.com>
 <20260521150038.103538-30-ivitro@gmail.com>
 <20260522-vehement-kangaroo-of-penetration-de8d99@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-vehement-kangaroo-of-penetration-de8d99@quoll>

On Fri, May 22, 2026 at 08:55:12AM +0200, Krzysztof Kozlowski wrote:
> On Thu, May 21, 2026 at 04:00:49PM +0100, Vitor Soares wrote:
> > From: Vitor Soares <vitor.soares@toradex.com>
> > Assisted-by: Claude:claude-sonnet-4.6
> 
> Using assisted by is not permission to send us unreviewed code.

It was reviewed (by myself before Vitor did send the series). It is a
plain old mistake, unfortunately we cannot blame Claude for it.

Francesco

