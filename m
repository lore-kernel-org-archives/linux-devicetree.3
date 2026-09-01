Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C00642CB01
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 15:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276313; cv=none; b=a1kWn1DWXOvsKbAPYhHsOPQZ7sDe9Qoli2owdwH09cSt1ZQAgWIg+VDp+REaErh/5wlBUqUjjD8cfaNfoJqYgtbWsprCBlDGAs7UTT/61GppH/HmNZWJWbJLVohHX5TMunoJukvM9xAX2JaU5athIUT/z/qPwPkts3aUTzDZs5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276313; c=relaxed/simple;
	bh=Chu1zqafqw5vyPQ1Qf0Z8VOF1X0ivxEKmuLK/WHS/wc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YwMaQbncewAYYwVJhCHDzAxI/WhKSgJOd8dGbzjk7hiQ+GsnhFf5o0hFDfgbc2Ck2R7yzg1b3TxxvULJL8OE2nm8eF17BQEpuylh4I4iPRqSy3gRJcE5h0eGZG6shGCDjC65UYX55PSk7jsoc+J23lL4zH5pTrw/hyf7Vf3tUEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=J/1G6CvB; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="J/1G6CvB"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66f883abfdcso1898298d50.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788276311; x=1788881111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pesZZ392npsph2E6XlluJo4xVrgKZ8m8f+DaY98EXWU=;
        b=J/1G6CvBb8wST7+0zW8Hfrsx1Ll8/qLBcc6yop+xmXwu/v060quRjVBg0d4ALws4o0
         VLOi9Kv8NDfmpLcjtNuTzOiE2LeiQc+pfQN482tdjeFH8SejPV4akTD+0uwHozFPacBl
         xr3UP5I4lw9tSME4oIQsuf6d/9OQhVlw4zUpCsWqvVjotR+RZssGXhqzLFY+cgidcRgG
         aUSfJ4fElG1maBpmKJXXs4I/3gRacxH5ftY/nONNI9oOnfJVfT2tEmam/bYuEPfKbNnF
         1eN8mS/pNIWc1moX/Jn1+kKZbMVxh7kEwV/axBEtRuPIjN1URLf0KoJlRTS0MlQnJGVX
         +M7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276311; x=1788881111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pesZZ392npsph2E6XlluJo4xVrgKZ8m8f+DaY98EXWU=;
        b=E17dsqyMtmvhWNPcVMa5DaWUwRIoikLrFPr/xyCZLGDKMCdqR3tfoYSne/R3wRp51T
         4AUaV4KuAagoiri2veOYpdMQhZcuHTrZRaNHGPVpmXhPwQQyKTs5fERvcGamRvaOLK7Y
         WUaw3uN6m6lUyz8/pPCZyAqi0O/wDeYN573Z7Xf4RdiVtFAQXY3IlvexJl3uSC/LEuiT
         KnPFJG90GaoxRSq4TtlMhJngt0CYIE/hHwhJ7JDsF2U4M5xlDiTgFRiJaPEi9WLC6g37
         w63bAV9Ort5hrtVkhufjWfG3bfFLV8V9e9EDlsmkVQf5BrT03VVtAGPdfWI+s7OwAnaO
         zfOg==
X-Forwarded-Encrypted: i=1; AKwUvBzTBlZYq0he44FTZes5kq93C+04sFRnRVG1LV09SyaZ2TxbkPGAnFxQLj/nEWc2EnC8bVKsrlJYFkF6@vger.kernel.org
X-Gm-Message-State: AFuF++loLdRKRQm/jGU8TVaZVRHJtxhmZD3lZSn8sVxe7tpWj51gp98b
	QIdrxA7DklPzStWn/7J6iutZiG8YCCkQj4tubbuTEZDa9MhGVep24LYTwvjL0mgdPEY=
X-Gm-Gg: AYBFou3iAEig8LMwEMEMbXyyH86VrVnAKgFZ8vd+jFUnpAD65GdFZjqSYsuB7h1GAHU
	PkAspanHP8f8BodedYB0R837vtLgd92SeVr9x66Mh/fTJ37DY0dRrrb5NPFdyGtZEKPgut5qG9B
	J8UlKrxMEQXrVaPGWauWHMPnUjbKzanISBTCDULW3v5X8jlkTxOiVjo6tO3oYlIbCGn06vYNNDg
	/wM6k//sdTCFn7SOmubLmSEc3mQiReKEKe/HhFApauEPRxk79IChsF3R6mwKnF8rJZW0Z5RlpkD
	OmrFpFw7zRVfgODt5RtURpI0EEIW4SedgA11FaeheF/2hGyc4ki+S+NdgTXtX1VaG/mk1tYD8Ob
	m1mJH1Q3LjU8SQeKsB3G2JfneG536pkShzfHJFLSQPDni3vTHBLJQqaWMBdoOgTUTHfNarfeji7
	XXhhTHADxSUsoa3VxSglGukZtFbD/XcENhirnsCZTjEzMGkkhvXFzoNqKKVvH1
X-Received: by 2002:a05:690e:24a:b0:669:4df9:7c68 with SMTP id 956f58d0204a3-66e4c74e84bmr7637535d50.36.1788276311159;
        Tue, 01 Sep 2026 08:25:11 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ed1fbebsm8638344d50.17.2026.09.01.08.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:25:10 -0700 (PDT)
Message-ID: <4af0088a-13ca-4eda-9147-c7aaba316690@riscstar.com>
Date: Tue, 1 Sep 2026 10:25:06 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] of: address: kill of_node_is_pcie()
To: Herve Codina <herve.codina@bootlin.com>
Cc: bhelgaas@google.com, robh@kernel.org, saravanak@kernel.org,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260901011338.1323243-1-elder@riscstar.com>
 <20260901011338.1323243-5-elder@riscstar.com>
 <20260901084546.424c6ef2@bootlin.com>
 <6a5bec41-71ef-4d9c-a34f-77d166b15ca6@riscstar.com>
 <20260901171528.487ca48d@bootlin.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260901171528.487ca48d@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 10:15 AM, Herve Codina wrote:
>>> The warning here was printed based on the node name whereas of_node_is_pcie()
>>> prints the message based on the 'device_type' property of a pci_dev node.
>> You're right.  Both warnings were getting reported for me, but for
>> different reasons.
>>
>> I would be happy to just drop this patch and live with two warnings
>> in some cases (we should rarely see either one of them anyway, right?).
>>
>> Is that OK with you?  Does anyone feel this patch should be kept?
> On my side, I have no problem to see two warnings and so, IHMO, this patch
> can be dropped.

Unless I hear otherwise, that's what I will do, for v4, which
I'll send out sometime this week after addressing concerns
pointed out by Sashiko.

Thank you.

					-Alex
