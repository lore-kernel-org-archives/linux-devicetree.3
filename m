Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D37C33B6C4
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 12:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784289728; cv=none; b=ZwZK7lloMJkpQFFpGtvgmCRx96rPD+rEUdPNJ//DhVyaHhI3h++Sm2mwL6QRGGJVx6MWzqe6nngiqxC8vugrukciYu88XBT+Qaypo0F/EM1xIPybOeDEZvVkJYWZ263rethwQ1uddc5a9ZXz/BehcpVnfMaomstoTsOQq5qSWJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784289728; c=relaxed/simple;
	bh=8Uw740j8vtVBDWekYMNzNzazdHY/o1xs3KjRekg8knY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S+00wM+lDxv9rLnBxJR1KnNSuOzY0fX5jYlqCgU6Cmu+olqMJPEhnnmp3VxHE4HxTZ3++1hp3LW+rX8y46XBtQCoZhLqPGvBJOwy0jofTvEnwlKSYBGPDUlyPPD/mjrXRi1eJU9rUO7QWmogXSkGJ/bcVmhvXeWybVZNvfk6BsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=PsRRLhTK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="PsRRLhTK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49544a80b9dso9747835e9.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 05:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784289722; x=1784894522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ytxZbr+En2Se18JmJbsiXT61grY1p5Cg8Gm6wZ0DgQ=;
        b=PsRRLhTKfyASTINcz+00uDlWbgww+w9iib80uTKez4bEFSZvP06wco5hAPQGY8ESr1
         ao41TM70S2MkIKtNPGatLYpB6lXDf7vM2fplVCZ8Jrulc8/6Ce9wb9VNeX+80BPZ9s2u
         lWB0IDP/Yd1h/33MUhhUu3/gKJvrYN6qyuTuaErusDknNjqFZiomzV6HOVmgnegbK6fJ
         eiKcKjMAcN7xvk0DJgDWNqzdUIzbhIakwdWYlaUFFG8ArHVbirotjoDM2iOpIYBNMOf3
         XK6f0GrXm59ZhVcFx2U+UDF/uMZUWmJ5NRMqRRLMHM2FgJe4RcxnV93q7H2kQg4lB1Io
         nISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784289722; x=1784894522;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ytxZbr+En2Se18JmJbsiXT61grY1p5Cg8Gm6wZ0DgQ=;
        b=WfjdZVNTqNUNbWn2Dd12++FRUFM8juPTYsDUmA5As83Q5dHrVJ3cxJvoFkpPc3VNNT
         bd2KrNqW39jc4xTQZRLZQOE84UkDMOfUVGwoytOGlThFzaONnevcCaVpXJILRGkKMZvS
         e+s0bYQTlYseEsggCtURzS3AzRc98FugnRJXdu7gU/K0QC38QXqr1XyxjafPc9gaSY6W
         vdZwtFY6x3Dr+Ytm9QzHn/9CYyR5GLD74o1BJBcoPONss6pkTJ9PlouoChSC06klSXdS
         dIYZ5Q+YlxFH3znRMCSPj4KOgDi+fsw4rQ3tqpuRR1SNbHJweErAeoc/Boejn5zWM/Ye
         ji7w==
X-Forwarded-Encrypted: i=1; AHgh+RpwT035I/Dbf1aNqAuTZn+6El60uOCBgoE2QRRheLxEH12FTg7SKdpEdgmF4TOytZABTcgWrwBQKOqr@vger.kernel.org
X-Gm-Message-State: AOJu0YwOKo0tdstOd3l76pcmmjuqXOgjPm/3m6FSv/X1lxFv0U16pnJu
	FZdx1cNHGNmoT1h6eyP7Y2MWJEgwbWNYQPCfNtFpLDnvzap8WVVapyMXvWtJJzkXBlw=
