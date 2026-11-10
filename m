Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794295649;
	b=SdEnxraElAVg8jX3NRqYIjhlaxiHQBx0ja/jhS7Ot8RHe2CvqpCw8TABnALY9cvTzrWp
	 2TpxRvjBCv3t+xFcHXvYKUbUSshZnt9vqk+Ipm8q5tIF4nYtql4odf+ZmpP2/RR1ISmtS
	 161L1EkHQw45asywUA+bI4i2SiHq46q7QlYwW3DPCp7oQuuTo56GbT8V6s/X08qrFpn3G
	 qqihwA8IjroEnMLsUNNatABMD9cX/9MrpeK99bEhce0iLB3rtqPRu7/8nqEgYz+rxL+Ij
	 DzR4dsIXoHwOS+4yDy9041jCv0tIs0ZKOznmwuA96bU5CoSDQNpui+aPdDmHhWl2gRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=fXEgxHGGbNywcAgwLjVcb2CWVAIvTJVpGwgt60PS7Ns=;
	b=FXq7Z4vo4N8VhXJBqKH6bP0ba7WPZlb72kGncUkRllAH9jCwcbL+4TpJkFbo5282qrCe
	 6kyzrkINSnsZipuBKXMe2wc4TlkCE+R7MeFnvWu7m5LhNemp7cpNSiUS4uZQSYWeuKQi7
	 ezmAZFxAUXjxPZrRpwT7tzN//Q2PQxESIhhX1tZm0iTTvYXsuuRBLOxyMBagVKtJVXWeg
	 xG2HuCxFcV3lLeJPVXQlqzLa3iXEhU/MbOD0DTbegfiikBWnxiMkWsGYcceGgIApHcFpY
	 tTwxXf1KGZmduenlM/hGs7lZUYrXFmKKRzgcHrb+HWeBcBMeSqJ0iFQ/iM5VV95qOTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cj6qplcP;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A516606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A516606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cj6qplcP
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e987a2ba0cso9865025ad.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 23:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794295649; x=1794900449; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fXEgxHGGbNywcAgwLjVcb2CWVAIvTJVpGwgt60PS7Ns=;
        b=cj6qplcPDoP8/0o0M1zFhZq9sKHanEMF7YfOWqtb7yqDD9mN/0OL54LgxPlf33aTvr
         Wqc8iZA3bsHZvEuZ77u8JxmNzkWy8loqsloCa8Su/zLG5ezWFV5P9bQq5pOyj4sqCGbj
         IulMG6EcCHANiq810c1uqEDwAIT20o3j52ZU3L99Meis7zbICaxpYdjqWE1AKftKaeh2
         CBS7njlRD6at+m57Q5MF5UI7309UgfRqmp22e3cZcAIWp9lrYCjRNaudu/lyxshf7I+4
         imuustvpNls5pS5uWtV/6s3t+4sg2XP2PdGCfEEArZqxJF5I6xwKaBgV4dEqbA0NnfVj
         k8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794295649; x=1794900449;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fXEgxHGGbNywcAgwLjVcb2CWVAIvTJVpGwgt60PS7Ns=;
        b=0wcZYhcbeth0IxI6VzfodjzbwTnkEIDxh5/lDT/3DtUD6tlyHXPqO1kMeJcfOAxU3y
         kYrpf8P14JVtlnpSlsfpid+2D74SJmm3kVNa+sxRcP3GNmsDloVht6a4pMFCTKokB0mf
         BV0iER6AJVykeqDbg59U3N2E8M2AIpa1EFgDgat+D8qxssl2Z8ViDeeNFCnH2tHCZ8xB
         7uWvbMzCUVw/AF5r/GFbPsDkOay6GuWf54J1Ukz/whrXESnYZJ0oPZAf0z7hUziyb7nA
         WU4oFWLaGw3LrKCjwG/MbDiunie2XRtcsQVkQ2xlVHvX7mEvxS9BdansBe5ety7Cax74
         0Grw==
X-Gm-Message-State: APuU4Z/gU9/zTWROO8sp+HUTCYaX/2h24Q43FnzprcKUko8qv6CX31qz
	xBeoLjolLvkJXe9D4tjqLRTUq0ZbShADhhrEgni9MVxkLqKRR+pGHodPoTw4vBKi
