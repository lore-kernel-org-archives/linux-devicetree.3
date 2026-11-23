Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398401;
	b=ptUP3tEh/zqw7iLhJceg2XAHaIFUOklj0NGqoFTU9NfFoXhUtru2WStCCzSe4kUxrFiD
	 NLlgD/cSBAGZH/nZGAai9AhdfFiHA11LMwKRNdXOee6kzl5lidb7rmBK5TtnvFOpZEEMq
	 2s2Cpi5iMySyDGT3f1dyx7ZiC5RgFyoTUBrd4g41dkuAjfq3rhZaVtR+E5UYFvkJDEIJp
	 s+EmfXvMG02V2QIQWg9Wh1U/Lx/HXA0/3ONH29N5+BS9QoTrphwkSfT3oGIuHhuJZi/WJ
	 0pDJ+josqeNzg2KHES4T1I7GYt+YKYaIs8cAlmS8/U7cH66BSSULAZpFoGca/NQVfxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=J7SM8IJEkihEJUb+/6O+/CyfvEJC1DOUd1MAPDV9+/g=;
	b=uZghcJsgSqSNje5pcfIsoThOVU2UQhDkExrGKnMLZ4JRB2TJSr/8Uz40pc560/vMjYjh
	 5r7Ls71OXkPo9S5LwW4RR/+V1dqj9d3HKyH0h3ZXj+Py7GTVDHYBhSZH2RYqYleQG4Hg7
	 EsL/HE+ujLTeABJMFSJsZjcHCTSAaYtoc2OZNidSq2Q28bnd3MAmb4xh0L2mg9Jsd5oIb
	 frZ+CumUvjTtU0h2nYi4sHpoomYvv6dyhDqc+/Tb/kP/6l5RoPO1oa3FPi1HLMXbcKzEC
	 IaaMDMbSFiFXf+Fu0QfabHqexMEFtIi6JFFz31lU63SDDftNIdkBp2+bjiZMl8/fe/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hyMUp7qt;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED01606A320
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EED01606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hyMUp7qt
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so20244125e9.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795398398; x=1796003198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J7SM8IJEkihEJUb+/6O+/CyfvEJC1DOUd1MAPDV9+/g=;
        b=hyMUp7qtXScGFjw5VJWtC8lxSVW/noa4jMYKoldsEQMVJJfY+9Sq7WvD/3a9YtO61f
         t7q73AZbrv9pio+/1SqXRSNyPPVXOdXN2qLGCeDhkhj/M3o545TMI5DNs+JMIU+rn+59
         hQrSx7HzWfe0FYJUWv1i66v/qdPGNjWAH94Kc2y60LmwbXqAu3pTLwEt0Y7VXZjulDd9
         f3R3R90rtf+JjUpCnn3Nh06DQxr5tSV1hu2FtYCgas7hwt3CSBFvmT4DcRzxL4qqo/kh
         7rMae1m40aaJN7SgoLmnR8MmEkIAzWHJuJwoMP16c+cMpV4AmIJUpPaareUMzlnzz8mQ
         ZWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795398398; x=1796003198;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7SM8IJEkihEJUb+/6O+/CyfvEJC1DOUd1MAPDV9+/g=;
        b=wvAawj3/5zp0XbfxIUm9RZ2KbI9V/Pu9eC1ow9kH7D6FzqXPM2fYzswvJTdk8CuATw
         KOJBG6nQ7EsSNrgi0Z044UwXRbrTTnIaiLvIanwtV6QfbswNaNa2izN9G52YElVe/FvO
         MH4DaBXmSXidHXInlU2oQPHb4kSYeBZ4QjVd8NTnihk+cyIZaX1ZYi5BIvwWmq8uR8MQ
         uZfrKev3DbWnFB3JqsYgsQTWLrp99BQQ1zhXm2aY121vx8tRmIao6Nr7VVwvHkp/Ps24
         erK1gUeRUpsrPvbOrj09ZnlroT5ccsp6IvtdLIXVktSQ7bxYPSgVX3Oj4nJu5bc7bNAj
         imBw==
X-Forwarded-Encrypted: i=1; AL+hErFXSISfAuNv1ReQHzoLzrLcvUzT95E3v0Haz31ncyI0JcBEZfjaEPoo3vtNziNwOl7FQ7GCgy4AdIFr@vger.kernel.org
X-Gm-Message-State: APuU4Z817AJwJ7PPZK16osVhZcggA0q28Sr6rXFkyo8Ifw24Ikp8iqJ1
	IyyEGMgsswrtJmvzc1qskHHZEK6tF4BqQ8yn5MdmrSHpT4zPap065RvQD3XXYaWVwL0=
X-Gm-Gg: AZFdTZcM64qKGhqFGHYtLovK5hgu0sbuAcLrS3jFTD1KP413/7lugOHP4UjwjmEN9zW
	NPuG3tGNqPdzwKH4pQJiepLSQ0/eUAvvztjpqCzkxtLenhiMUbVBtKUxmY+p+lrqgdOMehay6Z3
	MGVGQvv+yVsUL1ZhLXSeg9FaweuNQB7Gf7Szo0ouIUhOXy/aGutO4rfQ4B0ydRCJu2Tcj+kbaCP
	u+nhll/KSKejcPJS9qURRl2xjksYjTRNpb6q+hkZR6Gydrgfs9orm012c+DiCPiUPu2OYZd/lPa
	sXJQHrNcSs2hDIw5FjklQ+BiKFL3uuEPfnOrw5vDrpm1SscQN+M/lssKnqqbhWv0+d3GxgZhoCw
	f7evTwUCCXywwfS763omrESCOs/VI54Z6qV6JjaEWrZA52roR71GAhyga8UDam4hZ9nxygeE24b
	/IlW7P9WJUd2S2fIA6/pbfaREzxCuP1esV2MoZsvK1XaNag4PkCLUJnBbtcKlzBLx55WPxZriDL
	fiGsCM1YwVp0nC0Qhj4+yGAHYZhgWI8Bc/Nx2Q895reqQiT/bpkdtki/r6d3eSMC2+XbZIVls1I
	vY9mYXq+mPudoaeS+c+NHgGh0EIqcv5p4Gj8wZ2JXg==
X-Received: by 2002:a05:600c:840d:b0:4bb:6814:738c with SMTP id 5b1f17b1804b1-4bb88820cedmr210403515e9.22.1795398398283;
        Sun, 22 Nov 2026 17:46:38 -0800 (PST)
Received: from [192.168.0.167] ([109.77.88.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm264872155e9.9.2026.11.22.17.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 17:46:37 -0800 (PST)
Message-ID: <e707a3ce-7e3f-480f-9166-3f048b02e7e3@linaro.org>
Date: Mon, 23 Nov 2026 01:46:36 +0000
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
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
 <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 15:04, Nihal Kumar Gupta wrote:
> Glymur previously reused the X1E80100 CAMSS resources, where port@3
> selected CSIPHY4 through x1e80100 csiphy_res[3].csiphy.id.
> 
> Add Glymur-specific CSIPHY resources so ports 0, 1 and 2 map to hardware
> PHY ids 0, 1 and 4. The remaining CAMSS resources continue to reuse the
> X1E80100 CAMSS resources.
> 
> Signed-off-by: Nihal Kumar Gupta<nihal.gupta@oss.qualcomm.com>

I mean this is a bit of a convoluted way of describing this.

You have one less CSIPHY Hamoa has four Glymur has three according to 
this patch.

=> Fixes: tag
=> A commit log that says this

Talking about the ports doesn't really describe what this patch is doing.

---
bod
