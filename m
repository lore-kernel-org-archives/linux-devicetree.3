Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D19731354F
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 11:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777980608; cv=none; b=Y5zr1jX+k637jJlY7EkYPXARNGOg2wtxY6TsFxlX47nODlX8MTvz8vNQjwl57GMXbAeMzWGRfsWis2jw+MpqxzLjDm+D67icvr3tnsW0zJ7Thp/zAgriJ8ulrQ4tS1gkZWIt184UFbEzZ7nZEiHBOhjpab80kTK8sc+S7ohGmdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777980608; c=relaxed/simple;
	bh=0xmAcfL0WM9BiF0IZwBIKZxccwrTn5jd95NyvFCKKZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wg3iyD+HVLu/KJvXIUBTKnTvPIupxYFRbuBHgaUcEIgucIjWYmgOf8CBIMMdVfu4vLhUAInplk63StFR7nP9/nRM+iDoZOPGLMysXgok2t6EBkXSrhPPL8j7g+1gREPZxcVfmhsIfOepi9N/BUWjfp1+Ai9tgH3CyIW7TidSddU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyQUh+o3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyQUh+o3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891b02a0acso7650595e9.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 04:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777980605; x=1778585405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4BjQdln3IkqcS/3mLg4+1yv+wub9lBUw+7ON58e1PtQ=;
        b=WyQUh+o3zTfFGQWv5md+2HFqSNJzIAqWfEQVeigL3zaTiFaUV5dnHwMiB2LNE+7Jqn
         TiMwVysJ3jFhMeZj2+z92Uoit3ebpnS/Oqtp4+0astDokQCmF8RBu6op5ZPSbU9IJ0pm
         Ni5Gmjb904hp3n+SASD4Hm0l1Tb1m/jwsh/hY8pnvx4x6W8ouets1nY+PKIdasJvfd2Y
         qXgjm9SbXXB65FfgNzYzbsUOfRoX1OZLeoGVdV7tywuDjEMEK+OcpAr+hj69YGDlwmp+
         vD6kPzgi/mT4XJcZhc4gCPTPHAJtPfzfDXrO7i4asEkjt/iVL4bfeLFX06P1KSeysM9s
         V4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777980605; x=1778585405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BjQdln3IkqcS/3mLg4+1yv+wub9lBUw+7ON58e1PtQ=;
        b=HkK7uibF+1A/wO3HLa31DJyW4G9A/QaC8zOsWbF11tmoH+G12hOj3X08YYjv76lI4v
         KafaoJyhuIFgqrcdFuiG2IiebNryqigT1itx34q2QRE5407ahCOPkXw8FdJFA1w4fF7I
         IxYjsiRQRKsvTFZak5PWYn3tI/+YDQPR8MuqXJA62CZc6lAJMBZNbFynWMvZkiAzgimI
         W76Z9FbLEe16iDzZQlePUqwJaPi6CL16NUX2lkBTaTwqpKaD8QONRalQUIQmY8b9ho3E
         dU8H9lEiUrcxstwaSsNj6o5H+ieGqGIsmsLGJlYH0+qR7sWj/vwkUaXgQYNW0rpW3Dui
         LJHw==
X-Forwarded-Encrypted: i=1; AFNElJ/tfj+kV3f2pcUxnufLvUeP+0mycEBY00zLHAuOuGqu1wjwMD+tFL+BJBUiwUSG5Q+e7tTuVodZX1p6@vger.kernel.org
X-Gm-Message-State: AOJu0YwpyNh1aVn4VxS+cIidmt4wEFjdTx7k4QFy2sYLWHBVmPJWTIAd
	wtV166soD3a6zSHcTH7T3yUvkxv3Ra8qXCURr0MFflLB5fszGQdMez8k
X-Gm-Gg: AeBDietWfgqPjiF1/njGimzjx2DUbdodTc3slsipLOEX4EaTWm8rNX5d375JOoBufvj
	fWpllrDzYc/7Zx4ghc0Zirt7nC+Bq5U9ncVuFL/wfnLdefQ8kp6MCFluiroxU2HoOlvTdHOC//k
	Ya+qbGSLWXAx6xs3cyWA+dKO6Dfv8Xh29lrSii2L5dAZHueca/3c9p+rcsj+5Ig+5FhVBj+Kb43
	dYvlUQm1HqNyHNt4MvscVun6j6dV2HVE7O1C3UVm5obkdRSqKJ2+aAFE7ZA6EojBzaHO9pPT/sw
	Nos9mW3R6yO2XgiQtBqMJPN3dZt9kM3L4jkZ1AsoY9yRP17PTvDq2H/CNx7Hpz4pH95/w37tp98
	nOh4gpzSTE7qra+Bcv3WMmoqnf2Kh2tuYKw4x3/4zchT4IoTpzLRikTR/BD1yt0L3mdpjjtlsYg
	6cAUdGspjmo4IJ97yZrbhzBlqtDw==
X-Received: by 2002:a05:600c:1e8b:b0:48a:6848:527 with SMTP id 5b1f17b1804b1-48a9866dcbcmr109557665e9.7.1777980604557;
        Tue, 05 May 2026 04:30:04 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d403:cf00:9b58:9830:baf1:5f76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb3427fsm566232505e9.0.2026.05.05.04.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:30:03 -0700 (PDT)
Date: Tue, 5 May 2026 14:30:01 +0300
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
Message-ID: <20260505113001.idgj7ssikjgcypa2@skbuf>
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
> Add support for the usb2 phy of RTL9607C series based SoCs.
> Add the macros and phy config struct for rtl9607.
> 
> RTL9607C requires to clear a "force host disconnect" bit in the
> specific register (which is at an offset from reg_wrap_vstatus)
> before proceeding with phy parameter writes. Since it belongs into
> the vstatus register region, it doesn't need bytes swapping.
> 
> Add the bool variable to the driver data struct and hide this whole
> procedure under the if statement that checks this new variable.
> 
> Add the appropriate little endian read and write functions for rtl9607
> and assign them to its phy config struct.
> 
> As mentioned earlier, the readl/writel are native endian on MIPS arch
> if SWAP_IO_SPACE is not enabled. Since enabling SWAP_IO_SPACE results
> in boot hang on RTL9607C machine, wrapping le32 around readl/writel
> should be a good compromise, but swab32 could be also work.
> 
> Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Rustam Adilov <adilov@disroot.org>
> ---

Have you considered ioread32() instead of wrapping le32 around readl()?
