Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825FB250BEC;
	Sat, 11 Jul 2026 18:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783794269; cv=none; b=KMijNuGMREczF6BFshcfDT7Fz5TbtjnDJa6c9QgrD0SQcJRd4hjnNRxMGam1dlA4ahG8m54BefcpSE5NWXdvFKU36m4ionMf5RAvedTYsiPNMyG/QbgTsH052sc9aYjtpkCFS2bBVDJCt3Rw3e55X2voQ1ihhJ+TBXLASrNWXro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783794269; c=relaxed/simple;
	bh=59QFvNh+R0E4a9ilNB7fXm4jg7Sro8iXc+N7g0UYvKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtcbQxOTtG1a0Jpwc5KdUy2Ds2TvUAXk39uffEjMvX65Q2p6PoQk266VFLQC7nmb/4UTBWUJz0FG5vfZcUj8bX8RM4zGyMmesPEDWFYM6J3u5mzZ1HCYdBGwumVoiri7xLpsxAEutOMsosVsqW8zqR6Vm+ALOXGjMqVGDCvuOPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3Rzk49z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3Rzk49z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E013E1F000E9;
	Sat, 11 Jul 2026 18:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783794268;
	bh=MOnSftGWUGx7G7EEKEGekpV83XZP1z2R+lUyQigUCk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U3Rzk49z0V7YEdDrT9DK2kUB6O71gJWmLsyevpMMm9SaBRhICzGz8n1VRKb4LnA5b
	 WyUtZLC1F4aHGqetwB37fN0iO4OGt0/iwa2J9zFlpUwGZQYIuB6tHmJb9b6w9tcJSQ
	 rmHtunoBnyhLfjzocpbCHS8flFhIo9dyHjrB1J2Fv1+XJR/VkqVuM8lGl8U9GHlIbC
	 hZ7D3UT3hJ4mHQabMyaEkj9RD50dz65yFa/lhldOkKlUCDbRf1zuvcYVZyk8l1Zx6r
	 mVmV40Psg0+nLJdNBhV8L6Eel95dmb/LxKcfI3o19L9XLMy4AgHfOyz5pZLCOwr6tv
	 5lZLgovzYB6Dw==
Date: Sat, 11 Jul 2026 13:24:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Michael Scott <mike.scott@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com, abelvesa@kernel.org, 
	faisal.hassan@oss.qualcomm.com, linux-phy@lists.infradead.org, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, val@packett.cool, laurentiu.tudor1@dell.com, 
	alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1-dell-thena: bump linux,cma
 to 256 MiB
Message-ID: <alKJcT5d7SI-iOgz@baldur>
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-5-mike.scott@oss.qualcomm.com>
 <ac559877-f4f2-48d7-b00c-4cf24fc64489@linaro.org>
 <581cc180-b993-4b86-81ae-17822a35a1fb@oss.qualcomm.com>
 <a03fa27c-57ad-48e3-9223-b4d30978ded5@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a03fa27c-57ad-48e3-9223-b4d30978ded5@linaro.org>

On Fri, May 22, 2026 at 10:33:45PM +0100, Bryan O'Donoghue wrote:
> On 22/05/2026 18:16, Michael Scott wrote:
> > > └─[$] <git:(0.7.0-multipass-v0*)>
> > 
> > Good point about the libcamera version. I debugged this on Ubuntu 26.04
> > (v0.7.0+patches). I tried testing v0.7.1, but it caused a crash due to
> > API changes with other parts of the subsystem.  I checked the diff of
> > upstream between v0.7.0 and v0.7.1 for the dma allocator code and I
> > didn't see any changes, but I wasn't looking at the software ISP
> > changes.
> > 
> > This highlights that "I'm doing this wrong". I'll move to a cleaner
> > rolling distro where staying current is a lot easier.
> > 
> > The GPUISP support looks great!
> > 
> > Dropping this patch as I'm not understanding the full allocator story.
> > Sorry for the noise.
> 
> The whole make CMA bigger thing is an error I was pushing myself.
> 
> CMA is required for some systems like say Hantro on i.MX where - the encoder
> doesn't know how to deal with non PHYS contig memory so when you are passing
> framebuffers around from once hw block to another, you need to make them
> physically contiguous.
> 
> Not a problem for us on Qcom hw though. Like Rob said, I'm actually not sure
> why we need a CMA block on Qcom hardware at all.
> 

&pcie_smmu { status = "reserved" }; means that typical Makena and Hamoa
machines need CMA. Which should be unrelated...

Regards,
Bjorn

> GPU or WiFi I think but not for Camera anymore anyway.
> 
> ---
> bod
