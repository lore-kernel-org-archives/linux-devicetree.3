Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B934377EA7;
	Fri,  3 Jul 2026 08:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065716; cv=none; b=Vmn/aN7iL1MARhicQF/T1d5d3szzIT+zAoS/Acv5t2dpAv9HOFv52ztsWOV7Q0ssilQMC2FmUbukrbKuIO0dFFqLdS0DxJ65dko/PP26FE+7uNqletfD2oZwm9RsVrQwvufUKDIrLxycGFG3RLCyit2Sstz+GO5/eFhSl8dbpUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065716; c=relaxed/simple;
	bh=UXiDKmuYOMfhFcWtxBBj2JF1cSEdNZGUCMFWxjWkWVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bgpzw8sLtVGDNWv6pzhagSeTQAXG18DIHHVF1FexBOBTOO2SJMYSvYlW0UjoNJwS9ch/ioI0xWrOFRXTm8BLud5fxX2qVizXgjEJReECed+AzlUW4mRrtu75FQyJJoGLslspg+YC/y/eRz3s1WdVDurtqMIuXcLhp5PemhhQZcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWoGWMat; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWoGWMat"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54A01F00A3F;
	Fri,  3 Jul 2026 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783065715;
	bh=tHSR40BSJEjXogpbgoRNtUmX9ocgOZObmswLHfCZhCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IWoGWMatctxsGF7rx3pcK3h70bTxMvKI4xxdFq2pZl2iEmeX4Lb6ciDsWkRQqh+qc
	 uiGJjJGa4Hxfkx9vfzqNx8vWkpdSG00Ijk4ygHeJdDgOLnukNYBvNskJq9cfMH7484
	 zar9xU+ypVOy0uqu/A7z+VldSXyTdb2WM7csWVwu8vqkSKGd1qY0BBsj7RI1Yg3S3N
	 38+vIeglQjWQ16eAPq1n0IQzKHV4el5ecFmJXl/QzQp13UGy4yN++Zm0NuofGj3i6j
	 gAxTEI9qBiU4xZKDtpaGKaD0I9k5nel+PXWphEvN87I3xFPxp6tWOa71gnlKw1PK9G
	 6UtNPiJAGUQhw==
Date: Fri, 3 Jul 2026 09:01:49 +0100
From: Lee Jones <lee@kernel.org>
To: Junjie Cao <junjie.cao@linux.dev>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	caojunjie650@gmail.com
Subject: Re: [PATCH] MAINTAINERS: update my email address for the AW99706
 backlight driver
Message-ID: <20260703080149.GF2108533@google.com>
References: <20260701133533.32585-1-junjie.cao@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701133533.32585-1-junjie.cao@linux.dev>

On Wed, 01 Jul 2026, Junjie Cao wrote:

> Switch my maintainer entry for the Awinic AW99706 WLED backlight
> driver from my personal Gmail address to junjie.cao@linux.dev.
> 
> Update both MAINTAINERS and the device-tree binding maintainers field.
> 
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
> ---
>  .../devicetree/bindings/leds/backlight/awinic,aw99706.yaml      | 2 +-
>  MAINTAINERS                                                     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Doesn't apply.  Please rebase onto -next or for-leds-next.

-- 
Lee Jones
