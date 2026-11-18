Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017222;
	b=SkJ+uV7eGzKHYUgxB2m0oo6/tewiHmSPhD9pyut5ptl9vayFNzTCpp3331RS8MbKpRkD
	 +s4TwIy5kT1+cqFqphnBLKOrM6T3WxSHFbcSO9CHUKzxapQ1gosZLfv1q68mFdig96GfP
	 JszKef2g82Ks55N9cdT/w6YlwbyCs8rjSPnoUe+WiC0/yqTNbyqVU0BUSBlKCxDJ+n+n1
	 fXcmEpXEOoLUY4P/WxXKSPhUWDoVN6aLUpAY2tr7of9J4hkHrnaeP2s5iet4q86RT4ITA
	 AOrrgcCea90lRuVCAECoJtIF3fP1EdPloZTxAD/ozppBho1rpQmNHrgMlz7/Q1iyRgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017222;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HNiPOKXF289pgv58kx2b9HlNsQ5+cIR4teF/nLizEnk=;
	b=HFeD29g5LYuuXxY7Nw23rFoAtbaNavsYfNDaxIfqNuYAekWSyklOxbuhGIAcH5X98Lhd
	 /KTxZlR7Baejb3hsjj+BVzxd4VQF88MV72Di/gTHbG4/ExrYD7bpTHQtgrWFYswR5Kf+S
	 KE6f9WFnhG2zwOVKL2LOhfWyUXEM66Vja+2MrW1g+YkfkS6CpqArb/MgkS3kzrcbifulo
	 mms9ORJKYZjIV3OEN74IY7sAjoC5M8M7gN/kbupG8ZezueeH5MvJ9xJEHIR5IUSkKQoVj
	 YgBXfVxLiD/erX8liY2dridUmJDQvFp2TANvfCtenul6b2M6HFiDDb+BbDNH56+QYpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JTDtSkhi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC54606A332;
	Wed, 18 Nov 2026 15:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JTDtSkhi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61321F000C6;
	Wed, 18 Nov 2026 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017221;
	bh=HNiPOKXF289pgv58kx2b9HlNsQ5+cIR4teF/nLizEnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JTDtSkhiAL6VzBJ5tRJMgxCK8addmrtmLUcB/29njI/dtlUvCArVvuPf7PpO+61Ee
	 j8w40JXVs0rOkTHYsrcdXJKfGIgClYidk+7M1r2ZquMDBsf7CUQJNage6I6hTguoiT
	 +NplPqF6IPxY+Rzqkja40ZSASsfhUwYJz/UbyBfi4BxK2A4G0CQlhWr392x5UHfZ4V
	 Bc1EDEVkdj0SC2A6lli2z4u22eDpATOWjhU5oNIN2pjDRUqbv0oAOubfWNcKKrVW7A
	 8Ayao3VTsC+gF8EC9Vz6IEB0Q3Yam5djul/dcivN9CRbapPX9WDfK3tokFGoR6odxR
	 0kQ2ZhFoKmLlw==
Date: Wed, 18 Nov 2026 09:53:36 -0600
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
Subject: Re: [PATCH v8 2/6] of/overlay: return ERR_PTR from
 dup_and_fixup_symbol_prop()
Message-ID: <20261118155336.GB2141649-robh@kernel.org>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
 <20261014-nh-of-alias-overlay-v8-2-0f74f05ac762@nexthop.ai>
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
In-Reply-To: <20261014-nh-of-alias-overlay-v8-2-0f74f05ac762@nexthop.ai>

On Wed, Oct 14, 2026 at 04:17:27PM -0700, Abdurrahman Hussain wrote:
> dup_and_fixup_symbol_prop() returns NULL for malformed values, for
> values that are not paths into one of the overlay's fragments, and
> for allocation failures. The caller reports all of them as -ENOMEM,
> so a structural problem in /__symbols__ is diagnosed as memory
> exhaustion.
> 
> A later patch reuses the helper for /aliases values and must handle
> the three cases differently: copy verbatim, warn, or fail the apply.
> Return ERR_PTR(-EINVAL), ERR_PTR(-ENODEV) and ERR_PTR(-ENOMEM)
> respectively and propagate the errno in the /__symbols__ caller.
> 
> Also verify that the value descends through the matched fragment's
> __overlay__ node before cutting the prefix. Only the first path
> component was resolved, so an absolute live-tree value sharing its
> first component with a fragment name was sliced at the prefix length
> and rewritten to garbage. A prefix mismatch returns -ENODEV.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---
>  drivers/of/overlay.c | 35 ++++++++++++++++++++++++++---------
>  1 file changed, 26 insertions(+), 9 deletions(-)

This one seems useful on its own, so I applied it.

Rob
