Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8182D0C72;
	Fri, 22 May 2026 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779432916; cv=none; b=GHraO9fO5QkN0GCcoNLTCdlp0TBsOUA2ID2JIMrQQPHMcyLLHIWWzbVh1Vh8uihYFJt2iOTGXtqlstbUPuekSEXc3+Fks7RdejiC2okm4rwmSyTgZxqVPA6ApIdE3EYAZzACHucGvFc9+gvP13Ku0n8Y2VB4y8q0SyBvxI1Thgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779432916; c=relaxed/simple;
	bh=a5qO138E45vTZlimNQ0q62dOZKq0Fo1rmSSVv/c+mW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1nuf2JBOB95XB3yxcM1J3mJGZsV7yY24il/xxchNelr3S74JIsxhm80PubHtHcKMCYmCxryf4GB6MSRJTo3xlpkLr4/zuLye4ayfhbe1FtajpqDti8tI+6y/Hk7+4k5FU4sF/soZKgWTIrhvSS5G4v6cFpSZjVM4xNc06SCJPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HECtbDQV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HECtbDQV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE28A1F000E9;
	Fri, 22 May 2026 06:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779432915;
	bh=PoaYTpOtS/f83LSZSUS371YpKZ7Va1WFwiD79VpLxU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HECtbDQVIxKupYOYPtJ9nH5KpRerCWP9jZT6Z0tI2nxzCe0ssvS4EbeIrd7Vk0fu/
	 ssnOF1WHE+xRA/dcBJNI1coWs91fN3yZfSTRMdfMzzRVJ1+JujNd+gnHwOz1KezRBq
	 9unUp/HHECrB8zDvoRyl+S94rc6gUMQo6+eju+fm0rVePR3EAxVFvDexmztyeGNxWK
	 IjBDtXfA5SRdvQ2IJlSMQIpMz65DsntubMq/DIUcmGOzA6/JSHBWisndMh1a/Z/LQD
	 hwojgvvbXTFowz99CyUMRy5FKJxnYIh7xYPImQJFQRs5kw+qI2sJBIP6M7SVXbWDVm
	 8GzuYxJJR/HdA==
Date: Fri, 22 May 2026 08:55:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vitor Soares <ivitro@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Vitor Soares <vitor.soares@toradex.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 13/15] dt-bindings: display: panel-lvds: Add
 dual-channel LVDS support
Message-ID: <20260522-vehement-kangaroo-of-penetration-de8d99@quoll>
References: <20260521150038.103538-17-ivitro@gmail.com>
 <20260521150038.103538-30-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521150038.103538-30-ivitro@gmail.com>

On Thu, May 21, 2026 at 04:00:49PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> The panel-lvds binding only supports single-channel panels.

On purpose, no?

> Extend it to support dual-channel LVDS panels by referencing the
> lvds-dual-ports schema when a ports container is present.

You now changed existing panels to dual channel.

> 
> Assisted-by: Claude:claude-sonnet-4.6

Using assisted by is not permission to send us unreviewed code.

Best regards,
Krzysztof

