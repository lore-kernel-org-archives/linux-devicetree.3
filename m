Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FC540626C
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 11:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786621921; cv=none; b=gdsYo/G0JyLA/DjjZuDCjEhJZ7KujM1Z9Haj6iW47ITYoKsuxGYiLic4hXJTlVSO7E9s5McQ/NSVClm/B87QP0oN1nOrwGYiiO5DSesNHGjGLTFFB5/2zf87ewliCvIQyFZlN3vc3jzGjrYeawkCHVFhudKDgKry2fkOiAhBfjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786621921; c=relaxed/simple;
	bh=p5pHnp+9S5RtwcRJ0lEuOmNMxlIkwhV1p5+PO2aBxtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k48EPuQpB6p2xIeXfoU6pPEtm+HCk/euULqdgXc4UOa5WuJou9VXtlcucjb08/E8vYBhTuXFPe8TTlDOqia2kYewVJuZE8HB8tulUPygOweEsykzAzVz3mNnx9Th/64annDMqUXDAWdCsDHEIn5iMv94JK6KTMqg2xMEckIBXNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRqf66st; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRqf66st"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso1879859b3a.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 04:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786621918; x=1787226718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=77d+xiviSlKsXMp+buFtaLWBATIvyNaSwPxIW6LaiDY=;
        b=nRqf66sts1+0tfMuVTlmKTNB/crbGihO8meACX4nW7w6Zp2iNvx4ol06/iUN51jt1h
         A9w1ZlpnTRrhUYurIEaquDkHdj8Kv2Fh0a8/LZCFj7pOyW0e/0F/aVIviHM08kxFLO8y
         kycAsq1sbWE0J8CeJpdGNZN3rRar70ojZ9bbOdx0Pt0YhF5SJb9qoYNA/2ZGstEqguSx
         OWlkFTKm/sbpIBeECzwbRVm43mGwwpKcTpM0SIpJ3zjT70RWKVJu0n4/ZNWOFL2SVfAw
         QJNlX//Kk0CHW8oXZ5KDWZia8vlxWpJGy5ycb8M91/tJshhow/PYFoaRR3yLZ9Iqbfz5
         vEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786621918; x=1787226718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77d+xiviSlKsXMp+buFtaLWBATIvyNaSwPxIW6LaiDY=;
        b=iHU0FxRkL2sE9VPa+e3dNR3D7XV7OUzmG5HPMLYYqVi/5FtNGl5a6XByHNB7j1/4N2
         3yvPQEKVxr0Y0KFdp2GAFs1UuDCyhO7BDMjtvShLMchzLKpKlkhF2cW4MHnjjsBvbh0P
         tUOv4hiAMsn5fnID7z9M+n20U0MkJl1jVIR6eMp7UddSk5x/s4Ik9J1A0xuniRly4cPU
         iRdPBH4ByEY5i2kISlHju+mhnUbZDuDrLBnvTXybbOlykHKF5BKxraeYCvlPyXul+t5V
         dzCABgZkJFIuenHzDC5anF7gjeBM4vzL44Pg54C43mDcGIkIWYtElZZAerjBmcaCQzM6
         CcXg==
X-Forwarded-Encrypted: i=1; AHgh+Rqcoh4sVHOLJ4ZS/hleNns9rLNxI2j9an9uu0LuB61CQLh0nswiG3DGHOEHGsnYPST2i9KGum3IiMEk@vger.kernel.org
X-Gm-Message-State: AOJu0YwKx05dd/lqTb9Ifw08d9Hi57D9pZM1v5m+xZfsS9CtmaI3c01U
	GMQvlx0g1xa424vSKfoijPGovBT6G2r5yMKOugou3ENPzvsJzhj4Bgt0
X-Gm-Gg: AR+sD10tPu8Ukcn+A+q2hweaca68HRvjZo5tuCfjTJeFEEvdnWDyVtTzM1KOFt2gV8H
	vLG4pkBAVoFEoqxeflJ8AUT3zTLHdoH1GWCbJgNkEmrDUv46Gds9j6Kb3vyhutHeXGyfnzWpHR9
	v7TEbVTiAmkwFwMsoYL+F4osjcPpSe61WlLWLieGhA/qHgFL2cYoepLXgggtzW7MljSBGGeQUDX
	soc4TWXwl9ThuroQLw1K3XHogzoPp9Yv1F4FLg016sGu4AuT3JntXwULU0wbYt0KKQ67baQ78JX
	tjWpfy6xe4gtcPNSGoSJk/sP2ZvrKWp6f2qquf8zFosPdQl7L21GYF85ugz1HoBMmqgMIbMZMwL
	Mf86oviBWByT7sHeOkrBYBH1EOdmJLP2sdJYacN9wXydhWJWuKmepYtkuFCzwbV4I6cTbm7bb/l
	ylSSrD0Y+huHRY/Y4/EA136llWa7L7Zc1Ku3h/cCQC5nRy/f6HFzWgW8qu0rgcrqXJskiAqhqRi
	2cRXpwg4WBI
X-Received: by 2002:a05:6a00:1889:b0:84e:1da9:6a53 with SMTP id d2e1a72fcca58-84fc75c3fbfmr4525895b3a.19.1786621918169;
        Thu, 13 Aug 2026 04:51:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc4566f8csm750421b3a.2.2026.08.13.04.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 04:51:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Aug 2026 04:51:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (tmp102) Add TMP113 device ID
Message-ID: <1cf0f701-e52d-4adf-91c9-e6b1a8753acc@roeck-us.net>
References: <20260813090456.70816-1-marex@nabladev.com>
 <20260813090456.70816-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813090456.70816-2-marex@nabladev.com>

On Thu, Aug 13, 2026 at 11:04:24AM +0200, Marek Vasut wrote:
> The TMP113 temperature sensor part is register compatible with TMP102,
> add non-DT I2C device ID. Unlike TMP102 and TMP110, the TMP113 does
> have additional unique ID registers, those are currently unused.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Applied.

Thanks,
Guenter

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Flaviu Nistor <flaviu.nistor@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/hwmon/tmp102.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
> index 26c461e95175b..50a8b050d8da1 100644
> --- a/drivers/hwmon/tmp102.c
> +++ b/drivers/hwmon/tmp102.c
> @@ -397,6 +397,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(tmp102_dev_pm_ops, tmp102_suspend, tmp102_resume
>  static const struct i2c_device_id tmp102_id[] = {
>  	{ .name = "tmp102" },
>  	{ .name = "tmp110" },
> +	{ .name = "tmp113" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tmp102_id);
