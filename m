Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982548;
	b=WHiXpoNYcl4a5iCrzcZPjctbcC/b/A1RTId5kqXl8WLu7F/pW0lmN3maL8Vpfna1wNrk
	 TPw4aLKth2Ruu7KEPf1vZiwR1kBH7vHc1cjpALNgG79aHGriuZqvThmD/aqrzzBbEoxXQ
	 Kn/EU/uyrBa4B/lqeNElkeXwA87P9OKIdw5SQWjerdEuUs5dvamovKHFjiLj6nWOr2KOO
	 dAts74xNk3zkc8Tlxl8i4fKQyRLm6bKu1ZtvnbWcxeRsyE3hLASGPcXN/ZNYUiXun8Zp3
	 1PVBGGenwYoNzty5aFnCjyOx/+X9+ymAmIHfJ+cF2LD+VVUs+MIyaMzL4cwoO2DtBXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6Ft0zvq/VRD49+f5G/aOWiZtloif8t23FAw9GoxQw9k=;
	b=d4USpwv5ZNC1opcPQh7cbpS775nwW1DaDYjKy7nnPaKkWOgTFB6Lkn5ZiRksY0zlQTwD
	 5+xencDMcSw+4SBqRYBXOMyTafvLvpKvSdROC0rW7lmxMDUtcDbPeVYalzopWIsbVxJzy
	 cvL1gdVho3YXlbpCD2syRUiSZLuG+4A+ls/YeqtAE6/FDlpGNCemOr9Ih2HX9T9no1iT/
	 CYPcSf7ww9JAhP32XKe6zvfanhL+jrULMrVSht+HYF6xL4PoJNzudeuGPMXK1DE6vU8wS
	 5TiUWilbRGyvwQcxYlH0VcgYsJtCoMKdrdTwyLQse643to+6+ZQTZgir5swoYcxYlzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKb0aGRf;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A29C606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A29C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKb0aGRf
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9d7791b00so5929915ad.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794982546; x=1795587346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Ft0zvq/VRD49+f5G/aOWiZtloif8t23FAw9GoxQw9k=;
        b=gKb0aGRfHuh6GhFbWDg6d00fzGmnM1dJ4+vr4tjyRQfFQi1mfpNQA7bDlQzAcFXdUP
         mCa3vzGIiP1J9zRtD2aeyTZLTH/KFi3E0gZkMIYPPMG86lBTuOhPN+5YbDPGMSwcN9XK
         xiZb0MgYdb5du9oIQ7abSJLV4wm4RgCrz7jEIsc2zuy7iCum7T3bPOWjqkotDvvQ7SRn
         zv754iJ6hX8NRUrPyDDW97pHizVsv7lo8k8spq1n92astKtrUmlNBLTp8ssuOAdB7YuI
         bZmHPgprrhAdkz9LeMikLPwVQBPlFKNLdLhpiSdibbm+5vC2Ayh/177WmSnivn3UVp3e
         mfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982546; x=1795587346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Ft0zvq/VRD49+f5G/aOWiZtloif8t23FAw9GoxQw9k=;
        b=Nn7SZXobqxQTMX7MciU2Jw45wsF8DHnmKv7jkW0cfEqxzZDfLMhs96GuLJjPTSQmo2
         dtV6a5TdInToH80oO82Yu4YhLNjpTqagSZXwr84AJ12+J8i0QkMW+hUXSEOG18+4H8L/
         0rbmNNz5u0Epy8OUuasvxQIHm4KIU4BcApI4N+Z1vLNr/3J+SmYZP3SMLsjalblPdqTE
         fm00qHFkYq1SgTt+lajJnf+iY5dTCYk8x/Kb9+uPq9JqQkj3aS99Pm0vc/rgDz2t6Cpg
         pG3k4uHIEEcMnjSpWlI3KAPeE/rnMpH5Laaa2LSN7E46btx/HTZgjicg40w4RTNyvURo
         063g==
X-Forwarded-Encrypted: i=1; AL+hErHnS3wGjRmhOaEjAF7Ej3Ks5nlm6Gcm54TyvctekzPzf00fTjcb8/W7dwQ7kZiOguON6iUoGOzRksKB@vger.kernel.org
X-Gm-Message-State: APuU4Z9KXaBK3feqjkojYESD1Rz8Am17CI47THS0Car5VOqU5VWwE0/0
	YBE2GHAp/eIwt4BpAZ1HvxCDj3xUrES/9OfgdquBbiIsm+oEAHAET7nE/q2irvNRLlI=
