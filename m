Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F88376A00;
	Wed, 20 May 2026 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779261287; cv=none; b=WgYj+ArffR+o7w1Vf13agXYaWvYdXNcfjAuwbAGmMVirfjuMTQlIQa9/39kNDibJPC6IPJGpStmgObXhxHLg11hHX8x6zN8lVgkwCH7wIBW9ItRLa9J3zwsd038h1W3cDT1plgdEjIaIILFKx/c9JRSVEIQFacEMRxbYTZc09Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779261287; c=relaxed/simple;
	bh=CR30oqSQ6PAPndyEpsanM1fqwluFLdlEhZ6QPhyA/Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Saj++1mwnnhdTcARiO9zLkyANsbCsr4LxYycz8ZMBcgNZ+iCnhJ5jIQd6UFLXuksfmYYfwyl93gudIzXXeP8CJZgTuMN9S8C86qHuH1Z5kDki3ylBGAvhpDeGngIvTCnWxXLIs8CPIsMRl5XdbaLS7AUzNCVL6gkEuR3cE7dH1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EkAg3pLk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkAg3pLk"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E991B1F000E9;
	Wed, 20 May 2026 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779261286;
	bh=CR30oqSQ6PAPndyEpsanM1fqwluFLdlEhZ6QPhyA/Lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EkAg3pLkGc8lvnf3hSYeLhpOFPZ+IPZwFImM84q9Rbd02ZZso/PWEEXSGxwzy1uDL
	 4ojBTNQbx0FP7uyRSHEc8fPuJgq72qGLuaDSaisb2mYM6hdlj9hHPzm2vcVvjamwz/
	 LL/TOvZaHtQL3XkYsQEGBNbP4UKhrRPRZnu+VtK371WoGVmUOzxp5nGW33hWPYDgU+
	 BXtN2WrVDTrgXlMjz3xn9PxFxt9NtqfAE8+6lVFg+eqGg1/Xh2YlTDpTAoGZzf7RGU
	 jyXu/JUV+0vgj5hl6fx+Y612SxJ0xbL6E6zb790Wi9XoYmUvozJLSUiZtP03aUaay4
	 qxDChN3oijxBw==
Date: Wed, 20 May 2026 09:14:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: i3c: dw: Describe core reset
Message-ID: <20260520-cocky-thick-wren-900aa0@quoll>
References: <20260519055105.13079-1-jszhang@kernel.org>
 <20260519055105.13079-3-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519055105.13079-3-jszhang@kernel.org>

On Tue, May 19, 2026 at 01:51:03PM +0800, Jisheng Zhang wrote:
> The core reset support has been in the code from day1, but the

Well, no. There was no "core" reset from day1, so your entire
explanation makes no sense now. Previous version was correct.

Best regards,
Krzysztof

