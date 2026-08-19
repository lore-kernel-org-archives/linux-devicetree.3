Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A54744C513
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787140623; cv=none; b=p2BdoVPOeaSl+MbcQ7moOLMd3AeYwS7d8Pd+dqK9qSOf6+57nLE6epMqa2qkiR+ZzHjFmi+GPYJF1DY6+xY7ci5ljgqsYfqe4+3PeXQ3rDfoh1FY5lREjnuK4LoAKCJwVQ0u9wlxp93+fkD743yYNz3kQGvZ0Jc09Iu7xJB+cOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787140623; c=relaxed/simple;
	bh=DOIClZcHf+ibfx2/byeHUht3sy5hNumJQv+OQtNyHSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4qUym30qcKyDVH7+uRiJT7yDdw+aZRy7I+JyivYucKqAhFs4vdO6Ajk7EF0udkCmo1T3g5TSLSpKDfO0OoYDckS6O66LMbb+NcSVwlHottJtOPSPeSRESVZ9ig9Ej3wbdaBj6yaCehmhxMl8WgqqFyQLjqRAlsgaFGds5Tq2tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=US7w6+cc; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="US7w6+cc"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66c711b7f2aso1613482d50.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787140620; x=1787745420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iRrXiWbp5BCMXI1+0yfdqp8zjwVidH0MdyBqKFKUh/E=;
        b=US7w6+ccpn9zUZxXTO97+vxVGQUVfpLX9xHsBiHW4svpGZ13uMpFPH7KacYcSMEGiz
         ZMM3flAGXkapC5mzj60NBJpNqWtuhN84vbfcFeccpy9Gx1Q5pcToHxGbpHI7iEHLhBBw
         Ij+Trp2waHzNkBvrN9p9msJkIjWWEHhOJwCw2akCPSiJ9njnFPHsTX8g667hDtW4xNuR
         bWQ8t3VkXzFGsyQZiIRgFTlEtRPUGDpku3p4vJTO1H3QDEURi1LZK13AQRkz6o7v7fmy
         +v3lPiTVI+Te5NEwdPNGc+KDUMVo+xZOoR3SuVYHEbgwJQg4IIyLQqg7bbAvx/ZES44E
         THaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787140620; x=1787745420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRrXiWbp5BCMXI1+0yfdqp8zjwVidH0MdyBqKFKUh/E=;
        b=IHK6TV+/54l/YXjTbQi6fQvWj5H+wq9c8HDFsq7xeHqPAp2PeIo1+4PWIAus+c862p
         CeP8uF7pZmMNfn+sE+GfNPrpvXoptVOHGN5VKfOpl2wRLDY+0B2r22fDjfes/SBv2vhC
         ZWYFBDZaI62TAHrhdLMsI+qgMRevJZb2yQw5nq01wPaC4genryle7a49FcrXInLdif0j
         M4afVy2Bz09gUlJXx7r+ESWdGqXm3EyH7vNjS20C0+Iw0amzTypPNbN2lDhy+ai9qjhH
         WqeOhql8wvodD1YnERuMYJ88S/Kb2YSpH88YZ3VqxhVxTxCZ1wJvm4DucJ9kAfEA1VJc
         pfvA==
X-Forwarded-Encrypted: i=1; AHgh+RrYZZ6tgsrH+Ib2c/MxRJgMIoR2F+iffAzUV1ZSs3jOtplh7AQ4j0ZbAhufRDyblM59Y94LFEpaMrh2@vger.kernel.org
X-Gm-Message-State: AFuF++n/jVJaJWnYAGGD0xKoimAHtKjfc5XERis6uq7YCRdgZuRdNWwp
	lFaxi7rSmMaM3VV4NqAkONWhmQixDf9YiRCkD818fhg61j6tW2SZ2dQx
