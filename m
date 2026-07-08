Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C55305687
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 10:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506099; cv=none; b=k11HWokOQvIYGa2o6g1JyB/+WOoy8+ayyvg519ZZan+MZy5ViWnxsJE73b6FVCbCsomPZAKaZfLCxyWaFYUCLXEhYht95pEexZ/6dkLxrH7CL8+rcZdNH1sltmaQ39WBNaZtmOaq12fCH9XAkbaqtupL7G1hAcSkuUEpdNnmTeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506099; c=relaxed/simple;
	bh=Sla61CzghEsS2r7bRwBRJKRLgZ7yBqxi2Vzh6G/Mn2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5/l21ektNmEr+lMx8211SH04yVRcVZrEHSzGYVapypLUze+Eo7VqgQqHMcVsVMM2fmDokwxvxJodi0ruhtXgIdRK8daev8OaqgHBLxQa6VCXDwk9+Uf7MASNzr9yh7YEuoBjN9+/OaMAmp79ZuHlz7ZSxglzMQ5Koa5mbaj2xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLGupYB7; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLGupYB7"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso618654a91.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 03:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506097; x=1784110897; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=93EN29IqJ6bd5F8a4d6goWGreJMuVVomREVtrVg8Odk=;
        b=LLGupYB7hD/HpE54wIuAjwSOXirqJG+O5vU4YBecYt3O1DuJT4+XfQCwIQDNMDGFUG
         MRwB642ZSas1fHLfaVfjiZSZr2dcOJd5Si1DHd9iQ1953PIXEs1yYzvesFChdIPe+Xp4
         /P23Hyk42ifvS1t2bncZHNf0GhTlF4VTmkZ4UUkq+Tl7qtoGS4Nl1aas1ttrlJBuLt8g
         USBHfijZycEjW3OgcJE2gzZHCAJrtzToVSxtTYcnTshAPpoLzpOsvHzfGrBK5AP6WQSy
         aPPY7cx3z3BUWumhof9ftVWkHI9H+yprWrmF3raOmmj88R1k8R/PKfNftxLv4Y3CVDGp
         CPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506097; x=1784110897;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=93EN29IqJ6bd5F8a4d6goWGreJMuVVomREVtrVg8Odk=;
        b=NJ6TwvtPWzcygHVVp/a82Vv1kBXdX4ufjqbMCB1NANE01RCqiBHJvVOPVsf8N1eM6Y
         eskbkSOB4vz9Mra68SCThvzRcv33bwQCyuI29iQadCpxVWUCob5Udv1KLlNaKrGAvGat
         gZKL/HvyCKKHg/jvcdbJXVFHsXfiP68dPjDaNf99Z/rxnYU/laFppl7utexzYYI352pG
         AuWU1m38lOsdX9J0PY2PCRObieGuvBX3aBPMb/RX/oI8CNahEqOeILssIEgk3hpGCYjr
         PL0PYm0zZJIYR3smR4GeZapSi7iDyV6s4cuIWs4zkYVXr2WGV+UEhPeylubH4jrIuhVq
         E4fA==
X-Forwarded-Encrypted: i=1; AHgh+Rqiojns1QtSWVLSIuk2CEuyExtZGcJNNFECUPLpdjP/ZbRbyFqpUeucKlSGgc0gFWpXGpJDkY9fEDdO@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQlLF+1uSlqOHQ/DAurvtkXWMjRLpmgyUcbs3o4h/U92SSgie
	o1jHZDEYbg19iwvp96rSN3Os4e37oXGGF9LY7Ygnwzj1CKvYHNwtITx+
X-Gm-Gg: AfdE7cnKXOgW652SABJ3b2cWaiU6Yy0B0x/+ps7fC/5dPPAFiOyyXSRfB2HK1x00BOF
	9OAYixazf6UR9FUgRU0BEIAi45zvzkghXeEM7sxD4SkMzR6b954LQB2jGAJfufzvMtTCobg+uwy
	1wKkvFEsuFC/lLfl9xrNXnRiFHrYCqlBQGqBvnMtPuE4siX6XQ+yH4WdhBqbXZ/eLuaTlCxkZbg
	QG+mhcyZ+9ghKCZOcRGhXuijL80HnzdkpN07ug+Uika9JCNoBKeEDuu0myjBp+6VOI1zHKQztCM
	eW7j5ZnxN66Rt8TxecGPGROenaGqtAAd5zuiJKaUXHcNQ3rYp+w3kN88P2fE/QO08WN3KIzVAGO
	M3ll/toPLqKp7P/PHITu3ehggKA9jGWr/VSpmL1I5ltSlWoCpm24T6xGiVUzdcAi+VlFb6x8CE6
	Bi0O3fcpFfTJHaXMwugmzSFGChYKpwhA==
