Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60252BE644
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 20:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802043; cv=none; b=kYU+sTSeeW5g0B1Ntp0Pbk9mdE0I5m/NnG+1UJcLjm8XqCB97L51wg9ocSHJ9BtxQ2Kb1qWyQcBQfpW+OzKE/PwUmLr3zlzbG84uVtP2t1Fqi36Xd4HrO7rDfxMR4aoKfDh7UTmuh1DSG70BGmoVwMiWIjlhRxexscuUnNZ/Fys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802043; c=relaxed/simple;
	bh=4nGXNP+FFeyOAfKIybOpKVmX6+Eo9BNgkIzpy4p7zWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gq0AfA+5SBg95iZiIakRxfA4wJfDfoYLRwAFcLjivMwVU9sLzDpMIdkVln9Hz01EuhNPYQe34Zx/pejF7i2gDnFL24jvS4k60PM1uRQRW/UHvkronQsgnyyy47PARHNLbzoHBtdGGBt+DjviZFlE5ZxHPvLFswXX0/+X5H7pRZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QvezgtRZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MHosas3m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QvezgtRZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MHosas3m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776802040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1M8Wy22x3elv2D/+fnXEPtAuCSkz1UNFVYr+3jYCUkE=;
	b=QvezgtRZvjorCItDceiuYhJOxuZvfoFyvo1UmZN2XTH5d3c7q0rEKTTEfaPQDWh4S2E8Zc
	ql7I1QYK5ftMdwfeqJSlDhmdyDQhXlO4LDvU6Uef6qGt6LMJgNNJWqggzba8EOlWBSTqoA
	aZW7GTq4z+5uFzwPlq0TYnN3E26nD7s=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-L08PXsGaOw-xYRuzWnaDWg-1; Tue, 21 Apr 2026 16:07:19 -0400
X-MC-Unique: L08PXsGaOw-xYRuzWnaDWg-1
X-Mimecast-MFC-AGG-ID: L08PXsGaOw-xYRuzWnaDWg_1776802039
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a1accb970fso18676766d6.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 13:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776802039; x=1777406839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1M8Wy22x3elv2D/+fnXEPtAuCSkz1UNFVYr+3jYCUkE=;
        b=MHosas3mb1L69W6BUum5er65QveWeuoSi1fmAZ6Q/ey3aAb2I6m+DcCWq/VWlwBtrz
         B7mVmpqbgX0MzUad+oO7aMV5VetUeHCIwNDDBKmi3Rjhr08hqooyMxcIz1KTRslxZ3ht
         IVdcBRBS1sOhSFPSWS8i6yxSiG1l/iTnloBNiw3OIDm8jcJwqmJUKkqMl+kRiK9MnRGk
         LtbJJszUmqX5YXE8WsxtUFehC/li947xbNWapeXt0LlBxh9HPTMIv6NvbtujiYRnB0fi
         P0Qvm467GzNeHBWOAK76h0wMgcWzh4e3nbEOSKoIGhjKyxt6F6kxCqPOojnF4NyK7sTv
         bu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776802039; x=1777406839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1M8Wy22x3elv2D/+fnXEPtAuCSkz1UNFVYr+3jYCUkE=;
        b=HW/0yHRXeJavArWcaXbOSSg3bWEDvquaKRRaEico4er1JwDm9MKSmWmvgdzG9k1PUB
         qsXfsBewWq9pndbZWyQBwHjdy61PmXL7iqHsi5B/ecUlfEhaQGmqA7i23LGuLX7j8vWJ
         V/QXTebi9JJFKSi6plTgiqskcHpugsGnz3HZd3l6lcjdLwMiSYY6wO7fSdeeYOw2LIUm
         f3BPbdvsN6H5zbS1JQzP8Vg4QNkTtlkPgzF9GfFTDo0v8VZQtMksfJpba7f09wCK1F5s
         3C6WcC8oF2Z+vKNmjz0dBjNd5LUS9YxoVJZfRyX1m9ZVQNBPAoFZse0eCEDBZJkH8b9s
         +dBg==
