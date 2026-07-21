Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652F03E121A
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784673709; cv=none; b=PvRzn/geJxbwbeO3p4zHxtnIKfH7XtLKEGUsYWrH3nfNOdqau65YPZpDQocBbKf+ofZMXe3pneiMu3Rlor11ji1fd7Oc+O85lKaVShB++Z9Fw7L9GyFxuKnDGl7s30THGTcgvazbq097N7WDf3PiQ/JaG8yTjEK1a1zMROzw5Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784673709; c=relaxed/simple;
	bh=MS2iNtQCXbIlbselvMp/n931LY6FLwtCuJeCV8hkBeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=idd3UWtrH0RJK+GTgKw28MR4a5DoRTthUn4ET+zmTXf2WZNDODsE3AgwFnmGAqw9oUMOZTVBJkwMeAMWue1njicb+dReO5BslrkRyhZ0NvwzEG3s7ftfu/2lu5y8TcTsjWvRlkQGHHZg5FjNZP9XHAmtLVjbN7KblGQv7F61ct4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hs4g3DsE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hs4g3DsE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49558ce01afso25615785e9.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784673707; x=1785278507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7UZpL0eDJd6NTr982Ff9Khr33VG/2sSIiZnS2Evk0zg=;
        b=Hs4g3DsEwc5PeMrWgePkzOU4OHnoRO0JAP7v9SKXQ7xVj4pt3k4/aW2XMKnGibqpxg
         0R4g75nDdlGfpjkeIrxSgnHy3xXSeipM3h6qCKePX1OnA/4MeugyIVK2Xcxbt/aK1V20
         fcxU/zoIpqE7pfjJNspDMPMxmfvbKrnOqvThOGVSKIq3GrXSkMUGd3sLffwRb2V2k+sq
         R89UWXKVENQFOiFUA5Ztmsa96JyJLIL1fE5drYKZTvAVAs98rfCtPqE6CDc0jn+63uwT
         hs2g3Ok7AKWs6m+6ceATmGhgiPPA2ec0tfmhGD/HyPRw/edRwxj1COB46V0o6F0djPf1
         9rKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784673707; x=1785278507;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7UZpL0eDJd6NTr982Ff9Khr33VG/2sSIiZnS2Evk0zg=;
        b=XQEHvs8RotiIk2UDziQukGg53pyeT3ecoLY3Z1YW1Qx/PosbgRbhegApxNOK+rfkXE
         Fuw9nIg9pDoLSdPcgAo54D/2ZHxTSeCFJd/JmaLV2/70mPZ0QPV9CwQ6PGIE+aYy4wHp
         XMz8Jn3Ds6/OMDPQ3ftVW4bub0O6OUts75seZhJA2+INcaMRGAWFOl0Ofp6dF4INphrl
         +YeG1IIBu0gXxBD5AR9fcWfT5Jh3NsGZyjMqkCFb59PusTA2LfRlnKVISgUUYqgUHOat
         aVTv/iYfexWPphEbOEMSYY6cFZstLZwT2MsE80KIcNuW5vVfdHXEtyPrBrj94cCzUiZ0
         UPMA==
X-Forwarded-Encrypted: i=1; AHgh+RrQnTtTzQGhJQmQoDVrF4ILnNqEA4Va0hid/I71Q6GhJkctcdpN2XUMo48nxiA53mGE/bUZshuHn0XO@vger.kernel.org
X-Gm-Message-State: AOJu0YxxpC3mBtgNicEa9I5J8vastWfUmZeFW9KwNC1HVAFj9buw4okx
	/8WNudeZFeHMQM17nX0/+E4M3mNIqtYfzFPFK6CNcoGbSJ+ncoMMWgbLI/lGu/nuZyY=
X-Gm-Gg: AR+sD12a3g3GGwnaQh4jmRrJZQ2smN/aDqVgJX7GZk1YXFk9VZarQRYWVlJfInh4H2x
	fk9RGhziM7Yy8iBS9ufR/x6dsc6s2XyFWQz+sKrrrEQYYwsbxzmKZJsibDGF/1m6J+nqv5ZM7sh
	7WGohZ+TmR98OpMvgx6o3ArJ+OGbs2vurNVzoBMM0E9UySwgoR96v3j3c21z3pPTjDYk3BCy2Ui
	CLHgwctwO7a/E83bHGsfYBvgD8r2tVyXx3/9hlUHwZCRoK0nk6PsVFrdgV5Grw52bkkpVi+WGjG
	QoX8MvSjIeywvKlrTSgsgUD1KIro/s0fRhwuLrkdOY/H+6hj4Yj1oZZ9oQf3y6rVIYQy3rKNeYA
	ER3ZJzfIlJiWTIvrEqTc6A32Nyy5FhQRvO6zR+sooqePRJtmA0NAEFlZxVz62sM2TNsyK0HSihJ
	6XjhOzNF8su6nKtiw=
X-Received: by 2002:a05:600c:4f44:b0:495:5e86:4e59 with SMTP id 5b1f17b1804b1-4955e8653bemr112642595e9.22.1784673706658;
        Tue, 21 Jul 2026 15:41:46 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.186.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a63e3a8sm26563145e9.12.2026.07.21.15.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 15:41:46 -0700 (PDT)
Message-ID: <fe40d9ab-2074-4e6d-8d49-0e076a42e873@linaro.org>
Date: Tue, 21 Jul 2026 23:41:44 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 2/8] media: dt-bindings: Add CAMSS device for
 Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-2-c0b1c1167c5d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260720-kaanapali-camss-v15-2-c0b1c1167c5d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2026 05:50, Hangxiang Ma wrote:
> +            csiphy0: phy@9523000 {
> +                compatible = "qcom,kaanapali-csi2-phy";

The sub-node should be dropped from the examples.

---
bod
