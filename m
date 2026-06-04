Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F15D72623;
	Thu,  4 Jun 2026 19:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780601618; cv=none; b=JxzbFe77UpJiSPqEXT4v2nKrGlUwlicwf4HUfn7h6nIpV7lJUvNlbtyPDf/lLE+PmVdW3n6JGuBv3oRBXPqS+RmgHrUqXFcmw7Qy7Fi4wJAZagwoBSyuDoHrFAsHnjX+mQi9OkzuNVuGtp5G1lBm8c9NZeL0SogQTBLBEt2dpBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780601618; c=relaxed/simple;
	bh=tapovurhsuNwdFtiLZEjabmJvLQN+amiqTTH35i2pEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqXjmwV96wwqmmarEI5kk8BLZK4xV40kJUshYxUFPilBs7+10a5rqI6Xldq0/uX14EPrt/SpljLghNpyCLQkI+kwW4Rb3ERA0/P30Ij/FvVV5Dk84OgArLywjXX4vscnKKz0Ey6vmf3bJQo6EoY0dEJAPNRyiF2iHHGZ+eM+ZEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKPD11o/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKPD11o/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9FD1F00893;
	Thu,  4 Jun 2026 19:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780601617;
	bh=X3LZgbWaMPIFfnmNXMUw7DOQbRziUNGX+uylYYHTSls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JKPD11o/zOQLphOweliTavjegMBRPwjI41iKabJ+cm90Ku6b5H2tos4Jz1rxGzV+g
	 WmWglbrhRq4kfV9pfyPfBQvejIQFIAJ5rVSPYNBJwbb5DvQlUZ36x1MdeXeVpn7n56
	 hrnIOO8hbyg/UDfZBE+zc0L0ikBowBtftepsoxH9bsALeok65EAp70cIrt1zvsbXgN
	 8/cj3Ft7nIlzq4nG74GSrlzTeKaQ+GsQcF0+LnRpMtE6h2qGMuy8sq0BWgNXgqZEQs
	 UUMlWBguySQ7jn4jdis7XyoQ+ICJoLvApb31ljWOyH64+izvfR7QBOKxcaNetkA3/n
	 4ueB0b/kxQtDQ==
Date: Thu, 4 Jun 2026 14:33:36 -0500
From: Rob Herring <robh@kernel.org>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	saravanak@kernel.org
Subject: Re: [PATCH 2/2] of: reserved_mem: add config to extend dynamic
 reserved memory regions
Message-ID: <20260604193336.GB1057262-robh@kernel.org>
References: <20260604073611.3954433-1-chenwandun1@gmail.com>
 <20260604073611.3954433-3-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604073611.3954433-3-chenwandun1@gmail.com>

On Thu, Jun 04, 2026 at 03:36:11PM +0800, Wandun Chen wrote:
> From: Wandun Chen <chenwandun@lixiang.com>
> 
> Nowadays, the dynamic reserved memory regions is 64 by default, If
> the count of reserved memory regions defined in DTS bigger than 64,
> only 64 reserved memory can be handled properly.
> 
> So add a config to configure the actual dynamic reserved memory
> regions count instead of modify the code.
> 
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> ---
>  drivers/of/Kconfig           | 11 +++++++++++
>  drivers/of/of_private.h      |  2 +-
>  drivers/of/of_reserved_mem.c |  2 +-
>  3 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 50697cc3b07e..d6496ec3765c 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -99,6 +99,17 @@ config OF_IRQ
>  config OF_RESERVED_MEM
>  	def_bool OF_EARLY_FLATTREE
>  
> +config OF_RESERVED_MEM_DYNAMIC_REGIONS
> +	int "Maximum count of the dynamic reserved memory regions"
> +	depends on OF_RESERVED_MEM
> +	default 64
> +	range 1 256

My opinion on making this a config option is well documented. That's the 
primary reason we split dynamic regions.

How many do you need and why do you need so many regions? Seems like an 
abuse of reserved memory. 

Rob
