Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782253;
	b=smLoc2lsM8dmqkg+/jw+a9RO4QZ7I77yY7J9hxt8RNk3DmUfDIlIo2UuZrvEmVMDC9a1
	 R5bwf7/6uNCc7l9BwQrWTOK8vMesjMx+eGAYoXgdU7gz0P9tXU9aoTWG6HDGOv16wI/b9
	 ocMZd8efvDs8CSp6nOfkYbM2XtyWKkngGK1oyzqKufwBCBJsxUT0mn5/B6gx7h6zX4ZlM
	 P4BPMsE829mXnSSl4n0cokPox7yrOhDYLnf8b7YwrpzdGXMOUQAIU/tfX122mekGqJXoR
	 ECDHCdrMggKPA65nKyMv3chFEJpOvMwZNGY4/WVdjAdhU3u+9C01SxnlU6vTV38tLrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/uosKOFE+jLmcuWismvtv+9sAqcc+AKxPzq+cY150Wc=;
	b=NghQRnOfktrm9szqTUqMl0wO/0GSYjjqs5e8bu3ycqNX5qY6Rf5YNFM88VDsWv3s84kp
	 xigXhIUQkRX0qB2qRIUjYe6DidFswsmDESfjRnVyKq1Xq5i+CXKPbTv5l+qdYbubESr88
	 uZIkfwKWfruH4fvhHIcqt0mOFhrUSCHJBrkArUq9yczuI2zkoyqxUfxrBL0jZB5T+A61e
	 +YWSelClP74aVbgMZQDF0bUPrqqV1dVixYVoOfeHuEpIhJ8BL7/WzgbDNQDDh3o4VHtp5
	 r/srRLClT07Y920m93o15/YJtxyRQlsb5gEOxJuN9t6vGFUfMeljwLAfNqDB6koyYTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=scWq5sHQ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C95606EE98
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2C95606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=scWq5sHQ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso3554525e9.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793782251; x=1794387051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uosKOFE+jLmcuWismvtv+9sAqcc+AKxPzq+cY150Wc=;
        b=scWq5sHQAcgmUxPsLyu0ZcaoR0jcClnGvEJhGMuKM1MqC3k0HqgYwvmdPBhpyAm4wO
         1sYPxlosiMGRZwdgczY/gO2jC0sDT+Ldu+mzVlzD59MndXPGLNVyvjcqa14GO2GfAZJJ
         CIizI8NIATb1lxy1IyRmo39M2cGBi//5bP1qwB7FNGf+q3GxKEfEy1p7BvQHFTnnKQFD
         nXyF4iFdc3ivPpr9L6QReYNVEd8J8RqHrZmMKNLBSG/gP6annAQlzqUsAKTpwNlQsIDO
         aNpJAgyM/4dr/RqcFE+Y/+pf4tEDxzticEUG/wr2EjD7edOj1BIUIJ6CJUk1woJz8B+i
         1Xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782251; x=1794387051;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/uosKOFE+jLmcuWismvtv+9sAqcc+AKxPzq+cY150Wc=;
        b=F6SNWL+94kKIgqLC2A2DV+DiVinJpuE6eX2pFImqxPDY05Q9jB3X7bNg7HNZyQU4mH
         oS6M6ghBYa574l7/g/LQUnK6EkRZm7N4rCvpX5UYtf1dIiLrJ5ZHRwb2YH8y3GRjm1mN
         g/MATnKxzDr5rE2DOUbwpadXBuWlw43hB7WL1Qmil0IUzKMAxZkXkn/K18fL5jJEZ+Ry
         xR04wiuEshyarKtdHwix+OMaJ5URqaPvFJwyBvTdC6fZrehnsZS/hZadb4o46Ju0ZVy6
         Twg1cHA5gbL4qObirm/BeNx1tONyWyB7bvV8v86wfae1FR2lF84BltwP207uONFT+Bv5
         7utQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrTgULN7lxX371zcQD3gXJ5gM9XU1nqGmEPW6/bUDrPU46NEe/vtdi++UBFiWyMZeTRf54giF0/kjV@vger.kernel.org
