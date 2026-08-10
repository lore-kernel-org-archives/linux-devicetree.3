Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A5C41168B;
	Mon, 10 Aug 2026 18:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387120; cv=none; b=ip3UVxECb1n4g/YCOWpoA5GzgQq+RoB0nX8PKd1NGynRWhzSYcOLHuOusJpxunE9TGBfjL4fTj4pThI/502DPs9wjHqjYsBxMc9v3VKd3gjInk6aBjb7MOxJQjS1g+HNs8SehZPSrwHzLxN92ICSQiJN4D7ZtMba4DyRHDdnAOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387120; c=relaxed/simple;
	bh=S6dtVWS9gIX3IbHHv41v47jQUkYsTAiRTJeYZTW6Qt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1Jx8XFsJ5Rsmumcu7c67R9t9wXZEGPOBdZPwK4o31y3F4M6TAX6GECXG2qOcg+5/oA1i4bRZtQmb4crlWSw7w72cuyN9mvhMY/S4Q//CN2iGRZqe5JGbvHg46L/h/AO4cOsLJQ61cjSW7hEb8+66bE4y7rAw3Tm/zIurpLVtuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZE1c1c2u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZE1c1c2u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8301F000E9;
	Mon, 10 Aug 2026 18:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387119;
	bh=8qPdYKtg8BB+717fwRNd4rADjpq1y6saXe4wFg1Ozak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZE1c1c2u4c10veg6wI9NUC9bzClu2ERIZ5DF2tPsLZhAL54LhzsXNM6Ukwbkpaqt7
	 fXkKwacN0yWnGzB6kTNBFWDzBy+s87KinCXM5NErPB4+Tm8o/OrLW/rIm/bUiQOb7D
	 /wOzaEj+HQ6Gymf1nRyf+30VxqHYiObnRz1BzTU5OwUgkc6lPAjzrSS9xGgcBTb/+Y
	 xAXuPTSmR412m1379cm3X+9J8hxYl3VSd3nqM7PfDiTw+AG1CIwnpV0o7SchOqEars
	 m0WzMMnkSNjKIryDmVOLjwVE/Fv3kaBbNlPaEgBoa/AkZsENwp+ZgHYXONnxq8OFRX
	 w2rVFFzfwh0gA==
Date: Mon, 10 Aug 2026 13:38:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] of: reserved_mem: Introduce devres-managed
 initialization function
Message-ID: <178638700179.2635158.13908050505282451678.robh@kernel.org>
References: <20260730073214.1146432-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730073214.1146432-1-mukesh.ojha@oss.qualcomm.com>


On Thu, 30 Jul 2026 13:02:14 +0530, Mukesh Ojha wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Introduce devres-based helper for of_reserved_mem_device_init()
> to help fight dangling references and ever so slightly reduce the
> number of boilerplate deinitialization calls.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
> - Separated from big series with multiple API users to avoid clogging the
>   series. Instead of merging all at once, the plan is to land this API
>   first, then post the individual subsystem patches that use the API.
>   There is enough user of this API given in the last series.
> - Rebased on latest Linux next tag.
> 
> 
>  drivers/of/of_reserved_mem.c    | 44 +++++++++++++++++++++++++++++++++
>  include/linux/of_reserved_mem.h |  7 ++++++
>  2 files changed, 51 insertions(+)
> 

I applied for 7.3 so conversions can go on top of 7.3-rc1.

Rob

