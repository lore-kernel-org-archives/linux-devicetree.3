Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEF33C1F22
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 18:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787164417; cv=none; b=UTQbaC2dZm/PW2oU9BSjw1s9mfetJLVZiLyeuXDtzONWz+dYgJYqHxmBFeaUT+/G4+kX4d220WFf5+HnV908jP6leQNO+lczXVxC91PdZ8cGdSqjt/8ZqwOfCxK5F8nkpA02/FS8QbER/6GTdsTJ7XVpb/0HC5aqljniKG2w6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787164417; c=relaxed/simple;
	bh=kDvjqglpjjbdVS8s0FP/cF8S1ZqIK8Vge6wj9DfFsnU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=mRMbk9HqRcDsVNHJ16GneJRmsHuFGyF068518GqtYvOcs23s7WAeiAVEJcgB1KPdBLwrlCaDx8BRGoR9X/Ys//TGsF/aBWBYnHHewhMasM+YEgIN71CCWofQ5WUj+SgOPMkaeOqZYid0bAz2LqAfl7YwJUua6DKUul6mi5xaaBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2incnVl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2incnVl"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1133449f8f.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 11:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787164414; x=1787769214; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jk30t4w+4CGNKFTwXAAP2PpBlLXYuS6vp61bZKg9CrU=;
        b=K2incnVlrYd9WvxWcucGP33hDdpsIO3YYkdaeW0KCipjgKr5x6QZn3nTKRTT44PuYr
         nCMbBb9Poqv/Qwobuau/yjaoJ1NVb1QmQky9yCkXbBH6UefhoaQJSpjCwDGrzW673TTw
         Nz8eENa6qkTQAH3nCfNIQs58XDpGqncYRzjT6U+nBxRcnSgGRLT4GdZvehFU+kav8orz
         43zoCPVuVGmtYWqtKiijKcYo/f0PsVjfdt9T2AgCSpLPIgw0HpwDm3F8+ztM37ZLfama
         6oOPgDGpmiDV4FQMbEVJz7dbK+k05aEdH0isM659AzXWm9YzA+G7C2dkzdQXb3GzK/ro
         EMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787164414; x=1787769214;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jk30t4w+4CGNKFTwXAAP2PpBlLXYuS6vp61bZKg9CrU=;
        b=Pa00lb4vigE22Z4ue6G2fsOA4+Q+kksofPn9+kyaJfgk1kspgPePTb4BGVfEDZkAzB
         xpVpxteyXKnz0OblZif5loiURFzQDcq0uEV5BwQWxfdV/vUphWUiK4l7lfhayEMrgA3W
         HbtWK1lEdp8lXuudtNW0QV3LWXQomndG0v9qGd4s4PH/pytoRtvRYfDLBk8K5NmGwlmx
         lvWnxvQlzEfzJbH+ndi3NR1Z5PsqL4DVpEnPfIhLZn/UdfbSG57Bk0ppX+KZ+AwgUUc4
         kTGmRZP9E/Y1d5ZeR/+uUgEr77XbbCNxZFzqt5mwmngdeqjvO9I+bf1H6OTiRRHVHdHt
         ANJQ==
X-Forwarded-Encrypted: i=1; AHgh+RpicrEoY1HcBgkhmd0CnikmHTHKfC9LGCWJgrXcNgHjM4tpn7drxdfo+32/JWHqRrayfxX+UWcR+DAK@vger.kernel.org
X-Gm-Message-State: AFuF++kYxJi5/kMyiaxJWjX5kr8iQPkQWxoUB0eHP+pk4LudOfCJQDLk
	Ifsda6l+xOlaqUVFaWYjRhs04MXt0lgS+ctNTn+AmDhImq2mvJKNPuaa
X-Gm-Gg: AR+sD10zakvS3cyUQxs3nzPjwVdfUAU91EKIoXH0Gogso4TCBc6gsXKGP1z1E2SauJi
	pd9VUEUpyI86a9Wfs16rO+BJx1PJYam0H/tVxCiuBW+E4OOnCome0fYgOu1E+xYSsMTwyoMkwV7
	Y8rZg596JGWawvjoudmhsbTiXFtF7hGajamVjFXQ7WIWBNRqxj+IA3Q1pdkTzQi96aJX+eP3uR2
	qboFcs4N5LmYxU3VGnQqexh8JF0x4Jd4IQCOtEqZcRTXYOoU0DZYBxJSm6AsTtLkbNaz3WphhIm
	5Tu6DKgSHl+m5q2YpR+AzhoFbSQ+Yo9AImjKCCedo1Fh/nMIBra9xpaJJa4xPE5iNM6BLlyYNx0
	MLYCIMAP5/zpFraiPDU8nAAsKANfKAXoZJbQIL72mlUiwQ25HFII8uZg3u1t1hmcXV6W2i8iAmt
	ZLJ0klGvcc4l6W4IKJVbqiWAfcUu2FY2qf1nCGx5oeosa/rYhRNhAa1ddk4+7BmbjlJp03IDVrF
	qo=
