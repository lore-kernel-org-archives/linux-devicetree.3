Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB77C2931C6;
	Fri, 17 Jul 2026 02:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784254123; cv=none; b=T7qpOC16kytVLDz/SmRqCEPoCLJqDiInloNfK0vaB6y47Z9P+iRlGQSaBHC345zaOpiCkbTgELBkxeGH0DivMFkZEMrEXGfHGcaMs1+WJzsgjSYDaqTmr4iXSz29fz7lXDHR7l46rUEJzkGNz44Wm4QJ/HqtycqCSLH9o7mswSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784254123; c=relaxed/simple;
	bh=4pBdrxOM9EczU2VQzB+FCtvz/HjgSIeqng3vTJZEI+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEGeTJZkyKEbAUy60wcSK9N9SrOSQf/2rMEiim9YoDH0vPUg9wykkEURHDyhO1ni2+8xboAcA1a7kxdi6LxRdcjOHqOh/AUMryb5aTBQhbx43XI7IAptnhsmh5rAp/NcKQDM6B3vXBGBIIjh93hEko8IlJmKWqP8FXSScu7II9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTPpu61U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTPpu61U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5691F000E9;
	Fri, 17 Jul 2026 02:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784254122;
	bh=0V08KrbLqgmbflFa+99AmgQoPHJI3arJKvPWCbkygRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aTPpu61Ui/1J8nANfsOmc0os+xTZ0t9UVLCSqfsk438vzEMX3bsTXWZAM3SYLMVt2
	 eEMnZ9FoMqACRUXC74Z6MdB5PrLJTJhPqCrghz74PEqJ6RbgCcAshCHTo3J14D3F3A
	 WHjgZZSAkIOig4xc52tjG8iaJt4yuIW2Rpq3I9d/3EJL6GuTb0YUefNnjdA7CCiR8H
	 pFqjaqC0dn798SNH2uiiEF8aX+t6ba6eK6R8BLPGMQX9XG7ncMRIbXfPeD5pIitXfz
	 F8c21oOE1otQuJeY7T4sBol+TWZo7tjp6GNMNFddEUXzc12FcqkGDjCbfo0RzW/z24
	 Nfy2CbSslPcAg==
Date: Thu, 16 Jul 2026 21:08:39 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: purwa: Drop the Hamoa
 workaround for PDC
Message-ID: <almDHnEcruBl-I3l@baldur>
References: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
 <20260715-purwa-pdc-v3-2-be08934dc916@oss.qualcomm.com>
 <20260716-starling-of-heavenly-symmetry-09a73a@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-starling-of-heavenly-symmetry-09a73a@quoll>

On Thu, Jul 16, 2026 at 09:59:44AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Jul 15, 2026 at 06:52:01PM +0530, Maulik Shah wrote:
> > X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
> > register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
> > Workaround hardware register bug on X1E80100") is already fixed in
> > X1P42100 silicon.
> > 
> > X1E80100 compatible forces the software workaround. Use the X1P42100
> > specific compatible string for the PDC node to remove the workaround.
> > 
> > Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/purwa.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> 
> Why does the DT change appear in the middle of the patchset? Please read
> submitting patches documents - both of them - and maintainer-soc
> profile.
> 

I thought I had figured it out, but I'm not sure anymore.

The claim from the cover letter is that patch 1 and 2 are completely
independent, but patch 3 depends on Bartosz's thank you letter [2] that
arrived a week before this series was sent out.

We're not merging the three changes through the same tree and there's no
expressed dependency between patch 2 and 3 (only implicitly by the order
in the series). But as Konrad points out, in-between patch 2 and 3 we
would not enable the secondary GPIO in the PDC driver, so Purwa would
have broken GPIOs for a while (not ok). I think merging them in the
opposite order would be what we want (i.e. 1, 3, then 2)


But this series implies that Purwa has been broken from the start - that
the PDC driver has always operated on the wrong registers.

Perhaps the impact of this was limited as there's not that many direct
&pdc references in the DT, but the patch that Bartosz's thank-you email
was sent for got merged as 77fbc756d9cb ("Revert "pinctrl: qcom:
x1e80100: Bypass PDC wakeup parent for now""), and that would make a lot
more use of the PDC.

So while nothing in this series states it, it sounds like Purwa might be
completely broken right now and this series aims to fix it?


It's not clear to me why the driver change doesn't have a Fixes tag, it
seems like the patch that introduced x1e_quirk was broken and should be
marked as Fixes.

[2] https://lore.kernel.org/linux-arm-msm/CAMRc=MeU0QuRozMscv02M59+a66S05Jm18CyvNE-qSYrY=S7hQ@mail.gmail.com/

Regards,
Bjorn

> Best regards,
> Krzysztof
> 
