Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE0C39C637;
	Wed, 13 May 2026 18:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696623; cv=none; b=RBRfiwFXurKmfkBhdJSiHOaBOSmKb5g2W9d7DJueqwx6pi0fjs05vYrDXoGYpqLXTI9X+WVUuCY4Ew1YpZCWmeiFNpLliKqhepio5j4lfxDuqml/54S7cxSTkKLIYVQ3rKXe4MwUX2rv16LZn1IzCtj7ek4152kO0ZEXiD4vVd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696623; c=relaxed/simple;
	bh=PdsRHo3BwnQu3fBMoh55zgdXhrj5UNk1Pok8Xmrv7ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZ9hSkt9gBXgPVnKT2SFJD/PFmF5Dfui7aUL7QdMa2jNdrrMV8f2h2tLXofwCZFVT21tJogIpLw1qh+gEViqnt1TIlRybNu4QLAlIRq3tZ5TtyL2K8ga4vv9/9e31BT2hn/M8U7u0p6Q/4QMH6yszv0L2FT6Z8ReA+0sjsMIiXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tgOSNtw/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tgOSNtw/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5893C19425;
	Wed, 13 May 2026 18:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778696623;
	bh=PdsRHo3BwnQu3fBMoh55zgdXhrj5UNk1Pok8Xmrv7ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgOSNtw/jmboVozGkP1QGSPhlbu/dOMPGozBy21H4mBkpT82FkMjsi+VxDnWSNMXz
	 GDkI8PD1KJE9bZukllM4z00vp/+ENjkx1vs/VZNyNhMP2IoqXhozZqmyHKtH+8sDvt
	 1wmPf+X4/KOWx2Gej1j0HakMszjgYidXIJc2I/e5Bhgpj7o0QXMMikUYS1YTc3ei48
	 IbXKCAXCxqDoi58uEhQbwdN16JEu2DSpr/AUU7+OrTuEnZXaW2ijKsOf5isbanJoL4
	 PLTObt65rzcjCLhi7RqPozs+hmk5S989oDGEDNSwhQL0kGrSc2pKFQBCUeTkp6Iu+5
	 dkewqgYWqbanQ==
Date: Wed, 13 May 2026 13:23:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: linux-kernel@vger.kernel.org,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Hal Feng <hal.feng@starfivetech.com>, Yixun Lan <dlan@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Icenowy Zheng <uwu@icenowy.me>, E Shattow <e@freeshell.de>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Joel Stanley <jms@oss.tenstorrent.com>, devicetree@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Guodong Xu <guodong@riscstar.com>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: riscv: Add StarFive JHB100 SoC
Message-ID: <177869661593.1615750.7686200037533271225.robh@kernel.org>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
 <20260506085937.754808-4-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506085937.754808-4-changhuang.liang@starfivetech.com>


On Wed, 06 May 2026 01:59:36 -0700, Changhuang Liang wrote:
> From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> 
> Add device tree bindings for the StarFive JHB100 RISC-V SoC.
> 
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

