Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE3745518A
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 18:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854170; cv=pass; b=gExIn77g6iqV+KvyGX0ePCEEXkfZ/4fDa0JQmp4C6b77eVfq9lpHNwtQKdq7TTh/dCplIg0S04Ar7s61AlcwIBM7DemVH3qzdEkJfNLTZn6XEnKSMjMNQEdfMr2mf0KNHPI1TODkCQ4weh2M+Iuehxk6eJl01nWR/XE/Ox1GFTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854170; c=relaxed/simple;
	bh=gyvcr0bAWy6b+XaWJz4F6/gpXBvu5rK1SECJF9HtAZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIi39r7Lx2NxMsuX5nRse5a8L6rEgBHm9c3v9v54wwLnUN9V+l+92S8ocjvswEITPsLcZvLAGbjBltKHrzsMVeU9kXtDqbrbI6gV+SeQB9dl06/VpmoUano8f8nCsAxdTM98vXbyfN59pKkDSYIjVCQ9lz3vZnZCilrOUkCwrT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiZevoJA; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiZevoJA"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66d116f0de8so426157d50.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 11:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787854167; cv=none;
        d=google.com; s=arc-20260327;
        b=fyHPLby+UMY1qLdO06uIuC+iNVxChgoYJUh5FwP6V7BLA9TZz06Tvn12v3PxH8cyn7
         Wy7HJWa//ZASMoP1+O9snh9/aC+YsUYXui2zm/25MHH51SNXXXPALDtuJAQjMrzPt0Bl
         aunPemP3KusRIzEQFoiVtr6qeVQSF75MRCxjA9tncVVD+pm3++VljJJK+5ZRCDkJk4uW
         hR/GBqmX4LTjC3WD/1o6fgQhJS29LJXTr4ttTHnRANxygUZaMDcTuDcrbVfE7lEU6qg5
         dr5G4JuYu4gm8NEi78MKviV8jKl02zeV9YcaLb0L+4kyJyfZm7wBcuiA07ppNvEIlbvf
         q69g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gyvcr0bAWy6b+XaWJz4F6/gpXBvu5rK1SECJF9HtAZQ=;
        fh=45ZoA/yDNGBMkMJL0fcONmDNiUUmVJ1Lvrzcc4Ya7xg=;
        b=igndWiJCAEfDACbPEyQ2tqeQhZe/inXqXl3Ygqpp8QTUwfIv5g6UOO8kHOQwjqDigz
         zd93FI5KVyJwZNHgw86x4J5OE5Rr9KZtjomiejZmLBKgfBqMmZmobhMzhXC22DzzmIVV
         rlQPmyhF9OT5I/O996x1Ve0nIH6WcKtJSygBtJ/ep8zNAd/7PXs8Qxqf+PFNRlk/kCE4
         B0FH19UcaWTiiUI3YByWcz/FjOPUrRyfHdjLXEOVWMWHt0kIzba7v9LVm9uEcdENS4pJ
         SsS/VpBQKadIh+9KWdyqmaFY+NSaGGTuQvBHfgYbP614HeU/WSrI0ZWiT0LHXrvSjUcy
         hCpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854167; x=1788458967; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyvcr0bAWy6b+XaWJz4F6/gpXBvu5rK1SECJF9HtAZQ=;
        b=GiZevoJAMWstBxyG3vW89tA5yzV7K52s+cOLWm2BTHyolHfkXCYHPMBpACCDgZV+5Y
         WHN543CexEyfQug1l7LFgM/HOQK+cahJHJ6kC58Cd6IQffeKiXTNhWtgMNyPgJ6b9U1n
         UEcdLuzjyixYSb3JRMgiNuZRwca3n0GxEg/ESaqaKWq1t6k6k3pmdgZFHXjr4LcN9Aru
         n9ayG7NvDh8vzJVVH+zTETz4CsLd8X04hwHo9Bf0sGQR6N4R178rjmYkBJwrF9VR7Psf
         w9U9b2sRKU2nO/FAANAF+iiwiMh2RViyeQutoZZIPsa/ogc/KZFQKA1hlMkqjE5R8BBq
         BGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854167; x=1788458967;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gyvcr0bAWy6b+XaWJz4F6/gpXBvu5rK1SECJF9HtAZQ=;
        b=BfeR1dTUG+QxHE0O20qPZhjiBrCvzZSJd7QKEkCKGH8tU67LaEfrDlFo+msmYCm1FF
         TFOxYm+ARjAjyKoi4Ex+3vQG+Yel+wfWlLe6/bFmbkj2L8q+4wLkuSg8/cyarK25dAFm
         e5oHsC4tsCHI0drs/gaX0uXZfH7/suBXwtyDNSCR9aS/a1eX3bOUU0k8nzmqSYrM1IHe
         jp1E3iqEqpcIj11JgzK+QcnhRhArICuTmLiXAZoi5mcHlwL9lcisCG4xuqObaQavqtKV
         N5woHThtix8hKaoA3+Irc8vYvF4k/lKXumR7FKavt5Yl4S3gifyxJPRDXOPJfSJCGEoj
         uumQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEXs4Tt7byFAgbor9PPmcDb7yiBF9VD2+OD5YjPulZowyfeBAlVXrnnILIO3OS0WxnyCmfqXzaZ+Ng@vger.kernel.org
X-Gm-Message-State: AFuF++lnTQJEVRpN5aplAPf48KQhM7o0RbNn7FeznISl/wAlQZNAfJJb
	k1fqa+/pHEtQzUQtrfJiGj1/DE7HmWnkW8gBWRzQoR7L3/fm6syA8bMjZTiXfIxlxn/tW68UYcP
	Or7+hra4VwhXqxxSMS88R/8N/ePNMaz0=
