Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103CA3EDAA0
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092624; cv=pass; b=EgJ1n+dTaBpKY/wgEzTPnJFad271DDK89a+MSABW9Nkfb7hF/X7+A/CFTOm9d7+sPg0SGPIGpIcnYJncXdnUqXghHwhvAB7RFUCksnuxPYosd0z5LoX2DApD6zwMn/YWHGBU0Iv6/uYLqONcMHXaPIEey1gc/Q0yxnuGOlm3VSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092624; c=relaxed/simple;
	bh=g9gENECLjqpwTfBJQOObPdITxQAcT49QARwQwMzJgqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MB9piELtH0+jtEWcYqOlmZbUlTs0gXrpJgPRUUI0G5IwqXmYjQ7HpPR/x/feMZUDFs/TfOvlSje47I9PBYDtGXa5mUt4KmebCMoMVWw/oZIUuaXo20uSM5buH5idlCAAaX0dwT0FI4+179lPopUNcRIbrW7HCvvIO6JVRwXtP08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PX/QY0mF; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PX/QY0mF"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-660390acd71so6177671d50.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781092621; cv=none;
        d=google.com; s=arc-20240605;
        b=b9i6JwWFzPHfGmSc6TGQ54AnfS2wLzsKlDReJI0+xLFrGtnDaKxdJJt9xwFXkLpdoE
         239S7gJRiIVqxDLnSDx3fhi9KMO8Ra6yT/oQfGOJLv0GaWJVF4d6uvkn1Nx+rcivIX5X
         AtRjzaHKFbmyln2NI3s4AdjREbmS52ntXG4U6vFc2cgJvSLyTm5h2odPbwknIPV+u9Zd
         wVWYPJ6hc5saC+UnV2oNbRZZ98Oi2EukOpt8uZ04m2HVelntf+Enkw9eXkimMFNiOrPy
         v6RLDL5/eEH+zGdDXCWAw+cTYhtl3Uiy8FPDWC5czdGPVggD2qjQnaGo0c2nBFDgmozc
         IuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BXH8Qat3tlEctSHgaHbXW/OuqgxXWKUgbkKdMHQiIsc=;
        fh=Y4UTbPQM12p4cCkzOl5uluc4VrgTrNC1BlhhQfIgfdk=;
        b=Rh1bcWIM3gLaGZp2HYbLVukLSGEIarsVIqoP4BPJ5Nh0NYgKP5V4mT8nqB7S3wHFae
         ecVrJS9nsRo7EZd8C6F/v0Ev8HWiQENM8vR/ARmBhDc/4IOqfELfERX+/3QbR0ORHYra
         O1PMrbBTqkp3g1jcc+06Qut6isqb+CyV26KoXd5zTPwWaaoPtAMgFGm32K+yqErHnyL8
         cRMKTSfVm386KlX5q75mZXSQx2Hs1tahVCwclxwvjW7qPGFzVM1JlempSYNMnuKJQBa/
         bai6ktf90GAGbXxk9EVxsS4yMHA6kFURzZo7KReuJS1Olyprml2x1T1LhIKnO8PzT6bN
         k3qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781092621; x=1781697421; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BXH8Qat3tlEctSHgaHbXW/OuqgxXWKUgbkKdMHQiIsc=;
        b=PX/QY0mFn5ZIB5rtK5uS8JXLcUJ1lWpwbxLz+nU6Fcaru3NProQmylQkdujZkVuhFj
         PPoeOk8B+H6iSJwmuq426kOh4LuKcS5Ysom5xleXTrixSxnRQwobQ+RZIV/SWYKGsp7q
         /3OTvg0ImLK6y2GQnMHl3KdCDel3+UMjD6uBd3tP0evMstMOP0NqMb7+Qq33u9nyxXNe
         1r72cONiIvq+yz/tsNbybXg7PeCxzypLzfHW7jFdCFLQFmCSkd3uFuqzO55DkR/3E3Hd
         pGCLvrol+1yy6D9x05W76G+2WFDcjnbSYXItY+LZmLqHN8NU2xTTGlZ3v8PBKuhx5wvr
         VvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092621; x=1781697421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXH8Qat3tlEctSHgaHbXW/OuqgxXWKUgbkKdMHQiIsc=;
        b=nYyeXneMIHdXzvZbOCo1Nxy+D9ZaOln+fJvIJjuifHy9o1fHWuCBFh8nb1sTwa6YEx
         CCzWESmmiuVjamoJF2aoRVNynb6i4tulX6PIcfNb5M+aw9EEx7ls0uKa4r4j1dGYV7qf
         s/1u2lB5SfyUT/RRwFDIYAKxUHpHnd9KaDiK4PckKOz7YXi4jzvRz4DGUyzEDE4fvADj
         64Nfa8R1iSKLDayHR89PMrI9iduvlaU2xDcyv1nWibfjvaHr8TsFIREtWhFfunmMXXtl
         vZGyRZFBz+u37byyGVZaH1e4MBRHPKHO7IpzBH2cIdMgTf+gXBU5c8ebV+m6kdS/tw7k
         //tg==
