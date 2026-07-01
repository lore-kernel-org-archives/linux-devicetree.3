Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FBC361DDC
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 02:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782874384; cv=none; b=KqebgNwf4sBUU3jregaDJlhODH3FS2LONG0cO3NWuYtL+vQDgxSBu5YfVar1jg7omo/3h3hPY6UsxHAJQivLrQcSx0MIQymVi156zMNMn1EtJAs2CO2KzXO9BwDsvQdU/M50cvD2f54MpeRupxVE58u+Hk09rl66peb/qAFb5Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782874384; c=relaxed/simple;
	bh=Yh3dhM3Obyc4LKQdaXT79H8bgttcpoxGufhn+j5RBYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4mjBvDKAzpg9yJWqz/vgQ07lJa10gFQnOmDvkEjIhkSDJ4QLjsSLjIfL80EKONx4vKha2xot9jN/hkp5nOVUacdQME6P++By1iTVSQqDWI86f9wJqkayOjtALp+QorECF+SBOp6KLabfmMcMUGxkPmw41jU900XddeswlrREak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbVGoD+6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbVGoD+6"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-847a69ba83dso70653b3a.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782874383; x=1783479183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btER22HlBJmTkrjtvUi1/5trK8wZBzz6RHBsqW0SMZM=;
        b=mbVGoD+6GsglowsewIqZAuHB9eXIEAqHDllVKPV6V5hPxORP6IEHAtMrt+cuUG5zX5
         nxVgddi1p1FAfoj0lcAnqv1szwatxcGFw3vrqy2z/0FboWCiddkJr0PKKgshY1NXbLZe
         HSolu/ee7Zbqxtgs6zJPai5eR9caTnRAHSD/9xE1QYIlRzHOP/CaqfxPk6jmJq2smyu7
         QO9+VKh3+oCmBZm+mEaJd04vFpltaY7jfYZ5t8fa3ZJWYLMiYfJbNcczQgbbxpbMFUT/
         EJFSlUW7lYfeySrF2YXjEhItdwRPszbYMrc1849PcBXRTEx4tZWrPYpyPUwkd/oDYqz3
         L+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782874383; x=1783479183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=btER22HlBJmTkrjtvUi1/5trK8wZBzz6RHBsqW0SMZM=;
        b=N4M/bIZL1lRqBkHPMUq+0a1Gir0/2GM1nIyenOvadMKruDZuqDIkmmwhUWqEU44/Dd
         N8EgV9PRDzEbkRdjfWb/kgCs4Il0YRGGsRh3Rzif/sjcXsLZp7q6+4M07EjHpkFzSPXX
         Lmo1oUNIVpHvS5afErXe5VNXiOesA9SoAnjl8ftO0eE7O/PWydyVzH5VA5f5TsWUFTQD
         v2aC53hI1kjUUDWT/OFHsxSmgrSMZZOHKE8yO77la1L8Vp+Kc1CV3tLEgjfUxhFcP9Br
         92fm4LPvcjeW4e3NJ5LcNZVHDQrElw3P2fzrCt98TQKPunhMerC1y6h1q/fL2aoAV+gM
         g/3A==
X-Forwarded-Encrypted: i=1; AHgh+RoybIYK4RSnGmJBacsRW4TnurRlEHCcgfMnOICKo9KIRNidB4z3fg1iM2mDXlbF23YFKuO/HtcGEl/N@vger.kernel.org
X-Gm-Message-State: AOJu0YxGqdyeuE2rctpGj4tnJai7zBaO9988hV/ducc/eAML833bc8Xa
	kPC1KTNer4vDitA8KQ2io2hpsYzflbjRdCg6W5u1i7UEBZy9b0mfPxCCMlrycQ==
X-Gm-Gg: AfdE7clfyeX9MCbyeqIWsSm6bhwnfBV04qutgprVZ2/DCdkEOg68xG7bShx+GZHGD+N
	XUY2LcXMz3iuek+QcjHh54Hk7Yg3l4Mc2CnIQmoMBqtciBJKXOoTiTihDlYk9Jhwl2PNEdBWZ6B
	KiW50WVjlHKGRWCdC7neWqfyixRODwRLl93rxPx4Clr8aa1QSG7a9YACZ1zwEyo5FJh7eR+XQ64
	PAStz/gWjpP++GoXVKxPIqAjE5Sfl+epCy1dB5VBAK4DOBLKN0Q3HYkWJTqYm9fPzf1QpcQOSlQ
	CLRzMOY0RkT3T/ScLQWLtwO27EtXw5D4d8atm7v07LHRQ5UHscad0ygAh4xSXVHsvay5ZqegWxO
	oiwpFX8U0P4xDQk4kpo1TnpwZ5vkOPLwRFBBrfkYx05syRIl9MXoRHlPUrkTQgkqKr0luT0Cvgu
	xF6bC+KuPSU6Z2VBes710i1cyRfA==
X-Received: by 2002:a05:6a00:368a:b0:847:8f8a:a055 with SMTP id d2e1a72fcca58-8479eec78d5mr5335555b3a.17.1782874383056;
        Tue, 30 Jun 2026 19:53:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a00029d3sm3080774b3a.20.2026.06.30.19.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:53:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 30 Jun 2026 19:53:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: dongxuyang@eswincomputing.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com
Subject: Re: [PATCH v9 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
Message-ID: <cb67d09d-301d-4c54-b04a-97ac4c7c4e84@roeck-us.net>
References: <20260630091040.1407-1-dongxuyang@eswincomputing.com>
 <20260630091220.1608-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630091220.1608-1-dongxuyang@eswincomputing.com>

On Tue, Jun 30, 2026 at 05:12:20PM +0800, dongxuyang@eswincomputing.com wrote:
> From: Huan He <hehuan1@eswincomputing.com>
> 
> Add support for ESWIN EIC7700 Voltage and Temperature sensor. The driver
> supports temperature and voltage monitoring with polynomial conversion,
> and provides sysfs interface for sensor data access.
> 
> The PVT IP contains one temperature sensor and one voltage sensor.
> 
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Huan He <hehuan1@eswincomputing.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Applied.

Thanks,
Guenter
