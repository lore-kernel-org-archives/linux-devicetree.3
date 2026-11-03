Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722434;
	b=Ybqw/HaL+bN69wJ3ZvVndLIqj0gKzpcUhy/VJfPPBMczCrirQEwPxqgJNo0Rg3x4zGhh
	 a9pdN0IwZKYZ/vyiK1Qu+863K/lNV5MWLKgKmIAsyrkraRsAEeNIK5b225KmIdp/OB+Wv
	 4yTIvNrdfL3PR0TYPKZUh2EKfHLUtCLVE8sM60zppppv/T8yiCjMiSx5Jdw/2edZgYaZP
	 5M9qYjg5so5a1sEQfyeZvriJ+1/tlFp3SMejpQ29jSPbk4Xskqpz+tqXII+rp79SSL2yO
	 ymrY6DW7esURTJqUqnL42siqGmiPKvk0nM6tUV8/95GGl0OZWtpzZQweKzG9mJ3vFPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=AJyyri76gw2tPYp+4QxyP3AtyJ37KOovjfoziur4IoA=;
	b=qXVLvIxWj1hXj9LDIzuTgirvCL/+NH0OQA0CKVpuzP2MwI55QMtS8xLua3AJtWJTS8wX
	 E4ajAX/rJglfDuqZctnisQ14Rm4ALANSdpFWwNUTz8rSEmeuYgY05GXt1KcrFfesyakg/
	 UHWdeXu+fcTVZDKUhTK0+7MiDEidjuNHYx2QD+ObqepjnTOi13uDF2B3TRNeQu7KxvkZ6
	 p0uqGGtWntK27NpZVTaQzBfrKOTY65J21mJtKpH+OJC42adeB4jTx1aAXuJpKrADBTHn7
	 IqRr7zIqHJ18Bg+KhLnoQiQxJqvxd3HhS95ppXyBoi6X6wi+48YyaZO94eJB4J65eVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F9d4b7Ef;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4802A606A333
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4802A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F9d4b7Ef
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so37404135e9.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793722428; x=1794327228; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJyyri76gw2tPYp+4QxyP3AtyJ37KOovjfoziur4IoA=;
        b=F9d4b7EfncJF5ES2462x+Zjbhb4TYd33M/P+3Y0mSFXz0xngNNtM0a9BCDpY6aPyFn
         EccfZpdj51j50gsAn5T7iZGoF2czsnhL/CgXIRFFxaUQJ8AIy8hcQrohqa7xZ4IiyqZS
         4NOjesdM1xKIaKZRE1G5Cns2zp+BR0b0zP6LwIF7DN0YiH5hclwDOhZw1f7cUwtj1DvR
         d7GpzilbGp54raXH9QSRZdvcbKUMIbHdXFLMJKGuUnVlJj4pW78JqPgHT7fWZtj6D4e2
         +qENEHrrgxujIH3GBfoqRlRVbsXxPpJBnVFJ9CMZRaPj6XSd+FYZJhscJXOpj2oYJg8x
         0GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722428; x=1794327228;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJyyri76gw2tPYp+4QxyP3AtyJ37KOovjfoziur4IoA=;
        b=LI51f1AhyYR8r+9xahP7/XWKPzCAFC67s7Oul+iOR/5vR5g1VLE1Y1Y0bqdteXDQR/
         CfQ7f1mdyQM2jYWObLT6s92w7Ucfa0H4O46hovxGqSgjjdG6lH7qys8eAIIW6jlNG1GT
         kK9bKk1ufIGb0NbvWYVKujJGnwBVMPNy+9LPW1aBEMWQBXcDpQyrVwWVEjE77i+MjcXA
         Z5o6plfGlcEHjb4Wo6OLTtnaAQS0dKFxL+IgrZy3pYAkaV0619JIJ9uszOZfIwAx0a6g
         10H/pJst5x3Qi9/CevRa3JmGwONDCSdNJjJhJGqOx8I+mNjFeH7DpZsH6ZAgEh88sM/L
         8R2Q==
X-Forwarded-Encrypted: i=1; AKwUvByyXnxP1udvbt/qAJsPFTSHD5PcTr+5BPyhSWlxDrbB/BZV+cVaxYzj8pi4w0rmGNJFtM0zAEsiwgub@vger.kernel.org
X-Gm-Message-State: APuU4Z/PfZGwrpexsFth0+yt8w/pVgWFcRHWulCFJBKqVJH9CHyaBc0u
	8EPiOsehgmpjq9dFBRvExZrxDriaUGudI3HVsB9kd6kYL8B30wRVogRe
