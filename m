Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B6535F163;
	Wed,  8 Apr 2026 14:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775659286; cv=none; b=QTph/yyB/Di/pGBzKrabgdgBsJkDj4Fq1H2em6/v4JrN1w14lDZPNWqr8+pVLq1RDncxWBWCfWyu1RmelSqhSg7KTyOodxt1wy4SYNpUab4Ip4iX4gFvPh93LYaJWRtVnOtAe+bcT0dypVRqlURUSoW/bkewrxSh5XmTS9wgwJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775659286; c=relaxed/simple;
	bh=3T+JHyGfVwewUEtO+BmwWAF3/3Pl1UDeVVWWEw1pLOU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjKSbfcKe+z9Xhqnu9i51mEfzsOFNWCtDYeWrjnmh0bEaFgM4zwzjYIGM7zuTqUlkkB0EzlKpLQElA6baNaCE3Qx70zvOClAc0ZQheAvwIAm2PZWL3gp1RR3uu3B+ZFNZ44t497xPn6sW5WI1nY+ayWlSnVPP2DirQMTK/jTKTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=YZytoFqZ; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="YZytoFqZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1775659284; x=1807195284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3T+JHyGfVwewUEtO+BmwWAF3/3Pl1UDeVVWWEw1pLOU=;
  b=YZytoFqZgq3kEbpOaIeVwpOE7R0J490ven+GIpCxCOM5FUECAeFJSb6n
   TAhPCo7frPz5JDN4iV7FJjXUGLrytnrUp/04lYwRFdQ1ia/3Gqi5sFHqh
   CyYwfs4mLvXU0FPX36zryklRdibKiZqhSGTkHO7oDUaBOqC2TJnpw94mM
   a5pwUepEAroVLLV993WaJM3ZtP/3j10AQkbeO9MYXu4Ei+t1eqSTzq1OI
   WQo4l2/bvIMShqeAlTwN2AphSBfVtZ/XtycCTofV5TH75LnHO0QWwZ8rl
   k8XMDTmDU73/YfefW0EztvldH/CcL52/1SqLfHlgiXblUevNsIQcH51/p
   w==;
X-CSE-ConnectionGUID: tvDUhzONQY++97klloXO2Q==
X-CSE-MsgGUID: YucbOrxUQxmKRdRniYGJAA==
X-IronPort-AV: E=Sophos;i="6.23,167,1770620400"; 
   d="scan'208";a="223088503"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 07:41:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 8 Apr 2026 07:40:53 -0700
Received: from bby-cbu-swbuild03.eng.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58 via Frontend Transport; Wed, 8 Apr 2026 07:40:52 -0700
Date: Wed, 8 Apr 2026 07:40:51 -0700
From: Charles Perry <charles.perry@microchip.com>
To: Nick Hu <nick.hu@sifive.com>
CC: Charles Perry <charles.perry@microchip.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
Message-ID: <adZo84i4jfoWZnb2@bby-cbu-swbuild03.eng.microchip.com>
References: <20250321083507.25298-1-nick.hu@sifive.com>
 <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>
 <CAKddAkCZXmw95XN6ypd_i=JqkMUooD=riTisHUMrY8Kqkebbqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKddAkCZXmw95XN6ypd_i=JqkMUooD=riTisHUMrY8Kqkebbqw@mail.gmail.com>

On Wed, Apr 08, 2026 at 02:15:19PM +0800, Nick Hu wrote:
> On Fri, Mar 27, 2026 at 4:56 AM Charles Perry
> <charles.perry@microchip.com> wrote:
> >
> > On Fri, Mar 21, 2025 at 04:35:06PM +0800, Nick Hu wrote:
> > > Add compatible string and property for the SiFive CLINT v2. The SiFive
> > > CLINT v2 is incompatible with the SiFive CLINT v0 due to differences
> > > in their control methods.
> >
> > Hello Nick,
> >
> > Can you help me understand what is this different control method? I've
> > found that both OpenSBI [1] and U-Boot [2] use the same match data in their
> > clint driver which would indicate that they are compatible.
> >
> Sorry for the late reply.

Hello Nick, no worries.

> Unlike v0, v2 requires a write to the mtime register to kick the timer.

A kick once at the beginning or every time a machine timer interrupt fires?

> 
> > Also, do you know if there's an easy way to tell if a sifive clint is a v0
> > or v2?
> >
> sifive,clint2 introduces additional MMIO registers

Is that the high resolution timers (HRT) mentionned in the description?

And last question, would you happen to know if sifive made a clint v1 that
does NOT require the mtime kick but does have the HRT?

I'm trying to figure out what should be the compatible for PIC64-HPSC.
Some code from a repository called "FSFM" used "sifive,clint1" for the
compatible. I'm wondering if I should add the clint v1 to this file.

Thanks,
Charles