X-Gm-Gg: AYBFou3X8EBVgUnNeXgsbOCSON0v5oQc7EA+ncgWUa/dsnVfGGAdu6lIYCJfeg8RqGi
	eealeGuNunW+YWjW6T8AIEWFBMZTRaytisARC6ml9tCFahl+Hf/hF6xBvs+srsL/Hj3EqTUTcKe
	3n3+t6DYygapD5BbNNSVhJUS9DLZ2hs05z3XeRgjfx01IwNYD1YP08yS05+obQnedQCPN0J57Sa
	Dvo0Kj6rdEBH235ukSOzBKAtLRcgFxVxkQXdF857NhdpYdkTQwAHSrB4YwIt0/+FvgkjnEmXPWQ
	uj0DGTlmG8oTUOHYyn5Da45+pfyr0G4+vFU6KskmjvR7+TUbD+1SxK/284lmj7ldWgeXQ/DRnat
	fR7ocU0+lfWgP9o//HySSGhB5G3FlspHRHoOeD6RHgk6u0UvdROtcW9QAU+nnimaH5nAj51vnW4
	vIzRdXb2zcghxOQFVc94d2tgtuGvfvQdF2N8K09cioEJmSMU/+uKNZdr0pknOwoF+2pYAG7Ad3+
	RB/7hlQ9o3B9ah480n1vRRCneMKlVdx92uYUDzfCHmi1ji8AA7URfo/Hwl+Sl6332olDE6xoczV
	OJFsFxaZG0KsVgvsSVJUIJ7Q7/k=
X-Received: by 2002:a17:903:1a2b:b0:2e9:5507:b538 with SMTP id d9443c01a7336-2edb8fb38f2mr16009195ad.3.1794295648858;
        Mon, 09 Nov 2026 23:27:28 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0c9cesm5627985ad.69.2026.11.09.23.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:27:28 -0800 (PST)
Date: Tue, 10 Nov 2026 15:27:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: sashiko-reviews@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org
Subject: Re: [PATCH 2/4] usb: dwc2: drd: Sync the generic PHY mode with role
 requests
Message-ID: <avLHFUl6S3BUOqeI@inochi.infowork>
References: <20261110070627.217946-1-inochiama@gmail.com>
 <20261110070627.217946-3-inochiama@gmail.com>
 <sashiko-outbox-206474@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-206474@kernel.org>

