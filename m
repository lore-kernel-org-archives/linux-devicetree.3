Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D771952B1CD
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868731; cv=none; b=OmkYv/2okQEgeOatLyrfunqLnzwK5wxPunnhr9yMwOc/wYqkbVVUBc3j6HU8dYg/XqhsxWNu/zKXEWzjkB2iAZkAA28D4++1mbewRyOlrULaDCxL7pzht5B2ewyM6sVCwjVgFkONCzwDSo/XWW3c5Jo0HCQllhpCPM2Qk1YCMiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868731; c=relaxed/simple;
	bh=9mLInqnl0A4PpEzjATNo/tTkIoqMFHl/SuK3vHw1/6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTUn10yckJSVtdQYZpO7eq4wjWtvbnV5ZWF28p9fg9SYzBa7p6qwP9aGkyNxJYsNGz7XPF5a+faz35Sqz4H8hHfbRF09vLbzpx/MAxGS44nKLBjr4B6GLsKbwSTD87IlHBwAd/byEt6GfqpeswGQH3HlJSPdQiMbWVlk9hIkr/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIFCv6P8; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIFCv6P8"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66e3d262d43so717300d50.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 04:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788868728; x=1789473528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5YSbpx2/giMWiDN23LuZeurQee/vaO9NMucSm/vs5YM=;
        b=aIFCv6P8aiQXIWJOjZP5dtyEiGA8isLyjLM4tPwxHTOJkU/uyjqL8D3JVc51QpJLnA
         wxKxWApr99vB2THgvgL/3wC48TxH95YPqFsbljsBHwoNZ8awVWspHzMuZIoZNiaMBOaI
         xW91ouqG3YcDxQzhegYK8J2/SsUpBR141zbZj6n8LHA1KEMP4V3Nb1MehFCaO4Kyh8ob
         12Cp5m7g7yR/xPvmf5+PHa6KEHUY2jKbSRHsrufA+VkeJdH8E13wxx0DO4KtEr8XSZMM
         LQTo1RmRWaYQcGKuV+JRR8a0RC5IH6GiiqbOljaHTJCz/NYF97wmB7KSffvr1I8nuhjY
         nGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788868728; x=1789473528;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5YSbpx2/giMWiDN23LuZeurQee/vaO9NMucSm/vs5YM=;
        b=D4+5MUWpv10gM+C18Tfvt1fVOEn/TDCmCrzoOkj0J1EaydpMaPwG4SOBczIIzr1gZa
         RBv3kXjYayu80Svrqmg6Y7/MzPCDF6pUTWfTCXL1YPOxHgVtF2hXc/snEv0RGWLLoS80
         dPidzf2ZhYt/hmortNbjsexuQZtRKPwz7Ht0Ruh1iqjyVQ0xm8wklR8/v3XolOcF4I1z
         iKELVG5W4lQysP3h1Zktvx6DoNKDSauPs0gHhEO5kv+6knZQ7MYu0mTVZPuK2kkVUwHt
         BmI5cFMAyQCKhY4AKUwZbUnxwg7wAHmAFpc8Hj7VIveutB0EUcKEGy84zai2UalMjz7t
         674g==
X-Forwarded-Encrypted: i=1; AKwUvByFAnYnqPoZhq5c/JQEQ2pGlKZXUn74aCsvXjuWy4rZH07Kq7fXeAIpkywEdvs9AcLmiO4bzyadxoLs@vger.kernel.org
X-Gm-Message-State: AFuF++kyooIGYjlMJCIGMlvIWfEs8y00Fk5ydMHrSiA/mZHX++e0AIRR
	N03PbHnChXjDKeJPL18q08NvvjX9X4dbhQjKaHshkorvsoTymPI+Fa+U
