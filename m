Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB25454857A
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957414; cv=none; b=qc3nwi5IGdgT1GMXGS0vbt33NiTB3g+vJWpmHX2TQq9Svg+2YQQ8KZEyL2oPMFA3WTDs9n+5HeWqnNplSXC0AsvBNfgtpYI4WvmczvX4kiGyZXNXTCAXMJfPa3Gb8qJVdZvdZPz200Ydips0Z3OprF0qTUD1p88fcAv0Pa0N+ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957414; c=relaxed/simple;
	bh=YfjAvPdBKbnXD2YuEdHrU87LoOtJEmtm9vYNZ/tqQ5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V2qfqgLwc0Za5WYxaRxFmh2aEJKrSfa5XHhLIGlqGz+O2p2+7q9l2s/eYvfkRgPGvLTM38RTyk4k9v6OOf7cnGWV5XvBwJDB9nnupLUdbu/XcmqRKkB/5Z0WBLVi5w/9JKy2LSWWrDq+DD7KSh+PaobEd8QAon4QS9d4q38snOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SddxUvqf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaSl+DsO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SddxUvqf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaSl+DsO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CAS1t1233040
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 12:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k0aIJj02N5eW9DPn3IPDbLi/UTZIBEZRNwT336P+4Yg=; b=SddxUvqfrGD6Mnch
	t2iOhzG5CF0NdMjBsBKY8LMIs+nOEo+OzLSscn9QcwEWrjRe11DJQYn4pyDVhW7V
	cxQ6fqVEur11yuH9Ew351E87+BYW51MFbsx4Vb53iB7J37NsQTd4wObnYmQs7aKy
	AhnlOXUevjKmBGvijpOd4604gtVH1MrA96q6Z6OZL1AU+kGnsEep07qLHi92rUNZ
	P2Afkv7fjZ21B0k9q6VI/58iJVI/GqiVsCqYPhhSiYZwkGVJReWN6JMSjHDXrUst
	DcSbuVmEKgXSyk2IrQ3WtQUnwkBySJyiy5i0t4if2Jh9vWifgQ+5ZI++mIFXjlip
	KEPSJA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk77vg2p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 12:36:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc39363cc88so6064087a12.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957410; x=1789562210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0aIJj02N5eW9DPn3IPDbLi/UTZIBEZRNwT336P+4Yg=;
        b=AaSl+DsOERSLVwpSMcySI54/Z7DUNguu5HQfhPxHKun6fEbFgVC6whYWlJV5cY144e
         cMMiA/BnMAsUiRklj1zU2E+ZFXQxMMmvZASMs9eEmPfJNx7F+ANo//8BfDp+NxqBla7t
         erhhOw52dAJPRhViaddql509p1RvigW9fPTdmbr4Q5YAdqO2R+vGCk5szVklFd7tw1ua
         s/iQqlElwJ/OdOirOBUTNFMFmYbD7C0+Uj/mA6gJrOf5YzNPD3vFenb32ZwrYuT8d/8L
         zvbIqEDoZfNGP2ui7gXEVgoSmVcKQmU/ko1WOwiMe9p+GdgYEPUE9V1mdlyTsLYygnHo
         rWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957410; x=1789562210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0aIJj02N5eW9DPn3IPDbLi/UTZIBEZRNwT336P+4Yg=;
        b=NfGnvUNP09FAqO3LRw/gw9AJcc4qj8TrXKvcHHSBh1+40FT5NZ0S4vSGnPIiLPupIx
         N0YKOdBWfT6MPc9kR4LpnYDSy143jJVp/c27h/P+jFzWCD7OLw6cIoMmtSVJLxwhs8/A
         qF/rfzunIcJBkocSdvhRA8M9sav1vodff3+apH6CoHK2nh4e7YXzE9esAERJtOBxXR86
         uULE0SkuV6tviOye6lrp9IufqfB644cIAaS5zg2x8yI/GkaxNJuQWRnn+X4DoL88BJZa
         aCFIbZITwVf991RP6xmojVf853U4bgPu+h4eSyo2X2GnwvQSAr9JnppIhTdbj7vczWWV
         TnGg==
X-Forwarded-Encrypted: i=1; AKwUvBxZtrUosuDSJRQsqPlQudy3URhM78vMaKPanvCwvWAXbyyKx53lVQA3QaSP4z8VAGP7+TVVqSvJTn8G@vger.kernel.org
X-Gm-Message-State: AFuF++l1ZPXmSRb9Lkr2O6mEuCoHEuDIZTF/YaDFUR10yk7g8xxCwIB0
	D4eNKnl2oolq6wzDZoxZ9DvM4HLnWJJ3CCUXwsUZCgjiu7cTaxipvyNm7oatgnFgE56g5MqtoUx
	LFRp7R40LTFiDv6d5ipC+TasgOaSbvnShEWJjLgNimEwh+nW+AygkqfcFQmYfOXxz
