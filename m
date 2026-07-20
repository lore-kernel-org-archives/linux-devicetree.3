Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED59B38B7B4
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579689; cv=none; b=M0lWMEvu+UxTdnyfoh35IGveuYz0uxLpbeOzZ32o6DOt8L7GX4oXw8cDOy2GSj050P8Lx+0R8lVL01FZ4cSbey6n3vMr7oRG61zlv4VJpBKC1S1eWP7+oS0wlZzzkU0FbdFdRPCitmjbFBgEhZA7rF+cpPHxghPrZppTVTvkybk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579689; c=relaxed/simple;
	bh=07ihZlYg5xfxaTxNm0JbWsMonZSAhRs1Lmb7QDwumHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEi4fI+E3kWSlAeVv1EccbG5q6EiADc2OYsRul64bzU8hzt1uZ0hHSNdAYOvoADKELZHvtG7GrAfmGK42kulKWuDHAKsgHdi3z0x+wx7BDTk3oA7SuiVtu3Td4jJGITCGoSFcpqQzaYB2nxODK9Ck1uf65Nnyg0ge+1Z9zD1rlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIHNx6++; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIHNx6++"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74DB11F000E9;
	Mon, 20 Jul 2026 20:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784579688;
	bh=cQhLFl8iXAPqWTcjfExP4L+8VCDPvP3T5sjuje4ibLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BIHNx6++pb6bIrkPji6aNyr8SRmTHFc7HB2Hq2waQK14VT5jXkrH26/3MXp6zkN8H
	 V5qn7Ith8o9TyJc78QmaUQlEPi1T9fxeTtyktosTn6M0ZG7L8s2ocD612qKF0iT/em
	 ieL8VkEFiYFbgzKcT2fPEId1V4tZ8Pa1MgATqGkk+vD9kwNqW3GB9MwjYSKQNCYvnf
	 h6oEAZIuK1Jp2mdqxhPcSq3BA0JvaDinJp3YlDgPgU4jlyfZjxEGJmKLkbik5XGkHs
	 HNT3flxyVeCRM6q3KHS4alUSvULpyxZZleB+Zs3ix2bO6dbOR7bdzzGqof7Un+8Mep
	 oKESV2gAvTCKw==
Date: Mon, 20 Jul 2026 15:34:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: devicetree@vger.kernel.org, saravanak@kernel.org
Subject: Re: [PATCH v2 1/2] of: reserved_mem: prevent OOB when too many
 dynamic regions are defined
Message-ID: <178457968569.4019756.11307139397257471085.robh@kernel.org>
References: <20260614133807.2165124-1-ekffu200098@gmail.com>
 <20260614133807.2165124-2-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614133807.2165124-2-ekffu200098@gmail.com>


On Sun, 14 Jun 2026 22:38:06 +0900, Sang-Heon Jeon wrote:
> On boot, fdt_scan_reserved_mem() saves each dynamically-placed
> /reserved-memory subnode into a local array of size
> MAX_RESERVED_REGIONS.
> 
> If the device tree defines more than MAX_RESERVED_REGIONS
> dynamically-placed regions, fdt_scan_reserved_mem() writes past the
> end of the local array.
> 
> Add a bounds check that logs an error and skips the excess regions,
> restoring the original behavior.
> 
> Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  drivers/of/of_reserved_mem.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 

Applied, thanks!

