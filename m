Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620331;
	b=BxxWcMH4urE3fo0VkEJ77SI4B778QzYecHuISM/jwTovBRP9t9H3b3B7NSu29PkxXNkB
	 wDX1rZzj99DfUtYK+MDxxhLLGLGH3J7JxGlvduynPhz/3veFjQNNlAWdk9xsWjMQXa8rk
	 0zbDT+DqNUTtC85UAXKKRwEldeCF6jquwSPW8R1U7TIX2Ffec3eu6v1Q1wu0X2r9wn0w3
	 tqTbLS3a6t1Z5gbKAs7MoVeaoiZHvdNLL8yMwS86yM1NVzjZeTvYcqP1kEiDZ1UG+F3Tn
	 R1J7XXM/X9WTHhN/AaUt2hnbNr2DU2THB29M4zv0xAKJg0QXVfmwfyP0/bJcnBdwXTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
	b=SlVtPMEZAZPRGkHO3XzJaYjqTGOncormagxtbUXO6RF0BDzGpKrS5hVoAk66bWtEDWwp
	 YlvkHN+h2wE/jt3Ub61VGYX6fg8ivQsicRnvLTisqujTNJHGph7eOfMp606doyjvYMIEJ
	 dNhz6Gl7oCd75K+RPF5rq/oLU24frb5t9e9O8U6Mfk0PqPqCo+mMV49/c0o/laY+RmSdW
	 yyFGGybWs1kdO/tJip6Qda0GPH4x6gTmmUEVHEyNKHcqameNv7vyGMfplmZSKfdFT/JXx
	 Jve1riI0XD0AQthk4DibA/0/+qYE+qYPNpFskne1kVGlM08bfTM11X/zIKnHUkF/vbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iFk419Bq;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BBB606A32C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81BBB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iFk419Bq
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7d6a6776719so3599852137.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795620330; x=1796225130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
        b=iFk419BqbfBi/6ObNDUZ2vsXpKfzRGG8soL1vwWsfo3s0278JXjr9iY8LX249svZsi
         r6zCWgQOJswtMqBkGndgaQ0IvnnCAjGp65TR4XQNdfZ5sZPg0BgeutzGHAq8cM2f0LQv
         k79Pa3Mi31cvvRuTHw0jZ0595qcyP7Hk6uoobP2Z5yd2mn/yT4hXNKxz8+kfBrSxNLDf
         QHFAAQ74iOvDW0Lv4NLZloAJyTvOPgRcIasINF2MuVmMIVyHVBduWP93wMPTk4SQT8Wq
         iiMNt8SR9mbCr9h27gdplCbxaAkt1KGPe3OqaB/mp7PDl4S4WFrxi6Ipq3bM+f7oWh6E
         wrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620330; x=1796225130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8twhPZWezouYqnEgR9F+FlFfS4vpJ/v0U2VffsuCrB0=;
        b=gcw7gY8d4nR+OnKNA+QcOydLaE9jr0bsveZiLXm68sljKeCRSfIwR3yxpgBKrsQ/GY
         dzU4LyYVbN8zDok/dfhJ4LIYWmnia1dI1osdp1D+oaFxWJVFbFGIIg7J67PMgrnMQZQO
         dJ5ymVvB4D+XUXhbqZF+0p4W0zMRNuZwL5YXQ1F4XiKbZlGAKts5fdV+R5/7qfJ7JJgU
         sR4C1iRJay/MWJlOiUb9zxlUgd4wJz9s1gZwutXirJ9/oA1GhJqz4aiul9Rr84pzDSwB
         bBO74x9On5MvecoFJbQtOq1Z3IZ3svUE/va7Ed5JnKA+RMZOi0nY9xtKL4M/FzmNsHQf
         Q3YA==
