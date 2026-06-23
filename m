Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A93613E02A
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 01:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782178968; cv=none; b=onUibRrggolst8D1Vv/ttBHlEjK9uZW09qb+oaJDL1xmzD6olaF4SmuTrhyQkine4X/5wgWFJYag5iQ8hT7aiMGNVm5nUzar9Egs9YZEmNrRnxTlBhMCYEhwO59jS7mTzMr2cuwuQJWUBSMhKqvCb5JIkTK1kpdbjOtIHZoIKJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782178968; c=relaxed/simple;
	bh=HPbmJO2xKJSPMaYmQfFF2AqtD5rziv9p7QfKj8uSRhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giFFYa5JwLAE4LAjGfNg/LNUYsQJsz9jmKnhP7FvafJ4rATWGWRZH1P1hyY4HBsCcnPfhxkep/K3j7mxHloIYYfGCk9SnqaukPNFyEkcqkv5UR5a3NuhMoT81AkF9SIVv8dJA5whNfYunH1MlvPrFvusi/3OyEUd/aoaAuRnj28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmNwEa9Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TmNwEa9Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42CA1F000E9;
	Tue, 23 Jun 2026 01:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782178967;
	bh=6r+cTufWcKj1Ysc3B4GsSXTCbjvPL8Or3bpDF7XAKpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TmNwEa9ZB8vWzCf3jrCxS0bQfPidyCCQk8BhX460Go+kgr1TqzGWaK65QkpJXl0qK
	 WxcgXkPZIU+UWgMG/QoQqh1Q0c3swkV0Lg0zw3Fma9ZihHKQUyqGUbgyFFka1rB9Cm
	 VBJlOEhk2OVcuWnCaUq7S0tnyWJR9rUF9GiYpeO9q781zhoEriXb69XaYHJFtYTKrM
	 ns5VfHBTJ0ydG8vh0wb5gQFyLS5P/4pykVHR66kh96yc8LS+o74JWqu6+Q2bPr+8Q7
	 EkztWQqmOnifWd6qzT5XK5CX9j25uMiO98P8ZzNAooWEBVr125tg6LzwnuuXGXLpaq
	 Oni9WZNZuJQgw==
Date: Mon, 22 Jun 2026 20:42:46 -0500
From: Rob Herring <robh@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <djbw@kernel.org>,
	David Hildenbrand <david@kernel.org>, devicetree@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: Re: [PATCH] of_numa: fix return -EINVAL when numa-node-id is not
 found in last node
Message-ID: <20260623014246.GA3897146-robh@kernel.org>
References: <20260621143919.4176646-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621143919.4176646-1-ekffu200098@gmail.com>

On Sun, Jun 21, 2026 at 11:39:18PM +0900, Sang-Heon Jeon wrote:
> When the numa-node-id property is not found in the last memory node,
> of_property_read_u32() returns -EINVAL, which then becomes the return
> value of of_numa_parse_memory_nodes(), even though earlier memory nodes
> were parsed successfully.
> 
> Commit 7e488677a54a ("of, numa: return -EINVAL when no numa-node-id is
> found") meant -EINVAL to be returned only when the numa-node-id property
> is not found at all, not when it is found in an earlier memory node but
> not in the last.
> 
> Check whether at least one memory node was parsed successfully, and return
> 0 in that case, -EINVAL otherwise, so the return value of
> of_property_read_u32() for the last memory node no longer corrupts the
> overall return value.

IDK, it's arguable that an incomplete DT isn't valid and something we 
need to support. Is missing numa-node-id valid or it's just better to 
have at least partially 
configured NUMA nodes?

Rob
