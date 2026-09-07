Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882CC2D24B7
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788013; cv=none; b=sOfdxRLVFSRslWG7gSX5Mwld9cFVFfzrMk31GKYlVmsTnLzScHYhVdpEDy7YwnRKumR/86xlvrY2L2Sb0TIOvO8zcdklXG2gc53e5hxky9iQaMxbtLPZHbyMwXqgdafTYLQ8zzFGQ9sdaGB/robK3czWvmUu5c5E70srMAi73WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788013; c=relaxed/simple;
	bh=UGpEwHE73K8JUHx8prAb89bZKHDFXF0E6NVwybBROg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSEtLaLClbLLFOcXSeyDb5gl0rHKYVphWoKpd5OfQBEP1NJBRvlrE4MnaY5W8Lyw/EXCaX1DYJcCg9uCagJU3KxBhYYL4iQicqX9K0cFo7hEOhOjLCDMeuo2Y8s8F9OCKgHJG8raeMDRF0wKvpdnObJ7hmPwyW8dv20Sh51BAAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0YZN3w/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUWmt/oO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0YZN3w/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUWmt/oO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnBNm3863121
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WU8hu9+Mpo6BhUGuNxrAU/OvDkc6gH+9dBYerOzVkXc=; b=F0YZN3w/fjWzYsm6
	3R/9wc8HSEX9puNtQm9Jlz523qRpJW917883JGtIVWjiswIWAsU4y9ByaXBdOL/K
	J3c0G3Pw602FFesdPLSQbC8y6AGV90jcEfPCQNC04xO5ZW3ctKG8HqDuBLsVee4q
	/Clpxdtn9Rv1ToEbE41U7tPvF73xWsj6GO9hnQLdA4m333SMGn7njkhIPxeWlQeA
	1fWeQggmM9ufAtVTNwv4MsEXXaCrogb4ySaads174FYv40XnO7x4e4DfbtfMbrst
	P8r2aJe+oIqSPDN+FpFDnOGcajCGohVxSPeOg7+o5EpigcoLPr/DOWk0RqkjfYx6
	45TIBg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66j18r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:33:30 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e9e2deaa4so2731218241.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788010; x=1789392810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WU8hu9+Mpo6BhUGuNxrAU/OvDkc6gH+9dBYerOzVkXc=;
        b=IUWmt/oOZDlG85JTstSuCm/j8R4aXhdo42JP+ROJoTzm28UewC5IxIpvMY+9fedZSW
         veXkk/WhhUM7vzHEotR7xkwm3P5cKcA7QOM5cAVq69JFxGAjwuh1Bl+9WqGgu/18t9Bx
         1TGrfS4EaTkFRPUFoxBLliM5VHN7gkxcKO96AZNk+kRwViwKQj0c0/1t5a3M6xzhMKWv
         8ZaEs4Guf5CoeVqeYbRA5itfUEmRLQAtXXd34/WKdDhGsjtiRW917krTWh732y1cUDcZ
         Ixp7BU8ewX65tBAKbfDlf7LOkXT23KHCYapiaCCp88R3Mgei4FBz4Fl6R79ZKVNuLCfm
         Ep5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788010; x=1789392810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WU8hu9+Mpo6BhUGuNxrAU/OvDkc6gH+9dBYerOzVkXc=;
        b=qulpB4zgKam2XCQkSIZlNkh6YVJKO2Y0aJ64Mw4rBbcrJJu5vdx1OVHJf4KJs8nYJl
         jN2nqktcsxvtvWTiXBZriwewoQDVlWtXoeFOVfXp5jYXx1vRPPXqAgD2epX1t2zU3DOL
         MAhrsbD5rPXWt7nFgwVv9l9voNFxVjiiG91/q7ohcJ7vAFjsYu6EuEsTFGGmasCpxWsw
         Zit65sLHWm9XJZYuJdYBdrk03SDt4iZWtDXd7f7VvaiFx9x5GEqhMo4CsEq6Mc7ykj52
         MvgpdFfWQGE8L3esqSzf/HxT6zvXR4mvsvQx2kSjV67miQSc9PNZpALv0h8+lHX2TITD
         xDKA==
X-Forwarded-Encrypted: i=1; AKwUvByZ9c4AqKO27FNVjAduQZkqRBnx8EELfQ1OqwLafCNeqBDdnPTiLpJOTJUYchqqZ/7Cs9NDfKNV2Glm@vger.kernel.org
X-Gm-Message-State: AFuF++l4js0GmgG7twpi8uUYMYsasISahP5DtAh7VOEjv5003yTZ9iY6
	o8t3OuEMyK5WY31zuW6hInu9sxDh+UHLa9hfv4cPNtzbo9qJpGjpF3AJq7tYRp6kKmMyZ7Z/DDz
	BzA5Q6rCPfo6Z704ejp1F4IrSy5n8ODHCeUERYExCpNvfauO9MWwYLANZR4EHzA0w
