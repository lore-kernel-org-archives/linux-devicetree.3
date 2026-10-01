Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B2B479882
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 18:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878181; cv=none; b=FLRdS6dtgIL+WrQasiUc/CmCnX7h+rh2gbHLDM9nQLR0RWMhseXGRaqVWT/zRAbgCbxn2uGZEDE2vwfGXnr5T11G3d7osceyDiVQInnC1Nplb4n9XU7D7LA/Z2rw8BZ3zGwblpWpMA53XSE3YeHi/BDF6qvzhEnAzxDfoMkHRiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878181; c=relaxed/simple;
	bh=OGVMUSNiTzwBKMN0PU0Km5dKvk9yGtdNENEkqzcnGYA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Jvp4UFHJc52UFOCailGj+dL7FEcrgFcB3nmcrSab/rh4lixKtjcFpzLw0+LDAFTgv55iCvlSrBALrinnLWFjneuhRC4GqZa8Lxxk20x41a2EkolKE6hOP9E9y4cTP+zz7n7t4aFjzoWEGvUq6kmOnui2AgYpLqCU3lP/paImdNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKdRi2yu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eLSJZ2/F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKdRi2yu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eLSJZ2/F"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691HV2Dg2354011
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 18:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V9uXDb4OI7XH/Jm42mjZ9uKZxzZj3a/tu0y6m6HKjOE=; b=lKdRi2yuep1oHCGO
	Rg5+jkSakdSc4JS9gjY2OsNjvS7HlidXFaWLQOR9MLQC0FqG0b9LfsNTtGJJqrwi
	xPU9QJPYizmAIbdV/zASeRBsVuHQ1vLGRJCgiJnZowDWpxA56XvA+dr19PgfXClc
	Bc1ElCzn4eOga4BBMgbikr/wD4Lp15IAs7d873NX6YiSOQyp6HAY8BfWbCw0c987
	AN77QIuv2KBR27A6jPDGlusASz2MEun7RxVzGrqYuVxq42pPcTsrsMHd1byWnmWl
	YqoYo5GDYVNVbKcCKtu84WtawT5yNncW9KWq0MiOK5dNgFG4eRGJ0iqd0QpSwtDh
	ZYKaHw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v03072c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 18:09:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34afa104860so4441027eec.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 11:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790878174; x=1791482974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V9uXDb4OI7XH/Jm42mjZ9uKZxzZj3a/tu0y6m6HKjOE=;
        b=eLSJZ2/FtBIoHB9FKDcii5yI7VofYO2BE0JxWQg3Pl3blVp99t9Dl6bfNN3Kra9NVA
         Ozynr2czl/4hxZaaq7z5sgF9cugEttDxc3aiyhCwJNsajRxUwVXYvMSlQiWYG3A5Gq76
         Wnpo/M1wBNyPBH1b7tIK5IPBcslLbFNeDsHOXYLZE/gPPjNF7LxrGPsc/iIrUXpku6Dm
         eiaqubHzpyfGaTyesU68jge1jUQMIXD+T4OBx6YH0lLXxAzWy6oT9wnOwmQGjYjSlRSK
         0cWiOW7WgtDOYiWEV+mT/kVGU9M6w8dG3P8nVfDMJ5Uw5i6jks2dFczhoPiJbD4w9LYI
         WL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790878174; x=1791482974;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V9uXDb4OI7XH/Jm42mjZ9uKZxzZj3a/tu0y6m6HKjOE=;
        b=sOsJ+nnAnmEuOLMIp9n9nDv5Eb5Tb0WPa0hQg8Ifz06VmMLXJt0utULqhJnK68aj4q
         NJARBOWAWabs6o1WKW8db4vSpux3mbWWNUezyKseEWzwH1mFqY8IayOarUpuw68l56b7
         pSd40v4vVKSzrndo5anYcjYKzRy7hXs6OTMBPeN+X7iDSzSCMKqrYODprRZ+gExR2L8a
         KRd43Og9nPUFN6DsFEYTzYtLT1tW3XZBUgaqWRxoUeiJSqm/XpGlDa4vBGvYSLCk87/M
         FBy5JRaJrsfcCPX4klzfzfc7OT53KeR1j+R5ASa33DYIiPlphFjtwQeOxA3by2Mzwdbn
         LiOw==
