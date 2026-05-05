Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B2C3D5648;
	Tue,  5 May 2026 19:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778010268; cv=none; b=ageWSz2pb+pv/y9R1ZcWlTWozu0FLclf82/vnDqClwmlniPMGx/UsT3Feh6lcjK9ogJtC93UaoNOysVbz+DtyQ9dBTUU0YDRXm/EQbEbBmUWRMr8lQpNlER8HjppiHtTUv9DKTNfseKA0VS8bKm8mMRNVr9oZjkoTXvPfQA3AhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778010268; c=relaxed/simple;
	bh=OGtcBVn9FNPkzgL7jr/JLAoaV2N1LFR9tOeyAnA2iRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXXx8nuLXXGp6algq1crneRKmtzPdz/seBUiF9p7joCwkS2t5zAmClQksqwxGhcI6HbDsQWsU8OML7sa0YV+OTSJEez3xcvMxJ3cC1pgGnYBF6aMcOzv15dmlwFJ7JXy4P1eSLCAJszI9LalhCKZh7Bv4t63yuyY4XftA0AZdc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oA5hg/8D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oA5hg/8D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F10C2BCC7;
	Tue,  5 May 2026 19:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778010267;
	bh=OGtcBVn9FNPkzgL7jr/JLAoaV2N1LFR9tOeyAnA2iRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oA5hg/8DmCuEcReclaATo6yiNOoUtG7EOuK1WalAxj9QVTV/W3cHSEPS2CrYW1tCL
	 vhuVktAb7EZdkZfA9dSExmyV5ZkbaAh2VU2zfdrZYA3RTsGYveIDTGu3/AmeFoYTR7
	 0nJPIcQU8ytuFeS3m+ivmeQi/Utrrd+AXllg5VOq7IdEuAh11jHxc+T90ZUyvW/8mA
	 v323KrFTR3I4Xih8BqsImplxEamaOFUqzc+e73hiNz+A/nbLud5NFVuCDAJfsRoEjd
	 7JT5g6lgNhOQIZ5fwBlvMf0oLV9ZBuir2oEHtvgAE4NU8cNeKpqMU0Dhwz1y1Q8C8T
	 xa99OQsLeN5sw==
Date: Tue, 5 May 2026 14:44:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: stable@vger.kernel.org, devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH stable] scripts/dtc: Remove unused dts_version in
 dtc-lexer.l
Message-ID: <177801026318.3805973.8766967716439336298.robh@kernel.org>
References: <20260420-stable-dts-unused-but-set-global-v1-1-9bdfba6889bb@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-stable-dts-unused-but-set-global-v1-1-9bdfba6889bb@kernel.org>


On Mon, 20 Apr 2026 17:36:46 -0700, Nathan Chancellor wrote:
> This patch is for stable only. Commit 5a09df20872c ("scripts/dtc: Update
> to upstream version v1.7.2-69-g53373d135579") upstream applied it as
> part of a regular scripts/dtc sync, which may be unsuitable for older
> versions of stable where the warning it fixes is present.
> 
> A recent strengthening of -Wunused-but-set-variable (enabled with -Wall)
> in clang under a new subwarning, -Wunused-but-set-global, points out an
> unused static global variable in dtc-lexer.lex.c (compiled from
> dtc-lexer.l):
> 
>   scripts/dtc/dtc-lexer.lex.c:641:12: warning: variable 'dts_version' set but not used [-Wunused-but-set-global]
>     641 | static int dts_version = 1;
>         |            ^
> 
> Remove it to clear up the warning, as it is truly unused.
> 
> Fixes: 658f29a51e98 ("of/flattree: Update dtc to current mainline.")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> This should apply cleanly to all supported stable branches.
> ---
>  scripts/dtc/dtc-lexer.l | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

