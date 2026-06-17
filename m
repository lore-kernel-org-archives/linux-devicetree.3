Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FEB494A05
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 16:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781713602; cv=none; b=TTxhJDP2K8vnGXL2qSyw5Ts1N0L3V0P1P4uXBPFGwrRGxvhf0Std5jMgVyQjOFAnj1QwYuQbUxgpUH9pa20lJgyrlC2VdvB2EbfkdhVy5itiIvaRzmpkNHRqA5P5zWsBx3+cdO6FpTJ7GRx2sm5nsW5cYJoU9idfS3WzMJXkoMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781713602; c=relaxed/simple;
	bh=yuTjtCSL6nDqPw5bh1+o5icGaaHPmtOBvYQ8hXVMyTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWKtpdaZ0LHDg8t9aAM0+VsSeOiFY2/IAjb1ZZ89eN+grfDxIWgFsIP2mWOuLWBMso4mllokZKQaEMMeWSTFOLethPtw3rfQEjjP1hKpk49JUG2R2iGJNjbhDtxQBOCBVe9bex0swtyodzJx7zRdJBE/zHGLckI0+EYJPEoMrwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2+DqcHQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2+DqcHQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so41610195e9.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 09:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781713597; x=1782318397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=048WwcP8hXWTPpyEKeHyvAZ7Iw1D9/1dB7sPBKVJt9E=;
        b=c2+DqcHQjA0QrGtPnP6aYWJ3HqvwIzBbXk1wtIKhw5z9PZuoMvnbSNesMTs6cc5o7z
         aEr8agzlZqx7k7C4LYOyBygwml5GvEhIWNWpXP8kqAtBdVbJiddnbCHAQw3wjSJB+0HP
         g0C46SKN7qxjcjMopoVwMF1mVXxzPgGd9EjTvGzJTPELusbua8p1P3wjKD5ZsecIsUcW
         kEYy4O6RevMsZQ2oNmeAyXA+I8htA1dp1UfnZY2x7WO0ltbYsIjttsKCBvoDnLAHakzI
         3aGNKTEx1vj18+PAv9yPaaayUYCl9SvDYNSckuNSsMryGD0ckwQXEw0NAsSu8CzLEPae
         WKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781713597; x=1782318397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=048WwcP8hXWTPpyEKeHyvAZ7Iw1D9/1dB7sPBKVJt9E=;
        b=Njr3FOaT7Z9kdYHCdpoVZUsTN6Q690bPSMqod1s6IDL+PnZ8RO5vnAfgnPTWqt7kQd
         Y40nIRsfMaMAS2ibfMrErX/aWU83VOSUgDr/c3bnECzgtlYcZRoPuQ+PebyTbWfeNY5z
         q4oOvJ8w8r64rYkPBuF9/vGebdZ/3vIaA9FoWulB0LxiaTtJaJqVJ4PlDBfpmmUE7Lxi
         gycn7jJAT9vDtpfCoOZBQ8PgbJ5HJHcF/3X5d4BluWv0da/t96/q5efxKbG7kP1/MlKQ
         H/20FG7bWiERRznUE80Ngp8/GCWE+AOA2YiClX+9/Bw7ArmSLjanDRjQ3BcaTADL1Y0V
         7UHA==
X-Forwarded-Encrypted: i=1; AFNElJ9u+V1aYMmLtQU6usdHwRwcnoNStatUtiTB3tOW1BeC8JgBHOos6bDu0HvOLOFxfA1ly7XpY/hJ4mG4@vger.kernel.org
X-Gm-Message-State: AOJu0YxFZB3t1/OLIFscQXASdqiAUEqCsX1+iWPoHBwSQjdj4ZAhX6q2
	e94W7oXk8hkgs11EHbwvWx7vNk6O/b3lZR6iDeEatwOjiuAnaHaFaQGD
X-Gm-Gg: Acq92OEjg2zcV4q/X760kw7fuxZqFJzloyoizw3f8X7Iaxd2eLB9cC6GOQfkVwApGqV
	7MFbfUJhzD7H7lYKubeTWUcrYrYPU1PUy8fRzEFPhOatEnKvH2lAe3otz+/eQYr4qBVEMk6wpHQ
	k2WcgcZkbqGWfzk9RnqfjNq4wEUC0gQgrr3+g1QO2Pfh0bbxRPfNhsyeLoaW4sd/in8sEuoVCxu
	KLU0dmcDjaMeUIVtr3IQMtq3XDhtD5JSEyiTcRq5Be9CPgZa5fQk/V79s2y7vu1C8fFZ4L4L6Z4
	SOp4kBmDWYO/IEVR1m1p6d/4N9lhgkw0L6n+BziqdPmlSva0gtmzHlCcGp6cntkRN9KzgO9cono
	Ar1BQnWI8h5+3igJhE/+Gf4Fcpoo3Uj3KS6TIGitgxWT2xLLZEtlip8Gp/GW/D0t9tojpyWEMPW
	bCZZH1IOqTj0pKe6qFuzcxbs6jCDbGn8IKT4lTmuOees0nBC9UytBwCg7ANjRGK++1POPX5F/Z5
	X7YieY=
X-Received: by 2002:a05:600c:b43:b0:492:1e36:8c4c with SMTP id 5b1f17b1804b1-49234142053mr49117205e9.37.1781713597036;
        Wed, 17 Jun 2026 09:26:37 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923687d2casm25491995e9.0.2026.06.17.09.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 09:26:36 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <1d0b09e0-66b1-4170-bbac-1e3a39ca7be2@gmail.com>
Date: Wed, 17 Jun 2026 17:26:35 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] iio: adc: ltc2378: Enable high-speed data capture
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 dlechner@baylibre.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, pop.ioan-daniel@analog.com, marcelo.schmitt1@gmail.com
References: <cover.1781661028.git.marcelo.schmitt@analog.com>
 <9f173c47928446aa3e900cf0becb6130dd76846b.1781661028.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <9f173c47928446aa3e900cf0becb6130dd76846b.1781661028.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Marcelo,

On 6/17/26 03:04, Marcelo Schmitt wrote:

> +	select LTC2378_LIB_OFFLOAD_BUFFER if SPI_OFFLOAD && PWM && SPI_OFFLOAD_TRIGGER_PWM && IIO_BUFFER && IIO_BUFFER_DMAENGINE
The PWM in this expression is unnecessary since you're && it with
SPI_OFFLOAD_TRIGGER_PWM.

- Julian Braha