X-Gm-Gg: AYBFou1jyXaVxktdFhgZ58nGlOqnH+BZuE77ZcFrJkHcjsGlM8P68mr/aszITs7mKeY
	YwFhn+NUHmhlob3i3vPr3XZENHpiw+4Z+ZKH87gUieG8kNMPER/e/rbszdgsLf/ACcbCfeUmTek
	oIHsvl1v0G1AlgddoovxqMlaoOK2+AYJifedpvBdtK7X9tXXLXH//+ZYWqc9yazDBhiyxX7XNvZ
	+RKWTlxQ5fo/GQ2EaHVINUDIkUY32BjMfxihgNr5ofT/7dJX49xtE7Z2UTMqyOM5JXilR+aDuO6
	S6+NQM1WzZXwWO0wQLnnP7aC6PRX6OW96X0neqw2rqv/uyXVHsL61PwXx/cmD881EwPRcxLF929
	mHH5FnXUfHJd+tmp+chPADS0TTWS6kQRCn5ncF/W4u0jn01Xj8TAvx5FWnMqMWQOK/A8xoQ/QaL
	6on1EkYVaa4DGnmsfsjZXQPzbo5GexjtAwLIcpFSUxlwrTT6XVgf9AEIYzQ7bhlVKQfMRPg2RfI
	HEUcQ==
X-Received: by 2002:a05:690e:13cd:b0:66f:c284:47ff with SMTP id 956f58d0204a3-66fc2845290mr5848557d50.62.1788868727460;
        Tue, 08 Sep 2026 04:58:47 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb495eccesm9958264d50.18.2026.09.08.04.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:58:47 -0700 (PDT)
Date: Tue, 8 Sep 2026 08:58:40 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 1/1] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to
 LVDS adapter with the 10.1" V2 display
Message-ID: <ugxocb3gmyhjefptdvsqtv2ebsngcr2ol4rfuwv4exukqd6lxs@yuema6b7ikgv>
References: <20260803173705.2268792-1-leoreis.costa@gmail.com>
 <20260803173705.2268792-2-leoreis.costa@gmail.com>
 <29aaa2ec-c1fe-4f60-a6d1-f8c797587986@ti.com>
 <kumbe27i7a632rthuruthpt6z65aszivylj2u7cdkeqecx3zgd@vi27clpphsq3>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kumbe27i7a632rthuruthpt6z65aszivylj2u7cdkeqecx3zgd@vi27clpphsq3>

On Tue, Sep 08, 2026 at 08:17:57AM -0300, Leonardo Costa wrote:
> Hi Udit,
> 
> On Sun, Sep 06, 2026 at 10:49:52AM +0530, Kumar, Udit wrote:
> > Hi Leonardo
> > 
> > On 8/3/2026 11:04 PM, Leonardo Costa wrote:
> > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > 
> > > Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
> > > Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
> > > Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
> > > DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
> > > LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
> > > touch controller.
> > > 
> > > Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
> > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > ---
> > >  arch/arm64/boot/dts/ti/Makefile               |   5 +
> > >  ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 153 ++++++++++++++++++
> > >  2 files changed, 158 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
> > > 
> > > diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> > > index f4d109ef6798a..8a59fc597aede 100644
> > > --- a/arch/arm64/boot/dts/ti/Makefile
> > > +++ b/arch/arm64/boot/dts/ti/Makefile
> > > @@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
> > > [..]
> > > +
> > > +	panel-lvds-bridge {
> > > +		compatible = "optologic,scx1001511ggc49", "panel-lvds";
> > 
> > > +		backlight = <&backlight_pwm3>;
> > > +		data-mapping = "vesa-24";
> > > +		height-mm = <136>;
> > > +		width-mm = <217>;
> > > +
> > > +		panel-timing {
> > > +			clock-frequency = <70000000>;
> > 
> > Looking at
> > https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#mc4ed25e5253da6dc635fd3eddc317dac8f447f3e
> > 
> > 
> > you are using three different clock-freq 69500000, 64500000 and
> > 70000000 here.
> > Could add some comment here, why freq is adjusted.
> 
> It's for the same reason as the 69500000 clock frequency in the Verdin
> AM62 patch. In general the DSI to LVDS bridge requires longer horizontal
> porch and sync values than the typical values for the display, and we
> intend to use the values on this patch in the general case when the
> bridge is used. The reason why the frequency here (70000000) is
> different from the Verdin AM62 one (69500000) is because we found that
> that 70000000, along with the other timing values, work more
> consistently with the bridge across our modules, the ones on the Verdin
> AM62 ended up being a first iteration.
> 
> I'll add a comment explaining the difference from the native LVDS values
> in the v2 patch.

Correcting my last reply:

The 69500000 frequency and other timings were used on Verdin AM62 were
due to the DPI->DSI bridge used on the module, not only due to the DSI
to LVDS bridge that can be attached to the carrier boards. Ever since
that, we found that the DSI to LVDS bridge itself generally also needs
higher values to work consistently across our modules, compared to the
ones typical for the display.
