Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9273DE45B
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781353677; cv=none; b=t8uuJHyLAnNYAZtw/GJvn7OFbV+3us1cPsLbCvvPWv3sW252HmzJ26Ud8WCoeZxBw65YLjsi8RXIh7GRoMIVQI59PR4A2Y2Wm28kg6NHUv36WNeEKFC3l+aHYZlj2zD7c1zXqhGN9hK4k5xLxlWaebS1qFa3x83ZBIIAPMiC/e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781353677; c=relaxed/simple;
	bh=wyBnsEG/WaX5EAHS7GvLfH6Gnbnh7zVFPoJRpUZUsFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FnVRNCBncLgqCYWS7xzuVjKizY8gvy579fJXbYcp3IkwarQf9Fykj0jCIAwbi2hd/52vwDyuOx9gAgBA69mKlwXcYVao6ls/Pl6AF0bbiUVBZnSaLkrMkuH6Yj8khude0VqUqrjHRx5bHnJDUVMX3twILLDhNgaehCfklzjEDyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAoygz65; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAoygz65"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b64c8311so19401475e9.3
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 05:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781353672; x=1781958472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wmpCRbwKcDT9ljmI6gDYWNgoa8Oz6gngcqL23DluDRY=;
        b=jAoygz65cM6S2sxyLIdQqb7ABrNmv5VDOfcEpA8RZ4hxGICQJqb7g9Oaxk4M0up1nQ
         Re4lJmxKUhbDS59H1Lp4Fx+v6LMYtHTZfY/Rajt/j3TQtMtOI7DIR0Rj1CwB6ecqe0C0
         N2/VIVLrR8jhfc+oPy9ldfGVuzJEBSHa3yFk3hDYySDdS8lYC3Hqp7omW47foFVhBFtp
         ZaXofMlX5JLIsCtaysxr3rCQ7q9FdtPMyEI/2EsYbAppNNOVbylNHHLNz1iPHIlrfoOy
         QQmQrRRrZpNvgtqzAEFp896LwVWc7N/6Rb0H0sMuhUBxHwVa3FAYIxqXGbd04gKR5Dgc
         Of8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781353672; x=1781958472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmpCRbwKcDT9ljmI6gDYWNgoa8Oz6gngcqL23DluDRY=;
        b=GWk+C845jy9UPlsv3TeW0iBQ5+By9z3GyjmAcdxfqktckUDPZter1xRtHqbzoJAvOr
         ZB/A7YKB/tYSCIwbtNTT82B3oBPT/yF9cEgCdWV8rzcgiW1UlXBlvkkmsupfkFZSWoN6
         nAA3WkkVNuw4Dx90p8dfTmfxKH1ciZQC2nWLcSM8vktE3isBbPXn3zEO0nusjFaoza7h
         cpMsh708l2p18cpstv8GORrtkbA14Am8mEhu4zX/+pzOQk+CjHuekcxo38x5UEHCZglY
         cIwJGw1WgEAXgN5skoHc8Vqr7oJE2RYjR8B1+CxG/00zESFBh+gxfu2F7uWZnAoVgwfR
         +AAw==
X-Forwarded-Encrypted: i=1; AFNElJ+8n/hI6DBaUgsnd+P8MTsOH163LLlPzYDbTCGCYKDbbps7TZwB00TUnuin7ucg2rSKwyfnrztqRHRU@vger.kernel.org
X-Gm-Message-State: AOJu0YzuoKQgngbH7z0mpDbi+JDu5cvSYM4md0mYBpXwgi0odo3oogwj
	8Yr4fpMOi6KpOT6lMlCeuyrndlBUn1603O80txGFHbUotBBi/MapgO+6
X-Gm-Gg: Acq92OE/5cmON3hn9yl1VO54uMcIMIi+xopEt8J9gLGyHnHC0LZaSubOn9i6OT6+NvP
	QevS2dHCkF8gk4yY/vreRGtKnLMtz1PJDR4TB0+N0gkZVLJxJwuWGyOQmZLS2khwDfkqMUWQ2s6
	/NnvYN3B8Mmn5ruYLgdFKc3JDdeJwPfP49CdhwLfD1lavFuKipTz+X/9L0tGFp57pyG69Um9FjU
	2aSSWv95DrF2kVG5cMhdHuFfIGpP2FAmpGSstyJ14EWFUqRAn6jQKPg5qtZe8HOK/Ep6VXEhzfs
	yBqbao4LJZpGQirbNJviONIIOTMOb33waf3toqgaOfi/u2UHQl6qTTg0o3jM9qSJuxsLVJu5EAc
	BV7/MMenqRsChuBI9JNoOon4021ljKRPpsme9sKIKnhMONy3svCYZAyu+K4rxSJulhpuZ1AZ8LV
	vNR4csOMxq1X1C/xmTZn9DbCGIpmznrCtwK3h7SGac7mB+i/UxWrBqdv5+PlGWzms4X5OaUbOTR
	Dwpj6SGajAGR69scCjkMCh7XppAlA==
X-Received: by 2002:a05:600c:1d11:b0:492:1e36:552c with SMTP id 5b1f17b1804b1-4921e365572mr47345445e9.37.1781353672276;
        Sat, 13 Jun 2026 05:27:52 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202e5cbasm62586845e9.2.2026.06.13.05.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 05:27:51 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <0b6a7f41-b753-48dc-b46e-77aaf0e999f4@gmail.com>
Date: Sat, 13 Jun 2026 13:27:49 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] pwm: rp1: Add RP1 PWM controller driver
To: Andrea della Porta <andrea.porta@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>,
 Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
References: <cover.1780670224.git.andrea.porta@suse.com>
 <f8dd46a553351adaf9d29fbba9f98e803b672fe7.1780670224.git.andrea.porta@suse.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <f8dd46a553351adaf9d29fbba9f98e803b672fe7.1780670224.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/26 15:01, Andrea della Porta wrote:

> +config PWM_RASPBERRYPI_RP1
> +	tristate "RP1 PWM support"
> +	depends on MISC_RP1 || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	select REGMAP_MMIO
> +	select MFD_SYSCON
> +	help
> +	  PWM framework driver for Raspberry Pi RP1 controller.
> +

Hi Andrea,

Selecting REGMAP_MMIO is unnecessary here since you're already selecting
MFD_SYSCON.

- Julian Braha
