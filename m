Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543AA470EAB;
	Thu, 23 Jul 2026 07:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790943; cv=none; b=bBzvbYhfKoiv/Z0viJ0G3HT32ghJi9dyWPGpxzABKFvz4W+rnqP+UT3ooZyHB0EeeGcDBAMD7Jrxk7QBs1IuBE00Ex6HbKG7pLZY+Q+irXSZmYYIg/5wO7WeXnFg+zrt3HLb0jqL6RIZ/zpfCwcM91Sfg1OLcDMdk0GUFJU7YGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790943; c=relaxed/simple;
	bh=pxXqmWFdsHN4uueFgMNSRMaEPcC8fW7BOmHHfUgtmTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHHgyuDHp3rvp1jxiweTDCQxkwHll8ULDJODOTlEj72sCE4Qxs7rtS374S8P/PLYyqvgzHxAabK/2pSyEm9TtzjrmcVREUyLkxXH6vnxbrEAplLeCDCqym0vDvigUJl8FTnJX1MNI3ntMj75bM6i4kYbEMte3th4D/E4HPz/21c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hniyd0zS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hniyd0zS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0801F00A3A;
	Thu, 23 Jul 2026 07:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784790934;
	bh=pxXqmWFdsHN4uueFgMNSRMaEPcC8fW7BOmHHfUgtmTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hniyd0zSqTh+oRMdwoQfnRl/0B2kVJkU9xHDmz14OuVC49OnUJn7vE6hMqLG17IQA
	 6rp80+KIJCqVAtpusx8dDcf0GowqAhWY1L7jAuau7nq+s562fu7llHdeoqEG4tC1zZ
	 EZglyMUrkS7qOFzbtjrHzBxCBubYqtDfJvdI5bgTBvMAKkpvjGhrzEW6Rfe7Ya5bU7
	 5sq04/DFoUh8yO0/cCKI/STM0Y1VjswQwskxuzbAEwZkGtFWldBRcoEl9oV/AxNGq9
	 A8H0ACRpm36D/djWED9aQ0HldzaoM2t5LsiYgmDemP22kPGGFbaZw1FSAdBur2KEn/
	 4jSr8wOi5Q7qQ==
Date: Thu, 23 Jul 2026 09:15:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gokul Praveen <g-praveen@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, 
	robh@kernel.org, sjakhade@cadence.com, vkoul@kernel.org, yamonkar@cadence.com, 
	s-vadapalli@ti.com
Subject: Re: [PATCH v6] dt-bindings: phy: cadence-torrent: Update clocks for
 multilink SERDES
Message-ID: <20260723-venomous-nuthatch-of-inquire-dade7b@quoll>
References: <20260722061831.1045884-1-g-praveen@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722061831.1045884-1-g-praveen@ti.com>

On Wed, Jul 22, 2026 at 11:48:31AM +0530, Gokul Praveen wrote:
> For multilink SERDES configurations where each link requires a
> different clock frequency, the SERDES provisions an additional
> reference clock for PLL1. Hence, document it.

The pll1 is already there.

Also, the TI variant does it or cdns one or both?

Best regards,
Krzysztof

