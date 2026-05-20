Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026F53DB310
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280874; cv=none; b=kUxtMgjbqDblqKElBKBlJ+y6QxnvfNh4Cn8qOVD586Pr93TS2CRFuoRVmEv5lG0/06xH0BNs0AIDMlGCPvAWzOd7qVuWXND1Rkn6vPg+atEAX6FtjnwFBA2Hwr7v6I3y10zK8Kz3MFRPJqknirPbZXjQelei9ea8UEpDWKMnS6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280874; c=relaxed/simple;
	bh=WKswCxoOQ8jRILBr741XFfschLIhFZABWS7WRA9WPA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTfZvb05GoVpmv6KpWhlCkN+NfL5QnYT5uOgc9I08UvUGc+ar8A0/G5U4CTz5rAljJePjzDhb+ZSmD8GWe59xnKLyPgzMWKusofwAyMgYJ10N7aHYuNzvVObpVzM5Jim+V3jg34/e3DP1ozX1PhWdFWzlFn6gaL2/TEqy927wew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xf1JjL31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqs39/CJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xf1JjL31";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqs39/CJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7KUij1725720
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LwsVm+YOh5jnyc4/SA6T4mh8Ap3/phALbTKY3f+nmlg=; b=Xf1JjL31MWue/lap
	J3Ws9trMgWZt8XbPO78iNZlRqn26iOEER487KxS7KsamPJydejXjubIlKlZiPyj5
	d6NnTouIhl6dqnjJvpfhzyZ8Bi7YKEdMzq0DGRahBXKs/P/voFpazjMzKP53enGX
	a9F7MVs8jQ5jIAH24T1u97eqWQ9JjEFdD5xmondmAs4b9Ye4iYajUL2KG3RU03IP
	f4Na1mFim2YJPTgGAVwlcil36Kw7xqx27Py6sGKvjYYAlyqjl9bH0YuytO6aeIVv
	ioOdnXx43qvfl9liAQJWlSQWJL6iquvj4VjjZlJE+zyLbPSfgSutCzdSUyQ3oLhX
	ju0daw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qmrgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:41:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso9417595a91.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 05:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779280870; x=1779885670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LwsVm+YOh5jnyc4/SA6T4mh8Ap3/phALbTKY3f+nmlg=;
        b=iqs39/CJV6//JKz0lQQ0jMNzt4cL8b6MHGrPjw5NwurZT+VRqHeoJPvoQgExyk7JRX
         XrywINsfflWNMG9vUEEPFORSmF5HDlEktNYb1G8tblm0xaC+X7gNFkWgxm2cClUcFFRE
         CKK/BNgZ4/7urjYy+4iOoWhhkAsE0zvu4tgVjBC+d2dt94KkYUgaN6wDfZHk2SxnlXS4
         u8sAIZiqYD88q/eCXlnqZMsW/RVMyowhGTgNGISx94oXrIZWEBhms8qfim55JlA59r5b
         MHXNCTdMjZ4t1M0C46jrVty45DOj0fOuWaGRbfccSma/BMdY4HUD4EsN0k2xuH5KcdnY
         +2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280870; x=1779885670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwsVm+YOh5jnyc4/SA6T4mh8Ap3/phALbTKY3f+nmlg=;
        b=DWNg7x2LbE4GxPD5EgqiM8thm476kN5PB+h5x2ZNcKY5Jyg6/+5ZtIUfcFU/XHsNEw
         CTYHXsSZkPgX1UAh8XhIENZQl5rr3rgqMNaORqX+KLm+eUZpp1YbGrg1XjPWadOTbhrE
         mZdi4NVMX4+9R8+fGMRLW9JsXZLYl2X3OEkUkFZz0HsfR2JfhsIdiHfBgU5JNOIhJXqP
         K4KBbDofcLis3Voc/NWA+6O/8w9xBpPwxIv3yHzMVvzqo/kPBFIiXcSoMKzHd4XGSiPF
         D+Vrh3Z2LpALapbDvigWLAVrWUjYqgdiTYHkaXmJdRo2ZM7z2zRNYvU+hBeSvaiaPDGo
         rDAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SUcaU9qAMpTnf/vlhwlGBvEgOq6ugrim+WuIChMpbHcjh3i2NyN6OPvIOmUVWJAxjFhTcZyMmOU+d@vger.kernel.org
