Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400A641DEF7
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163545; cv=none; b=quTqF2UDYB/kJWfx1Lr3+ZP1rF1qsg3+galiXN7gn9kL9jrkpqHPAmiB9mpIiJNyHzJEBe4Wy6IImj5Ex1hpL0sCxWAkIcDyRVZP387eLjvkZ1HQtdTCDka4kcNK/w8qyNXHtF8c8vek2P8ys9JVnb5cpiIdS8bIKPYYeJ0iJkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163545; c=relaxed/simple;
	bh=TRQNemJU0zS79g/J4enfOrZKplEZddMF1OAmtUzc9ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juTs9uPxV325xKqG5gRGV+lJyNu4+hLmOJK3+e3Yw5UkZsBfHs+L+VoexFnRTC4XM9n01V7iT91Bl5gQ6UaOi1pwBXHitrtoK56UXHmCCHDHPNLNo/++GryhXCgqVG6qRAcEpZG4rtYPszbBjscUPfg8UPdE1W8z7pkJOu3gqN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byWA0BWv; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byWA0BWv"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso1643456a12.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163543; x=1785768343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KAGgkFqzP96xx/+bNop2DzU5y4t0TVlGWAhIbONjPIo=;
        b=byWA0BWvGW8fGgI091FdsEcrFvt4I25/Tpv9v6UrJNzLSxcVEnBJ8XSpHwdt+rZj3t
         75EweMkNDF1Jr1+sdGRahEmpveHG485EGMs7VoK1Kh5byEhwH8RkLpBQWdOXhsgc2oCe
         1ee4e0ou8x7gVRwluWW2I4RAxKCgKOqv7qVkW+S1f+5bLldeUqZEHUZ7P/lmq5B3Pk0a
         AuyQgevhQucNkqeXjaK7j/m1ZbfSu8zUpBgT1zOvFjRz0VVnmj6cFuXGXqhAHVoxO0BN
         K/1U53PK7xeN5m5y5jCudZ0jITVpvO7gjWJ76iSNAlemYGEkYWce0whtWLyfFS9cXut5
         Bj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163543; x=1785768343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KAGgkFqzP96xx/+bNop2DzU5y4t0TVlGWAhIbONjPIo=;
        b=S0dAWUYw6tzmKJWAz33gjsrucC0EKJDUIGOZ8iof88foeEuuY/KI7ZiepRu8cWushz
         tFhmZmm249ikrez5Lv0VfPQ8hdxE7XnUG4m6nbLjsu+aQEOmc3DCD7EH437yFDHb+3nc
         oWeYEGR9tbV1gofUNSC1z+ANziFh7xab5xRWjAEtJmGmtF81ku9YPqVedfVj7xilHvEF
         dSjk+jd/BR8su3WwLJGZBPGK8GQpHWegKBPd7p87RW4i8HWVqARwKLywVwj8L6uxcuBr
         ub1F1VcCi5rCkDo+Il0zcCwzndiIxnqH3EfJHeTQygLpKwyRrvIRpa/HDB+/GZvH8cPn
         0Bcg==
X-Forwarded-Encrypted: i=1; AHgh+Ro12aDPpRYT5DxFDsEIuSN8rwHqHgK0KfPxlR7AbS3ek2a+T65ApbRCMhxAE4uqV3105BMqh5GcjcBc@vger.kernel.org
X-Gm-Message-State: AOJu0YwSeouIAkicrhjfY/tslXUQh+hbsF6tdwzJLgyDJfn9ViuyLwQk
	x+ChGzZ90r/6MlX9OF3Kig/Hq/cvAQjJ5rfFKK2iGBJV750MeASZ40pxAolQug==
X-Gm-Gg: AR+sD12of71EV0s97C3Vm95YFCAD/zDpIkibIG3d/cjOU6jP7o+cI0KRE6qfh38Y9GR
	GcoVOCpMX4F98yM75E399rZi7Zcv4+bi6xiKqrGKKcHT9aFwB/9CaSi8E3PElJe8gZBAkpce/tQ
	5PoVeg9tbOZcOL/E2V3HJtzrRb3/wfxr2mPoYy3zxY7N3+uvr18ooxopPGAHCpN40pcYejz8Zpl
	yGwwq4EUrnif0N1jUJ+gFaqvUAt/tex39SgKOrv1BGgohNx7qPtyCEdzibJJeOf6XIFCh7A/eoj
	C1wIqahC0nb8YsuPZoif439hK/nYvHwD1rnphR9GGYXwO4ULt9K4sAc81D2C+pwVzngBRI6P6QX
	pg5z9DmPw6FRwWVDo/qlDzbnEZKoC5ZD667KTvjd6+ncHMe/qSgqugoaCvl1hvVRiRR0RR53k5q
	2Ssz2MGmLfluDY+E2xFtQlJ5AvVw==
X-Received: by 2002:a05:6a20:94ce:b0:3c0:9c19:659e with SMTP id adf61e73a8af0-3c67e00cac0mr8474498637.70.1785163543389;
        Mon, 27 Jul 2026 07:45:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc288a79sm32967946eec.0.2026.07.27.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:45:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:45:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	Debjit Ghosh <dghosh@juniper.net>,
	Jawahar Balaji Thirumalaisamy <jawaharb@juniper.net>,
	Santhanakrishnan Balraj <sbalraj@juniper.net>,
	Brian Mak <makb@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>,
	Dhruva Devineni <ddevineni@juniper.net>,
	Avadhut Naik <avadhutn@juniper.net>
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Message-ID: <eb7f53ad-f996-4e13-aa67-0b70b6e399bd@roeck-us.net>
References: <20260725211945.288415-1-sanman.pradhan@hpe.com>
 <20260725211945.288415-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725211945.288415-3-sanman.pradhan@hpe.com>

On Sat, Jul 25, 2026 at 09:20:14PM +0000, Pradhan, Sanman wrote:
> From: Georgi Vlaev <gvlaev@juniper.net>
> 
> Add a PMBus driver for the Analog Devices MAX16545 and MAX16550, and the
> Volterra VT7505 controllers. The driver reports input/output voltage,
> input/output current, input power and temperature over PMBus. All values
> use the direct data format. Peak input voltage, output voltage, output
> current, input power and temperature readings are exposed and can be
> reset.
> 
> The reported current and power depend on the external current-report
> resistor connected to the ILOAD pin, which can be provided through the
> "adi,rload-ohms" device tree property.
> 
> On the MAX16550 and VT7505, the severe-OCP deglitch time can optionally
> be configured with the "adi,ocp-severe-filter-us" device tree property.
> When omitted, the existing hardware setting is left unchanged.
> 
> Co-developed-by: Dhruva Devineni <ddevineni@juniper.net>
> Co-developed-by: Debjit Ghosh <dghosh@juniper.net>
> Co-developed-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>
> Co-developed-by: Avadhut Naik <avadhutn@juniper.net>
> Co-developed-by: Santhanakrishnan Balraj <sbalraj@juniper.net>
> Co-developed-by: Brian Mak <makb@juniper.net>
> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