X-Gm-Gg: AfdE7cmB0lpCb+hvlV0gDhHHBCL99ccZoO9Tvvb+4HaCr0Deh2iTBhs0AswtyOXyFcF
	fDwGPWFMwvTtPCTlS+Tvk8mu61SSfwZ04QtTww/BpYDPdxyXKHvPnhIS+T9hVr22ZEw8k3y8XJU
	FAWedxXrR4kIlO9ZIaMSAWj8jpt8oHCkI31pyidKdRZErrG65pC7MylvdMvmujTNleqiVo8KaPz
	1Ly9x0k1xC+jm4vr9zLIYCu6y58klrwDjlhThx2AXBQbnC3XxQm58m930m2CThs3UfMQezKsb6z
	TtK1ZZbD6hzKlbp53uB6vZLXXa7aD+lOZHBGI+W1xQzaKqi9jCAi//nu6OyxOYPtt7juf8lGeMS
	jBZD2czhdNNkdjv8N59mXgzsut3+qYtMYVStQGwMzcF4+Wm12ABg6N7Sxz2A6/wv7aezynyyoY7
	P1+2qPI7MiGN0FtRB52U33rJslX+LtshsD4AofIbVOnya5/ccndS8X+c8Zcgg=
X-Received: by 2002:a05:600c:154e:b0:495:405c:38d3 with SMTP id 5b1f17b1804b1-4954a3df9f9mr31966885e9.9.1784289721703;
        Fri, 17 Jul 2026 05:02:01 -0700 (PDT)
Received: from ?IPV6:2001:861:2128:c8c0:8e8c:fdab:4545:5849? ([2001:861:2128:c8c0:8e8c:fdab:4545:5849])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed2313sm3034899f8f.23.2026.07.17.05.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 05:02:01 -0700 (PDT)
Message-ID: <fd7d5b72-a400-435c-bbac-9e661d98e3c9@arturia.com>
Date: Fri, 17 Jul 2026 14:02:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] regulator: dt-bindings: Add Silergy SYR82X allowed
 modes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260715155141.128601-1-victor.krawiec@arturia.com>
 <20260715155141.128601-2-victor.krawiec@arturia.com>
 <20260717-nostalgic-raptor-of-sunshine-1aba9a@quoll>
Content-Language: en-US
From: Victor Krawiec <victor.krawiec@arturia.com>
In-Reply-To: <20260717-nostalgic-raptor-of-sunshine-1aba9a@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/17/26 11:08, Krzysztof Kozlowski wrote:

> On Wed, Jul 15, 2026 at 05:51:38PM +0200, Victor Krawiec wrote:
>> Make the PWM mode configurable from devicetree. Some boards require forced
>> PWM mode to keep the supply ripple within acceptable limits under light
>> load conditions
>>
>> Indexes are starting from 1 to keep backward compatibility with existing
>> device trees
>>
>> Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
>> ---
>>  .../dt-bindings/regulator/silergy,syr82x.h    | 20 +++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>  create mode 100644 include/dt-bindings/regulator/silergy,syr82x.h
>>
> This header should be mentioned in the binding in property description.
Thank you for the review. I'll add it to the binding in the next iteration.
>> diff --git a/include/dt-bindings/regulator/silergy,syr82x.h b/include/dt-bindings/regulator/silergy,syr82x.h
>> new file mode 100644
>> index 000000000000..6d4aa86bb5c1
>> --- /dev/null
>> +++ b/include/dt-bindings/regulator/silergy,syr82x.h
> Some confusing name. How is your binding file called? This must be the
> same.

The binding file is named fcs,fan53555.yaml and handles several devices including the Silergy SYR82X which I was targeting in this patch serie. I will rename the header to have the same name as the binding file. Should I also rename the macros defined inside the header (SYR82X_REGULATOR_MODE_*) ?

The underlying implementation in the driver (in fan53555_device_mode_map_setup() it the patch serie) is limited to SYR82X because it is the only hardware that I'm able to test. That's why the binding part was referring to this specific device.

Best regards,
Victor

