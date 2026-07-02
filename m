Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AE23D646E
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993321; cv=none; b=uHHpus/or1X2+x+YdBRVzDX/RcKK1K61n4iIo93z2JPFbH0fsQxDvnLW4LepJvSqQjRC/oBAyYHbJHctEcHyaFZkAq1jL2g4Hb2UJQSwgTaXfaQ5V+e7TJdg6SnUJfYkEBvZD93pdRAxq74uXbpOeLNGA4rgod+qMt5Pq0Bnb1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993321; c=relaxed/simple;
	bh=3UWePbw4rKjLE9jN9ka4BAbk+tU9/kzm9ZJJmB6lbeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J5oTBG6MI/hafuWCN4kuduBNWvj3zvOTDl/GRDT73VRlDktvvY9P0WzfmMIzWrjgqc+NuM6EwhuLjHKUO0b7JsfSAWA4n4oGQDXIM+nA2wvV4BgvB0sDP6LfVf/fQfYAEzHkW7264M2DhtAyNz6YblvslyloDL42Isvbiz03fP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULcROm7p; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULcROm7p"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so11985185e9.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 04:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782993319; x=1783598119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=t0V/WwhcWDu6tebPbs0Nt6qIlHb80wmhn3NHdOSdGwU=;
        b=ULcROm7p/zMsmFIiUn/Pecf7zLZxyBITk7I+ISXvuVhweGckmqfLSwBDebkpaGzPxS
         0c0XplhV+AR8lZpor6X2P31uZ0JbVmmJ/JiaWgDdFGoCrzsFAhyDqt9h4h+2KIjvbASB
         P49j3CqRUMEtbiK59z5/tjRAh/6iVtC3qhBgcSoNT0Sf6ETxY6gVQzO3CmhtkXUelYac
         gsP4sAcYW1b545RGKtIumLrfu5N2NY7FwW3ZN4K/nGmkKwaPemUgAmcskgohfDaux3u/
         gIovU653/YxGcAiAdme1vtc0ZYMDJUNur0lJasy1IjucECtlcnAExDly9KzRB9Fa4pUx
         Go2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993319; x=1783598119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0V/WwhcWDu6tebPbs0Nt6qIlHb80wmhn3NHdOSdGwU=;
        b=WYyOAnP0sT8Cu4nbyl+P6jNZ9wfdt/DKXyuCp7SiXKk+S6TGnxH+BLE0hOMaKWKkiP
         P3wwhbYSwWufoF6R5uw2m0XBS+3dl9gxFaXqeP6Y/59QBKIqs7lFyFFkhRiH/I9vwyCn
         UvPO6Yd+d9ivjsa/5G5Cd5qIWLBOCugbHcS6aH4aK0om7wzwDZ2dIIexCMNE2NH0EjXz
         d0Lona233mJj7MF7Bk1WNm5rCZ+2Y3WCCFk8GK/9ta2KoREtDOiDBdghCjm+p4XK7ARY
         FW0CKShuyGDWz4VQCiAr+1hv9yP7R3KRRNvnd3mHCrAhiIr/DEKck+E26FPClseRXttv
         y66Q==
X-Forwarded-Encrypted: i=1; AFNElJ/8ZsH0KKWNRtnJz5y8xRNGyrXVOTf/sjW3oLR3WhuiRz/3s7ngU6cIGV69AeCBHOlclgnK/xf95JYc@vger.kernel.org
X-Gm-Message-State: AOJu0YzuokzkcgV5KTTqvZUNEYm1zFLUxuGlY0v4fftjoWjIcEeYKQ8A
	WCzCQEsIGnGaSQqnxDWWyAeeME6TK7jc9VZkezUeVbWMQQ1S5voxAwwc
X-Gm-Gg: AfdE7ckaS6OvXIdve0M/M2Xhg7VdtKSqAinQmGan7yxgEv3STI0wyWoIQJWG0kN6S8D
	UlcYsIX6IEPSQl5MJamyyl9AudB+pDzA1Pe5V0mI9fGSThPkQOSXOaQSTM/W9TnQdk6Z0nCftw3
	YXiwwJjSe8pP/QDtojzgoxXN62cnOcRxYQuOI8CFkpMLsqorn1O9my0sp4VmFZ4FRPLJHIQSzO1
	SA6j6myTJeBe1Mt9YSfOwKr8kznkkHN29IFu5IwoHr9l3l79iPPP5z4Pihh0Mhb12WhvOrUEFZ8
	cOLZk/pYdfZQfVMfXjkorhbIN/LtBxdBvJ959C2EiauYqZASup6K4LfxP3zpgUEYVySSFpkqjk0
	2hxrDHLPq6tLlGP+ckd7xtkIISCZQnlcTful9oJiRukETElVEjmDVuq66S/VRh6SBE6gNFfMo1x
	xxPLrn+w8iZ7tHplwwMD3cvWRlh0eTSjt1xa9G9U+sbqwqeSDx6vFr1H3VU89X+YCIaAYsOpsBJ
	JoTfWja
X-Received: by 2002:a05:600d:6452:20b0:493:bd53:ed00 with SMTP id 5b1f17b1804b1-493c2b38bebmr65763435e9.1.1782993318900;
        Thu, 02 Jul 2026 04:55:18 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636c8b9sm45179945e9.10.2026.07.02.04.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 04:55:18 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <575b53a9-dc42-4510-9466-7a55f6eed22f@gmail.com>
Date: Thu, 2 Jul 2026 12:55:17 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 5/5] iio: osf: add UART IIO driver
To: Jinseob Kim <kimjinseob88@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260628191337.937-1-kimjinseob88@gmail.com>
 <20260628191337.937-6-kimjinseob88@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260628191337.937-6-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinseob,

On 6/28/26 20:13, Jinseob Kim wrote:
> +++ b/drivers/iio/opensensorfusion/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config OPEN_SENSOR_FUSION
> +	tristate "Open Sensor Fusion UART IIO driver"
> +	depends on IIO

The 'depends on IIO' here creates a duplicate dependency, since you
already placed the import for drivers/iio/opensensorfusion/Kconfig
within the 'if IIO..endif block' in 'drivers/iio/Kconfig'.

- Julian Braha
