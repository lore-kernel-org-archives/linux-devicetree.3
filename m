Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5F9342510
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701001; cv=none; b=Xm7NCJEv6JwN4CSwKYP9Xm5gwysW3lf/LtlxnL77YD+YW3fKN0Z3iHS5+tnetpC6k48zBQ/R+ZyaSG3Sl7ytvZ/eoU78zLqRZoPe2zKWPjr82hcF94wtW6q4xuUcQOtzs8fClhuRBDKuSNHgo6oOcG+zj2AIsiUT3+6coUL+HlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701001; c=relaxed/simple;
	bh=UZ0LnI+rK/PjQVIk0Cm2exYRpKz3MgffCFQw0oVF2Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GC0/cxcEV94ELEkcT3b22ZjmbPHPkQyu2fPGpunVpMkOQeuvD58npUCddkZbqstSAclKxV9afkXyBTMobVOt5YvDdMlLsQo+/yKGFI+VIW1rzWahc8XaxR5ChIWcLeKBXsUHSJhOnRBTVWzL76qmfe7mwmgmBNRMTwAHSBEUhKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=My8HeCa0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y5nBYUa5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="My8HeCa0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y5nBYUa5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776700998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h9/x0FxU8GBGhtJj7ey+dB7jEGAG86JGELTylQtF5nc=;
	b=My8HeCa0MIgvlIQkQIJ+FPT8bHRko2jkgQKVOViVfHRl722uEzAy0qGIdGeNuB8aemkwpt
	51IwS/2umxYzlE2lY1n4o2BjUPePtQpoXSH8RTts8dtIPMP9/Sm0y+fKiDcwvc6Cjxw3cV
	cqqCw8DHWKl78ivvw+SGMTCEoUQ/bQM=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-SmLeXyPLNKSqL_bI_yookA-1; Mon, 20 Apr 2026 12:03:04 -0400
X-MC-Unique: SmLeXyPLNKSqL_bI_yookA-1
X-Mimecast-MFC-AGG-ID: SmLeXyPLNKSqL_bI_yookA_1776700983
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-950bdef305cso1539312241.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776700983; x=1777305783; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9/x0FxU8GBGhtJj7ey+dB7jEGAG86JGELTylQtF5nc=;
        b=Y5nBYUa5g/vFjmGt7RYp1W9PH8SrSf/0HRiyPPmHhhqCB8PRty5wvO9h/2FP3G5tAG
         SM43CL/lshcjzUBuvKqF1Laadif7gdSdJ0yulLRlmpUv2urUQKRy0nXuinLWGS0pfIHx
         8LCrWjP5xFNQDb24p1SNf14oUhv309XheJFMw6cJp4JD6s9Jfr/Z9ObMq1LeaU7su+Jp
         cUyqyLL6q+QRbnqFaWW5ypg3T0S4XfQ3XMzUcu0o5CphZOu5f+WA8L+Nq0rafetqtLGz
         ogP44csSSoFKuLYleGsoGkavn3Vxnux4JSLdt/F7u0VSi6hwieZvKG8aChP640ouJ5mq
         W5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700983; x=1777305783;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h9/x0FxU8GBGhtJj7ey+dB7jEGAG86JGELTylQtF5nc=;
        b=p12sWPFGrmsllDGV8ukY9AQI1jwpNucbipC5Hdv2fgLy7sWeULTo2zyrV9clic08u/
         k4eW70lLurUotuvizAbGVSZxJ+7ru1rQAzAfkW8GXSheyhJgdyx9crszdZ8CQOC4KZsh
         ptZft2Et478BpyWFkQEf/wZocKiQSwqKJZ/hJs11X+CYKvrFvHB0Z3fTHVWZgiw1ZDWC
         y0P1pniqx0V/t0LmbtvUX1igGNvSqUQrnMkDJvXrGt9wPo8Mk8qAArRBWbY962OM8kvz
         g7e+5+p3QUVZSikvGsNUWrKus9WJv5f3830Hqv/VsxnVEJ4S4w+qyOryeyq3WuDUQZFy
         0HPA==
X-Forwarded-Encrypted: i=1; AFNElJ+1ebzUca18+CC8GsnzxalZNbJ6qXli/8sFGpnNVnYCokyK5yyAETuM4SS0FcrEX532L4mRgiuUqfku@vger.kernel.org
X-Gm-Message-State: AOJu0YyLG6mObXGehRinsicaeaDgLsRXe1rzd3Qq4fT0m2KXPXZThS+Y
	xA61uggXSC5kRiMBTDyOUT8vLD/TS1tcRZhqOvscy2YcLSlM+++C2dj6O37HlIekuenVKRES571
	nBM6GU1IGPJNzCPvf2SNfZETolbqRHw50bLwSdU9FzDxoRghzymBRykVICpP68y74CEI1tTU=
