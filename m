Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C07368D57
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 15:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787327953; cv=none; b=r4YSvMLlzVOb8ShKX+v40sX2UD8kW5MRvVPtE5E7uvJf/8ubyckITFIkR3/KLjJJzacPIzUORPtsbtGoZZC0w05VQBUUNEpYTzBCbWkDkZkKHJpP2JAzBvAQt35CSCQjLcI1MjJ5u+dPkIl19jxaisGCimhswpd3z63HFUTG6Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787327953; c=relaxed/simple;
	bh=/a0pcGfQ/DN5G5vgeGh7d5qeMSleQ+VJHVJXKyA8bJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=tzn2WKSWiCJsshjzUTYJAN9Gy5syvr/1o4bdo2G8al3oetj4MnDPdY4gCS77/tmUA3R5Ch5EvaHwVwr8NG7qNtjzsaRqFxXoSoFrbpt0dwUR0vmaSadpvt8f2obTLs4QBxR+jTabQYJfNWLxp7UZdgN2neALKC3WZcdcD++px9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuXGYB4J; arc=none smtp.client-ip=74.125.231.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuXGYB4J"
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4af7b6a2349so494248b6e.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787327950; x=1787932750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/a0pcGfQ/DN5G5vgeGh7d5qeMSleQ+VJHVJXKyA8bJE=;
        b=MuXGYB4Jgs4X06k1sgE9Zz3GefJ1isT1b3y2VX6DTvW0vchi9wDaPd/Tr4nOjYBxNl
         dFgsVYr/DfDDnlfEsLb/uxKecH2ezXXqU3JzKtDalMObnG57mc3EaJ5oWtPN8UoBGa8H
         tIU9d2xv2FavuxAyQSza5XeLtenF5BKDkZAQVwtrtyfDso6lVYohTrlZ5Tw+4+R9oydR
         fzZWf1XcrGxFNrAOySX8hRwsFL72l0fWfbSprOH4ntfG7CQ/3i5yxn7NxUpQUfZU/k7a
         zghYLBHMLcQVG8kBkAE9QaBnksM+siJU2pIBg5sDd4UrdZq2QGrrlOXA7EKrMNVbkM0+
         5/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787327950; x=1787932750;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/a0pcGfQ/DN5G5vgeGh7d5qeMSleQ+VJHVJXKyA8bJE=;
        b=J5bEo3pziZGPvYNFC7Pda0FU4DqlmIdT91d9hUox6LiFyIRivrY8S0exIWS2ltUz/z
         baRa7dbloXfaqCkAVmG0XoN7Iq15KkmFOXn30YcgLELytUNtxnMBZdY/qGelxRNJ/leJ
         inqid2Edh8CY7t9DKih9ZV5RG9GKOjH5CTnRra+QRDWitwuVV1rxT6lmKtIjeiZLVUID
         XVHUUVlnAEKx2p5ezSvgjRdSSByCY6PlF4f5E2qtT/O8M7EJSACXnkOl8ltWywZZ5YkD
         ROSk6rCrk+ekz8oaJccYgjdUfMpUxGlRyctuHdVda2cWiPngMeZVmdqhFrRDr/3gr85F
         K0zA==
X-Forwarded-Encrypted: i=1; AHgh+RoDOGrGKgTTEzS8OfRA9sZO5ysSvoiBOxYo1YQif0OkYwkdkrx/j9KvDfA88LujyHhSu24/MIhDv5ab@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1QAlAmkweUIBAn4c9b4foB3be4ryRD9z709gyhGjBcm3MBHl5
	1/sXe2bsTTKnJSWdIjt1Kayy3ZjFGe9iTExp9jcnLZq+t+uBhkKWkSq9
X-Gm-Gg: AR+sD11+JL5NwSJLfZrEHl4e40jb6IkEgcs6OQ2JkrzJl4Jb5x4FvzKV8n40nz0++SO
	D/OH6HWrXbz7M5BfTMcGZYu+nk1xLTTGic3SudKuK4hKiQrUlFcG0kFUK5SBVgfMSFTB0eTiJ3e
	S94InLncLccXEucIqfw948pCAKcl4rX/GF6tP3OGsuJDBxJW8oYzP56V3sXT5tHWsAXpODWPCJO
	iCUhmwnhhCZ7uofMiruW81+iZmaJgRePAH03a94NGsMmHjQn3/4jZ2yghxPQeYQ2xzvTnn32C0Y
	+Waal++bpoaw69NyX/XdZaA49OoSyEjQAGeBukvPRAT+HoJ692bvU+6tFxsTtF96tjRxBSFNTVi
	ZBEPcwlYzRh2LWFsgKEjdnbM3G74BPDo1NY8RX1xxE7rpCwXHSKaIx0FxwNuQC5OpW/WLVgSdlw
	3tvjKRXNj6fzFF2w1hCGP2j7ueJsHdP83w0xLhPSnUpnFQkWW+eKzqDnhd1A5r/y/P841lyDqZ4
	HCE8w==
X-Received: by 2002:a05:6808:1527:b0:4a4:933:b20f with SMTP id 5614622812f47-4b2ef14d4eemr6740578b6e.7.1787327950508;
        Fri, 21 Aug 2026 08:59:10 -0700 (PDT)
Received: from ubuntu24 ([120.239.197.32])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d8945dsm5119763b6e.16.2026.08.21.08.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:59:09 -0700 (PDT)
Date: Fri, 21 Aug 2026 23:58:57 +0800
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] tee: add MbedTEE driver
Message-ID: <aoh1wdtxXF5PkPPw@ubuntu24>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGgiveU2TjkA1YnPxBy2e9qtCorSumuno04aEir-u74yKvXBsw@mail.gmail.com>


Hi Jens,

On 20/08/2026 10:10, Jens Wiklander wrote:
> I took a quick look at the mbedtee project, and it appears to be a
> one-person hobby project. Sounds like fun, but I wonder how meaningful
> it is to upstream a kernel driver if you're the only user.

Fair point. I wasn't fully aware that an active user base was a strict
requirement for upstreaming a new driver, but that completely makes
sense from a maintenance perspective.

I'll hold off on pushing this driver for now until mbedtee gains more
actual users. For what it's worth, the integration side is fully in
place with tested QEMU/FastModel support and a working Buildroot
overlay, so it's very easy for anyone interested to try it out.

Thanks for your time and the prompt review!

Cheers,
Xing