X-Gm-Gg: AR+sD10Ippil+scG4lzNkPD7IlkzJIvWKXm3t1c4pbk3KFRAVDF7fbnYLCYZe7kzNT4
	4oeUr2Jf6u0rHXlDnghVsqHzKTB9yZwItBMzpfU4gHn2A//dDGwu8YIu8djSbVsvMbyRdccama9
	q8iHB0vTO7diE3OV6PuIgGnkyjm56CSWyUqgUD4TVhygLsSM34Bvyw2Jpc5VaqRdcJlhPLT5SHu
	N6TRGruztzxbPx5luRun+Q9n1/QaR5CBU+Wdr1XpOHOhoaODSv4bBB62vxrTEukeO+14ZOFEP+l
	LcCaZlWjIqeMRRhDcTzYAtVkFcn9MJ44ZkX2sUShQOBWvXcCTBl2T/R8Fh3ywjgwq23oU+S5tMt
	e4dhRCjHVqDdaw6pnI10kO5FNeA==
X-Received: by 2002:a05:690e:2052:b0:66d:1877:121b with SMTP id
 956f58d0204a3-66e4c6d6f17mr41588d50.32.1787854167499; Thu, 27 Aug 2026
 11:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827171937.28878-1-gvalkov@gmail.com> <20260827171937.28878-3-gvalkov@gmail.com>
 <15F55ACD-E206-4B79-9E8D-1ED24427BB19@dolcini.it> <CADOrJmae24XCgxFwtHssdoWc4rv1Q743hfgjG=kUrVPgf6urmw@mail.gmail.com>
 <A7FBAD8C-3AAD-4268-9BBC-3BDE071481E1@dolcini.it>
In-Reply-To: <A7FBAD8C-3AAD-4268-9BBC-3BDE071481E1@dolcini.it>
From: George Valkov <gvalkov@gmail.com>
Date: Thu, 27 Aug 2026 21:09:13 +0300
X-Gm-Features: AcwNN1WeeO0QLErFPaTPUKzS5E98_pxOjOnXU5-Tw2FaecGW6bryCcX8wHHKvEI
Message-ID: <CADOrJmZ8u8Gj0dA=CqzUwxM32uN5ZOJ_GdaXJNi1ttYpp4FvrA@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] ARM: dts: armada: WRT3200ACM: add marvell,invalid-reg-hint-in-rom
To: Francesco Dolcini <francesco@dolcini.it>
Cc: briannorris@chromium.org, johannes@sipsolutions.net, andrew@lunn.ch, 
	krzk+dt@kernel.org, johannes.berg@intel.com, kees@kernel.org, 
	miriam.rachel.korenblit@intel.com, rongqianfeng@vivo.com, wenst@chromium.org, 
	rafael.beims@toradex.com, avraham.stern@intel.com, error27@gmail.com, 
	s.kerkmann@pengutronix.de, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, chunfan.chen@gmail.com, arend.vanspriel@broadcom.com, 
	peddolla.reddy@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 21:05, Francesco Dolcini <francesco@dolcini.it> wrote:
>
>
>
> On 27 August 2026 20:02:27 CEST, George Valkov <gvalkov@gmail.com> wrote:
> >On Thu, 27 Aug 2026 at 20:40, Francesco Dolcini <francesco@dolcini.it> wrote:
> >>
> >>
> >>
> >> On 27 August 2026 19:19:37 CEST, Georgi Valkov <gvalkov@gmail.com> wrote:
> >> >WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
> >> >from the mwifiex ROM, which conflicts with the platform regulatory
> >> >configuration on units sold outside the US market. For example:
> >> >- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
> >> >- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
> >> >- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US
> >> >
> >> >When the system boots, it detects a conflict between the user selected
> >> >region and the radios, e.g. BG FR US, and applies extreme restrictions,
> >> >preventing phy0 from starting on any DFS channel. phy2 works.
> >> >
> >> >Add node wifi@1 with a flag marvell,invalid-reg-hint-in-rom to the
> >> >WRT3200ACM device-tree, which signals mwifiex that its regulatory
> >> >hint from ROM conflicts with the platform and should be ignored, so the
> >> >platform regulatory domain can be used. This does not allow the user to
> >> >change the regulatory config of any radio. It only allows phy0 to start
> >> >and operate according to its certified configuration. All radios in
> >> >WRT3200ACM/WRT32x are locked to the hard-coded configuration for which
> >> >they are certified.
> >> >
> >> >On WRT3200ACM, the platform configuration is stored on the devinfo mtd3
> >> >partition, which is read-only: cert_region=EU modelNumber=WRT3200ACM-EU
> >> >
> >> >The Linux kernel sources do not have support for WRT32x. An equivalent
> >> >patch for these routers has to be sent to OpenWrt.
> >> >
> >> >[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
> >> >[2] https://github.com/openwrt/openwrt/issues/9956
> >> >
> >> >Cc: stable@vger.kernel.org
> >>
> >> This whole series is not material for stable. Please drop thia tag from all the patches.
> >
> >Dropped CC: stable from all patches, and sent v9:
> >https://lore.kernel.org/linux-wireless/20260827175850.89395-1-gvalkov@gmail.com/T/#t
>
> Please, you are not supposed to send a new patch series revision every time you get a single comment and you did send the previous version just 2 hours ago.
>
> It does not work like that, you just create additional overhead.
>
> I assume this is all documented, please look into the Documentation directory.

ok, I will make sure to wait for a few days in the future. I apologise!

Georgi Valkov