X-Gm-Gg: AR+sD11nOLvrr4dj7E7bTPVHOYlyIVElw388vrAY0avVxtTTmG9+0mjgMUNZJXn8fbu
	AkIEvzwaIBW5Dz811lDzg/71EWXBUze2J9soDE6zEI1kDOXdFhTu0LhrziETadnrQL/E93EBEwr
	5MyAAP0JDcn8x3U536sBnUSrLm2u87l4ydK2Y1aC+HnjIqc+hBR6j0Jdf8QxlfymrG3aBtQsM99
	aXNkciAT2Ra65AHu4jxCwus2EJbZYrvOZsY0BgKiNvmXeTSGeQXA9dghHbmXDiUSzLa+aSWEWH8
	Q11qtMFePDBsKFJQmre1ym0I2zwfhyAIL0qMWdOYeWFJKTj9TXlm9YZIjLxRY7Hr7tMxZ07giHN
	a1/EEFogqE2sOWPU7ZnU7/1NYUENQKh1zJnX+WtTPmtH27Ul3KrqgQ9tC6EIE/LEHsmAHpYb6Tr
	0lxflAa7PHLjU3g2qvtbCds7+e9OLP2sCVqAdKo/46wLARGDCjxX0enCxwCx3vc+mQHTs=
X-Received: by 2002:a05:690e:4807:b0:66c:82b5:7d59 with SMTP id 956f58d0204a3-66ccb5cf30amr1129726d50.12.1787140620402;
        Wed, 19 Aug 2026 04:57:00 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66ccb1a03c5sm817419d50.20.2026.08.19.04.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:56:59 -0700 (PDT)
Date: Wed, 19 Aug 2026 08:56:53 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <gsihg6tzkrq6gcygquzbjtiqntvoxp67lo6mqntnmbyvyw7s3y@suv4t26pl5eh>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
 <juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf>
 <aoSqJ7pHEgJ_RZmr@SMW015318>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoSqJ7pHEgJ_RZmr@SMW015318>

On Tue, Aug 18, 2026 at 01:53:27PM -0500, Frank Li wrote:
> On Tue, Aug 18, 2026 at 03:08:33PM -0300, Leonardo Costa wrote:
> > It seems that the drivers are being deferred at boot start by the
> > device_links_check_suppliers() function. It runs through the drivers before
> > they're initialized and defers them if their suppliers are not available. The
> > GPIO and PWM drivers are able to follow the gpio-map and pwm-map properties
> > (through the of_parse_phandle_with_args_map() function), but from what I see,
> > device_links_check_suppliers() has no such mechanism. It follows the phandle to
> > the nexus connector node only, and since there's no compatible driver for it,
> > the function defers the consumer drivers used in the overlay.
> >
> > I think this is what is happening mainly because setting the
> > fw_devlink=permissive kernel parameter (which sets the DL_FLAG_SYNC_STATE_ONLY
> > flag) solved the issue, though I could be misunderstanding something.
> >
> > 	int device_links_check_suppliers(struct device *dev)
> > 	{
> > 		...
> > 		list_for_each_entry(link, &dev->links.suppliers, c_node) {
> > 			...
> >
> > 			if (link->status != DL_STATE_AVAILABLE &&
> > 			    !device_link_test(link, DL_FLAG_SYNC_STATE_ONLY)) {
> >
> > 				...
> > 				device_links_missing_supplier(dev);
> > 				ret = dev_err_probe(dev, -EPROBE_DEFER,
> > 						    "supplier %s not ready\n", dev_name(link->supplier));
> > 				break;
> > 			}
> > 			WRITE_ONCE(link->status, DL_STATE_CONSUMER_PROBE);
> > 		}
> > 		...
> > 	}
> >
> > Has this behavior been observed before? Do you know of any work being done that
> > addresses this?
> 
> Does a dummy container driver (for debug) to proof your analyer?  Let
> me to find time to debug it.
> 
> Frank

I made a dummy driver matching that compatible string, and yes, it did
solve the issue.

Leonardo