X-Gm-Gg: AYBFou3x/Lb5Ao+WzfrY7NpaN7GnKEOiaFsf9BoLQynmxpsauQESMEUdh+LJA3soWT6
	kpiXxXDscMu9+1W15ujY2ZMhawq5OD6hlYEx3VWvk0BFDaD9oLKoAuZaIeTt/MfjhAwhyY4ow3J
	yaebPXXudve5fqkm+bKJfoBGyLpkcYYWPvph2LcRbHVUdwXpdaACj9HuiyEeA6+qm1PjlyteBS1
	e6RLZRhHKQkV6GvCLNnJFXukCRRWjEYDxMd3hhoDRindNVV1tbXpNGHZ1KRHPw3a1yegebL2cd4
	NBgVSC0nTiksTeQ/S1l4fs47NdSv7OJep1ky2im8G6M+TET4w0cNNEX1EfOjIeTQuksvRl57a0c
	vdTjez8ul8z9v9cPM4s+GaIlCGULf3HDIjhwVic2U62QpzprY1Vt+GFq9ByriVkr8+HHn/XyToW
	J+w/IrXSwFe7YadTfCi+nj//jDBES6gNRNgTXmoL2IN+iEDir8LeW6XOvet+NUaeXoZ7W84QBE4
	7FiR8r0kYMUlZbvHxRO7z+Na29o3BcFLWaRyqT9n6LTQWB2afYMuVPqnU9LVrkvfi+uYSVTQhwF
	zDqGq1pKeQNo2+OXWZQSEs/7wQe/wnoy+SuLxvb8cp1Vl7Dt5Er3c2Yy336QfVwTkVXR93YnJw2
	qal+HeliUGhniZg==
X-Received: by 2002:a05:600c:19c9:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4ac182dcb6fmr306531505e9.13.1793722427449;
        Tue, 03 Nov 2026 08:13:47 -0800 (PST)
Received: from [127.0.1.1] (ppp91-78-241-225.pppoe.mtu-net.ru. [91.78.241.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723bfsm24419506f8f.15.2026.11.03.08.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:13:46 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject:
 Re: [PATCH v3 07/11] watchdog: Add ARM TWD (MPCore private) watchdog driver
In-Reply-To: <004d4007-d049-4257-97e7-bf7f197ae3a8@roeck-us.net>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
 <20261013-b4-cs75xx-s2-v3-7-181bb0d23f4c@gmail.com>
 <004d4007-d049-4257-97e7-bf7f197ae3a8@roeck-us.net>
Date: Wed, 04 Nov 2026 02:13:37 +1000
Message-ID: <179372241749.1222507.6207957568716226558@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Guenter,

On Mon, Oct 19, 2026 at 06:46:41PM -0700, Guenter Roeck wrote:
> The issues raised by Sashiko will need to be addressed, or you'll need
> to explain why they are non-issues.

Thanks for having a look. All three are real and are fixed in the next
version:

1. cpus_read_lock() in the clock notifier (lock inversion with CPU
   hotplug through cpufreq): the driver no longer takes cpus_read_lock()
   anywhere. The armed state and the rate are published with
   WRITE_ONCE() and applied with on_each_cpu(); a CPU coming online
   meanwhile either sees the new values in its hotplug callback or is
   reached by on_each_cpu().

2. armed set after on_each_cpu() in start, racing with a rate change:
   the flag is now set first, and the start path and the clock notifier
   each have a full barrier between their store and their load, so
   either the watchdog is started with the new rate or the notifier sees
   it armed and reloads it.

3. Watchdog state lost in a deep idle state: a CPU PM notifier sets the
   watchdog of the CPU up again on CPU_PM_EXIT/CPU_PM_ENTER_FAILED when
   the device is active and the watchdog mode bit is gone. It does not
   reload a watchdog that kept running, so idle exits do not count as
   pings.

The earlier Sashiko points (prescaler of a watchdog left running by the
boot loader, rate changes, resume) were handled in v2 and v3.

As the driver is not specific to the Cortina SoC, the next version will
be a standalone patch to you and Wim instead of part of the CS75xx
series. It will be sent after v7.4-rc1.

Fil

