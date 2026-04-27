Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08FC30DD3C;
	Mon, 27 Apr 2026 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290999; cv=none; b=a8IXED9DUQv0LyWW8PRtlBKSal5XP+dJ9B0vaX8StrbhjimtoBT5BCLG4s96sC36Ub0YuUKaEOQ+N+FFloOlu1B02mWOOVEGiEaXYdHFvFxqsTaknnl6i0P/34+2JEItbNJhzChxQahIV7MvYbdgzGJtUHzWtcBksMHBJfughpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290999; c=relaxed/simple;
	bh=HS/qE5mobVfCUPKiSltjkwD69aPeYCoTkfTUr7sMf6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onBOLnv3v4C2eKznBp2UXkQB6rabh7jo8WTruV7wdlYZt1sagmNclucQZwvnOEVxl//A34gYpKt+vAR4PQwNsrME01hDEbrQ/HRIcRK4+GQOiQVUo3JUCH2eXfMdUrnKSVZ1J/5BX8BNvNQ8JWE+RrlwqbQ5SDoqse/pj2iPWiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=sxqrjmUP; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="sxqrjmUP"
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8B3902007D2;
	Mon, 27 Apr 2026 13:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1777290996;
	bh=HS/qE5mobVfCUPKiSltjkwD69aPeYCoTkfTUr7sMf6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxqrjmUPjWrbltZlVk9Ta0RHRrPfv0rqPnWQIE1XQbA4tasjmy6RqcaDeh3vA7NQL
	 fhuZmQqkOofCKrTWwrVZSee/g4rZDR8QKJTT20ADU0znD01MKp0L0KimdeRhWGaaS0
	 TkMF7R4ydUK4eCSwD5z/0aH1gXH90fRsfoRemWxKKuxNM+K0QXiaD05xEm49pyeCDF
	 3YbUDwEaoilYeB2UPgqBD4TksOz+In/MjBWuvIXK2MrRz/bfAnJ7Z3mNQJ7cqpLy9U
	 n4In4sglcuCZ4jh1pOA3xSMMLj7LecjWI0b45UzBitZ8fWBcplZTOEHOsN9gozF9Ub
	 rLo5/ySjDwkTA==
Date: Mon, 27 Apr 2026 13:56:33 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	devicetree@vger.kernel.org, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Michael Ellerman <mpe@oss.tenstorrent.com>
Subject: Re: [RFC PATCH 1/1] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
Message-ID: <hf4ffzfm6xezskq5gakl57pm5bgxuq3hneqfafixvxocojw2u3@qmk7pm7bbtmv>
References: <20260310003850.3837030-1-npiggin@gmail.com>
 <CACPK8Xc=imZXXPp-CYY39=Ww4oVDdXPS5My_R1qODzGhOD2qnw@mail.gmail.com>
 <ac7TByN3oQGSUpyq@x1>
 <5tr5kacx27a4g4udx43vemqvwhr4iaflacdrkz3d5tnd6vcldo@s6l34e2xyg5k>
 <ad6U/PmOawRXCClF@x1>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad6U/PmOawRXCClF@x1>

On Tue, Apr 14, 2026 at 12:26:52PM -0700, Drew Fustini wrote:
> On Mon, Apr 13, 2026 at 01:37:32PM +0200, Joerg Roedel wrote:
> > On Thu, Apr 02, 2026 at 01:35:19PM -0700, Drew Fustini wrote:
> > > I think it would go through Joerg's iommu tree, but I could if Joerg can
> > > an Ack.
> > 
> > I do not have the original patch in my inbox, but looking at it via lore it
> > lgtm.
> > 
> > Acked-by: Joerg Roedel <joerg.roedel@amd.com>
> 
> Is it okay for me to take it through tenstorrent-dt-for-next or would
> you like to take it through iommu tree?

My Ack means you can take it through your tree :)
