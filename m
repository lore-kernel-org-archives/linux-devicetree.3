Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D7C3D75C4
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 16:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782838277; cv=none; b=o+YBlwaIhNLjbYZUFmImt/ULxV3rqv8TXAxAIAdugbI6CB53BmvG6DIGrDkHymOwQLAqdCaUsPN7dCH37ZSj/HxrUebP6J51Cp3IzyQ3cxcmKKz0jhy6SX6IXi5kyX2D9obpR001v+37prLAp7+g1wXrDB/xzEJ6SFoS1FPuKS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782838277; c=relaxed/simple;
	bh=zgpVEjRSwxdcGtLTf1C1sZvYzIvouGEEMzsQzyyZ3Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFuwrfECfCLRcGvXYlbOhPkluxAMusu2JJd7y51YmcoPsvEtNFMAmTq/Vxq9zuu7QlCstDjUlB5lC4Dhbb+xQzkgbinQpXig7oQGa3pY/hPffqE87EGAa2qNmaJ0WkV3VPDqfMcphcoU7zf4j2FwrXE5S3yWH9AsFfE4cLcF44M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivBAOCoT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivBAOCoT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3681F000E9;
	Tue, 30 Jun 2026 16:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782838276;
	bh=DBw48L3V5sdILmb9xBDVspXMcwaZoROuBRflDuD+WDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ivBAOCoT4JyLpcQPHGUA5cgQ19bP1486KqWBZqFSBx3fprbPA9LseEySG/QZ62eqg
	 DpQBkoBwv2LxL2yT6MIqjFvWnnDhU3YY+ESwTqEe8IckOa5Tk089LQW4aXHJa57+f+
	 MpwOkhZXZgH7hq1wMu8UeX/mNi7j3XW/1cyUhvbVTBaLMXMlo7Bniju4c8A2VyM1yt
	 hh/EaqCFwlzcl3CzUCaj+wdh6bfnd2RCq+1VfhfYY34767ISNjA8skNSEvtJf9B3g7
	 UO0cVcdKfn1aSRLwMiyUAOb/Ei1pLJlGn4RA41LJDxFS9LCIRjDMp4VuvttW9wsWDH
	 ZuqeVHQTadmRw==
Date: Tue, 30 Jun 2026 11:51:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>
Subject: Re: [PATCH 3/9] of/numa: remove redundant numa_nodes_parsed
 node_set()
Message-ID: <178283827386.3936103.12769861946850449269.robh@kernel.org>
References: <20260628135828.1393120-1-ekffu200098@gmail.com>
 <20260628135828.1393120-4-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628135828.1393120-4-ekffu200098@gmail.com>


On Sun, 28 Jun 2026 22:58:17 +0900, Sang-Heon Jeon wrote:
> numa_add_memblk() now sets the node in numa_nodes_parsed itself, so the
> caller's own node_set() is redundant. Remove it.
> 
> No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  drivers/of/of_numa.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

