Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE903806AD;
	Fri, 24 Jul 2026 06:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784872838; cv=none; b=QHHn5CAEg4iT3hVcll0z1ctAO/aR8iefPfivtV1x9p2/1wAQfJlx8LYP6vE8hvxDNUUVTavK+1pCE+nQr/z4qGIb2WP/rsD0tkmwwVS3JEMipkxBd1PpU1PFEw5Y6yYEAF2SG1ln/p6/bDvCkSk/ApFpP60gVEltEcVVlENac2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784872838; c=relaxed/simple;
	bh=onLoo9EpoItxwSxmECkDRqVjRB3uIcKTYKXgDJs6JXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjI7AKCqPltAKwj2UBEhFa07qxUfahUdlPhURJba8BP8c59dOF/p+hj1le1oh5PfLiretS/GVxt+7eXlJuxDW6EThdLMlsjox1nmliElzYWb8t53uEy2LDvJLds/uHSezZV8a+6Bgur1YQ4u/bKfI4/IHmGNtqDWGhFqRqrbdyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJ4S4muw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJ4S4muw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3A41F00A3A;
	Fri, 24 Jul 2026 06:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784872836;
	bh=6rzPW0CUckbkrF39Ekx9Pi0vtsbA5yjRkuFGFKuxzek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SJ4S4muwxAjPqwN3bl5N3K9mlPX5ztOTcDpunS2J0kEzqUWBG0SS0UtzJGOf3bANn
	 eyjQumooGnJtkNw7HW5mNwxNfaSN2DrMHU6EsxiTgVBmth+jxT8ol2i6DKRgn7/U74
	 Nuahy8UsYiCHf6Q64qJ9zhYtA52xoHHWUsxCK3MLlJno1ItjqbmY+TCJcBBrMBDxUd
	 hXvZtusw1l6p0s4FNmOkI9g/ZRaxyWOo4Y+Gqjkb4QVp6Q7Wuf6+SS8hXgs2MifcgY
	 Jbx3MMJW0lKXITrAnkxqY6kgN8eUoXfd59iGo3vhR6P/zMHkPXnE1pCy1IyI02D2Xv
	 C1TfCVVca16sw==
Date: Fri, 24 Jul 2026 11:30:32 +0530
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
Subject: Re: [PATCH v4 phy-next 9/9] phy: lynx-10g: use RCW override
 procedure for dynamic protocol change
Message-ID: <amL_gPKbD0BQG10S@vaman>
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
 <20260721231603.67865-10-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721231603.67865-10-vladimir.oltean@nxp.com>

On 22-07-26, 02:16, Vladimir Oltean wrote:
> Up until this patch, the only protocol change supported was between
> 1000Base-X/SGMII and 2500Base-X. The others require an RCW override
> procedure which was lacking.
> 
> Since now the guts driver provides the means of applying this procedure,
> make use of it and remove any comment which mentioned the limitation.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
