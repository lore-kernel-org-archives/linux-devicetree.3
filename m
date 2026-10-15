Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30F349B440
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070718; cv=none; b=GwaERFMi8KsAc/tzsj+MBT4lD9Cr+1eikQuapbGng7kVoq7aeooZHNfl4jCvIBW2C53ZmmlR/KYhc66PnUijAKiS92q2yuX9mczPrhd2FeEGxube6NophTVh6klk/Ki18s02QTSltOtwRKvfJEUqeMuZdhfSG9xPaP864waGCPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070718; c=relaxed/simple;
	bh=H3zCP5H13vvVFVkfSQiIjCtmW1MwjHaJtfgXUw5dX60=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Bz74rtjouPHsEJ+2o5C4+kNG4Wq0qG1z9ZNxEjzFZOIkCC/JpzvQ5/HG+0nHR9J/6UdvXd7Vb6l3xHCzNr0FWFLDkL4sLvkF6LG3gcNXqxF+u3P2GEj2LxmJmuXWYLuj/qKEV+mMhFNtTJXhVqJluEs5ddCDtJuMqbFvF2bFj90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBae+0GZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBae+0GZ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afe75f055so433786f8f.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792070716; x=1792675516; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fatwg6Ql10eF4yUkxnXRufoS1VKiolsiumheXDiVcQ=;
        b=CBae+0GZcOGJDgIX1tHi1ZOI04z/UBOJD39qMdwmRbrcq971OYnfa8TT8VgnRoH1ag
         OJqediBSk9PNcNxf82i4Uk7Zra5yHVcpOMB9B2+FzQ0UgYNkiRTKX+9nNikkJPS0/UAk
         JpBHp1SArlEB3B/2jjkhESnhoeXzz/Gu5MIplCvBguZV0WTQbb7OTA55xNB2ax8oQQaU
         mYOm1payuMenxSFnlQNKDiSfKGsV0u0lKAO1Kklmro69gOhrjc+8LNS+0z+ox/TwvVJr
         p2uvpktUHsQ+QpxC+NCvrNykld46qcz/pOkoi7G9l9iZo+xbvmnbmYWO1BJnuV9Bb6Uo
         FlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070716; x=1792675516;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fatwg6Ql10eF4yUkxnXRufoS1VKiolsiumheXDiVcQ=;
        b=TKVn1/yGpAF3e5G4k2D5S3nXwP01t92hz5KRtH+JQybqR9qq9opzPf4aIVF6CVLFPX
         R9EGEJkHNKdhRpRkO8CQFjZTOSVEkNn17XYm3qwAJEIRzq2LZhJDdefuvtSjH5yvoN5F
         HJ7dlnBmeVBArit94elwnOWoXC43daEiDUccumeJc6U+uXt//xMWXtx1HA9k6hLxxhqZ
         kWYrGwa89+fAbzpROd3XyIQcjFgvBAYXle2vLV806AlBZ5MracD5bpluaZC27qtY+rUG
         gm0WAqLCxBSV1lRrvX/8lawWuPfecDDx8oEXci4ok69glxaqEi9w6u/fuXijIZ/cg9zA
         4GlA==
X-Forwarded-Encrypted: i=1; AKwUvBwXLtWy3Jpu9o01KIQ2vjVGLz49VzAdacEvNz1/J3FOK3cMKcm7h+uvoSV5iywg+EyNLxtE8pJ1CbBx@vger.kernel.org
X-Gm-Message-State: AFq9FYIFpN717q2igjWkGDTQQEyuC772170wdYdr8NrSnHasKSrM6BWC
	sA6BJ44oV7R12Y8893uqjsFF8G8NxmkMemVYyT+GJeghWZhUuCkOXuxcl9fl8rIEwIfj7GdK
X-Gm-Gg: AYBFou1E94VyucFdg/gcwVF/QAAITOhWzSzG/c2jtIR3OFPUAU+ATt7ANsTfJZX1xRH
	/pazLDOCsk7FdUc7dOt5J4CvhocCArmKdMNIgkUVEowUvW/c1wfP2ywMazeXTqmW4q4vdX+QTMC
	pee7qDFX6R+087bjDZQW8qdMfUP/KLdklY5YCwlmbckU/DSA+C31D+XoQ8CDka2mtvOi69Ci/fw
	YAvKq7qpOQmPsWg7rVCF32/g2AOhLvn+NXkGAswDqPVe6qWGzP8NqQeNmY7LI0jhPlrho4CaiGM
	jkYvRfpazMkLikzzkYe40j8BSRzIdG6AZAC8mdn7bR2RLN8PzKUBQIdrX8nStTF/+1+dmVOBGvT
	t1YZvQQXvZGc2uDUx/mUhfy/vZWWxFxSpua3ezZQxizKXt6ox1M5Dhs1vfBn5Q9ESLGPzOAHdpb
	oYhyH5FdT7+enc3Hi/6KQmTedZMo7gtFgFZfL8Wn9u4R0vJzilp+/qwCwFHDT8zHqGN7AmdIcw+
	XKzgIAXwzY/6igJEg/ijvRVDjiiQdKt4aEKcJ7l0b9l5DgknzrnoL3fSw==
X-Received: by 2002:a05:6000:4549:b0:48d:facb:5939 with SMTP id ffacd0b85a97d-48dfacb5b8fmr147377f8f.8.1792070715607;
        Thu, 15 Oct 2026 06:25:15 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de09693c7sm23470807f8f.4.2026.10.15.06.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:25:15 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>,
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 02/11] irqchip: Add Cortina Systems CS75xx peripheral
 interrupt controller
In-Reply-To: <87tsmndu0p.ffs@fw13>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
 <20261013-b4-cs75xx-s2-v3-2-181bb0d23f4c@gmail.com> <87tsmndu0p.ffs@fw13>
Date: Thu, 15 Oct 2026 16:25:06 +0300
Message-ID: <179207070645.418589.10399440167204506807@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Thu, Oct 15 2026 at 14:32, Thomas Gleixner wrote:
> On Tue, Oct 13 2026 at 09:07, Fil Dunsky via B4 Relay wrote:
>> +static int __init cs75xx_intc_init(struct device_node *np,
>> +				   struct device_node *parent)
>
> No line break required. You have 100 characters. Please fix that all
> over the place.

Done for the next version, the declaration and the calls in the init
function are on one or two lines now.

> Other than that this looks good.

Thanks for the review. The next version will come after v7.4-rc1, with
the interrupt controller as a series of its own (binding and driver),
split from the GPIO, I2C and watchdog patches.

Fil

