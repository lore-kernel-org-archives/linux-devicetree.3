Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8598391E64
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 10:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358499; cv=none; b=KJ+wSxiUYiASVMAmxIj5I26RbBSEVh650nLqXEicXiYBCz7+bSmQOVpA96EQ2vfWGjUccH7rzHFHXFkjYBh9Yg6be+BMN9+BVi494i5WLUswhnvFd93kbQYQyhBqW29IFZyY2EKf0DUcjaMj+uQz9v6y/CYikTDTg3+e8vkHvh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358499; c=relaxed/simple;
	bh=b6EUBmm7isqZxvrcdT236gSZAY8yrhfX8QlX0pXzIdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zcq5VSfKMd25NDSIeLPaUgcZDtCAHGZxKJCXS2iYSkjJCrnBTSnvGY5CX6Tz7LJN+DfKarH4/i3CeJPB5GLszyW5U5ZFkIFsxW7YLQxa6rPKzOLtNeIX7O5SwSG9MSFKWHAI+iNXWoFpw6YHVwQ/RE4FbWC3lBZYtB3CdxccC9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0yJQfE6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0yJQfE6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8A91F00A3D;
	Mon, 10 Aug 2026 10:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786358497;
	bh=6vgNrVDergVV34xIB78ZUXhCkNjZOQ6tucWSvMaP4qg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=n0yJQfE6O44C1ybFyPRROzIF1lsBcBU1wKWgfmpuSOx07VgsswNiiEBxEolkrAm/5
	 WXAfN+guSYCboZ2JvLzl/LPSTSnHIqv5o6kgwfyUi3JUF+f5mmrM0ctboe60qiDbzG
	 /MzsPkuVANzaLMXfUtHoCkU7mrF2wFDnB3f3YnF7bdJ1G9vxxR79+VDDZv4q5Zolpe
	 ssEQWfIhxWBUoEQmdJrJlE687/t4VXlLNFYUkwmVcVOOyGb1EY4JpoVCh2MEkAJopd
	 189OlNin/Ze2PtS6RVwmshQ5kx0IN6IBqA0pbMn4XVGmfDOZA5iIeingLJKepZtExD
	 1HzfppxnfzAZg==
Message-ID: <f3fbdc3b-6ae8-422f-a161-8936ffd82abb@kernel.org>
Date: Mon, 10 Aug 2026 12:41:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add GlandaGPU binding
To: Leander Kieweg <kieweg.leander@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, u.kleine-koenig@baylibre.com
References: <20260730173643.256052-1-kieweg.leander@gmail.com>
 <20260730173643.256052-2-kieweg.leander@gmail.com>
 <20260731-petrel-of-fascinating-finesse-cd10ae@quoll>
 <CAMwcS0hupV50NEOX1Fsi_tzRYXBecaummjAm=CFHO7xOT1uUXw@mail.gmail.com>
 <c5f760db-2235-44c1-899c-b6ac023b3233@kernel.org>
 <CAMwcS0jTwpigztHBTLv_sgFNLK0ERHDMzMGsBdi7josLHw56-g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CAMwcS0jTwpigztHBTLv_sgFNLK0ERHDMzMGsBdi7josLHw56-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/08/2026 21:12, Leander Kieweg wrote:
>> openrisc is arch.
>> opencores is entire org. Are you saying that "Glanda" is this one:
>> https://www.glanda.com.au/
>> and opencores releases entire SoCs, thus they integrate their own IPs
>> there into final product. I agree though, that opencores should not
>> define standalone generic compatibles.
> 
> Fair, those precedents don't really hold up then.
> 
> No relation to glanda.com.au, I wasn't even aware of that company.
> This is just a personal hobby project, not a company or organization.
> 
> Given that, what would you suggest instead? I'm open to using a
> board-specific compatible as the primary match as discussed, or
> whatever naming scheme you'd consider appropriate for an individual's
> hobby project.

I am fine with small projects, till we do not have surge of them because
anyone clones some project and vibe-codes new soft-core.

Projects run on your personal github, without any organization, do not
get their own vendor prefix. Why? Because then you come with another
project and want one more prefix... Personal vendor prefix would be
fine, but different thing: this repo for your design was created a few
months ago, with one contributor and ~70 commits. This means it is very
new, without users.

What is the benefit of having it in Linux kernel for the community? Who
needs this, outside of you?

Best regards,
Krzysztof
