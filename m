Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF413CEBB8
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 19:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780689332; cv=none; b=Jheps/LcHAqXieO/Vvf56UJ+yzIqk6b3ZNIv2feQlVYBLNteNdYKLAExQq+vFYSHFVFxEmdmqbBid2tOPTW8sFGLngQs7mFcOvQJ5soSOZiuqDIKNnHF9XoTOwCG/5gazjtaLs7LG2QjA72Ntjnusy3t1uOfLbffyWsFk1bP434=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780689332; c=relaxed/simple;
	bh=6/E9airxu5zkNLZL7rgdJV42bpBjleUVUDZasaFgx3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIBddg9OrHtGBQtvbL27Cb2yEoW0jd+caypEIn7QdleGQm1cDyy3u7ha4j5R07iV48wJ3m8Xv81cASdynhGASD5UnjVraEeSRDLBBm2MQDWT0qE92tzo4ofyGEK8f27zftZEY3/GHUU/3itQ8adV4j6LiPeULyWUC4hhkUbxGQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGMjkSAz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGMjkSAz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E371F00893;
	Fri,  5 Jun 2026 19:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780689331;
	bh=XD4+83bQJPE/ztJNw5wmsthcLYcRrVsiS0E1k3/H1XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iGMjkSAzuN+dvV2bWIV3rju5KH7NUTZSqmLOyIJcCJXh4oK9qyOMFPySl0AQj5isl
	 0nTEZ2E9jmzQIgeVjex+TKMPwYnRaQa4CcAg8KuJj8iihXN7KM6v6puIqCJ9M+6Gq/
	 goTSeALI3GJ5S0aT8JRKJB9Tbsygk6kUHUcJYI+494K0atAIyq5Bdjvpi3GddX8mKs
	 /bosXzg2DL3OQY3ylslOpJMMQUWI2FplogxuslFrQXjDfhmaoKrDZP0AB4uz1q5LO+
	 vIPKEMzrIPEZ52NoBrFO7VZ/8i78qVam0vyT+LtCKgogkp/yyQswBP3U4gxoRiEIuA
	 xs+cecBrXwzGg==
Date: Fri, 5 Jun 2026 12:55:29 -0700
From: Drew Fustini <fustini@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/7] dt-bindings: riscv: Add Tenstorrent Atlantis
 platform
Message-ID: <aiMpsQDN0IGjjwgj@x1>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-7-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604143957.668047-7-joel@jms.id.au>

On Fri, Jun 05, 2026 at 12:09:52AM +0930, Joel Stanley wrote:
> Add compatible for the Tenstorrent Atlantis platform.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Drew Fustini <fustini@kernel.org>