X-Gm-Gg: AeBDiesiEvtYko+CCAh2pmBpY7EMVFxaqJJ01Xei73jEAxFPk9tjF6Fk+k0ccBENpGa
	2f3f6QGT1duuLdyqJpf8FKY+xT9EIWGINRz8VZ334T0+0Qx+d/Sj4Cycfr03U5YufK4QctVx4ga
	68t8L3KcG9xHDkTI23QUw7380Qw3IfnJLUpvzvhWFYtj57Ehsun3/IlsKG6EAjdy1BSrG4Jyppu
	Rtx3PTfzeSqTPsmh3KRzl0mQMuIXp3PLu5gyZlgqSMsl8MCMv6JntexUemThMDVB7vjnGmdlSsu
	mDHehlP5cQMf8P+IbLOf950DIMpsdjS0B7B1UdAzUZ7gd10uHh2tynNaIdHiyo1u7le5wlDJ18q
	tTioAKXVUIDCO1CMYtv4PKFkI/XE2THacxBMfQDm3Msp/IFBOQXBr2Sy/ZyiMwms+TXE=
X-Received: by 2002:a05:6102:5e98:b0:602:8ccb:c993 with SMTP id ada2fe7eead31-616f89b2062mr5555885137.24.1776700982367;
        Mon, 20 Apr 2026 09:03:02 -0700 (PDT)
X-Received: by 2002:a05:6102:5e98:b0:602:8ccb:c993 with SMTP id ada2fe7eead31-616f89b2062mr5555813137.24.1776700981596;
        Mon, 20 Apr 2026 09:03:01 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d5fe9638sm840199685a.1.2026.04.20.09.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:03:00 -0700 (PDT)
Date: Mon, 20 Apr 2026 12:02:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Pavel Zhovner <pavel@flipper.net>,
	Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH RFC 0/4] arm64: rockchip: The hunt for exact pixel clocks
 on RK3576
Message-ID: <aeZOMnZfBcBHzR8c@redhat.com>
References: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
 <aeKtNf8CCAWduI-f@venus>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="vZqQeRlEnk8S7HaS"
Content-Disposition: inline
In-Reply-To: <aeKtNf8CCAWduI-f@venus>
User-Agent: Mutt/2.3.1 (2026-03-20)


--vZqQeRlEnk8S7HaS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexey,

