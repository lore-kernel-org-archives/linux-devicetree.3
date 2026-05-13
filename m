Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAF6327BF8;
	Wed, 13 May 2026 18:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696229; cv=none; b=RqghsGu0yBSJ0AcydjG9QiqohpaFSj/6GNoNw3acCI/oREc3hycPGtw7ZHZeSsn4dwRlww6eQTSSIGp8xxWBRjPIEpL4JG+J31E0Y1i+qE7DStfRh/UVm/TTXaDvPjlC1O37EWJYUWefEBHCzFOZwoGMA9TR8qeiITXde0hhivo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696229; c=relaxed/simple;
	bh=8lUCpu13LdXETtCrAQtNDxFk7/U/7lAiLOcmxhV9DEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBnfgFmz/qQjEbV7IUGDK1rCiE1dbsiLWtNX1gtqym5Il2C9es5zbsMzCcES5MffjAu/c/e8SOATmoK0rtYnbEOnnxqpmQGfRbIj8c3F4K79q46PBop3FakRsS2rq9syuDd8VXzWaL4Sg+XCRPzriL7nlA0rqv5IB2vDU5rXNEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSYyhl/1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSYyhl/1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5907CC19425;
	Wed, 13 May 2026 18:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778696228;
	bh=8lUCpu13LdXETtCrAQtNDxFk7/U/7lAiLOcmxhV9DEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HSYyhl/1y9Fos0glEOGf3E3oIACLt7cJ7trO4QsSy89oUEVJoUAcSl3MQFahy9fq4
	 Jr1crEuWDRo4pF12pSAFrrm2q7LMPZ3p/yRomgk4TaYNkbLwldA5p5dvsopXom/rWt
	 eR5eZ5ZZ557udlPFgCt6OWt+O1MPPny2UqvEiabq5MJ4DYCMHy7rlrh0+JzjZZ/5/1
	 qv9QUMBCO+O53I9oqh80bKnbdpJQvn2jLWhp8X38QeqFtuHGgSFgsjgYuP5/sBdPNa
	 IMI2oXCGHeBq6Grb+PSC69bIFntyzZ1QyTwS41OK87Al6nSHBNmcJpxs/id/5QQZS8
	 YDvnb0Rb9eP8w==
Date: Wed, 13 May 2026 13:17:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	E Shattow <e@freeshell.de>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Michal Simek <michal.simek@amd.com>,
	Guodong Xu <guodong@riscstar.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <pjw@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	devicetree@vger.kernel.org,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v2 1/4] dt-bindings: riscv: Add StarFive Dubhe-70
 compatibles
Message-ID: <177869622508.1560594.4871020257306916510.robh@kernel.org>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
 <20260506085937.754808-2-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506085937.754808-2-changhuang.liang@starfivetech.com>


On Wed, 06 May 2026 01:59:34 -0700, Changhuang Liang wrote:
> From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> 
> Add new compatible string for Dubhe-70.
> Dubhe-70 is a low power RISC-V cpu core from StarFive Technology.
> 
> Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

