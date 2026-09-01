Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC9C3E7621
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 13:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268285; cv=none; b=JO0I5W/qAkq6E9MNMwB9tplDuY3MgPVmubbp1l3ek1XH+c0zwiAwbytQPSKOHM9Gk3ibyYlTyA7DpjJP3xewUVxQfsRV41h38HP1Q3adMc9PaiRwnTo+PuNmAawIvoVfangn87dsX2ihQa8T5m8y3SFMzQyJFR7w5nLKwviQnO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268285; c=relaxed/simple;
	bh=Do6+wJVKBDNL5nAR2OL/qbk0mdidmP25lT/W/v0I60I=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gc2Ny+NnpZm6gYnOapG74D4WtZIYr1D14G7ghrevhuLvnYw1fueLI0MRbTlIEiMbj+lQUhLFGXtNtU8WxNb8ifZ/ENljtve51gAkhN9G+t/IFYPJvVLgFw+Sv9eZykmkn3EXMUYZ5r6FADOmytOiiVW4w7rqCfenYeSlyXhye+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aY6elEuz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aY6elEuz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4957eefd361so6961005e9.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788268282; x=1788873082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4WQe8WxOJvjm3sLRvwhf9J7T9KlfMScAPN+0OUz8OY=;
        b=aY6elEuzm58eq/wD5OHWPpGE48ZV2/yOMwLU/L/nIb0ENzsoXew5MdP7Y3VxoeXXsI
         oTmdnEbU9BQ7ZzpwTdQ+qUQMjLKHlFGsM1AQRnp5PnRJhx+TiYbOlSb2ANzbpsaZpxX0
         8lfAlk/NmHdNoXkvf6TdSoLmbnKh9ebuc/u+kTZBHFPYPLhoEbBUhge+0bZ60sdaYEm8
         uoruMs/UnMrmTH0UK0AbBDGAEuxuDpWjHr8jOoih8k5MhD5V4YE2RHd17UYMGfG6QpJe
         5ziX5jKXHek5ngdovPMppB/Ho+dIQUJeDsH42Xd0ZYQwa4HuuIqAsUKkNw0BefXz8sKP
         i4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268282; x=1788873082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4WQe8WxOJvjm3sLRvwhf9J7T9KlfMScAPN+0OUz8OY=;
        b=Uc/nTLjjS6FAj6BHIIfcOQDO2T+i4XDcfLYL9TWnZ82o+SCvjipCj02NO1EilIH3lb
         Z9aPzr+meK5DxKM2HnZodLBb7aveM1uk7kN9gk7QTX6LqX9a80J3aOBik/m2KWA+9BNa
         Wk+OD7X8tLhc/0/jUBd1xNTW5pfPw5/5LolmQCIkGjsIq6yUZKjrrADU3pFzRptaOyAk
         ROhp3PuYAf4LxUgs/qTiJ0fWO+/WtofwkZxLbe4acB/RFKH0kF0GnkDTdqoqe4zGWKfR
         Z/ZVVxeLx/GIrrIw5OjrubLL1CTmtoSpYONUkghbt6ju2FNlaDAIQze8Qj5aPIzO7ZC2
         SBLw==
X-Forwarded-Encrypted: i=1; AHgh+RpLDO1u27S7JLq3FBHbIboIVIv5/hbJ6TwXsF2Ak3t8NUAuA/xnkkuWjeIhHPgs3vgALL2JkatgVwrk@vger.kernel.org
X-Gm-Message-State: AFuF++nBZuB6RXahQ4gQMyqZk81gV+lXeqp+iqbGGpm662NO8jy54J6G
	OPpOp5LBTi/jAoOsgHf5oeKRo3E8lbVDbHCnaaLEP5Sxc7oygsiOYFt7
X-Gm-Gg: AR+sD105YmHR7oI/Or07g9ay6Fa8egkUQ2zx5JelaXnKBS3VKjzvGqs8uhFWdR3hOCV
	MarLAU/DHu73LOjpFNgqC5OGBxWWO7Y2FdsvlRdHivdexO8JBJRpADKwMlbMAiFqngSBBZzjrLw
	xIgGGk48Oi9St2VwIprIIulr9sy2x/O1kfkpe5CIeKJBEljygCUUrFMfSRh5Wrk003ucMTxIXy+
	F6f/hf6kSrlkhKDrQ5U73sBwQTVPQhShGrE9TY+1xxBprR7BzchDDC3Crptlp1G+Vd9SgajGvTj
	GrcmjxxIMEQQ2E/66UnExfPwi1FiSVLSQ8ORgTtDoYOLJYYyBzrSPfdXCZEVr21vmYmEhNWd1Wn
	VbPXdHkgKjBY+z0czvQNhJDl2Q1NzX9PpRVFYeZWW+9Y3l8elEFGjawbDNGc+b7SXMXfpeRgayo
	h1CcF0SxsQxk6udCEK3dChNJszwm6PkVB2+CoNDpHA69fdFtUbzs8z1Vjo5Q51CtSWowSu0Rt0T
	30evzFbcLxMYDBKTM63Kvcej5ki4NnvZn1PBRpCnBcwKg==
X-Received: by 2002:a05:600c:3511:b0:499:adb4:a922 with SMTP id 5b1f17b1804b1-49b91c4bab5mr387735445e9.12.1788268282047;
        Tue, 01 Sep 2026 06:11:22 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1a3fesm70391065e9.12.2026.09.01.06.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:11:21 -0700 (PDT)
Message-ID: <6a96cef9.1f1211b9.23c693.9e1e@mx.google.com>
X-Google-Original-Message-ID: <apbO8hHBw7bMvVxL@Ansuel-XPS.>
Date: Tue, 1 Sep 2026 15:11:14 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: airoha: Document support for
 AN7583 Gen3 PCIe PHY
References: <20260827122127.18874-1-ansuelsmth@gmail.com>
 <20260827122127.18874-2-ansuelsmth@gmail.com>
 <20260831-elastic-turquoise-puma-f032fc@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-elastic-turquoise-puma-f032fc@quoll>

On Mon, Aug 31, 2026 at 08:51:46AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Aug 27, 2026 at 02:21:20PM +0200, Christian Marangi wrote:
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/phy/phy.h>
> > +
> > +    phy@1fc7f000 {
> > +        compatible = "airoha,an7583-pcie-gen3-phy";
> > +        reg = <0x1fc7f000 0xfff>,
> > +              <0x1fc7e000 0xfff>,
> 
> Sashiko has a valid point here.
> 
> This should reflect real hardware, not current driver. It is very, very
> unlikely that hardware designers designed a block of 0xfff size or 0x4
>

Hi for 0xfff yes the block is 0x1000 but I was reporting how it was defined
in the original DTS. For the 0x4 is for real a single register for that
usage. Documentation is scarce for that single block but this also reflect
the same implementation used on EN7581. I updated the example to address
the strange block of 0xfff.
 
> > +              <0x1fc30044 0x4>,
> > +              <0x1fc35030 0x4>;
> 

-- 
	Ansuel
