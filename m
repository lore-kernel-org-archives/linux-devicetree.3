Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232884052A4;
	Mon, 10 Aug 2026 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373702; cv=none; b=OmlyV9qXlGd1aWw0sX6moPFp01TVlHB6pjMOk0ShXfYwArpTRqrA0NPI5UMezZHYsOk9bM6QPi/GNlA3jfRMHEyyr3FH8XHGaovX1Zl9zBuoiQmH4kfRd5DZY53klhWxjLLxN3HR/Bc4opt8HwV+a5xC0shPheorXUpVuDXoI/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373702; c=relaxed/simple;
	bh=HhTFujIplQ+QkXrasiGzjfFn7Cxe+llMwgzuECPk/o4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GURsQ2T4ZY8Nh2WtVEz3ub5goxg3afUrMwpfgYGmLaJYBlt5i87Kzx0nZWuNB+Ij4TPDP/G2GSiXuNegC0MClORuB7mRoq4cq3CmslCb4YOOb4LQQbX7BkjMfa5k4yum9Yiiw4cOh+5bZVtSYD7s70e1fX13qTrASstmdiSMjT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cA4fOepS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cA4fOepS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F0E1F000E9;
	Mon, 10 Aug 2026 14:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786373700;
	bh=IePcMhimiO4bG8MZLgXj0Mzb3WEI4wgOXRrJsnP050U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cA4fOepSlxC6CBDbTfrdfIWZcYuymLzs3oq03p5izsC9edhhWk1TOkW+brDxdSeC8
	 Fc0GojCmB6dWCQqdRzy1uTe+OmrLVob2S8+uk6OMtyfUjtpAxT+NUZkfGWHbWeDG1u
	 3uowUO9PQqRAhAcQMp4goIo5Exs43zaC0enbSeJpIbNS1VPzxmN1j2UYQGtJx4H83+
	 Iakuh76SACNBUx/TReGc2PIerNLZuih0tWGkfzh0b7ZKh2OqOEvvUcGw8rqNiEOGXc
	 2iPB9L/fxvo9ohNbMDziIToltTYtJQm44NJOuoafDOMv9En2mI40wk3KrBlXlOxf5Z
	 qUBuCtVOjp1Tw==
Date: Mon, 10 Aug 2026 09:54:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Michal Simek <michal.simek@amd.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	E Shattow <e@freeshell.de>, Joel Stanley <jms@oss.tenstorrent.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>, Icenowy Zheng <uwu@icenowy.me>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: interrupt-controller: Add StarFive
 JHB100 plic
Message-ID: <178637369862.1615335.12680863675336505769.robh@kernel.org>
References: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
 <20260806122553.182449-3-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806122553.182449-3-changhuang.liang@starfivetech.com>


On Thu, 06 Aug 2026 05:25:50 -0700, Changhuang Liang wrote:
> From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> 
> Add compatible string for StarFive JHB100 plic.
> 
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