X-Forwarded-Encrypted: i=1; AFNElJ/18UrXFvUh0u0Cg2IrNgxwGKTXnIQG4RIxSWVjUgdkBO45g+tOGInEPFNfWFTVFMUk9FNdpITIIC7W@vger.kernel.org
X-Gm-Message-State: AOJu0YzswPJ4erZm5MFmxz/6vrYANUKEfeSAQC+cZwiJ51e399tHpZEI
	8K92xOVnLYVHJaJfYLHqweEwFraKw9QkMiNUTnxN4K9geCY6HRSFqLxM+A/up1n1y/6dOik7NgR
	SvR/KbOQgANwURQQPZZgXMlk9TymEXFqJ8oTwdLMcePU8cmFiAPUsZCLgtBCv478=
X-Gm-Gg: AeBDietrGr5EDBN7IB2oO1PPuVi7at8pD3SI9DUZjFjnSqRu2vSgVHusnQGZETLAY5A
	j1KPLui0DQO2vzFRv4gj4/mdv+GyZgkZbVCbP/H5SyGa/gJTtqC4tI9ze/uajphTsHNE0n2sgeb
	9ZM0VkLSOl7Dr4MNwxNMVSKFyY9TWxvHfsiwNchiWWQZPiqrTf0n/iebaHMBeCVuERzJFfigxJ8
	4bTb9lH3DmdnYP3oh5gd5obLDdjM03pbXNtQschwtu9KH34ex0W4zkjWIUI3T5bWWD8ZIKWMEBT
	ZTXSrXTDjfuFKeuG2AylSzd4v/J96lu9zJeOptl4S6B3N9qrz00pcOVWlEUNT3FYgm8aCTiyT8r
	1KLfw6MiIWOn4Yn2ySH873/7yonrlbItkUg37/5iZSw==
X-Received: by 2002:a05:6214:300c:b0:8a4:5cfe:a204 with SMTP id 6a1803df08f44-8b0280d0e78mr313218196d6.26.1776802038998;
        Tue, 21 Apr 2026 13:07:18 -0700 (PDT)
X-Received: by 2002:a05:6214:300c:b0:8a4:5cfe:a204 with SMTP id 6a1803df08f44-8b0280d0e78mr313217376d6.26.1776802038427;
        Tue, 21 Apr 2026 13:07:18 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae5c4b9sm149503046d6.28.2026.04.21.13.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:07:18 -0700 (PDT)
Date: Tue, 21 Apr 2026 13:07:13 -0700
From: Jared Kangas <jkangas@redhat.com>
To: jan.petrous@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	rmk+kernel@armlinux.org.uk, vladimir.oltean@nxp.com,
	boon.khai.ng@altera.com
Subject: Re: [PATCH v11 2/4] arm64: dts: s32: set Ethernet channel irqs
Message-ID: <aefY8WGCuNr4BQG4@rh-jkangas-kernel>
References: <20260312-dwmac_multi_irq-v11-0-09621ccb040b@oss.nxp.com>
 <20260312-dwmac_multi_irq-v11-2-09621ccb040b@oss.nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-dwmac_multi_irq-v11-2-09621ccb040b@oss.nxp.com>

On Thu, Mar 12, 2026 at 09:55:28AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The GMAC Ethernet controller found on S32G2/S32G3 and S32R45
> contains up to 5 RX and 5 TX channels.
> It can operate in two interrupt modes:
> 
>   1) Sharing IRQ mode: only MAC IRQ line is used
>      for all channels.
> 
>   2) Multiple IRQ mode: every channel uses two IRQ lines,
>      one for RX and second for TX.
> 
> Specify all IRQ twins for all channels.
> 
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---

Tested the new channels on an S32G-VNP-RDB3 while testing patch 4/4.

Tested-by: Jared Kangas <jkangas@redhat.com>

