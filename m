Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D45493D5C
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405377; cv=none; b=j51ulb65+wwY4H7qM0KMW/clNXQpdVTHYSweZWo0CvnmbSlTCPzr3U5ylQ7DcfL0oouQTrYFJLNJD8YziOq+RCutGZgUXoDxs8XLMfpOJK5c8x1u56l0ScZp9ZRoIK7I6ldMPk7Px+YLUaqft1/dA7deGiwIjuuRCRyVCiCY0Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405377; c=relaxed/simple;
	bh=kUUpPsTxPIwjQ86JF12+BW4PvPq7GSCiTMS+HGO3pjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyH96rCyo6q5poCodlgRG9QS1qcT3O7C0Iv6LDgb/o7ZiEkV7sLM/1EPpi9TIAn1YJBb5XsBpkIoCmYWHn8MDXv1oLLGog3INU6nUpqyUN/E0sRq4NUPvsitDliyaT2bZV0csmGoU6m5wB9+EhQW3WCTYNrEvh/BUiCu8ePgrww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rx/2N+Kh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rx/2N+Kh"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1565556f8f.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405374; x=1793010174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DcQm1UppAernfyJDNeazwp3tPSiXo5FxZGSLgNLJYCQ=;
        b=Rx/2N+Khk5VuaCJn5nr35VcNWoeVIYme0SiITGhegjp/vCFvyIeIMZ9UL7EZM9puem
         JChFwxkq9V6zjZ/lZZS7aCkkC+bco0MwbCknAS5uwb7geLd9jKe9Xc6TG3B2+D6RCMb7
         /sMu5vqpEX0lWssTRXf31x2O/2SEPLyYgcgQtn44cLomOk5Tr6SfNDLL5wq1qXVEyp1f
         ro2aQhg+kyX5fs7T5SItQOVmF5mT4lqetpLgy9Y0S/82qouOhlCfVW9KpvHWcU7YeKBE
         vJNQTIQhaDnAaCyJUfKkYcjn4dIqQcpKwv/mrcr5TLKqfuOw8lZNh/8PK0zbXlWnsWh/
         ToTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405374; x=1793010174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcQm1UppAernfyJDNeazwp3tPSiXo5FxZGSLgNLJYCQ=;
        b=0ny8sQGAlmGVWLqalqxWWvYFPEWmEuRQ7VQopxsWiJa8GPyPSp+bGPZcfUeQZv1ZMp
         CBUj3gSo+LAKrZI/u7sgtlw017wU9r1vDan+X3MgV73wwPs8DLkbXT4q4QgUaY9jOtqv
         EFPhb25BFG3elnB1AZARBMcqAiUyECkps8TUJcERifV54IDvw8g/fPShi8GC9hL8086M
         QD/rsJ/j237sHz8kiK2PrGwrYBx+TiAN3gd/3GGzPmyXakRD8X07ebtF1gNHGMBm+BWl
         ZXoLZyz5DjWZDo5XpmVVISBsLgZt+topfrC3KamqeAMxykzdA2FGh2sBFZbwcMUSeaCY
         dydQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZM5iNOJunwkEHOPacK8ihYsNyAaqigdU7fMwbZ4rMGsn8SO3wkHtf+RUH0ZHyfnKayeNYo8Le/Q03@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2ICpfFEEAjTMZy+5TPUn3z2tc9W3TcjpsB/Mv5u6t2d0+jA1W
	uLe9m7AM3pgxhR2xMic8il0gtZyMAWNMsHdWdzPLNTin5g6bZeJltBJY
