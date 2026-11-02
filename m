Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622518;
	b=VUXc1mcqRhkllfvPrKcrev05m4O8rUrP0gs5/VKO4S3V9uK2DapBM5G0jLoKkDYqNWO4
	 s1836w8MoNIV2BdE2+LOeGmEn3RMdR6PyIvjHKWP0DSLyLuFS9nCax4satpN8ztP3T22A
	 BNltKICZvA2ctmKxoqZZ4nmtORLBGmBPOKso0b3NX4qUBrFR2pHCbsw+4zh3LGuejc02C
	 j8Ux0RotL1H9ai9txh3I6XqMq7sHPcg/4De0ssFDcym8tqfTxfl4fSHYTQw+wdn9FqGo0
	 z9W4XEzgIu6KRmKTCmdZcxnUF+E+wLnAyIE+cGFAYcacCcbREj6pyFmLGB76ZA+/mtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=RH1bKqdvWH93WZHvhL42AU6mPQ5Xjib9xME7mZTCcE4=;
	b=F2UTqxYscyslE3e/R2pMd8/xPf48ObG2mNZ+na41Ov7LkafS+kMenizHs6pGI/pIfqNB
	 5HwSSBBd7LwCLU591IkteWNrB0/7mR6RLbGvqR8K4NE+FMSWWmX4/q9h6gsiEn/4Akiz/
	 IjCD0bbNoJW0R5f9gtPLKUgkYG+2QLB2BSrsNBmgBKNVHmIiPJAnGG59W9tmLAyC1LLak
	 gH7GpWZd6D0E10249+TFi+jhmzVxaVu7xHPhV/sPInC1NFUHkn+KHSiSWT9cY5AjS1y1l
	 buv0YKrAWEpnO4ka9nb/1hXyNF+gFGpwZ7XngZ1mCM/2OnOb5ilA3++pDAKMJr4twww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fbcyOIkU;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBE9606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 12:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDBE9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fbcyOIkU
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b4b7dee316so2808351a12.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 04:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793622516; x=1794227316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RH1bKqdvWH93WZHvhL42AU6mPQ5Xjib9xME7mZTCcE4=;
        b=fbcyOIkUCz0TGl1DajcSVL74qDJ8dEfsmuoLiH2eVZ7u7Q5DIgP0CL1WHMYVnRFtn6
         wX1ySB8VCnR+BQBPNPNeX5MOi9aQ6RD4iKkmB81GPjJqqx8TGjJGCkMaA+P9xmkmB+6Z
         xuOIWXP04IimooIF50ZrsBxN0SxP0qxl88z7wFBXKaj6QK0KEy8/eT6Iv1uVZag3xPju
         b/Kubb4a/THgn/wwAuJZqo/iB1dztxp9qvJB0um3EZHQkfKi5wJLS/VdJy6faXzoFK2M
         2gZL9uwJTYJZlo+RKFkPDeX4yg2TP60XLUaFeegqjTykCtFwvK5B+D0Yu3SUTYaPv2Kp
         7sxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622516; x=1794227316;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RH1bKqdvWH93WZHvhL42AU6mPQ5Xjib9xME7mZTCcE4=;
        b=HsbyCsVHqOPnEwdF4HIqFezbpiF2J3wNn/QP0xtgRO/GeQIxWBd/yMzlBYp/OgteJq
         t4OIGbxzRW6KmoMhPAiPcv5Ux4Pvfh+w4BIu8tmp1Svq8GxE1MxtiIGFQ/ipiAwWhGuH
         nPMAYXvipEZP5VGXlujtEjFSMdxOB1jDhm1dI+ACT+NiFV2N1OmjGBOjEid2mBfFByv5
         fthx5WbH43lKpWXOgpowT27FAXiBT6KLYvY1L07dwKBrHZ7yF+D68O1xMSRd6TOqNSxO
         iNeDERuua1mSFHuuPSzv95BST2paH3pOVegudDFkeGSVzuhzISSogySsB8TLPcovI7UN
         IPqA==
