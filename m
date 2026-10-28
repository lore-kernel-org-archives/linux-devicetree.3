Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793154167;
	b=zIl40ijp3zezuRKfDG8WFe0xxiZfsOISQS/ugmYctvA7iEmhoajMr4UzmsoHQqXFV4jV
	 R3+ATxSPyNfGb1KIGnlH/I/WR0tNkTKKQHdUL+J+nMyFDrUbzWoSuc8DCevwR8dQCuCuo
	 0zctFj0HsWSy/gHvGTCpbvG06PF4RYcqi8vpZcsa37bIs8e46r5nnpA7r5Ay5SXIXNzEM
	 SwEf6dTEVjyuV3Gr9dw/AbRB8O/5AP/62cl+Ij64h40rxr1YGNGGjEwNfDTq+O1ssKGZT
	 JmNZzgNFpwmQiV2bST2KjioR8H9iazYK8Z4DK2L6ibiDd/68WKtgVEF3QxpszKAAUBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SzFXpQkfPDM3m3i/dGse7HfQ/Rq6VRdrmurJpP9q7DQ=;
	b=SG5bv9yH4PlOg35F0YeVbZvy/AJXoEw5EobDmLlbZIfBCjzPL+3sSeEdPjdfqCYXS7bT
	 VTbEvb+15RRVROmyB2P+rZrAJyWtAx7RJVJEEMcxxsJyD8gcJpwUfUMKWh+HxkNn7l7vT
	 Z9LFU6TwuRC3fADjhnG7IFCJ3raAwFlnKqieXL7pvA4/vBoa/7R5pRjZz58i0jipWn2L7
	 7PpB0twrwuon48aFi5HKrsDRln7KSJr/A/6NTDtsTnUwWcchJHhEDO1N/aqbocixxqHJn
	 LgG5WVM0Pd+1XYJoQnq3Oh7bA0S9UV/eit37Sw13WsAdqVjQ6O+p0uvLzNzh44yBF+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZ3vHGWW;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1779606A321
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 02:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1779606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZ3vHGWW
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ec3561ad43so335341e0c.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 19:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793154166; x=1793758966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzFXpQkfPDM3m3i/dGse7HfQ/Rq6VRdrmurJpP9q7DQ=;
        b=fZ3vHGWW2qbUnPcwE08qOOaSAjEdJU6q+I9tjUcuLD7ttFUvtQOjRaxrDin1CC6NsR
         3XMRkGjmRs7lWw1maeVAIxhJ6N49/dCtKTVHQANQoQmoTydHbufX2LGDEaT6wr5XRrzF
         BJSG9WwZLBipcqONXmtL/LVgW3X3haaiFTqmp//VtSnMz4ZZn5pY2d2B0NtsLyW3gZrX
         0XTy6vusOk9WqV4OHf78oIRrDzeXAPRpRpifjjnJ2r5J/XD0U7akdtZjAVSB8T7jpnVb
         fYaz4x8xKPnTC8C5WLWxdUbXW62pUSRDKBNssPhPV/3hlNm7EhrXW2wNOStLP/xI1Sn+
         5Vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793154166; x=1793758966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzFXpQkfPDM3m3i/dGse7HfQ/Rq6VRdrmurJpP9q7DQ=;
        b=Y17zY0GxE+7pb6g+Yy0qUgYrkig3yOGr8AhbY3w0DN70YKklHzShnt+rXs9Zf/5mL5
         ZPPxTvXzv6xge7cyzKlKau7nBdPGS47dCEEIkHq93h1U8bzowOIRyg0ww9v1m4MkpMlV
         4DHZVOmoGVPtKhkkjhUN7SlSbWG4XB4415M2RHxCGv87szLvXhGFbUMIOBG31+jjHQy2
         oF+g4zhw8zxhqfDeo6ZZCJ0QXVKrjC9JrDHLLnujAG8bHSHj8LI6qul8CVP+zVnci+FZ
         UV8fXqVT9+a35t8BsTBAjSrLxRd60aVsmkz6ZwkBdkp81oeZKMS6s0GoUSRhXAUFUH/X
         Wd0w==
X-Forwarded-Encrypted: i=1; AKwUvBzafHuXspIuNzQcPZltaLEO8BquNmUR+0tACzqSan3/nD8GKVsioAHDHVco04SNTuOZvqP2WcL73l8u@vger.kernel.org
X-Gm-Message-State: AFq9FYIujAwPrrhcQdBhIlr1BAQSRtg8sZdSqAZoR212CARPg8WQMgeY
	zBrKGnmEdG+3N4TVphTiVTidanXt9wuZO1cKc81Rs4OquhSZ4DKXExw1