X-Gm-Message-State: AOJu0YyUyzMimjaSf5rXyLib5IkQ6/JjdoJa3t+33J8/EDplfDWMWQ65
	ndwu/DJ4a2z1gh0iCWplzhr94Vg7qBMYokvLc6wuyDuW1h/hTMy5F+f962icKn7SOCT9V7h+8iX
	A7s7eC+sQ3iMAC1PtjK/ccasnpKfhMIu9sc6uyL2qyE/amK0moZqbEb9dQNhDZdE6
X-Gm-Gg: Acq92OED/u+II70uAhdEuBKrAC7l2ebosHtZAME5ReXORPbIg6HYE5IJSrmVh+fML9Q
	mK15MqHKbdeSrB0VOR9K5XTijjd9rhCrplgSvAmE6z1si+Mv/Dt0ncEq277Z8pWcDsir9fbqtTH
	P29QHU1+rDMytqJKJsKDepqcHAieq0Dz7FjrwaT+Vfjy2V16TkYuG//RxbKoO+pInQ5QJzoQCrB
	4XxCPRz5HQV1zu82euWvRIZapdbnDSYJZyze8d/BtbVZJ9TwQ27bmIlbbc/cbDnmix901Q+7+Ta
	b8zQSzYRF5DshOLcmoeSKA3MVavEqbR9l0ibCt8cTY1e0yqLfZsrgXz81J24A7ceYXXXmMIp21i
	RcC2RCtFgArBmgoxWHt0ltMLNLIt1aqlr+YBVGCWWhAwW1AiVWUs=
X-Received: by 2002:a17:90a:51e6:b0:369:932a:2b6d with SMTP id 98e67ed59e1d1-369932a2fa4mr10930278a91.6.1779280870563;
        Wed, 20 May 2026 05:41:10 -0700 (PDT)
X-Received: by 2002:a17:90a:51e6:b0:369:932a:2b6d with SMTP id 98e67ed59e1d1-369932a2fa4mr10930248a91.6.1779280869950;
        Wed, 20 May 2026 05:41:09 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36968dae27bsm15522213a91.1.2026.05.20.05.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 05:41:09 -0700 (PDT)
Message-ID: <dd065ccd-d7cb-45b5-8733-64b4f6571b3d@oss.qualcomm.com>
Date: Wed, 20 May 2026 18:10:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
To: Krzysztof Kozlowski <krzk@kernel.org>, dmitry.baryshkov@oss.qualcomm.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        rajeevny@qti.qualcomm.com
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
 <20260519-curly-courageous-sturgeon-2facfe@quoll>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <20260519-curly-courageous-sturgeon-2facfe@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMiBTYWx0ZWRfX2U6J66sOmiPW
 Tu0aERhEeb7Rl4MGLXb5vTOIFh09rkAvWve+panvPGbsVGmYruYf0vWWoxqj4TO+R7JIvFsUdmA
 a91nSNlmGVe0R/c5XDrICwk+HADcMGdIk4aekTyW6YcJRwQYsS2FGPnswROnmkHUatFBGcgrm05
 DF494jo26m1SlZusWMF1rgZfYalePcEFLkqyOl11+PHj7ZCH60Z9PC59LNg8ghbMGnO5xCj8sIh
 TxXrc3k9MCtOPpCE0C2G79RYS3PhqPeihKdD8DB4uGU6a+ilBqtXsf3pzG/UZjeqlX+06uRcKUD
 uPsLrp/aDmMqTkDvlbPUwe0KaYoqyfJRQL3JBWFVvAMNwL8Awh8SCD2j9xZWH/YnM+T6pcvOXBh
 0gODVGvTEDA0Nk9+cj17FPniEddXcalCJ9RNqVkg8YvQJdgh1YORRfzPnpofZNJgpg+EWhwgqZd
 L5+xOe8n22s16A7hQsQ==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0dabe7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=ERuXJlKj0EQyFFk6GMsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: obGqud2UnpddF3Kefk193WP18CJFh2-n
