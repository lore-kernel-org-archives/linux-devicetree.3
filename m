Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5576A47ACD1
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 22:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789684462; cv=none; b=oOcIeb8jFt/FVpcLdUJ3bZME5YPxaXPdnWXy4TROcHIGGpw1AG2npbjHof8ODD1BhKSctOv2xS7EtF1mfKwOyZu+Tl/bSelWq6CXCltuZsRlj7n17q5vsBtH0C1+3GIFruJwMf6Xt1PXzyHN5kooDGxjJRXIDV952QGEfswk3no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789684462; c=relaxed/simple;
	bh=rvyrRKDyIwH/xuoZljiLr0episragvgCpimM45cS6hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBIlvPt4aJAvL7F0eEtKNEoW464gkChOK/bnX3MLwk4o4WlGuG4Z4edQ5AA9VWWMfD1diY7mSdLVfohHzerkT29K2G4MuYdCmsrAcF/pAU7xPUf1iludXeMgS7H7D+YL6T7LTS25/gV4fPAldpJYEiMaRMzzFTw7T2qy//i6meU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=goUe9GBL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="goUe9GBL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C638E1F000FF;
	Thu, 17 Sep 2026 22:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789684461;
	bh=1s/jinvwMenyvXiaebZjfzkp9Wrp5sapoHtm4qw6kkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=goUe9GBLqvjU40ZCGT8+CXe1oNh872nMtXMhcVH2VHGqKXrx8aBXV2fb171aVFZTr
	 wb7HND95yWT8KKD8q+TyqxTDHQJkPTsvIfcGs5nnrz2DH5sNa/63qUjXrc5hpNJ2Xf
	 D6rN3YtcOcwgrZd1A/6mSqv4Rd8O9kKJgZUrz5TjCgbAbRxV+n7kVoILZOo8u6roa0
	 TTh0Ash6rdIL2yllfkFDR6JP/bPGye12g1YHaye0B5apJWF7JdT4+oxpYGk/8YKyKa
	 vv1oORBoUXTrPbLpTAg0j95BUiedEs4pA7cRRBCz7Ppac485hsGA25C/LIZe14L8FL
	 i+BbLCjnF9G5g==
Date: Thu, 17 Sep 2026 17:34:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] docs: dt: unittest: Use unittest_data_add()
Message-ID: <178968445835.4113307.13288253310633601822.robh@kernel.org>
References: <20260907013030.22528-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907013030.22528-1-kmehltretter@gmail.com>


On Mon, 07 Sep 2026 03:30:30 +0200, Karl Mehltretter wrote:
> selftest_data_add() was renamed to unittest_data_add() by
> commit 9697a5595ece ("of/unittest: replace 'selftest' with 'unittest'").
> 
> Use the new name.
> 
> Fixes: 9697a5595ece ("of/unittest: replace 'selftest' with 'unittest'")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/devicetree/of_unittest.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

