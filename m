Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160660;
	b=HnW8kbctgozbqHjW3v0DjnlO42cLfPKLyAXKRbO/4a5BW3ItA6z+q13iIJjm3xHrSfJi
	 0QWXSz26UBCBcgh+xtbQjeEkFdiQmlE1Tovt9rHLdNbTG8w9ZjlEzNL/b1xEWJFEk++Is
	 fqyD7RvANx9uL97TEc95nMPBFm92y4rKOr34O9hPfdO/rTJYJ0L78jmewFZ1QluU4kjKz
	 GWnJTA8X813+y+HZjF+XUuRQPxdD5unvUSXvTzP03TEj2L2ElfvfLVHRMve83YOBRKzr0
	 d4X9lgphcVwRbmviHiB69rBzKOUz72GHsWR662lPDCJuEFl/9BHzHN7LB3Vxc0IUOCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YhIr5RkufI76Hp177M5SL/nPXC4WeO/bah0MoOu9yac=;
	b=hVvOxjNsqV7fh7w4STOSPgOSUPWx3lzfZvdpNBnxaKeHYQOLHOmCMGABv+rZvOM604pf
	 ABEO8mfVGYRaY1fpU/SgOKZ0WgCZnLNAxRNckC8Humlh94BE1pdNKF+sZ2ppDO4qyRrMf
	 mc1CEA6W9/8wiorZM/8z56JMzoKfCiWstrz93HJbIq6AdLamxq8HEVAkQdXBwW9BBfCKe
	 fgElyShg7CHN/X2hWPNfU2lzIklwo9P+DQZo6kH2OWDrgcEdNfH5ArasiSqw8DuI58xbm
	 bdewb7O8U5sYb+jJsG56F7oocmMPMY3C6idd9SGwFGH/yaDQrUJ3RwhEAXYEX0Xeasw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MVdH0dbZ;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35B3606A338
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35B3606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MVdH0dbZ
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so876765c88.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 23:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795160659; x=1795765459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YhIr5RkufI76Hp177M5SL/nPXC4WeO/bah0MoOu9yac=;
        b=MVdH0dbZECMyRVts4clMgTTtsiSNkQYMFVjvvp2uQ0gO+y1c1szeDBPX/F8uygQrj2
         SbfdAavURbpFr4fbi+sgpKV6Tddic53/AVIVaKgT8cps3fcivdrokWALa1iMft0nh9GS
         zybLQByYLe3b/CeAFZsS3ekpM+tsWIDsSuXTz0AcHjctFr1lue+uApIkOIU/GqeNqyXg
         cfYoslTPciTg5C51zrlXYz+BpV2r9fJPjsQOQ0Av/l6rCUmF1q0SqtRXDkV4d16oFXof
         WGYfZ2nyv126pilNMGwRY66ySZPAo6Dfw/gMG2s5Jfdgiwkeo+j3ZGp70xpYpx4KNoK5
         sP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160659; x=1795765459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhIr5RkufI76Hp177M5SL/nPXC4WeO/bah0MoOu9yac=;
        b=Kg37FOZW1AiPIbhQd2oY06W9Cm5Z+siCt4CbcfbmHe0JBmHcyD1ApKolxSqyBaASoB
         kHu9G17XgyWenZ/F7yqj/SfsCdkRwv7WnO++6sk01mcaEyObkaE9573j3yf+Rawiknpa
         Aw3ZPKgD7j05fOarR0JxjNCcP9jOzZHNSlsPpW+xpiGmY4we7P2riTNCsS/mcOHwgO3H
         aACKHjCT63X4EAQGe1TbhIFGChdDB2ocot7SILvHoVdRbto3heH/8/aNJy7f0NZz9hIl
         G3nTz4sJ3QURyhZJbylsPAsV7uxFBLn1blaODYKYuIKuT0MKdBqJ8BliCrvuO3qgNgFU
         UOfw==
X-Forwarded-Encrypted: i=1; AL+hErGGLTpvsBtGl7OwGE91c5CEJRzNCVn7t493P7WU8hRvneWxXgg9WTcuAbaYQkSzcmTHVvqKv1MxsEL6@vger.kernel.org
X-Gm-Message-State: APuU4Z9gVNd2Sq7EAbK0/ORWrPgeKUhRkMNxoo7ebncdqKubiKabPst/
	CdY2Jvn3YH0yj8/dbC4N7IIo+z6ahc4YrWWSXF/GidfDhlJnQxoZcoY4J1+0bCqarro=
X-Gm-Gg: AYBFou1RsY4NvbEeMaaq9gqXrbSoKTRbaG1DlesDBUehNcIXzuszr5zcgXgbiJ0jCC5
	0tCV4g0iKak+B4cpSGWq7L8VoptLPc/LJWSgc7KBmhP4RMzFhesxeJKB2GC4Na1ciwodq+8A0EO
	E99C08CyH4Xpjd2WOGTprFrHQaLe/JxmmJ9vKztcSiiMzXoNhSVP9ihrOR5gLj6RfrWjC/Oipod
	zl2uTvglaoom3/ko2QRH51ale+/5OfSB0Xi8aCDwCInoxmNVwGBVYZmC4w8cIfAh2y/wuhtdbop
	P1B2wPIpIEoleU18hjkk6FBAHFAWCiYO41blqznvPfbDoNmO1G8YVOGZosWp5IAyBKXegi0H8oS
	L/oply5iIKIYk2dZbdmdXpHAhRtUCXXIwS6IXej4qyu4KPMfBt8yVIOT6i3KLtl/HQPSlWXJgfe
	xhiKWIIkwe4Ya9QVE08LYYr2d1WheooJ+4Qla5EZ8yOuEZXS/+FsA2sKAh7RqvkXkU5Skkb12jZ
	OYSoTgA19IpSNaVmOYOYd6j07+t6UBTDqdgrNZTf7QuIF6lvGQKsHXBJaG8wGHWmTkjFnoVGjAB
	sQ3pY8ryFHe+hWqb09xDOKOzKkpjIA==
X-Received: by 2002:a05:7022:f50f:b0:1ac:1022:b60c with SMTP id a92af1059eb24-1b5567b2091mr1764911c88.1.1795160658571;
        Thu, 19 Nov 2026 23:44:18 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556831d45sm6769427c88.11.2026.11.19.23.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:44:17 -0800 (PST)
Date: Fri, 20 Nov 2026 13:14:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	zhongqiu.han@oss.qualcomm.com, conor+dt@kernel.org,
	treding@nvidia.com, jonathanh@nvidia.com, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, bbasu@nvidia.com
Subject: Re: [PATCH v3 0/9] cpufreq: tegra194: add Tegra264 support
Message-ID: <av_6T3bqEygaKK3q@vireshk-B250M-D3H>
References: <20261119111217.902071-1-sumitg@nvidia.com>
 <av_R-8aMX7lL83ln@vireshk-B250M-D3H>
 <61d207b2-3155-4613-bc9e-588c68f276fd@nvidia.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61d207b2-3155-4613-bc9e-588c68f276fd@nvidia.com>

On 20-11-26, 13:06, Sumit Gupta wrote:
> v3 was on linux-next, which has commit 4dd10fbbeb9c ("treewide: Convert
> devm_kmalloc() family to the devm_kmalloc_obj() family") from v7.4-rc2.
> 
> Your branch seems to be on v7.4-rc1, so v4 on it would conflict with
> that commit in mainline. Should I send v4 on your branch, or would you
> prefer to move it to v7.4-rc2 or later first?

I moved to rc2.

Applied. Thanks.

-- 
viresh