X-Forwarded-Encrypted: i=1; AKwUvBwlZ4tibSp8dD9MbvK5v/PyhKeAmcigFYoPPT0VPnxsfoEU6NIpVsN97hufP6+PUOIoypGqDFbzy6cn@vger.kernel.org
X-Gm-Message-State: AFq9FYK0Uom0P5vNeIi7yjy6XPA+dLOZim0HWZ/0D5czhcHyGrRFoqjI
	K3iD2MAP4hfLnQpBv/f96D+wAGjgxW4wq/Wkmezg3NU+N6HRSzmW+EL5dNtOV6WrTP9C7T85AQr
	IzZ4F2GfiylpZUIGtMamY2x5C5mFEsfbqebb7UuU+dOT4XAkiwNKk9Fnj8qGLHBrL
X-Gm-Gg: AYBFou3upEfMJZX7JntVx1Ijz/33IjD8oSxUwZ9F4DGb2AklyTg1w2odfswJNPfgtn6
	FP5yJJ4TVWdafuiQzvoazntuO+AEIqcRNbf4XKOdW0uIAqAiWU4d1/xzvI0pYmQnSoYYXuy8K8I
	EDNzWF9hxSBwyWVvrf5vhKjpw387it3hbR8m/RLDZaD+gwTdLzWlyzLGdEw94lWQ9e18V18BKIz
	Vxxd7lgKxRF2k7xo4iuF5eA/d7FnwLQPNpaBzHg/2GCEHvQGQoaWZ0triKdAgy/I6pv7aC6mLlw
	98at4K457csRMg2SxIEiIUIra9qIoPf10mFE43NGHIbkXCjEiw8n8d0LzFZkVZgzgHvUmZe2U11
	mKuEX6xCAdBTz2mAwgBYIR/LPaF0=
X-Received: by 2002:a05:7300:dd0c:b0:34c:d018:f33f with SMTP id 5a478bee46e88-34f150aba7amr51791eec.16.1790878174040;
        Thu, 01 Oct 2026 11:09:34 -0700 (PDT)
X-Received: by 2002:a05:7300:dd0c:b0:34c:d018:f33f with SMTP id 5a478bee46e88-34f150aba7amr51739eec.16.1790878173117;
        Thu, 01 Oct 2026 11:09:33 -0700 (PDT)
