Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A833D2BEC2E
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 19:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781120801; cv=none; b=aVW/v1Dhu9pX1F57gYVkf0QWFIFtYuBvhoQlKds3EVnGy+YrdXQ/C875eC6Wv99UTIplROhNkUDdToRbAMe66jojxlw7Si2V/xy39JnfEaMTAaqPjJeFVD++/vhjfLRPpf1iKXX2RvhQ31qBJq/vDBMwvbWyai5/ZvRnOAWRjg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781120801; c=relaxed/simple;
	bh=m/D3kjV4WCE7YLF5e+ZTCyvD2jFMdM1MgU0t8CDjh9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMOXbOzIclmWXVJEyNZ6dRYABey727ww505h/j3An3HuzegAfgiqjCIyAIrNiXZ+bIO/7Jclnsy+LxlpFDxzssHYouI+hfclJOYeiXsEPaCxV/T470qkbaSBO8DpCehsQfqPHQStSnEJsoIFEkMYBYAErRM+hRUE+Oh0qbxnxU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLA/Tegg; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLA/Tegg"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30749947917so3819849eec.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781120800; x=1781725600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMJUWqbBGFmtLXG0IOfebCL3RCb5topHpC868EHhG7A=;
        b=nLA/TeggiAU9eKzYh8N51z+wK4JRJ/H3UTj6GR2U3x/Bh8iqhqxQfKMXPj/1Qk2OsG
         7EkfzDSTgQWLW5G2if4pU8eWbjJieyscB2FcEHmuoNy1IIAJjEOJQKGTzAZUSKQFupJa
         vnMi9qJmqb/owTp4UtuSlD1ygdC2k2R6DvBtSCkk0k5Ke0dmMS7aFo2Erqv7nTcME8Gd
         SvZmiSKspEq/o2W/J2Wr1mqyTMAdWBSvHVpgL9Bg0DvSGsnR6SswCVE9Pm0lInKgbxdK
         fNPGpZZrRsHTEOvqO+jPE/yo+DnZX9apnvkyD2Q8LmNPBMmmAer6ogCzAoT35IXB9Tq+
         nyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781120800; x=1781725600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMJUWqbBGFmtLXG0IOfebCL3RCb5topHpC868EHhG7A=;
        b=ILEXUCuUvxxOx2w/yYmHEw6IGXT3RyFWsdv8RwfW2Y1fG6KnN+dD4aNth3rouM9RdQ
         Be5A911jiYy4omER1Zxhchmk3QnFvZXwC3mCVswjdFmxVC+er3ACIgf4uEUzgU2arPRq
         hytJr4pjzjHrY43aqCH1DdEMkZ14Y0mQeHQS4PsUcOpGtsHHsqu3nk92uKiyHq5deLCw
         z/zEEoG94YSvKKb6SJCa30zBXWcx4f2jtA1x3vFds4icvJe608i6QJrEUPbN9C/rXT2J
         R5kAsbysEbtuCgMgUMCvWHYC5ZTCPDKag+VHQmhe0P8y6Zu4FvOz3ABjUq5zxspNOetP
         ITXA==
X-Forwarded-Encrypted: i=1; AFNElJ8qSK6jZkJQtt2sDks67RP8g/hY9nQ8Mi97RT2oaVhv5EmhnFSUiP92a4vh2G48FlRKxh8zk3/MWMdq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Z3uiSw+6jmHZ/pdP6YO8B+ywCf/KG+m0khdGes24OPy1I9JU
	Pq0MyOvw1U0YkKVa6GXnhnvDIygD1iZJFv4hPy5jQbQ2YDzKqF5UBdXN
X-Gm-Gg: Acq92OFXt++gqeiMFhLVeJgNonI6e1TeQRx1oPgXnLSKdRQRbDoMH7PN6acwwEFeWOm
	lY+on3JuZ2T7JxMu+q3Pbt09PT3LGblGpLl0F3aQvb3rwcya0Bh3MQlpGGOuhZMUtuIVzQeWHk2
	bVhjJ6NBZqEVT15IuQJmzBRpsGjS18lb5Zy4kWOPyKVAbqh+r2nT3hXsUD3uKWCJ/TZMW9bNapu
	Y2pzgcC9xJo+p3/QPH5YX751KEm2q0dkn8NOWaCDB27xTUPuOfzfD9w+S1/HFOI6af9Io/x9plZ
	eRTHrMjKNM/ATSFCqvzci7klIWSfluGfaYgbROCbT1yNt8OKVmSj+KBB2QQNZFvGb6tXk5eyOd4
	YQGsNlnqjwrblW8YOAejpUM1MaAzJPEX/dGbawZiBE2eYOcDnBZbhoYlOHzfZs/pqaS5SglTI/2
	qsHvZMVMCSay5X0a3xjTxcyHjkhBAga6ZymEyCBhvIpZDqKYo=
X-Received: by 2002:a05:7300:534f:b0:304:b15:17d6 with SMTP id 5a478bee46e88-3077b357e93mr17911170eec.6.1781120799634;
        Wed, 10 Jun 2026 12:46:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm33615378eec.8.2026.06.10.12.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 12:46:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 12:46:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v11 1/2] dt-bindings: hwmon: temperature: add support for
 EMC1812
Message-ID: <88645a7f-94b1-4c78-a7da-f644c4f3d84f@roeck-us.net>
References: <20260610-hw_mon-emc1812-v11-0-cef809af5c19@microchip.com>
 <20260610-hw_mon-emc1812-v11-1-cef809af5c19@microchip.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-hw_mon-emc1812-v11-1-cef809af5c19@microchip.com>

On Wed, Jun 10, 2026 at 06:19:46PM +0300, Marius Cristea wrote:
> This is the devicetree schema for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family. It also
> updates the MAINTAINERS file to include the new driver.
> 
> EMC1812 has one external remote temperature monitoring channel.
> EMC1813 has two external remote temperature monitoring channels.
> EMC1814 has three external remote temperature monitoring channels and
> channels 2 and 3 support anti parallel diode.
> EMC1815 has four external remote temperature monitoring channels and
> channels 1/2  and 3/4 support anti parallel diode.
> EMC1833 has two external remote temperature monitoring channels and
> channels 1 and 2 support anti parallel diode.
> Resistance Error Correction is supported on channels 1/2 and 3/4.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
