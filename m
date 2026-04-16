Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7B138AC66;
	Thu, 16 Apr 2026 11:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340190; cv=none; b=M+HjEub/CujyeyrhZ3L8858LUVjUyqtDV71Zh5oplXHcYaJ9c4pFfn4TijLw51rtBHjHYLHoKqHKpilLChhfUoqbBaytKHpDPNWno6J+zsjZIGb8/a9yrGy1lBdPIYgwS/prg9veqTKwKgX894r7Ab08ro5lB4JnkhhasURSLTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340190; c=relaxed/simple;
	bh=jv8tg2vnWxo/gXHekCiK13zL+dexqIfu99Q+x+WLn3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8sebhpQcC02Ad9Vh3FkPzVH8zVzsoE0XW6e8hidO1PfvHM9JCORZSyfScm1itoXHL/Z/k1JqZxkHgmm2f059nk1J3DwwqyrwOfKPN4Mdw03HaiyOfuJn094JQep9KJ6AtMxmMfDgXGIAAKHt8YosPFbhRDvTGvZ8O2kLjOfZ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsMNmGiC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsMNmGiC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96107C2BCB3;
	Thu, 16 Apr 2026 11:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776340189;
	bh=jv8tg2vnWxo/gXHekCiK13zL+dexqIfu99Q+x+WLn3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RsMNmGiCpU3jrBMczweQA9NsaT4kM9YXBDxD5RJaDNCc3HdJt5zgzRKK2w7QMkali
	 RN6K9ZSAxLTHHnfkyUi8YtCfKzK62KwHmGsjp29VQfQ5lF+GtTOYyFk3NcYfYWpH14
	 x0MklH5a8PngiFiA3ZOFLxknwDfWJGoRx2+tE0o+7gz3l6k2VOGZdeSIDt4TtzIeu+
	 eUWIn53uPZKl6YJEc5rHC8SHMCWDGHlOUHCdO3a/Bnyyji0WDCLF3uXqJ6tRDFhAKU
	 B9RXVFdS/if0oH4dad6VCD2URKsBIaY3YeTjbpYc2qUIcYtl8ohWzQvStmOtgp1ynz
	 V98/3tIGE603g==
Date: Thu, 16 Apr 2026 06:49:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: saravanak@kernel.org, devicetree@vger.kernel.org,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] of: unittest: fix use-after-free in
 of_unittest_changeset()
Message-ID: <177634018595.2718984.9279433052503511715.robh@kernel.org>
References: <20260409022233.418103-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409022233.418103-1-vulab@iscas.ac.cn>


On Thu, 09 Apr 2026 02:22:33 +0000, Wentao Liang wrote:
> The variable 'parent' is assigned the value of 'nchangeset' earlier in the
> function, meaning both point to the same struct device_node. The call to
> of_node_put(nchangeset) can decrement the reference count to zero and
> free the node if there are no other holders. After that, the code still
> uses 'parent' to check for the presence of a property and to read a
> string property, leading to a use-after-free.
> 
> Fix this by moving the of_node_put() call after the last access to
> 'parent', avoiding the UAF.
> 
> Fixes: 1c668ea65506 ("of: unittest: Use of_property_present()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/of/unittest.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Applied, thanks!