X-Gm-Gg: AYBFou0h9ASVRXZdiQMOPqUNbBERcSDYdGKE02q+HhDmO2OAFR1msRWEZCB99W391E1
	xY2MyrdK2VyMh90HZ6/vVX0Rqqiydte8fWVltl3DtmNM7B9d59yHKsBDvfnxaNGGjdRdgKM2JIr
	hAMa6ivy4h2B2Pzj5ct5qYxtB4e/Q+91xYCwMES1aaUi1cCMRUdvBf3iH9nHcRNw7FKmUG/1flM
	aFMBLUnnupdF8cFw863YOIF0neeizQIQua19g1v76kW96uMpMbQjsWsx4U1JYkYzoRsOKcZh/Qx
	6dai+RGcnxUZbBfxx7qVN5oQfdO6m3EzVBp9IhquyIpHvsv5iG9qi0W7gF24Gx5PBa1Y34Vk3Za
	s16U6cXnZvYT7qpLsSlhfneIUd6q7glV0SUvkVay4MySxJKkLXQVE5O+wukRZBblXfP/8o6/XWq
	anWdvvQWSu7LjxR7zc825YrlF/5VrsN0iXsHNk3QhCcvQFNRr/0NR5C99IubVWHc7U7sXSg2tFQ
	Z2HG1uiZAC5+fTV1AcS4AvML29ec6Nn5TMInysyJrLA0L7ScQR/5eULsUdyHhbX75ZqlrYnyTaL
	ZuI=
X-Received: by 2002:a05:6122:e146:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5ec4cbd805bmr534752e0c.13.1793154165588;
        Tue, 27 Oct 2026 19:22:45 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:4df:52dc:4559:394e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f8dfcf1sm415927e0c.3.2026.10.27.19.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:22:44 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] iio: adc: ti-ads1298: prepare for more chip families
Date: Tue, 27 Oct 2026 23:22:36 -0300
Message-ID: <20261028022236.30455-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025232608.06a5762c@jic23-hlaptop>
References: <20261024231335.280955-1-stephanbrrs8@gmail.com> <20261024231335.280955-5-stephanbrrs8@gmail.com> <20261025232608.06a5762c@jic23-hlaptop>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 25 Oct 2026 23:26:08 +0000, Jonathan Cameron wrote:
> > +/* What differs between the chip families the driver supports */
>
> This is very standard naming and purpose. I'd drop the comment.

Will drop it, and the other generic ones. dr and hr will be spelled
out, and vref_mv becomes internal_vref_mV.

> > +	/* CONFIG3 has the VREF_4V bit, which selects a 4 V internal reference */
> > +	bool has_vref_4v;
>
> I'm lost here. If it's about the bit, then name it after the bit.
> I suspect it's about internal reference that can be disabled or not?
> In that case can you name it for that functionality instead?
>
> From a quick look below, seems it is about what of two modes can be
> used?  If so how does that fit with just one vref_mv above?

It is about the internal reference. On the ADS129x it is 2.4 V, or 4 V
when CONFIG3 VREF_4V is set, which the driver does when AVDD is 4.4 V or
more. On the ADS1299 it is a fixed 4.5 V, and that bit is reserved. So
vref_mv was the default internal reference, and has_vref_4v said that
the 4 V option exists.

For v3: chip info has internal_vref_mV (2400 and 4500) and a bool named
for the 4 V option; init chooses the reference once and keeps it, so
read_raw no longer reads CONFIG3. Andy asked for the same.

> > +	/* Reserved bits of CONFIG3 that must be written as 1 */
>
> This one is interesting. Normally we deal with these by just using
> RMW cycles on such a register.   Can we do that here?

Yes. CONFIG3 resets to 40h on the ADS129x and 60h on the ADS1299, with
the reserved bits set, and the regmap has no defaults, so
regmap_update_bits() reads them from the chip. config3_reserved goes.

> Please use FIELD_GET() and fix the family masks to be values in the field
> rather than the shifted version.  You might want to do that
> as a separate precursor patch.  Looks like there may be other similar
> changes in driver around fields vs value defines.

Will do

Thanks,
Stephan
