Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155DB41D202
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229928; cv=none; b=nrMsXZq/330ohUxa4kg7EMHxP7T28ATcdxc6mSmM9ASP2veNY7xNKpceVuvGtKusSJH8yM32ayUXY7wLtLJ5M9PesghUyf0YT/pwIoKjkkgyJMvQqGmo7SLvOigIZbmfKt4lU9j4XbXma1mv7t5V0Qg5zHjYuvnFxXioxr9xDE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229928; c=relaxed/simple;
	bh=kgErTsufV9ATBvVYA8GXFM3ncLv44xFl+o0icwsDL4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USAjueLeH8iON6IYEr4DHSlw+xSL77hwDonPkMnUjIxlrwLHR8476itVEG3HFkJdP/vewCIz/TB5yNvYQdHOoka3QNWgiNTgPEepRWF8lppVG36KkxjxU6uUbS82+y6jiws/DtVo13VYHyzoziZW5vX4pZh7+H8DGDvIwq8/f3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SNiSA9ok; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SNiSA9ok"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47df43bfb07so709861f8f.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785229925; x=1785834725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=acK9/eCNX6tWAojgJUr92sgI64va36twFoTe50cAbqs=;
        b=SNiSA9ok6B9SVibXBAeCg6/xdj5UK65PEVhfUcwOefBRkWp9/APPau/+x/eEOFB5HH
         iLpSLe9aL6NVAA+tODClnu+/8xjK/+IVdjnTRhV1SOs3UFTEHwsk795ymeuA9KYLhDXi
         3xya/t4/AofW5iraZur8l+phEG+O2RsY/EkNDlPrfCOWWxpdzLc4Z/oVOrBIjC3MuRUd
         gqfNVod8DndBxn0aVtpsDoG4qPz0J8Nkd/a8sKcbCYiJOf3ihq3ddwgR4cS70pTjnDid
         N0yCEt0l7IeFwEfWWGUrFvc64gidd5WGQgyf3WDfdYCF6fsp11W64FewQMgh32l31jIb
         Tfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785229925; x=1785834725;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acK9/eCNX6tWAojgJUr92sgI64va36twFoTe50cAbqs=;
        b=g6c/ZOv8bShJ57o8MkhtxEWqhpOgnTlYl7c80c8yjqjfUJCDeT7nrkyjumiIIevqUr
         gBfqEL4d1izTU+YMjeBSC5jQ7HpEb2foLgMwZWUsL4suu2rgabLUJI8+mMUHvmA2h7cI
         RjcTt2V/cn7RqxKOl8jkb335iBHPttZLTmJVFpPurALun18V7kfM8FSs2zCjVDqK8q0F
         fzvtLC3gLfBFQEgJfHTmLGDNBOdJ7J3Yc++yEZNsJX9vX1rcBuRuhjD/fGTGPg4AkBFS
         v7TWry11sur19UHPTKv0tIk0bCRJ1PNblwXmlp4S3eCQtaOGcnkShfspVvh+LUUucJty
         secA==
X-Forwarded-Encrypted: i=1; AHgh+Rrfa2ffs/vIxVrY28/ramDaCngbyl3YGzq2xPJUgtCPbzQi/yCGW23BLidwA8nX5iUSJUaX4Hx0CHgC@vger.kernel.org
X-Gm-Message-State: AOJu0YzbUdKiJlNPywgEBUFlLWJbR+X8rNJsIJxIZ97RjyDX4X1Aug9h
	MVAibsOsVuYlqJIsDXnu8rJnPfntTovBROeS/lGfZ9hlWws6hWdBkdYHVC+g+LKEylA=
X-Gm-Gg: AR+sD13l+sBN0lvAOeTXqA4KipStS6Pv/rVz4TvET5hbGeJXEd7Re477ufoCllt5sHD
	QsR4zHWeYY3C5iAAdgaKyToW0SsaJzVFty0CB+Am2Va7FKpnfhlP3dCYAozP4qW0bJW5LaJf/C3
	L7p7oSW3czQBa2fbrc1hS8NcaNB0y2jrtmeJfwW0qD6SgAZgFvaGbQNcpUfXB16BvbvWNoh5mGk
	pgAxR58dQj3rhRpoe3vhZkodRpoKluBBXOeS8mZmkE0WWta2poE4qMzUzqWp9JY0hxcfZywnWHq
	fgn5tQhQ4JE8MSqiO/kQPyMghuz0klK6JYh0gn3RXy5q5jTYbH3TpdFIg0dA4kE8VYGljyAB8xk
	gdbb2Xou4+DqTVDlMj9hdO5IJDhvymzO2rJos8FsFDLqzsZrwiaQC3MoUzazYHTBgX+WrTcy5iz
	XHv3kFIHxvAPST2iJWyZeXoQ4D
X-Received: by 2002:a5d:5f83:0:b0:47f:9022:8531 with SMTP id ffacd0b85a97d-47fb1edb552mr1578570f8f.22.1785229925096;
        Tue, 28 Jul 2026 02:12:05 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm59809618f8f.31.2026.07.28.02.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:12:04 -0700 (PDT)
Message-ID: <9ac3c44f-2227-44fd-abad-fc85ee57ea13@linaro.org>
Date: Tue, 28 Jul 2026 10:12:00 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
 loic.poulain@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
 <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 09:25, Atanas Filipov wrote:
> +
> +        power-domains = <&camcc TITAN_TOP_GDSC>;
> +

I'd expect to see MMCX and MXC in this list.

---
bod
