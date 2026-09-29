Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70A54BD106
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671851; cv=none; b=CPWycgxQPB3A4IbasjY7CuIrQZ9saSJQfXgodPI/Yn/YTnGB71L/N6/lsqx89KCFc0oGWIq2ixws9Cf8Exv11WdquZK/gFCrqr4KaWHKpGJUZZgKEGtZzSxmgIZEBokpy+Yc/2D1B+IU/dcliV5gRUdmm56Ku9A7CuXs207xQy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671851; c=relaxed/simple;
	bh=zXiQcR4UNMCgsJZUZq1sezmM9kLSwNnJodiXQrHrfRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqSJHdHQ+a2qqmXj+ScnDuREa/HEhlmvxkV46xCd6AcEdpoPDhoMHidyV2r/RyxNj5WpIFs573mz6L/dM7WEvVZjTa5zJRhCeqkYKoBsAc4KPIcTcAJ/2NMTUmUS3+RtTO56yNBZYo2Ea1cIBrQwaIA+RaCciAnzw/RJKDO6nW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELMFc7Sr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELMFc7Sr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1352B1F00893;
	Tue, 29 Sep 2026 08:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671843;
	bh=iHjy9vO2aI54cq6YGq1VyrqssYfLjBHwVVMGd7Q6AHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ELMFc7Sr9rib/LSZVw9fEKfH5McI95NJK0hG/468hHgvfQOkVAIs9pFvTgrLWtnRG
	 nrRb+tm42KIDjLgP1x+A9EtB+GUy6dSJndgs6tQO+jrT2v0auzkR6Xbi7fXddw7Fwq
	 UxLoyygdRCSeQShV8ufrfoNzSsxS/zu6hLXptxINaMrCqt59CvMBGenKwihDKBRUki
	 x2NM/PcPNO8dOpqSFHs0mC710nSJvMD6kiyKTdIXHmrgz8VnwCpXAQPdpO6qQmI9ZJ
	 0cTpQcl/FMUMsIXLq/EBB0UudhqCwFjstRvS2ZDIx5qqYg1I/IhTb1CIkny7OO9Iqu
	 lxFV1hF2j3Z4g==
Date: Tue, 29 Sep 2026 10:50:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: BG9OXA <bg9oxa@163.com>
Cc: linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: add ALIENTEK
 QuarkPi-CA2
Message-ID: <20260929-ambitious-festive-orca-b59ffe@quoll>
References: <179051707448.31632.10412780322071844492@163.com>
 <179051708845.31632.10915026963421643453@163.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179051708845.31632.10915026963421643453@163.com>

On Sun, Sep 27, 2026 at 09:51:28PM +0800, BG9OXA wrote:
> Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board computer.
> 
> Signed-off-by: BG9OXA <bg9oxa@163.com>

Please read submitting patches.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about 'b4 prep --auto-to-cc' if you added new
patches to the patchset.

Best regards,
Krzysztof

