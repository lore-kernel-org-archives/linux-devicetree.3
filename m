Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98A46BB5B;
	Wed,  5 Aug 2026 03:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785901108; cv=none; b=o13Hldr06ootaP4u4NMgsRxhJn5q4X4H5xH5AVdi8ufUTNDzegyKzuaPntSLxoF4eA++or3izYCT1hpz2GMATe7LNx6JXp9kELdBgEAMSBxHlfV6MJVgOOV/hWx5uc+LLwkLpIp+Sj9S6xS6hGrwjeMfBDhsAEwOWJ/EElUWNdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785901108; c=relaxed/simple;
	bh=Izu1Vs2KLKPY0kSc2C0VTfiSGTKBU+MD3SuiEizu+1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PIigZNaqIiLimzwMfwsGyriV/rxrgyKz+uzowuL31GeeYCxDw0JyoRqQFcpN7v+ZApbNkvaXJbsm/kXUqjMkx3haxEOHaKrVWi0YF1ZiIftS8C0QMJ50iOgjcCxlgJYs3Yk4VScLxlOUKyO7qdiU/KJDyCUNy/2MVmkL490UVbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpWFmpbf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpWFmpbf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45141F000E9;
	Wed,  5 Aug 2026 03:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785901107;
	bh=m/33dKeULM1ydDjw8ozU7h2It0aHTer+TtApeQoALpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SpWFmpbf5q+iTRDyITlZ/CavqVSZ9QV76MuJAb1BJkYuU/0GWU24JUjSXavElCrkJ
	 qCFe2nx4dSthwEDDDNDIo1GiIyRlV+5Eu1rLX7osG+S62oci58q4i7H7VTs26pPZRI
	 28PrW7ndPtJIeZzYT0wVKGb5/ifAEb/ocU2/RPMqs5nnWMwr43cQKyJYdkVdlUPOx5
	 oJYZKtW9dSN76le86BW1Xf+nNyJsaalvIdy6q5FFhBldstTb1ZQ7pswu4kKRx5JBj2
	 9EY6+t63Tt+Vx7mo1F5M0DdRh7LRTJD4ufNsKzjs4Si8lre5L+8x4EFLzvV8fTnjLC
	 Gcv06MhPGYlWg==
Date: Tue, 4 Aug 2026 22:38:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chris.lew@oss.qualcomm.com, Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add qcom,vmid to BAM-DMA node
Message-ID: <anKwCKnt-3wrtzRt@baldur>
References: <20260714-b4-qcom-shikra-dts-bam-dmux-vmid-ext-v1-1-5b19da8d7735@oss.qualcomm.com>
 <amu9hfJQ3VhRZ6PR@baldur>
 <a8862b6a-28fb-492b-83c9-a02730fc366b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8862b6a-28fb-492b-83c9-a02730fc366b@oss.qualcomm.com>

On Tue, Aug 04, 2026 at 09:49:18PM +0530, Vishnu Santhosh wrote:
> 
> On 31-07-2026 02:49 am, Bjorn Andersson wrote:
> > On Tue, Jul 14, 2026 at 02:01:53PM +0530, Vishnu Santhosh wrote:
> > > On the Qualcomm Shikra SoC the mDSP (VMID 43 / QCOM_SCM_VMID_NAV) is
> > > the AXI master for BAM descriptor FIFO accesses. The XPU enforces
> > > per-region access control; without an SCM assignment granting NAV
> > > access, the first DMA transfer triggers an XPU violation.
> > > 
> > I'm a bit puzzled about your plan here.
> > 
> > You posted this on July 14th, that's 3 days after I asked you to rebase
> > patch [1]. This patch literally says that [1] is broken and untested.
> 
> The XPU violation itself wasn't visible against the base bam-dmux
> enablement alone. It only showed up once the access-control policy was
> enabled, which happened to land close to when [1] was posted upstream.
> That's why this series followed so soon after.
> 

Are you saying that none of the shikra patches were tested with
access-control enabled?!

Regards,
Bjorn
