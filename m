Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D556B4963B8
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639982; cv=none; b=X0pYW70Hht/NDKm7PvUWm8P/brOmpcp/ZreRixdY/V/2+4ODEmQphRgCODCnOI0ishHWoUuVeVKHfHr4CT6dcmZYYjyZFUvkCwb53wTNCxP807nAX7cDaXtmNz0bw4lmM7Bocw6VO37dPDI9NSCak794ExzNlPY2tl/UHRSf2ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639982; c=relaxed/simple;
	bh=/6gR/F0NF4dyfxXmlPbggAK3SqSGZ8hEKLFz/6duBHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eX2eNfmlymVFTf1OUuZilJazUlsn0OlmHj13gf6pPffQXBS7080BLF4tqAgHw/xVzrJ0XbI3p5Oag2R7N31xMFL60Ti2KtXJtdtJpQQoANnOluZkoiRa1TsEQTgbYf34EaIgnRT66C3J4cgv3sf+IGhe7uMQJBA0K/Upzt8g7ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4zazpHa; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4zazpHa"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so2066067b3a.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786639977; x=1787244777; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wcOTGw+yU50xIcVPJ3wdwMSygvygwt98ERvGGHsAU14=;
        b=P4zazpHa2SK72dgCoglFflN3czzqZ+UKNGRYn6f53JOJndkPfMF6zX/Ubk2w/Cwg7E
         EWVuYz9tQ09oJD2gaCW1JF+/Evkwja0lKjqgxOvmg88nk5iuHFCwbu5WH9Yhhiz8WFnr
         0fMbymLa2PvqFpgP7Hr6q17g51vJ4txWTrjpuikgbbQBzD7zyyAut/I5J0GlesBSRWLK
         Pw7/mRZJ/QIBkslIgoVtYbVODw1x5958GKoxYCPrGs/k8gJIvCLiKT7l1my3xG01pjn/
         NO7HWly3iUZt5rhudwXREZk9ccvVu6UASzKw3CDfWOS5bqv+IIMIBSPLd7pDsNuuwyVF
         Mn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786639977; x=1787244777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wcOTGw+yU50xIcVPJ3wdwMSygvygwt98ERvGGHsAU14=;
        b=B6+GCwe24hoAJt5dtIb41xQoJGMvAbbNdqXRRb/qKesuVMCrtMskwoZVFVzdeS9Yn6
         8qfzLt9fxGa67bbGd9u7uKNwDJFz80qRnWbSM+wx2P6qhUgZZuApkxYMzaS2Ytz2XL+m
         BTbR5pe1bkbvbjILGnRj2OaHDk1FJlsExZCmnTehfhPXeA9Y2nPAV/w/2tcspsANNn5m
         Y9W4UFa3JBKLJGZUsL76T1FB4A8IRFVyRgErEaKVTWACUhJ5vQZN/uE6Vp2dBVpw5b7E
         EASl4DkFW9ahw+dRyk5WZzECoLyTHvCIgdY0jx2RzAVHScVMiVkHeFd8wi34lnhuxwIG
         uJXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZVxLfSTxQKIXHnWKBOJYsfUKuR81db33alZeNl8ofYYDHjxykYfIcv55cu0jTxPTRzPdgMaTukNUw@vger.kernel.org
X-Gm-Message-State: AOJu0YxgKQ+ZyU7Q6MmHrn7SxYdPO1+xLDd1NSswxWByXKfGrYx9OZaS
	2nIkUAtx7UZ8ZLPlS/GzZt/ecdQ1UmJR9tVl2fsTdvqkomocbfLdRItY
X-Gm-Gg: AR+sD10xb51Bpoa/417jSX/RIsA05iPAySoy1JTtwGJK7qUqMW2riXRraE/Rw/2ubJQ
	jVNhZPvwiPJXx+c0XF71YGjiG80iPAcPjc5UNZP0xZKl2dJcXBSS82blgMazBbJfyUjTdcr65lm
	aRT8IPw3V0wdieGLiRKU62PchigyA4aQEyY37Y2cC30gx1MiMW0mi42XH1dZpstcbsChUr4IXA0
	azuLrC+Gxk0z94fMfdnppsGtpT6z//5/zVRJ0kfw5XWe9/j0HcJoTxpVlGuivKx8rheWJmc6UXL
	zsq1rB5Np28Q8/9mprvf0UtmtHBkdHpuvPgsIaZuYPWrSAcA08SY5S2GB/0oAFT7d0lLrDGwZu+
	t6S57GR1g13+lg5c/f+hdjYe35eZdyDjNeR7rAXjCUdVyx4tmVwF/RntodnMJ/hTeL4f/b03AO5
	lIEmiSQl5ei/Ywjt+AKQgMjLMFYtTwhfm4hogXn+YN7xaWVqht86w5EXgsA3ZUuS2dWgA=
X-Received: by 2002:a05:6a00:e10:b0:845:e97d:447e with SMTP id d2e1a72fcca58-84fc760e881mr8509974b3a.26.1786639977197;
        Thu, 13 Aug 2026 09:52:57 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc4566f8csm1221247b3a.2.2026.08.13.09.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:52:56 -0700 (PDT)
Date: Thu, 13 Aug 2026 13:52:53 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, 
	devicetree@vger.kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH 1/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 10.1" LVDS
Message-ID: <6zpgl2fbn6lzmpyhdfvhgbt2um2ykehkfbkv6qgv44w4f6dyr5@wkarn773j6ol>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-2-leoreis.costa@gmail.com>
 <20260813135158.778871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813135158.778871F000E9@smtp.kernel.org>

On Thu, Aug 13, 2026 at 01:51:58PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The panel node name 'panel-lvds-native' does not comply with the devicetree bindings for simple panels.
> --
> 
> --- Patch [1]: [PATCH 1/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS ---
> commit 9fa4254322a01ecfb1f9a0941237ecac9d2bf3f1
> Author: Leonardo Costa <leonardo.costa@toradex.com>
> 
> arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
> 
> This commit adds a device tree overlay for the Toradex Capacitive Touch
> Display 10.1" LVDS on Verdin iMX8M Plus carrier boards. It integrates the
> LogicTechno LCD panel and an Atmel MaxTouch capacitive touch controller.
> 
> Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> 
> [ ... ]
> 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso
> > new file mode 100644
> > index 0000000000000..9079c6284dfae
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso
> > @@ -0,0 +1,95 @@
> 
> [ ... ]
> 
> > +&{/} {
> > +	panel-lvds-native {
> 
> [Severity: Low]
> Does this node name comply with the generic panel devicetree binding schema?
> 
> The bindings generally require panel node names to match the regular
> expression ^panel(@[0-9a-f]+)?$. Using panel-lvds-native might trigger a
> schema validation warning when running make dtbs_check. 
> 
> Would it be better to name this node simply panel?
> 
> > +		compatible = "logictechno,lt170410-2whc";
> > +		backlight = <&backlight>;
> > +		power-supply = <&reg_3p3v>;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260813133335.1941580-1-leoreis.costa@gmail.com?part=1

Is the panel node name required to match this expression? I can't find
it anywhere in the documentation, and other overlays also use the
panel-* pattern.

The 'panel-lvds-native' node name complies with the schema specified at 
Documentation/devicetree/bindings/vendor-prefixes.yaml, and 'make dtbs_check'
runs without warnings for these overlays.

Leonardo
