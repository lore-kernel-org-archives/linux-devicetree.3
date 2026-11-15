Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794705773;
	b=EgPjUx7cP1UM2fKCpYQY0+jdH0PdSuGRZGrA/QnjyjyEYKRWcTB6vMNIrHSQ2Mj1ePvg
	 ADfZ7mfF8yNVcFNGPCgoZd79jZ3I0LiSEpBVAnwR+rPo2zkzbiGL86a2m7gyQR9XSuODn
	 +GdOceNZkbAqcWsPwWA3US+2UPeSKCPU7JYHgxTK7mzW4oyySI/wN1HA/to03kJRauIAe
	 dzx5cEi/yQdFgYI1SQwBSkBgW5g8g0ZLWtW+5Lf43Brd6fLDF6SRjmX94qPPIzlqFeRYm
	 82T15dHEXfjSAqkh1+kuNxGP2lPsF7tWdmAE6AAEcIJdeDz8KoxFFuS8t1P9LKw0jng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794705773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dp/67JmcNvmFQHE7Njd0ridip6Zcl0Wn6uMgmcNbwbU=;
	b=LtViOjMz3AhtM8KcRpknd76N1I3Mk81hkukd+vC06PaPSzYjZ8xGBaZw8kEfODKQR+s4
	 mxtmFfB9wfLU+irEDwEXu4yuzJxF3gg+SjLjyfDplcn14xUU1PLS1sPoV09mfvr0V6PzK
	 kgUbMOmD0N4ZhZ9fmfMJbrXlgf6FIxw83W6JoqDZhZnqTyqHY167ESdneN4BWzwsFhGIQ
	 vbOxWC7mFmjydZceipe0qKfTKpzms0H4Vjn/3rTI02BcO5M12ozPL4uaHN5uzXZODXF+P
	 aX4fyuzTmTLzV/CLR4H4400Gz1TZpacfdt5B/wpMsg0sdA1Ie8g+3gRTFEYV9vvMx5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXvE48TK;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48057606A330
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48057606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXvE48TK
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so3899618a12.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 17:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794705771; x=1795310571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dp/67JmcNvmFQHE7Njd0ridip6Zcl0Wn6uMgmcNbwbU=;
        b=JXvE48TKiy91S9dvEv9At4IP8YWrv9G85CuWVftuPW0Nm42VDo9KFgSl0Wt6vcS56X
         H/qmdvNli+F431Mg85skwEVk3uZHmXjh03Qi1nriXU+eIVvL33jxebJhCOEYHkhdTzpe
         qqZmE/91d+DfQD6wRraqOOfh+6h/j5NhZExktRhovVugD8/uWjdRZ5edtEdRvQKSbyzS
         f2JkGxlgs18vVYYXWbHFihlv83Ce+ekiPSYHXuNjHYNdv4NqwZegVHcEX7C9VocMT2zZ
         HChWwWqXQwoRrokeuXsOueXT9eKfEoso4m9TOGVYvUa0b1HSABp4Vy3dHtUYsJRq4o7h
         Ty0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794705771; x=1795310571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dp/67JmcNvmFQHE7Njd0ridip6Zcl0Wn6uMgmcNbwbU=;
        b=jh5ufMoPomXd+HlMnlqXyf0rm+4Z7nKZE3qmyu6AItPkRVWZxLFG7m4wri7ch2JyUR
         zxSmj/oXj8q335A4avae0YhuywCYSVdzgTUlMkaw8XCjsA6zPqCn6aCw6/8kw3unZfgw
         igQ8dhLnMxvbzT5ifoC2x+DOyoR2ONM4acoD0YTv1q5uTPgJ9XigsNCMXdRbUz8fUtqa
         jm9v2fIyRto1X+nnVSxjqkroFYr/xFKjxX4/CmKYKdRZmmF8dD2nBOYG4cXdxpPcRokw
         dchZvmC2alnYqD8FdVad/Wd6vT38Q/VZpbGs3vVzjmGM3WBLO86z7EKn04QVCeyDuOz+
         5Wbw==
X-Forwarded-Encrypted: i=1; AL+hErFr+0yJRcICmY+QujRJlY9rfFXInLLCoELb/PBddZhryk6+gT7bjlLXHlUzxZ2412S4yqQ0MSfpNpFT@vger.kernel.org
X-Gm-Message-State: APuU4Z/bn7l8rHpbkUq44Z0oT4wxD7EBlhjwXXMjgSD25H4Hc5+RdIna
	xz1z5qg+AQHovVzhJJWb6j9EWxkHXlkP9CHDwP4tTidAXLNjW6xVnHk=
