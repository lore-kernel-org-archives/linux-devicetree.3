Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118912236EE
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 17:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778951769; cv=none; b=MYJ3gVUNcok+mTGROF28GkBnB4NkcXD5TIpBlxyGKTzr4wQFLVAJmfMVTx2KNuZxPJGZy9RFknECTfMXRfJz6jBa6veP6uANaZD3At8QhSgUoM7rOihLisY0zftPQa7xLKT65YkIKJAUQ+XSp5Ffq8IMCRJOK8IZelIfg2x/WCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778951769; c=relaxed/simple;
	bh=+gIiLJUmDeM9RGg3uvxz7rYx/xjipqNwDfwEyOgS1LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIWEv84kcHFARWLT+rbx3rhlz3ApLAbiWkmyg/oGQhbjtHvDNgx97nIppZJ6i3DAZqukuHmPPObX5Yn9I1dl9yc5PMpqgzDF4A59SQrnAovXoqD/zGa2mQrXRThosCIZ3UA8SVysUbRFimTPcDEl/NHLnCX3h26ZcgCD17E5Yfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOcGfhhE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOcGfhhE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48d10c981e4so1336635e9.0
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 10:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778951766; x=1779556566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bmJR0NbRzvNpkXAmanOQNTT1QafsZYlfpNq/mu5lwJk=;
        b=dOcGfhhED41KGOz24qYItudo8vsUlHOy7/dKb0IYjCDgd2K94p/TY4n/6K76fn2Uf+
         dRGLKB5Juu4NIpw17+7vdfIz3v1rNC1z/65FkwuCOGw1UcFMFpEnc8vTnWumq4zYvD5J
         6IJYl2eKQFi+CX+4RFA/gkNHQjDoXf4+VaSz42Ye0TbDnUqA6A1MydSgxow6NysAE5JY
         vjGk/RcRMfqvIziip+BT92EpikrcR5evdhXlqIXzfuTcfM2jCJgd0vnJDhR6vplpzkqQ
         /T95fIGd/Q2z87D0WpmAHaj5ILX95bAijyBlgbxzWvDi3I4Q4hSC7KEYks5mjCRWqgux
         b+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778951766; x=1779556566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmJR0NbRzvNpkXAmanOQNTT1QafsZYlfpNq/mu5lwJk=;
        b=jqLoV8vkb/wgICLLcvrK2cYNybUHTJTVYwkweLYUudK7UTcx9MrfVe3udLB4wfIfLI
         fAXiT5XUvuBOUO5mW2QWB8CjLS7rzwYshiIEvmCiB4uPdFbnXmOIaILuZzfuJnUVWzlD
         RJGUTx76uePJviq317ARuto94Hz2q7tgay5yHmiTHU66At4Of8ddD16tCGLTurhc57Jn
         +xuu6DAR+vEP/1t0kQu2zhcjbIS0C8B0Nko4Msoh1rOzptTVO6eU1qSpgGP+caDIxml1
         3G01a2fmVaHl/Cy8tCgEy3SuE59cY/C9WTaNDSPLCo1PtjEeEyQ26T8a1ICoLREW1bL0
         5URg==
X-Forwarded-Encrypted: i=1; AFNElJ/GltaibrSp9fwi8cYrVT8UOnT7B2TTa7zfCQcrF1PbKBhRyQs8bKLlUfmtZ1h/XrdVCAGZwiUPtMmG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz497bYpXQL/1/sySM7K7rV5hzulhKlSEpKpbwtZIg8Ei5Pn8oK
	2/PBJ6tfagawv1Q8wox4944+rPp4wF3zl+B1GiM5hdYz2FsPtIOwBieP
X-Gm-Gg: Acq92OGbqalFtRVor+CKqvw2c63xqVEnq3TqnkjQePKMD9E3v/8znEPV20AtNuvCani
	qYD1kO0gpwpwt5E8cEPsV8FKC0+zI4lZd/YjrHMuRtasemMn5rr0Ow7TargQQBOf7YDPgXiFGdt
	AelEry3XJp9hysuLyQk6sDAQMzAN52/9QIXt1bJ564NzsnzdOH75FXYq8x0pXxY2iwxCHyB6lUf
	eCGnLaqPDQK5MJhrZSq26fBTEgbBFQwrucBJMOBSZcOr5e55kRYQ7iEEvMPzWudmvfmjBNh4Gs6
	o3KbQku6xFnBnKI75haqlhHLRSxTYGxnkgL0qR/68brdJIc4NblfoU7q57rmeccdDDMl88tROZb
	Nc6J+sf+VdRWVFhetDUDtCZqA2xqSnnFes10rBd7e6vH9fWcdAfcSJ122DpKpgs+5hsBEgi6I7o
	n4gQA5jLFjX9rMApkrHm2um7s1Yw==
X-Received: by 2002:a05:600c:4704:b0:489:1ca4:c999 with SMTP id 5b1f17b1804b1-48fe66550aamr54977995e9.8.1778951766176;
        Sat, 16 May 2026 10:16:06 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d507:6e00:942e:56b7:8c24:d04b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab527asm156348275e9.11.2026.05.16.10.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 10:16:05 -0700 (PDT)
Date: Sat, 16 May 2026 20:16:02 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, johan@kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 phy-next 2/2] phy: ti: add PHY driver for TI
 DS125DF111 Dual-Channel Retimer
Message-ID: <20260516171602.iwm6vszhiyn7un5a@skbuf>
References: <20260516060309.2282592-1-ioana.ciornei@nxp.com>
 <20260516060309.2282592-1-ioana.ciornei@nxp.com>
 <20260516060309.2282592-3-ioana.ciornei@nxp.com>
 <20260516060309.2282592-3-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516060309.2282592-3-ioana.ciornei@nxp.com>
 <20260516060309.2282592-3-ioana.ciornei@nxp.com>

On Sat, May 16, 2026 at 09:03:09AM +0300, Ioana Ciornei wrote:
> Add a generic PHY driver for the TI DS125DF111 Multi-Protocol
> Dual-Channel Retimer. The driver currently supports only 10G and 1G link
> speeds but it can easily extended to also cover other usecases.
> 
> Since the available datasheet (https://www.ti.com/lit/gpn/DS125DF111)
> does not name the registers, the name for the macros were determined by
> their usage pattern.
> 
> A PHY device is created for each of the two channels present on the
> retimer. This allows for independent configuration of the two channels.
> This capability is especially important on retimers which have more than
> 2 channels that can be, depending on the board design, connected in
> multiple different ways to the SerDes lanes.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
