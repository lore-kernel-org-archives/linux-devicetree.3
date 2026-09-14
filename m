Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFE3494827
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399628; cv=none; b=gcUGZcT6BZEEqSqqbLGaV2HY+e4D6ozFCGwdS6Xr5jPVpzowlbQutNr0hxdRM/03uSGGYFKyWzQWP7yWOkKGXDPMipNmoHm3DHTcKnhPMzgMcX90lxbm/jOXLYB781AS1h2vvrCpeOeL54l6Jx/cuj91eRUTthpk81epwkPMsxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399628; c=relaxed/simple;
	bh=VzeJEVXSydd4pMUvk9yqOjcNxVq4nwrj6o3Y3f+o2kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToRU8xH1JF6ucPB9jh4r3294/5obfyZuJaTk0iC2eky0aqrXzimLPqTwd+hiO/Qp8402Um8cuHEgzO/DyCLFuDT+7alVOcuHNgWYm8YdpblYFCliXAICNMQH+46pdbkhvdH39ld6OYcCDyM9S3AxKKJhKAG10GT5XIJ+vFjBF9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oKmjJgsY; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oKmjJgsY"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79fbso12859485ad.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399626; x=1790004426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1rv9xIW83dIFufmAMVUXAe8Zj75CE5o/0qI0POtGfBo=;
        b=oKmjJgsYAj5S+Yp+SBg9vNCgkVaENatjOEuHEvv0VwlTi9wgFXrLcv4pTT1N4KEYPD
         0IUmh3kI7uvYkLF58abHh/EYlrro9L21HPJeOcjKN4oz8G/Xz29d6lQ/L1Y8IW96HKeX
         fl/8Vw1PRwfT4q57qc8T8NU2n5Y04tasuT3tYJsWvcpoxk3nb1aA5pyi48EjkI+395SA
         sfOi2JXSF5O8yfqnqN8ghtfJB5HWMs5J6sWgfbbQgzDJAOIUtDKb7sBaC1wMNfU0PcTX
         IfN1ZHLDFCJZzB1LG2D/O3ILYk6pQFgmW3qalP/sqRsQU8GfSKA+OeLKs+Rut0Xv44fP
         wg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399626; x=1790004426;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rv9xIW83dIFufmAMVUXAe8Zj75CE5o/0qI0POtGfBo=;
        b=pVkoJki9a8G1wwwrQg8kGqiB0SesmUlgXAgvpQ8GTdTuy9IO0o8Ji9Urhez2trhTQq
         kmrSjWOWtCrDIAHhRti/wi72RK/I+ECH/c+hOXWSfAGZO+1jOfPcY2ahL/kMC0IgNXkO
         e441QwZvisS821trBZ3Ipx0/EDT4CvNwr8w2ziGBTQF3R66j80jd6Hc+ATXCXH0OEMcM
         8+rM7CusZA2NTks8WpupMKLuUqpCik346QGWPfa5wayA9l81ZUi5ShOKJ7NPaOZjZXDu
         f/jgy6NaEmmqJ7Ud2Vtw6/ZeRRblFR+5Efo5mBpDU8KwAy2lASGXqKoriftplDXzn+ia
         XFBw==
X-Forwarded-Encrypted: i=1; AKwUvBxKGvRAHuS4p5RUkplV1M4J/KSvt+/BXX0EqGvJPWXEZxl1bfdPps1/G0qInR+joTX3MNY8pGSC/8Er@vger.kernel.org
X-Gm-Message-State: AFuF++kcrvRHzTZZ4v5p3cpZ2NxwaeH7lW9xzVtOl86/3oG+MkiTTAHM
	TUL6Lg/N8TaAqshGkT9y7vnJu85zZnZSAzX5utTg1Tvusg3/rtltUxlt
X-Gm-Gg: AYBFou3eIOPf5K0+/dIMpRf1yXDn84Yl7WAaCh+7HrvIedEYq5SGjbriWcxjp8xlrbr
	VSWkQ2kQeWMdx1qlEl54x2tauQ0tFo5dUABD2HyI7tEzNXrTPFZAjxJ+cUO887MZ1zWuYcGQkto
	ed2ZY+NKGV7Y33qlCvMXB5f+CWRlYa35TF2KQcVjZ4woAOvHpuz/ddC2PvIgQHkN2dRBvvd1FeV
	vOzs1ewkl1dTY+ZcI47X/IWyLoyyPiKPzS5wxWA6kErlJng3JSEy6QjiR8E3Ka3CWVmHeb3XAcN
	5JHNuLkIAj6MR2mbox11qVMteTyA2ZSsSY7VL+SlGgID/dnu/r/1dqh7dEuPY8X7tJDKS3oYWWe
	99OhugXrOGrFjDkHU3EhxK1X8JObTBi8U95ZtvSGRs76+zB4YkJHuqsegM5mU+gMMIYu0PbHk8c
	CtJgXCoM8lOGm0LxJHIDm1upW04QGJxga7ZUDtSpAqvdvQbs5CyQpVjxxkRtBEazJlaSJ9qRwr/
	PrfzFP733iD
X-Received: by 2002:a17:902:fc4b:b0:2db:257c:9fd5 with SMTP id d9443c01a7336-2dd6c70df7dmr77776255ad.16.1789399625921;
        Mon, 14 Sep 2026 08:27:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc56b1sm51774945ad.54.2026.09.14.08.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:27:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:27:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: hwmon: Move LM63 family to a
 dedicated binding
Message-ID: <f9a4679b-52f3-45ea-b451-26c27dbebf1e@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-2-b44b81cd2c3c@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-2-b44b81cd2c3c@linux.dev>

On Mon, Sep 14, 2026 at 04:03:54PM +0800, Troy Mitchell wrote:
> Move the National Semiconductor LM63, LM64, and LM96163 compatibles out
> of trivial-devices.yaml and into a dedicated binding. Describe their
> integrated fan control and preserve the optional interrupt used by the
> ALERT output. Permit use as thermal cooling devices via #cooling-cells.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter
