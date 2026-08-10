Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5794E37DAAD;
	Mon, 10 Aug 2026 13:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367479; cv=none; b=UwjHvm3LlWq/AI8QcX+y5ZWjms7ixiCopEQFqIr3LurfCvfH+ddVjebE+aUT+aAiWpQVt2e5YjWX+l9mQkpVsD/hAffT/UgIfXNWNePh8C6zAiyI8W1UlwdRXYjJZHxmuqfcvBvVchbCp5QDvaJqRb8U2TqDQKqfA6Od8Ty1O0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367479; c=relaxed/simple;
	bh=DPW6Kx+DWMW2tIghPUJOCOK4IRG//DzkIpSdE8rCNzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PG9LfuB+BBmLv5h/19TRhctUiqdMu+rUD7Cz8H8Z7dZUpMIsdN69cQXrpzjfRgs3VBQ2I8mVDHpDMRbVPSTar5GdCOkLA5CM/TmABUkfxwhMVrsmTG8DIVzeFGNU6LaSoxxRxrtq5np+71oRhpD7tcjLGwfbp2jr3Ozn5wcqk4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hh5EJRco; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hh5EJRco"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369F81F000E9;
	Mon, 10 Aug 2026 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786367478;
	bh=gdej33EGvlPcyqEmOz8WM60J5amgNtjcc+zyrNlgDes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hh5EJRcoKNujZbMcGm792PF2XV5/liEwqYwbs+XLOnMBg6UL0L9DQXfJkiDdzgksw
	 yuvrPzyZmceU56j6haejBeGP25JcWkL0V8gcszgJOSsr8N8MmzHtvXYZKLJN3zPEoO
	 ngVTzCvZFoSPQL9XMEBuMPUc6aOgpvA/twJSLpYlshlo9EGmhwMT/8KthX1XCxucJm
	 B3nggGTpjSWkBDyUMkDyY7YrwjLbwF+WJYpP9AZH7SKR9a3eRVdZ+nHn3uz2D6ut1r
	 460TIgc6VAYCdh3lQ5YqNPcJw9S0hUiD275k4JfQ3Dj5pElnZxVJPdoBzBwBRM/gwX
	 +l4SsoKS+QNXg==
Date: Mon, 10 Aug 2026 08:11:12 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Message-ID: <annMk4RnQKl51Oug@baldur>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
 <anUgxo3BPt74Wx7K@baldur>
 <anWsrXO9RztrF5H4@hu-anantiwa-hyd.qualcomm.com>
 <anZGDietz47mE2wp@baldur>
 <anmKUoLFSDpgOjoE@hu-anantiwa-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anmKUoLFSDpgOjoE@hu-anantiwa-hyd.qualcomm.com>

On Mon, Aug 10, 2026 at 01:52:42PM +0530, Anand Tiwari wrote:
> On Fri, Aug 07, 2026 at 04:01:05PM -0500, Bjorn Andersson wrote:
> > On Fri, Aug 07, 2026 at 03:30:13PM +0530, Anand Tiwari wrote:
> > > On Thu, Aug 06, 2026 at 07:05:37PM -0500, Bjorn Andersson wrote:
> > > > On Thu, Aug 06, 2026 at 10:01:20PM +0530, Anand Tiwari wrote:
> > > > > Move the eDP panel configuration and related power, backlight, and pinctrl
> > > > > nodes into a separate overlay. Keep the base DTB suitable for headless
> > > > > variants and provide a composite DTB for headed variants.
> > > > 
> > > > To quote:
> > > > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > > > 
> > > > """
> > > > Describe your problem. Whether your patch is a one-line bug fix or 5000
> > > > lines of a new feature, there must be an underlying problem that
> > > > motivated you to do this work. Convince the reviewer that there is a
> > > > problem worth fixing and that it makes sense for them to read past the
> > > > first paragraph.
> > > > """
> > > > 
> > > > In fact, I'm not even able to guess what the problem you're fixing here.
> > > > 
> > > > Regards,
> > > > Bjorn
> > > >
> > > 
> > > The problem is that the base device trees currently describe the eDP
> > > display hardware unconditionally. However, Hamoa and Purwa IoT EVKs
> > > are also available in headless variants without an eDP panel.
> > > 
> > > With current base DTBs, headless variants are not stable where eDP panel is not
> > > physically connected with board and userspace is trying to use it.

If this is the configuration that is shipping, then it better be
stable...

> > > 
> > > This series fixes the inaccurate hardware description by keeping the
> > > base DTBs limited to hardware common to both variants and moving the
> > > eDP-specific nodes into separate overlays. The base DTB can therefore
> > > be used for headless variants, while the overlay is selected for
> > > headed variants.
> > >  
> > 
> > I see, then it seems your change does make sense. I don't understand why
> > you didn't explained this in the commit message though.
> >
> 
> I will update the commit msg with details, currently details added only in 
> series cover letter. 
> 
> > 
> > I further do not understand how it can be that nobody noticed that the
> > display was missing on their Hamoa EVK during the 11 months since I
> > merged the offending patch - this is completely unacceptable.
> > 
> > Regards,
> > Bjorn
> >
> 
> Internally, we have always required the eDP panel to be connected during 
> testing. In theory, this platform is expected to have a display attached 
> by default.
> 1. The only difference is that the eDP connector on this board is externally 
> accessible and can be disconnected quite easily.
> 2. Also, only the boards shipped to customers are delivered without an eDP 
> panel attached by default, which is why this requirement exists. 

In particular since you're shipping it without display, that is the
configuration that should be the dts (and that you should test...).

Common additional configurations can then be added as overlays - while
the developer can add their own overlays as needed.

Regards,
Bjorn
