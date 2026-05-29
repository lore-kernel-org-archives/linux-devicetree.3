Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1110D3A1C9;
	Fri, 29 May 2026 16:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780071213; cv=none; b=TZREFYf5n+vhP13yzK+v6vEqM7SS2piphiwbWi8ZWfFJRhtsxpUEUH/LiDQv1fwXhsp6zZxMreOMOE8d3KucFKJB/7TjVD73NfUIq/fRpk6jlhKSiF31DnSoc6gVdchb9hrsticFLkGtAutDiyNkeT0GK065zK/4QtqsbsurZUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780071213; c=relaxed/simple;
	bh=31+P7lP6EjBeCRUu/uNfwmCFQh3Kwfb/n8+B2WcxrM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ae1ZuNGM96vNkYYahwbXbWw35gSx2qNziTsqU4hBCi6iPLyqbuKpzIw1A5k5fWCZkBIwOz+KuVG9ETUh4AOJUrjAcdslae8NoQLzg2ei/wQzR9dTw7G9aRd6qPc/tYxYklEtfkzVxkSv2/KAEOxTQ3uVSYoKV59OpKk/alvbnxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=tVLVKRpI; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="tVLVKRpI"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id AC6051FCFB;
	Fri, 29 May 2026 18:13:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1780071210;
	bh=T4fIA5mrNfq3wdINvclEbTHkW4IM1ZcnAg2hM5wZt1k=; h=From:To:Subject;
	b=tVLVKRpIoMaNd32APImLNK4zlijIgn43Cw2Cd+8NLWvTPrq+qXHwn9L38sCZ3mOwX
	 rlaGY5/gjVqW91Ml80OMBREew90HCde4k0Bz4EYxa1VteTS7UgKjbfVLFZRe4dUzSm
	 qUcL0Y/P+vq5PHYuvirJSGjkSL/YC7iteWQqQ7kTTDchD83LlneN53h++Rt2APD5V4
	 bD/KjkHbec0Vkd2OuEyg3jl5XuFZP4ZUU5qehDqWmk0eankNQt4rC1dyrkLg0OPZmV
	 TkowNr8yIA4rWv/Fl85acDVXFivkrS1KJ4oPAg4IL7OxYMm5o21gSOpn2Xl/QnG7sP
	 AWBx/0Qipg5ng==
Date: Fri, 29 May 2026 18:13:21 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Vitor Soares <ivitro@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/2] dt-bindings: display: panel: Add LG LP156WF1
 dual-LVDS panel
Message-ID: <20260529161321.GA9596@francesco-nb>
References: <20260529110518.624454-4-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529110518.624454-4-ivitro@gmail.com>

On Fri, May 29, 2026 at 12:05:18PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> Add support for the LG LP156WF1 15.6" Full-HD dual-link LVDS panel and
> a Verdin AM62 overlay for using it through the Verdin Development Board
> with the Verdin AM62 Mezzanine LVDS interface.
> 
> This is a follow-up to an earlier attempt [1], where panel-lvds.yaml
> was incorrectly extended to describe dual-link panels. Back in 2023,
> when a generic dual-channel LVDS binding was proposed, Rob Herring [2]
> pointed out that dual-link panels should follow the existing
> advantech,idk-2121wr pattern instead of introducing a new generic
> compatible.

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

