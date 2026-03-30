Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAF03A168A
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 21:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774905248; cv=none; b=q7cOhirB2rRUzJ0QqLp0x7tS+/MYnQP6iV1Xjg7jpE0M5SPHoA7e9wBQ4sCnQFJnLR1A0ZxqSfsEtp2Gg/o2roGME1/z5zNne4dA0+zfMQB8xSSAoxQufXqTNp8IX0U/FsFTsVWxSZ4+aNgolNgdR/j6Db4HuVN7HhPfBU4PoVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774905248; c=relaxed/simple;
	bh=5pooe8akLgHWo88qYtDDC/7ED3+Zasl35vKrSAKLMUw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BaN/JGv/xLyd+j9akpfxPsTodEpaL+GnYWUS7z2jOI2yqe2cVg9V8LnntBIgnLoMMuNKaF1A9HWN28YRDcFiCemTO5Gki7UNPDl5N1+MwHAJqcQtKiJcffTuYWef/LLcN1UUyd/KCNNZCL+fJFVaCbqUeZVoW+EgkNSrSPk+AM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=e8PkOwLD; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e8PkOwLD"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2adbfab4501so24501235ad.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774905245; x=1775510045; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=itki3S53hN5ghJ+TbLPQdNLhKu/I8y2gwGAHgQqiXFA=;
        b=e8PkOwLDSZGU6YRo5IrvgqWM9KONmv5IER/GNo22e4IQE2ZHZ6yd8LkwVoXCeUhfSE
         2EwrN+9lockx5OQpt17JzdXscXDSEzaZy0pDDGWmV5NrMMP5Y4hRTLAP4Pz/zHCV/Hj0
         4uFPOfrxU3pbUyAmaQmodIwv7sPJ8dhvtO/iRP3yltYMtBX21Ce/bnJdPvJm2LG0JpkC
         OqtUKKpk+xmYIK/CcXqaJEPmvjuuty/TN/cXNrRX6U/xKLT0MjHf5LrxzeDAImrpi893
         HLYWDsUZ+ImOPwt8d5j0LJnjEKS1nTBQCh8KR+C+Xtq26hrROzuYmME+wgvkanxT44qj
         XUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905245; x=1775510045;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itki3S53hN5ghJ+TbLPQdNLhKu/I8y2gwGAHgQqiXFA=;
        b=IqPS32nifvfmSKZvTuTuJZy/rfbZFeAykJBt/M2NfqqAp0N8rNYv0/DVx+uqmxyuHk
         oH1f/6SC48r6VApKZuf+8EaPi7C6Qfr98UfNsN+x4JCbMW994Jww4dHG3COjXUz+tqxA
         w/876fgCdIM+gtJSbo71xuCzo7ymo8SeIY5pmVQIt51GXrqidnfktU8CBD6EwMaNENfO
         KE898wW8cZIYUVP2xsws8D+S70EbvuKnCwZLRdAhUxLmUtD+WBDOt1xvwvPqrUnRmhal
         3ZAFuM9nQKDmvHxRbdIQ/fSCccuZ1/5DkFmmn68xoZTqQpiEYZFjfTxFl/cfi48tcKB3
         wNrg==
X-Forwarded-Encrypted: i=1; AJvYcCWi9BxZty+HRyH8S5y+TTr0H1JcuofdVwL2iARCUXmsPbrFXJCpHCy8t+P7Qe3JHdcgvmQJP+lqU0Ve@vger.kernel.org
X-Gm-Message-State: AOJu0YwtgQ40jng8iAfRecstiXjA2hJFFKsaspQCrf8YFapD7E5beXPf
	jsO+VuIrCYdjHw4PcHHl2fl4SA986wZ7gUaVx50rDajbiGvcp/flXsvJyFBchF5Uj+U=
X-Gm-Gg: ATEYQzxz1pEcFCbcSKOxtNnQIRJaTJxNKatk1VDVX+8SYkbafQkY69bi1DqU7kboreE
	FXCYsJgzXp7GUcRQAsp+lNp0vLbnxxVPRNQPO2XczRK0VjjNBg8Rrrh2DbtGqXWWisegaRf71Aa
	c6X1bD/zGnTGOntIR+2Z1bPcu/RmUYCM+SxCzznKMs0jJfG+Hf7hmq5DSJl3X3YyoEe+3AVh+o5
	ONZLd4YzCYRAacqW4wuIxsQbIT+oLjYPwu8pjBkY/oZdHRIh+FwmHZtz6KA9SpNVYHw4rIMw862
	KWJmGHPruyOcgnHQS3RjyJipZLDz74BWoMzbRptPn1McmMPXlE32XrKeiGdKioHfjap395+8zHv
	ogF0iBSNJEiKmoVAm1G8SpT0tx2TXko2VFCRLj/ytnmYLWI/wWEVBXXAGEDrSr9KJqygjeNx64G
	tnKag9LaeieFOijVwJE4c=
X-Received: by 2002:a17:902:d541:b0:2ae:c981:2a29 with SMTP id d9443c01a7336-2b0cdbf7bddmr141880015ad.2.1774905245314;
        Mon, 30 Mar 2026 14:14:05 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242676e13sm93479195ad.28.2026.03.30.14.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:14:04 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Bajjuri Praneeth <praneeth@ti.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Louis
 Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: ti: Enable overlays for am335x
 BeagleBoard devicetrees
In-Reply-To: <20260324103934.7d259008@kmaincent-XPS-13-7390>
References: <20260216-feature_bbge-v2-1-22805cfdbf62@bootlin.com>
 <177275924369.1445909.1029086854461649971.b4-ty@baylibre.com>
 <20260324103934.7d259008@kmaincent-XPS-13-7390>
Date: Mon, 30 Mar 2026 14:14:04 -0700
Message-ID: <7h341hvx43.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Kory Maincent <kory.maincent@bootlin.com> writes:

> Hello Kevin,
>
> On Thu, 05 Mar 2026 17:07:23 -0800
> Kevin Hilman <khilman@baylibre.com> wrote:
>
>> On Mon, 16 Feb 2026 17:55:52 +0100, Kory Maincent (TI) wrote:
>> > Allow overlays to be applied to am335x BeagleBoard boards. This adds
>> > around ~40% to the total size of the DTB files on average.
>> > 
>> >   
>> 
>> Applied, thanks!
>> 
>> [1/3] ARM: dts: ti: Enable overlays for am335x BeagleBoard devicetrees
>>       commit: 18161bb01ede109fed41c66efa2624a4c27377f7
>> 
>> Best regards,
>
> Thanks for merging it.
> I see that you have merged patch 1 and 2 in your for-next branch.
> Is there a reason to not merge the patch 3? Are you waiting for a dts
> maintainer ack?
>
> Maybe I can resend only the 3rd patch to ping the dts maintainers.

Not necessary.  I'm not sure how/why I missed patch 3.  It's now queued
in my tree.

Thanks for letting me know,

Kevin
