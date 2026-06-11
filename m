Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AE23BE175
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170552; cv=none; b=DcX97v2iERWPvagfhKqqPaCuvLFqqJXs9VeMQxq+38b1uJABAEBSlQ928wwdDxGj6BsekwtHnkgc9OQJN1NoBEX6XvtcSVxBPbTkLoTnbxscEHcm89wpuwcx7Qase62q9b10sq2cC5c6gFz4TQbYGimJ8FFnRYkDJy6I5xFynk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170552; c=relaxed/simple;
	bh=a9lsTRPgrPvriMugNy1IK/2cBwKGI6ZEzPafPe3LMwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4W+fX8EfLVD9kPsT6zeAFdh0sNqzECinC2rjCTsz0LJYVojACBsTMqhim/rId/mo4kMu5pBu8Vank4yaJL+ePkils24lddiMCQJ7gC35RpERglkh88TNwfKDOzMDkR4+PIbD9cwNOpjlbxLptlGQfkcw44ubzup6cB48DtazP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ar3clG6q; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ar3clG6q"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so65779595ad.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781170549; x=1781775349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+TREFnKQMiKfm+gKa4cK2y0yw07iC6grGzwaDgz34/g=;
        b=ar3clG6qN/ktNZ8WT+DMfVHoDpT1otkJNk+dQQh+C83+8Dn01DHlsVt9J56W1w67En
         JXVyxD+0vQ33wNEhhmFJPSybf1AHfwExM024Af7zphHBGuBEKT/wRj8KXsDedwRmyIyc
         pAJzComMwC1XfP5dkEdlk3Y7CxAZn+LPEqEyCEtHXYYSw7fKStDDrBu97zVYRKOCAxoY
         vzQgZ+1hgIVru8kTacifPxFe5bZ5sHAWnn0bHExtNDEHSfpY1ERYxY1VnDPgcv/5MULQ
         RWZdMaOwAohZSM0ZSPanqMon8QWkAv6YkfgQeYT3d7v++0utTpzFB6JgPFtAm24vVwQS
         FpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170549; x=1781775349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TREFnKQMiKfm+gKa4cK2y0yw07iC6grGzwaDgz34/g=;
        b=dsjDs1Wo8vqAGXevt07l2MV7urGDcjupghtKKImtvCChPzxdnyvNWR/tN1DBR5bI8Q
         dWeEWUrf2qMkNn/acX8YsBUVNAn6G8PEy2cFij6vWKo128cJp48/nA4uzBWGVrv1vDSn
         khPws4DWs6gvqXUxQGy0YNNWPv52vot2gWI/sMoyvElzHESK7GW4Fw280m5mPUS5HXe9
         xL2PvfgF0jZEujABwcP7Z8nYp5E6XjMT+WbrlW9a4CxrOAZLuukPK8mGWYn2pq5s7Q1r
         tZt+l2vPtoccBgHO5XQYz2D89r9IC4CnniO33qq/FHBqbAbs0v68Qddj7gOi0wECG1ne
         AUFA==
X-Forwarded-Encrypted: i=1; AFNElJ84SGC5GqEuYqgKsQ0ulwZhKBQK/VCcv4OjAfM04ijrJOaEZwuy2237gxDWng5+TsLYpTLjBDB08oSw@vger.kernel.org
X-Gm-Message-State: AOJu0YzvTjIbTQzLIxsWjgCvz5PlHsP3uQXGZV2CcIBE9tJFil3Wa0jl
	tfVMf5Zz4xuJIISyj1uE07KDS/9i9BPnFEvcDnC2IEFgZ9uIG1SlvKzf
