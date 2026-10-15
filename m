Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53F449F129
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054791; cv=none; b=gSgb9KUTd4Uk95y7ew1a8aMxebw5azIM+Bu3uYi4OOBBCT5gavwWPBTEox0qtJTveN8bASpUow8bUuUKnvyBT00LLYoaRu+fYaAPz5kSHdnFaWSCh7bUThA9xJAtH7AW0aJSzeneND4er5UuMS7IG/1FA9v8L6ZcrsoDKRDEhgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054791; c=relaxed/simple;
	bh=3/cNw4sEvJBejOf977x2DG/AkG27qWXnWwL0GNmyl8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fT5QdN/pE/AJBuDmOrA7njAJXQyWltr9+ZbDIHIPBpZEMvQD751ap90bPSP4jiNx80pX9YvjkVQDwISno6Oxw34B9FrffMBC5CjzBL6v/KrackdqYDD6A7BwV1GEVrDK1PRJ2+ttvuM42jiZlVLKDGkFmXBJ+wsHdT83Mp56bTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qupQC/rI; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qupQC/rI"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e5378b281aso28093255ad.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792054789; x=1792659589; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTn0EhBpANmjKhHsvyvAy8HwjaDH/CrCTffTLDLZppg=;
        b=qupQC/rIEVMPZFdcMZRArvtyDgs3EkHT5xOZfBnj26TUeYb8j+9/8HxA893ITTkX+p
         gIaQFVHbbtwPZ1Omdhj07kFrOnT8MffTAF1ptDTiIkltk+PyZw/bdWau6V6b7kH90zb8
         c4JpWnM+1So3E47MZIhtwLal4oLKFzI7eDT/X+aHbF1zIWOSJCzdKW9EybHgMotNzwgT
         JEVSkPhW0gHP3wDA86FzhU/oMii9GWEeHf2VlRsC9kJpqJBcP2YkRML3ahQadNhLf+5Q
         Q6Nz3SZtfSZpsu896FspTI4Aky22UpzMKTmjXU5/W6q8yoKjeBIiVdo63IYWzSIBEZdI
         scOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054789; x=1792659589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OTn0EhBpANmjKhHsvyvAy8HwjaDH/CrCTffTLDLZppg=;
        b=eq28OyFLvkEMiE95GmWDqa9+jRf9CYWBCc/QqHb9fUsEGt/P7BaLfmAnGhVZyZQ+Ps
         Ol/i/32DMasuTf46ZQtOc/DZx0FFEX5ZOXxKU+e26u5bE5ceWS+THqiWj8fl5YKtp4ie
         MDQ6UveGd1/8xHM9qRz3fbUgmzN25naQKCVF+JRuo8tmgbRPpMO4ncgz/1ZR0LHtdoV3
         poSeAXFcn6qhKMTs5V8E4C7kvgTQJEf67I/J5DFpCG7UCb4RGc/UzO5amX5t52D5eM6g
         ae0k/2T8op8N00bo6vnPjGSP3IscG1F3ZrYSUi4Rl88xOZ/ONh43mz6dccIMkPuJ9hZJ
         4I1g==
X-Forwarded-Encrypted: i=1; AKwUvBw8uEscTel3LMDpty0pv2YVYxgmcIxwGS0zf4G5/dmvXVGe8h+p9kDBflAR9vEH5VsNeK23WWSdQmZV@vger.kernel.org
X-Gm-Message-State: AFq9FYJEJv5H+HK4hR/1gXUhZ4jPrHDStUKN98qfl7Uukaj1Hh+x9EPT
	1EHIXVAKlZky+A9NjGi0SFo+xH9plrxRoVWewMjXTksUAmXctK7tbwQr
X-Gm-Gg: AYBFou1iR3GvoF9X2Ny/aNMmV++wtV4nX6HDNYHgPUemmvcTu9+SZSf8lxXKjWIlDC+
	fjeF/splEWKhQX4I/5N+7tfsh/3LagBxBLrdv98MjMxc+PmAa+Q1OIEFZiLzA0bTJZ+RF3TAHsf
	5OqDPxdEJLTdqFtWS6NZg3q+trgkd94Qh/s5WGx0MJjhj3eU5Ge9bDuraSOkcSGCkgirjcsC4VY
	8xoZrB/WkRiSKtb2Er0+T2VLVRvz+TM41CT4SuHI5EEaiTqgH5TmHFrvYuoTfyCTcRgJoB3m2NG
	OwpjugfgG7zdKxU7tFH3elcQ6K0b5NKiValW32WW+CSkJdt39dW6VgDs3leFykiu8Jdz74Ew10g
	VBQLrIMhLxgAuSSfbveofXIj1H6IUXUousw4QTurPxUi5/ky5+Q3ctpgwPhRfFg5zOlRIFwDZ8U
	s0ALenHm+DenaFTiKjaXZOeJT8Hvun5wzxW0Q/0vKISm1cdZ2VmuvJ/1msmoO5FXAc46Cw
X-Received: by 2002:a17:903:38c4:b0:2e9:40ef:e44a with SMTP id d9443c01a7336-2e940efea29mr41054965ad.3.1792054788685;
        Thu, 15 Oct 2026 01:59:48 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95cf92dfesm5476715ad.11.2026.10.15.01.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:48 -0700 (PDT)
Date: Thu, 15 Oct 2026 16:59:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Message-ID: <atCVyX1tV0VXe72k@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
 <atByyAg-c8v_IiAj@monoceros>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atByyAg-c8v_IiAj@monoceros>

On Thu, Oct 15, 2026 at 08:32:19AM +0200, Uwe Kleine-König wrote:
> hello,
> 
> On Wed, Oct 14, 2026 at 03:45:14PM +0800, Inochi Amaoto wrote:
> > +#include <linux/mod_devicetable.h>
> > [...]
> > +#include <linux/platform_device.h>
> 
> <linux/platform_device.h> already provides of_device_id and
> <linux/mod_devicetable.h> pulls in a looot of dependencies this driver
> doesn't need. So please drop the latter.
> 
> > +static const struct of_device_id sophgo_efuses_of_match[] = {
> > +	{ .compatible = "sophgo,sg2044-efuse", },
> 
> s/,//
> 
> > +	{}
> 
> s/{}/{ }/
> 
> > +};
> > +
> 
> Drop this empty line
> 
> > +MODULE_DEVICE_TABLE(of, sophgo_efuses_of_match);
> > +
> > +static struct platform_driver sophgo_efuses_driver = {
> > +	.driver = {
> > +		.name = "sophgo_efuse",
> > +		.of_match_table = sophgo_efuses_of_match,
> > +	},
> > +	.probe = sophgo_efuses_probe,
> > +};
> > +
> 
> and this one, too.
> 
> > +module_platform_driver(sophgo_efuses_driver);
> > +
> 
> Best regards
> Uwe


Thanks, I will strip them.

Regards,
Inochi
