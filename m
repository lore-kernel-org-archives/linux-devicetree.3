Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E780B37B402;
	Wed, 20 May 2026 07:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263090; cv=none; b=HEoUOxmecS0StPykdlMXhd7Fx3l9aVgL3RYoAgjibXzVz9TBEbpgHZgbM9H1Vc8VTJ8V7NUNJz5bUbGnTzH+Jqi9IZ7kx5PYHbOJVano+Jj14TI4qtRnaoyQiGqu56gWYdUhvawj3bxm0BSu2jEiedMaMiaYNJLV89iXCxrattc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263090; c=relaxed/simple;
	bh=08yeeQvj4V3fuaT4GbgOATuuKhdJT2iL7G8eeFM2SU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEqTdUMX/JIrW9vECmyjOIvbGExafp2fXDjIoYG2+WYySv0X2V+KMR8esodzTQZ84sLY512pS3IRRsl4aL68hX3/AuPIBefCD/HxgL6E92mu6Muq7zeEs/CTH+Ru5+aAbu9NUB1YQEWDK11tA09gCMN8OtGsi1SY7WAt5D9ZRzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsZ7v5a0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsZ7v5a0"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EECCF1F000E9;
	Wed, 20 May 2026 07:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779263088;
	bh=jX4ff2FUMmJ9PXJW9Z0YTCF6m5Cjwnu9krskjdHWtGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GsZ7v5a0unr6EJW75+hNwGqNhLytOD05dLqEUWb7N3/N/N6rqP60xAYP54BC0SBPG
	 KSeehv8MG2nPTmKk2i2fdsvc5fyX8MeX2+kK1mqyb5AYKU5c12QvUcIWKwqT9OkOsP
	 SNUtRUJL4SgqYgJ9COCFaAKVRNf7E2+azOJeydPIk6iFOK8G62QRJq+6jPsT4ND96+
	 KMRvQNylFbSSe0QLSvkMyjPg9d1uZc9MIU71JdUPpyZ0vtFQfxNVVLlmtie1Brsxry
	 MXZf7TdEwgvVN259+zhSDgjnOw+XaNoxsy1o7QMt/nZBfBosCqnTIP59De3M5gG1vo
	 +soSXIcMg6/og==
Date: Wed, 20 May 2026 09:44:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wandun Chen <chenwandun1@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	zhaomeijing@lixiang.com, robh@kernel.org, saravanak@kernel.org
Subject: Re: [PATCH v2 1/3] of: reserved_mem: avoid unnecessary memory
 allocation when __reserved_mem_check_root() fails
Message-ID: <20260520-cuddly-imperial-bison-ec3c4e@quoll>
References: <20260519082427.4181476-1-chenwandun@lixiang.com>
 <20260519082427.4181476-2-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519082427.4181476-2-chenwandun@lixiang.com>

On Tue, May 19, 2026 at 04:24:25PM +0800, Wandun Chen wrote:
> total_reserved_mem_cnt will keep the init value (MAX_RESERVED_REGIONS)
> in fdt_scan_reserved_mem() if __reserved_mem_check_root() fails.
> 
> fdt_scan_reserved_mem_late() calls alloc_reserved_mem_array() to
> allocate memory according to total_reserved_mem_cnt before
> __reserved_mem_check_root(), so if __reserved_mem_check_root() fails,
> the allocated array has nowhere to be used, so no need to allocate
> memory.
> 
> Move alloc_reserved_mem_array() after __reserved_mem_check_root() to
> avoid potential memory waste.
> 
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>

Authorship/DCO mismatch.

> Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>

Best regards,
Krzysztof