X-Forwarded-Encrypted: i=1; AFNElJ9D9i52nEycXQx1oD/d2Oa2eq/CjO8h3ydW74vp/674nRAJVkzuqhXuuczb6hPZGIpSvd/Bl1MANZOK@vger.kernel.org
X-Gm-Message-State: AOJu0YxFauCgebf6s/SHAXpdjYZ65Z+AfgLfKNcLgZHDlCyzZIcckXMj
	yFrIHBio1KCiLDb1fcIKXfF1MtV2qkbvQhNMGEaCyPsoRzgVEpVSCQrxzX39ycD9zZgmS7MUHfb
	D5IOvNnanr5PoweSu4pXiA3v5LpSf63s=
X-Gm-Gg: Acq92OEOzXhRSomJpsu2vpy3fy+pq7D7ZQPBHq3ZXfPgsZZ5xWkn6D7f9KyTaeySMYe
	JOZMQRGJchT/pAbmUIjLqUs8qUrjityXbVVZeI9m2XZKv9mI9wy9J0rvvEYSzEXGrzilz0uMSoD
	BxD6+VjLzy0tt4U5Rji+l2WdF/xsn4usd04OCTPo3ACXq4OE3dAgW0VE0oYuIN9uBuINVe+1gvU
	k00CAvVhT7A12viOimOw9wJfBQf8IBbo4Gos7x7Rluyc4ArybLXK4RsLBc12ASKrytw6cEWDX5N
	Aq4szq4tjCANSHwC1UanLYykLwJm7Rs=
X-Received: by 2002:a53:ac87:0:b0:660:6e93:1958 with SMTP id
 956f58d0204a3-6610a1bdbecmr18780971d50.0.1781092620933; Wed, 10 Jun 2026
 04:57:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609163919.3321228-1-tmaimon77@gmail.com> <20260609163919.3321228-3-tmaimon77@gmail.com>
 <ff53862950a6075c43bb8f1e47c14389d6fc7575.camel@codeconstruct.com.au>
In-Reply-To: <ff53862950a6075c43bb8f1e47c14389d6fc7575.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 10 Jun 2026 14:56:50 +0300
X-Gm-Features: AVVi8Ce1xyKX-eTc7JFGyjnn8l2QiZByZq625HpF-ttuxQcOhnM9x3cJlI6wb60
Message-ID: <CAP6Zq1gBcSEQznnQ+awrqacBXjTOWELQsMLDXL1yw8_daCzMOQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Jun 2026 at 13:49, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Tue, 2026-06-09 at 19:39 +0300, Tomer Maimon wrote:
> > The NPCM7xx FIU controller driver gets its single clock with
> > devm_clk_get_enabled(dev, NULL) and does not perform a named
> > clock lookup. Drop the redundant clock-names properties from the
> > FIU controller nodes so the DTS describes only the resources the
> > driver actually uses.
>
> The devicetree is a description of the hardware in the form documented
> by the bindings. Generally it's not right to discuss Linux drivers
> here: they're only relevant in the context of Linux, but the devicetree
> binding governs devicetrees over multiple projects.
>
> From a quick look it seems that these names are not described in the
> corresponding binding, therefore no drivers should be using them and as
> such they can (and should) be dropped. A driver would only be worth
> mentioning if it did use the undocumented names (as that would be a
> complication).
>
> Can you please rework the description?
do you mean change the description as follows
"
The NPCM7xx FIU controller nodes reference a single clock,
but the FIU binding does not describe their clock-names properties.
Drop the undocumented names so the DTS matches the binding.
"
>
> Andrew
>
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> > index a16450abea0e..83cd10b47273 100644
> > --- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> > +++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> > @@ -193,7 +193,6 @@ fiu0: spi@fb000000 {
> >                       reg = <0xfb000000 0x1000>;
> >                       reg-names = "control";
> >                       clocks = <&clk NPCM7XX_CLK_SPI0>;
> > -                     clock-names = "clk_spi0";
> >                       status = "disabled";
> >               };
> >
> > @@ -204,7 +203,6 @@ fiu3: spi@c0000000 {
> >                       reg = <0xc0000000 0x1000>;
> >                       reg-names = "control";
> >                       clocks = <&clk NPCM7XX_CLK_SPI3>;
> > -                     clock-names = "clk_spi3";
> >                       pinctrl-names = "default";
> >                       pinctrl-0 = <&spi3_pins>;
> >                       status = "disabled";
> > @@ -217,7 +215,6 @@ fiux: spi@fb001000 {
> >                       reg = <0xfb001000 0x1000>;
> >                       reg-names = "control";
> >                       clocks = <&clk NPCM7XX_CLK_SPIX>;
> > -                     clock-names = "clk_spix";
> >                       status = "disabled";
> >               };
> >

Thanks,

Tomer
