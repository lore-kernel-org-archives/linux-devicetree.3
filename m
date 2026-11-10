Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794331753;
	b=XteTGj8pTNqV1WO0cO9JXiMWZuTj8qh/yDqA6ppr7STOLjhAbtJ+ZIDeMstqNArmWQr8
	 YV3V8SEEUC0BpIldAeQEN71kz/G38jIHCJZ2B1logA+ES9RmbL2CJHE3YHckVukfbhyC+
	 TMWkhi7eNp1GcsHb73IqSka2Mupi5CQqteHw5cHrTff4Sj0EWpsjHsA6as0BksxhCmK/s
	 1rgDjFUbOQ03WDObhTWKv/2sLVYJk/aezXgO7OEBFg6W3b8yMu+gOXgHCHlCXZ82KPf3G
	 Zgqq8KH1m1roileGaWiT6+Mr33oxFeLkVr+LJV8ydcnuNvprFP1PNWAjWDj26s7fQ+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=w8bphJreiwxcy3ITTArW1/PZkIIYY+g7zot2n2erm3c=;
	b=yWojoO9iG96WfAU1kocMS3/3yrvPvKMiGi15/AhvH9zECW9T0NqdfhiNun+PH1OW6z5t
	 Vgy6xZbF4AzWBzf4ADMbaiDF9a0FaHB9hLEp1x6nd/wffqo/2FNTGzcp5/lb38+o8aaRL
	 CTCszsrpiuJVtO4dm8G0ie9iOdjmO9zMzuJgBQqjCwrPrtjFIa1gJzpcOhMjELhPUTlsv
	 WuKf8ePdEmwd2eHMRHwMBLr+drO9S/ori6q4fZIECPsspVcVVmxolt9gXMM0bmtkMQQLb
	 pajzMNC31JuMcTekUkJE5JGDqITJHvVpZp5jxqsIIMchLANujQLJAs+tTC//Y84qoXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PbFSQaga;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EC5606A320
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 17:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04EC5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PbFSQaga
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso2091296e87.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:29:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794331751; cv=none;
        d=google.com; s=arc-20260327;
        b=Q8Q5GblOBTV26nSLSoYPqUItu3QYi9UYtn3CJVg3elJR5DqZcQE023t38YEDpZpVrQ
         PCl8kVSBqqqE59LPvT0cpm2G6KlgdZgKX5V4/DV/cHYhitbc/lhY3fd2QDMoGzATdEYe
         qUX6zaf2FxhjRGU9K33jy1y83ZQPlucunNGqo5JhOXgtTus3g7ELFExbyVIz/7HX5cyX
         3TXsPPHpc0Odi7WWR1nngy6HBEFRSdY8zPS16QmhftFRDvvqG0qKuUDgipSTM/7j0WEG
         2u2LrtgBtB/f64koFGM4OwOGW/PryNrkcUEuaVIFSZeKbYH9M40aWVm/BZxkV53k/qx+
         +jwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w8bphJreiwxcy3ITTArW1/PZkIIYY+g7zot2n2erm3c=;
        fh=Ya41U5MZ/AzmE13N3llhfEUPopiVhpAmh+2azqaSSmI=;
        b=PLBMvP4r3cnMTGN1LCh/+Q1UXQ+/S/jNzgO8Km08Q18We/hr27uBGU1byJ9JkiUK7R
         pkv8TF4GiOcK+GgjBO2ZHgCZBtqbvmS4YnLmhBMekigHMuTaJstJRiKo+Qt6Cl1SHYVW
         h1+GLz4p1th+XeI8rATi5PT6AYg8uaN4Ns9plwD4nZAROZ03BDwrELFVGY3Ya7GGTxhP
         Hg3dPkU8zatXiIjvUSFAMv98YS1ytyxbyYaHRLCFSPeogBdn9Yg9SQe5smDTcfR7iAod
         93OBMoJoBnhvbqltvPl1uV07gCBALr2GFh+Y2YNzPG0rCNlu4yMksPlubjaKSYcACkOl
         xGww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794331751; x=1794936551; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8bphJreiwxcy3ITTArW1/PZkIIYY+g7zot2n2erm3c=;
        b=PbFSQagaMljm8DPweBD5ptIJdMs7OFR32JuuChwcvPCrZQ/QdaIq0PaMTor3MpTZBi
         zJGOfy9GMIKeLgUmpvlyZJNjllQVX3PKpqphML+g/uwC7MA+ZP2LZjVDlR2LbQtCPmrl
         8UGrhoV+xm4rOXOT4eWH9yMtDcFjQgXAwmmmuiPQdpAsgUnJjw3vi9OyhGNt/5WKpv/T
         4IB496q7sXY1TSqAxwY/Timx//3/pdeGEV6HDfAVjpNt43w4T9X+/DFHXJ93n0giarU8
         QGGaJ3vfa49hR2uRjNYrna8nRnpIOaYj4eJIE8t6g40LisdXoXIf+GPIpRTANb8opdiV
         GpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331751; x=1794936551;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w8bphJreiwxcy3ITTArW1/PZkIIYY+g7zot2n2erm3c=;
        b=W9XF62xQaLtIam475cc50sggZi3G20rdLJ1AUgO4vGNfX6knrwVWriXJPpqVzJB8fB
         DI4D1VYjomdBDrJTN+iXXYLcgHnFWBCj98DbzDO+MGPDLMxRajQ/DSmi0Moq0pPByyfl
         H5srV5gg1luNbPN35BA3tneIeOlmKxCXOuoDvIWr8UNB6OuFXeFCeciZIobs6Itx1UlP
         loGAVonviWyYxdf3XU291aOVPcVpfEPMQKp70PyIdpEuxRJ3v4j1Oe2aCEZfrXbta3di
         Lp5E57TORmgP4wkxwaNb5oglC+dTnFUCVFO5gcvgWzt0XCc9ftH+guVhTULqzPGIImvJ
         hpsw==
