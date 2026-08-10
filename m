Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBD9377EA2
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786348097; cv=none; b=Ae3laxHK9Z2vGWbnQ5eSaL+IuSuM7iWz7ANXeqHZCZaSueUmjJ3tYECEQdpvWKpE/e9QlQYZkhFO3DjZh1vLlhOMbWFSg3jKj6DkYDYANPgGZBeNFfQ7t7KhtTOJlU00Hdl97tgpwd+lFfIuN8qgCaf3lR0+k09oh/V2Aiml+ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786348097; c=relaxed/simple;
	bh=9frbej+PZWy/5AMY8IKoA395BYnUAbevTmO3n7s+E5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+I8JydH9AlmuPSk5xJIlpPGigIRZnADhjmVJ/4GNQeJjbwTSHW0QdKeFSs3wFXfp8YtOHISbPvFhBwEDbG2E9DVLCRxZ/66drubgTiFbOapy09/uDeQnbFaYGsZ6JXe+JGdiNlY7H32WFepADTM6usgzV+5YfMP1xAj0VtkKH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=khLnLPFE; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="khLnLPFE"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-480033bdcf4so800180f8f.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1786348093; x=1786952893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GX/Abae2bC7fTPITHvOh46JQer/yR4FYa6yMFkvRmw=;
        b=khLnLPFEtjXv9EJ1zgfoqZak90BnzmUCMrzbbS/uAgLKPj8H8EkqDDJH577a+hQmbL
         fAEenHUeKkU+0Jid4fVPGoiVGm6qdmmk3rDQy7LNHAaqIKJTY2BquMJj2/jLcmydaALF
         N0Eh992hp7sTd5BaDpr28Lwtgkb8PMRlg8OdgGjjishg/GyQZfTUUt8yWDBCojyfkbjd
         TsGca42h/ggLjkbxAIb3ul79oNRpkfy2wtntNK1ZnCpL0ILsVZjg0hYxWFYgvOm8n8pY
         MehYFaFskaJSKWNjE8E+Cv7QHRNUsUjEMQfLcR31rRm+n0QoTVAHqw3pvVEeN6/2kqM0
         EWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786348093; x=1786952893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/GX/Abae2bC7fTPITHvOh46JQer/yR4FYa6yMFkvRmw=;
        b=FZLjZdBXnww1zOukGd376z/Fu8QETVRnDviz3eoop8vGRWmhyN07AZbCgjY4ZJsfpz
         8lWMwt2m9e+urUBLHGzozfczluyo+pIE+T/CrCZQX8iXDRNVf+4D6HwQe+J8l4IrEKBL
         fKN743mbYdQUaEBs0CL5vIWGvsihzrP3/QksKnqzaNcP7pJnNdiYBXlf5lEAqHGpMVHy
         xe799coPnzs9e+AaEjGeiLc2LgT6bJ3gQAzDeTUjUVwFtSPi1JBlnQhQqKt4dqOaFYqk
         Bewqid2YAaai+AnW2zuNPiB+/qtfZRyQMakf+RZX5zzlwdOX1hZW/bXBAiRzfiB+thor
         RcVA==
X-Forwarded-Encrypted: i=1; AHgh+RrsdlMgcdMFK5wIVgcYxJIShUV4pmau1QetrfLXHjytrWBqlrfYQqxChOtBxzdtZASx0vsgmuKxyqxv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywviq6NxbPhmAyBpoBk2pheNZ5EtnNwVjiHoQmGnC7Ffb7IA/zG
	3BygjqkJqOtSuPb/p5Qyq9JYLWW+kP7Sjbl2/7SYKQ3hn71lS7/xaOecI8CSBKqEf1M=
X-Gm-Gg: AR+sD12TRjtOVo+mVXU8Abs2o0hMVncvPJ5nLHmmKyEiF/zPW7FwbC3ZY710K6uSpo4
	7E5h3Arpgdm7AYCd+cMgGLh3K/ll09csa/DXcvZJPYP+JYO+CGmngT3b+ZaPS2pxg9wdQw1VDt9
	alSqnud0wUeAnGshmn+K6IxnNwsIyOsARPVOSxFkGtGTAjDCoOqjUEwxz9X5ksbzonUaOAj2NbN
	FTyi1cgacuwfSjDBhLuUpFou+GCOV/++BdwaGcLMEhTXHLM+/fJHHulXf4qKdm4tRwHejM3sK6l
	Z/rmCqndCrOGsEt5gkuE+LE1A5Ux7GCkdFfNp5rCdX5a/ddTXg3QNrVOVzPbrp2LIee8lnD3B2i
	xur4nktgTSFaHOxIfI4nhzEvIuF/shUYYYjfiwPmjlcKq4lPFg4aLGRhTm7rHYSqO67VYKqgt0H
	pU8SjFC/d9qIt/6bMZ/KtS4HZnrUaC4JStBoNl58h8N6tm0RpE8dOEirbdIb6l2Py1yWIXZtbVP
	MbrwV5tcY8=
X-Received: by 2002:a05:6000:46cd:b0:47f:f43e:f0cd with SMTP id ffacd0b85a97d-47ff43ef171mr35368140f8f.4.1786348092741;
        Mon, 10 Aug 2026 00:48:12 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8b09sm35614018f8f.23.2026.08.10.00.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 00:48:12 -0700 (PDT)
Message-ID: <af10ff32-06a9-48af-9b52-022a0ba73277@sigma-star.at>
Date: Mon, 10 Aug 2026 09:48:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX
 mode
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 linux-phy@lists.infradead.org, vkoul@kernel.org, olteanv@gmail.com,
 robh@kernel.org, devicetree@vger.kernel.org
References: <20260806091112.164695-1-david.oberhollenzer@sigma-star.at>
 <20260806091112.164695-3-david.oberhollenzer@sigma-star.at>
 <20260806092402.C99EA1F000E9@smtp.kernel.org>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20260806092402.C99EA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 11:24 AM, sashiko-bot@kernel.org wrote:
> 
> [Severity: High]
> Does converting all syscon lookup errors to -EINVAL break probe deferral?
> 
> If syscon_regmap_lookup_by_phandle_args() returns -EPROBE_DEFER because the
> syscon driver probes later, this converts the error to -EINVAL and prevents
> the driver from deferring properly.
> 

To rehash the previous discussion: The function can return either -ENODEV
or -EINVAL. The probe deferral issue appears to be a hallucination.

As for the rest of the ignored return state and warning: the implementation
mimics how similar properties in related drivers have been implemented,
see: dra7xx_pcie_unaligned_memaccess() or dra7xx_pcie_configure_two_lane()

Greetings,

David

