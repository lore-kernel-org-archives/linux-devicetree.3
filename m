Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616251;
	b=nT4bHsjQI0UzG9BxqBKyCwwKHOBVwOa3xu19aiTS3gxd5YfRPgXiStTQy1Nc+r2YTc/F
	 FD8chV9PCzQ49Vy/VyKPB1QzMf/nxzsI9xhzl4wigQBUqQcx1LQOQTMy6HWxJqVQBIt+U
	 GW8+Al988aMI3TR0WMJUKsPel7TssUmaSklBQ/f0+lEBZZaSFlMcG80KVSiZFGJYK9Ljf
	 3n8x2x6F6jXUsY6UvMe4XpX6AYxcnfZ81Vbxm123+mgP+3aCTDrLept7wOyvins2RqLjU
	 A1OiwoPi0k8zjvhQTw32sdsppJkGBuNk8eqRy/pIb7581NpdWGm+lI+MDfdDHqyhvOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aAjT/juoIc9zz5suBwAKIoZ37zYZ6TKZoBm98/nn904=;
	b=EUNVeA7RTvq42Mj+oeEWHlbXAhyWxqF6tC8CZkP3v85CJAfPP88BMyw+ZLcHbOam1siW
	 l7XTRiiiB6hhF411vDqP5cWAdPygxg3juP1FMiYgblLzjp4Onmcqx8qXpse818iWFBV2e
	 XUvUgRYlWtG/Alt1dEM0NY4mn5qK+emSiW7p1Qf0YHcDqH04k/SfPfkRX5Oi0bv5Lgm4p
	 Sf4TwALFXd/gn+sM6daZfMgeiOGm+BQyK0btKGtyP+25YIaRgiy557XqnUX5SQCw6PWgg
	 DF/j3riXfdt9jpqrxQu/VUoULHShu/gLsf6BC3JwAzpgpZheUYFCNVest9l6Nnsu9UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A1uGbcBK;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3500B606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3500B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A1uGbcBK
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ae3b5b1027so4536461fa.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616249; x=1796221049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aAjT/juoIc9zz5suBwAKIoZ37zYZ6TKZoBm98/nn904=;
        b=A1uGbcBKfncw0Tc0tLr4lyu6d9hbYldzQ35IkDT/oie+1W9Oj7OT/fRppeExQukyJX
         i6DBLiUHi782agsruQuGjA0zcuVTluaD4d95YNsXDOIY62phyVNZIZzGpg82u5r9TBTL
         KP5Evba48Ci3NeR5K4gC5Uo3yVTh53n/yPMCAOudo/k3OR2XuCO5snmihk21L2FljI41
         0267N09LyKKKG7mcN2RHMuSjHGZu2U6xwNZnP9qKjd0uVbBnDo/sDu5pII8SHH9DCC2j
         WMIS/qGAl0H+vQPvMGsMHjv4INCcwDqN1xDPefrteQIKQutbbRcoOa3ky4Wz8GjXsAph
         mzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616249; x=1796221049;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAjT/juoIc9zz5suBwAKIoZ37zYZ6TKZoBm98/nn904=;
        b=qxb20cQ0egP7CuXwOK2IDbS7KXxqGlobJK41AHgXbwTAzAsiT8YKF3LBmvYN5Lp3sI
         s6pn5tKekWmpiMHK4O4qeSb29QYnk7mnxmHz9GhQ5gvoOaDkRsNSjtJKSm0mlAHAjqlt
         +M7SStFMuKV168/8kU2hdHWyb6GU0Ne1OufpOsi63pwjFffwdcC1DeHs1zptzknRZ+cs
         FC4D39ZnZT8Yr6Sq8rhTg+6kySud7jDUwNN/jJQBP067BkdZ37EFFr8uTqgMGmBpRjje
         BdIRYMRujpSV26rBU/naLvBBUaM+cXhWApmXydybErkm4o7VFHvSqEg/am5rtqkkck8T
         8zug==
