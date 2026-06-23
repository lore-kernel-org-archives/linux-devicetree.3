Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D27913E02A;
	Tue, 23 Jun 2026 01:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782178631; cv=none; b=gEx+MRuKdY60kVqxP0cc5h+xsO6vxBp1ssaW0u3hTN2iNNGZT0xp6aR3eyup7jHOVtTMi5zYzkUxlvEQnXuKUFjpFiimyea5hY66k7nLdhN7r6FnoLnccuK5Z8b30WTGNZAQpHWR1KF6A9zEt0lcgg0rI0uOLvf0YQjhPpBL72Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782178631; c=relaxed/simple;
	bh=NnB/IyFKuLnp20aj9Vf2RVJR9A/MNwpCPFaR6OXvqLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DijkOZMj4TUVkRZ3RoX+0akHWlKK2FQSUtmyggcWZRwkdNJ8G5eMQdplct+YJO04ecZ7cujYeWVUVkKBgrdeGig+IGYQ5qlVJ/jSnJ+F1iE5KN1nYfsi0kZCb+j5IzRibUrIHb03D2IP9EZ0/nHJhbc+DWAQKya9TFV14vDqlWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8dhNW7o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8dhNW7o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44ABD1F00A3A;
	Tue, 23 Jun 2026 01:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782178630;
	bh=jDksLzjv3HPUwFc/MLqnuTWykelMNarcYe/lF1zr4xI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N8dhNW7oZNrCrmamhx3o4XVsiksPaAi6C34/6qFM05Ir8H7EyciktXDmueXzdPzK8
	 646qoweDMQvVDx5LExI+luCrbvfTSOR1BHESKK+3MgAsPlwT4nLQiCvm2OCDBdJh0z
	 hEkBFEWdiPQHFNtt/S4DfvmeYni2+jq+s8vtH4+LQOhYiMXD7lsIQOdKcAz4gAEyxO
	 SGdOA0M9RkqY8iECjCbPCxq6wtlEXfzzgEWYJy35SzU1a6xUO4vL69fmNUsPqxji1O
	 Yd5GwFoCh6Kt95l6pmtN+i8tfwHtvFGDQjmPnwAr939ZdVXC4R5pV3ujSCIPUJP6b/
	 Vs1/JYr17XMuA==
Date: Mon, 22 Jun 2026 20:37:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
	kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] of: Fix RST inline emphasis warnings in of_map_id()
 kernel-doc
Message-ID: <178217862199.3896734.18392819970621877080.robh@kernel.org>
References: <20260619-iommu_map_kdoc_fix-v1-1-9573e1cf30b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619-iommu_map_kdoc_fix-v1-1-9573e1cf30b3@oss.qualcomm.com>


On Fri, 19 Jun 2026 11:16:47 +0530, Vijayanand Jitta wrote:
> The @filter_np parameter descriptions in of_map_id() and of_map_msi_id()
> contained the text '*filter_np' in prose. Docutils interprets a leading
> '*' as the start of RST emphasis (italic), but finds no closing '*',
> triggering:
> 
>   Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2134:
>   WARNING: Inline emphasis start-string without end-string. [docutils]
> 
>   Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2260:
>   WARNING: Inline emphasis start-string without end-string. [docutils]
> 
> Fix by wrapping '*filter_np' in double backticks (*filter_np) to
> render it as an RST inline code literal, which is also the correct
> kernel-doc convention for pointer expressions.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606130111.ldC96rqf-lkp@intel.com/
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/of/base.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!

