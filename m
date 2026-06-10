Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AF8346E7E
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 19:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121032; cv=none; b=GvkOcI/6z2t++Ligi3RqZfOvDir63/BB3ek3mP/niRZXGO54gQg2UMqOnxSO1C8glFYXfEIi06mFNMRGC9m84BRBvd9o00/Wut5PYQTbAMDBHqtWiwikhuDwmXgDg+0rigrJDl9fI/SqOORLfYgD7vnTZzk1R3iRJQkBnT1qSyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121032; c=relaxed/simple;
	bh=NdoR2dUOz+cvRTVp6dzp5eO0K7yE82vTXhrdPrgb+7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0tVGtQdUSumjsu1kajSr78/gKTIb2kNw2P9VbeNWYHSSzuMhIHc/nGlcx+eu1+PxkEG0IGCoumqn3cvs2mg52eWxsmBs/ymz+/RCEZeLvbsJDz3gWEHQ/WjCqQvG+yvT0dt9hamRRlpyLE4nG6lb9TBGNWngkzaTBh3r5VNQLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TquLqj9a; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TquLqj9a"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-306f36df4feso186961eec.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781121031; x=1781725831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AE+2DETC16XLEWZxUW4XVA4+dACVsOVOfwIUzPMRy7Q=;
        b=TquLqj9a3Y8qCGW+oxPw2IUauU6GdiR+/BPbr7wSa9q18MaQL0XoM0NQCVP6KcU1W2
         GqthVJz299q23fApFLZGeLXpgl+e6oO/dWpo5j4LE4HbQaXkN0dp40I4RYSHbbZmDpwK
         GlP+BPCuEjG5rTOt0iAt/nz9PKy3bEGTLQVfNALxqYB8YrBaqyhW97H1mCE1TdILEXbN
         /Y4lhOoG0eZn25sR8iIexmP+xHDfgjoXTmNYanDsnNEQUzHT0dBjMUfgfOOHPtcMmVcI
         lnnsQTJAALFxqyaDGbpUf7wSz2/KOM0z/jnsoeRapHA/XU/j+/9NtkAccMBiP8fvN/iF
         MOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781121031; x=1781725831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AE+2DETC16XLEWZxUW4XVA4+dACVsOVOfwIUzPMRy7Q=;
        b=LmUIHHZZCCTzd7O140UKtTukgH+lNR7G551f7TQeEz9u0+7b3RiktoE1O788WuojcC
         JP+G6Bi3A6/kKaJghlJbj6fxkPELY3t1e7I7b5flJDMCLRGHpQL1rMju3Y4j6ubmvARa
         cmWfDKUH1uvuH27Dt4WxGAi9sHpfHFvJqZDOI0XefAVHkq4sP3CuwMICfSmXBjWphmlN
         bDaiFY/W2w8YJY0MjMWsVQXjS6m0g29XSxD7Noj5uAWKZqUqNd2LoSmY3X/L0qcYQeW+
         P66Ph617H3v23x85s61p/lePLWDqviKmNWN/b51qeWB3BEBiUcDEyZlbc+2EzhTVhVC6
         qIjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/259Z4JH5vkHPeHJ/Fb2NJtsRo/j/SETJr7++g8bZrQpci7p90eqVM4vLV+pE30CGK1wP9wtioHE/@vger.kernel.org
X-Gm-Message-State: AOJu0YxP2+PUkOjnC76zst7d1+x9SkfqFdfUUcEUZusHDO1FXFoSIrdp
	u2C8fTD+zeHBJLQcg6MSAnXMAdtcVNi+dy+MGYn7M5rrQjljfCRE2rSy
X-Gm-Gg: Acq92OEpiW+OZl0QYUS4W4X8W0oLj+dxPqPN2ktpLjvXTv89vXRLVfv0vq21FdkSci9
	bcZOYjEtflU4eiqbrG2JvzjT/0SO8JIYYbw5GRsPNxK67Wr9sMklz2MvG4bgz3l1IRGBzWkz0j7
	QBcrUpShPC7ikpZ/6fVhFd3MXjsDLlnKR3o50mIoK++FkfI34Xe94x4a9Mn7VfffranIt07MN7F
	hoQuXrDGVmXtoN8A6me7dRoZC7TgcFnkaW7eSGmqzs/N/Purx8wP35yVasxBhcNjMTTXDZn6FGK
	OPjM4V7ebboV7EDkTzALPkzxERk7GXGpYgn13gU9Z7yZkoZdxpr63HgcLnTsvFb/jP9xTT+/wQU
	1uLo5OQ7MjbS5CWg+mn5N58+r1mzlZO4QUC1j1jB+CToP1q0y81yKDfW9yGr5dWhJZ7Fkco/LUP
	qlgIM0pDGty7tmRrO05DwkZI1PC8lheTEiYJFuP7bFnN9tkQU=
X-Received: by 2002:a05:7301:e0c1:b0:2d2:d5a3:e97c with SMTP id 5a478bee46e88-308015d8c77mr47705eec.12.1781121030827;
        Wed, 10 Jun 2026 12:50:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea8e76sm25662344eec.18.2026.06.10.12.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 12:50:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 12:50:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v11 2/2] hwmon: temperature: add support for EMC1812
Message-ID: <2cc27856-725b-492e-bce9-f1208a89fd4c@roeck-us.net>
References: <20260610-hw_mon-emc1812-v11-0-cef809af5c19@microchip.com>
 <20260610-hw_mon-emc1812-v11-2-cef809af5c19@microchip.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-hw_mon-emc1812-v11-2-cef809af5c19@microchip.com>

On Wed, Jun 10, 2026 at 06:19:47PM +0300, Marius Cristea wrote:
> This is the hwmon driver for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family.
> 
> EMC1812 has one external remote temperature monitoring channel.
> EMC1813 has two external remote temperature monitoring channels.
> EMC1814 has three external remote temperature monitoring channels,
> channels 2 and 3 support anti parallel diode.
> EMC1815 has four external remote temperature monitoring channels and
> channels 1/2  and 3/4 support anti parallel diode.
> EMC1833 has two external remote temperature monitoring channels and
> channels 1 and 2 support anti parallel diode.
> Resistance Error Correction is supported on channels 1/2 and 3/4.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>

Applied.

Thanks,
Guenter
