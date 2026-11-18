Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017066;
	b=IWNuk02b/TbIuHNLXtpvU+6pNQoBdYEvtlDIi7MDKI0gd5N6viUC6memkzw5bC3lx+Fu
	 ZkMlNJiMGM48GtBDtYWC9rtam9sTJfTz6qUyk9lPDWgYGKKON0XKluNkOfZOl+pJeEnGG
	 Jl1eDQfc04GGKnhHxCCnreN/FGSXsUhF9KFPcRk8GNZ8T0dEl1fCS18ZIQHWpjyfhC+bX
	 zTnsT34LCylw7zMhkQZUT8zBTlbsn260hT67U9MNnJ9UA7HvJPY7HrPcNkCxC+ffyyLr1
	 DvAyLHgAWQTPkwP8T2+zDLLF8qRn0Qo9CJ8WoFl70wuZqOY7VKbWHrGlMICWI32BhAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017066;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=E7MCWPJet3aTaCbmVh247lYbFvMwKIQF4e6MwFSK7Hk=;
	b=Kof29wWrkT0d8tgYFgubgYsCQtuAUEOHvW546BsdlYqn65awpt19V58jiLWNNwAZeQwe
	 UdmZ0G59cbSR7wLV85wIrEnye2JRxtnV2XTrQstsb1Gi6M/bkS9zFnaocKKZvUaP/Zb7y
	 2o4MUiqnjxq0mbTYxXHvToac/lscP42/3yvoHRXgHwuYeN7XH5SE+gCePtYl/sq0l4UrF
	 sdJizAXSKJE+UhFVVnIfiJHbl7s6zu3j/dtQlY7oSThzcW3BXUuMqHe5pCr8FvtL4Hv0Q
	 vbF4VK4f7oAM3GGhCqC1reubxTMygZsl5b8uyzu1wTXMOnzP+xm3ep0yYulgwfF0V+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dC/mzfkR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3F4606A32A;
	Wed, 18 Nov 2026 15:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dC/mzfkR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E641F000C4;
	Wed, 18 Nov 2026 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017066;
	bh=E7MCWPJet3aTaCbmVh247lYbFvMwKIQF4e6MwFSK7Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dC/mzfkRI0S+bemtcVeCsk9CorYyb6AcOpz+tiCbeUWmbtrKWDkEE4nCnzk9HcQCn
	 pIxNEcAQnlSOho2J9IhUJAdeg/zHBXpz8o2EECdeV7YaPi1oehxM1lQo6kBCosDdBZ
	 cURM/nYOVVQ/+l0H68Ai2jEa/a35ETlDmor47TJbh3hkWDMXijnnauRF4cvc+1dLea
	 iLBQWAXvs/YvdQ1OvPNt8kd9zNH6W1m38Fh5hL7ZDrIjobfYd9Bo9vyddDtSPO3xgm
	 rbjGwqI77j8bXtoSZmu7iT3sos6HxnGaojTnyb5wmEyfq+3oZvtoEbZg0nDE7hpPjV
	 1DyX8QdpdBOpg==
Date: Wed, 18 Nov 2026 09:51:03 -0600
From: Rob Herring <robh@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Grant Likely <grant.likely@secretlab.ca>,
	Grant Likely <grant.likely@linaro.org>,
	Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
	David Daney <david.daney@cavium.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/6] of/overlay: look up absolute target-paths
 absolutely
Message-ID: <20261118155103.GA2141649-robh@kernel.org>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
 <20261014-nh-of-alias-overlay-v8-1-0f74f05ac762@nexthop.ai>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-nh-of-alias-overlay-v8-1-0f74f05ac762@nexthop.ai>

On Wed, Oct 14, 2026 at 04:17:26PM -0700, Abdurrahman Hussain wrote:
> find_target() with a non-NULL target base concatenates the base path
> and the fragment's target-path via "%pOF%s": target-path="/foo"
> resolves to "<base>/foo" and can never reach the DT root. An overlay
> applied with a base cannot both extend the base subtree and add
> /aliases entries, which is what a PCI device declaring its
> peripherals under dev_of_node() needs for alias-based bus numbering.

The current behavior seems correct to me. The overlay should not modify 
anything above target_base. Correct or not, couldn't someone be relying 
on current behavior?

> 
> Treat any non-empty target-path as absolute. An empty target-path
> still means the base itself, the only form used by the one in-tree
> caller passing a base (drivers/misc/lan966x_pci.c).
> 
> Spell the contract out in the kernel-doc for @base/@target_base and
> in find_target()'s strategy comment.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---
>  drivers/of/overlay.c | 38 ++++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 83c56dd9b5d8..6f2d7872028a 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -692,12 +692,15 @@ static int build_changeset(struct overlay_changeset *ovcs)
>   *
>   * 1) "target" property containing the phandle of the target
>   * 2) "target-path" property containing the path of the target
> + *
> + * With a non-NULL @target_base, an empty "target-path" means
> + * @target_base itself; any non-empty "target-path" is resolved
> + * absolutely from the live-tree root.

If we are going to improve this, it should also define what NULL 
@target_base means. 

Rob