X-Forwarded-Encrypted: i=1; AL+hErFg+2UUzt6El4XKRsQOr8v9B6VwSQ8FcXNXNQZRjHouxnsxRcSJxY01KY12ArUE0pnpE1O7OGPad3RB@vger.kernel.org
X-Gm-Message-State: APuU4Z9bFgCMLGS/Q84K2p4xJW4I1Go4p4X7Ugfyrz3OSIYP3YVB42LG
	NbyfB0eO0OdBck6Iv6jUtZAMAI4dKKUmWc9yW4boYlsWNi+bhXA/8kumGzzP0UYl0lcrbFSEoTP
	/3CrGIBQv2pFqJvFdRC23NKlHXSFNTPShGow4Dwc=
X-Gm-Gg: AYBFou0FazNF+2yaTaD5PYJ0WhXPeQvC8GY7llJR4oVL/eWOsrUAaSaWDpNbiNYn6Ps
	s6CQptz9uHs3L06uTs+bapbAp8cLHRj+H2WZ0L21Ta8YSFD7Hgis83c8J+yCgXG4bJ4vkIFsP3q
	BiT6rnfpPPzXcedh5PezHEOLwhHLMpt+kwY6cGQPVslxExXSXx4xSTNBb96klAPZoVsRM91NWg+
	hDXacHRAZ75E2/LePfddXA8drnpG42qh6z1wJ1KhHRc+IdvZlK0w6XJyNSTD3BSOJnx6c5c0VQS
	UbdpqofSQwTxnvvYXbopWvq616Sx9NpVFywyM/jQZ5FGKXp2gdTMOhB8ud9Sibhq5m5vI1twVu8
	t8Qpt0ehOJ9dZASsgnGap8ANsbi3T1kYLX0XQ8vnACa6O5El9rf9vE6Z2W4dPoW2PLxXSvlvbVA
	xS48gt7BPvP/LspO70CgO4WCLjI6AUobWjA51Shit9JfNMetaYTV1KrtV4nhBab2NsN2567bqNf
	wcPHRn+WWb2Vuc=
X-Received: by 2002:a05:6512:6c3:b0:5c0:ca1:9dcc with SMTP id
 2adb3069b0e04-5c156ec1df8mr1016598e87.57.1794331750711; Tue, 10 Nov 2026
 09:29:10 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011154556.155831-1-kieweg.leander@gmail.com>
 <CAMwcS0i-RQgWGHTUTVBwj8_is94siqwLg4mjgbN6qAhvosRb5w@mail.gmail.com> <f06459fd-616b-4810-a8f9-cb4df2fcbd8f@suse.de>
In-Reply-To: <f06459fd-616b-4810-a8f9-cb4df2fcbd8f@suse.de>
From: Leander Kieweg <kieweg.leander@gmail.com>
Date: Tue, 10 Nov 2026 18:28:59 +0100
X-Gm-Features: AclHuK9GFcVmvDqE1moH6mB6Jdj4VCxpr5sDVvrrE5IOwXQD8Dcfwi1xMM5Md94
Message-ID: <CAMwcS0ii+=5LvgeFRmMkQKUm9oReQj=-t7vZ5uxCrLGi=jzvnQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] drm: Add DRM driver for GlandaGPU (VHDL soft-IP GPU)
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"

> Oh, I thought you wanted to send a v7. :)
>
> There's nothing blocking it, I think. I'll merged the driver in soon.

Hi Thomas,

thank you for the review and for merging it!

After Christmas I will submit the QEMU patch to get the official
device ID. Then I will send a follow-up kernel patch to replace the
placeholder.

Best regards,
Leander
