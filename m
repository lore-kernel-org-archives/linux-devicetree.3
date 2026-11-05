Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872299;
	b=oiN2H1OmqSDnKDdC0LeiQoLLM+Bohk3nAtO1zeeJAz7rIHQR2jLW8brIp0P6HsuvihFr
	 oA/IMeDftLmGU2DTGkMfzDR1FAyja+tu3YOnUDfDM3MrRx+UVrxXQYThDjwQKOzA5FS18
	 vlfjL5WnM85NOuwRS6JajRAgok7XF9AZOvqtHGifA74R+SHta6nFccuwvGCGfXGePJidr
	 0dJw5a2rtsmCANPP/tNH2EsqBihxomvWv8LF/opquKgB+E77D4ZWjGfIX21Jf5TKkAaiy
	 AfWfJLOWgTkT8XyyoBieStNNNCkyCc/WDyOr7JD1pkl6ZmBDGQGpN53bHsMwfUru31g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dvKyTZ9haWPfTGY/2ux6Lo8rlburvEYrvCc+2l2o3+g=;
	b=ujnJN+cPRU4HQ1Q97u6fyxEZPERieB6qX7hdgP9XpaF9YFduULVCpQk50tDXOz0wrjJa
	 Ke5FWqgHnVeH/blkiLoXRE+qJhTVOhBCvZIFtKY1x4/QEsybx6h1/5K2ZmppOcL705UJJ
	 De44ri0AZiOC6Kz9IXeqJ62flaQIk2ot5hjD5RmR9IwAZQfNJQEnU2tMHvO47DZ2XYc3U
	 0niazt2L+GUdehoru60HoFd3G7B7EU9THXtiujrvM97Fb0MkCU3RQHw7qMKFnAzXlcjaw
	 3oUgg1k8ORSq6D35cR0gsxO3UZOtfzCItLEW+l4AlJxyl0E4qVZPB/+m9ceABvoLEcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L2TUIWcz;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB2A6083638
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB2A6083638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L2TUIWcz
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so16508095e9.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 01:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872297; x=1794477097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dvKyTZ9haWPfTGY/2ux6Lo8rlburvEYrvCc+2l2o3+g=;
        b=L2TUIWczYjxmSNW3YksVxTTXQJWVA20AXdJ8vCHjMR7GtxLqwju9JKjqMwhaUgy+Ag
         Y0jUBEYZai/ZgKkAW1P4S9HjM1gkSIY8n4/hWTaOnvbBqLdDk3NzKnUc9JxJqZHr5LLs
         qkQ0/gxxMa5dRWfLld4C3/I0Ti0+UZ5xaP1pYzPE4DRRMhETPu5gtXyF6uetxvlNXt9h
         JIcS77KJ+6PPi01g1zG971ug4Q/XwH/bw5q4hy1LmQMmlXOOs050EoF7iYeJf1lpWt/r
         qTCXSLZskxiwyRmjR0p6sI0PUFjLmeykwBgTLdUjyBj1326mzsCbC7p4Y4XUcEOTkSfb
         ImHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872297; x=1794477097;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dvKyTZ9haWPfTGY/2ux6Lo8rlburvEYrvCc+2l2o3+g=;
        b=bOcjetR4FRVhITWQIJFtMPXTfYEbX/Hw3KplfqtsTYI3GW5NkDHafanuHg17lr6nCc
         yaIexA7rifiChR3vTI3KY02VLW0SvsWO5aqWsA7kU0mVz7Fe3mo4rEiS1NYKZEiktDgj
         AMD1MDO5IUYLRRZPAuy/b4mzMn0r1ot7E2uQKxlm+5u9yauSIuVwwp2wyMsvDiVBW6R4
         CW+BnvtYRXEMfff+fc5UUQr1J7k6jWtztfqvfztAaPNpKYRQhr4ZKD6/zXfJ07KDTr6m
         Lkd1QnCSgBrUrqQZo6+VoHWPeHnRy+k5tTUae7C8G+gKKBefk2tcoV6B3UnAvU0Uo37m
         VsxQ==
