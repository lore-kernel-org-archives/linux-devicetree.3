Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B00F40FDAD;
	Wed, 27 May 2026 13:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888758; cv=none; b=lCuP1POor9Yr9Gvd6WBQukqHsXSkXgq61+75ttzOzvYmY17zSGXDbHHRf49fh196sF60dqUoHfZr1nhZs9cH5+I0OrjvcODaTGluvf3SysNTvlqWrSB7lcgtKhKWSf5Bj9jkTARjE48hwqI6P0oLjwjZs+nAv9KwvdW7zgduz4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888758; c=relaxed/simple;
	bh=wEAkirSW7mBOUguSPUPJakhNS+eUB7GnkmyPaj5fVPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2CRreGIN1pUEV87n9kzlQykXT6Sv+R2RD6eydwPsCY+nNSwJcTscRSGiT8Nbqfd/GlZHraDHz9qWaUZGGqz7m5EHO+wIFO9bo5kRSS5se4yXoy0A/lM1xefQeN68E/R+GG3jJB885crpcY1xNEjPkJqDc9od3glGLRsw/FNB88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUrRYEBP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUrRYEBP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B691F000E9;
	Wed, 27 May 2026 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779888757;
	bh=8rZ1ozjs6tAtUL0I36KxtDshNbmfKww+pEeWkBYDVnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MUrRYEBPOf0yBo4VZ8rRK6vJRHA3m5ARnYl+MVTRY0gPvpKKJ2vFREK1U5V7hfJBO
	 EUj9c/HZkN8HIHH78Ibra0e4zhjDGRMr3UxK4wzZSMx2vr/GlFmEP/QUOg9PrE1+37
	 rcwLxORsPaarPXW8/XTWcCpP6WsgOXQMHXCf7hp6eDbN8SZ3+27Eks+q1ioi4z0oFk
	 4c5agNiU2u/jwjKkbhMT2RT4BxWLpvSPK7+vaVOmzGkLFKeDBWQkUeDT/m4znu0D/Q
	 wY6EGIuwmBaI0U3/DxaVlh28XoyNsY+mKbv8bnzE1zqw15k19oiLfC7JiDHevXjUR7
	 /Ynyc2kzhDfgQ==
Date: Wed, 27 May 2026 15:32:30 +0200
From: Drew Fustini <fustini@kernel.org>
To: Thomas Gerner <thomas.gerner@muenchen-mail.de>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: dts: thead: Enable wifi on the BeagleV-Ahead
Message-ID: <ahbybiNqYq0lFZ5w@gen8>
References: <20260514183510.234063-1-thomas.gerner@muenchen-mail.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514183510.234063-1-thomas.gerner@muenchen-mail.de>

On Thu, May 14, 2026 at 08:32:01PM +0200, Thomas Gerner wrote:
> The BeagleV-Ahead board uses an AP6203BM WiFi chip from AMPAK Technology
> Inc. connected to SDIO1. The chip is compatible to the broadcom wireless
> driver.
> 
> The AP6203BM is a dual-band 2.4GHz/5GHz Wi-Fi 4 (802.11a/b/g/n) and
> Bluetooth 5.4 module. Bluetooth is not enabled by this patch.
> 
> Signed-off-by: Thomas Gerner <thomas.gerner@muenchen-mail.de>
> ---
> Change in v4:
> - follow DTS coding style
> - use generic name for pwrseq node
> 
> Change in v3:
> - consider further issues found by sashiko AI review
> 
> Change in v2:
> - consider issues found by sashiko AI review
> 
>  .../boot/dts/thead/th1520-beaglev-ahead.dts   | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

I have applied this to thead-dt-for-next [1].

Thanks,
Drew

[1] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=3a5791956edbfa84d7256224167941931cbc46e7