X-Forwarded-Encrypted: i=1; AL+hErHXcTIGWWUhJy1kY1HoYpMGbngyCBuVZazH7v6fTbcAivy3BUq6lwsQex1hC4Kp1YRP0O/ei4CKPPVD@vger.kernel.org
X-Gm-Message-State: APuU4Z8mSsY+NQoIBtdoC4fAzizqo0Fw1ghQazWrOOFtzTHHJdXF2IAq
	2MBh+BOnckGPdjxholfNOdbIdmpLeHzW3ijtDeAyVrmCZMVqeIXAI+Ur56v/61OKxgFoKAK0p+H
	2RP+bJy4=
X-Gm-Gg: AZFdTZcu5apdkLtTnNn8FhNWT3nkr20OcqJeAB55gbmgvS2hW0V+IlYt5KcLpOy2ici
	iLS2W4ceB7FwKs/HlaO9WkrytywFA+tZOooqIAN/MMtWfJ+Lt9eQ8efETAPNj2x06i6bkCsZIPz
	sniP7Qpsrfm0Cp7HJUFRnWTvfzFYrMjbsBWQeo9WIFjtIALlnAqD4BHh4Wt61ZSbMl/O2n4b7uf
	jbKCrTpxAW7GsvBnnN3mkE4ndR0BJDlbt5W4AHBvWiNARJ5LKQYfR/0I5ep0QK1a6W+oIU1f4Iu
	hNr9TPmudUHJT0DF07sS9DfjJTbPPib7lUvDOz3h25xvnewHOuu+lhgFpGjepoSEBbewe23vGEm
	ZvaqVJ0e4iUC7Lp6QdMBW1PDFt1lelTfP2/Jv85eJPmKVhkqE3VyTQknp500ezKdR+hhg4YiCK+
	3z5xUlZZIKyoOoxU0XhJtgVo5JrUWEuIKtvGGotU2jLnYIeHfsKSbuIzkb9BIOmtNo+Hbh2suA9
	cimgRnVUAPMyPXVnlK/EvwVDp4UIvck0Y2n8s3zBXVCYyb0iTnzlGgzV7zj+aeV55v/icmf8nq6
	FIxEFkmJbMeW72nUzuCyk97wZnEYyCLzXaiipk7zqzKcLx4ejS0hzFpaqV93If2MX2V38r0jNFA
	WZ7/4WBA=
X-Received: by 2002:a05:6512:6c3:b0:5c1:4a47:b86b with SMTP id 2adb3069b0e04-5c1bc785b7amr6120129e87.3.1795616249240;
        Wed, 25 Nov 2026 06:17:29 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff993csm4633339e87.23.2026.11.25.06.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:17:28 -0800 (PST)
Message-ID: <a1b367f1-a65b-437c-a9b7-92b29750597b@linaro.org>
Date: Wed, 25 Nov 2026 16:17:27 +0200
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
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
 <a2010032-8750-4289-b443-3afb57d656e6@linaro.org>
In-Reply-To: <a2010032-8750-4289-b443-3afb57d656e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nihal.

On 11/25/26 15:28, Vladimir Zapolskiy wrote:
> Hi Nihal.
> 
> On 9/25/26 08:48, Nihal Kumar Gupta wrote:
>> Glymur's camera subsystem hardware is a functional subset of X1E80100.
>> TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
>> three CSIPHY instances versus X1E80100's four.
>>
>> qcom,x1e80100-camss is not used as a fallback compatible since it is
>> already claimed by its own binding schema, causing a duplicate
>> compatible warning in the DT schema checker.
> 
> This sounds like the DT binding documentation shall be fixed instead.
> 
> It makes no sense to add a large number of new compatibles to the driver
> code.
> 

Please ignore this my comment, I believe it will be simpler to move
forward with the current code. Sorry for the noise.

>>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
>>    drivers/media/platform/qcom/camss/camss.c | 1 +
>>    1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 23f3cc30a15a5e098162bea98ba69fa636abdefb..9954a99981004590d34c722337bb6510fe759699 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] = {
>>    	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>>    	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>>    	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
>> +	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>>    	{ }
>>    };
>>    
>>
> 

-- 
Best wishes,
Vladimir
