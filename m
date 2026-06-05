Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920C7369999
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 19:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780689383; cv=none; b=fabGdsG9dsprNx0/OUgE0N3436Qv7KkH5rEiG2a3vQy/XG5UhUwrgn2BiA2r8JYcHhvee4T00UO8YNZRaIhPEN4eoL9InVvYd5kCXyJAfO0ASk0UXmK1L4h6iaRDG3An1IcHFOpVTSELcw7nXe5dVroUbkKafQ6EztTC1OS60fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780689383; c=relaxed/simple;
	bh=LRhYKyUlLoZjOuzU/jR+/XoW8IZM6T6JtdUvWnHeqsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GqKpLIb6jDHYteLWaZPrwPBFjC4wa3SAbnq7XVd2c6nec1EBdTmqbMkc7r1M1gmWshkRWs39xR1n8CfEykN2pdTO6hmDcVQP2Ro8HTaFkFMHJEWzr6eeqZ+UREPd0IWCNECnM7ezxkALM1VPKlo921aycgrbl8DgURL0zsMGGjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5ZFf6HL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5ZFf6HL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2184C1F00893;
	Fri,  5 Jun 2026 19:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780689382;
	bh=bn6F07Ciq6AxACCcbuYqHAArQPMXV1zSI0N4Am4Hvw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m5ZFf6HLrRq6fzAzyeSMhxuu3mCoVI51YU1oXVurCJwugIMqvKDgol4Ah84qqnd9Z
	 iAs87TTfkGy99/9WyjuyiOVDxOGdBkHPdtStOGsFJUqyR/kISRNUIesWMBON6BLxQb
	 4+gQoRzXZ65sfIxOTMtYqes9bvs3s6AHaB884pOHz8Mhkdy4jGy2P1o2bRdxifVZT2
	 +t+09Lhue4P9dSA4PqLwbZ3b6xZs+JCFJka99oYFOus2sVhCZRLzl5AN/ancjPSSsA
	 S+keJyMIyxLkjONJeOGC8JRP7C19HIxxj0PkuutWNN+WGTJklsVB1BMeUpnUglYpIm
	 WeRouGxTRQCcQ==
Date: Fri, 5 Jun 2026 12:56:20 -0700
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
Subject: Re: [PATCH v2 3/7] dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
Message-ID: <aiMp5Lcy4Y2m6sJA@x1>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-4-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604143957.668047-4-joel@jms.id.au>

On Fri, Jun 05, 2026 at 12:09:49AM +0930, Joel Stanley wrote:
> Add Tenstorrent Ascalon microarchitecture and the Tenstorrent Ascalon-XG
> core.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Drew Fustini <fustini@kernel.org>
