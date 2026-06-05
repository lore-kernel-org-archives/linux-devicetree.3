Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C63922538F
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 19:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780689254; cv=none; b=jOf0j0W1oQ8wnn8W4XX8qi4sslqjKUawYj40EEHXRPHTBl/LCPFcA4wxDKmoO4GcEPto18MMMMkpa7Df6Ei0y+4JxKqrE5xCrN2NvP2hTySfA5aDpOf1AQB1vVjevqj1RfCKWyVGY4h3mgSZ/xcnCPlZR7yVpktH6VfmqFRT1ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780689254; c=relaxed/simple;
	bh=HzYRbkW4t1qkV4OOv3phcj/5Qqs8N2a2eoCdlIHCfcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OakuU/y2TI9T+XZs2QXDa9Dsy/m74uS+LOYzS6cb4bJNsX3Y+acBMRctrmmtYu9iiMAO07eODO/anam7qralQouSUuC5CPi1dGqhOk2Gq5Y9QYtgQkdnnjJRKyYW6o6mJr4lIRUWDsKtz45O6nugWRnWQfTw0SVY69lnYMwkD4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzZCVn5k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzZCVn5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E8C1F00893;
	Fri,  5 Jun 2026 19:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780689252;
	bh=p/pcvISMdGSURalgNXTgQExEqZketLGMU2kKzQ/4vPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZzZCVn5kRIZSOzAFvVFc7wpjuGPGTJANdMjAMquYGdsX4iP1uzOZ5LDBCxW5pKt5T
	 h/3J1We9d9O3h+GXBFhP4dpim17XAvcjZYbIKD4HjhbNbFpNDGOb/1SyewVOcVJ8xe
	 gKsnt8cJJw3ZxiEPXW6WRmnFgrss5y5u1+H55PV5YM6pgpWGwXUOFiNFPsbCM2oe6O
	 4c+WfH0Bw+VbTAU+XC8xeEb6i8DWeE1FyMzgfa47J16BXe8oXgrpjeijbXfKpM3719
	 S/a83dTOMaNVseYpwYHJVvQWRAWzQGCaMZK0U7Kj5t5nHzc6Pl8d5xaENwwO3sxg0k
	 XKAKaUHVYb3Qg==
Date: Fri, 5 Jun 2026 12:54:11 -0700
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
Subject: Re: [PATCH v2 1/7] dt-bindings: aplic: Add Tenstorrent Atlantis
 compatible
Message-ID: <aiMpY6tjGhv/cRWI@x1>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-2-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604143957.668047-2-joel@jms.id.au>

On Fri, Jun 05, 2026 at 12:09:47AM +0930, Joel Stanley wrote:
> Add compatible for APLIC in Tenstorrent Atlantis SoC.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Drew Fustini <fustini@kernel.org>