Received: from [192.168.1.2] ([122.177.247.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f308fdsm107784eec.8.2026.10.01.11.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 11:09:32 -0700 (PDT)
Message-ID: <1cd249d8-0a26-45e4-8263-dd4a120fc89e@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 23:39:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add optional wled-supply
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        devicetree@vger.kernel.org, rajeevny@qti.qualcomm.com
References: <20260929-wled-supply-series-v1-0-75d0a83b4b00@oss.qualcomm.com>
 <20260929-wled-supply-series-v1-1-75d0a83b4b00@oss.qualcomm.com>
 <20261001-private-wooden-chachalaca-51aa57@quoll>
 <997cefa0-384c-466f-b318-077939946768@kernel.org>
 <cebrka4ya7u32ntiya42yx4txa3uryf5k2di234zm4enz3a6vy@xhily6qqmevo>
Content-Language: en-US
In-Reply-To: <cebrka4ya7u32ntiya42yx4txa3uryf5k2di234zm4enz3a6vy@xhily6qqmevo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA3MiBTYWx0ZWRfX86MfgwdzX5ll
 QuQhwn810XPuXD11VbhLME7IkH3QcemiYFVHNzYFUCyp6zDzXGS7NQ4cY9giJBOxd66CwtjZdLe
 YfCYqp0xK2kuVT2oTsyB8CeJw8eVWxQ=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abea1df cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=wK/bf7D/7SIwH/zgYCzwZw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7E6vT_6_9trQ-LPmnsAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 9RYbUcLwUlBzkJDfbLXzuSqPHXYa2nLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA3MiBTYWx0ZWRfXzv52WGtD1/3b
 YtHWQf1LmHz/ZE53VaVE8saYOtO3q84NbRH3lfXZKg9YO1IQiK6xvoz9o3XgMbiJcnvYmhnd3Bt
 WaMojW+NImtauWrlrKkSyRrcpdUETMJ50fPM/Urh1GrdKvBiZ0p53SCb95KXewYrJfHnAX0QItv
 OsGI+LIAht7O6ThEGxW5uLhZkz1ifZyk/BI+mhXnqtuhyV29TiyaeKyZ629b26iBRm6DT+BdFvC
 SOpkd0QYQcdtVObbDJLVUxF4ZRV5HggAcWEhnfCewTmtxGSqR3caNaq0Mg5BaSDhRePBbBFcEMS
 LXibrwOEPvd8L+1qfuLW/6Q1R2YCDNO9OzxvGhVBP5k+tn24SOMKJxwAi8bje5iGNV8OOJJsllc
 8E/RExo8cjmPZYuSFOCLU+bl7qK6N5o+8w+VcGyP03VMlvhz7vBqN57J/lZ+ydZhsxbAD3KgbDW
 ELCn+VIlmui3sAFoMhw==
X-Proofpoint-ORIG-GUID: 9RYbUcLwUlBzkJDfbLXzuSqPHXYa2nLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010072



On 10/1/2026 3:25 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 01, 2026 at 08:57:52AM +0200, Krzysztof Kozlowski wrote:
>> On 01/10/2026 08:55, Krzysztof Kozlowski wrote:
>>> On Tue, Sep 29, 2026 at 06:42:20PM +0530, Arpit Saini wrote:
>>>> Some boards drive the ILI7807S panel's backlight from an external
>>>> WLED driver whose enable input is wired to a GPIO, typically modeled
>>>> as a fixed regulator (e.g. vreg_wled).
>>>
>>> You describe something else. What's fixed regulator should not matter
>>> here. Which pin is it in ILI7807S?
>>>
>>> It seems you just want to represent GPIO with a regulator. This is just
>>> confusing and typical downstream workaround.
>>
>> What's more, you basically REVERT the review YOU RECEIVED in v1. Really,
>> just sneak the same stuff 3 months after like the review never happened.
>>
>> NAK
> 
> After discussing this offline with Krzysztof. It's not a supply (my
> fault), it's an LCD driver. So, the best way to handle your displaycard
> seems to add a gpio-backlight, reference it from the panel and then in
> the driver check for the backlight's max_brightness level. If it's 1,
> then you have to send extra DCS commands to control PWM. If it's
> higher, use normal backlight class controls.
> 

Hi Dmitry, Krzysztof 

I have a few clarifying questions regarding the proposed approach. Please let me know if I've misunderstood anything.
 
  panel_backlight: backlight {
      compatible = "gpio-backlight";
      gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
      default-on;
  };

1) Adding gpio-backlight and check for max_brightness level if its 1,

   If we model LCD_BKLT_EN using gpio-backlight, the backlight device effectively exposes only on/off control (max_brightness = 1), 
   we can't support the full range of brightness i.e 0 to 16383 (0x3FFF) 

2) Adding gpio-backlight and based upon max_brightness level of 1 , are you suggesting to register another 
   backlight device that can actually drive DCS brightness. In that case we can actually have the MIPI DCS controlled brightness 

   If so, wouldn't that result in two backlight devices associated with the same panel:

    gpio-backlight device for enable/disable
    panel backlight device for DCS brightness control
 
   Is that the expected design?

3) I previously tried modeling LCD_BKLT_EN using pinctrl states (panel_bl_en / panel_bl_suspend) 
   for the enable GPIO itself. However, Dmitry suggested modeling it as a regulator instead:

   Link : https://lore.kernel.org/all/qkhgg5x67sijiialucvzac275zhpjrtt47a4udjpyzmgvilut5@dcrslq3ai7mc/

4) Modeled optional regulator wled-supply: a regulator that only gates the external backlight driver chip's power/enable, 
   with DCS remaining the sole brightness path in this current patch , the panel-himax-hx83121a.c does exactly the same.
   
   Would this can be the preferred modeling for such panels?

Please refer to this Hardware diagram I explained earlier , 
Link : https://lore.kernel.org/all/bade420c-aeb8-4bdd-b0cf-3ade17b21c18@oss.qualcomm.com/


Please let me know your suggestions.

Thanks,
Arpit


   

  