X-Gm-Gg: AYBFou394eOsZDFF6zieeMI6SEgx+o627ZsMbUTkdNKMUC+jwuQpWgLHF5/7j6i94Ra
	B/YYp1cvZiqz70k5veZqMPJbh6AEgNkQY/2XbeJlAR5DbOXd+L7AF1CxETRGaEMi+F8/Nn6mXiF
	USBoKam5yVzwPiqF8G4ilxidDUyMScIsOeWB8IEB+T+cGD/cfyMhtKmTb4MRFK6s3RFuhSdawPg
	XD+/VmzDTu6dQlvtwOZZjOBDZMrjY7mIhd7PCfhV9JBQN2ToZlgj7vi+sIqUGdXoaVibhRWFfdY
	/IZinOcFFWI1VD3hgdn99t1eRAgDWSJYZSxvqjyJdougtdmg+YlUyaNRb61/YtRV12SPSGQk9ol
	aSzyrg3+BAUmWY+fT9uvbx8l/eow=
X-Received: by 2002:a05:6102:578e:b0:778:4fe0:8297 with SMTP id ada2fe7eead31-78a4aa70e09mr10723881137.11.1788788009733;
        Mon, 07 Sep 2026 06:33:29 -0700 (PDT)
X-Received: by 2002:a05:6102:578e:b0:778:4fe0:8297 with SMTP id ada2fe7eead31-78a4aa70e09mr10723851137.11.1788788009192;
        Mon, 07 Sep 2026 06:33:29 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm222288685e9.4.2026.09.07.06.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:33:28 -0700 (PDT)
Message-ID: <8c5ac974-f004-42cd-90fe-3611fd8daef0@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:33:27 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] ASoC: SDCA: add hw_ops with hw_init hook
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-5-srinivas.kandagatla@oss.qualcomm.com>
 <603a67c1-dcc6-469f-9420-5ffbf55000bf@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <603a67c1-dcc6-469f-9420-5ffbf55000bf@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9ebd2a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=wW6vim8a_ILquhf3CB0A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: dkVHoX6udsDZnlpdPshp-lpYW432kOb-
X-Proofpoint-ORIG-GUID: dkVHoX6udsDZnlpdPshp-lpYW432kOb-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfX+Nv4Wz5zVm43
 D2PiXR9/5STZikC2kQdNnToVAo2elRV5RBXD6q6GiWOP9qR3VVkeKrIYwEZRlJCqe6V9fzvMihJ
 nl2x60QnkzDwqFS5fqiTg9WlCSziZio=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfX/R0h0i9ZEqv5
 16BxGk0Q+FUW3tQFBH4V33K57c8ItQz4vKTY/E/sBD7OkoG93QvBNUu3vk/XXgyKCpk/IPMCf0h
 LheZjccyqyk597ZeC6poSJIMelkAy2R2bR/Z8ebYCdZINSxUrTgYm7fGZSC6+XeamSsx8rHse98
 CKdqAMDeJ8qJbzHF5ZGZHoDXN2YEQ9BB7bA5EX0JJSe7Of6SiCRehkTPjBWGh3dcb89la8L8nJn
 vrE0Bl4utQtpqxFUizcPsXlUjXzouIboxOiIQUbkHmcwxPkc5OpMDoGp0mVfUx6Df56gIOZ5fYf
 dFukBxX9U6toMbQ/mdKyH79JIONHlT+XgDeDQEELyBgRKnkRYFDGVJe2XC5Ib7MF2zXRLR4yMkN
 30oN1H8Z7UVhMvn2EDxTaxGSm3hoGzVV3+TD8tTUB8WAfNWZrD6n9z4F46yPFcAkTwOYRIoNwDc
 EH7oOk6AXKmgh+o5O9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070150

On 9/7/26 12:29 PM, Pierre-Louis Bossart wrote:
> On 9/7/26 10:37, Srinivas Kandagatla wrote:
>> Add struct sdca_class_hw_ops with a hw_init callback that runs from
>> sdca_class_probe() before the class regmap is created.  Codec drivers
>> use it to enable supplies, toggle reset GPIOs and program initial
>> vendor register state.
> 
> It'd be good to clarify when this hw_init() is supposed to run. Probe
> and hardware being available are usually two different things. I think
> this relies on a behavior at the device level where the function
> subdevices are only created after SoundWire device enumeration.

This callback is now removed in v3 and using probe to do most of it.