X-Gm-Gg: AYBFou2GtUgjOmtFVr7lp8m2h5Y8hpSbi6r1x6zQXn5zze//zLlHV7aHE/IfVUTm/lA
	zCAfcrhWPEybj22bue/C4+BF7ocVTaMOeqji6dbG3M4gr+UI5XzRlt8cYiVwg9EAZFiyAsn9Qv3
	/DlU07cTjc1BkT9MRZY3pvUvKz7nQAu0H/m8UvmmaUT13SzEx3QaHBDaK9bP2BUQ05JlriVoXPF
	4V780GrzJk2ISjDgphPMyN4sAkoJg2StNg/zTSYaI3HWTPD4eI9Pcg6JYa7RyEsHOjUcoVMkhXJ
	OozroRxdVs3wXF8LuH5diDcMTL12RNu4meOXv59oGc6N/PC0V3tzzk+egAG+3QMrnY4bnlrEcnr
	sES3z4YOeGg5QquUGYTTzISDYq2hHvwSrzwApdYk=
X-Received: by 2002:a17:90b:4e8f:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39b261ba63bmr53233789a91.11.1788957410334;
        Wed, 09 Sep 2026 05:36:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8f:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-39b261ba63bmr53233708a91.11.1788957409748;
        Wed, 09 Sep 2026 05:36:49 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm44440757eec.17.2026.09.09.05.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:36:49 -0700 (PDT)
Message-ID: <adcac1a5-6d34-4978-8fce-b9b5a0361b76@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 18:06:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
 <de0a0b99-9213-442c-ac5b-944a0f6bd432@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <de0a0b99-9213-442c-ac5b-944a0f6bd432@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6aa152e3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=sozttTNsAAAA:8 a=4itsqHrdGYRd9sU1pkYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: wNpBm8yyo6QGXyFFs1mdDwi87vleu7Hb
X-Proofpoint-GUID: wNpBm8yyo6QGXyFFs1mdDwi87vleu7Hb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfX6U9wSeBGDI7X
 jT4sGzcUv0NYoEIuvcPIFvIRSb+zQE5oH4NImAFHgASeN/dkq7rN8onJNwu3MG8Y5od5BDPsM5G
 MiL2hNTg9CaSwCffWkNxFIai0hxiFh4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MSBTYWx0ZWRfXzPPLQal9o0gv
 uujvVn5p4jN454C4MfNtEUY3dOU3ES2Dzq/omGMIm5rR3QhHQ5N73ugcbr3P8MZdbmmelKnETGI
 xrSJjDPiAufIA/PVZc1od+WIYPvoEgWaE4e/PRj0zG9MpwbnoBK9fjJUjo4NCitPQhZrkz9fAY1
 b9Vbh34csbdiNNFygK2NUmdvT4pn8tG74G7bNzts7XMfysIPxEHGt1FwqZEQEauvIx8Q9TdA1G2
 ZhldxkUpFbn204RlSjyai3v55kgFroMovNP2fnPxf8+H9AgT6/Hq8kQ/MdeTmAEk2d3J1et47dV
 uvUThN7juRKKqf5EZjOio1APKsYmCwp4ZUz8ChV1PweoAd8t8Jb8n9035us4GavckymIs8ssGj6
 549Z4X/mESjdNqneHCm/ewJh4AijHFC+29CIE2TgMUQ1UK40HnO5wxsWe+xb9rOwrsY/i2DSETU
 3m6WHz26FBv/8FbzGiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090141



On 9/8/2026 10:56 PM, Mark Brown wrote:
> On Mon, Sep 07, 2026 at 11:39:44PM +0530, Mohammad Rafi Shaik wrote:
>> The PCM1681 DAC requires the SCK (system clock) input to be
>> present for proper device operation. On platforms where SCK
>> is provided by a controllable clock source, register accesses
>> over I2C may fail when the clock is not enabled.
> 
>> @@ -311,6 +313,22 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
>>   	if (!priv)
>>   		return -ENOMEM;
>>   
>> +	priv->sclk = devm_clk_get_optional(&client->dev, "sck");
>> +	if (IS_ERR(priv->sclk))
>> +		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk),
>> +				     "Failed to get sck\n");
>> +
>> +	ret = clk_prepare_enable(priv->sclk);
>> +	if (ret)
>> +		return dev_err_probe(&client->dev, ret,
>> +				     "Failed to enable sck\n");
> 
> It looks like the device needs a delay after the clock is enabled before
> the register interface is available (see 8.3.2 of
> https://www.ti.com/lit/ds/symlink/pcm1681-q1.pdf).

Thanks Mark, for pointing this out.

Yes, based on the datasheet, I can see that the device requires a 
Power-On Reset period of 65,536 system clock cycles before the register 
interface becomes available.

Although audio functionality working fine without this delay in my 
testing, I seem to have overlooked this requirement.

I will verify the behavior and update the driver to include the proper 
delay configuration as specified in the datasheet.

Best regard's
Rafi.



