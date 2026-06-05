Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DB51A5B8C
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 20:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780691468; cv=none; b=KoP7bdf0gAHdZli+F+OSiiXQ5Tk/cAnvENtwYZbYvixEv8GvvIBHVWn82prI3VKNQIO/mekv9AspdkmNF6GyKQe2RlVss09AsJq/VbF8eFP4tLE4dUGOo6beyRjbXvXxjgicE+YrH59FeuWUCG1Erxio5UA3UhyrW5oyQA2KmGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780691468; c=relaxed/simple;
	bh=R8LZknXVYAiCmn6LDqBW4u2iY5bAcF6cOkZw+SUFmB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4SKWUtp9OrdzVD8pLIfDd14fk8l8bfgVvfymjLxzq+tLbDkLywPcuYSS6URnC/43vxUH2MB4Y1q5Ww/Bqhp/bS0yzmYyAJI7RGi6oeiItW3D1ANjN0TcMKvlR1mRp36QffuXV7IAix5oDjlPFqpkzoaplP6j4nhkMMmdtd158I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lFakIHLh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFakIHLh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE811F00893;
	Fri,  5 Jun 2026 20:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780691467;
	bh=fB5aY5VBvW9cwcvB4CN9kyV3CvrLkjHsB6HcVxxbVYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lFakIHLhEeF4FkN2OUlTtrI74XnS22YkLLEtsiuyDGP+sUG3FqDl+SC0T5Egk/ZXc
	 1WoESo0sfszchRVA0z9SDCpyEGNSZwehEsU7PWGHaVOIn91DSyMFDwOS55nFqPz0w3
	 TOUJNMCU1KMt3cS65PVAhHgm/ZH4EbE8IVk2emCEPOqEy4dZOxNVWoqEgdvBN7iXyk
	 Ay05vVQyqiVlXV9eOdFEEonE/OZXBl5HcSjlcxQvhkTZ4Pb/WtAIr3v926ck1/efJh
	 Ov3YwJKv+9wyBITAXpMiUDId4j5NcUaIJ56bwu7e1APtduHRL1tdu1bRRW4SJqJMur
	 dfLIz77q1CoMA==
Date: Fri, 5 Jun 2026 15:31:06 -0500
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Paul Walmsley <pjw@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 7/7] riscv: dts: tenstorrent: Add Atlantis platform
Message-ID: <20260605203106.GA98957-robh@kernel.org>
References: <20260604143957.668047-1-joel@jms.id.au>
 <20260604143957.668047-8-joel@jms.id.au>
 <20260604-pacifier-sludge-196f47ab3c11@spud>
 <f3fd53dc-7010-4b3d-a33c-4d1d32d3a1a6@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3fd53dc-7010-4b3d-a33c-4d1d32d3a1a6@kernel.org>

On Sat, Jun 06, 2026 at 12:02:41AM +1000, Michael Ellerman wrote:
> On 5/6/26 2:47 am, Conor Dooley wrote:
> > On Fri, Jun 05, 2026 at 12:09:53AM +0930, Joel Stanley wrote:
> > > Add initial support for the Tenstorrent Atlantis platform, based on the
> > > Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.
> > > 
> > > The evb machine represents an internal bringup vehicle with just the
> > > interrupt controllers and a UART. This will be replaced in time with a
> > > full featured machine once details are available.
> ...
> > > diff --git a/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
> > > new file mode 100644
> > > index 000000000000..06259cca8357
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
> > > @@ -0,0 +1,33 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/dts-v1/;
> > > +
> > > +#include "atlantis-soc.dtsi"
> > > +
> > > +/ {
> > > +	model = "Tenstorrent Atlantis development platform";
> > > +	compatible = "tenstorrent,atlantis-evb", "tenstorrent,atlantis";
> > > +
> > > +	#address-cells = <2>;
> > > +	#size-cells = <2>;
> > > +
> > > +	memory@0 {
> > > +		device_type = "memory";
> > > +		reg = <0x0 0x00000000 0x0 0x80000000>,
> > > +		      <0x1 0x80000000 0x0 0x80000000>;
> > > +	};
> > > +
> > > +	aliases {
> > > +		serial0 = &uart1;
> > > +	};
> > > +
> > > +	chosen {
> > > +		bootargs = "earlycon console=ttyS0";
> > 
> > FYI, this should not be in here.
> 
> It should be there if you want a working console :)
> 
> I know it's a "rule" to not include bootargs, but this system has no boot
> loader, so not setting bootargs just means the DTS is no use to anyone.

'console' is redundant as 'stdout-path' is set.

'earlycon' is only needed if you don't boot to the regular UART console. 
I would hope by default this system boots all the way.

> 
> > > +		stdout-path = "serial0";


Rob
