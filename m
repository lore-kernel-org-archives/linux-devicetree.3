Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A494368D59
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 22:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780351428; cv=none; b=aOJd3RKKJlJDrdN6dKtq/gSCdT1jp47BLValrNKPs9IFXrt+uEQlO61al4Q8nEHEqW/wVH7x8R28tQYRjU1Y/2+FiF3vpelpDWDX8Zvg6H+vt2hexdeeaHN1wnB119KfiI7SMMhB/kdnanhtlKE7aLf12fd3PphxKGzagFnyRp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780351428; c=relaxed/simple;
	bh=JVNWEvHbSv/oMuec1/w+xF9p89ow5kDqjWk9PWPEipY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+UBGezIqDqWRfHY5KcQ+E76TMQu8fOhR0kBSE6q0CYm9DP6/IpyjlqmXBxHWB1KEe7K00JyCE7wYMsQS/LE/8GMuI0naeETHvLxkqpIeVBn9BK2spvL2zSEIKuT6oWR95NK/S8Bwt7GBzUPPPXz/LhyFD4ZcuqxkDqDHW1lWn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWFrhcDd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWFrhcDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277C31F00893;
	Mon,  1 Jun 2026 22:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780351427;
	bh=077gy8AY+hyv37/kTC1iPbzz4eQKyCLUe7EWJcVomm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZWFrhcDdDY/U0/zQADDGcCGETnhiX1SeCAaeSJrsfyCurAfijsUKMpw06iQAL+ykQ
	 B9gGN0OUHiVw0GAQdG+PuZu4q30933Bu2ktu4Zcute3mtRiVTGPbL9c3YcXiFRXtNi
	 hcZoAJFa3/MqKfttCuWFdMBmPx722TKlH0WsvE8a2YYTQBZc/sA3UlC1RfWDPrIa5E
	 aASRDVr48inKKRRJJyJVlTkejqmsqFt+VHq4GT/CFZNvzVbbY7ClbugpDzWp4+jvd1
	 sQ6yvGD0Hp2dHAAmimWolK8BBNgx+BvdrKsKBJgTFEx1oY3w67X3YABIkUdCvLs7ib
	 7Dr/1fB1Kw4NA==
Date: Mon, 1 Jun 2026 17:03:46 -0500
From: Rob Herring <robh@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, saravanak@kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] of/fdt: make early_init_dt_scan_chosen() return void
Message-ID: <20260601220346.GB54006-robh@kernel.org>
References: <20260510171353.1406018-1-ekffu200098@gmail.com>
 <20260510171353.1406018-3-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510171353.1406018-3-ekffu200098@gmail.com>

On Mon, May 11, 2026 at 02:13:53AM +0900, Sang-Heon Jeon wrote:
> Since commit 064e32dc5b03 ("of: fdt: Honor CONFIG_CMDLINE* even
> without /chosen node, take 2"), early_init_dt_scan_chosen() always
> returns 0, so the return value checks at its callers have become
> dead code.
> 
> Drop the return value, change the function to return void, and
> update its declaration and callers accordingly. No functional
> change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
> dt-test result
> 
> [    0.684136] ### dt-test ### start of unittest - you will see error messages
> [    0.685849] ### dt-test ### EXPECT \ : Duplicate name in testcase-data, renamed to "duplicate-name#1"
> [    0.685870] Duplicate name in testcase-data, renamed to "duplicate-name#1"
> [    0.689496] ### dt-test ### EXPECT / : Duplicate name in testcase-data, renamed to "duplicate-name#1"
> 
> ...
> 
> [    1.693384] ### dt-test ### EXPECT / : OF: resolver: overlay phandle fixup failed: -22
> [    1.693386] ### dt-test ### EXPECT / : OF: resolver: node label 'this_label_does_not_exist' not found in live devicetree symbols table
> [    1.694968] ### dt-test ### end of unittest - 405 passed, 0 failed
> ---
>  drivers/of/fdt.c       | 10 ++--------
>  include/linux/of_fdt.h |  2 +-
>  2 files changed, 3 insertions(+), 9 deletions(-)

Looks like this is dependent on patch 1, so I'm assuming the PPC folks 
will take the series.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
