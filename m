Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26204428821
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892532; cv=none; b=Im+qQdJXv2ra/1ERHQ0l+yrn0B1QCQPxclMDOuWgQY5bgzfRZUflNlec/bhx4wL8XHYcUvImAamsUCNFiL4do8g1Nhf6m75iwmQzJmo/Xqq5VqrmwvSI+ti84xBMVzviXzQKlTsSQ56co6FhhEoYwIAKB6n9iyXlgkS0WYMNdbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892532; c=relaxed/simple;
	bh=UHrDsfIT6HzW7aWOXvesgl+qtaLdshwBJ70KFyyvRFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVJTC2J8l/vwfIZIr6DgtaYgG2T+nHegkw49bN24CsM0qhJmW5JYwX7DAC2+2vFUVWJzdh39uI3fbIaUTa3EQwWPOfppPOHLERCPtIxc7x2rDK39tPhEQXNKdkRXK0r1RmgsY8TkSXj+SFMC/Lj2n474prhcxc9q7FeFHx/rZUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSGJ3bHb; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSGJ3bHb"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so8363578f8f.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779892527; x=1780497327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5vy/NGwlSl29v1ZVzHPZqFuobCQzqOs8JJ1RlvNBnU=;
        b=KSGJ3bHbfHnyNfGdI+zpAAWr+MnOoFYBu6RZ5m+xYDPLZDyzIdCOxCHVDQFiQbhP9r
         FfYttF+0o0y4M5/R6TKX+4QBUz1na6zfJFans66JYzQoVgX4HBNwJ9WX/pyL1J4507LU
         IzhOjyksgM0LA3fEWiYzSorGmToerFf9Ir5oXUpm1aK+CdBGwucLqWDkAKk1OLEV25y3
         2IQvzuiJHIpoB3vxFqf1Fdu20d4zWwBt+euzqzxDy1aW48+y5menUIsWIhaDSxe7WJwd
         QQCHjoxC0wj7AbMHpKpspMRRzCtJrbwqrcV2UG20fTvzWErpnxqSgRoR6rgz5Q6C88gd
         dXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892527; x=1780497327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p5vy/NGwlSl29v1ZVzHPZqFuobCQzqOs8JJ1RlvNBnU=;
        b=MoHfNvKlUxFYJtJJbOdYqBScrio9JNB4h+AXDA7dgf1djhZeyYnk0cLf8LkwFuhza0
         fFini6SXVF/YFpjZ64gx/wMePXw6IUJJUfHYewivJtkqgDLiviNjP1enKvKBzexRQqol
         ENsfcreBQ0mxeJoOutwsfIzLmLMm4yuaEtQ8dWlWCC4g7P0shfodVcLAijvX3XHrCXAH
         O9+4FEM2CyS8dsOxnJkt/tEFXhGPsxxGN5fuQTs4gFEgXa2hn+0UZpPoDPzGKkYV3ECi
         KiZXkFGaZQpZHR/LIHN+6zetZmvHUUBvhvDRvIn8B5KQj1+QqH768LVPnIo505TdJ9UE
         K/3w==
X-Forwarded-Encrypted: i=1; AFNElJ+m5T54VoqNF4xeyg4IRVggJ+IosP9xQ2YZF3R4ivTo99rDPoRmx1AWGKwIw6X4MxmJxHkhzrP7ZeQy@vger.kernel.org
X-Gm-Message-State: AOJu0YxCtQI2Oo6QrFkOnzuCiKus+FXD1SSyWXSCBmqn2pkv9++DyGTD
	lRpZR0CkfrLuTOw6eDfLDFIn5IYkOOEtVADisZbif4fWEhj7olCPva0u
X-Gm-Gg: Acq92OHStlwhOXJpkel3ED8HPD0TA9QW5k1fLH4udhEBCDvtUcQs79ljvll6Cgae1J1
	EU+2tOZvcweDbjmqb3Or+bTSjNilXx6MR9p8FUjawlrmMJRbOZTxEEJk8ogIhxkUOI07qihteVG
	ndBL+JUJOGF1K89VCvC9X98wt6QxbxUglFOBbGB+I+Ipwe97Za5I5Rjeu61MUubHh7GSZP2RVgV
	W53aCc61fQUbiIEgsVRpZiLbXaIELdpcMdlHou6uNj1kaRFTAvKCFvecJvJnewryZCCq+q5TaO0
	VMNTHZ9+z6vXyXksjjHqiuPt7E1ejjXUtXH3iU9FdnpszhA8xUFzFP+p4v+j3om9e/EP/ajlN7X
	FEixRkkkgWwbRCCizGM7+80rm/Y7T+YKWAY1QMiywGLLMZ3xx+CFXHv6hG2tOL0O5c56mfhKLfZ
	YQ0e57
X-Received: by 2002:a05:6000:25c8:b0:45e:b9b4:c68d with SMTP id ffacd0b85a97d-45eb9b4c854mr33983914f8f.4.1779892527240;
        Wed, 27 May 2026 07:35:27 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5584b8sm6239763f8f.11.2026.05.27.07.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:35:26 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jic23@kernel.org,
	lars@metafoo.de,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] iio: types: add IIO_VOLUMEFLOW channel type
Date: Wed, 27 May 2026 16:35:07 +0200
Message-ID: <20260527143515.102794-10-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <95f0914a-cb25-44ea-9cef-d203c624f74d@roeck-us.net>
References: <20260524205112.26638-1-wafgo01@gmail.com> <20260524205112.26638-2-wafgo01@gmail.com> <95f0914a-cb25-44ea-9cef-d203c624f74d@roeck-us.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 24 May 2026 14:39:06 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> Two questions: Why restricting to liquid (there are also gas flow sensors),
> and why litres/second and not per minute which seems to be a more common
> unit ?

Both fair points - Jonathan weighed in on the same thread [1],
so summarising for v2:

  1. Liquid vs gas.  Channel type in v2 just says "volumetric
     flow rate" - no "liquid" qualifier.  A liquid-only sensor
     like SLF3S uses it directly, a gas sensor reporting actual
     volumetric flow uses it too.  Standard-volume / density-
     equivalent gas flow is mass flow at heart and will get its
     own IIO_MASSFLOW when a driver needs it, rather than
     overloading IIO_VOLUMEFLOW.

  2. Per second vs per minute.  Going with seconds (l/s, later
     kg/s) because the rest of IIO is SI-based: integration_time,
     sampling_frequency, accel etc. are all per-second.  Drivers
     whose native unit is per-minute fold the 1/60 into _scale,
     same as SLF3S does.

[1] https://lore.kernel.org/all/20260526165950.6ebbf673@jic23-huawei/

Thanks,
Wadim