X-Received: by 2002:a05:6000:41fd:b0:482:94e1:15bf with SMTP id ffacd0b85a97d-482b1e83872mr12809165f8f.2.1787164413718;
        Wed, 19 Aug 2026 11:33:33 -0700 (PDT)
Received: from localhost ([2001:4bb8:17a:e1ae:eec4:cc25:791c:5824])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e54sm8030887f8f.11.2026.08.19.11.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 11:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 20:33:30 +0200
Message-Id: <DKT4WS5CVP2V.2FWDOOOHIL3XS@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v7 4/4] iio: light: veml6031x00: add support for events
 and trigger
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260818-veml6031x00-v7-0-2b0de0f20edf@gmail.com>
 <20260818-veml6031x00-v7-4-2b0de0f20edf@gmail.com>
 <aoRltgy0AYZ_Vcum@ashevche-desk.local>
 <DKS790BEXVON.1FP9LQUPNTYDE@gmail.com>
 <aoU0JSmv7FWGW_Ms@ashevche-desk.local>
In-Reply-To: <aoU0JSmv7FWGW_Ms@ashevche-desk.local>

On Wed Aug 19, 2026 at 6:42 AM CEST, Andy Shevchenko wrote:
> On Tue, Aug 18, 2026 at 06:10:51PM +0200, Javier Carrasco wrote:
>> On Tue Aug 18, 2026 at 4:01 PM CEST, Andy Shevchenko wrote:
>
> ...
>
>> >> +	ret =3D pm_runtime_get_if_active(dev);
>> >> +	if (ret <=3D 0)
>> >
>> > < 0 seems too much to me. If there is disabled runtime PM (and suppose=
dly
>> > device is always on) this prevents from getting events.
>>
>> I am not sure if I get this. A reference is unconditionally acquired
>> when events are enabled as well as in buffer_preenable, and also in the
>> probe before interrupts are enabled. Runtime PM should be active at this
>> point. If not, the interrupt should not come from the device, even if it
>> was on (e.g. before autosuspend kicks in). But maybe I am missing
>>  something?
>
> The device maybe in these states here:
> - powered off (by runtime PM) ret =3D=3D 0
> - powered on (by some previous activity) ret > 0
> - always on (PM is disabled by user space, for example) ret < 0
>
> Are you telling that the third case is impossible? (Note that autosuspend=
 in
> this case is irrelevant.)
>

I followed the execution paths and the third case seems to be impossible.

Setting power/control to "on" calls pm_runtime_forbid()[1], which sets
runtime_auto to false and increments the usage counter. Note that it does
not update disable_depth, which is the variable that pm_runtime_disable()
updates and what pm_runtime_get_if_active() checks to return -EINVAL if
runtime PM is disabled. Therefore, pm_runtime_get_if_active() should
return a positive value under this configuration.

Nevertheless, I conducted a small experiment to make sure that theory
and praxis match, setting the device to always on and checking what
happens:

# NOTE: These are the first operations on the DUT after booting.
Always on:
$ echo on > /sys/bus/i2c/devices/1-0029/power/control
$ cat /sys/bus/i2c/devices/1-0029/power/control
on

# Low value, so I can easily trigger a rising event with more light:
$ echo 300 > /sys/bus/iio/devices/iio:device0/events/in_illuminance_thresh_=
rising_value
$ cat /sys/bus/iio/devices/iio:device0/events/in_illuminance_thresh_rising_=
value
300

# Enable threshold event:
$ echo 1 > /sys/bus/iio/devices/iio:device0/events/in_illuminance_thresh_ei=
ther_en

# Monitor events:
$ iio_event_monitor /dev/iio:device0

# Good morning! Increment light to trigger the event.
# I instrumented the code to log the value:
[  222.644966] veml6031x00 1-0029: pm_runtime_get_if_active() =3D 1
# The event:
Event: time: 1773416327710140541, type: illuminance, channel: 0, evtype: th=
resh, direction: rising
^C

# The configuration is still the one we wanted to test:
$ cat /sys/bus/i2c/devices/1-0029/power/runtime_status
active
cat /sys/bus/i2c/devices/1-0029/power/control
on

[1] https://kernel.org/doc/html/latest/driver-api/pm/devices.html#sys-devic=
es-power-control-files

Best regards,
Javier
