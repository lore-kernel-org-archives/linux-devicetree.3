Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B794636CE06;
	Fri,  3 Jul 2026 07:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064464; cv=none; b=OwTNjnuCvJEXGnC2BrfG+6XM9CZhzOXJ4ROVNaMTHd/avc3kgSWkVBGXt3F6IrPZ2q5eV78crb2M0gx18RFYgxzGkPWxap4nzsKG+VowT3OC7ccGs68iTTMcllp52cwFCt//y2x+sdozhAPzfVE4wZLXEznIJfAJJnIq8SejAFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064464; c=relaxed/simple;
	bh=sifDA7wMMlRQMsm0EVCizcABmzRB5VHtloP/nZC2nt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZKGrG79h2TlhU1/C/aFXLOB3eePXWYre/0lZudzJbUGQFABRICo67lUuRNH+JwEN7ZJsYrM9XBfbk2adwfvOnGjGFA5BHvmfAb9F6U2YzQqCQwEFwcBNUzFM7IdMmhdYRNKiOFIsMGWKy/UePeX5mt5P8FmWDcHOJNXRRq2/7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dhTNqMNF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dhTNqMNF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7181F000E9;
	Fri,  3 Jul 2026 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783064463;
	bh=kMqoLvZk7UXpRSotpTBH9ZtApx2EgbAedMgVy+3wNS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dhTNqMNF9sBWKBBN1DJh99gvQpDQOqEw61XaYxYhVp9SWTwtsAXIO/6cMu3OPyq6o
	 4AnlM4J8xr2yD9PFWsuyO6znk1xBJI0p92R0ipn3FBjnafbjKY9CrIb6tQh+GfsbvQ
	 PfPj0LiNMSHwM/DuJoSBOyxHK2wkdF/VvXioQfGo=
Date: Fri, 3 Jul 2026 09:41:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: anup.patel@oss.qualcomm.com, adrian.hunter@intel.com, alex@ghiti.fr,
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
	anup@brainfault.org, atish.patra@linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, irogers@google.com, jolsa@kernel.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, mark.rutland@arm.com,
	mayuresh.chitale@oss.qualcomm.com, mchitale@gmail.com,
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com,
	peterz@infradead.org, pjw@kernel.org, robh@kernel.org,
	sunilvl@oss.qualcomm.com
Subject: Re: [PATCH v4 02/12] rvtrace: Initial implementation of driver
 framework
Message-ID: <2026070300-submitter-humbly-833a@gregkh>
References: <20260429125135.1983498-3-anup.patel@oss.qualcomm.com>
 <BDD9553502347B02+ee3069d3-eb04-4a37-b364-107cf8d0653c@linux.spacemit.com>
 <2026070316-surgery-unneeded-bceb@gregkh>
 <138BCDE3F4A1D624+2488a822-cf77-4155-8492-b8a1c47d5589@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <138BCDE3F4A1D624+2488a822-cf77-4155-8492-b8a1c47d5589@linux.spacemit.com>

On Fri, Jul 03, 2026 at 03:32:50PM +0800, Zane Leung wrote:
> 
> On 7/3/2026 1:41 PM, Greg KH wrote:
> > On Thu, Jul 02, 2026 at 04:19:53PM +0800, Zane Leung wrote:
> >> Hi, 
> >>
> >> Based on the current framework, I am concerned about how to support RISC-V ATB and reuse the Coresight component (ETB/tmc/TPIU) in the future.
> > That is very vague.  Please provide specific examples.
> 
> According to the /trace control interface/ [1] spec: "The ATB Bridge allows sending RISC-V trace to Arm CoreSight 
> 
> infrastructure (instead of RISC-V compliant sink defined in this document) as an ATB initiator. ATB Bridge is not 
> 
> needed for RISC-V only systems."
> 
> For ATB Bridge, read trace using Coresight components (ETB/TMC/TPIU),  so we need also ARM coresight driver in
> RISC-V trace systems. Current framework seems to only be applicable to RISC-V only systems, and does not support
> ATB and  ARM coresight use case like the K3 (K3 SoC contains RISC-V Encoder, Funnel, ATB, CoreSight Funnel, and 
> 
> CoreSight TMC components). For more discussion, please refer to [2].
> 
> 
> [1]: https://docs.riscv.org/reference/trace-control-interface/v1.0/tci_system_overview.html#atb-bridge
> [2]: https://lore.kernel.org/all/20260414034153.3272485-1-liangzhen@linux.spacemit.com/

So, what specifically does this mean?  Please provide review comments
for the code itself.

We write code for stuff we have now, today.  If future needs change, we
change the code to handle that then.

The only problem is with user/kernel apis, those need to be nailed down
so that they don't change.  I can't tell here if you are only referring
to the in-kernel stuff, or user/kernel apis, sorry.

thanks,

greg k-h
