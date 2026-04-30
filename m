Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB963A3E79
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 20:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777580675; cv=none; b=tJr+Fm2ocx+nfIm4tQbEsCTqCBoekAuvAGIVs04Qwn/e8KHCBmK0tE3OVx7zUqNt52bLJnV5p3GYcbOQiZLXmiEf6967vcEJ6wZqdcSLLzKxKwuwWZF8fn34namEMsqZ+gyNGizJkdve2g5TZL0wAQf9t97VbobRoThmgc3e1MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777580675; c=relaxed/simple;
	bh=DWB13IUT+tZilbWnMWQhK+xwJLmcUZRAdiJdFR7ZyyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rk7sDwBUhhytRTTc+nrF7VFbPSE07jE/vaahDJvioa9WcRY+guHoW9D12XZTwojPvvm2L26ihK52GScgRb1jBJtz4yZFGTlUbXhyhED0GANtkGWOyChYLdhSR4OpY0Az5Ht2X21NLW8YztdC/cuU9C11CUUGlSuX7/6JrMI8K+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m19VGfL7; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m19VGfL7"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso8717295ad.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 13:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777580674; x=1778185474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fwYNaRQa3yWTbJ4ptDa721p3FgFqzB92iP4KajwkaNQ=;
        b=m19VGfL770437ftBUYJAQ2CrKLB7n7NmkIi7f+Ua4FYqyvhhbxcqrkV0qxcVxBsfs7
         ZKChFYAh766f5inLhHXRLgdPeJUfYTwBU8QK4yALqTYrlDY5RULPdexBcm5TKBxLApVx
         J/nAbN1mEZsoMM4m8bBcbEQOfySEGaBfgHB2vTckY+f+IKz1Fm2fqhvyl6moI9GI+L9K
         muF7suZK1HqhN8VQSUuoNqlpiXXGXqP7pgUQXNn1Guxb4LiK1QnMjF8Ggv9XdtoIRiV7
         OzoKzWXrBVwFo3wwDzkYGuaLtpvDI3B3tIhvXYfw1SAFwJ5ncK+NcbeKfSqgsrl2Y98g
         FeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777580674; x=1778185474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwYNaRQa3yWTbJ4ptDa721p3FgFqzB92iP4KajwkaNQ=;
        b=dKv3tkgNtaHXdML5CWsaAp27v6GVacoQ8/VwUoo4nqqsCNW7CgvUsx6/ucPR7Wt/T0
         oqnep7D4i9hGVpCE7rVULBsO433LJQFdFB+djljJTneO+VoiVRByN8FIFZigwm+Dxwg0
         X9ozgQwKshZe8urd3gaVBZluUL++Jin3FRgE42tkEB4fPOE+7+L4Zysa1TK039HkmZ77
         SmY3EMlPiFMyzpyF0XSDdDe9dHCBJ9kTXaeyytbbg+/qRGpajD0NQm+lqe9XWAFeDMqC
         AQo/or3QtYg1ba8MA96Fkl1Ug2+s0Ur/PzFr7u64sU834vAKkqke6jPaOa3Cgt7VDtdH
         c1fQ==
X-Forwarded-Encrypted: i=1; AFNElJ89QYMq8RL8iJQKbtqBHKuseoFmzwj7KyAQpdLf7JRKdm6QfuxwXVkKacM8wJuviYZYk7RVWYq+tdKQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzACGg3WXXtnxW1hgAVkH1adNaxiCKnLQLSjf/kmcXd81OcYLuT
	38FCAvPs3fzFBsoIm1hgVhn1Kolcf21V8cSLPrQ8NheiGLcpVqtLIrwT
X-Gm-Gg: AeBDieu0YWRXVwW/rf3xH5FrngZlqmmho3nQH1OP7cHa7iuzFdNrWnEBFtJSOXCpbCW
	4kuKsGEWJqk0DUjfSRGc5mMvVYHP1P1YyxFe82ZAWKnPfjUYeyN6djIJg17jAgzYvEoUKjJFwcW
	XYk+8n+anG4TOjqxPhS/WeKOOGlvgZm0w23SUqVkfQ/dCoxOj3CBWTsVtAujTTyXWCd7ygFQ29x
	2MBwmUTuv2KvGpahGZhoHEAcZ8KGWaeUxjTXlajUwbEQtGhgoxHrbbhHgonQtcZgb5HNw3BbxE7
	e7Gqn1B5BRy2IkURkWsiRMwI4bHf6+bD9r91RwV7jQtktF1z6ZhNwFkdSKgIxqhvB3aZkDWeplE
	Q4t3Y4/xnhiBz/Mm/waM0n0d+11BzPh4F0rzRk5lVQ+dfoNAlXtHo/n63D5B/R8SsSaHdsbfndk
	XKvw5Tv7bWYpR7U5ZGiKJEfb/rGM4jlxD+SCJBXmt0BIHgJLkIos9TZzv+Pq6NqOOh8vtBMtuq1
	6RGvG37VgY=
X-Received: by 2002:a17:902:9a43:b0:2a9:e8b:5326 with SMTP id d9443c01a7336-2b9a24bee86mr32016835ad.23.1777580673805;
        Thu, 30 Apr 2026 13:24:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaae662sm4651045ad.22.2026.04.30.13.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 13:24:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bf47e206-de64-4330-92eb-46ceda511628@roeck-us.net>
