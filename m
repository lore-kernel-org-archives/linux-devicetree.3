Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A45B296BAF
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296020; cv=none; b=fMiZnqaUDde0DD5m0DyNbOVJgeYX0hQvNMwkpCrg5NqNKohRGdzPmqHbJYkXKHgKrAdEuQu5KwNyYsWJfcA50nTR+DOGr5YdXygP7N4jHj11SH2Bogm1sbuMN3m83PK5nTEqQixEklJJsELZZg1A3yHziOeoMaOcwMxF9aeRysI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296020; c=relaxed/simple;
	bh=pkFpIKsnXuNOL+ArN2UIRyweTbPgoDEDn2DJz7Lvqh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPbsOv72c9hraUCeTbNi31fa1WdliWF842VtdOBlLeu2S+ndefVkc15ErGlYjT8ZoXjNI26Mctb4an+r9Rn/RH1QInWTcI1tFX1ieYm3HOmRYGNXel37MnDQNKLAmiJcDnrhfy6udLhVvKo0a+xcchnfQYt6Y8KK+FWRLgkNPsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpQ2C6fL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpQ2C6fL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so53573875e9.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784296017; x=1784900817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=usUeK0ixpk0N/58fI6VofoCsRjg+TZxevKmDKvB1suE=;
        b=MpQ2C6fLKEfd/kJJN5UGJ1QNWFxp+8Yf8IFBwajAcnAN2f8dHU3JsBOaNmvoLDgtiB
         zTw4lXdGNHbxlvzMFwuZO6zgv6rQeJI1WryoQDCXfqx52vVtABPxZnu2mfjHTlUlJwa4
         xvqnd2pu+W9ZLHvq/5Xcf4HcVImaTmbBEWYLanwp2fbH0jcHKoNNhKV4eeMhmVfgTz3P
         XZb8huuDR5ukTzInDOAjaYnwGBJBDBDJYnh5EylZjlSJK6ktGR+jBY4VO0ICeGktzTeL
         8fD/7+PGq6+H8Pz3OvNkuWHHLCDRrGogkyxtAi858PeCqiRfIcgvwoOgnTQ7wn4Rh9XP
         TWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784296017; x=1784900817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usUeK0ixpk0N/58fI6VofoCsRjg+TZxevKmDKvB1suE=;
        b=k6nuvJzDz8mB2ixhVzsvy2+9d1qQAgkGn7shNqXEvXylgrNhERbe1KpMSSqNl562oa
         9omUOMc2uA1+t25tKlUwO763Ip/3tbFJt54X6z21P4WKacaCTWE2lq3j8koyW8Fx6khH
         tyPEIY1i32T5nB2su4WqqMiYEn2uAUMN9N38D5n7zOM/0Wuc2Mp9KqU6d02ms/CQiE1n
         mCbeuTg0Fa27S5Qe9pNsnKkOHMco6Qkf+26e2m1eHaYfYakgybl87Gg/itCd/duSBDS0
         +P8PsTSMcXVDmUCErTfeQ7hZx1Jlv6IqT/5UGQ+2/Ivc/GoR6PgO6rHigz6CaVEyaJle
         iWag==
X-Forwarded-Encrypted: i=1; AHgh+RpQyG8wYc19gc7WCj5CByuPPNsK7xSf9E/z2Z10ruEEtzwwFGYMpay+0fmIsfp3yADBbptMsyYkIkgf@vger.kernel.org
X-Gm-Message-State: AOJu0YyaR5e57G3/X/F3fjMv8SQ552EYtoqPIxhr5RFKM4McAbpdyNst
	q73qHT/rTb4uzbAjx6z67L89iUdHrBbP50QXtzKfooeuaMS8MROilOdFgSphNg==
X-Gm-Gg: AfdE7cnvM7yKcJ+1N73b1/EmqdwFntnTfdqbT7bbPsEJvsljyr0ADYcCEYv7M2I/7Aa
	FtloCgyszI3G3miiROhFAVUivpjHLJiBbWxrZezKApm7ydH7ZdI5b+LDuVJa2wtz0yzZOVG/aRT
	KfovqX1k/+8BJHjsNgTdz0xZansGrXDVyHiqJIu1kQJ76uIlACKtLDm5ex2LCegGp/6WSaXgyGp
	t5pt9fVWuU/AkxZnJbNWevY+AM8PCmLFJQ+NXgRRnrgpYT1a0LR0MboMmIkKtcAGwLGtkoKHspM
	MdCEbEqdj+3zScfo6qMfffIPjBOkHHcF9XCiuNR7NlUJaiZ3OK/5lYvcnpF6v9jn8c9WeQBK0KA
	HIL9stx6kZfggnJlzzYH5X4+juRxirrCellLvGtOadjavdEtJQV8+WmrEYn/MFyK8rOw4sZCliE
	PYWiW6ySGjmq2TonOSaL+iWkb1c1bhYZ/IMKoR3Nj1IRphOP0GS8xAuPRZ5utehOk4HoeroDIMF
	xT+JMud8LG7iHdGAfh71g==
X-Received: by 2002:a05:600c:6a08:b0:493:bcba:46a4 with SMTP id 5b1f17b1804b1-4954a404528mr19709365e9.20.1784296016986;
        Fri, 17 Jul 2026 06:46:56 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3f07esm51142905e9.6.2026.07.17.06.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:46:56 -0700 (PDT)
Date: Fri, 17 Jul 2026 15:46:54 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org,
	imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 05/15] arm64: dts: freescale: imx8mn-var-som: Add
 support for WM8904 audio codec
Message-ID: <aloyTsfV5ngd431Z@Lord-Beerus.station>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <4487a350b0e4667816c3fe62e9fd6df2696c18cf.1783330236.git.stefano.r@variscite.com>
 <20260706100948.DDA391F000E9@smtp.kernel.org>
 <akvC8UV5N6Tpk0_h@SMW015318>
 <akz_Lr1bRSEE5rhC@Lord-Beerus.station>
 <ak1KYjOUWDy6po5j@SMW015318>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak1KYjOUWDy6po5j@SMW015318>

Hi Frank,

On Tue, Jul 07, 2026 at 01:50:10PM -0500, Frank Li wrote:
> >
> > Thanks for pointing this out.
> >
> > This audio routing is not new for this board. It follows the same WM8904
> > routing that we have been using on our other platforms for quite some
> > time, and we are not aware of any reported issues related to the
> > analogue microphone path.
> >
> > If adding an explicit route to MICBIAS is indeed required by the
> > codec driver, then this would not be specific to this board but would
> > potentially apply to all of our WM8904-based platforms.
> >
> > I'd prefer not to introduce this functional change as part of this DTS
> > alignment series without validating it across all affected platforms.
> > If needed, we can investigate the MICBIAS routing separately and
> > submit a dedicated fix covering all WM8904-based boards.
> 
> Okay, thanks.
> 
> Frank
> 
> >
> > Thanks,
> > Stefano

Hi Frank,

Just for my understanding, is this patch series going to be applied or
are there any further changes you would like me to make?

Thank you,
Best Regards,
Stefano