X-Gm-Message-State: APuU4Z/MAGKZlYcmWH4Irmf/5mrYJ1fNPjRfUDWM6ZTll0b9vmgc0Vli
	5exgOe/s3fYWl+k9auv4C1/TYxzWJHEZoSbEUKS6uswdQLg/9+PJtcgUxuZD0Onb+ow=
X-Gm-Gg: AYBFou0FT37S0EyJUc5ka6j8rxuCsaQiRiz9dDdzH5YR8FY9S4EFppKVPMx5mMRy2va
	+SJldCsHeuP8KdYm/G2H2N9Hann8PMFjzj+UyDuhHPSmSBBUooRbkA5dUa/D1tagg+aWHaFiveV
	albtQPwPKmBlOc8ib6tUGrn/hKobPz4UI0b9M1FVf+XMCqvXoL5CyFSn4GVJ3g9exoqI6BnXzAr
	gzo0eNkQ6HsELOe3qT12J+VzFO6bGh9EOl8POowvc/bywEnRoXV2Rw0rRzz/UGmaGruhBjZ2UqT
	4TRYYfYFtaCExv3pdr0+xsCss8GXOQue7Mohq+gG5MDYRQQ00DaSSXk17uV7NB05y/jfIQgU0DR
	t0prO+8sZP1ZjO7Kyt3H3N1AhH3hcBqR/exVRD2T6j2NQNUoTEQki+8A3idtN8l2ZlZOR226oZ1
	qw/j3NSJJ6m7jitqlPgGn5bq1jvkNm8MIfVWYAOQBRwCbOQsenQUGjs77ounxhoi80rZhtSHNpu
	rgHrqwF+U0ThtldMq+GJBAe/vLrgvzAj9/DNzLXG3TD6nMOYX4QUI85sP+jRfp4N/PWY0Hp5xg1
	fSGFcj7UXbVVRGaPRt5Qg4VFuNSVDSJzS9/DxGdPXbGbRa8pJarBggE1YOvK7ty02wO1F7/8MsG
	BDOXbZ2QTkp1xm97fMdweB9xBhx4iHQ==