--srini
> 
> Also the 'hw_init' naming could be confusing, this is used in many codec
> drivers to track if the hardware has previously been initialized.
> 
>> sdca_class_probe() gains an optional const struct sdca_class_hw_ops *
>> argument (NULL for pure-generic SDCA parts) and stashes it on
>> sdca_class_drv for later use.
>>
>> No functional change for the built-in class_sdw_driver, which passes
>> NULL.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  include/sound/sdca_class.h  | 17 ++++++++++++++++-
>>  sound/soc/sdca/sdca_class.c | 15 +++++++++++++--
>>  2 files changed, 29 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
>> index c6063f22be7a..3342937d09fd 100644
>> --- a/include/sound/sdca_class.h
>> +++ b/include/sound/sdca_class.h
>> @@ -20,6 +20,17 @@ struct regmap;
>>  struct sdw_slave;
>>  struct sdca_function_data;
>>  
>> +/**
>> + * struct sdca_class_hw_ops - optional codec hardware callbacks
>> + * @hw_init: enable supplies, toggle reset, etc.  Runs from sdca_class_probe()
>> + *           before the class regmap is created and before the slave is
>> + *           ATTACHED; callers needing bus I/O must sdw_slave_wait_for_init()
>> + *           first.
>> + */
>> +struct sdca_class_hw_ops {
>> +	int (*hw_init)(struct sdw_slave *slave);
>> +};
>> +
>>  struct sdca_class_drv {
>>  	struct device *dev;
>>  	struct regmap *dev_regmap;
>> @@ -27,6 +38,8 @@ struct sdca_class_drv {
>>  
>>  	struct sdca_interrupt_info *irq_info;
>>  
>> +	const struct sdca_class_hw_ops *hw_ops;
>> +
>>  	struct mutex regmap_lock;
>>  	/* Serialise function initialisations */
>>  	struct mutex init_lock;
>> @@ -35,7 +48,9 @@ struct sdca_class_drv {
>>  
>>  /* Library helpers used by codec-specific SDCA SoundWire drivers. */
>>  int sdca_class_read_prop(struct sdw_slave *sdw);
>> -int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv);
>> +int sdca_class_probe(struct sdw_slave *sdw,
>> +		     struct sdca_class_drv *drv,
>> +		     const struct sdca_class_hw_ops *hw_ops);
>>  void sdca_class_remove(struct sdca_class_drv *drv);
>>  
>>  /*
>> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
>> index b952fa6eb802..374de7d9e0b5 100644
>> --- a/sound/soc/sdca/sdca_class.c
>> +++ b/sound/soc/sdca/sdca_class.c
>> @@ -153,6 +153,8 @@ static void class_boot_work(struct work_struct *work)
>>   *       allocation and sets its own dev_set_drvdata() -- the framework
>>   *       does not touch drvdata.  Typically embedded in the codec's own
>>   *       priv struct so codec drivers can keep per-slave state.
>> + * @hw_ops: optional device-specific hw_ops (may be NULL for pure-generic
>> + *          SDCA parts that need no quirks)
>>   *
>>   * Codec-specific SoundWire drivers call this from their .probe after
>>   * allocating a struct sdca_class_drv (usually embedded in their own
>> @@ -160,7 +162,9 @@ static void class_boot_work(struct work_struct *work)
>>   * sdca_class_drv fields, sets up the class regmap, and queues the
>>   * deferred boot work.
>>   */
>> -int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
>> +int sdca_class_probe(struct sdw_slave *sdw,
>> +		     struct sdca_class_drv *drv,
>> +		     const struct sdca_class_hw_ops *hw_ops)
>>  {
>>  	struct device *dev = &sdw->dev;
>>  	struct regmap_config *dev_config;
>> @@ -178,9 +182,16 @@ int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
>>  
>>  	drv->dev = dev;
>>  	drv->sdw = sdw;
>> +	drv->hw_ops = hw_ops;
>>  	mutex_init(&drv->regmap_lock);
>>  	mutex_init(&drv->init_lock);
>>  
>> +	if (hw_ops && hw_ops->hw_init) {
>> +		ret = hw_ops->hw_init(sdw);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret, "hw_init failed\n");
>> +	}
>> +
> 
> nit-pick: should the INIT_WORK be moved higher before this hw_init()? It
> has nothing to do with regmap and we'd lose the requirement that
> hw_init() be run before regmap inits.
> 
>>  	INIT_WORK(&drv->boot_work, class_boot_work);
>>  
>>  	dev_config->lock_arg = &drv->regmap_lock;
>> @@ -222,7 +233,7 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
>>  
>>  	dev_set_drvdata(&sdw->dev, drv);
>>  
>> -	return sdca_class_probe(sdw, drv);
>> +	return sdca_class_probe(sdw, drv, NULL);
>>  }
>>  
>>  /**
> 

