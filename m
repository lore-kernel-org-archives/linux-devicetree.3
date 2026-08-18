Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F1A2EEE7E
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 23:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096298; cv=none; b=EBrOU62GPSfXVI7sNaz9SfnSLYnrM538xXrv4zWf5eNKdFJ1dQMKNlSgzkHUl/ssp7eLJioebzZwXVpmkPNhZMmHmLWyqc/hfT2/JK+k2eps14Z0WpfdVA8IM9dbj6USZoz5nx/jka4kHAlUC1MM0oP7XzTf0ua6KYnBW9mfFRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096298; c=relaxed/simple;
	bh=JvVGIAW5ni3Xc1kJeyoHi4C0Xeo9QBavCmEIrdZjNk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/MNV50aE/x/oYuS9Ppt3Ar390i+PG079VEMT3459rOlaEGA/cVfpOM2sqAoX5Ly/fV8nGvillmVaC8R0K+/dwSTr3O/aCBTSt3nj/PNMWtqL9O2jTzBZw2Y0QGTvPT+TXBamme7FYfWbK2cRFRg2/WryPnBtOzgrP5HkeURA+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GULZNdFi; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GULZNdFi"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84eb992a881so405914b3a.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 16:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096296; x=1787701096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PQRDXp2z74RjQBsbJ19hTerd/5ta04pnNNJl+vajzDE=;
        b=GULZNdFiGSIKs0BywXdM5DR8k686vtGmH/hc1tgAEjr6ICz3GlUG0qaGLoINevP/nV
         g/mhSsCm0mhH79vCd2pwst80XgHohS3kP8BuCl8SwZUnTvwePgkuAWfICWQqk0bGgNTk
         HaYjhXcniDLPTe7Yt0aRQDY2t8g0nm9qebqN38PVFO8ZrJXSbh/znADTK2IwsrvCgzPo
         zslYh4TJU2rMty/AxN1yJbcmg2p9COGIf2kcX7q7pK6DYMS6tkP22Lo1h3IrGb4hasro
         sPfeZ1QZhpl7/Hf+BuyikMUGL/EwywWKUb64hhl7VGiODgLi9q2SOwoEoO4tX8SuUOur
         R0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096296; x=1787701096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQRDXp2z74RjQBsbJ19hTerd/5ta04pnNNJl+vajzDE=;
        b=WiR3mE6YTWxa54a5wCF6kYDgxKX2WK3BJOnSgeiKkCQe6Up1jHq5GLeyErUlruZr5c
         40Iry3dWYUhP7tqCPJrrMVzk9q+bLerHIUxBbuFqsN+bg4N56Tp/JqxxTrKYAigC7ZCV
         7BGaOw8MHUCDT4F/jbYLAlF5bNmk3l33czIer2ygxz22mIs6T1tlWrYmy9KJvQj88fW/
         noAdh2cmjQ7KB+rRZh6pv3xHHCD36BeDfIXBeDobB64STvmuNCfXuM8UpkedRrRDg4T0
         e6WFnHb994Sp5KZ6I1x8i21/hhLSacWhMfJN44rm/AGLkZhAkSPqL/4CsJoZPKIbcAVW
         T6Pg==
X-Forwarded-Encrypted: i=1; AHgh+RqVhM3OJRx5vm8I8r45MbjA0PlR+EaRu3hlSwSo8F6p7sWMimqcR7+guwXIdraSNvWxvpmYY20X8SXT@vger.kernel.org
X-Gm-Message-State: AOJu0YwJF2nviNMcLqlJQeV17K75oYQVeR0a85jz0VvaBsGON5AQvkvV
	ii+O4vB/gsq4wCvhS06isQA0G4i/qvPnyoUOQnOllHlDVawx1n1WpyIQ
X-Gm-Gg: AR+sD12DWqG+ErchCqwsUDvBZlb6RZeOUe6Vca6hd7qVVURcshhPNw8YAJ8mhyegzgw
	a409pyQQ0vGPXqHBv0JLYQCHjeEB6az4cYKUyzihmpdZyQXHnbIsNK5m2m/Zu3qJHNUtG+kEgl+
	q6q+emywyYe1bxz2iWG5EwEmSyV/LyW2tH3BTbjid29Ru5Btdo4yDdeYZnzexWD/2UuWXpIJKLc
	y6ioBl3u86wF0SMY4V7oe8U2DHhUJBO0mQVCGdjFygVEWdCpK8EZ9kP/BuOPp65iVGqalqy7pWz
	2ZM4g3zBmRC4xIMaZLePyL+uzKasAtdkKEoPV2pQ7OLIxrse5ZLNEvpha3gl8m6aJCZJjzHE25g
	CksTG8Bo4xK+5CWprzAh3fX27AYN0Av78KCG0jGei7hdnsdBwMlpExzk420KFpzwoD5V9fOULuj
	vb1r5YFkGgXspo+mKgLQzfQuCTgIX/5s7QBoDLc1KWS1YVjb3UeBdyR/01iZRS+pCHQHu2ohvaS
	g==
X-Received: by 2002:a05:6a20:72a3:b0:3cc:eea9:f757 with SMTP id adf61e73a8af0-3cd011a39famr1020421637.16.1787096296030;
        Tue, 18 Aug 2026 16:38:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf15ff5dsm522227eec.25.2026.08.18.16.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:38:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 18 Aug 2026 16:38:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] hwmon: (pmbus/tps25990): Add TPS1689 support
Message-ID: <5095200a-51a1-4e68-9e78-36e8165cd29a@roeck-us.net>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
 <20260817101455.3526260-4-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817101455.3526260-4-sbogdanov@baylibre.com>

On Mon, Aug 17, 2026 at 01:14:45PM +0300, Stoyan Bogdanov wrote:
> Extend the existing TPS25990 driver to support the TPS1689 eFuse,
> as both devices share the same command interface and functionality.
> 
> Update the documentation to include TPS1689 support.
> 
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>

Queued for 7.4.

Thanks,
Guenter
