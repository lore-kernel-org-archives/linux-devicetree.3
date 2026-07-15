Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF954C77AD;
	Wed, 15 Jul 2026 20:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145844; cv=none; b=O1a8jNOB8Zkgpq/gkrRk9IlmwvHbfaIRZMCS8FsBTm3D5YEYmw1IbUiXU/SMBIDr4tiOJI8CGFJXKPHm9+gSIegHYVBhxDuasCvYPx/wj8tl3wEUTvtppE/6CtZoDcqPYUprupgMPXT2lmdtg53VEScLUOij7kVJuT2Vb3N0VsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145844; c=relaxed/simple;
	bh=srsciNWHK+SeHIJJoFYWBK0ktzSUNYP7hvC2MbYPVJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a29kvuFJvht9eSwAt7nzkIdriNtKkhSH6kp6rTGPkgpngMgmePpyOCEjsyOHGORtj7Z9QG9eCXjlo7kcEvckSf5b6t2S/0AodfkkCmVIC7gdtdjGfQbZa0bbVjUARPbmpPGhhPJdXOmfadgX/HxqqYfmzpg2Iks3zJuGIlwoLwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmZKpOxo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmZKpOxo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863271F000E9;
	Wed, 15 Jul 2026 20:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784145841;
	bh=fxa7e0xZhas0ZzUApUjpncECfYp9atyvrXoOD33Esyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KmZKpOxo70eRTxfccKvMpP5tbQqvQNv5U3tq+ZtxjgiQv2p5jAd1jguZP3f0bug++
	 BkjuR2S70Lz+BK5dcp/rF5MpMcFJKkNz7GUmKviZtX0Dzczk/Au4oPcTMDF7x4RZ+L
	 9Wwn/zH55kZOEzbbDq+cdDb4umMB0YQ6Ivbg0fZ2tNIjxPEcJfjrYeWRaijrpjvcxo
	 72/hGM3zdS/m3fqMQmmJ2f7Wpl62PUfudFeTe0okVxw9u1M+NDpHzUqp1FoX5gvqQl
	 mG4SCyr/sOTHj3M58SX00dJgwbkuIG7HvKpUUOxsrKxSW6hHs9im5URaayxGXDF5aj
	 frIOQEwZy/fmQ==
Date: Wed, 15 Jul 2026 15:03:57 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 5/7] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
Message-ID: <alfmcB3T4Kv3dffx@baldur>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
 <20260709132013.4096850-6-shengchao.guo@oss.qualcomm.com>
 <alOwD1G9plyy3BO4@baldur>
 <alYoXKxcXFd6vSNe@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alYoXKxcXFd6vSNe@QCOM-aGQu4IUr3Y>

On Tue, Jul 14, 2026 at 08:15:24PM +0800, Shawn Guo wrote:
> On Sun, Jul 12, 2026 at 10:39:44AM -0500, Bjorn Andersson wrote:
> > On Thu, Jul 09, 2026 at 09:20:11PM +0800, Shawn Guo wrote:
> > > Unlike the GearVM variant, Nord Embedded variant has platform resources
> > > (clocks, regulators, powerdomains, pins, etc.) directly controlled by
> > > Linux.
> > 
> > We're writing DeviceTree here, our job is solely to express the hardware
> > and firmware interfaces using the agreed upon bindings.
> > As such resources are "directly controlled by the operating system" -
> > not "Linux".
> 
> Indeed! Thanks for the suggestion!
> 
> > 
> > That said, this is a good structured commit message, starting with
> > problem description, nicely done.
> > 
> > > Add a separate dtsi file extending the existing top-level
> > > nord.dtsi with nodes representing these peripherals as well as describing
> > > how they are wired up with the already defined components.
> > > 
> > > Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 1731 +++++++++++++++++++
> > >  1 file changed, 1731 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> > [..]
> > > +/ {
> > > +	clk_virt: interconnect-clk-virt {
> > > +		compatible = "qcom,nord-clk-virt";
> > > +		#interconnect-cells = <2>;
> > > +		qcom,bcm-voters = <&apps_bcm_voter>;
> > > +	};
> > > +
> > > +	mc_virt: interconnect-mc-virt {
> > > +		compatible = "qcom,nord-mc-virt";
> > > +		#interconnect-cells = <2>;
> > > +		qcom,bcm-voters = <&apps_bcm_voter>;
> > > +	};
> > > +};
> > > +
> > > +&crypto {
> > 
> > Just to document my concern here as well, splitting the definition of
> > IP-blocks like this across two separate files makes it very hard for a
> > human to reason about what the actual platform dtsi looks like.
> > 
> > If the benefit of this reuse is worth the added complexity, I'm
> > accepting it, but it does means that I expect that any changes to
> > nord.dtsi will be tested across both models!
> 
> That's a reasonable ask!
> 
> > 
> > > +	interconnects = <&aggre1_noc_tile MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
> > > +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> > > +	interconnect-names = "memory";
> > > +};
> > [..]
> > > +&ufs_mem_hc {
> > > +	reg = <0x0 0x01d44000 0x0 0x3000>,
> > > +	      <0x0 0x01d60000 0x0 0x15000>;
> > > +	reg-names = "std",
> > > +		    "mcq";
> > 
> > All other changes in this patch directly relates to resource providers,
> > why does the UFS controller's mmio ranges change?
> 
> We can have them in nord.dtsi just like all other device nodes, but we
> will need to delete reg-names from nord-gearvm.dtsi, since
> qcom,sa8255p-ufshc binding doesn't require reg-names.
> 
> @@ -2907,5 +2907,6 @@ &ufs_mem_hc {
>         compatible = "qcom,sa8797p-ufshc",
>                      "qcom,sa8255p-ufshc";
>         reg = <0x0 0x01d44000 0x0 0x3000>;
> +       /delete-property/ reg-names;
>         power-domains = <&scmi3_pd 0>;
>  };
> 
> I will do this with v6, unless you hate delete-property.
> 

Now I see the answer is was actually looking for: the SCMI-based variant
doesn't list the mcq region. Why is that?

If they have to be different, then I think your proposed way makes sense
(i.e. don't muck around with delete-property etc) - but you didn't
answer my question, you jump directly to "solution"...

Regards,
Bjorn

> Shawn
