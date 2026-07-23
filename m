Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6B944E673;
	Thu, 23 Jul 2026 18:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784831554; cv=none; b=VysPwKHCVjtpHpsHf1ZszY0INMb8NHmPNW1ICiuG05eiRiRFvhTFGmEyVM8m6OkwE50f5Kz5aqEH0mtLNrOXTBwWzFpetG2eWCMMbFmcjj2vPF+rcZxQ2dO4rlGDOj3crk7sXsVrZ7hf64DV7oZW2xczCOs3Vfh87rgBBep4oic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784831554; c=relaxed/simple;
	bh=06hWyjEzCk1moV0Y5VMIjuvMYIeAL7GH+0ttjksGnVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fu4Y/WYIcSeEdQ9kcnxLcIT/nxKHKmwiAbO5giznHqvBr2DYhU9b7rpbC/BpsAPcIypekMKIsTHAPCSBEmrxSwDXBlk2oclK0/9aGHze9eK9ziNkJto73JnG6abHjvLyu3ptrCdXJgv0/YerI0TVAkNq4D8UWIyD/YGSSVcihgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IxgpEOa8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IxgpEOa8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245611F000E9;
	Thu, 23 Jul 2026 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784831543;
	bh=yLaoQoa9OBDnx2oF3ltfmn0EN/7WNuoHG/RPPv5+mXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IxgpEOa8tiRHgneFL9phuoyVoYWwumd/77iy/XArcpOa+98th0zgYI+Nm0AmtKOD1
	 xROExYyinO6oUv0KanAoCx1NnxCL/hNfGJ9hmc4t47QKxjyu9Ove+7G4/uWtljRj29
	 XFY1/tl2Pv+PHE22OrMyh46hsDfe2yGKZK8o3mj4/hDnfnOUlUJ0XnrOrzsU0VlIQT
	 gWHcbPeEIxiwMmJxBY5UKciM2u3q1N7ZNQLNEItL35QTC2fYsfz9H517hw0uQqihnQ
	 0TG6NXh032QlDe3BQPghljeMOMYckl5ZDJTIBvh1yqnL9pRjyuBfRx21rvJ/Qijei/
	 8saF69AAUrNAQ==
Date: Thu, 23 Jul 2026 13:32:19 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: purwa: Drop the Hamoa
 workaround for PDC
Message-ID: <amJcXDcI0QYqtOnK@baldur>
References: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
 <20260715-purwa-pdc-v3-2-be08934dc916@oss.qualcomm.com>
 <20260716-starling-of-heavenly-symmetry-09a73a@quoll>
 <almDHnEcruBl-I3l@baldur>
 <64bf3979-51cc-42ed-b66b-c7af04536481@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64bf3979-51cc-42ed-b66b-c7af04536481@oss.qualcomm.com>

On Fri, Jul 17, 2026 at 09:11:28AM +0530, Maulik Shah (mkshah) wrote:
> 
> 
> On 7/17/2026 7:38 AM, Bjorn Andersson wrote:
> > On Thu, Jul 16, 2026 at 09:59:44AM +0200, Krzysztof Kozlowski wrote:
> >> On Wed, Jul 15, 2026 at 06:52:01PM +0530, Maulik Shah wrote:
> >>> X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
> >>> register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
> >>> Workaround hardware register bug on X1E80100") is already fixed in
> >>> X1P42100 silicon.
> >>>
> >>> X1E80100 compatible forces the software workaround. Use the X1P42100
> >>> specific compatible string for the PDC node to remove the workaround.
> >>>
> >>> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
> >>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/purwa.dtsi | 5 +++++
> >>>  1 file changed, 5 insertions(+)
> >>
> >> Why does the DT change appear in the middle of the patchset? Please read
> >> submitting patches documents - both of them - and maintainer-soc
> >> profile.
> >>
> > 
> > I thought I had figured it out, but I'm not sure anymore.
> > 
> > The claim from the cover letter is that patch 1 and 2 are completely
> > independent, but patch 3 depends on Bartosz's thank you letter [2] that
> > arrived a week before this series was sent out.
> > 
> > We're not merging the three changes through the same tree and there's no
> > expressed dependency between patch 2 and 3 (only implicitly by the order
> > in the series). But as Konrad points out, in-between patch 2 and 3 we
> > would not enable the secondary GPIO in the PDC driver, so Purwa would
> > have broken GPIOs for a while (not ok). I think merging them in the
> > opposite order would be what we want (i.e. 1, 3, then 2)
> 
> purwa-iot-evk.dts where firmware sets pass through mode, so current order of the patch seems to be ok.
> (patch 3 as such is no impact for iot evk)

But to reiterate the critical point, this is going to be merged by two
different maintainers into two different trees, taking two different
paths to mainline etc.

So, to preserve this order, it either need to be extremely clear that
this order is required and from that maintainers can figure out if it's
possible to jump through hoops to maintain it.

> 
> x1p42100-crd.dts where firmware sets secondary mode, applying in 1, 2, and then 3 may leave crd boards
> in broken GPIOs for a while after [2],  so yes order 1, 3, and then 2 makes more sense.
> 
> patch 1/2 - fixes the purwa to operate on correct registers.
> patch 3 - Allow crd boards to re-set the mode to pass through
> 

If 1, 3, and then 2 is a valid order then send the patches in that
order, if 2 must come last, then we need to ensure that the dependencies
are making it to mainline first - which you can do by resubmitting the
two parts separately.

> > 
> > 
> > But this series implies that Purwa has been broken from the start - that
> > the PDC driver has always operated on the wrong registers.
> 
> yes, purwa always operated on the wrong registers.
> 

But by accident it we never touched those registers. So, is purwa
completely broken now that you have gotten the pinctrl wired up?

> > 
> > Perhaps the impact of this was limited as there's not that many direct
> > &pdc references in the DT, but the patch that Bartosz's thank-you email
> > was sent for got merged as 77fbc756d9cb ("Revert "pinctrl: qcom:
> > x1e80100: Bypass PDC wakeup parent for now""), and that would make a lot
> > more use of the PDC.
> > 
> > So while nothing in this series states it, it sounds like Purwa might be
> > completely broken right now and this series aims to fix it?
> > 
> > 
> > It's not clear to me why the driver change doesn't have a Fixes tag, it
> > seems like the patch that introduced x1e_quirk was broken and should be
> > marked as Fixes.
> 
> x1e_quirk in the driver via commit e9a48ea4d90b ("irqchip/qcom-pdc:
> Workaround hardware register bug on X1E80100") says only about x1e/
> hamoa specific bug, it seemed it never wanted to enable the quirk for
> x1p / purwa. the quirk rather got anyway enabled for purwa due to both
> hamoa/purwa sharing the same compatible.
> 

This patch series is the first piece of information telling me that
Purwa did not inherit this hardware bug.

> Patch 1/2 of the series aims to fix this (and patch-2 carries the
> fixes: tag).

So patch 2 should be backported to LTS kernels, but 1 and 3 shouldn't?

Regards,
Bjorn

> 
> Thanks,
> Maulik
> 
> > 
> > [2] https://lore.kernel.org/linux-arm-msm/CAMRc=MeU0QuRozMscv02M59+a66S05Jm18CyvNE-qSYrY=S7hQ@mail.gmail.com/
> > 
> > Regards,
> > Bjorn
> > 
> >> Best regards,
> >> Krzysztof
> >>
> 