X-Forwarded-Encrypted: i=1; AL+hErFaZ7oXs6q/L3IGG9ISHSwVzXEv5yNykT0I2nmPn5YFrGd3M2lKIVBJ+8ndVAdGQ1BQbMiuYfAghH35@vger.kernel.org
X-Gm-Message-State: APuU4Z/StWjaSpNR/jSyqIy2kyuGAcsxVsbwnL7C5ag3zsuAipvAyDPb
	fLc22zpOyJN0RWCLRHnfYVlJGJaYMrv0P5mgdYM0MYzJDoGWwkp2/ZbHJDiWUD+b7sw=
X-Gm-Gg: AZFdTZfOsRfvtTAhNOXNFAzhkY5sicKAcQkl76D8ETczvghM61g+rn8bXouvURcucTZ
	Q//X7nN/w2iyu2j5kGSbZN76rtw7dKtU3t0jTXdvTfqY29haTsY1EG4CpiK4PIKwmRCCoRBZM35
	57/PmbURysDSOENi+3Re2Pg+q7h3HyvSkSiB2gaqT1EUQiG861xh8Tg/phvzq7ThLdwrk7misXI
	OajZWwDLw+sD7w6NFTjSUJ3Pbcpvaq0c0T/Ffbvqofl6rUGCaAtzr1kZ2RiWhiE61uSLKRHBMKB
	hpFt9snBxNJRXF5rP02CBlR8KmVcB5DtDDkdd/5OjGZ8Li0GNjweL4L4Ii8G7ZW9NfmFoEtCICN
	ijxQcpbZ/VttzUWEkSWDXd1t+PmnJN5qxQwkd2S3YgpUkAhZUDRB9lIuWRyRfwitrV2DaoxfhjG
	0C9iGYGGW3sEL4m7o4ys2lpH/fk7SBnaScpe8ugVNFAWgld+ny+U99GowioeR4G7YU/SkdM4cOY
	+AMK+SPGvuG3fJPb871OOJJVSX2SxKT6ZVIdSgESg9J2P2ouyjo8EleWO0qZFRnYxS5ud/VRE9i
	0XA64Ow70J4eTylzciPMjx+cl6Y=
X-Received: by 2002:a05:6102:3e8d:b0:7c3:fcb:180c with SMTP id ada2fe7eead31-7d739572406mr10710273137.20.1795620330327;
        Wed, 25 Nov 2026 07:25:30 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213479655asm165007476d6.4.2026.11.25.07.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:25:29 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWEsD-00000001rUc-0W0U;
	Wed, 25 Nov 2026 11:25:29 -0400
Date: Wed, 25 Nov 2026 11:25:29 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@linux.dev>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@kernel.org>,
	Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/9] dmaengine: add DMA channel bus and fsl-edma
 per-channel IOMMU support
Message-ID: <20261125152529.GK246011@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <awGWcq_nKWShC81B@fedora>
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
In-Reply-To: <awGWcq_nKWShC81B@fedora>

On Sat, Nov 21, 2026 at 09:02:42PM +0800, Peng Fan wrote:

> Do you think it is reasonable to have chan device(not platform device) do dma
> allocation? 

?

Any struct device that works with the DMA API should be able to do
memory allocation consistent with its DMA parameters. That's an
integral part of having a working DMA API.

If you are asking if a struct device that can't do DMA should be able
to do DMA allocation, then no, obviously it should not be able to do
that.

AFAIK the main issue in most of these cases is the need to get a DMA
capable struct device for a particular SID because of a confluence of
decisions the HW designer has made and the Linux limitation of struct
device baaed DMA.

> I ask because if we allow chan device to do dma allocation, we need
> to provide a dma channel bus for iommu_buses to fix tegre186(TBH, I
> am not familar with this platform, it even has iommu-map for the dma node).

If your question is 'should I be able to have a "board file" that
creates DMA capable struct devices from C code" then I think that is a
pretty "smells bad" solution. Especially if you have to then create
fake busses and add them to iommu discovery.

The DT should create the iommu devices as platform devices.

There was yet another thread about this, so we are at like 5 drivers
now with this kind of need? This was my suggestion on what an API
could look like to solve this general problem:

https://lore.kernel.org/r/20261119143151.GH3115493@ziepe.ca

I recognize it would not be so easy to make, but it would be easier
and safer to use.

Jason
