Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0D03E0C7C;
	Tue, 31 Mar 2026 12:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774961552; cv=none; b=BkiwUC9fSREIU/zPIQAXowDi+w55oW1O6E07ynihlVhbFYpD3DRrnY5qHhvO47eC3G4ePK+ZY8D6xWz/cqUJgRqPziFMrQt2/f0YhI8V/f33M/CGv5pQdotso/ZkYMeb4Cl19RAodXc9yc7/w4BmefbBVBYV4LYS+2iLP48t/Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774961552; c=relaxed/simple;
	bh=GBjwwlhVRcZ8E+Q1FxdQHIvN3dai7IBRu3SVYHZ0k7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTWZ5pAvriHmznKSzsijXqOOimr3PAp/wF3Zz/aJra30w8K7Sgwztqz63jlfXwx31fzwZJBLVzxlnzcdUSgk36wrkNdn6SI22scmyfhqYi1fPR+Hdr8msHzFKa1SQnndUob8vz/VolfBBdsmcW0eAhpivHyUg3uyuq5zNIWFO6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVNw43TJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVNw43TJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57850C2BC9E;
	Tue, 31 Mar 2026 12:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774961552;
	bh=GBjwwlhVRcZ8E+Q1FxdQHIvN3dai7IBRu3SVYHZ0k7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BVNw43TJieGw6X1WBgDs2qcxUcKy8Zj6xYCp0Yn7sEMzx3JO09tBm7cJGVP/O1MVN
	 I/93E9jsBd+PEohshpaI5/lUPnhm1JvHqI7sfbkEW4WO6C59NhwH2A/cqzwi1mGM++
	 82TUAQyPmbOAQMho7/CsdmqITR25XSNKY1mft8rvSvBKKzY2TJL4pRuSO5dLRabfe7
	 Ht5t8/Hg4p708cJ1At1p1tdusz7AmjpjnDyJaplttMsYJcvNDzVqdLwQHuWEyrvC1K
	 r6Q48uXNILx5pEMqMnYu9m2RmnfJEYMybLYk8jHR1qDG67L2j5xnH+jOTt8okmFMof
	 juvPZRV5dAV3g==
Date: Tue, 31 Mar 2026 13:52:26 +0100
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v8 4/7] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <20260331125226.GF3795166@google.com>
References: <20260323062737.886728-1-lakshay.piplani@nxp.com>
 <20260323062737.886728-5-lakshay.piplani@nxp.com>
 <20260331112918.GD3795166@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260331112918.GD3795166@google.com>

On Tue, 31 Mar 2026, Lee Jones wrote:

> On Mon, 23 Mar 2026, Lakshay Piplani wrote:
> 
> > From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> > 
> > Add core MFD support for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> > family of multiport I3C hub devices. These devices connect to a host via
> > I3C/I2C/SMBus and expose multiple downstream target ports.
> > 
> > Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> > Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> > 
> > ---
> > Changes in v8:
> >  - No change
> > 
> > Changes in v7:
> >  - Use new config I3C_OR_I2C
> > 
> > Changes in v6:
> >  - No change
> > 
> > Changes in v5:
> >  - Corrected the ordering in the Makefile and Kconfig for MFD_P3H2X4X
> >  - Updated dev_err_probe() for regmap_init failure.
> >  - Updated module description
> > 
> > Changes in v4:
> >  - Split the driver into three separate patches(mfd, regulator and I3C hub)
> >  - Added support for NXP P3H2x4x MFD functionality
> > ---
> > ---
> >  MAINTAINERS                 |   2 +
> >  drivers/mfd/Kconfig         |  13 ++++
> >  drivers/mfd/Makefile        |   1 +
> >  drivers/mfd/p3h2840.c       | 125 ++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/p3h2840.h |  27 ++++++++
> >  5 files changed, 168 insertions(+)
> >  create mode 100644 drivers/mfd/p3h2840.c
> >  create mode 100644 include/linux/mfd/p3h2840.h

[...]

> > diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
> > new file mode 100644
> > index 000000000000..cba6fa516d1e
> > --- /dev/null
> > +++ b/include/linux/mfd/p3h2840.h
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> 
> These should use // in header files.

Ignore this.  I've lead you astray there.

-- 
Lee Jones [李琼斯]
