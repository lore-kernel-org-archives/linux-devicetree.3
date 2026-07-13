Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EB042253A
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948774; cv=none; b=q05+H2r0k5aWbjm/AIZSY2Zo+2qfrGDpB1+FNyvkkyp8vrG75/h6JBZLVCpGBf+vncI9irBkqFgzL4fKsXCjR5gYS9ni8U84HFB73Zb5rBu7ZIp6AQwMIjFM4TaNZ+131dyc2UN7ai91ByA6XRpB4B6Wyw3HFSFc//DNT2MWdZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948774; c=relaxed/simple;
	bh=3Wr4e31xsL5FxE1yKBLHPMDVMdK7LAWRj9VzDWkA7xQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxlVaoBKxlqx/Zay6Z/c/mF/dO7ITbzN+3zdIES/2iEt19Azpp/o7ohQqprDljzKYybXwwHJ1tSAMRmR+Sv4pazDu2aG+F8AwSCz5pK6gIpkgM17isGg6TxkDW0S5+DH2REYH8cJ/iudroCTS9p0zIURbE3LVxYzNRfD3yWD8sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pdGeRzlp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pdGeRzlp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ec555a26so20575345e9.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1783948771; x=1784553571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTbNJLihYo7bkMewNpvZJfJ0V7h5dxKS3F/GHCAlNdU=;
        b=pdGeRzlpM/B4egrGVhmKf4IvfSiuuOXlaavRDiSvx8lLY/ejSsh1w7L6HdYjQsOJzl
         VzmeRGAsvirPbWz9jHTpQdEDNAKLQUdvjtgHosbwB1bhYwfdQ91p+c9BL4roSez/WPk7
         LGDh2EZg0GXZl0fqip+bdXzit978GHNaQiHpo2L6P/FSpIwbp8A7BDY+xLzxA+OwozSx
         RtPx8dzIdvGMMmkJlTw4QhxBKca+iAkI4dyJXNR63zar18A5iadQ4FitkIKR7/6ALBoS
         jo6bXDRtC65htHeNmdIKcv88HXB0xL3IEbh0rJZVU4mxeSZg1mkMS0fMq3QnmAzRfPTq
         ufMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948771; x=1784553571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTbNJLihYo7bkMewNpvZJfJ0V7h5dxKS3F/GHCAlNdU=;
        b=LFwmLIsjVo4gSzES77aFk0VxaECC5NB2waxK9GAn1sMZwc0ajwACpTYLD4S4FGpFGQ
         o8UMxstppxeQ0wTFtUsIGtTKlXOB2bLcITF7N9anEkuv6ejsRKMw3GcrfKX0wZeTjl6H
         LCyNCg5cLzUWuTMTfM87oI5/U9saDWCGZrxC8k799nX2XPISErNRwZq2Z7Bw3MZIXIuv
         Uox3zjscxkLU4nFM23+gSeLnevgCcDwRkf0tEsDVFri94AJqD14kWj0kgYuv2UbTxGS/
         wMegslfD8KdHujfLk4VnIW9qr99SJHxCtL9tMbRnQznDjnPrb6Iqb4J2GR+Rwd8qR8GJ
         IALA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7hzV/fVzvmRi9kjN1pytkgDOvhGV33NaBzIbrxlb2UUgRsn5zwy5mK8LrKTPEMgqkH3k/3J2nUmmo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/6SJ+7bbsdWqurr8oLk9J+9sG6kYTpMpuKSCdtEHHHsPDJhh6
	YaFDXz2JXiarxVmy782Nr4I+tQBrAS9UYWjtzsghP79zSaBaC8icIw+SqPQY+b6cb04=
X-Gm-Gg: AfdE7cmc8k/ehn1c03QeimR+wDOj12zUx2CBHUVY3lWEcPCOMLFzUQH5S58OZhBwZ8C
	teqeZvLO8hdQNxg7/+LQc6xRAAqNfrM8c5QicsjfhkiqqyfCXOj/P2+Pnq03LtxFM1onmQ6JKg+
	5AWnM41/Iky2jE1NQ+Kw5cNmfqG1xxXm2HrNIYF/UJSxsV/x3GEAIHb5lf2XSRWt2+okrmGwigK
	sR5JPtlhM3pX4l/YN+OUKBO1L70j0lic5yEe/u9ckMiQnE5uCkup7af8x2T89O2XdztgHBSz0ll
	xKZwsJlJHS6RVe5y9PXJlLg9BT6wwBcXreL66Qq1tzXcq7v7BkzVrb55MvcdQ5d9f5uRKY+6o6r
	FFNlTTZvrc5v3Kg202oHueIXDgxoBNOnCfb9Eh34U1pk/eZvVrdwjECH227CliF1s2gS6FEDKRx
	NDIlI13xD2ThfRJaKIU+WgYsKYXi789v2dAZfdrP19kk+MtYRoTNSapxwNiFWEVlo=