On Tue, Nov 10, 2026 at 07:18:48AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] usb: dwc2: drd: inverted default mode check in dwc2_drd_init()
> - [Medium] usb: dwc2: drd: unupdated PHY mode on USB_ROLE_NONE in
>   dwc2_drd_role_sw_set()
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [High] usb: dwc2: early role switch registration race in
>   dwc2_driver_probe() [1]
> --
> 
> commit 5fa24c9321d10a0419f734968d84804314b53dd6
> Author: Inochi Amaoto <inochiama@gmail.com>
> 
> usb: dwc2: drd: Sync the generic PHY mode with role requests
> 
> This commit updates the generic PHY mode via phy_set_mode() during DRD
> initialization, role switch updates, and system resume.
> 
> > diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
> > index 1ad8fa3f862a1..1ad3804cbc805 100644
> > --- a/drivers/usb/dwc2/drd.c
> > +++ b/drivers/usb/dwc2/drd.c
> 
> [ ... ]
> 
> > @@ -111,14 +113,11 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
> >  	 * mode and sessions. It is the case if cable is plugged at boot.
> >  	 */
> >  	if (!hsotg->ll_hw_enabled && hsotg->clk) {
> > -		int ret = clk_prepare_enable(hsotg->clk);
> > -
> > +		ret = clk_prepare_enable(hsotg->clk);
> >  		if (ret)
> >  			return ret;
> >  	}
> >  
> > -	spin_lock_irqsave(&hsotg->lock, flags);
> > -
> >  	if (role == USB_ROLE_NONE) {
> >  		/* default operation mode when usb role is USB_ROLE_NONE */
> >  		if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
> > @@ -127,6 +126,15 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
> >  			role = USB_ROLE_DEVICE;
> >  	}
> >  
> > +	if (role == USB_ROLE_HOST || role == USB_ROLE_DEVICE) {
> > +		ret = phy_set_mode(hsotg->phy, role == USB_ROLE_HOST ?
> > +				   PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
> > +		if (ret)
> > +			goto out_clk;
> > +	}
> 
> [Severity: Medium]
> Does guarding phy_set_mode() on USB_ROLE_HOST || USB_ROLE_DEVICE leave
> hsotg->phy stuck in PHY_MODE_USB_HOST when switching from USB_ROLE_HOST to
> USB_ROLE_NONE?
> 
> When hsotg->role_sw_default_mode is USB_DR_MODE_UNKNOWN and hsotg->dr_mode
> is USB_DR_MODE_OTG, role remains USB_ROLE_NONE.  This skips phy_set_mode(),
> whereas dwc2_force_mode(hsotg, role == USB_ROLE_HOST) below forces the
> controller into device mode (matching dwc2_drd_init() and
> dwc2_drd_resume(), which both set PHY_MODE_USB_DEVICE for USB_ROLE_NONE).
> 

Yes, the check can be removed

> [ ... ]
> 
> > @@ -160,26 +168,40 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
> >  		/* This will raise a Connector ID Status Change Interrupt */
> >  		dwc2_force_mode(hsotg, role == USB_ROLE_HOST);
> 
> [Severity: High]
> This problem wasn't introduced by this patch, but registering the role
> switch in dwc2_drd_init() before dwc2_driver_probe() finishes initializing
> the core and workqueue allows concurrent role switches to race with probe
> [1]:
> 
> CPU0 (probe)                      CPU1 (role switch / IRQ)
> dwc2_driver_probe()
>   dwc2_drd_init()
>     usb_role_switch_register()
>                                   dwc2_drd_role_sw_set()
>                                     dwc2_force_mode()
>                                       /* unlocked RMW on GUSBCFG */
>   dwc2_core_init()
>     /* RMW on GUSBCFG */
>                                   dwc2_handle_conn_id_status_change_intr()
>                                     if (hsotg->wq_otg) /* NULL */
>                                       queue_work(...)  <-- event dropped
> 
> dwc2_force_mode() modifies GUSBCFG without holding hsotg->lock, racing with
> dwc2_core_init().  In addition, because hsotg->wq_otg is not allocated yet,
> dwc2_handle_conn_id_status_change_intr() drops the connector ID status
> change interrupt, leaving the controller in a mismatched state.
> 
> >  
> > -	if (!hsotg->ll_hw_enabled && hsotg->clk)
> > -		clk_disable_unprepare(hsotg->clk);
> > -
> >  	dev_dbg(hsotg->dev, "%s-session valid\n",
> >  		role == USB_ROLE_NONE ? "No" :
> >  		role == USB_ROLE_HOST ? "A" : "B");
> >  
> > -	return 0;
> > +out_clk:
> > +	if (!hsotg->ll_hw_enabled && hsotg->clk)
> > +		clk_disable_unprepare(hsotg->clk);
> > +
> > +	return ret;
> >  }
> >  
> >  int dwc2_drd_init(struct dwc2_hsotg *hsotg)
> >  {
> >  	struct usb_role_switch_desc role_sw_desc = {0};
> >  	struct usb_role_switch *role_sw;
> > +	bool is_host;
> >  	int ret;
> >  
> >  	if (!device_property_read_bool(hsotg->dev, "usb-role-switch"))
> >  		return 0;
> >  
> >  	hsotg->role_sw_default_mode = usb_get_role_switch_default_mode(hsotg->dev);
> > +
> > +	if (hsotg->role_sw_default_mode != USB_DR_MODE_UNKNOWN)
> > +		is_host = hsotg->dr_mode == USB_DR_MODE_HOST;
> > +	else
> > +		is_host = hsotg->role_sw_default_mode == USB_DR_MODE_HOST;
> > +
> > +	ret = phy_set_mode(hsotg->phy,
> > +			   is_host ? PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
> 
> [Severity: High]
> Are the if and else branches inverted here?
> 
> When role_sw_default_mode is configured (for example USB_DR_MODE_HOST on an
> OTG controller where dr_mode is USB_DR_MODE_OTG), the if branch ignores
> role_sw_default_mode and checks dr_mode instead.  When role_sw_default_mode
> is USB_DR_MODE_UNKNOWN, the else branch evaluates USB_DR_MODE_UNKNOWN ==
> USB_DR_MODE_HOST, which is always false.  This sets hsotg->phy to
> PHY_MODE_USB_DEVICE while dwc2_ovr_init() at the end of dwc2_drd_init()
> forces the controller into host mode:
> 
> drivers/usb/dwc2/drd.c:dwc2_ovr_init() {
>     ...
> 	dwc2_force_mode(hsotg, (hsotg->dr_mode == USB_DR_MODE_HOST) ||
> 				(hsotg->role_sw_default_mode == USB_DR_MODE_HOST));
> }
> 

Yes, it is inverted.

I will fix them in the next version.

Regards,
Inochi

> [1] https://sashiko.dev/#/bug/linux-a825f666-6a3b-40af-8377-023f8afa7caf
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261110070627.217946-1-inochiama@gmail.com?part=2
