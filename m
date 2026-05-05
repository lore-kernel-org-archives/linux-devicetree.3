Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDEA246778;
	Tue,  5 May 2026 18:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778006385; cv=none; b=AxyKLFoLEyC/D/6a1S5tiz0VSJLz5ini3M15vH3yD2hj28pPFcRuNQ9abc7yhFQY7SE9aAc5WxylTq8kwopbKMHGgc1l/YUgpz4kXNksyrUMPX7IOokYcGJmQRwABCgQn5yW7ejJTK2O3Gn+Uqf4t9Fqz4ciPteDqfrVpwgM7kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778006385; c=relaxed/simple;
	bh=q6VLxNm36ZLu/c7vrKUrJ3PjNVHXNOJKQ6BVBQm2AZY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=s8hpCL2cOTbFJ8opk3/Leh1QnkIAafVApU76iwSFhdRfnf1gjJIYVhK0GAgAAun6pPaLh4gOIXPmIv7VqvzbtGhFAUBrLYmEkTIb6HDbMvivYlruG/gvJE38v4+t5IAIc4DRfyGkZAm6ScfeZOEwZDawaL7IYUocr4YB1TCAY0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=bosDAgNV; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="bosDAgNV"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E3FDA271F6;
	Tue,  5 May 2026 20:39:41 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LLZCIpH-8SuS; Tue,  5 May 2026 20:39:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778006381; bh=q6VLxNm36ZLu/c7vrKUrJ3PjNVHXNOJKQ6BVBQm2AZY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bosDAgNVMwhgew+EKY4RbWC2akirpmSVn6jY1aZuT8gPhdI6Nj9fX6OlbMFXfIq50
	 556nv1t1le9P8Z5udrNeOdkPhYst2L0hIRm3aP7nFiN6GaBJrcJEXATLRjrkke+xHI
	 DS+by+7d4CghjHnBWdpRYieXRxNp6pKyUxfIT0fVeuYku+8p1q9CQZxv5W/4q2I3HO
	 fKqiWwSOu44SFFxv0MPMuYPp1BVIi4cXs09SqTEbIpvEaMXVtsgN8GNifQ77MDsPLQ
	 Rs8gMOHdzA5Q5dt64HWCeRcH3eXzfhfubz3y4N0bVbnmgEwxG1wmPkwl79Lx1TFnot
	 wy4h2vMhRkAGQ==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 05 May 2026 18:39:40 +0000
From: Rustam Adilov <adilov@disroot.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stanley
 Chang <stanley_chang@realtek.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/6] phy: realtek: usb2: support for RTL9607C USB2 PHY
In-Reply-To: <20260505113721.ur4qd4udu7jas473@skbuf>
References: <20260420191941.81834-1-adilov@disroot.org>
 <20260505113721.ur4qd4udu7jas473@skbuf>
Message-ID: <5fc256e31c4611d804eb03c30594e79b@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-05-05 11:37, Vladimir Oltean wrote:
> On Tue, Apr 21, 2026 at 12:19:35AM +0500, Rustam Adilov wrote:
>> This patch series for Realtek USB2 PHY driver adds support for RTL9607C
>> USB2 PHY.
>> 
>> RTL9607C is a big endian MIPS CPU which is quite far from RTD series SoCs
>> supported by realtek usb2 phy driver, but the phy initilization is found
>> to be very indentical in most areas.
>> 
>> Most of the code was based on the Realtek's usb driver from the GPL tarball
>> in [1] and adjusted to fit into the realtek usb2 phy driver code format.
>> 
>> The patch series was split into smaller patches that add/change something
>> in the driver that are not exactly related to RTL9607C and that also
>> helps for easier review. That also means, patch 5 depends on all the prior
>> patches that come before it.
>> 
>> USB2 PHY on RTL9607C is primarly used for its internal OHCI/EHCI controllers.
>> 
>> [1] - https://github.com/jameywine/GPL-for-GP3000/blob/main/linux-5.10.x/arch/mips/rtl9607c/usb.c
>> 
>> ---
> 
> Could you go through Patchwork and reply inline to the issues found,
> stating whether you are or are not going to resolve them?
> https://patchwork.kernel.org/project/linux-phy/list/?series=1083475

Yeah, sure thing. However i do expect a good bit of refactoring of this patch series
once we get SWAP_IO_SPACE working. It just turned out that some of the realtek drivers
from various subsystems use readl/ioread32 for native endian (which is big endian for
rtl9607c and others under MACH_REALTEK_RTL) and enabling SWAP_IO_SPACE makes them
function in little endian which breaks those things. So that's what we are dealing with
at this moment.

> All of the WARNING: line length of XX exceeds 80 columns

I can resolve them just fine.

> WARNING: msleep < 20ms can sleep for up to 20ms; see function description of msleep().
> #88: FILE: drivers/phy/realtek/phy-rtk-usb2.c:629:
> +		msleep(10);

I can resolve it by changing it to usleep_range like i did with reset controller one.

> ../drivers/phy/realtek/phy-rtk-usb2.c:158:16: warning: cast to restricted __le32
> ../drivers/phy/realtek/phy-rtk-usb2.c:163:19: warning: incorrect type in initializer (different base types)
> ../drivers/phy/realtek/phy-rtk-usb2.c:163:19:    expected unsigned int [usertype] tmp
> ../drivers/phy/realtek/phy-rtk-usb2.c:163:19:    got restricted __le32 [usertype]

That should be fixed by using ioread32be.

>  1 maintainers not CCed: p.zabel@pengutronix.de 

When i run scripts/get_maintainer.pl, it doesn't print it out at all but I can include it.

> Detected inline keyword in C files
> +static inline int utmi_wait_register(u32 (*read)(void __iomem *reg), void __iomem *reg, u32 mask,

Even though it was not introduced by this patch series, i think it is relevant as
i am directly modifying its property to include read function to it. Something along
like "While we are here, remove inline from utmi_wait_register"

I believe that is every issue from Checks list apart from Sashiko reviews.

Best,
Rustam