X-Received: by 2002:a05:600c:5307:b0:493:f278:ba2f with SMTP id 5b1f17b1804b1-494033f4fd2mr26419545e9.9.1783948771139;
        Mon, 13 Jul 2026 06:19:31 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6402:500:e91e:fe5e:857b:d0c? ([2a02:2f04:6402:500:e91e:fe5e:857b:d0c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493fd3ccfd4sm120499685e9.2.2026.07.13.06.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 06:19:30 -0700 (PDT)
Message-ID: <f5b7441a-d72a-41c1-b67d-5225d8e9ced0@tuxon.dev>
Date: Mon, 13 Jul 2026 16:19:28 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "magnus.damm" <magnus.damm@gmail.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 wsa+renesas <wsa+renesas@sang-engineering.com>
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
 <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
 <TY3PR01MB113469434A4393A02DAA45DDF86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113469434A4393A02DAA45DDF86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 7/12/26 17:55, Biju Das wrote:
> Hi Claudiu,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
>> Sent: 10 July 2026 12:37
>> Subject: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C power source
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The pin controller provides a register
>> to select between these two options.
>> Update the Renesas RZ/G2L pin controller driver to allow selecting the I3C power source on RZ/G3S SoC.
>>
>> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v4:
>> - none
>>
>> Changes in v3:
>> - collected tags
>>
>> Changes in v2:
>> - none
>>
>>   drivers/pinctrl/renesas/pinctrl-rzg2l.c | 73 +++++++++++++++++++++++--
>>   1 file changed, 68 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> index b52a85066f63..9a0706fea220 100644
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> @@ -69,6 +69,7 @@
>>   #define PIN_CFG_PVDD1833_OTH_AWO_POC	BIT(19) /* known on RZ/G3L only */
>>   #define PIN_CFG_PVDD1833_OTH_ISO_POC	BIT(20) /* known on RZ/G3L only */
>>   #define PIN_CFG_WDTOVF_N_POC		BIT(21) /* known on RZ/G3L only */
>> +#define PIN_CFG_IO_VMC_I3C		BIT(22)
>>
>>   #define RZG2L_SINGLE_PIN		BIT_ULL(63)	/* Dedicated pin */
>>   #define RZG2L_VARIABLE_CFG		BIT_ULL(62)	/* Variable cfg for port pins */
>> @@ -186,6 +187,9 @@
>>   #define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
>>   #define PVDD_MASK		0x3
>>
>> +#define PVDD_I3C_1200		1	/* I3C I/O domain voltage 1.2V */
>> +#define PVDD_I3C_1800		0	/* I3C I/O domain voltage 1.8V */
>> +
>>   #define PWPR_B0WI		BIT(7)	/* Bit Write Disable */
>>   #define PWPR_PFCWE		BIT(6)	/* PFC Register Write Enable */
>>   #define PWPR_REGWE_A		BIT(6)	/* PFC and PMC Register Write Enable on RZ/V2H(P) */
>> @@ -257,6 +261,7 @@ static const struct pin_config_item renesas_rzv2h_conf_items[] = {
>>    * @oen: OEN register offset
>>    * @qspi: QSPI register offset
>>    * @other_poc: OTHER_POC register offset
>> + * @i3c_set: I3C_SET register offset
>>    */
>>   struct rzg2l_register_offsets {
>>   	u16 pwpr;
>> @@ -265,6 +270,7 @@ struct rzg2l_register_offsets {
>>   	u16 oen;
>>   	u16 qspi;
>>   	u16 other_poc;
>> +	u16 i3c_set;
> 
> 
>>   };
>>
>>   /**
>> @@ -272,6 +278,7 @@ struct rzg2l_register_offsets {
>>    * @other_poc_pvdd1833_oth_awo_poc: PVDD1833_OTH_AWO_POC mask
>>    * @other_poc_pvdd1833_oth_iso_poc: PVDD1833_OTH_ISO_POC mask
>>    * @other_poc_wdtovf_n_poc: WDTOVF_N_POC mask
>> + * @i3c_set_poc: I3C_SET_POC mask
>>    */
>>   struct rzg2l_register_masks {
>>   	union {
>> @@ -281,6 +288,11 @@ struct rzg2l_register_masks {
>>   			u8 other_poc_pvdd1833_oth_iso_poc;
>>   			u8 other_poc_wdtovf_n_poc;
>>   		};
>> +
>> +		/* RZ/G3S masks */
>> +		struct {
>> +			u8 i3c_set_poc;
> 
> How this POC is different from Ethernet, SDHI and XSPI POC?

Different bit mask and offset for I3C SET_POC compared with ETH, SDHI, XSPI.

> For consistency, can't we handle like others?
Everything is handled the same way for all functionalities in 
rzg2l_caps_to_pwr_reg() from patch 1.

Thank you,
Claudiu