Date: Thu, 30 Apr 2026 13:24:31 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add driver support for ESWIN EIC7700 PVT
 controller
To: hehuan1@eswincomputing.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com
References: <20260430064107.1598-1-hehuan1@eswincomputing.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260430064107.1598-1-hehuan1@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/26 23:41, hehuan1@eswincomputing.com wrote:
> From: Huan He <hehuan1@eswincomputing.com>
> 
> Add support for the ESWIN EIC7700 PVT (Voltage, Temperature) sensor
> 
> Features:
> The driver supports monitoring of voltage and temperature parameters
> through the hardware monitoring subsystem. It provides an access to the
> sampled Temperature and Voltage.
> 

Please either address the issues reported by Sashiko, or explain why they are invalid.

Thanks,
Guenter

> Test:
> Tested this patch on the SiFive HiFive Premier P550 (which uses the ESWIN
> EIC7700 SoC).
> 
> Updates:
> 
>    Changes in v4:
>    - Update eswin,eic7700-pvt.yaml
>      - Delete reviewed-by tag of Conor Dooley, because the label enum
>        constraint is introduced
>    - Update eic7700-pvt.c and eic7700-pvt.h
>      - Remove the unused LVT/ULVT/SVT process-monitoring channels
>      - Remove the probe-time power check since the PVT block is always
>        powered on EIC7700 and the extra verification is unnecessary
>      - Stop requesting the interrupt as shared and use the dedicated PVT IRQ
>        only
>      - Reorder probe initialization so the interface is initialized before
>        the clock is disabled, avoiding register accesses with the clock gated
>      - Fix runtime PM reference handling on error paths by balancing
>        pm_runtime_get_noresume() with pm_runtime_put_noidle()
>      - Add pm_runtime_put_noidle() handling for failed pm_runtime_get_sync()
>        calls in hwmon read/write paths
>      - Switch the PM callback registration from pm_sleep_ptr() to pm_ptr()
> 
>    Changes in v3:
>    - Update eswin,eic7700-pvt.yaml
>      - Remove redundant label property description and use 'label: true' to
>        reference the definition in hwmon-common.yaml
>      - Replace 'additionalProperties: false' with
>        'unevaluatedProperties: false'
>      - Remove the description for '#thermal-sensor-cells'
>    - Update eic7700-pvt.c and eic7700-pvt.h
>      - Fix clock reference count imbalance with Runtime PM:
>        Replace devm_clk_get_enabled() with devm_clk_get() and manually
>        manage clock enable/disable to avoid double-disable in remove() when
>        Runtime PM is active. Clock is now enabled only during probe for
>        eic7700_pvt_check_pwr(), then disabled before enabling Runtime PM,
>        which takes full control of the clock thereafter
>      - Add detailed comment explaining the spurious interrupt risk in
>        eic7700_pvt_check_pwr()
>      - Replace wait_for_completion_interruptible() with
>        wait_for_completion_timeout() to prevent infinite wait
> 
>    Changes in v2:
>    - Update eswin,eic7700-pvt.yaml
>      - Reference the hwmon-common.yaml file
>      - Remove the clock-names and reset-names properties
>      - Move additionalProperties: false after the required block
>      - Remove one example node to avoid redundancy
>    - Update eic7700-pvt.c and eic7700-pvt.h
>      - Remove unused sensor macros (PVT_SENSOR_FIRST, PVT_SENSOR_LAST,
>        PVT_SENSORS_NUM)
>      - Drop the unnecessary hwmon-sysfs.h header
>      - Replace dynamic sensor info allocation with a static array and unify
>        sensor labels
>      - Remove unused hwmon_temp_type attribute
>      - Eliminate redundant validation checks
>      - Remove mutex and related locking, relying on hwmon core
>        serialization
>      - Replace per-sensor caches and completions with a single data cache
>        and completion object
>      - Remove pvt->sensor tracking. ISR no longer depends on the currently
>        selected sensor
>      - Move devm_add_action() registration after init_completion() for
>        safer cleanup, and update cleanup function (pvt_clear_data)
>      - Replace devm_reset_control_get_optional_exclusive() with
>        devm_reset_control_get_exclusive_deasserted()
>      - Replace eic7700_pvt_remove() with eic7700_pvt_disable_pm_runtime()
>        and move it after PM runtime enable to avoid resource leaks on probe
>        failure and remove clock disable and reset assert from
>        eic7700_pvt_disable_pm_runtime() as it is already handled by devm_*
>        framework
>      - Remove redundant clock presence check in runtime_resume
> 
>    - Link to v1: https://lore.kernel.org/all/20260109090718.442-1-hehuan1@eswincomputing.com/
> 
> Huan He (2):
>    dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
>    hwmon: Add Eswin EIC7700 PVT sensor driver
> 
>   .../bindings/hwmon/eswin,eic7700-pvt.yaml     |  68 ++
>   drivers/hwmon/Kconfig                         |  12 +
>   drivers/hwmon/Makefile                        |   1 +
>   drivers/hwmon/eic7700-pvt.c                   | 591 ++++++++++++++++++
>   drivers/hwmon/eic7700-pvt.h                   |  99 +++
>   5 files changed, 771 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
>   create mode 100644 drivers/hwmon/eic7700-pvt.c
>   create mode 100644 drivers/hwmon/eic7700-pvt.h
> 

