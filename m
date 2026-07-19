Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDD6395D99
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 14:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471376; cv=none; b=itCU6UobV0XAE+T+sL0YihrSszuvUNKGOudV2535fB0XOcd1PgbtBObSgr8OVAjgMsua2xmXJlHeYEwoO4bXg7nKd79hZIeRHVRJ9T2E7byv/wpg3wMJG8YKv+c1Tj2c0Kp0z/hoWclmJJ7S1QCTREXEtfsyHcX5HAknsULYaO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471376; c=relaxed/simple;
	bh=J1SwDtO6RWLeo7EwdiHCifQe9EbJky+5upvJpx6VUXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfc/4NzqLBren8/T0qi0FNQvlJh5w7hX+yaao3yjmUq81VjfKvyYT4Vt1/89dpquokGdbWFYFqY675mSIjQ65dfPG5yHs24QHRTPFrOOpl60HYgMsokge+21Uz3sqepbHTbX/KfcjhIqYZH34OFU0KMADjegTWslIelWgmhjQCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEx17fPT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEx17fPT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cea3004256so107533865ad.0
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784471375; x=1785076175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nMmeaSW5m6PreS6W1hc8GycuhQWeKejjr7KZFOTKxEY=;
        b=eEx17fPT9cd4W14v1df6AFC+HIT3b/jsH53ujNLA4I4Dox2yf3eXugX69h4BelabBB
         akCW+jlHZQksbifPUgj4FFq2aP5osTr7ydOp7z833Q1IkfZDmqVwTnnSpafKkZgXEGOf
         v6k4uHV5kht9kyUFh9OkK9q0yTdw8OZSlw4UrlgVoTjXJ8iagSCUvPsazv/LcKzScs+X
         9p0+vJHCRkw4mTxrauE5uwYL1dXZYm8Yd7EmmvPH5rW6q/1A64tom9oS68/TmP5pCmUM
         8iaWFTszfhFLkQGS/GhBdnxOQH08brTvNT2Kg3UmBe3Ndbzv+OmZHBCAzZQwV02IEZAe
         fyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471375; x=1785076175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMmeaSW5m6PreS6W1hc8GycuhQWeKejjr7KZFOTKxEY=;
        b=hze5nbA/Tb0iGWG+X4JYiBCXmtCdRCJBznY5YlCOKZMaQ7bsPCUSsW1w9Oz1KNQRVl
         hP7tfNjyM2i8cXFoF8gzcqyS3s13bQvu73GVvHdQjBX6c1ViL2i7rLJSwdG+ebH/MTw2
         lDrZK0GQKcn5U6hupGqZRPRTuNfgCrBv+LUylRNwVcL9yK//ovtHjhqdP4B/4IPrg5hn
         y67r8iCt7y0FksrfGg9XKQYMVtobrOJsIEH24AZxAVSL/y+t4dDyjXmymNMkF3mcuzhE
         dcm9mS2xq2ncqN7/SGwpjLqM+GQ2p28zwU7nHGF+4kj09iorIXQwbE1ejMdWKLwi93Yf
         xlFA==
X-Forwarded-Encrypted: i=1; AHgh+RqiJhF2zABRHfB73q009GlaeLCsqFHvkW+/XT5ylP5CkRi7lY7Z9XT0xxWEeSBXYSXnhLSdxTw/ve4F@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn+HepiWsExFR2/oOBXj/lfUs7GHFaKXhdWxEzYZn5zixSUG5q
	gJSpeSEHbZMrq1Y4UpuyEKf0f74wndm6FQcdz10dQTXG/QK6tW7OOEVc
X-Gm-Gg: AfdE7ckTR7JoLGU+v1P3zWAbpnXvgAfTwHCOQcvxLCp4CkFFSjawpOfAqySVtyFfvop
	T3n85wzKyWuKE3Z43L8QMeTBZ2BfererMADITFqKMuhkIub+rnYc2BLA/KsaykjayQs1dBlJbR1
	nKazRPxSC9d/rCNbjXTz0ay9HzVlY8YW6Cm2JKphZTwX9GI8WpvFOFR1/9R2Hq7+cJymsUPQscO
	dGU1AeM6/TWxiUjM1rfUQemDZkaqDMfDNsWS6HILFyhd9RGS8uITlYy4FbQ9/K/2abKTMjKmajP
	ILAeCOM7xk91p5y0pvXAHj820LCz39Hmm+EVEEqXcuFVbs0z06HVW3bonUC7HlAclHu6dmV5BDs
	BXm+X9qtsM+s2NvTroAJhX2Gt2acXr81JplQf8Gc1LluoIAons+AYrbCQvGXCiBNk7SGvTDWmQc
	9LOYSur6+3VAq05M9mwl2sRyfxWw==
X-Received: by 2002:a17:902:ef49:b0:2ce:9b49:d4a0 with SMTP id d9443c01a7336-2cf34994db6mr117887555ad.35.1784471374913;
        Sun, 19 Jul 2026 07:29:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347a6308sm40918175ad.82.2026.07.19.07.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:29:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:29:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: add MPQ82D00 driver
Message-ID: <f1b1f66e-84cc-49bc-a3f7-19a85ce378eb@roeck-us.net>
References: <20260704081810.1701587-1-wenswang@yeah.net>
 <20260704081952.1701914-1-wenswang@yeah.net>
 <20260704081952.1701914-2-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704081952.1701914-2-wenswang@yeah.net>

On Sat, Jul 04, 2026 at 04:19:52PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mpq82d00 controller. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied.

Thanks,
Guenter