X-Received: by 2002:a05:600c:4e8c:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4ac1793ff26mr345895375e9.15.1793782251064;
        Wed, 04 Nov 2026 00:50:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6762:47bb:1e06:ff70? ([2a01:e0a:106d:1080:6762:47bb:1e06:ff70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm2514434f8f.11.2026.11.04.00.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:50:50 -0800 (PST)
Message-ID: <399668f0-e97a-438e-b761-1ea6c18d904b@linaro.org>
Date: Wed, 4 Nov 2026 09:50:49 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 0/3] alarmtimer: Choose the wakeup RTC per sleep state
 from the device tree
To: iav@iav.lv, John Stultz <jstultz@google.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261104-b4-alarmtimer-rtc-priority-v1-0-e996681b8086@iav.lv>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261104-b4-alarmtimer-rtc-priority-v1-0-e996681b8086@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 06:54, Igor Velkov via B4 Relay wrote:
> alarmtimer binds to the first registered RTC that has an alarm and a
> wakeup-capable parent and programs it on every suspend. On ODROID-HC4
> that RTC is amlogic,meson-vrtc: a register the SoC firmware reads when
> the application processors suspend. It wakes the board from deep sleep
> only, and only when the firmware handles the alarm; it raises no
> interrupt in Linux, so it never wakes the board from s2idle. The board's
> pcf8563, whose interrupt line goes to a GPIO, registers later and is
> never used.
> 
> Which RTC wakes the system depends on the sleep state and on the board's
> firmware, so the series lets the board device tree say it per RTC:
> 
> - linux,wakeup-states: the sleep states an alarm of this RTC wakes the
>    system from ("s2idle", "shallow", "deep" as in /sys/power/mem_sleep,
>    plus "hibernate" and "off"), or "none".
> - linux,alarmtimer-priority: a weight to pick among several RTCs that
>    wake the system from the same state.

This sounds bulky, perhaps it would be much simpler if we just added
all the available RTCs which has RTC_FEATURE_ALARM and can wakeup ?

Just switch from 1 single to multiple RTCs in a linked list and you're
done, no DT & bindings changes.

Neil

> 
> alarmtimer keeps each RTC that has an alarm and a wakeup-capable parent,
> unless an RTC registered before it, with at least the same priority,
> already wakes from every state it lists; each kept RTC gets its own
> "alarmtimer" platform device under the RTC. alarmtimer_suspend() picks,
> by pm_suspend_target_state, the RTC with the highest priority among
> those listing that state, the first registered among equals, and
> programs the alarm from that RTC's platform device only. The driver core
> suspends a device before its ancestors (dpm_suspend() takes
> dpm_prepared_list from the tail, in reverse registration order), so the
> chosen RTC and its parent, which drives the hardware, are still awake
> when the alarm is programmed.
> Without the properties only the first RTC gets a platform device and
> alarmtimer programs it on every suspend.
> 
> An RTC without linux,wakeup-states is taken to wake the system from
> every state, so that adding the property to one RTC, e.g. from an
> overlay, does not change how the others are used; a priority on the new
> one settles which wins.
> 
> Hibernation wakeups (.freeze/.poweroff callbacks) are not part of this
> series.
> 
> Patch 3 sets linux,wakeup-states on ODROID-HC4: "s2idle" for the
> pcf8563 and "deep" for meson-vrtc, so that alarmtimer programs the
> pcf8563 for s2idle and meson-vrtc for deep sleep. The patch applies to
> the current tree, but the s2idle wakeup also needs the pcf8563
> interrupt (GPIOX_5), which a patch under review adds [1].
> 
> Tested on ODROID-HC4 with v7.3.1, [1] and a BL301 that handles the vrtc
> alarm, waking by a CLOCK_BOOTTIME_ALARM timer, once per state: s2idle
> woke on the pcf8563 interrupt, deep sleep on meson-vrtc with the pcf8563
> alarm left unset. Without the series the alarm went to meson-vrtc and
> the board did not wake from s2idle.
> 
> Questions:
> 
> - Are "linux,wakeup-states" and "linux,alarmtimer-priority" acceptable
>    names, or should they be generic (no linux, prefix), given that the
>    states describe the hardware and the firmware rather than Linux?
> - Is the device tree the right place for a capability that depends on
>    the firmware the board runs? On HC4, meson-vrtc wakes from deep sleep
>    only with a BL301 that handles its alarm.
> 
> The alarm limit of meson-vrtc also depends on the firmware, and the
> kernel cannot learn it. Some API is needed to pass this information to
> the kernel.
> 
> [1] https://lore.kernel.org/r/20261020-hc4-rtc-alarm-irq-v1-1-b2b8c68d54f5@iav.lv
> 
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Igor Velkov (3):
>        dt-bindings: rtc: Add linux,wakeup-states and linux,alarmtimer-priority
>        alarmtimer: Choose the wakeup RTC by sleep state and priority
>        arm64: dts: amlogic: meson-sm1-odroid-hc4: Describe which RTC wakes the board
> 
>   .../bindings/rtc/amlogic,meson-vrtc.yaml           |   3 +
>   .../devicetree/bindings/rtc/nxp,pcf8563.yaml       |   3 +
>   Documentation/devicetree/bindings/rtc/rtc.yaml     |  29 ++++
>   .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |   5 +
>   kernel/time/alarmtimer.c                           | 157 ++++++++++++++++++---
>   5 files changed, 180 insertions(+), 17 deletions(-)
> ---
> base-commit: 348f54c435bf3177baa78201952810b255d44b30
> change-id: 20261104-b4-alarmtimer-rtc-priority-2e25131a2917
> 
> Best regards,

