Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C470C3491CD
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774085210; cv=none; b=sZHyifWtjj8Yq9f45/2bsqPc3RLhXB8Jnd6iVn4sv7AtvvY7uenK1nHp4lCVuh9izcABFhfbqgt/aeHUNxkd6gx8yZVAZlaiLBkScdOGyoRogdPP3o+wbBDQe0OYd9DibuBE100Ilorwg9pcd9GTqjb5l0Q4DjFgBB7dfxjLy2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774085210; c=relaxed/simple;
	bh=IjV7qX4ccBsM3ChH43NfqmDcSs7MVK3lpBXhpayjVcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WUYWCu7InpvSF26C5GXznb75gu1+kWAqC8pRIuelFGl/hrDmaHGlUPMfPfVrkkyTOQWO2V8R69Vz04/exFF8w7FzWgribkXt8TlSdsEaDb1eMEM6DbSmWcqIJmCIjZir3XBUapDw6ew2q5l/GqL9HpNAuTA9RmsBfxAg9299KlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WX8GM81p; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WX8GM81p"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso1027473f8f.0
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 02:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774085206; x=1774690006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1TOoLUJxkp4sw93jZx3T1maGYjZf7Y/+WTbiMaYD0Y=;
        b=WX8GM81pqnm1/vOOhhVSRVnFCt1QXRQG90HrCwBVop0DAOnTO5Pis1bOsrx6leen6L
         2yQLb3S/38lhMs6BEvu/JzOIo2JFEUbT5/SWAy3GUyfPOnP7kBdXAv2mrYgeLrdGOR/s
         WFkpOCEKV/WPeiwRz79kCSZ83Uxs0dkK9uo6L1PDIBircMn5ZKgcrj5r8heePlxl+0oV
         pH+eYD855+2Fj+tKJd1ZKlb6+s+UjwFEVXO/iLqKgjhauIB9jwCMRSB/vPt/8hY2lWqC
         t164ew4YQFM2QgJC79Oxt7BwY/iDRQXkNzvpEI0KqU3eBxI+8OwtzzRTT7AYbWMyL1fp
         JRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774085206; x=1774690006;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1TOoLUJxkp4sw93jZx3T1maGYjZf7Y/+WTbiMaYD0Y=;
        b=oWdxMciy7zmEjW+69qy8qJV2Kc2OPTvWhNetfiJEFSvpvUJgUuGwMBdEFpztu4tEji
         nX8zpw/RiXViPtYERS+67UAydHik/v5jMeWYn3vDjD3SQLQGggYDwGuoOCM8O1h+4Lwy
         FTfdCWUTdk6tHvQJeyQL+Vsfo+LGh42rcIyIiKkya6ChSUS+AsKxc+OPGrcPpxQKJ/bP
         SHbmBuv6MJMU2fMkvxd/nWdfuNrW3QVitHh3h8DdOqH5gUQsjtiF3sxlzLS2e9iYUCT4
         tFXzS6txJgr+srVBtoeaYjklDfgx6KXTK52cyUzY0FuhvAYM5d9Lh2veNuvuXe1NivUt
         ODJg==
X-Forwarded-Encrypted: i=1; AJvYcCUoJVyXPMnBxj/CWVI77TkDO7QUpfg3jDksj2OFhpMFaLt3moXklg4aKaKvUbYolvoTNek0jbbYdqFG@vger.kernel.org
X-Gm-Message-State: AOJu0YzQedvq6n6KhGQ0QnOQFPkgzmdo828ryDpUTP0qQlgXV2gyaSS+
	JbZIdbndvFAxeyqZ59uVJzj6nA+rvKJl7NFi2usplxhjoeuqcIbLoaFID5H3/qyxMDc=
X-Gm-Gg: ATEYQzzeiPPnWrR5hxDrrzv3wqA36uj56hP9fpHOoIDPAyAo2RAE3dtxRjK6VkVUDP4
	Q+BZtLq/MGW0ogV5MHrMHhmQ0VQewpL66oXfGhc09U3ZrWbabZj5GdGSk/L6QcW8L0XoW6eROTf
	V8ZhoBrZQyVUD7WLAE4v3Rvd4UQpPzi3fsXI2YpKfMO1Ek95IyG6e0t9yZgpwBxwvBWBkIlXJtH
	q4Ugs1spfsJf+jL7bYnGQFVEs5YA0uSADPX4m45kgDGjVyqm0PJit/HkS/7Nx73RLwfrtlgzG8h
	ae/7H7n08E40lnXBFDfhluLrVoARqav2Z3Uw0tX3L2wAioz2aV52MqF5MkMecJ58D+ynWWPZFZ4
	AHflOflVRs+n8nGxC4kFXeEgjSblOKOZWjaSHxqO+Vy6RUgqYc2+BI62KD8TzNtzQi89Qwvx/XM
	YOBVJHWjoA6JiTN6doUg+v2BcOgAz+lsY/nkqrF9hwdBHW8v9iy6WYMRpu224f6nYVymm08G5Kn
	dJxvYD13vf+FigeM+EFrBkuNFHP
X-Received: by 2002:a05:6000:24c5:b0:439:cb10:dfcd with SMTP id ffacd0b85a97d-43b64286f98mr10247525f8f.39.1774085206053;
        Sat, 21 Mar 2026 02:26:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e? ([2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm13896329f8f.17.2026.03.21.02.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 02:26:45 -0700 (PDT)
Message-ID: <6c3829c4-3e1e-41ee-b969-820948d10611@linaro.org>
Date: Sat, 21 Mar 2026 10:26:42 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Marek Vasut <marek.vasut@mailbox.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
 <CAMuHMdUACGC4rdXfvO-N-cgNAEzhczB0VYbMoxZMyazSAp6jWg@mail.gmail.com>
 <c8d878e2-8ce8-4526-9dbc-96e4f42be4cf@mailbox.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-GB
In-Reply-To: <c8d878e2-8ce8-4526-9dbc-96e4f42be4cf@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 21/03/2026 à 02:36, Marek Vasut a écrit :
> On 3/19/26 10:22 AM, Geert Uytterhoeven wrote:
>> CC Marek (for Sparrow Hawk)
> 
> The upstream supplies to which the USB controller on SH would attach are not described in SH DT yet, and they are always on, so I don't think we need to describe the controller in SH DT yet, do we ?

Indeed, not necessarily, describing it would be required for power control and eventually to describe usb hubs as subnodes if they also need reset and power control.

Neil

> 
>> On Thu, 19 Mar 2026 at 09:49, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
>>> which connects over PCIe and requires specific power supplies to
>>> start up.
>>>
>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

