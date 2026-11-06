Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975114;
	b=zFDbAMXs/XLoyuupt4jhwyJrdBbc19BnRgNMSzSFhi0wF2ucjmrooR5oC/tGKxhfpZrf
	 46FlGf0qbA3TuvAQFoRuH5LBEDuUrVr0QxVdU/Jyun9ONqqKV7qtvOOoS3OS5pBWCzJWQ
	 2Dc7jr73cP0+B5Fi4PTc1mrRcr2ZNC6vmrD2NB39sIeUpzOYOF+gv5AFxpEOSFIfToMx9
	 hGQUw0dklK4TYF/wk+PNR7mUwq3NsVejpperBDSMc9tDvCZwrBf4r4sEZ0ADuilDqWmK3
	 ZxvRW+ODPglZMiA/xeB1L/zIQlP2edtEEjOjMpG+vItgoa2QaqwdWnAWhTohng5JAiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975114;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=V1drwx/X81sFN4uek22troocxRg85PA6itzp1z0x/M4=;
	b=X9WP7NoR1/XUV+XSXA3JIGT1PtHiEDlSnQXnJ9APpBiVPkWvTuRRfvDp3y0YX/GePN1F
	 IEOKqn935J5u5K+u5iFB2MixRv+wpvx8UJgSf2yMagHTh+NAGxlMzE7+1ETTt7t7TJuqj
	 sljYT8cQWJ+tmpaZDkEl8SQNgFll/yO9sxf9ytQ4UPF50psuCKNZ7L3SzGx6GpPfar3fq
	 KVY6Jea/O6VT2utZlplypxDz7RgtIMqzu55NF2njMv5sOPwcC6EStqdm+KepCCsF9bX8z
	 mYX2Dnw7y5U3XnvjKZaDkqBN5yFgS2XqrsZI5cH3h3/hfrTVhveMDUmJt5Hpd+AnScg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMWJJCVW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A482606D826
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 14:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMWJJCVW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B431F0089F;
	Fri,  6 Nov 2026 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793975114;
	bh=V1drwx/X81sFN4uek22troocxRg85PA6itzp1z0x/M4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oMWJJCVWX70l+/j2ALWj/cXWIN4i6dij1rlDaEcmju9ItAD/BEuj5aYtoKl4mSYJ5
	 1LjPH+dmdR2DQLfMajxdwIEJNQMJNMmz5Tbyd5qSMShqrxg+VSwXuqZr026tlt3rjE
	 uOjV6LR9zd7UT31f07+1sUc+aJg7Tiosqx5HTTlpqHoKetKMBJdLpnIKBSAToZCy+v
	 hrSjPp79C4q8/nw17IKXZUWHlrwSiyAsxJpjgsprYrNiO+RyJm/JclqTpZZ7F0xIrt
	 0/w7Gy6dGtXYS8JXmP4URLoam8cWoGzSKRIjcEZEfKr+9MHJdeYhcqdEjNwt96AWkc
	 MO78iVgcMQORg==
Date: Fri, 6 Nov 2026 08:25:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: cpus: Add brcm,bca-smp enable
 method
Message-ID: <179397510943.3079042.13198240905595064216.robh@kernel.org>
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
 <20261105-genexis-xg6846-smp-v7-3-rc1-v5-1-4103df2588d3@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-1-4103df2588d3@kernel.org>


On Thu, 05 Nov 2026 14:24:46 +0100, Linus Walleij wrote:
> BCMBCA systems booted through CFE can release a secondary CPU by
> writing its ARM-state entry address to a 32-bit MMIO mailbox and
> sending a wakeup interrupt.
> 
> Document brcm,bca-smp and its single-cell cpu-release-addr property.
> Require the mailbox address on CPU1, which CFE leaves in a holding pen.
> CPU0 is already running and does not need a release address. Add a
> Cortex-A7 example with the mailbox address only on CPU1.
> 
> Suggested-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: William Zhang <william.zhang@broadcom.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 46 +++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

