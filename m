Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58E4349CE8
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222914; cv=none; b=sTa6JRFxNYOtj0F3y46g2ctOw8bLE4P5LytDM6GelzcYjmhWs0pEsN2tT5aQ1o4snOLAQfmeLlQCD3yNuxeQJbEf6zkebVzwHzr8Nc29MFFVbLWnhHiYjEeq1GQ0MKyaScI/a1d/iDxW4hFGjEJTzRMqzFOzAtSZO728O9yfElk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222914; c=relaxed/simple;
	bh=KgZKD+EluK0sfJ94RDAUxxixgPsC7zCuBwgjrLJz1FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAfyS4WoRWtDNSpbEPDBZf5EHZMj9XNSV6V1s1q8A7UuNIQFUNHQJKq8eC4GgNK+M/zNPIm8nB/GFWHZommoBh3aClFnwlRoBruNalYUzXanJ200gOQKgjuhJQxxdMBO89Ts4tDnK4j+4Sr/G/tUKudwyvSno7ZnKW/PJ1Wncds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyVxz7G8; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyVxz7G8"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d942c7cc2fso17992505ad.3
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789222911; x=1789827711; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZekEX9u4dkM+nKRZ96Vifo/IB+ikfrYJWegpPxurD8=;
        b=XyVxz7G8frBAkuLTDZhqKlA8o7034o+uk6nUvm9Z+i9h4XyNTaQ+kRyeLhrlQZdJiM
         G8JlIAdETtZnTeAydqpTJB5ljemwSviMgeoqEeDa9Cj6ddVmh9GvnaDOP67UY4qfbiSm
         2dZSnnyAVK4MJDJltFA1m5OoEvdQtCVHBkl4GdHgYhkRvlhxLV0xuB8o9/96jICdf4d6
         jr1V3/Kx/xf8d7BlrPo3+j4ax8k3FmoAzPHtboFvxFegpjcp3QJ2nSGwQ1lSp71kQJS3
         ECblMT1VKNWM0bFpyn1YIAVnlC010XFT8kU7YRcCuOc1IN9kVvhHc0qUKFi0EHcIyp04
         IgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789222911; x=1789827711;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZekEX9u4dkM+nKRZ96Vifo/IB+ikfrYJWegpPxurD8=;
        b=hiNHMNzMDhDmadEyM+Hsrftekd8B6ckzLTdaU5mTpYsLMkYN+Bqv5QGIp2hm94Hgs/
         luqUb/azIqGih7xqc0KUSn1ErYNuhCujEwmtkxLVw2rGL5SA2+vHPLmculg7GuIKqv6y
         4xAD//F+1zwE7VF80gxbbg/AMKbUGsiMxyQ4pmyMYx5BLV7GBS6Rv5deyh8HKGkT0fSr
         qJGz1VdCJJavZ4OrC7A9BzUm7KdDnrOrJCBLqx01uMT8+n/5cebs5Uz9S2qfP39/P/t7
         qKDHRoyZGpJbd8KpuV/dDpnetL4lajS14JhJ99SqoWC9BWEYQVQwMBVIzFnIk0IbnUwy
         7uHQ==
X-Forwarded-Encrypted: i=1; AKwUvByVJBswODIVrOdds+MURaSBSXUh0vIOHNrs360Q1WRK44p+WBWD1dtswMtmxBsqaP3TePXWoxBqUzcT@vger.kernel.org
X-Gm-Message-State: AFuF++kfDuHpF+XYhF2eWJ0o4wV853h04+TyzAviQkJigDRawslrvlKr
	UbsS2wyzRyVjBi3jqKzmkbhaM2l9fHQU0atVcI2vgKrRHlCbV7Rz3W3N
X-Gm-Gg: AYBFou1irt0gzKDpT9zqb/TmKEcnWphkToo6v6k6nQKAnLpgDWB4OE1rYqNA2Jivu/g
	g5o8dUNGTA+rG11ZBeuzFxY++LvpyGkBx/vdzU8mAMjQNnvixdt3v8MrEEmqyxPM1sHRDR0ljAj
	ToVzas/uirMq71P7Mduw8jbZb1uv4/YyMrV2i9skufwFjQkdzhw7C1vTVkS3Wg8yfm5mH8CNNWT
	J1AsDZqISZo2Yg+0uZaNvEqIuVdoxKsHo1I5MZhs/Qn6n+GcPL3AEKnW4KdQfxFGxVJ61dz+fp4
	nqeVtX+KFaPBbATJKzVR4l9uCVvWmJMjDsSZRlPLz7xUYURRthIubTh+lUyVcaTwn8mwTNM6ez6
	ozlRNZ7Pl/SCuH3Tn2hOlaQlDUD1WGApR6CRGPpa+Vcz7Jl4WGO6nVw4xjQoSftVCanEImhqNjJ
	96zK7kKanjeMwk3giGZ2vanw1HjM+aNRs6Y/PvPVQqUfJgAOzGVEApZKE2LBOD9FbRGSnyCai9b
	X+UpHWis+qHyg==
X-Received: by 2002:a17:903:1b4f:b0:2dd:40cb:a054 with SMTP id d9443c01a7336-2dd40cba32bmr89839555ad.19.1789222911290;
        Sat, 12 Sep 2026 07:21:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd3f0faed5sm17625205ad.10.2026.09.12.07.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:21:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 12 Sep 2026 07:21:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: hwmon/pmbus: Document MAX20826 and
 similar devices
Message-ID: <c8ba0294-79bc-4b81-98b2-94577c1869b2@roeck-us.net>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
 <20260911-hwmon-max20826-support-v2-3-5e30cbd97d84@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-hwmon-max20826-support-v2-3-5e30cbd97d84@analog.com>

On Fri, Sep 11, 2026 at 02:53:39PM +0100, Nuno Sá wrote:
> The MAX20826 IC and similar provide a high-density, flexible and scalable
> dual-loop solution for high current cores for AI applications. These are
> dual loop solutions multiphase voltage regulators. Between Rails A and B,
> MAX20855B and MAX20908 supports up to 8 phases total configurable from
> 8+0 to 4+4 phases, MAX20912 supports up to 12 phases from 12+0 to 6+6,
> and MAX20826 and MAX20916 supports up to 16 phases from 16+0 to 8+8.
> 
> The output voltage of each rail is controlled either through PMBus or
> through the high-speed processor voltage-control interface (Intel SVID,
> AMD SVI3, Nvidia PWMVID or AVSBus, depending on the device). Which one is
> in use is part of the configuration the device powers up with and is read
> back from it, hence adi,rail-a-high-speed and adi,rail-b-high-speed only
> tell whether the high-speed interface or PMBus controls the output voltage
> of the respective rail.
> 
> Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
