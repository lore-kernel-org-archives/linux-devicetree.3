Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C495447AF60
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 18:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777573115; cv=none; b=EpVxAOmiEJ5HealPHwvxuXKrtzMn3wGJiNDul36MZh+VDzDXX3BCLjaDSBWqMx1LOzZaJOpXJufCaDQ4BHu5oEuo5+mDpQZcSMrkQH5dlY3L4IG3oWhyh3QVo0gThkfoEt1UxZ4TOyiWSoppxHBPLgQAAzL68yTO+OzZFATw6xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777573115; c=relaxed/simple;
	bh=r1xldGkskM1LoWG/eSEiuRbHYKyqMWnb+9qvWV8vW+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFYR6JoT/Im2PNI8CMLyTdRrjN4yZG0umbttZJyhkKPu7dqI2/CHuX7acue7Kft2QfHZMC02Wa/OK8ENUCnaRCjMxqy1R43I0i/kfcwE78QGF+s8vWx7I3KYayndcUHSXHdOXiFNYSDsQTZKakDd8P8lGAIJBsZIrMnZbjKYCkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JV3/8xfo; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JV3/8xfo"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82ce2e2880cso876397b3a.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 11:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777573113; x=1778177913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKm1ZdQlx5hjZVefyBU7lA6ZzR4xQCcmrN+zV7mG1fg=;
        b=JV3/8xfoTgec5Wt52gaGXCR0bNLsZVLmAckC+6/gFM6lWXuruFnwajK0CBJ0Hm4xlb
         +pA1CnZX0gAWSv/9O7uLOeNIytKzFFCjSQIquHw1gJRJ2qEWf3JDPIHCyH6lJBUkr0zi
         DZPmAi1R502fNr3V0Nn5Wzk3cZlhV2C1lKiwAzYeiCsPzbdE60o3P4FxLuUB2ZrdTV9i
         ROPELSSK2fxcXvmOhxmH7SqxhiKJ7/lWwSU3+mXmHJRTfq0XhLbwDBaeh6IuwMbNVPGw
         cnWoLtcBuK/pCDL5yvaZiof3SttPSqQUhhR5P9KZ4VbbF3HndX0z8pRjGq9HSipyzLCO
         7Kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777573113; x=1778177913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SKm1ZdQlx5hjZVefyBU7lA6ZzR4xQCcmrN+zV7mG1fg=;
        b=TIIJihbzDrNtUBqs01uozCat262PKJ/xMbrY3hKi6D2R6ucWgOmTsS8w844dZbyV7y
         P6T1CYZ/7JFucXxJ94XvNXp3PpTbcQ9FLGd/dhQuypcVWXJxItNZcAsHm1BGU7by2TpB
         ZIpSHct0PJBK0My5I/7lBD2oTETppOILjOOKcz6MuQj4WL2ziyhd8mcn5pfGD9Xy6uWT
         H6eNZ0z1Mh7jQra6Sro4E9DYZ6JucNHDlKohyA+tjJdQ//EZKXqzLIoJSzor01VehY4k
         N5X8x6ha0MnVgRLryxO7CJNhVVAz0Dd+DgNmUpszfUwzPSy/02v47z3mPZOSYKM5V5sg
         pU2g==
X-Forwarded-Encrypted: i=1; AFNElJ9XCWHLrhxn2H0xBVVW37Ve/C/PWTbbTBaazWA6a+0MPgg1BKJk/9YxDaoEyRMm0KRbyPGaWU3/j2eC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8fQUf4InRdADffScv58T+1HNCYew13sVPaGeshMlPFMSLuojj
	qeor8xV/WoDEPUVyhcHbBAtLpVfffKnMZWkZ5zfDKkmj4D2CNPWpq3AC
X-Gm-Gg: AeBDietyQi3QzOoKuwTal44HzSu8RX7oSuZInL+r2WMYCKCflGEmgTGG6IjwtUHRaPn
	by+wmbG24YOo4mIaJAN1ZARxZTNexUfS9DWJbknmXyB6/UMioWde9ZKspDhjTvpMwqpuFDshfmB
	ea1WcA38aCbuFIosUc6zkFGWQaeScmD65+1L+V62IW6E9Qkm4iTyyH93WP6DBTRpTo9ExcSDA8J
	FCpuKJFyILZWh7BkzAYWn1tOqfqTA85qJhZGSFLRKAm+G9kb0dAh9R7jo7yafjh4lKMdf20ZsVr
	0dMr12gdyy+51pjvuPoZcF6qeiqZEcVIOsfFdjelUWNwqKxDeJUFP9acXNUvT4CNpaqaKfQa2RM
	1Ua3KOOFuLthDNJZyVJEAbj1ryCPdi2UVK7IgFm3H4LWmeH7NJ5E87nuySLVutf2BUigj8/hY2J
	jsQrX/w/F0qZi9np8hShTQBqB2yeuV6FhnJniKOepLvxjJMJs=
X-Received: by 2002:a05:6a00:28c5:b0:82c:70a8:faee with SMTP id d2e1a72fcca58-834fdadf50amr5266501b3a.6.1777573112943;
        Thu, 30 Apr 2026 11:18:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158aa1ffsm311794b3a.22.2026.04.30.11.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:18:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 11:18:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Brian Chiang <chiang.brian@inventec.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/lx1308) Add support for LX1308
Message-ID: <136527f6-5bcb-4cd1-b60c-ce7c80fd149b@roeck-us.net>
References: <20260428-add-support-lx1308-v2-0-90f115954143@inventec.com>
 <20260428-add-support-lx1308-v2-2-90f115954143@inventec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-add-support-lx1308-v2-2-90f115954143@inventec.com>

On Tue, Apr 28, 2026 at 12:19:29PM +0000, Brian Chiang wrote:
> Add support for the Luxshare LX1308, a high-efficiency 12V 860W
> DC/DC power module. The module operates from 40-60V input voltage.
> 
> Signed-off-by: Brian Chiang <chiang.brian@inventec.com>

Applied.

Thanks,
Guenter
