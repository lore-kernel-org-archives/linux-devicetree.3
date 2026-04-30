Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47C942EEA6
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 17:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777571723; cv=none; b=JqiA/6vtJek44oh3H9ylugz+zr7IjgmT0nvotS1AiIpkPo2KrdkKOdkKzrg+IbA5GsG9y2SLlK91Cc3BHOBq1nTa0eTrar1zIeqnhrsvhMM8hLlPg/V0HhoTHFsZGvAuFzQrXsSQoyTyLVoEstKGMSeU9uOROC7uvUnWkADeC30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777571723; c=relaxed/simple;
	bh=ipKUp57GyoRW23THF7J1POdt4/WFPMNT/SoRXwdqPnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T29uKz2XNcdt+jZQ+3+2Y+GDGaA2mdUbkLTS0I87X2GUTiEJX5OW+WPQ4eVFQsmJ/bpxIDmLCoa8QLCt+zzm/8YNrP9X1XrbKcFvDmJ4IJT0bRlIlaQO0fL0dsQoY0bjl7BscP05xOH/KUGmqW0hC85371/EOBKne1ei4P34ItU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLCv5u4s; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLCv5u4s"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82f4a53ae20so871859b3a.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777571721; x=1778176521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IcSJbY4/m6vzsR5njH8V/sOHCSKFEcfIX9jSdaOTSk=;
        b=OLCv5u4sOa6xGMfSR/riRqc3tnyoACgt7g6hTcus/op6gSxTFVrWfMy/sJi0ZI73pM
         q3ntHCbXQJIdS9XzSz/CAeL7Tk+c/EP2xVQfTY5oGmuUJbq4MkOoIqoupsvU1buyqfeg
         mp5ZNFk1UpSYACA9psv4MWBn6iME3e5Lw5SUwICHRNFZU7hcf/h3mhCPT8xLo6TULjgE
         vo5fhJIVcMLxXu/PmlnGq3QjF2on1VRBEAfLMSCgaOSFVSNPNlbfEsK0kdohZgVdnM8s
         kCRgQCWEXnuFP7/1ofmho0g22GYrP79XQnBVz2Y570wM7J0QKxqUoEiduoTv+5OLEE0V
         4WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777571721; x=1778176521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+IcSJbY4/m6vzsR5njH8V/sOHCSKFEcfIX9jSdaOTSk=;
        b=msqRHLRdQih4QwtYD3xJ1QcC4t7gR/G1ecJ77ezPJZHLYP1k9b1LyKK2wtPc7g/fjc
         GSBP7TDmbRA5aHCvqHlpe60bMXXEWaJJ0HUzWs8HeSCXEyckFD8/KVOO6uqKIgjndGff
         Ta9T2M8D+XdaqrLaBDfaLPwTgSQjxNdOoJk6DjQloqyMvAhy4Jsnyc3lmsTZo1qJbdMq
         hrWiNhBnpXvboyB2Fy87PEqGmo2ZWLq6LzWx9wH1fPdFQXvkFMFDNPVWnE0D3A3QeuwO
         8SljpxBG3aiZYpO33GMa+b5oq8vJxBrqTxfUvb/MwcqFjWKcoxRREbFJzonKwUxxBpFR
         yWfA==
X-Forwarded-Encrypted: i=1; AFNElJ8SthsPClUgrXXiU8eCSumbC6SavVPXxbKVJ4XRicn+C8LuN5PYZGY/RtC+eQ6EHg9IRZLHaGq98P/V@vger.kernel.org
X-Gm-Message-State: AOJu0YxQTBjzILZEIeVR1zc4Q7yJLX/qHyhcyFwS8QozY9hJmEOQ5yLB
	vK2Z29MJHYVLD2APgnI8RkQzlKhD+gVlEstDk3kLls7o2grIZFVY9Swx
X-Gm-Gg: AeBDiev/d2deQ5RL2+X38O9CjdeLrtuQnZE4PRLUalx7YkKVOcABbHoy2/rHFUCMoQ6
	Rexl02g8Wakad8dPmZ7qpluPTDZlByXbgAOVcOagauScCNaPTZUwVr0M2KApsCRuCkgHbvrpyLT
	Dqz6zaY+lJB2CMQK9Ovk9UhD7m9IhyCBf7CEq+UdmVqUwUhbBHhkphCWCBQm7EjdfJTLkpgZYKm
	TdA7F0gFW94vWOtaJOE9FIafsJc2k8QfVfiAp0GJJWTyEOgdtuudc74F0uZPW0hHsPZssThvlYR
	TPHHIR+yEbZT9IVMYaSpD77oAhiIql6s8F16v/mcDOSO53Lfsu06BitXubEpiyYVxQHJJRir5h5
	tRDBjoabx/uo/b97axBsscrLCCZ+iqkmBCUTnTwtmsES8r32Vpd36DLF1DWmxhHuPAQx1Dq8+A/
	ph2L7e5hmZHoP3Z1ALxGgBTFB+8QUEhgc4qCHlVMdp9CFFgLA=
X-Received: by 2002:a05:6a00:e08:b0:82f:8b20:9165 with SMTP id d2e1a72fcca58-834fdc6d2c0mr4706115b3a.44.1777571720927;
        Thu, 30 Apr 2026 10:55:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351582ee04sm256974b3a.5.2026.04.30.10.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:55:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 10:55:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/max20830) add driver for max20830
Message-ID: <63e770a5-1740-4144-9c5b-929fff8413b1@roeck-us.net>
References: <20260417-dev_max20830-v3-0-0cb8d56067aa@analog.com>
 <20260417-dev_max20830-v3-2-0cb8d56067aa@analog.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417-dev_max20830-v3-2-0cb8d56067aa@analog.com>

,

On Fri, Apr 17, 2026 at 04:27:14PM +0800, Alexis Czezar Torreno wrote:
> Add support for MAX20830 step-down DC-DC switching regulator with
> PMBus interface. It allows monitoring of input/output voltage,
> output current and temperature through the PMBus serial interface.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
...
> +
> +	/*
> +	 * Use i2c_smbus_read_i2c_block_data() instead of
> +	 * i2c_smbus_read_block_data() to support I2C controllers
> +	 * which do not support SMBus block reads.
> +	 */
> +	ret = i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
> +					    I2C_SMBUS_BLOCK_MAX, buf);
> +	if (ret < 0)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to read IC_DEVICE_ID\n");
> +
> +	/* First byte is the block length (including itself). */
> +	len = buf[0];
> +	if (len != 9 || ret < len)
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "IC_DEVICE_ID length mismatch: reported %u, read %d\n",
> +				     len, ret);
> +
> +	/* Data is at buf[1..8], so null terminator goes at buf[9]. */

I ended up checking the kernel code. As it turns out,
i2c_smbus_read_i2c_block_data does _not_ return the length in byte 0.
It returns the first byte of the actual data, and the length as return
value. See i2c_smbus_read_i2c_block_data() in drivers/i2c/i2c-core-smbus.c.

So this can not work as written. Something like

        if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BLOCK_DATA))
                ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, data_buf);
        else
                ret = i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
						    I2C_SMBUS_BLOCK_MAX, buf);

should do, assuming that support for I2C_FUNC_SMBUS_BLOCK_DATA and/or
I2C_FUNC_SMBUS_READ_I2C_BLOCK was checked before.

Thanks,
Guenter
