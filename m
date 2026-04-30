Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13D642B73B
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777569496; cv=none; b=RzUMjm5FA9IZqsGlRhEa82V5JbuOXt0sxrNb6rj4bDHAu2+9gP8DkLMbzBZZFuYDi5To8EjAj5oghiyQjAKivasu8WfO8V5bNAxDvpO2OZOkBe9Ez7m4ROu0Qd8YTlDWtBPtlFhgErE46UrnqzMshI7jo1of6RYyhTiQch79NlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777569496; c=relaxed/simple;
	bh=TpyWBTtCvl89I2VI/PwXM64XWcoldK1gMhZ8XyRoh1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCSvsX6Qc2TPY5rhXiOKtY4oKtOn+YLIwBOrLE1iBHZ+yLcYh4GRzuQqCIBBAkDEgDDEICEYXCmn1xB1p/hx2kyAmN+6TQFJFlsBkrzHiXUNDgH0YOtNk/fVZQmQRAGKSHnLj4BQt9rrimTjiV8FM0OCgFIXk8LVdn83pq4thao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q0a0ytkw; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q0a0ytkw"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-356337f058aso768809a91.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777569495; x=1778174295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ALENd3xMV3SWWFyPseCQ4MW0PKHdxiw3vbFxIMfyRI=;
        b=q0a0ytkwvlBodDBAaRMQyIwLGoAapp6RJ3H4Z4nYhytUygJ1UbUN96oGBXWeN3QEDF
         S8wAHu6xoAwmy8Uy0U/H83eJW79WC4NnjgPypuEV8cpfzrKoyCSgfKHAF4ucrHx0YC3Q
         pv7Roi7KDfoKATrN28d/YZafXpTQ285v6/GX2QRwme2CWxe5ek8AqQ92rTgovAKxllXA
         u0Pn9uOFLVij/21oe43hUF3BMCQI8ryOqx+5o4b83Qx7ctYvdr05VRtzlv4BZfJYCyAt
         agPIqeZHDmxg6uirmusAAd71ocz3IJ2gd2MWAP6om7tDW8n4pV23bKfiIcEDz8xNpMN7
         C7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777569495; x=1778174295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3ALENd3xMV3SWWFyPseCQ4MW0PKHdxiw3vbFxIMfyRI=;
        b=Qcg7FjGqIsH02pLDvD2fruUajIPxMsmLcEBStj6nnM/zDo+Ck+FW4ZXP9Zbn7kBdSD
         tqATlMOcDxtyZJzVdnUmdDX1I75ArONfl2xsK5KcsXLkvOLbQqMTzBbqSkxpSL/V2L8t
         RS/kim/0slM2MoC3WGoz6Vn662F6tkCi6OTbfgjZLf6UQqrAScaL8Wzf+1vVEIXiYdqj
         i4slQmhbbCiMzRCUEaNee/5EjBWCDJCzojLVKYmIcfoRFPzGE1YeRnysY9pmDkdfMa8n
         bNFJlBDZ7ZLOYqeXCTm5R2a+/+OIKgv+0df0qV2dEJjScSYCnfa9vmF9aJk7+9yHQ1Hs
         Q3vA==
X-Forwarded-Encrypted: i=1; AFNElJ9g4tk71OYwzt2lP/enTbNn26lS+Z/FeD0TCApq89niYnXgoKJ3rVC0eM7M2WL58X9ZI99/yuYJTGLc@vger.kernel.org
X-Gm-Message-State: AOJu0YxyABeEqML/whdT7p6zauHZR0JtY+oOMxp5gHbD+xqkFJOWMmEF
	59j0Llp4VhA2uiPDhVNNKj8w8yltkGTOnAG09X6vtUM3+kIKrnVCsAiX
X-Gm-Gg: AeBDieuS7koChlmEEyVILjUKxh1l3f6AdiLJgG3lzjjnSS6XSEOjxjNuxVZxcLYhbz9
	+YWLZ6RI3vs4+oFP/4LhJrltyETqPY12MR7f/S/BdWIb7AW3//3ydwXrh1K3bmYojUMH2REOAkq
	PSOUlk7U87j1NxuezNwdx8owXrDrEHK+nCYs3C63QU2zSqpg7JGARtx6Kcz44S/ntF9pBTCDPf5
	fvVG2lzCi7DS7LBeZlZ1jueCKtyosGjMtibljBiRDhAn526PByvTwclE4/M33ShRTBQQA0CKdf/
	DDyZ1GldwWh6M1a57rzqv8QlPHmEeqosIaLzfwBy0NPJpjyjsgccXJBZ4gy/2AG3Q318c6/Cg+F
	P+eaxiq1O6JTlWHdHErDlxfDER3xblnanpeVg0lIB2TE5/wFm6gxo74K/FJNkOjWMYtXIGMCy7a
	lRw3g+iIfj9TMmNIP0H+58nR89SaCv4wDTU9hL2/ViEOFlTy0=
X-Received: by 2002:a17:902:9a43:b0:2a9:e8b:5326 with SMTP id d9443c01a7336-2b9a24bee86mr28418795ad.23.1777569494783;
        Thu, 30 Apr 2026 10:18:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caad28c1sm1886155ad.34.2026.04.30.10.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:18:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 10:18:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: add MP2985 driver
Message-ID: <cbc39633-65a4-4313-8035-56d040def5b2@roeck-us.net>
References: <20260414092801.1067470-1-wenswang@yeah.net>
 <20260414092921.1067735-1-wenswang@yeah.net>
 <20260414092921.1067735-2-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414092921.1067735-2-wenswang@yeah.net>

On Tue, Apr 14, 2026 at 05:29:21PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp2985 controller. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied.

Thanks,
Guenter
