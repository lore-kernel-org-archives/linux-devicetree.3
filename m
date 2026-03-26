Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4263B3033E3;
	Thu, 26 Mar 2026 02:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774493989; cv=none; b=pmNWGnd8mds5h36SB1PUF+zcIpHnKHf4jqRo0l/Wlqdo93RKo+b+XNmxF6zHGc9UTHpUW2nt8Z7YkNV9U1RXuipFyQOQ2+1E/yG6qes/SQi4wWDx9MnyAKg09nrgn5g7s4l4A9zlovnkicrwI1QdC/0T606sLfJfbxGm5XO7cjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774493989; c=relaxed/simple;
	bh=/7vcTvm23g1uzQvse1d2+r5TcQXE4AwAkdMx223kSz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Odcm5oKQV0I4Mj3uLXAEPMWNZ52ezVp6neyA7ViUOY+v7oqC8w1R9K72xqlIm2tPnVIadIPPPrkBTXbvKUofrUBDARKVBabIgwyfC1ev4nU7ht3CDPBsf0RYQoiJatvPD0jqDOesn3Gtzp4iEua3oPoaFxh7QgA+p/Kgqco8d+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhTuGgBO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhTuGgBO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B4AC4CEF7;
	Thu, 26 Mar 2026 02:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774493988;
	bh=/7vcTvm23g1uzQvse1d2+r5TcQXE4AwAkdMx223kSz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fhTuGgBOeSa05mZKyQTT2DBngfn17d4CZ6+lZmxIf5TyDMc7Wo3ORWZ3uJvamXAhq
	 v2+8tHJdD+HWLSuDMWn0RTKq3japzL+0f9p+DM1JQbCku3i4aTjdS1kQNu5WfSHeXc
	 KXLuieI0vsEjvTO9CjzDdX9c7hcb/f3kbVwmMpjNgejSbIStdzgYQrPGJA5En7PhsE
	 r1NEztKJgS17yS6jk5xeT36q5zFvr71/O95RyEkZ24RvlIflDgiqCBU6O8I5apUwqU
	 aZccePJNO2YEgVcdQriuiTCjLmIcCf5uC27fw+LAI/vhSleexBhd+RIDuvlZv2p4wQ
	 LZgd0FUXapH5w==
Date: Wed, 25 Mar 2026 21:59:44 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Umang Chheda <umang.chheda@oss.qualcomm.com>, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	richardcochran@gmail.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add model string
Message-ID: <acSfUEVueSR5Ikq7@baldur>
References: <20260309121936.1289615-1-umang.chheda@oss.qualcomm.com>
 <rdglzhmncexfcvec5hyenj7jx3m5hsphjlxsaeq2zhi4z4arml@bjeqghbbaoa2>
 <64f43d77-7c09-453e-8d7b-b4e0e5f05598@oss.qualcomm.com>
 <gmeo7kiryfh3qxspzidpwknxgmxqeqr6on2glrjj4tioh6apv5@p6rxe3jw2rkm>
 <0a44b9ea-9f2d-496e-8915-45186433dc1e@oss.qualcomm.com>
 <srndqldc5c3hr3vozvndl4zt66jb47b3iwyjghiqcjg2uoespg@yxg2hvugjrwe>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <srndqldc5c3hr3vozvndl4zt66jb47b3iwyjghiqcjg2uoespg@yxg2hvugjrwe>

On Mon, Mar 23, 2026 at 09:06:54PM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 10:33:45PM +0530, Umang Chheda wrote:
> > Hello Dmitry,
> > 
> > On 3/13/2026 11:23 PM, Dmitry Baryshkov wrote:
> > > On Tue, Mar 10, 2026 at 02:09:58PM +0530, Umang Chheda wrote:
> > >> Hello Dmitry,
> > >>
> > >> On 3/10/2026 2:07 AM, Dmitry Baryshkov wrote:
> > >>> On Mon, Mar 09, 2026 at 05:49:35PM +0530, Umang Chheda wrote:
> > >>>> The RB3 Gen2 Industrial mezzanine DT file lacks a "model" property,
> > >>>> resulting in the hardware always being reported as the "Robotics RB3gen2".
> > >>>> This prevents applications and user-space tooling from distinguishing
> > >>>> the Industrial mezzanine Kit from other RB3Gen2 variants.
> > >>>>
> > >>>> To ensure consistent identification across all RB3 Gen2 mezzanines,
> > >>>> add the appropriate model string.
> > >>>>
> > >>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> > >>>> ---
> > >>>>  .../boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso   | 4 ++++
> > >>>>  1 file changed, 4 insertions(+)
> > >>>>
> > >>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> > >>>> index 619a42b5ef48..7d6e425dae89 100644
> > >>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> > >>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> > >>>> @@ -8,6 +8,10 @@
> > >>>>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> > >>>>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > >>>>
> > >>>> +&{/} {
> > >>>> +	model = "Qualcomm Technologies, Inc. QCS6490 RB3gen2 Industrial Mezzanine";
> > >>> So, what happens if I combine Industrial and Vision mezzanines?
> > >> H/W does not support to connect both Industrial and vision mezzanine at same time - only single mezzanine can be
> > >>
> > >> connected at a given point in time - hence probably the above scenario would never occur.
> > > Industrial mezzanine has all LS and HS connectors, so it is possible to
> > > stack Vision mezz on top of the industrial one.
> > 
> > I re-checked - from f/w side as well multiple DTSO selection is not supported - and at a single point in time only single mezz can be selected
> 
> What does this have to do with the firmware? From the Linux build system
> point of view we are combining the overlay into a single
> qcs6490-rb3gen2-industrial-mezzanine.dtb file.
> 
> Nothing prevents me from writing:
> 
> qcs6490-rb3gen2-multi-mezzanine-dtbs := qcs6490-rb3gen2.dtb \
> 		qcs6490-rb3gen2-industrial-mezzanine.dtbo \
> 		qcs6490-rb3gen2-vision-mezzanine.dtbo
> dtb-$(CONFIG_ARCH_QCOM)        += qcs6490-rb3gen2-multi-mezzanine.dtb
> 
> > considering above point - is it okay to have this patch ? I believe it would be good to have model string in the DTSO file added.
> 
> No. A _mezzanine_ can not be a device model. It is by definition
> something that you plug into the main device. Maybe creating something
> new, a new kit.
> 
> Moreover, the model name is not an ABI, we should not be using it for
> device identification.
> 

I do agree.

That said, as we (others) discussed during LPC, it would be very useful
for bug reporting purposes to know what overlays has been applied - or
in general what "version" of the dtb we're running the system from.

I don't think "model" is what we're looking for there though.

Regards,
Bjorn

> > Kindly share your views
> 
> -- 
> With best wishes
> Dmitry
