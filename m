Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080528;
	b=KtJi94hF4BRXi/g3mAoTsZ098upL6rx/uHYey9asQMH/011qlhXnEMf86fqoVQmYvync
	 wSJhyZrRNOS2yQGvAPIc32AI0VYadJ4KDmZdLqfgxxflMBmQCrZ59cZBPnyAbX9hBQ/b3
	 2lkiE7B2kAWEguEDMqfRnhbz7JBSTj8P5fHWfHhbb1ghZtRYVZppegInEpktza5fd8FRC
	 boZB8NprI03yVjLTR504Ajtf7Kxg01iJ2/L6x45Bl0CeInRg4rvkCdFefWzl6t2Okm2sX
	 GgtdPycaYOVr2JalWd8FN4DiqM56vTfLKWHRSLexTWC4Ozpb3nTvvBRZwGGClgS4NcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tZkUVvzKQjAQWyILkBtC/Saow2IR3GnYSwljO/gw5AM=;
	b=ju/oNchnzxdxKf2exx4q7gjFShwar3g6sXeDQlWZi3dmAKizQYtXqsGrIoRDHYnuNZdy
	 CM5hte8yKRiL7vWjYDQkP7quCM6at7Ku/c/p8A7gfxrCFH4fjaBmJCI4jLnN4qO5g6kWd
	 9c8I+ul680481OEU7TXpwiJSRRtKRhnP8aC7qjP+/YoFOvelcSyjgDQNMxR0Fwt/c0KhH
	 AgygzNlBmuiTsA28t329o/QJb0wz9DvvLIyDIQL7om97O8YX/AcgJgU9k3xknZAdui9xa
	 7EZDcxgrNLwsc25vxInVIfF4CKbgAXb9/cT/+/ZeANG6eYDGCX04qs1MDaZhQlNAIaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UumKtnKq;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB9F60A2604
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BB9F60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UumKtnKq
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so12606755e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795080527; x=1795685327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tZkUVvzKQjAQWyILkBtC/Saow2IR3GnYSwljO/gw5AM=;
        b=UumKtnKq1r1pRhIl6yN3F8pjsM0G5KjQIzfv66wmuNMsafvdfYcIvwZLRI7bgvZI3l
         fY8Xuqe8hmWICS/u3Q2opwfUW0L8HY6EvYDkC2N4oETy4EMyjhdRghzi7X1M5T+tKebS
         4jEDibCvEWME+m5xzokpHveX4G/HRd2ia6MxTKkzxtWoxLBDp46iAlThBaa2sZkOS3vq
         k0pyyP1IpKzrTpLWRUoZT8W1TjvTsnvldczRKXb1GniyYK9Qc92sUJGm6W/oIg/czk96
         ANKJ7WEZ+VMZG2d4K2NK0nFKv54Ngkd4XaCVytJY1Xy4yEEpB6XNZMec87d+uJodilGD
         Aavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080527; x=1795685327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZkUVvzKQjAQWyILkBtC/Saow2IR3GnYSwljO/gw5AM=;
        b=y4xdkOIUhcawYxqjRl73hUdbe5DZ9wOm1pM+sGX2YrA52y6Bhftl/JHQHEX77bAj8z
         vkWuKrKGGeP9QBP74ASudxPNNR8/tyS4wAPA/C+a5a8lRhWOuML3qtCNLu2k2Rkn0DAB
         hZgi1KadZf42yx7QKlUOJVxvRbeeb1o1QocT8QwbVUgCAVNus3MANLbML1yB2WeXMsBv
         cNY6s5avkbkgiwWjVu2SrEb9tmjLEmMKaLY7gE78Z31t1nM+6j3m9zXhvDD72hZH0D0t
         SRQYsBovZ39+IjB1va1kvDoUL/x0rFsWg71PO79d+FNuA/1htM7J0zNSMbfxWBdbiSAx
         JXsg==
X-Forwarded-Encrypted: i=1; AL+hErFDIRmHcoG/wHoaTcBiSMnEv1Tvn0pFcap26NEco7qZvfltyzXIGJfE/R90+LMXcfmrCUYpW4GuiAG2@vger.kernel.org
X-Gm-Message-State: APuU4Z/PShKBxmdtIGWmTV+1/kUzrf+ssuhE5tnUPeP6sAsTLBNQ4Pv0
	Tm+Wr4aPQvWj1VE9QBtwu1DddA2LqXwXdVOTGMlHxGJ82x1U+oWOfKWQ
X-Gm-Gg: AYBFou2EFjx7UKG6bAdbTtQsjg95BSvgXHKB6i1DymLLItvg2lbuMFmDAtAHNJjtR7y
	wyO45va42RaJpDKftl0IG73Pf+XDoeRoDjgf7ucxvIl9RsZI1sWgA/K00HaKYwrhS2Q2BYSMTNq
	KIrmBKj0JRqdpj6o2iM4FN412y98n1VYzIEzcKynyzsQt4gZuxFAXxBJHHJXEv/Ao7kA8wYOPLf
	kzE/vRmyi1pTY9zA7Nl2yA95XqcCBQAGDXTDsWaCM6TEsPTLpEe9HdNp8ukgeIiTQbihNC+r76s
	6m00OZnrU75nTn00kiwJjlunOdv692FDnf8bysuqL5DFsuWDR5ZaVF3jePyBaCOskfZPNYRJ8cl
	eaEkRpiLV/my4GsUsftDhW1c9ucKZaa3DhEWykkYXer/K+/yf+aaP8lo+J0D4Xa3yk79lncQq2d
	GnSnpEWTrgd9GbnjCkeIXt5IsLlDTBZTskOPuLVZ54gJd/2aym9lsljMM9F59Ln7wdbVqsIjiRT
	4jhOy2vJibL4P1qcOC2XFxW4pCXv6/Atk7LZ/zbqt9vYhgFAGWiJkSLtW6gDm2Z2H+yctDsDVf9
	Z9W/SL/ejfGnnxJ1e6TzTImZZGYIxDA6+RtMTEWulskGQQq6iTN3nQw2olpFZL0HozJuOq2ub9t
	LXGbfa07ZlOE9MQ7abbObVAHf3CmmreqdbWbBuoGIjVndS4PGOpA7pV65ywGtww==
X-Received: by 2002:a05:600c:4f14:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb7d6cc934mr120234985e9.1.1795080526550;
        Thu, 19 Nov 2026 01:28:46 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3c6sm8736002f8f.19.2026.11.19.01.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:28:45 -0800 (PST)
Date: Thu, 19 Nov 2026 10:28:42 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33
 configurations
Message-ID: <av7BStmo7w4_rPci@Lord-Beerus.station>
References: <20261119090600.9257-1-stefano.r@variscite.com>
 <be20af64-e729-4d1e-aba1-c8512ac6e775@oss.nxp.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be20af64-e729-4d1e-aba1-c8512ac6e775@oss.nxp.com>

On Thu, Nov 19, 2026 at 11:18:45AM +0200, Daniel Baluta wrote:
> 
> Use "reserved" instead of "disabled" for all the nodes that need not to probe
> on the Application processor because they are used by the M33 FW.
> 
> Also, instead of disable in the commit message I think it is better to say "reserve".
> 

Hi Daniel,

That makes sense, thank you for your review!

I'll use "reserved" for the peripherals used directly by the Cortex-M
firmware, and keep "disabled" for devices that become unavailable as a
consequence.
For example, Wi-Fi cannot use its reset GPIO because GPIO4 is reserved
for the M33.

Does that match what you had in mind?

Best regards,
Stefano
