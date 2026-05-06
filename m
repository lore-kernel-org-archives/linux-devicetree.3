Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A32B2FDC38
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 19:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778097107; cv=none; b=d072oCo04KUO6qsqr4rImnuxQfpmJzD24nG4WCZKcfjfnpAi4ScB3csp+qMOdWTs12AGWbml1JMR1mHZODdjWgDo7SECUDArzWK6mj3AGrdZXTYLfioMYHAzOs8xeC1xnSBfen6ESFq3wzqLFg7zHivcPq7AwbqUAK5CZks9ZWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778097107; c=relaxed/simple;
	bh=ikbTOvm0oBZ5yTzSFQL+NXogSNI5BerPvot90DAmBLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKWIh+OBegUxPpOEnMy74PLg6XjFfQIDHrDCaHTLK7R+GwboNdbT9gQ+qPZyNCusn+yqFkOikxx1/tbBDFdZNuUL6qickuTJ6H/VGIVhivRmXJOPh+xorvND2wBIZyksqXVduZ5jGxva2nQ7pydTui/9qb3HwD7cu7mD+Gv//dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJUyafDX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJUyafDX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36FBC2BCB0;
	Wed,  6 May 2026 19:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778097106;
	bh=ikbTOvm0oBZ5yTzSFQL+NXogSNI5BerPvot90DAmBLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tJUyafDXZS0LGKcJBMwjzZMgbmCHZGtCJGFMOJ1p5UD5ibiMZ7CeP8tClsLh8cNic
	 KDgXbmT0KPkWni1tR2kSMYE2J73HDPLVitEmUyed1vdK9gfr+Wgm4Bmj+zPEwVLd8B
	 mr0+0nkUfRxWTlArjJwY2FGeo2EoURCKjz7SVTg9SqwO6IpNh01bfVa9Hd2kSrorek
	 dIrPBdGZRh46RjtrQOUwzAWJBAiB53WZ3Sy5lg9s/GyVuefMXYnibTFUnSrMuVWC51
	 lQRNfoqsLrhKPGyAn1NYNzuBQK5RbUSMLm0Z6ugRem4Mwn2BF7dI+XwJDRotzBVIb3
	 xrJKUyodgLXpw==
Date: Wed, 6 May 2026 14:51:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Grant Likely <grant.likely@linaro.org>, lvc-project@linuxtesting.org,
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] of: cpu: add check in __of_find_n_match_cpu_property()
Message-ID: <177809710390.3006484.11455708502578128545.robh@kernel.org>
References: <0c7bf7e9-887c-42d5-bcfb-0ba7fe1e70b6@auroraos.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c7bf7e9-887c-42d5-bcfb-0ba7fe1e70b6@auroraos.dev>


On Wed, 29 Apr 2026 23:14:39 +0300, Sergey Shtylyov wrote:
> In __of_find_n_match_cpu_property(), checking the variable ac for 0 won't
> prevent a possible overflow when multiplying it by sizeof(*cell). Besides,
> of_read_number() (called in the *for* loop) can't return correct result if
> that variable (which equals the #address-cells prop's value) exceeds 2, so
> additionally checking for that seems logical...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Fixes: f3cea45a77c8 ("of: Fix iteration bug over CPU reg properties")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
> 
> ---
> The patch is against the dt/linus branch of Rob Herring's linux.git repo...
> 
>  drivers/of/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