X-Forwarded-Encrypted: i=1; AKwUvByz6c5uwxWmDZRHfjJsugNuv3BngF3oMwmSfBZZb3v/P9KxUrcCa6nvpqcOOL3rpyx/UL4NyBZZUHwI@vger.kernel.org
X-Gm-Message-State: APuU4Z+fYvcw+NimCaZXe3QJq0BJBWDrv6ileFzhGW2yPbCUaKTlhqU9
	GwCm1Tc3FK1Xolx4GzpP3S32PMp84lqxIMFLXHH6XGby5yF8BOIFPc9BYoVT9vL6wjk=
X-Gm-Gg: AYBFou0fQAsGueS/ecjmGilenPouzHfJnlGi5dKOjNX9Yr+vrLU0IDYaDHsrJPu8nCU
	yXyJCOdHuD07rMNGu+MyXZHlFhf9ij89uwTRyCxogvIgjnIZQPz4Ky1tphSIDzSyfla0ksiZ5SJ
	Ppc4Ms1kLP4rZO3HU21mYp48fweURrHMzA0Q4F6dByO4JQt7wVHQjmds5mJ+7O6FXl2j8ELB7J6
	v9mXyufyYYaai9loCRZs+3A85XANEVutC2eFVfIixZqHJhQI11UitQpFZMS1LsAyoI90rLVEnKU
	1gxhgHPMnCx6CrWf5hLJtkqKP/wLHaykYL5fMnoXJRs4xmn9OCzUITkBaX94xrR3F0y4DYhfN8/
	sOO7Za6/ezYdeX1FZEmQe7UcVqTxOLxDVoufXw9QcfgDdKKK02IBsnZLk2o4FbFHy42hBuESGR0
	W8s8UY4uKx2A3/i3eW0Oa0DmeJ7P3+5ae68uLEssA1VIDGFRi/WQ+akRWu6g1X48WkCzJqxHS6v
	Rfu95SsN9Z9sVmOgAfNdU+87UiIYqFdbNUXR3+0OqIFV6f5nYnXmuNC4pVuRLlkpmbThEgpFcjo
	xgRNiy5NCI5r+NGqnouseIRu4CZJu/oG0GDAb9sZ
X-Received: by 2002:a05:600c:a00d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ac19705d57mr404951005e9.31.1793872297245;
        Thu, 05 Nov 2026 01:51:37 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180e7csm9090994f8f.5.2026.11.05.01.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:51:35 -0800 (PST)
Message-ID: <aad7cf3c-cc25-4368-bcff-7e222f22ca99@linaro.org>
Date: Thu, 5 Nov 2026 09:51:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: qcom: camss: Select Titan 480 CSID offset by
 VFE type
To: Vladimir Zapolskiy <vz@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261104234533.3044265-1-vz@kernel.org>
 <20261104234533.3044265-3-vz@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104234533.3044265-3-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 23:45, Vladimir Zapolskiy wrote:
> On Titan 480 CSID register spaces are placed inside VFE register spaces,
> and the offset of CSID registers differs between VFE and VFE lite blocks.
> 
> Instead of the assumption that all VFEs starting from the third one are
> VFE lite blocks, check the VFE type in the platform VFE resources.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index a00791b00feb..9e64e8d44926 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1119,7 +1119,7 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>   		 * between the VFE "top" and "bus" registers. this requires
>   		 * VFE to be initialized before CSID
>   		 */
> -		if (id >= 2) /* VFE/CSID lite */
> +		if (camss->res->vfe_res[id].vfe.is_lite)
>   			csid->base = csid->res->parent_dev_ops->get_base_address(camss, id)
>   				+ VFE_480_LITE_CSID_OFFSET;
>   		else
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