X-Gm-Gg: AYBFou2iyrzlfsMdO1XJ2DHbfq7n5ucof4myQ3t662xkNbr+rJhnxveLV+4qjEt0fL1
	TAX81I+zGIuPNCcHYz09Vm8O6vCNSvXICVMloTmlaGDdkj2tC4AjsC11m29z2eOLgmIVwnXMlIL
	wqTbMV5GMvQK1Qum6lxtAf7/6QiEbQr/qwwdWO43e04+cJV3ntVrNQqSKQzSsIK79H/jv2zXm30
	qA65tDiuQCOke5Bu7GqsEtG4j0JGOg4Iu/cCnqokBS0eqtM9A6Y5BSDrR6k3NfDaaT3wX+7BL6d
	7mUBh8TRY5oODKOpGQQfyR8rEV3aUbSwHwJJqkBVIhWAxaS8kHKLfuXKkAc4b3py+sQF9NFd57K
	yUbAszbLVHV+wDSmILZvi1yvylc+1NqvZw7eZ0pg01OfjIr99733RYL9xu9GwIkNnk/WfJxNq7U
	XO/B6PoXGYa6+XONxshs4SOsR6UnFrRvWTRV/1Fj5LiBgpHFR/2JMhNXv5/aORLA7nkZ0oknqhF
	ByQVg7oIc07QmBWXTVByRgANJjvL2AOaHFHBYDDFz4PqTWT17dTwFgWOf0EQV2ITlLo2RxCemLZ
	zGGAOw9AueH3RdW9ereV2FKQwWRGio+Irxzt2cQ=
X-Received: by 2002:a05:6000:2889:b0:48d:f14a:9179 with SMTP id ffacd0b85a97d-48e07fadef3mr14864487f8f.48.1792405373733;
        Mon, 19 Oct 2026 03:22:53 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a64sm23771242f8f.6.2026.10.19.03.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:22:52 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:22:50 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mm-var-dart-sonata: Add OV5640
 camera support
Message-ID: <atXver4B2Acc3z0w@Lord-Beerus.station>
References: <20261015162301.63838-1-stefano.r@variscite.com>
 <atEci_KwxUdvAekv@SMW015318>
 <atJY6DzjmAeq7U8q@Lord-Beerus.station>
 <atKHI1B0hL6q-CmY@SMW015318>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atKHI1B0hL6q-CmY@SMW015318>

On Fri, Oct 16, 2026 at 03:20:51PM -0500, Frank Li wrote:
> On Fri, Oct 16, 2026 at 07:03:36PM +0200, Stefano Radaelli wrote:
> > On Thu, Oct 15, 2026 at 01:33:47PM -0500, Frank Li wrote:
> > > On Thu, Oct 15, 2026 at 06:23:01PM +0200, Stefano Radaelli wrote:
> > > > From: Stefano Radaelli <stefano.r@variscite.com>
> > > >
> > > > Add support for the OV5640 camera connected to the Sonata carrier
> > > > board's first MIPI CSI port.
> > >
> > > Does this board only support ov5640 camera? Suppose ov5640 module also use
> > > for other boards.
> > >
> > > Can you refer https://lore.kernel.org/imx/20261011-expulsion-frivolous-690de090cf9d@spud/
> > > to define connectors?
> > >
> > > Frank
> > >
> >
> > Hi Frank,
> >
> > Thanks for your feedback! I looked at the Toradex approach you linked.
> >
> > In our case, the same connector can also accommodate Basler cameras and
> > potentially other camera modules in the future, while some of our other
> > carrier boards use different connectors.
> >
> > Given these differences, I would prefer to keep the classic approach proposed
> > in this patch, describing the camera directly in the carrier board DTS.
> > Do you think we should still use connector bindings in our case?
> > If so, how would you suggest handling these differences?
> 
> Need understand whole board familar, basic Two problem:
> 
>  	Does carrier board support difference kinds camera?
> 
> 	Does carrier board or camera module reused for other boards?
> 
> Frank
> 

Hi Frank,

Yes to both:

- The carrier board supports different cameras: we currently support
  OV5640 and Basler modules, and support for another camera is planned.
- The OV5640 module can be used on multiple carrier boards that share
  the same camera connector.
  Other carrier boards in our family use a different connector.

Given these combinations, would you consider reasonable keeping the
camera described directly in the carrier board DTS as proposed in this patch?
This would avoid adding complexity across the different configurations.

If you still recommend connector bindings, how would you suggest
structuring them to handle these differences?

Thank you so much for your help,
Best Regards,
Stefano
