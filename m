Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BF35335AB
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 16:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883994; cv=none; b=uJxIV0IR3iPPXY+o20HJu/FtWws5GOeCO9UP0Ye3y1ZOQ+VO+2MImASX0dpSktLFa7qE+gMXZSUxpsuyAyQ8Bk5jyTcGIKu+6vMAnceizAF3bXRBvUoLqjEiINidg+v9W6BV0Ebjv+BkrOIQMTMB5rLhdET8DTF538nxfbPUMU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883994; c=relaxed/simple;
	bh=uH6of9n2rBHWfIQOS9mKxTMhHVx2BH+BmV3w17ToNbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmSeeIfPEEcI7KyAUXGDkgF2aqwhnZdpEvXTdeHpNw47Akwqc/zDong3blDy85H175lQ58wxwTAngD1fENqMTmGYCPJWPVZXT9hqtSizD0c1kM9ySJMSD8tTDGcm9b8WUloN+hvC6WsEEgU+3gu0RsnmTsoYpRae1vBhzI1bs5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxqzrxwi; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxqzrxwi"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e041ea211so3901552a91.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 09:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883972; x=1789488772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G0ot632abDXUhRdAYyei8Pmi85X+F5W6JzkBTKWHobg=;
        b=fxqzrxwi2bzga5/vC5mqkMfyxdXc9OjpkhgB2nu/QvIEaAWPMVL6MciTrSgFUNYWu3
         RjM8v+ptYG/PzK+3bmx4rc4wbwG08FUHhcsRSOvroG8RrCcjSY06fAtta8wLB+2MFF/Q
         +jAYXoAIsXdEYUODcdnyEriJYSuu1/RDtQzW8/r097SLQ0cfRfqs80xoLPI8PAo8VzR8
         Dfzo1ZN6m1MxnFG5gQq/BwbQkMTJRCkPxwL7HGGkD5gs+GnPhbgm9cahAlp16dcAOpwN
         xlWrLBeYo+iH5AyMZ4PDqiU6zDp2vS07v3FvuL8SWi6a3mAEQX2DswpV3PZFmk9bVoPP
         cn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883972; x=1789488772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0ot632abDXUhRdAYyei8Pmi85X+F5W6JzkBTKWHobg=;
        b=GwSZZkhHM0wzunYnU4EFRvwwq7A5yDeZVD7yU2lS9BCKRTqhlAgVm2n5I2593XD/SW
         GUk2kQEumXZt0k1WW9qvSFivcyWn9wgG6KGIiVd3gLSy+8TXVQ57Qu7QGLJhegi7LHxu
         zYSZYHN1+3KRH+To/CtarVdCBAA5+/pNokB6b4Dbe9rlIcO3c4mpBwzFV0jGtEI65Xzu
         /h/uekD+c1p0vvxjzlyHEQhj/mDJ33B8ngRnORRzZ12xfco7kNHgj2gqDRONsBXgY8YR
         Ly5d/qB5uhxX+WL7X2mBOuidBzQW6lL54ePXLeoqHEcVf15c4bgmZtAA+wFkyhB3Sn27
         R4jg==
X-Forwarded-Encrypted: i=1; AKwUvBy8QrWvtDAtHiIY7DmOLmJiACuHUInzMNDPZUtofFDDod502Bnt1VG+AO+iCloo73NPxF+GoHhCDjeU@vger.kernel.org
X-Gm-Message-State: AFuF++kvil1uz3S4MZ+ZaCS0xd5dwkLf/TomCxRKNKp6KPJQY1tXW38M
	2veB/EIADgUIKqy+beAypd1Mkood86aHhH4Fq4VHa7XsYHw5N24RClGx
X-Gm-Gg: AYBFou1/MkskyKJCW18PRCrtbjPRpQYuFzkQRXtlnLwgm9F3yUTDVkZS+N52TiwoHNL
	bA8BNcOdyxeUAz22YPkMWl5EizRLCCDlOajInh/PRNnbgo+t51jmK1AWpl3hmQD24ZL6HTI/4K8
	twZoLUbxEpUf7JKzlfS4TYY6NDLeT5PunSDU8v8WlWf7iI1Ok+trb6wRsnBL0g6YDcW8nI4NymQ
	gV03RfYlN2KpT220rotfnGASeHvWqfLP5eSu13vpiekwsrCgSEezsgf4DsuESk5KUEd9/SMXzRd
	bJ0ZLgUqTihmXNFj3pAZSI7owIH8FcKe/px6Gd4D/kI5zjiDJkILnvKyiVzsghRgXGa6c39PNq4
	vCDiLk4hfCL1VMGIT+1AEd3/LhnqiFhuIXB4Yv6+eHXnn6Vme8e4odgy1Ql58sHhuzebGgLeOSl
	wPDZgF250ZZ/HofISMLxAUC9dbmKROtfS+uPViQeyPkUUpnFlvXpmWksy1StfQx2noiyqxueZOS
	g==
X-Received: by 2002:a17:90b:4b0c:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39b26121f6cmr45189132a91.2.1788883972013;
        Tue, 08 Sep 2026 09:12:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm26901209a91.10.2026.09.08.09.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:12:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:12:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/2] hwmon: axiado-tsadc: Add AX3000/AX3005 TSADC support
Message-ID: <5f01098a-9d83-4f4a-957f-835d63196a98@roeck-us.net>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
 <20260903-axiado-ax3000-tsadc-v1-2-a8a0f3b251f5@axiado.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-2-a8a0f3b251f5@axiado.com>

On Thu, Sep 03, 2026 at 12:09:48AM -0700, Petar Stepanovic wrote:
> Add a hwmon driver for the temperature sensor ADC (TSADC) controller
> found on Axiado AX3000 and AX3005 SoCs. The controller measures
> temperature at locations within the SoC silicon die.
> 
> Each TSADC controller is registered as a separate hwmon device and
> exposes one read-only temperature channel. The sensor is configured for
> continuous conversion during probe.
> 
> The current TSADC hardware does not support threshold or alarm reporting.
> All TSADC interrupt sources are masked during initialization, and only
> the current temperature is exposed through temp1_input.
> 
> The averaged 12-bit ADC code is converted to millidegrees Celsius using
> a lookup table with linear interpolation between adjacent entries. Raw
> values outside the characterized lookup-table range are clamped to the
> nearest supported temperature.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Applied.

Thanks,
Guenter
