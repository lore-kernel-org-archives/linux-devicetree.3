Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5E43F5BFF;
	Wed, 15 Jul 2026 17:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135802; cv=none; b=FL5Or7CnFHP/alqYhdzWFkMUij8r7EhYUMC25nKlwRRjUFPqDV3M+WD05UaiVvkOUWl7I/M1zu59YHHm+F14q6gfWHvZrGHlVcIpa2bM4nrOX/QF4uw5fSVMUQivPZj9009R9Nh5324hG428H6krrpIfxzMvz/WqWog2LOG5esg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135802; c=relaxed/simple;
	bh=ZLgsFHd//fpUoKDrsinHDby3a0RDbYVdCJ37HNUY/00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPOtOaGOMyFkHnyJ6uMRjB86U0BaixZPYMdysiuTwhImOJ/n2KT4XHEYWKOT9ullAtdSEdyqpYI9/YXmqLoPFHZ/vy5Y55lqr8fd9KVfsp3GZLyrV4KEtz7ISeGiZqt2uTgubMwyGSQxqO41MnFR37iC7bw3vIrdPlFsTKSZoHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igP4ck1c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igP4ck1c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB461F000E9;
	Wed, 15 Jul 2026 17:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784135799;
	bh=nUw9p3QjZ98ycwWeLpAgfgwsEgHTBG9hJfZfBJUqCMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=igP4ck1cCVuKxLVBayNLcMYjqoICvI/617OAIVVoBIiL/ns9S8zMNvgk7zoiJpu31
	 DVa+A9kC0Ec2ck3GCCKlcktuWZLCUQixyRP/HL+/GS708tTBNe7hCBMvXxJsw7QGmE
	 u3pSbM/AUcBnlNTeVnsoJS6w+UGJm+SmgUANmrL5Y4glP2DlPt9Q0WA3NSjo8ropEI
	 zrK38p6PMxhtLAx+3oBzOIjVerxjWDMemnU3V4zhajHjiISDHAcfS1m69YwvgRtOTX
	 yp4r8LMFeBCBln9FA32YwuXEngyo89p9qMnmNjhgn/BedPTtsL4WwDhA64iZxB40G+
	 IeUQu1z6Se8MA==
Date: Wed, 15 Jul 2026 12:16:36 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
Message-ID: <ale-YM2Aa7nrpGcY@baldur>
References: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
 <178362531886.2423236.15524151411935053875.b4-ty@kernel.org>
 <CAL_JsqK8vEN48DrS=aAyu7QMrMZVTWGCSADPPcgwAd77GzCPGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqK8vEN48DrS=aAyu7QMrMZVTWGCSADPPcgwAd77GzCPGQ@mail.gmail.com>

On Tue, Jul 14, 2026 at 05:18:28PM -0500, Rob Herring wrote:
> On Thu, Jul 9, 2026 at 2:32 PM Bjorn Andersson <andersson@kernel.org> wrote:
> >
> >
> > On Wed, 08 Jul 2026 15:29:23 +0300, Abel Vesa wrote:
> > > Describe the CPU and LLCC bandwidth monitor nodes for Eliza, together
> > > with the corresponding OPP tables.
> > >
> > >
> >
> > Applied, thanks!
> >
> > [1/1] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
> >       commit: 4e967cad02bce8983c4e826cd13ef0e730692832
> 
> Either wait for the binding to be applied or apply the binding with
> this if it is a binding only change with no driver changes so that we
> can have fewer intermittent warnings.

My bad, I always dtbs_check against the linux-next processed-schema
before pushing out. I'm trying to figure out why that didn't catch this
and the missing Shikra bindings :(

> It didn't help that it was not a series.
> 

That would have been helpful...

> I'm applying the binding.
> 

Thank you!

Regards,
Bjorn

> Rob
