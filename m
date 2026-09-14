Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2463AFB1C
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 22:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789426565; cv=none; b=GhfRYJTtnsEn7gFFh60vIjOJnPXfElyYDuN9mvS+SXjL4M3l8msFPCF5q9IGNCd5ygB+LH42Am4mv6Ml4/kez3w6EY38DmtNMqTtPFRB7bqC2p0+GlRbHyq3W7wz0kLUYb9PwalwMFy4S3YiFXoRUyWwtI89rrYWJ+5kCvoJmk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789426565; c=relaxed/simple;
	bh=nK2CWErVBLKLKrDY781H0PY4Rkpuax3yPJs5Melxo5I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RdvhMX3smw8B1bh3UtmMz3YE8Z3jLULcLwYIwA9f3f3/DuQkAllpq6WJ52rTjI5PDeUOBQO9WAWpJSQoMxIDrQpB3MqxYHXCV03/S+Jy8X9xebhlywZO08TabAx3zRHCl1hIKhtfHMm/xsfJPDlbSMJvF9Q6SgOg4zHFVooafIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QtI1xDmf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QtI1xDmf"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFB501570;
	Mon, 14 Sep 2026 15:55:56 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0EA93F86F;
	Mon, 14 Sep 2026 15:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789426560; bh=nK2CWErVBLKLKrDY781H0PY4Rkpuax3yPJs5Melxo5I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QtI1xDmfhVkCGmAYIXmfJaURNq+lsi5gAmIsxsIg8POBxso2JrliC7ECMI98z6I5b
	 Pxju1Dvu3YkfaMwn4rx4Cqchd/0yZbPO5SOAG/0ZWVevWyJEvBkf+you/wLXv/ADJ3
	 ZV+fWXRVde+yohhrXcy+B4xZbNpwVjj14ACDMqQ0=
Date: Tue, 15 Sep 2026 00:51:22 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 conor+dt@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add two Teclast tablets
Message-ID: <20260915005122.40ba2d7a@ryzen.lan>
In-Reply-To: <20260914211940.256A11F000FF@smtp.kernel.org>
References: <20260914210115.28151-1-andre.przywara@arm.com>
	<20260914210115.28151-3-andre.przywara@arm.com>
	<20260914211940.256A11F000FF@smtp.kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 21:19:39 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing SoC fallback compatible string 'allwinner,sun50i-a100' for the Teclast P80 tablet breaks CPU frequency scaling.

Well, there is more to it. We should rather add the a133 as an explicit
name in the driver, like we did for the H616 family. And the whole OPP
table is still from the old A100 days, it doesn't really cover the A133
or A133P values, which go up to 1.6GHz and 2.0 GHz, respectively.
The bin selection in the driver is also not adequate, the BSP code
seems to use the SID cell at 0x00 to select one of two speed bins, at
least for the A133. The A133P is probably still different.

So I'd rather keep the a133 fallback compatible, and adjust the driver.

Cheers,
Andre

> --
> 
> commit 582b866f1ad9000afddf47eb7e4c9d37a95dfbc8
> Author: Andre Przywara <andre.przywara@arm.com>
> 
> dt-bindings: arm: sunxi: Add two Teclast tablets
> 
> This commit adds devicetree bindings for the Teclast P80 and P85T tablets.
> The Teclast P80 is based on the Allwinner A133 SoC, and the P85T uses the
> Allwinner A523 SoC.
> 
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > index f04db28c630ac..28437c47ac01b 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > @@ -933,6 +933,16 @@ properties:
> 
> [ ... ]
> 
> > +      - description: Teclast P80 Tablet
> > +        items:
> > +          - const: teclast,p80
> > +          - const: allwinner,sun50i-a133
> 
> [Severity: High]
> Does this strict two-item compatible array omit the necessary fallback string?
> 
> The sun50i-cpufreq-nvmem driver in drivers/cpufreq/sun50i-cpufreq-nvmem.c
> requires allwinner,sun50i-a100 to exist in the root node's compatible array
> to bind via of_machine_device_match(sun50i_cpufreq_match_list).
> 
> Without this fallback string included in the bindings (and subsequently the
> board's Device Tree), cpufreq-dt will not be instantiated. This will cause
> CPU frequency scaling to silently fail on the Teclast P80 tablet, leaving
> the system stuck at the bootloader-configured frequency.
> 
> > +
> > +      - description: Teclast P85T Tablet
> > +        items:
> > +          - const: teclast,p85t
> > +          - const: allwinner,sun55i-a523
> > +
> 

