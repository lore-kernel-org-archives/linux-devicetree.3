Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5594E36FD
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789730963; cv=none; b=bXOIatCflN0S64tIJoZ0OR5N6XCNJ2LTYFoxj9eIdORqqWDL3cgwY40Xv9cJCH1PTwQwoYyc2zmV4VpqLXYYqNvyD7qCu8g036DLDUtWrToMkTTHnqyocWP/kt54ZPPzS1WTDYxW6fl0t4k/n99cCTy1YqGFfnDFRvOQ8fGOi0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789730963; c=relaxed/simple;
	bh=mPRRPFsVVCEXsXDvJEA3fhXkwA8n58/7+PYivKnv+Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/es3nhdkz/90TI+CBwplHdHDG+yoqV+x0LND6psKtSY6TFvbzyD4FVcgzYmRVU4WHCD5/OvZ61kOVMO46zV7mkTZOocNQ7N5bG1GirRRooKF8p7EWHk9XJUOu6JQ5yfq7gRqRMCKsBE8qPNAxLznXWTS44i0/Ijedly3sdip/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhl6f6Hh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhl6f6Hh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E00B1F000FF;
	Fri, 18 Sep 2026 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789730960;
	bh=MKao3MMj7OIsKmp5BuRHN8lT+S4KY1F4hZJXEVjNn9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bhl6f6Hh0h9EItl3T+aiAadMvNDmJLYQzhNd2Ju4vuvbCqKznD3TR4bDkYc74CVF3
	 ZvZ9iVUtkhr1qAAL2Pfp3Jk+hAQsCDtGhxZsAa6iDkkppZ38TzRknjA+0VCIGpwX0N
	 qavp05Lw9fn01hMRS20AU+pcimDKatNzfskNWUqu3aQHwUVPJugohi3QPZ/h/IOzgB
	 iAoZsZrBik1DXbac7gLJdbOc7D2ufK7V1P//QvX9Yx+EIxcH5ZNTa1GyhTzgiTdNKP
	 /0q47e6/FAHT1KQxB4sI1OOVLL2kJ5fURG1gm9fDVDdSqTag8LX7XkwBcei73Gd94t
	 hwpGCmFZfeWNQ==
Date: Fri, 18 Sep 2026 13:29:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	qinjian@cqplus1.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux@armlinux.org.uk
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Tibbo
Message-ID: <20260918-noble-black-numbat-e5ecbf@quoll>
References: <20260917082632.626614-1-ag@ffroot.co.za>
 <20260917082632.626614-2-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917082632.626614-2-ag@ffroot.co.za>

On Thu, Sep 17, 2026 at 10:26:29AM +0200, Andrew Gaylard wrote:
> Add the vendor prefix for Tibbo Technology Inc., manufacturer of the LTPP3G2 board.
> 
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

Wrong order.

Best regards,
Krzysztof

