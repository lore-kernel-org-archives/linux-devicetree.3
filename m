Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712CD3CA4B8
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579741; cv=none; b=ZQptDpnX0S6kvlNgRReOZAho2qEYK1Z1DYp7RuFS6KJV5c25qwmrJzjtWMYyLGIqiB5hJU8UFSiBz2xd4iSTKaAZs0pBvNSk7H/NcLNM00ZGbuswFopADca0EpNUz1h1/bxI5MCjo8jef5SSVHKQLSXTABCjJ3MwsM0ZI9zgkN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579741; c=relaxed/simple;
	bh=jz8vspXl3JY3hVRKh5yq8krxjWxl8qeXB2Rvj9FBto8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nf+HMLVkBmg7M5cEGs81i5f3/RFMR0pW3IluEa+sMDdp/2dy62ORaLdDvkw8Zj/hbxSsrL/I18lgdrIcoYSwNgCu8cNq1LPD69sOdK9+zeKqtfrjcV6qNayr+b8VeWvKHIvU52GG+oQJSozEPJuy3v42bYkUrZpSqtSyDSoPS0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IuFG2M/v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IuFG2M/v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E027D1F000E9;
	Mon, 20 Jul 2026 20:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784579740;
	bh=k3HRWAgRGX7TA3Le432jF+YItF4HsMUA8b5brfBUN2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IuFG2M/v/9qKxJsWTRZ7fWHLZyfMSlcvBF8IROQWCs2Fx5ovPIqvUGg4zL5XNuQUd
	 BQVIIEaUcxVF7XkZfOj72frasxfBKRIH4BiQUNtvoG8TjlhgKTECHG/eo7BUk8PcNV
	 17OWz2Bh9BnepKJHY7uJbgVCqSZKbv5UWjWGedTxoGjuD213nwxg4Epjz5gOhFulBN
	 rigIsM382eQ4eeUU8yP/lUVQttt34Re6DkcU3xZGMvcLt8tG4YMBY5VlItuAJFyxGZ
	 osUtCbgbnYJojyFCSeGRmeSflV9I+AFQ3IA+GSYe77V45Vy4qC/ZJvIhK5mVwmvWDj
	 /qVyUmXoq9Teg==
Date: Mon, 20 Jul 2026 15:35:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: saravanak@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] of: reserved_mem: print skipped node name when
 too many regions are defined
Message-ID: <178457973720.4021453.13582323434814815438.robh@kernel.org>
References: <20260614133807.2165124-1-ekffu200098@gmail.com>
 <20260614133807.2165124-3-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614133807.2165124-3-ekffu200098@gmail.com>


On Sun, 14 Jun 2026 22:38:07 +0900, Sang-Heon Jeon wrote:
> When too many reserved memory regions are defined,
> fdt_init_reserved_mem_node() logs an error and skips the region without
> naming the node.
> 
> Print the node name so the skipped node can be identified, matching
> fdt_scan_reserved_mem().
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  drivers/of/of_reserved_mem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Applied, thanks!

