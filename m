Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2AE369999
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 19:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780689268; cv=none; b=cfbTkm+U3lslT4XTp7Nz2hcDmxqdhuvgMkl7BiA/fyM5qJULIkvRdYjPNhYplHzX6FshuseQgohe7cZQ2mbs66dNJYmFMHpw5iJEFTX94Ti9izTVT159R5SEaRtJSW33Yh9diwB3TXq+sdCaEbaSelPEBx+ZzllNMrYvXGzac9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780689268; c=relaxed/simple;
	bh=LMk8tlYcsZvM0UtIeNeyrRMxb9npHmyPe6gZGzSLjp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nopAMZU6FRyWq6UdsT67hGIjeSk9jwrtfolIeHYnHwqcvqWWLAuQm4sgNR0MLiTXJBedcnQWP+5hpKRwcJvg44zWVj7qtty0YmRikXgkFv6LwzpgZT3pxWtc3Glz1Rh4kJYzOKJQw2WloDvxA1cVSY4nP721J9csoNYFG5znl+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGrMEv/g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGrMEv/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86411F00893;
	Fri,  5 Jun 2026 19:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780689267;
	bh=OguNSdFeLPKIR70OO/fJW07A7wzpAlKA0gio56u2hpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iGrMEv/gePwqXp9QOjjBnsrYcpF/qK3OaieIhDzY2AZ77P/K1fvPf6IXHMQNWpGJP
	 ggLhXnWmC9+LMU+QevlUHlPq35+ThPMt6itCIWEwGvedoEz/Omyme5Yf0izsyhkqZ3
	 BEOuPwqdCWEYESmZqEuzGoXLk8ySrk8OEbivY7fSozpKgDjFyvsMwutSE9s6rtR9El
	 KSSeDU/c/QF1HvvB4XWRWzixkGaOab+6i8WrRqzj79OZw3Wrhk8FhGYrwiu/D82mcD
	 utLzJYWR9oSBpSKUTc7XToUBZn+z4Bi7sOMSh9EMsvLhf03/hSrjwZF2SBEZzjzKG1
	 Y1lQs+viFhgOQ==
Date: Fri, 5 Jun 2026 12:54:25 -0700
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
Subject: Re: [PATCH v2 2/7] dt-bindings: imsics: Add Tenstorrent Atlantis
 compatible
Message-ID: <aiMpcbgFRHHY/Cy+@x1>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-3-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604143957.668047-3-joel@jms.id.au>

On Fri, Jun 05, 2026 at 12:09:48AM +0930, Joel Stanley wrote:
> Add compatible for IMSICS in Tenstorrent Atlantis SoC.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Drew Fustini <fustini@kernel.org>
