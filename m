Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7E3364EA4
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 19:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784921151; cv=none; b=rtlgG10dEpv6KokM5SrS6HKfa2a0hJMR1YurOwpfEuklO7w6agx/GKh/Sc1U2HVTPCfkyCboRrbp4rwA5BV10MWdomgKWy9QavO382KN43o0C4nXIq46fzOTjRTphuL91K/r+BKSbPjahvNxMQiyKcooDv8PJZh5EIY5gJOQ0+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784921151; c=relaxed/simple;
	bh=2ksqF5z1sIMNtrP1tAqgcwchwd8cY45U2teQX6Ds30I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BArfcskloTk/uvUwtz2IePewHE4x2qwjBQ/lrK7BpI+shSabugydW5kAlGuMP+hfW6YMKNaAyDaANru9zZJdjglVmBBFjvZwNgfLvzAgnTAUJ0GJOJ/i4ln9AnBlP4d6Lq7SL/NIkP15fgC075+Z/gaqt0iGymEM3ocbB8S8VTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5DpW+Qj; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5DpW+Qj"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ccf2360620so8575785ad.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784921149; x=1785525949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c0tC7vV+OGBtLj6C1dSzqQ74owp2ZWgS4CBF+5vZQqs=;
        b=U5DpW+QjLEhqPtA+4gUme0zWGhUPsgeSIqst2Jeo+WStjwobZ4fKCeqjNNhq2XTuZs
         jE3VHDwxCvUV5/MadJGYXMJxD1SnPUf/29Q87RU/Q6A4d/b95GjVc/SyKpZQ1+D0g8iY
         zniCZVpX51oPFw7WKgTLGGUO1lxc+SRK2z2nISMo1doTxNnZUms5Ksa/TRqNYQf2ZclK
         U3trorjmjVZkP/nrlmq0KymALkVquD81llgC4dPj9VYgxEtnmX4zDCS5l4HrIgYAAZjM
         6m5MeAUXpskUg3DCncGrJpTDk6ZzM6+9wHY0vI0z+T6YLuf9a1MbH3iYFiBDe0bHyfgc
         4bFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784921149; x=1785525949;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0tC7vV+OGBtLj6C1dSzqQ74owp2ZWgS4CBF+5vZQqs=;
        b=btCeuPjTa/PbgFZR/kwC8HRze4ATD3S4tSFVqrMsQc8+ZhBaJGjVYHfemRyX19gL+I
         t42qGOdbHk5kdwR3hlfXmNp4+hftUTiBOLMYe4WmxVxLqrm1d8VyIXp2FYTR3GPnHkjs
         huqoYygW7fbogi3mApsL71mdgCXqQyiBtT3/utFFkZeh8vKVvYF2Z7d+EA+X6lmJCZQ8
         AbSxQ7tmc1W4mwgwng7GVdC9vZeasRMvkcV0VCR+bY+mzPpyc1mHGammpv6mkzhW5Xq8
         oCjdOESFYMdlfKeun3cegZAv+fC1MXYqwU1k4QRd5a3UhUTsd/EHZtXLIzZ7yjXsd2fc
         RriA==
X-Forwarded-Encrypted: i=1; AHgh+RoFw467fiELaJ5Z6lNlgpugJThlq5LAiImOr3bhzx4wubJDDT/wLRsjbS7pPT4pgAflycjwkHfD5Cah@vger.kernel.org
X-Gm-Message-State: AOJu0YymUe1CWHWATceGLdyBp1MaefWcOkbc+A/QEdizfTMRkls/rrfF
	iOcejAwPTusuNqzYK8tE2aSm7Ljkt1XhpPwQ4AbNtjyxLrdm05RjMwST
X-Gm-Gg: AR+sD11Y8rTIB4dJKT5obyUdBhuRF4PQycS+REoV6Oa2lCikKOqZDEAb3Ud6iwwzN7E
	kDe/hz1bLR1N7U5a/Z+AJuOZP6sX1m67eLhExB9Ko1GdREv1ikP8IbH+OEbaC8l+JIPyoBrY6RK
	k8N4YIRT0ZOo43x12dqgbmHY1PmHERuYde2gimNlvK8aE6CCNbSB0At21H9pS0l3mTBR6wK14eb
	Yjg1jo/ATu+dVDVOKdSHXBBMo3/us7/vjV6AMU+tSMRwF3WTaJoP1fdrfGlXkfeRVsatVj9IFuk
	hJoNHehqCMAll5VS/qURTFkC1ynpUW+Iddn1UmO73c7RdR6cRoIIt92hreNkb0/Zt2OFLzpBe//
	PCgxadxg8tICjTmKCoZ6uurtok6uEpQsMRHZTtvkRFTKQGOWLjppVvEl0ni9WKkK4cUOKEprd4n
	2CreX+F+2ZT00q6kUCK2cl6CuhI7dhR+A97FpC1Ymp2uY=
X-Received: by 2002:a17:902:d491:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2cfa6b77547mr101121265ad.14.1784921148827;
        Fri, 24 Jul 2026 12:25:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:40e1:40e4:dabe:543e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc579127sm1679206eec.21.2026.07.24.12.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:25:48 -0700 (PDT)
Date: Fri, 24 Jul 2026 12:25:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Srba <Michael.Srba@seznam.cz>, Linus Walleij <linusw@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/5] Input: zinitix - add support for modes 0 and 1
Message-ID: <amO7_sEL0hknUGO5@google.com>
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
 <20260724-zinitix-modes-v1-3-f6df7d86a878@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-zinitix-modes-v1-3-f6df7d86a878@disroot.org>

Hi Kaustabh,

On Fri, Jul 24, 2026 at 12:54:05AM +0530, Kaustabh Chakraborty wrote:
> Zinitix touchscreens have three modes, numbered 0 to 2. The driver
> implements mode 2, and leaves out modes 0 and 1. The difference in the
> touchscreen modes is the schema of the event data.
> 
> Implement modes 0 and 1 in the driver, along with their event structs.
> Maintain a common, canonical event struct which is to be the superset of
> the mode-specific structs. With that, introduce functions to convert the
> mode event info to the canonical format.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
...

> +static int zinitix_read_point_status(struct bt541_ts_data *bt541,
> +				     struct touch_event *event)
> +{
> +	switch (bt541->zinitix_mode) {
> +	case 0:
> +		return zinitix_read_point_status_mode0(bt541, event);
> +	case 1:
> +		return zinitix_read_point_status_mode1(bt541, event);
> +	case 2:
> +		return zinitix_read_point_status_mode2(bt541, event);
> +	default:
> +		dev_err(&bt541->client->dev, "Mode %d is unsupported\n",
> +			bt541->zinitix_mode);
> +		return -EINVAL;

Instead of a switch this can be a pointer to "read status" function.


Thanks.

-- 
Dmitry