X-Forwarded-Encrypted: i=1; AKwUvBy2uB3kPiMT+/MH7LV9vYtjLDDJxtFdHbFSpRocw4ni3OIrWXMfi+9N/MGxF8VX5+QxLluzInuQ/oZH@vger.kernel.org
X-Gm-Message-State: APuU4Z/8iNunFiFb7BhAHQdGMhOiDi0XPuLlSG7uLbnp5c8XWTHB8c2N
	ZWPa0ll1mKXd+fpsIBVI5Dcf8qbvPZJ9oHMuEsG9kfVHnbUaHR9DRb2YeT7Uep70CrnpClxFHQQ
	WsIO5
X-Gm-Gg: AYBFou2YR1Lmbyu6FSx4vttoDlbyxSt0UFWn3kHtxJl3wKWmjAZyM/pb6ob9wszASoQ
	CzKKldPfeh0T0qK3CSVX2EYQTbgsTqpFrzLUplXvKkYlgu2ZdaUpAIZ+8SmkjXsKjFEfmu8lCW5
	M9+nYRPEkZEd2O+iLmquwk7jVUJoLBHRMLWrP43nVEXQshz0jWZW10ryJv8/JUlqjLw7eB2PAXq
	1fb0zXbkhjoJST5i2y8eZBTuXRLaPHwuUojMb91r3cIefHZeHacrlUl3RDKvh2n/QthAuhFgkRW
	lrTYsSitkpI1GB3V60tM8JnoD8WzTpUTSp472CvyOgNS+YarfjV9k8iajqq6wX5MM63uUePNiwa
	41xU1JB/xCBXE9PPvZlkYzsoE49vFyw0+NHU1GURMOxNTkgvg2woF42Lf6V9bo/L9/npzpi5WSd
	n+SpGOJak9Z+UVJHJlm8wvEpn+uvaq4n/UHUY+YRjtXcIpyZkubGIi4S9g1VHHOED6AgqkOX8Ik
	DOQYMGkLbKHbUYle7ZutOCXJCFSJFR3962MoYVx8sHsiXUf/rggOnQeDVAEXWjWKqrQXx9K9QNL
	yZFJdpiMZvy96m/KyuEPzFo+/x5W2iSG4/lnCg==
X-Received: by 2002:a05:6402:11d3:b0:6af:dc4c:5f28 with SMTP id 4fb4d7f45d1cf-6b4d4f71386mr7121197a12.37.1793622516124;
        Mon, 02 Nov 2026 04:28:36 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9eebb0sm3172063a12.8.2026.11.02.04.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:28:35 -0800 (PST)
Message-ID: <b59981c1-e98b-4c20-8e12-2c5298c0cad3@linaro.org>
Date: Mon, 2 Nov 2026 12:28:34 +0000
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
Subject: Re: [PATCH 2/6] media: qcom: camss: Skip TPG if its registers are not
 described
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-3-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261031112203.545319-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/10/2026 11:21, Vladimir Zapolskiy wrote:
> -	for (i = 0; i < camss->res->tpg_num; i++) {
> +	for (i = 0; camss->tpg && i < camss->res->tpg_num; i++) {

this change is OK.

>   		for (j = 0; j < camss->res->csid_num; j++) {
>   			ret = media_create_pad_link(&camss->tpg[i].subdev.entity,
>   						    MSM_TPG_PAD_SRC,
> @@ -5434,7 +5434,10 @@ static int camss_probe(struct platform_device *pdev)
>   	if (!camss->csiphy)
>   		return -ENOMEM;
>   
> -	if (camss->res->tpg_num > 0) {
> +	/* TPG register spaces may be not described in old device trees */
> +	if (camss->res->tpg_num > 0 &&
> +	    platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +					 camss->res->tpg_res[0].reg[0])) {
>   		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
>   					  sizeof(*camss->tpg), GFP_KERNEL);
>   		if (!camss->tpg)

This seems reasonable too.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
