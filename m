Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD3B5464D;
	Wed, 22 Jul 2026 12:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724951; cv=none; b=OPP9l6SxRDt4wD9hxqSr6BEApzqfWRok8MbhwQgBFTG5/f6yYtiGiiG/Z4Tt/aVjhotEWzX74xDTJea6FW8APWgHSQyN5awUDUpwGlyllKUpLa0vgbNHGWw+pwBB9GhMpRB/kGzkuPTZ+2Dqi3PaJ1h12chcCBPZtBx0wTukJWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724951; c=relaxed/simple;
	bh=G6KtQB8gXmpZAqNGs3UWEl+Qs096uPKClugnnWz/FLs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BxbaIokYS41C1jJySi3GWzJXq8xwupoA7Gbd24bjIor+DGB5guYFffMIr9pmdvyEPNkTgtlAe3hpu80kmvh7T9N49utZAqTUn68egnil00EvyNigCEhyDLFF5YOQ0m3houdStbMa3nqrT1YOvcYp4I8L1zbvxgVQAcn514kRkpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=RnfFXsNV; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="RnfFXsNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784724948;
	bh=G6KtQB8gXmpZAqNGs3UWEl+Qs096uPKClugnnWz/FLs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RnfFXsNVNa99zzvS8EqVEIZrIY27uRy8TQ1Cogx6jxo1ZZYp+PNP1dXo7lhmKShjw
	 4HF/wqKDCJXXShc5GIqJF+lw/k8K+R1NPyY0cuuuR6/on+4UypajEVit+bP5zwUkfz
	 ciRoa5CEyWKdt5AS9llvpTVZkJX7jFe3MhaU09qEfHBa+mrzvlUgq1wIH1Yb909/QF
	 aEehhhTqUY8MWfJ+tE3v/v8TnEPpQT15IywzOkV6UCG52ZXTdxPL85IQAuKibaKy0x
	 kFoR8zuqwvAoSAZiJ0+aSmAs8W5qUd6+4R9vI0wKjIdUD/ddZz0owx8Dz6rv5DhPGE
	 MLn2MZnIoOMDQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B2B3F662E1;
	Wed, 22 Jul 2026 20:55:47 +0800 (AWST)
Message-ID: <5333a3912656d4c85fd063dc5726106e38150ad6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] ARM: dts: aspeed: g6: Use KCS AST2600 compatible
 string
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Haiyue Wang <haiyuewa@163.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT"	 <linux-aspeed@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Wed, 22 Jul 2026 22:25:47 +0930
In-Reply-To: <20260627052708.172918-1-haiyuewa@163.com>
References: <20260627052708.172918-1-haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-06-27 at 13:27 +0800, Haiyue Wang wrote:
> As the commit 2596f6b93a60 ("ipmi: kcs: aspeed: Add AST2600 compatible
> string") does, change the AST2600 DTS file to use kcs ast2600 compatible
> string.

Is there some other motivation? It's been a while, why now?

Andrew