X-Gm-Gg: Acq92OHHBT5r23ryRzzeAf4v1LtmQgYvoyaw3o5c9nybq4QDRaUBRm/K/7CKnknsiZI
	3MJlL/FB3qyOer753PAMi/gLX3BWprz63+5WKD+B6TsWxJKHyQxh7SM97G6BbaUxUP965Jq1O3l
	h9F6tFSgan94qojH3EqnzjLmzN9jmIAhKMUr3h9kD0le+Y9GUaA2nIj60j+TnesgHzqNwEJ2Q9f
	bRcCqOELseuc9MGgCuf2sMfxxP76mBR5FikxT8lK53lM1PvpN+E0AJkJ8/TvcIlvc4S5TdYk/FI
	XO4nfCmS2+zjx1Qsba8WfuNp/JPuDsZWgA0fubUrvQlnSZXOyQthf1gh+XeilK8DoEqkOpJ2UhL
	S9t5Qudwz6sYy6/ZQxfho8+fC8ixAJi+6nV7D5ZfJE4cvjCoxpiNTvL8l3TKSaxKcRoaEtcDwX0
	Bw84SGzuZQDlNXVtCGz14TXe+VYF3Nzyg5amLV/G6Wu+eJ4BoWLWiVcw==
X-Received: by 2002:a17:902:fc46:b0:2be:3626:dd42 with SMTP id d9443c01a7336-2c2f0b20e74mr24781095ad.6.1781170548721;
        Thu, 11 Jun 2026 02:35:48 -0700 (PDT)
Received: from page.local ([2402:a00:163:2ce9:c93c:e372:27b8:7e1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d69csm270572795ad.2.2026.06.11.02.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:35:48 -0700 (PDT)
Date: Thu, 11 Jun 2026 15:05:41 +0530
From: Ajit Singh <blfizzyy@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Message-ID: <aip7U3GXEjDEQLq0@page.local>
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
 <cc48189f-421c-4d04-945a-5905fa52357c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc48189f-421c-4d04-945a-5905fa52357c@oss.qualcomm.com>

On Wed, Jun 10, 2026 at 03:01:48PM +0530, Konrad Dybcio wrote:
> On 6/7/26 1:36 PM, Ajit Singh wrote:
Thanks for review, Konrad!
> > Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> > QCS6490 SoC.
> > 
> > This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> > support along with regulators.
> > 
> > The UFS ICE block is kept disabled because enabling it currently causes
> > an SError during qcom_ice_create() on this board. UFS works without ICE.
> > 
> > Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> > ---
>
> [...]
>
> > +		vreg_l16b_1p1: ldo16 {
> > +			regulator-name = "vreg_l16b_1p1";
> > +			regulator-min-microvolt = <1100000>;
> > +			regulator-max-microvolt = <1300000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +
> > +			regulator-always-on;
> > +			regulator-boot-on;
> > +		};
> > +
> > +		vreg_l17b_1p7: ldo17 {
> > +			regulator-name = "vreg_l17b_1p7";
> > +			regulator-min-microvolt = <1700000>;
> > +			regulator-max-microvolt = <1900000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +
> > +			regulator-always-on;
> > +			regulator-boot-on;
> > +		};
>
> Any reason for these two to be always-on?
vreg_l17b_1p7 supplies VDDD of the ES8388 audio codec, and vreg_l16b_1p1
supplies the CH7218A eDP-to-HDMI bridge. Both consumers are not described in
this initial DTS and will be added in follow-up patches.

So yes, these do not need to be always-on in this patch. I will drop
regulator-always-on and regulator-boot-on for both.

>
> [...]
> 
> > +&usb_2 {
> > +	/* Routed to an onboard USB hub for two USB-A host ports. */
> > +	dr_mode = "host";
> 
> Do they need to be powered/power sequenced in any way?
> see drivers/usb/misc/onboard_usb_dev.c and e.g. qcs6490-rb3gen2.dts
> -> usb5e3,610
Thanks, I checked it. For Axon-mini USB hub is powered from the shared
VCC_3V3 rail, which is enabled by board hardware. There is no hub-specific
reset so I think no power sequencing is required here.

> 
> Konrad

Ajit