X-Gm-Gg: AZFdTZcDpizAe5mChRRtwHYo332REqkYNzByHRcqZ3HIcY1IsPClLD5hmk/TsRBwJNW
	vrVpbFj8Rrs1uab+Zoq2/f5cHs2kd/FI2xW9i3gPsqYgJXZPWwnHm+IaGyYQIdOGJpqHx6cZ6iz
	3aCl5Iq+3V+/MQLa619EetSCmEU3vmRP40HijZ0GJ09td7B90g2jw2mUMjngEZN5SN4PtDwVr/C
	UrFsYLO9JicFFAAodvwiuCXMyxM0Vv3EZDhMf6bPekN4QBGrpceOROPxAi/HxdExpLxnZgzUOGD
	+DNDVFaC95Zc0RMSMLo2NUC2biQUUQtXij+D569mbGZoJb+0kmYs0v/d3z2rIWK5q2XLRHlflgx
	IP1017MLqwlo0pgvTCp1griqw7Vl1wuhoLCrZ3aMadCDD+nFqdFBwzaHMCCzvMk+pSzs/qw0VQJ
	T41fV8UI5C69mubpg8zdWOnht61N0HHMnk5kTSRnwbkfZgZypqUJHo9B+kfvDVLcZYbesfYJ4LV
	QOc9CVHk7XJu133FZHObvtO4pdWdcr0YTgcg8rbxUtMJC2+KIB4DVdjf2cqEO/fRkmcKy6SVeA5
	WL5SLgbfIxmqqiBZNbgee8S+64pLhw==
X-Received: by 2002:a17:903:1205:b0:2e5:a355:56e4 with SMTP id d9443c01a7336-2eff72f4375mr13854935ad.11.1794982546300;
        Tue, 17 Nov 2026 22:15:46 -0800 (PST)
Received: from duge-G3-3500 ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e1295sm7508955ad.71.2026.11.17.22.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:15:45 -0800 (PST)
Date: Wed, 18 Nov 2026 14:15:37 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <ypx2d34mlq2a6juh77hpivaxg7eps33xzc45pvuvc77x4a332g@y4vjvirk3qj7>
References: <20261116075423.1519438-1-duge1256@gmail.com>
 <20261116075423.1519438-3-duge1256@gmail.com>
 <avzCmVhf8tl6hi_B@aurel32.net>
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
In-Reply-To: <avzCmVhf8tl6hi_B@aurel32.net>

On Tue, Nov 17, 2026 at 10:09:45PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2026-11-16 15:54, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> > controller. These banks contain temperature calibration parameters and
> > other configuration data.
> > 
> > Keep the root key and SSK registers outside the exposed bank ranges.
> > 
> > FUSE_READY reports completion of a software-triggered reload. Trigger a
> > reload through GEU_CONFIG bit 22 with a 1 us reset pulse, then poll
> > FUSE_READY at a 1 us interval with a 10 ms timeout before taking the
> > snapshot. Fail probe if the reload times out.
> > 
> > Snapshot the shadow registers with aligned 32-bit reads and expose the
> > data in little-endian order at controller-relative offsets. Serve reads
> > from the snapshot and use keepouts for the remaining register ranges.
> > 
> > Enable the AES_WTM clock only while accessing the hardware. Leave its
> > shared reset deasserted on teardown because WTM_RST resets the entire GEU.
> > 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  MAINTAINERS                       |   1 +
> >  drivers/nvmem/Kconfig             |  11 ++
> >  drivers/nvmem/Makefile            |   1 +
> >  drivers/nvmem/spacemit-k3-efuse.c | 199 ++++++++++++++++++++++++++++++
> >  4 files changed, 212 insertions(+)
> >  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c
> 
> I have been looking at the code with more details. Is there any reason 
> to "expose" the whole 1024-byte efuse address space in the nvmem layout 
> (of course with some masking) as opposed to the 16 banks x 32 bytes = 
> 4096 bits only (still with masking)?
> 
> I find strange that user space has to know the address of bank 0 or bank 
> 7 instead of just looking respectively at addresses 0x000 and 0x0e0.
> 
> As the layout exposed to user space also includes status or control 
> registers (although masked), this might makes difficult to support a 
> newer version of the efuse controller which have a similar data layout, 
> but slightly different registers colliding with the bank data.
> 

Hi Aurelien,

I will use a 512-byte NVMEM space, with bank 0 starting at 0x000
and bank 7 at 0x0e0. The other banks will remain covered by keepouts.

I will also update the temperature calibration cell offsets in the
device tree to 0x1c and 0xea. The hardware accesses will stay unchanged.

Best regards,
Jiayu Du

