Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EED40EB97;
	Wed, 15 Jul 2026 19:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145484; cv=none; b=Oz3cajz+szozFJMEzvMeI5t7YD0x72bo+vF9nORdCB0Ft9BVchYr378/b+g9yJTw9qV2bDLmd2IJVDyZAeKlqStYIWCfueY6OpYJ7AkpcKmXM2Dnq677FrQ2ouTUZJ00eMWX26OnkkX01hb3ghUtV6mMBvVTpXIfkeGeZVARYCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145484; c=relaxed/simple;
	bh=Zgr6Fb8efdFUdXPOYHyK3GJGYtpcMuysNV71imeV6xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUM8OCeGNVrN4OT2qR3wBYeGyq+ASF9LnXsmyLDujsnRR9NSqj9J1+kLtXgcgx5bWVgniVZz9W8E8fdxyKaEO8MsFYNRRlsON3r/SEbnl/QhbkzOMlKceM3ptDeygD6J2bkHPJZDVvdr+//F5aRHMWVi2kc+3q9vqvymavtEqxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyOGU4Gi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyOGU4Gi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00051F000E9;
	Wed, 15 Jul 2026 19:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784145469;
	bh=Mk3cxnB2y2LcxuUv2TsunSMjtkb2sObb3HOwhcpKCbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hyOGU4Gia69fRu9MNERxbL/5cO02+YKKaJJ0PyTcPOcrfVRe25I+YHzRf//e0P8Ww
	 3SO7nLMYTvca38SG0XFCRQht6J62E1drznQWT/qcw2zxkT3BNmK+2JjcmFjt+uqOw1
	 v3Rfa/c53/HqcNOlRRtFnJbaswTKSm18MYYMznmPK8gFL5eiFIbpyhcwXe1bLBBopo
	 rXCH4jMjtg7dnNaWlxiKDnoDf/g4x5owtdN4Y30RhkejGS0sV67rJ/gMJaXq+yXVyW
	 A64oJ85+Cust9YyN66EyMqSnhL/2fn+boMviA1hb+c1oeMgAYEyU+5CHXxDJl8eVr0
	 gMPiRc/KMncuw==
Date: Wed, 15 Jul 2026 14:57:46 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mahadevan P <mahap@qti.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kodiak: move dp data-lanes to
 SoC dtsi
Message-ID: <alfj97IYZOYjfsZ0@baldur>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-2-c3a703cc30eb@oss.qualcomm.com>
 <hej6absxu6nsuktv7tsegduyrduv7diq5zx7dt2a4xp3pe6gxl@b2xscorilbvn>
 <akCFlxiGT-vHNM-x@baldur>
 <CAO9ioeVd=fcd5SF-J8Vo9DNEz_QzyRvo25-7i-FxGUv3j4qbAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeVd=fcd5SF-J8Vo9DNEz_QzyRvo25-7i-FxGUv3j4qbAA@mail.gmail.com>

On Sun, Jun 28, 2026 at 02:17:33PM +0300, Dmitry Baryshkov wrote:
> On Sun, 28 Jun 2026 at 05:26, Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Fri, Jun 26, 2026 at 11:50:40PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, Apr 29, 2026 at 12:10:41PM +0530, Mahadevan P wrote:
> > > > From: Mahadevan P <mahap@qti.qualcomm.com>
> > > >
> > > > The connection between the QMP Combo PHY and the DisplayPort controller
> > > > is fixed in SoC, so move the data-lanes property to kodiak.dtsi and
> > > > drop the per-board overrides.
> > > >
> > > > Also remove the redundant remote-endpoint cross-links and
> > > > orientation-switch property from qcs6490-rb3gen2 and
> > > > qcs6490-thundercomm-rubikpi3, which are already defined in kodiak.dtsi.
> > >
> > > Separate commit.
> > >
> > > >
> > > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/kodiak.dtsi                          |  1 +
> > > >  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            |  4 ----
> > > >  arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         |  4 ----
> > > >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts                  | 11 -----------
> > > >  arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts |  1 -
> > > >  arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     |  3 ---
> > > >  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi                |  1 -
> > > >  7 files changed, 1 insertion(+), 24 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > > index 96ac3656ab5a..0acc6917d7aa 100644
> > > > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > > @@ -5704,6 +5704,7 @@ dp_in: endpoint {
> > > >                                     port@1 {
> > > >                                             reg = <1>;
> > > >                                             mdss_dp_out: endpoint {
> > > > +                                                   data-lanes = <0 1>;
> > >
> > > This is not true. The SoC has 4 lanes going from the DP controller to
> > > the QMP PHY.
> > >
> >
> > Does this property really denote the number of lanes and mapping the
> > internal pipe between DP TX and PHY? Doesn't it tell how the external
> > mapping looks like?
> 
> The external mappings are described as a part of the QMP PHY (see
> sc7180-ecs-liva-qc710.dts as one of the recent examples). On the other
> hand, this property should describe the internal mappings (i.e.
> platforms should have 4 lanes here, in some cases in a weird order,
> like talos.dtsi).
> 

But this then denotes the internal mapping, within the SoC. In what
cases is that not a constant for the given SoC?

> Ideally SC7280 Herobrine should be updated to follow the current
> style, but it is complicated as almost nobody has the actual hardware.
> 

The "problem" Herobrine is that the DP vs USB pins are hard-wired on the
PCB, so you will always only have the fixed 2+2 configuration. The
"internal" mapping should be the same as on all other targets, but I
presume we claim that there's only 2 lanes internally to inform the OS
that it doesn't have the capability of driving 4 lanes of DP?

Regards,
Bjorn

> -- 
> With best wishes
> Dmitry
