Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98A44E36F7
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 19:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672465; cv=none; b=le4iTlVCkQdXOGtXOfLO41wJ8iahAa0+2uml5/AJtEpPsjOmvq5m+Qev+FTS2pIVOEaPfONJ4U5/4J0T1kB9e8tu0BWYXmkctQw4ck3lDZsOxqiMuTAk8toklDM560tmzQzghBzFHtc8ioDe4RioWJ5H9hN9kwEfpYq4Yzk1VvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672465; c=relaxed/simple;
	bh=PsT9NM7+x95sDVcyjkUlLYsDInNrGTwBFmY0J5z/2I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9kCLTQeUOQWHKKJactdhCcw59YZS1Q4yYLgm9aaVjz7KJSfOgGPCSZTCSIhzO6RbkJ+8Vjdxgb71pDXql1G3vdz2AeY89YVq1pGttmL7fvtv68AxrufZJQrrw7mptZIjGXGBdsHFybyjPK/DTu4/SYI6jZC1DNNt9V/4SAC+KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xtdox8YV; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xtdox8YV"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so879479f8f.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789672462; x=1790277262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzYLOWyfgGEEFvCR5EarhALHCHgWymVUp+bDyHHXrVg=;
        b=Xtdox8YVphCU9tC8uIXfwep27Hd/CiWxZq9oeVVAEuH3XORYFK9446jfFoP0IIguPP
         MeNETngItXMcY4fenbxR3Zl+m/kVo1aqMLQi3amZC00fMbEAQ33nZAj7esgi/DdSPdc8
         gndx+OEMMtnqpO5zNRckgGXl9q/6RQ/Ds3AgkGLuZs/lxVeT6uReZN/pWCacaoZxNOsH
         HK6EXmdCs60nPwj7hUMdibRdKEC09SNpuu96Jb0O5093GdMMcGfjbjCZ2+bbjGf3tvtJ
         46rg3cCzEFJn64xoUGi/C1t7/Uv6Y+bhHmvFuTQ7Xdq5aYjXpPon9EBtVv2TcGy1glK6
         sc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672462; x=1790277262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzYLOWyfgGEEFvCR5EarhALHCHgWymVUp+bDyHHXrVg=;
        b=rcsgRQvDpvrIaa1hTIfbUzVMeWKhCo8SjGyWSeKG3jYCSSZRgXR2C6tfM4vAbvcIq9
         asOjA1DBw6GRkzRJcz4+46+2E7UfSWXqK1URUoU8CjTqSgiznlKCPR1QJx52RCZ1POBo
         P49I2Iiq7yXkC553CuSmtoXOlIj3Ld9C9a1FXvtYk1cVSGo4g0GcMjg8S6Lnmp+yUTe0
         aqtIGanu0VIClH9KRAL+krMiOB4AqbUdQNGMSVmkeC052z1SibJJVYLG6FHTShrG7Mt4
         s+r38VzLVZONFSu2/bTcHs+7g7lGBuunDYYw6/I8jgd7hvGjycHxSDexulLrWI4um/Ed
         4K9w==
X-Forwarded-Encrypted: i=1; AKwUvBydDKpBDf2nNn471mXTwBM7UWe1BWmwf+aVDnMGLKAeQAriqPORkFzS+0b5lfKTfXY/DCy71UbWSdGg@vger.kernel.org
X-Gm-Message-State: AFuF++k/H/+aS+SfVgOGrlsSe+FiE1FgM6H+jDntclJjuD0HJp28EmYH
	65kilTLis2D5fd4SK9KgiAArssWtrROo4lkKmugWTuHIdjdSdTNX6CBf
X-Gm-Gg: AYBFou1O2jNRRVycgm/YxrlYgW8YlM42Dvyw+XR7sf+TY38g4T67tk0Zrk2pYEeWfX2
	WX5B9pdzVZfwsqITiVPUU/TbjURDDQ1YnQPEGaVYrkbXvnes6YCKH5IiYdfFfJdMjg+8s0zWoGV
	UHo3/rtztWX5q/wXVU8TRIqTb0/mmRDWYUEhCs7JNrPCrfi4mDT+79wbNNjOFR+FZVxBCaq4Lpc
	+0q8Mjl339ZAGu/frldDKcdJoswKaPBeSCuQMGwLfU3vIeZZqJrNIBoVphdKiSwvTjEqa425YfK
	QlBjuStjXdKp7uTFm/gnf5vbvD8rLJh+7PgTRaoGaze2S/uVNxppLXPJbWXM34Alm/NxJsFDfds
	OQx8Q+dHXVHt3Om3SunPdusbXVcB8VQBf0FOLS/19xqpHZXQLrAi/6f7CsQEk34ZYXcm76X5qXs
	3swwJURERYNdaPTQc5hiOqcowMzIYJUxSR5mEw/00X94jcVIn2dnQzx7umfHRP1rlkJ3Ej/Spjv
	ezW1sc9H6hqbhSv2mtvGhRXRpbGt7muGyYrwjCbuph/l7++R1cmsYIGq3WgWMWsQ1txXekSqvIP
	VKA+J5gyPRsTBt0ha1uM8cl94Q9c
X-Received: by 2002:a05:6000:25f3:b0:487:f37:7ece with SMTP id ffacd0b85a97d-4870f3780a7mr20918885f8f.0.1789672461701;
        Thu, 17 Sep 2026 12:14:21 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27ce2sm17755585f8f.20.2026.09.17.12.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 12:14:21 -0700 (PDT)
Date: Thu, 17 Sep 2026 21:14:19 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
	Frank.Li@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Message-ID: <aqw8C2YwvXOcRYPV@Lord-Beerus.station>
References: <cover.1789659585.git.stefano.r@variscite.com>
 <57aacae2f4f57e877ba32d8082915d6d6bcd3803.1789659585.git.stefano.r@variscite.com>
 <20260917155033.C43521F00899@smtp.kernel.org>
 <aqw2zT8W6EvRroWj@SMW015318>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqw2zT8W6EvRroWj@SMW015318>

On Thu, Sep 17, 2026 at 01:51:57PM -0500, Frank Li wrote:
> 
> tpm_tis_core.c have not parser reset-gpios. ref
> 
> static int reset_gpio_assert(struct reset_controller_dev *rc, unsigned long id)
> {
>         struct reset_gpio_priv *priv = rc_to_reset_gpio(rc);
> 
>         return gpiod_set_value_cansleep(priv->reset, 1);
> }
> 
> suppose it should be GPIO_ACTIVE_LOW to assert reset line
> 
> Frank

Thanks Frank.

You're right, tpm_tis_i2c currently does not parse a reset control.
I have proposed a separate patch to add optional reset support using
the reset framework:

https://patchwork.kernel.org/project/linux-integrity/patch/20260917124211.136221-1-stefano.r@variscite.com/

Also, the reset line is active-low, so you are right, GPIO_ACTIVE_LOW
is the correct polarity here.

Would you prefer me to send v3 without the TPM DTS patch for now,
and add it back once the reset support patch has been accepted?

Best Regards,
Stefano
