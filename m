Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB4237C90B
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 16:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776875113; cv=none; b=AqNIYnCSLQmPOc8H0g1SHwqjtkGexUOkBlzaOqXBSo9RgtKJMnm5MqJsx7ObEfv8b+Apmv82pQzfbS6IGZPGxA7c0rTFDGsEB25CE7jlrJbd4cM+OoV9Bsmbkek+OHJRyjxBzKsr3Ihk9ByMQwbDiRFzDi1gP+FOneWtM3/TAKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776875113; c=relaxed/simple;
	bh=aGdnrrjI8lPxcmoVxdZhR1KhhfM/YGirogLtJVSTsZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ex6eZk1afllmA6p/0liCZQk8XRj6yl+4Oa97zX117MH4Z+lsXAqSKxgTQh5NOJOnjRTSv/rAPy1/6YsMTi1Sr2L2zrCDKEfpvgWOTd0QqNcAIC16lEmywrE8IQoa9tHdlKGqLOvrhWquVBZc3Xf9uE7cosZSEcLTOMJmf7Ihbjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bn1u6R6/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=A9Ey9xa7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bn1u6R6/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="A9Ey9xa7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776875111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qSFlJjwss7taNy6z+vQcHuBtEn5xpw5EWTakbtj//YQ=;
	b=bn1u6R6/p/Du6M2hmbeYrjDBdl1SXVNvm1Cyqq6mkZ+3m2blZ24Sl4e2d0DzRu5y894oXq
	p/ofcSxKEvVzehtYUJ8QS1Yi544vFe55C+64bagmF7t7Sh/7vK5bgupuELnesbgStrpObJ
	CtnnFLk8H69qmJtln/qK4Xi5nkJUA/Q=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-TXjuBVBbPy6SaLaJDsiR8A-1; Wed, 22 Apr 2026 12:25:09 -0400
X-MC-Unique: TXjuBVBbPy6SaLaJDsiR8A-1
X-Mimecast-MFC-AGG-ID: TXjuBVBbPy6SaLaJDsiR8A_1776875109
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acaea1ffe7so142527056d6.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776875109; x=1777479909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qSFlJjwss7taNy6z+vQcHuBtEn5xpw5EWTakbtj//YQ=;
        b=A9Ey9xa70A5SKHXoNskNfM3bxNqDiOi+tpPAA/h+RFIKba14rChZieNeI91Prl8oPc
         NiUeGncnz1Es6UFp9Ms3k7uspWudfDDcpPBAuAk//ZSgEUW8JdyMiRSgW1QDApn6eeC0
         34qhGvA7+eMBt12LIdk5aLMVR1y+7Qo2fzKP1Zp7M0fa32EbYm5n3e/0sBi/pTRWieqG
         6h7h3khW9gFxfFXgH9lnwH/PCFW3X4Ul10EdjNH+fFInDZANTDU2tGABz9D/hAp4xQjd
         K8GwRXi5p211hEvWORltaBgZXAGXWHrKB4coJG6zkgKHZLrgMZ31Ak025iAceuDvDnzE
         58Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776875109; x=1777479909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSFlJjwss7taNy6z+vQcHuBtEn5xpw5EWTakbtj//YQ=;
        b=MCKA+rz276CH/iiS/6vdUJ4VS9ubrLYWZ+v5rvjjij9R1yuzQhv2DG9Wqcw2T7lydj
         V++i2lPf5fbDxql12Sxnw/ZEtZxm81mLv69nGxTOmLhuPydKy7iNcNJVL727RU3QgVuc
         iRrbSea1uoWALl1UxB1sKzzxZtHYT+l+JTto5OGSj++aUbMIPTb7YXiRge4K3fayJ6Fd
         sE5Sg3FS9FHmgIDBCq9EuXg0sQ+43ZirUC5Kh24Q7M4xACsYG2LPkjr8/nBA3adhvWK5
         QTk5TC+OnyJ6yLGLqop2mtbYtTMIN/oNQOnO7dfKOOOvX8BoMKx2Y8ENJ3s6sJkV/g4b
         zEFA==
X-Forwarded-Encrypted: i=1; AFNElJ9UfM27eTsO3qbEgQr6OYOMiHcDpNuMokv4VGaMDdXiSM7yc6n8lLOdXEkHrkOjn6n6yPbU0TAVUQPE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8KnbdWQoXA1WGmXZCDxF26xwJ8R96QWezqfuPL15ioxBmONEr
	loxK1XPEtG2395/vnVZV7IX1196MS6KeK2j+ci8Udx+T8lVZuv/rvjZym52w2JPsNHI8D0mAJiK
	VC9+tAbOxsEybJd09BECaJilERR1db2RAHa/QX2fgsVQBIy/aaLounQvNpOSLpPk=