X-Received: by 2002:a17:90b:3b43:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-38941102113mr1927534a91.1.1783506097233;
        Wed, 08 Jul 2026 03:21:37 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d3a65609sm2512387a91.14.2026.07.08.03.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:21:36 -0700 (PDT)
Date: Wed, 8 Jul 2026 15:51:30 +0530
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] arm64: dts: rockchip: add Vicharak Axon board
 support
Message-ID: <kzl6ykopmcj7nl6jnf4uav75cdn2znd3jb4vjlrde364homti6@2y2zfyvwni4x>
References: <20260608060940.52549-1-hrushirajg23@gmail.com>
 <178301901903.3838694.3276523670393868229.b4-ty@sntech.de>
 <20260707160354.GB3176120-robh@kernel.org>
 <14045151.uLZWGnKmhe@phil>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14045151.uLZWGnKmhe@phil>

On Tue, Jul 07, 2026 at 08:23:47PM +0200, Heiko Stuebner wrote:
> Am Dienstag, 7. Juli 2026, 18:03:54 Mitteleuropäische Sommerzeit schrieb Rob Herring:
> > On Thu, Jul 02, 2026 at 09:04:55PM +0200, Heiko Stuebner wrote:
> > > 
> > > On Mon, 08 Jun 2026 11:39:38 +0530, Hrushiraj Gandhi wrote:
> > > > This series adds initial device tree support for the Vicharak Axon
> > > > single-board computer, which is based on the Rockchip RK3588 SoC.
> > > > 
> > > > The Vicharak Axon is a feature-rich SBC targeting developer and embedded
> > > > use cases. It ships with:
> > > > 
> > > >   - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
> > > >   - RK806 PMIC providing all SoC power domains
> > > >   - eMMC 5.1 (on-board) and microSD slot
> > > >   - Gigabit Ethernet via RGMII (RTL8211F)
> > > >   - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
> > > >   - PCIe 3.0 x4 and two PCIe 2.0 slots
> > > >   - SATA 3.0
> > > >   - USB 2.0 host ports (EHCI/OHCI)
> > > >   - NXP PCA9554 I/O expander for status LEDs
> > > >   - Haoyu HYM8563 RTC
> > > > 
> > > > [...]
> > > 
> > > Applied, thanks!
> > > 
> > > [1/2] dt-bindings: arm: rockchip: add Vicharak Axon board
> > >       commit: e0008b108aaf8c5aa22930b2ceadf8f894562acb
> > > [2/2] arm64: dts: rockchip: add Vicharak Axon board
> > >       commit: e08c3389c78dbefd31a57df8807cf57ef6f3c9b1
> > 
> > Both have issues and should be dropped.
> 
> I've dropped both the Axon as well as the Vaaman2 board from the
> same vendor now.
> 
> The whole thing is confusing.
> 
> I should've caught the pinctrl issue, and do remember running a dtbscheck
> on at least one Vcharak board - but that must have been the Vaaman2 board
> because there the pmic fullfills the binding (and general setup of other
> rk3588 boards).
> 
> The vendor-prefix is missing indeed. I found earlier versions of the
> version-avalanche had it, up until v6 [0] . Though I haven't figured out
> yet why it was lost.

Regarding the missing vendor prefix 'vicharak' that was noted: the prefix 
was already submitted separately upstream by my team in a different patch [1]. 
Because it was already submitted, Krzysztof asked us to drop it from our 
own series to avoid duplicates [2]. 

[1] https://lkml.org/lkml/2026/6/24/929
[2] https://lore.kernel.org/linux-rockchip/96c9b1eb-9f8e-430d-9c38-eb4d489d7d24@kernel.org/

> 
> Hence I dropped both boards.
> 
> 
> Hrushiraj: please start anew with both boards.
> 
> But include all the tags you received in previous versions.
> 
> 
> Heiko
> 
> 
> [0] https://lore.kernel.org/linux-rockchip/20260601162143.170030-2-hrushirajg23@gmail.com/
> 
> 

Hrushiraj 
