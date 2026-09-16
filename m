Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A066646D2A5
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 21:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594401; cv=none; b=BdyfFNBdO/5IRgX3z2rODgSO56xO4WzWHES/jEsm6In8rozgUD1faTEHVwjfxq9aqb/7AMjEU1ND6q3xjl1yiqSLssHtVpc6h/PSxR7lzY1ky5Uk8fFQKYNZ69rVA7ts/p/pQgkYNR6XE6yoyo7cyU6glZ8/JYw3sOABSwTqgmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594401; c=relaxed/simple;
	bh=+jsHbcYSOH81CHrwp/vaKe5fhCX1izSfMk6PBFFuxEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSmVk4vfMAeekSavRgsrR+RzgkXpLS5o9/vX1lVvXKycXc6Ka/SDs0IzGqwTUgLwoAuagPiFDZT8BIda1nB0optttdGgevrxrlKuY1GzfoU+FNdjvLA5TYjD8Y7KMfkgMT6H8AcIFTID+IFgaiNp5LepDHi97KoXiLmcxSVEGYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwqLFUSz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwqLFUSz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE951F000FF;
	Wed, 16 Sep 2026 21:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789594390;
	bh=8veXm3vxjyl1KtjiainHK0MBYnJKTd1H1YON35xITO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YwqLFUSzT/KekrAVvsfVWaKDcVLAF5vqu+u2ErYbgMT6QiAlwmwjgU2LraDGw7zNV
	 NZS1uiERxDpu7CsmZx4UmXfR6pDTTAMQxhEQsDmoXTOwRaZ62VkMtiEhnx9KMuXdKF
	 h+lt84HgYI8x+WcUf0vPphEo+Zxk+5UrvdGFNGSjDm3RHLfnp91fV/ZfGYNXhw3CVE
	 nGJzdhTRDBzK2rFLrO1vEVyUvQ23CxMThtzCZkNOWXl4QjLHndiQNc81ySIHCzfvrz
	 0GcwGBoEF8ghnhmFlduUKL0aVfVVmHXMqPoDqhE1NKZgDhMXiOgS4+zPzupF+81gXz
	 OzmwbkOIYikig==
Date: Wed, 16 Sep 2026 16:33:08 -0500
From: Rob Herring <robh@kernel.org>
To: Haren Myneni <haren@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	saravanak@kernel.org, ritesh.list@gmail.com, hbabu@us.ibm.com
Subject: Re: [PATCH 2/2] powerpc/pseries/dlpar: Remove DT entries if failure
 from CPU ADD notifier
Message-ID: <20260916213308.GF1926857-robh@kernel.org>
References: <20260916043249.2062676-1-haren@linux.ibm.com>
 <20260916043249.2062676-2-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916043249.2062676-2-haren@linux.ibm.com>

On Tue, Sep 15, 2026 at 09:32:49PM -0700, Haren Myneni wrote:
> For CPU ADD, the device tree entries are retrieved with
> configure-connector RTAS call and attached to the device tree.
> Then the CPU is added as part of DT node notification. If the CPU
> ADD notifier returns failure, the corresponding CPU node entries
> should be deleted from the device-tree. See pseries_add_processor()
> for the possible failure cases.
> 
> The current code does not remove CPU node entries during CPU ADD
> notifier failure and causing the following issues:
> - Can not add this CPU later since already present in the
>   device-tree.
> - Trying to free memory allocated to CPU node without detaching
>   the node and it causes freeing its sibling node (existing CPU
>   nodes).
> 
> This patch fixes this issue by calling of_detach_node_no_notify()
> for the failure from CPU ADD notifier which removes CPU node
> entries without calling CPU REMOVE notifier.

Would using the of_changeset_ API directly solve your issue? It's better 
designed for handling reverting a changeset. The of_attach_node/ 
of_detach_node() APIs have limited users and I'd really like to remove 
them. Or make them PPC specific perhaps. Looks like there is 1 non-PPC 
user that snuck in.

Rob