X-Gm-Gg: AeBDiesVNA1b6XveOsV42ICYn4SFpi4e1TAL09BgLTe30/aLBhVpmTpt149zLmMXD+G
	1W0Oahrh9IwAUtftDOdbTQUzIk9re+cZBvQxa9ADaFl9GIipnHCYCbamn+O+kHWCH7wE5R7VpGz
	cEfNlDPFsaxMmcc5zZfL58dtB6INbQx/75XUCdgfbE+qbQ5iNH/cZUzOESt4PvcqYWR+SlwPd7e
	3TS0wy0HopOiIa/8LHu65BlXxKDR/WmiZZj13mtm+i3AEAiuiyX39pQy9ZQYx9ghAD3+T5bXtIJ
	Fn1mZiYzvsDeJFBniw7Mf/Xl4wptE5zsx9vPPh/OT1B4zI/u5Cd0dJKbnpRgXKjT6kOmitnjX90
	eG5BJHTIbWFNxEzXvwOfFfLhQQsoENtg5gwGV5u0Bjw==
X-Received: by 2002:a0c:e007:0:b0:8ac:a893:8b5d with SMTP id 6a1803df08f44-8b027fd1849mr309816186d6.7.1776875108481;
        Wed, 22 Apr 2026 09:25:08 -0700 (PDT)
X-Received: by 2002:a0c:e007:0:b0:8ac:a893:8b5d with SMTP id 6a1803df08f44-8b027fd1849mr309815476d6.7.1776875107978;
        Wed, 22 Apr 2026 09:25:07 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae7d79esm130910876d6.36.2026.04.22.09.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:25:07 -0700 (PDT)
Date: Wed, 22 Apr 2026 09:25:03 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, netdev@vger.kernel.org
Subject: Re: [PATCH v6 3/3] dts: s32g: Add GPR syscon region
Message-ID: <aej2X2Gp-UI3Vmvo@rh-jkangas-kernel>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <0e922537c02d1c47734142090f98eb78e921ed34.1769764941.git.dan.carpenter@linaro.org>
 <aeKn2dvOOO43zdev@jkangas-thinkpadp1gen3.rmtuswa.csb>
 <aeZOcCOgMy2g9wqp@rh-jkangas-kernel>
 <aeZYQp9b5aoV7Ihv@stanley.mountain>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeZYQp9b5aoV7Ihv@stanley.mountain>

On Mon, Apr 20, 2026 at 07:45:54PM +0300, Dan Carpenter wrote:
> On Mon, Apr 20, 2026 at 09:04:00AM -0700, Jared Kangas wrote:
> > Fixing Dan's address based on mailmap update, sorry for the noise.
> > 
> > On Fri, Apr 17, 2026 at 02:36:25PM -0700, Jared Kangas wrote:
> > > Hi Dan,
> > > 
> > > [snip]
> > > 
> > > I gave this a test on an S32G-VNP-RDB3 and didn't see any issues on the
> > > dwmac-s32 side, but this appears to trigger a panic when reading the new
> > > debugfs regmap/*/registers file for the syscon node:
> > > 
> > > [snip]
> 
> Oh, ugh...  I didn't realize that this wasn't merged.  I don't have a
> way to test this any more.  The simplest fix would be to do change the
> 0x3000 to 0x100.  The GPR63 register is at 0xFC.
> 
> 		reg = <0x4007c000 0x100>;
> 
> That's probably the best fix as well.  The later register areas would
> be their own syscons.

Tried that out and it looks good to me. With the write routed through
syscon:

    # xxd -g4 /proc/device-tree/soc@0/syscon@4007c000/reg
    00000000: 4007c000 00000100                    @.......
    # cat /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers
    00: 00000000
    04: 00000002
    08: 000000e7
    0c: 00000001
    10: ffffffff
    14: 1fffffff
    18: 00007fff
    1c: 00000000
    20: 00000000
    ...
    f4: 00000000
    f8: 00000000
    fc: 00000000

No more crashes and 04's value lines up with the S32_PHY_INTF_SEL_RGMII
(0x2) write, so if you're able to post a revision, feel free to add my
T-b:

Tested-by: Jared Kangas <jkangas@redhat.com>

