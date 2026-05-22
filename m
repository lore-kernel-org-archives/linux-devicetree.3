Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C244D47AF4B;
	Fri, 22 May 2026 17:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779469571; cv=none; b=NYk/8nXDFQ4cPmXXYl6MTYi3r0gWT8rxo9Niokvn0T0niQ4VZMHVqTB2vPWimICVHlqg3wO40jluJgRZ7gJRuZBeULbqH98gHSD7p4/naMzDst11uLKZ/h8a073m27Q2S+xiM8przbAdAjyXS81w6l0V8bX974XGCl3QFaMjFzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779469571; c=relaxed/simple;
	bh=Pr1lFQy4fc3IjCIaqtplMtJhik25EY0aXQUVQN8VrIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zc+D91Nqrfue2YumXXj+A+mCg3zZL9VXToKCFBKWU2Img/qy45Pm1LU67fryBNxcxGZa7HzQhKvlDlPdhjbx7kLtLDcNKxJs9VUyFaNKUHQKWtL2ojt3V2mK6+njRbGdJ+/R85XPrck7fs16cCrwQbzr1kEKyKRLjnhvIrmfoDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=XssD/oIi; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="XssD/oIi"
Received: from francesco-nb (93-38-247-131.ip73.fastwebnet.it [93.38.247.131])
	by mail11.truemail.it (Postfix) with ESMTPA id 01CCA1F997;
	Fri, 22 May 2026 19:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1779469564;
	bh=p2te36NQZDmTtHJmgYuEb9fatJ4Px85Y3bWQ849rbEo=; h=From:To:Subject;
	b=XssD/oIikPaNYnBLeAVFNfI/G5//1wZChmTJ8UnFrEaVs6G/p+UT2sar2fD9kqTAn
	 VuqxiaPh8MZs4hicXvh7Eu3kNck8ZYl5NUvrJB+diUiyPPb6newfVWdwyfN6qDTIdr
	 mpH0LUp5WLe2WA2C672oldLbKyrWkNFQHL/W0cMVDqJW683sd6FR+5v0iWYn4aa3Bx
	 7fHu3ikC749VC0mMvgxyPyF++WAWruUZl3mIPFt3DfQCjz/KGtgKLCvctqeQ7vKlno
	 uABWthW1AxSTqnI6ONq8bGdlmSltO1UjxIDaiany7k19CN9zBwlpEN8S6AGxsVb1t4
	 20SWXDBCETOCA==
Date: Fri, 22 May 2026 19:05:58 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Vitor Soares <ivitro@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/11] arm64: dts: ti: k3-am62-verdin: Add display and
 peripheral overlays
Message-ID: <20260522170330.GA126484@francesco-nb>
References: <20260522161105.277519-13-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>

On Fri, May 22, 2026 at 05:11:04PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> This series adds device tree overlays, expanding the hardware support for
> the Toradex Verdin AM62 SoM. The overlays target displays, cameras, audio,
> and peripherals available through Toradex carrier boards and the accessory
> ecosystem.

...

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