X-Proofpoint-ORIG-GUID: obGqud2UnpddF3Kefk193WP18CJFh2-n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200122

Hi Krzysztof , Dmitry

On 5/19/2026 4:02 PM, Krzysztof Kozlowski wrote:
> On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
>> ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
>> The DLC DLC0697 1080x1920 LCD panel is based on this controller.
>>
>> The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
> 
> If panel requires it, so should the binding.
> 
Ack, I will update.
> ...
> 
>> +  reg:
>> +    maxItems: 1
>> +    description: DSI virtual channel
>> +
>> +  reset-gpios: true
>> +
>> +  backlight-en-gpios:
>> +    description: Backlight enable GPIO (active high)
> 
> What is the name of the pin in ili7807s device?
> 
Display daughter card has WLED driver as well as LCD bias driver.

The WLED driver's Enable is coming from WLED_P1_EN and PWM is coming 
from LCD_CABC output of the panel.

DISPLAY0_BACKLIGHT_ENABLE (GPIO 91) of ITP baseband card ==> WLED_P1_EN 
of Display Daughter Card (DC)

In the display daughter card of Shikra ITP platform, we are not using 
the external PWM for WLED driver. But connected the CABC output of the 
panel to the WLED driver. Backlight update is happening using MIPI DCS 
command which is driving the CABC output (i.e., PWM for WLED).

Because of above HW configuration, we need to enable the MIPI DCS 
brightness update on this panel. The below command of 
dlc0697_init_sequence() is enabling this.
mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x53, 0x24);


After checking this, I realized that this panel can be used without the 
DCS backlight as well when it's using PWM based backlight control.

I can add `has_dcs_backlight`  in panel_desc and set it true for 
dlc0697. I will update bindings and add backlight as optional property.

Currently "backlight-en" as optional. I will fix the commit text as 
Krzysztof pointed out and update the commit text to get add more clarity.

please let me know if you have any comments.
>> +
>> +  vddi-supply:
>> +    description: I/O voltage supply (1.8V)
>> +
>> +  avdd-supply:
>> +    description: Positive LCD bias supply (AVDD), typically +5.5V
>> +      (range 4.5V to 6.3V)
>> +
>> +  avee-supply:
>> +    description: Negative LCD bias supply (AVEE), typically -5.5V
>> +      (range -6.3V to -4.5V)
>> +
>> +  port: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reset-gpios
>> +  - vddi-supply
>> +  - avdd-supply
>> +  - avee-supply
>> +  - port
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    dsi {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        panel@0 {
>> +            compatible = "dlc,dlc0697", "ilitek,ili7807s";
>> +            reg = <0>;
>> +
>> +            reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
>> +            backlight-en-gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>> +
>> +            vddi-supply = <&pm4125_l15>;
>> +            avdd-supply = <&avdd>;
>> +            avee-supply = <&avee>;
>> +
>> +            port {
>> +                panel_in: endpoint {
>> +                    remote-endpoint = <&dsi0_out>;
>> +                };
>> +            };
>> +        };
>> +    };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 26060e51c067..529aed669401 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7941,6 +7941,13 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
>>   F:	drivers/gpu/drm/bridge/chipone-icn6211.c
>>   
>> +DRM DRIVER FOR ILITEK ILI7807S DSI PANEL
>> +M:	Arpit Saini <arpit.saini@oss.qualcomm.com>
>> +S:	Maintained
>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> 
> Drop, unless you handle patches for this driver.
Ack, I will update.
> 
>> +F:	Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
>> +F:	drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
> 
> Drop, no such file at this point.
Ack, I will update.
> 
> Best regards,
> Krzysztof
> 

