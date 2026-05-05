Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE673859CB
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 11:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777980057; cv=none; b=ckUQzJje9B6ND7KTmrskChvKQ2LWgsYAnYTl1WIva7JM1UZp+POYUSj0+Bir0AgGkREC2qy8dIfdaRZ58qpL+WDVUSsYlW7JBKAqX4H0q8kVSJaxzKm4CglH1AgOqIFCkAO1ICpzYiMI14m8Kdd929hMO/hLm4PIgDL6wXBWL/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777980057; c=relaxed/simple;
	bh=24udqoq2MpXfLzPhvi+/+LAE+MJae6Xiw+qcs9SMF/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EU/q6mpi4X8H76lKxuJrzW2ZpvsGh+nWKMh+qLS13oR7574S+SKcXrpFMQZfaZRguVASabWrFZORawrH0NC7bo9nfvyC8ipl/3WQy/WICwCFV7peDiwX1zPUCJLXNNWhLU5x1RlaUR1IreON9SN05w26to7DM2NtQmOxsZwr29M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5D8X+9N; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5D8X+9N"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-449cdc12a8aso323069f8f.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 04:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777980054; x=1778584854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EO1SDg/FWkC5uAFkmuZlnTgiUQOgdpOBo7/xkIIXQOg=;
        b=F5D8X+9NOTVDFuZs32wt9wfSW9T2T165RWe+7xt1c7tczgp99S/FtjvqYDZY3SM+pr
         g7PvDW3Tn7L4sKPVVjaKfFVUvDJhzYaEsPRsnXwA0sUMjdrxBwstL9fiWHgzexDAfmmr
         TKJw1w+oqY7e2xgnEXRkYHbXm3dg7yg4FdN0FLqNNweoopVGR+WFQoE1bFpQcADuoR9U
         JXrNxYBp9Fv3On8N68weeTtTJR0Oo4cv2n5rQMfhOaABXGl5RO5WiuyPrqwZMS3j35qi
         K1aj8BcZwxbQ1ADFsD0KTIUwxi5jQ+vU3rb1JKbQuIMFieHFrzwrrdFjKgXZ5NNHEGSn
         rzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777980054; x=1778584854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EO1SDg/FWkC5uAFkmuZlnTgiUQOgdpOBo7/xkIIXQOg=;
        b=a7uyD9gkD9Xih5w17XlPXnEarLkGFh/M18TJgKdNYzgXGl46Qe0TW0yovgFZBAxu1/
         0E536MIesbQ7bJGCnXYsF5DrYjm67BlBD3OKi0bkSPUWlwimN34FIAPH/gbHw+hWEICQ
         Lg2NrsaQhclKp3N0rL7dnBZ/yD/hS+lqxGAgXtcgao2fssw8cmZtjr6UldCyVJvqGaY4
         Pavd3MT04PEzbLWFybm86fsg+ewo2cOWmJD3FUOAnrIAK/CJiCnGuTf4F/Ri/WiITrAi
         HDR3g0DOk/USMv2ZsumyVVKljG08omR3HZanj7VYea777jckSPXRHauNlCmhDf2oenIk
         ibbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8E3nfGGJJd5W9pQy58BTVpgaBiUGzU/AhbKSpAddrM6ouDMQaKJlxHmbPMWOXKCuyffUAfhn2w0ggP@vger.kernel.org
X-Gm-Message-State: AOJu0YwpuXWNsRVpqBJe2uByEqjYGroROxJgaOq7/F3YWyF2UnOdKe0R
	IiFTaGlWtN9tSOOc3G6PijG0XvyyY3020YoJye1cUPd5JOSHVWrdEd5v
X-Gm-Gg: AeBDietJGMgvfb/AKqKDzGvNZbMjIB/6ZyNmj0xIGM++vpZ1M/49G6Zd0xMYzY1wLtf
	gDElwRPBeeGO5H5ywLmpbOiJ0gOUMU1ERkCpNQ50J74cu9fAMVdiA/l9P8bwwhoAmMji/F7RDIa
	BIFw8QENVYL2FjhMIqHhPqxSQTuM6YRA06XHTWuwbZo3hGIf4PXOn87vpSOHbZoc8fLYCWipGIT
	PuyST+GiPtQTrKB0sd9YnyCQ7ZJpS5sCmR1gtO6SnaHbqcreD8YxZM7asKuVSDiKkFdnY4uIv6R
	QoBH877L90GyOiplaIguuY1AI9QN9M0BIvyOX0fX/oat4uiGBZxj3s5qR6GtuXl55X3FGwS0Yn2
	OBdt00yrvqrWryNfcn6UBayd02I1/ES9mX2i+0IwCHsN+nuB8N+3wn3GHOgRA5jn4DVV7o23RkF
	ei6s6FzyCY0aM0ovvYLzOVfwhDew==
X-Received: by 2002:a5d:4522:0:b0:447:4328:f693 with SMTP id ffacd0b85a97d-44bb52ac4b3mr7017284f8f.4.1777980053831;
        Tue, 05 May 2026 04:20:53 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d403:cf00:9b58:9830:baf1:5f76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505248323dsm3889557f8f.8.2026.05.05.04.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:20:52 -0700 (PDT)
Date: Tue, 5 May 2026 14:20:50 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: Re: [PATCH v5 5/6] phy: realtek: usb2: add support for RTL9607C USB2
 PHY
Message-ID: <20260505112050.dy2jn6fz4gcsrvvo@skbuf>
References: <20260420191941.81834-1-adilov@disroot.org>
 <20260420191941.81834-6-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420191941.81834-6-adilov@disroot.org>

On Tue, Apr 21, 2026 at 12:19:40AM +0500, Rustam Adilov wrote:
> @@ -146,6 +153,18 @@ static void rtk_usb2phy_write(u32 val, void __iomem *reg)
>  	writel(val, reg);
>  }
>  
> +static u32 rtk_usb2phy_read_le(void __iomem *reg)
> +{
> +	return le32_to_cpu(readl(reg));

"make C=1" warning:
drivers/phy/realtek/phy-rtk-usb2.c:158:16: warning: cast to restricted __le32

> +}
> +
> +static void rtk_usb2phy_write_le(u32 val, void __iomem *reg)
> +{
> +	u32 tmp = cpu_to_le32(val);

"make C=1" warning:
drivers/phy/realtek/phy-rtk-usb2.c:163:19: warning: incorrect type in initializer (different base types)
drivers/phy/realtek/phy-rtk-usb2.c:163:19:    expected unsigned int [usertype] tmp
drivers/phy/realtek/phy-rtk-usb2.c:163:19:    got restricted __le32 [usertype]

> +
> +	writel(tmp, reg);
> +}
> +
>  /* mapping 0xE0 to 0 ... 0xE7 to 7, 0xF0 to 8 ,,, 0xF7 to 15 */
>  static inline int page_addr_to_array_index(u8 addr)
>  {
