Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B830393DEB
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 15:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778426000; cv=none; b=d9a63B/gFGEU6Zm/IlK8wwDlUSonpURral2WKTPSDNs+NkGUkF6a15TfDhyOnrqatnQL9122yNbD51ANGU0/PKv96ESkP0PO4Xauord6o0uy4ItJlq5ZiRQNXnrKhmk/9ttcFBiJkcz78mb+kT69GFiAtNCr/JmueNTRUwOwOGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778426000; c=relaxed/simple;
	bh=i6+JW7rVUmoWcBOV/L/yOlvX0gMO0wAx3rBSDwVM434=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=H1DpXsueINPL+BdsCApPcyr3GMD+QjcOQm6oWD5GDHhCuKrKadR4VjSPjDepv8BR/G/4bNoXABZttOUhhoZFDOfRMMkK51NHCxc+SKAKxhMdznDBrUqqPbOoQgtwlAjQZcaaM9Wxzp/z7Umf31iT+GRL4whGDa50NZflEkEOEOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WM+saPry; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WM+saPry"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso3371903eec.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 08:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778425998; x=1779030798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BqIgTKcB1exinKjhs91gucKMVbBg1KdH5vs/6s6BTwQ=;
        b=WM+saPryfCOqT7U2TWwmalgc8gNIAxCdIVDpUENKl4OzX4uL4IYP8xmz5sxbE2Qbqm
         jD+i+etfO3fAOg6hf968KWBb/x1XH9SgWXwr/ILi9TV0jzvFkqiWVHaiSwYyK62yR4kR
         X65SRMNKv1Tp6aefXDoEr1XkYz/BOeV8ZKf97rf5KIVJnPvcUWcpNevYIFI0FHDXETaj
         wcQA8M9JU1F2CqleESAS7GaXMbYCXNw+XvZOO2EiuqT8mDn14xw+OdpLkDElhrEEIs1B
         nWXx/tdASpfpib+UlXxRORr+oBc9SaB2sZYYcsWH1yAOpMnS9CwDNVKUWa7OmrSpA0Qe
         2BTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778425998; x=1779030798;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BqIgTKcB1exinKjhs91gucKMVbBg1KdH5vs/6s6BTwQ=;
        b=MEkCl8wykprIDqAWJCtRN0WrYKQihvIOpH+GT/fksv+sbXqgOJovk6O1rKzMi+OB6/
         HebEFXBg6WaXMcpKX33kpv3Z9keHdk/K4vezoUKb4XLvzwYTn8ULDpM3Y9ELnG0mt786
         zOwhpaKfT5mXbncRvaCLdqtEAR4UY34aIeVo+PcNGPj91dwYCu7Ti4ow+C26BDBr6JAU
         PehUonsUtsXNVHMBicrL057yjgUTqeDYWO9EkSlEZBDWjC3r5JqpZHDuMU2ESoyGNAeE
         0DtnURF+dIqX0kNckUBRf/YiZXd/1wRo+N3L87tTsLnezomwRT3sDvCet1fZ3PD0Nv6b
         zfKw==
X-Forwarded-Encrypted: i=1; AFNElJ8yvuBGNDLOlNAZ8AYHSNbvFYGK40yA6xY1vfGTMIdC9VxOYju629HN7WDEeRNWP9BQxwt9FacJpws7@vger.kernel.org
X-Gm-Message-State: AOJu0YwcpkClb6X+W8gfmb1ZMT0+FSVhqfylXd9dgIyz7LxOc/pmAaJE
	yUBnLDHqmSCKxRQuwh4vbdlXP1n0ceJVEpwoUy+9btHVCAlmSDPnmMTd
X-Gm-Gg: Acq92OFUeHCy4GrRqtiP1uJZMJCRQ1YEqBpi92YU38BA8Xyg6gMuzEpJHLIHxGgsb94
	aHd1MqlpJPD+mFkoexAf59vJmQ8JvGEkdkpVWQGcjqNDENl6q+4UqYAMLuMGUDhq+zQX6a7B1St
	1eVmjbheUeLuUnC5LeqQTawBgDqYvdfNXDxPsHCQgIaa5x7aMugZ0uS6/l+GJsDJfkJGjmbz5ui
	GzDfk5Fan4lpyiMhaMdMBgSoV/i0p0mUww4PYhLztojwAk+v8DYcwoTSJ8f2u0X/eAPPCtegOb8
	fGO87KvDGH0L32ejaDzXQfl2mvSSF6cYWipD/YD3j4XGknyuUEkqQFja4Aywk6RkjH3CXGtHXoq
	7EfpOWEouMbe3X66hBl9u+L1TQSC8+sXetxTTSN1iwVCxk3HyPykAak4EYlPbimq5Cc9A4uCmLx
	//D/LuEeDzUB9+bTmFf5l6FVgilw5faM5HhCnPxr9fyHLi1g5iSvRFLnwu3AQWz8rbkE15aYz0
X-Received: by 2002:a05:7301:1f18:b0:2dd:2d70:8aba with SMTP id 5a478bee46e88-2fb4b922d78mr2272864eec.4.1778425997901;
        Sun, 10 May 2026 08:13:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8893441absm13118445eec.31.2026.05.10.08.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 08:13:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a8217a93-d4da-43f0-9dae-cc1793d5a307@roeck-us.net>
Date: Sun, 10 May 2026 08:13:15 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] watchdog: realtek-otto: Make use of regmap API and
 add RTL9607C support
To: Rustam Adilov <adilov@disroot.org>, Sander Vanheule
 <sander@svanheule.net>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260509163101.722793-1-adilov@disroot.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260509163101.722793-1-adilov@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/26 09:30, Rustam Adilov wrote:
> This patch series changes the driver to use regmap API for all of the
> register access stuff instead of the ioread32 and iowrite32 with __iomem.
> 
> It also adds support for watchdog timer on RTL9607C SoCs and since it is
> indentical to the already supported SoCs no major changes are needed.
> 

Please address the concerns raised by Sashiko.

Thanks,
Guenter

