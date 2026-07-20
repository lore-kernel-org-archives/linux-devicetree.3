Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E24243D51D;
	Mon, 20 Jul 2026 16:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784565269; cv=none; b=uCM4CE454ipZ3DitznbXQEKgwxfMr1UPCtAesxMC/kLvgu3g/JnS6eTHLS4F2t3/UsvdoRyauIz2V7p0+c60Qi0lxL7TcHt2lTYTRMFgxmc5eLgTAxqgly5UANKRIM5XZidifeMIyXToX7znwjiWcGMdwjoH9rXXxBbGA41NYcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784565269; c=relaxed/simple;
	bh=oCnTjfehmx6i0iiMCIlzd5LkrouOYBE1xqCyd6rxgF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfQYssdLckfD4l+5VLR5DZzKoSFhUP1TxsGwu6XfgjeMk99p3LST8G88+8x2Q46xpx9EFOSzaoKrxFuc31Fb5mW6IXO8KTapZB6syWkiblQT0+p0eEsKW3rDkB9kPj7BjFxA49XazgIFHFYAqVrR6Z54RUtubCJ/DaU5QlvyekE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lV4Vupgv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lV4Vupgv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4ED11F000E9;
	Mon, 20 Jul 2026 16:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784565267;
	bh=I5pCJCNSlRvnmOb1Hy/xPjzYh4HxX+Ti5n4ExHAyluw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lV4VupgvJObQ9qrv/YBl2S8GZ12F5T+H4ddshJCJv37k4Aesv5z1vJ8aaf4oU3wyk
	 jaSw3X+8nwIpDv6DheHiYWqccp5GXQRnlQ3cFvyPPPpqotdJvU8kuYoQqGx3tXCAC4
	 s2kHQDyLBGQkKcDf2WXUP6WVEnYhkk/gnJC+MsJIgz3yB1l0sSOTzluhedUknD0FPP
	 pjnzujGT4rms2Mis9cTk4/dYGuNEHbNX5UHfa9QwW4NCndbYQTaXCoznf5NTG8iHzL
	 vrI/evAXi9Nka0LH2lUVTwZ/JXtSTQ2NOITtjE1g473fGRjUUHC2LCIFuz0sG4BU3N
	 JIGNhYPfAinfQ==
Date: Mon, 20 Jul 2026 22:04:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 phy-next 8/8] phy: lynx-10g: use RCW override
 procedure for dynamic protocol change
Message-ID: <al5ODzYhpE-wHSSN@vaman>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
 <20260720133642.136324-9-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720133642.136324-9-vladimir.oltean@nxp.com>

On 20-07-26, 16:36, Vladimir Oltean wrote:
> Up until this patch, the only protocol change supported was between
> 1000Base-X/SGMII and 2500Base-X. The others require an RCW override
> procedure which was lacking.
> 
> Since now the guts driver provides the means of applying this procedure,
> make use of it and remove any comment which mentioned the limitation.

lgtm, is there any dependency. If not I can pick it

-- 
~Vinod
