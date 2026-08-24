Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F87A42589A
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577851; cv=none; b=Ml+lt6DGnJNgDuKp7EJKU5Q75K6QCcwwQE+9B/+KDA+1ibo0Xlb+mqf57tJjSYfKN6VDWChcO8V/R/+jOqMptOozngOE/2kSDy6Hs9AsJhT1yfR5FbK3eYpU8SOFy7n3KLCXbcRCCKr+lQjNKbq06M97EL7aTKCE3fUsyuRVlfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577851; c=relaxed/simple;
	bh=B2osEAhrHGA2gHHUZMwKIxQGxD27XlhLVaUjhoWrgU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSW4whXz2VoMSfa7ir5bu6EVJjBQg3TA8sEZjG3K7BiJSvxSBg09Trx5Uq3b/YIdzrX09o4kVRFmj7Apj2CtUUNMMEwJSxS6nw3Afvd7yjwOVKk0qHqavzFQke2zlMqoaO4ma83BTMxqpf31Ntj7XVvOglzRs6brpU0D7hggkSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=AS1r0fHT; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="AS1r0fHT"
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 92F2CDF89F7
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 15:14:22 +0200 (CEST)
Received: from L30177.local (unknown [46.193.67.97])
	(Authenticated sender: vjardin@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 6211A2003E8;
	Mon, 24 Aug 2026 15:14:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1787577254;
	bh=B2osEAhrHGA2gHHUZMwKIxQGxD27XlhLVaUjhoWrgU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AS1r0fHTSHlYbh8CR6VZVM6JiVQyEiIjZUlX4ekuLrqxHBn5Krbha7lnqnds15384
	 jRuczmKkSLh+KuiLFeQJAeWk4zBrtsSHej4rKjFb+O8s9yasdUeJpTX1iMMGQk3h5N
	 mEpCVSO2E2yc90yXxLGWdW7n5nsfg7xIWtRodWlMpAeVqyf7lQxCCufnzSmuvLJ4B4
	 HBfB0ZKMOqcPIFMEQu2Bx4+jqWYenC+3txC8A2u7peb3bPJY8gjmRrzApZIUn4t2md
	 CtWzneM6pR4Z9X2lGmjNrEBJpGjqNOcLxhw33RvKDkMkD6ANBTHK7o/qy7GyOfHVZi
	 Sn/tYm3WYspZw==
Date: Mon, 24 Aug 2026 15:14:08 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH] arm64: dts: lx2160a: fix incorrect pinmux
Message-ID: <aoxDoBB2Gtl4IbDO@L30177.local>
References: <20260824-for-upstream-lx2160a-pinmux-fix-v1-1-33a3c8d5ea8a@free.fr>
 <20260823223554.7A6CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260823223554.7A6CC1F000E9@smtp.kernel.org>

Hi bot,

Le 23/08/26 22:35, sashiko-bot@kernel.org a écrit :
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The pinctrl offset for `dspi2_miso_mosi_pins` is set to `0x3`, which is unaligned for a 32-bit register width, triggering a synchronous alignment fault on ARM64.
> - [High] Pinmux nodes `i2c0_pins` and `gpio0_3_2_pins` specify an incomplete 1-bit mask (`0x1 << 10`), causing the `pinctrl-single` driver to silently reject them.

I did send a v2 on some topics:
  https://lore.kernel.org/all/20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr/

The issues were not introduced by this commit but they deserved a review/fixe too.

best regards,
  Vincent
