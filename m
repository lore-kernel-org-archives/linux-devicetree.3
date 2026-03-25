Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6BF30DEA9;
	Wed, 25 Mar 2026 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774426644; cv=none; b=ojBdHE/KXJob2k2Z10Fg9tBaM5Dcj21CNRcZhEJqVozCIUwDjNyXEc7FLnrF6jCSkWEojzJbeZPsVPrJ63Q4bYMBb4z4Do0CoLJHJqj1K1FQ+0DjhtS1SOE0lh+g7mIu5xgJ3lBorIJZKUB/NagCoYCBVOHi7QpDWUyVRxE49lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774426644; c=relaxed/simple;
	bh=nYFxOoFBdJDJAtHSqZjQoKIJ0Nr8zwnTAqqylX7FTBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6x4N6zrq4HZltOZQTfpyyYsZ2GG69mmijCIkDy+eILoyRGkGWqNN6OtmjwCDNT6Pld/oL4+a4ok/i00pq2D1MXsbeX2dlYsvY6xYcaTT1p4x0L/dqkHBZmYnuiF/we5caonDpPe3ERs3jKqUHM3qFAw04uQ07Gao9LBv83o7N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1hYdX/W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1hYdX/W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582C7C4CEF7;
	Wed, 25 Mar 2026 08:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774426643;
	bh=nYFxOoFBdJDJAtHSqZjQoKIJ0Nr8zwnTAqqylX7FTBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A1hYdX/W978ySG20Jup77ph5rBseGqjxnja0LRKYMjW8AwyFzxsD/EViH/I0aoIkD
	 WYsfqRRYc88AwzIPadliQ4jGJWyjL78fjWlrhiObbFuropE04BiCVkhn/OJKOhwagv
	 V/ayRoaGKpe1VTR9ndtXJ7wQ2BEBCusld3HEjJWKXd0uYVTeomWT2pyWjyQCoJfvJU
	 Hmt6wvNfd0zNmbWqphegQemZFUV09EZw+4EfLZRmu7ydCELdYRvfRGBL/hIDm/WOhE
	 sG9hW0ETnUKX75jeCesFfMRdDQ9OfOiThMa+u2KYNkXvuWSkwmw6CNDV9PyX9p9VAK
	 Hlef7DuLYym7g==
Date: Wed, 25 Mar 2026 09:17:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jay Liu <jay.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/6] porting pq compnent for MT8196
Message-ID: <20260325-hissing-jasmine-crayfish-caef70@quoll>
References: <20260324125315.4715-1-jay.liu@mediatek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324125315.4715-1-jay.liu@mediatek.com>

On Tue, Mar 24, 2026 at 08:51:57PM +0800, Jay Liu wrote:
> Change in v4:
> - Address coding style comments for disp-tdshp binding. 

Coding style? Why so vague? So does that mean you ignored all important
changes but did the "style" things?

> - Rebase ccorr driver patch on top of latest linux-next to fix conficts.

Where is the rest of the changeglog?

Why aren't you using b4 to provide also lore links and solve above
problem?

Best regards,
Krzysztof