On Sat, Apr 18, 2026 at 12:24:57AM +0200, Sebastian Reichel wrote:
> On Fri, Apr 17, 2026 at 07:11:43PM +0400, Alexey Charkov wrote:
> > Dear all,
> > 
> > Need the help of the collective wisdom of the community.
> > 
> > The problem I'm trying to solve is reliably obtaining the exact pixel
> > clock for arbitrary display modes supported by the RK3576 SoC.
> > 
> > Rockchip RK3576 has three display output processors VP0~VP2, each
> > supporting different ranges of display modes, roughly as follows:
> > - VP0: 4K 120Hz
> > - VP1: 2.5k 60Hz
> > - VP2: 1080p 60Hz
> > 
> > Each one obviously needs a pixel clock. The required frequencies for the
> > pixel clocks vary greatly depending on the display mode, and need to be
> > matched within a tight tolerance, or else many displays will refuse to
> > work. E.g. the preferred (maximum) display mode out of VP1 is particularly
> > awkward, because it requires a pixel clock of 248.88 MHz, which cannot
> > be obtained using integer dividers from its default clock source (GPLL
> > at 1188 MHz), and the nearest approximation is 237.6 MHz, which is well
> > outside the tolerance of e.g. DP specification, resulting in a blank
> > screen on most displays by default.
> > 
> > The clock sources are of course configurable, in particular there are muxes
> > connected to each VP for selecting the source of the pixel clock:
> > - Each VP can take the clock either from the (single!) HDMI PHY or from
> >   its dedicated dclk_vpX_src mux
> > - The dclk_vpX_src mux can select the clock from a number of system PLLs
> >   (GPLL, CPLL, VPLL, BPLL, LPLL)
> > 
> > While the system PLLs can be configured to output a wide range of
> > frequencies, they are shared between many system components. E.g. on the
> > current mainline kernel on one of my RK3576 boards I've got the following:
> > GPLL: 1188 MHz, enable count 20
> > CPLL: 1000 MHz, enable count 17
> > VPLL: 594 MHz, enable count 0 (yaay!)
> > BPLL, LPLL: 816 MHz, enable count 0 (but these last ones don't have
> >             predividers, so are less flexible)
> > 
> > So ultimately there is exactly one free fractional PLL (VPLL) which can be
> > used to generate arbitrary pixel clocks, but we have up to three consumers
> > trying to drive different display modes from it (e.g. HDMI on VP0, DP on
> > VP1 and MIPI DSI on VP2). We also want to be able to adjust the PLL output
> > frequency on the fly to satisfy the requirements of the selected display
> > mode.
> > 
> > And this is where I'm stuck. Trying to satisfy the requirements of up to
> > three consumers while changing the PLL frequency on the fly sounds like
> > a poorly tractable mathematical problem (is it 3-SAT?). We can take the
> > HDMI output out of the equation, because it can be driven from the HDMI
> > PHY (which is capable of arbitrary rates) instead of the mux, but that
> > makes the decision of which dclk source to use for a VP block dependent on
> > which downstream consumer is connected to it (HDMI vs. something else).
> 
> It becomes more messy: The HDMI PHY cannot be used as clock source
> for modes exceeding 4K@60Hz.
> 
> > Even then we somehow need two devices to cooperate in picking a PLL
> > frequency that satisfies the requirements of both of them, and change to it
> > without display corruption. I'm not even sure if the CCF has mechanisms
> > for that?..
> > 
> > What follows is a brief set of patches which illustrate a partial solution
> > for the case of "I just need 2.5k60Hz on VP1 via DP and don't care about
> > the rest". It switches the VP1 unconditionally to use VPLL as the source
> > for its dclk mux, allows changing the VPLL frequency on the fly, and also
> > changes the frequency calculation logic to allow for nearest-match
> > frequencies which are not necessarily rounded down. These are not meant
> > to be merged as-is, as I see the following issues:
> > - The flag allowing the PLL to change rate is in the clock driver, while
> >   the reparenting to an unused PLL is in the device tree. If these go out
> >   of sync, we might end up trying to change the frequency of a PLL which
> >   is used by other consumers (I presume that could be dangerous)
> 
> It is a problem, see e.g. this patch from Heiko removing the flag
> for an RK3588 VOP source clock:
> 
> https://lore.kernel.org/linux-rockchip/20251008133135.3745785-1-heiko@sntech.de/
> 
> Also note, that there is some more general ongoing work regarding
> this:
> 
> See: https://lore.kernel.org/linux-clk/20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com/

I'm working on the patch set above to fix the clk scaling issues. You'll
have issues on clks that have CLK_SET_RATE_PARENT enabled, and there are
multiple children under that parent. Patches 2 and 4 in my series has
kunit tests that demonstrates the current behavior.

I attached a patch to drivers/clk/rockchip/clk-pll.c that adds support
for the v2 rate negotiation logic. You'll need to apply this on top my
clk scaling patch set. I only compile tested this, however it should work
based on the changes that I made to clk-divider.c.

You'll also need to add the flag CLK_V2_RATE_NEGOTIATION to your three
display clks. Otherwise, without the flag, it will just fall back to the
existing behavior.

Hopefully this will let you be able to use one of the PLLs that has a
high enable count as the parent.

Feel free to reach out to me if you have any questions or issues with
my patch set.

Brian

--vZqQeRlEnk8S7HaS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename=0001-clk-rockchip-pll-add-support-for-v2-rate-negotiation.patch

From 66b44d756dba0152b415cc8eb8528b55c4253058 Mon Sep 17 00:00:00 2001
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 20 Apr 2026 11:13:53 -0400
Subject: [PATCH] clk: rockchip: pll: add support for v2 rate negotiation logic
Content-type: text/plain

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/rockchip/clk-pll.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 6b853800cb6b..30e0722f872f 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -66,8 +66,20 @@ static int rockchip_pll_determine_rate(struct clk_hw *hw,
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
 	const struct rockchip_pll_rate_table *rate_table = pll->rate_table;
+	struct clk_hw *parent = req->best_parent_hw;
 	int i;
 
+	if (parent && (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
+	    clk_has_v2_rate_negotiation(parent->core)) {
+		unsigned long lcm_rate;
+
+		lcm_rate = clk_hw_get_children_lcm(parent, hw, req->rate);
+		if (lcm_rate > 0) {
+			lcm_rate = clk_hw_round_rate(parent, lcm_rate);
+			req->best_parent_rate = lcm_rate;
+		}
+	}
+
 	/* Assuming rate_table is in descending order */
 	for (i = 0; i < pll->rate_count; i++) {
 		if (req->rate >= rate_table[i].rate) {
-- 
2.53.0


--vZqQeRlEnk8S7HaS--