X-Gm-Gg: AYBFou28TMY0I3fi89p0lfpQvANdnuB9HEup4d8T75KL/3teInpdAJoNTSoK5TCnOEk
	dRnnIOjbgUylgw/nLFVoii9nx4nVP6Vda/Bw/lozEY8fTruRGUmhbIZppi3uk6F8FKipv6JAVVt
	AJuEYyRNEsK7Gg3BwavB6m+lSyxDvXut/8QcjqdWxbvfjrZz2OS+xh+nktiTZa5yDyJFYHrjzjE
	HRSr8D05UQH8sykbyV2vB3dxl25m56tbMrMCIMuq6/wLMzXUrZsGlol00aTFFl6Jx9BfE+OhN4u
	tBuqoK8kHKNPXJXUXuSbq4ibQ599C6NxEtqJ+EFi0s/OPVCSAwV4t0Yyi4ainp1RsGL+ylZEQds
	w5iHcUDySBUWyNz5bEdoAlsyyy/aYNlXgeqcO/jkqUPA80Us3fJbZ9z4Kz3OrB7WPY+aVrJ7/R4
	wRqwCazg+FcC8q4VnbmxmoVBCEJDbiKRL5/N6SNKjyWywmwYikp6zLaJ04vvI35X4OBLt8F338P
	MfXyU3kkn8cYk9FIyyjgt3yYbHPXnweGlkrhZf0MpUyGOY9OhMXD6dRECuA8NLSfqsJGb4/JtkQ
	iC1ZiRV6uKwhGFeoPxWs2g6QrECrBeXLma40Df7dHytkP1PCoPivnpzS6dtsCwxpqOLAR6X/8Yb
	nFa+LGoEWGwSE/37aWHYrNBqT
X-Received: by 2002:a05:6402:849:b0:6b7:c9d4:6b96 with SMTP id 4fb4d7f45d1cf-6b7c9d47044mr4130497a12.8.1794705771576;
        Sat, 14 Nov 2026 17:22:51 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c6a5924bsm2636697a12.18.2026.11.14.17.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:22:51 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: val@packett.cool
Cc: marc.lainez@gmail.com,
	luca.weiss@fairphone.com,
	barnabas.czeman@mainlining.org,
	danila@jiaxyga.com,
	sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Add driver for Qualcomm QGauge (qcom_qg) fuel gauge
Date: Sun, 15 Nov 2026 02:22:47 +0100
Message-ID: <20261115012247.621144-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112170841.2189322-1-val@packett.cool>
References: <20261112170841.2189322-1-val@packett.cool>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Val,

On Thu, 12 Nov 2026 14:07:26 -0300, Val Packett wrote:
> This series adds a driver for the "qgauge" battery fuel gauge
> present in Qualcomm PMICs like PMI632, PM6150, PM7250B, PM2250.
> The PMI632 is used in SDM632, SM6115/SM4250, SM6125 based phones.

I tried v1 on an SM6125 phone, a Xiaomi Mi A3 (sm6125-xiaomi-laurel-sprout,
PMI632), on top of next-20261113. Board side: the node enabled with
monitored-battery (simple-battery with the OCV table from the stock
profile), io-channels = <&pmi632_adc ADC5_BAT_THERM_100K_PU> as
"batt-therm" and power-supplies = <&pmi632_typec>.

It probes without any kernel log output and reports sane values:

  capacity            66
  voltage_now         3979548   (vbat_sns from the ADC: 3.98 V)
  voltage_avg         3979937
  current_now         -72631
  temp                297       (SoC TSENS zones: 29-30 C)
  charge_full         4048000   (design 4030000, so the SDAM read works)
  health              Good
  status              Charging

Two things I noticed:

- voltage_ocv returns -ENODATA ("No data available") while capacity is
  reported at the same time. Is that intended, e.g. the PON OCV being
  used for capacity but not exposed?

- status is derived only from power_supply_am_i_supplied(), so it says
  Charging whenever USB is connected. On my phone the charger float
  voltage is limited to 3.96 V with a local patch and the battery sits at
  3.98 V, so current_now stays at about -70 mA (discharging) while status
  reads Charging. I would expect the same once a battery is full. Would
  it make sense to report Not charging / Full based on the current?

Tested-by: Majid Hajiheidari <majidhhdri@gmail.com> # sm6125-xiaomi-laurel-sprout

Happy to test v2 as well.

Thanks,
Majid
