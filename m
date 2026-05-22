Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3FF32E743
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465562; cv=none; b=YF6xt8YaykyXxwilvQT+mjctgIXCtEDBifs0k7Vxp5m9ob6VOX6KehJ2lLd3//+2tsrnAhb7XK69mp2c1AQbIzXsiNN9irezpPlq5iOhvvWxF7l+UrB/Oj967EXUI7WXC7g8jNmXZKF8Sx/rTuuPeETbQ2T198JH6hYz299NMTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465562; c=relaxed/simple;
	bh=hBmMjZnlb53B9za8MFTPUQZHUnWWipbTLBXWog4O5bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=anI/0WSrtEv3AbDhnWNGTsGP/kjdx6z/bRbvryJlsIV1tfq0EwqYdz8+pVwhzq3k5rfsNx1GRfc1gWyPx8WfAXv7Y6fVHR6xfpzDzbZQ0L44tzvsBCKRWR0MYj9yil/pwaAIIWhc9MdX0r91JE61PrzKoq0sPGTyfXL27iDY8PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iccbAOg3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXJVASHI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iccbAOg3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gXJVASHI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MB60nW776932
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOEXXmnSOdpDtOzU95RtdRvQpbHdjeOuB7KTSgOtbDE=; b=iccbAOg3VhKIfFR/
	bJHBDoA2KRYGhth/sO3O53MqcvHZDovO9RNeNm6rktjUFKyb4YF4Mxqe9Y/wbEWq
	ZzfKYlW+rcrEiczsj3Ep9vkEfpvJCoggd2kWuKbHKPHiTrtljFBEJnTO29SFw3IM
	0P926k1ehNXwtkY/fhrWWbuRQ135ZJTjaxbsMWjYrUk6CtfXpskZI0aTN3cynW6v
	n2qyko7xCK3g1iykxkvm6eTMqUmxXH34SeDvYUWro707Bu/Tap2d3nMMYzFbhE2V
	9fn1JFC1SXVCIVdJaNf0tF7KYxaqu+MsHCrQWQW7fdygQwBurq8TMJeIH112Owwd
	4rSh0A==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h49s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:59:19 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7c0de780bb5so119591707b3.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779465559; x=1780070359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jOEXXmnSOdpDtOzU95RtdRvQpbHdjeOuB7KTSgOtbDE=;
        b=gXJVASHI/WTH1H9mjTwFqWfto9W6RE7v4VJRlNDGM7cd3I+x7kvZdg5AblXGUFNx9g
         LTatyOJpY308IkNOBmuuuqRsmWscqnS1ypjwa+qeL0c13dK7RSMakLAZpInAUMLll/vB
         TPAPNa5GK2glK7IjPKmj6SAB7phlufs8VAG85R4vf7skVqO2daxPy+8EZmmNGHEn+aZ2
         X9tnjYhGvXqwv9echb7jWXupIogw/iRsNYlSsB2CIQkx/+L6YyswFT48NWVT0W5inLVw
         Aek7U5y+W7ELndOq+J9CLirc/HlwIV8Cf/LLRpe2Xgoe0yKedY3RyqzZ6NPEo+gDYhvX
         6NUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779465559; x=1780070359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOEXXmnSOdpDtOzU95RtdRvQpbHdjeOuB7KTSgOtbDE=;
        b=hT+MNAC74XjADw2gSly38J0GtFpQL/t78v20wZeBZll6buVZKxvVsz4x1Clj4EM2aE
         zSqg/uW9FfIUl0VP/OfdSac8xmqDC4AXGAseMMSdlqkAbaSQXBaYtjaA+Rbe6W0hw6aC
         KGnL/hoB4cMbM7mlY1CRuD/RCxaIdIUNOrEDnjJwEk5EmS8SLuy9zNahu6jj8pkGGOiF
         aOwzSCudjOPVHt6NQ50Bb8YMH1/LQoYPjWdcMaPnD4VD5/XRo++edu/VvQ7p/2+KoD+e
         HQdpFC8htthU29bdEAyUkJ00aqXKJwQLjXOC5xHcC9tmuvLFKq1rNpGJpj+NbTuPSEqw
         V7ug==
X-Forwarded-Encrypted: i=1; AFNElJ+EGcNXoQhB7YoOcXla0kgY5umAqAJHkCGzV0iZX3KUDmLQQ4iENOfWE74HWoIEFSYdHkOG3N6w8qBu@vger.kernel.org
X-Gm-Message-State: AOJu0YwjBgOXRkSN6butmTczolwTEBOklJ2FhtXQ0ANy7EO/DgraDr2b
	EkTEpfOl99ugM3W4e0rPkNALhufKY85tvnEmeoi7pfUE2qK5kNCtGotb7ZVuvfRzeh99/9HFCDQ
	uaT5Uf76TGXQssgAioevfDu0mYiJh9umbtu2Am6On+uGPByVuueVEklkKKPxaP7Oj
X-Gm-Gg: Acq92OF1+K2laBo1CjHM2effeD25E8DKtd1kNCzM6uRQc3vn31jEBwHb2VfqYovlCUY
	JHNELvjFWOFZ/Iu7wPdkQvvg4nwye838fi4xjrj7oyHCyhQQrr6PTXilfpkBaGWDse3wjsVdMHN
	usR2ABAtcVfhot0xYlBnABT10uL5gzGDOBnowYEBkIeP1TyqfoJnCptk+t1nNtD0VYxASY9TDCn
	yWTQUj0kE/AawP161uWTVIkLiNWhYqLuQyLLzcbF31laWnV5zu4LMuzKZIXbMb3LJwPRiMUtAxD
	94yXW0Xg6CY0NjhjLHiiCJxzaWN+7savq3n6kb6xKZlRCem6psYWx6PCdXml4eZoqlV3We6Mqdm
	oZcsptM6vG8YVcFmDVSvQN8XLf67z7dWgPYo0nf5WWzK5MkcjldxY8J3+uP74NTNU93SLillVeS
	tpVfe4mappow==
X-Received: by 2002:a05:690c:25c9:b0:7ba:f690:70be with SMTP id 00721157ae682-7d337fa0bdfmr51043397b3.7.1779465558794;
        Fri, 22 May 2026 08:59:18 -0700 (PDT)
X-Received: by 2002:a05:690c:25c9:b0:7ba:f690:70be with SMTP id 00721157ae682-7d337fa0bdfmr51042897b3.7.1779465558265;
        Fri, 22 May 2026 08:59:18 -0700 (PDT)
Received: from [192.168.101.236] (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38c33c8basm9973097b3.37.2026.05.22.08.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:59:17 -0700 (PDT)
Message-ID: <8a6af223-901e-4d1a-ab3f-7e20980cb683@oss.qualcomm.com>
Date: Fri, 22 May 2026 08:59:15 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] phy: qcom: qmp-combo: skip USB power_off/exit
 after device teardown
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        laurentiu.tudor1@dell.com, alex.vinarskis@gmail.com,
        linux-kernel@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-2-mike.scott@oss.qualcomm.com>
 <d543fe6c-88a3-40b8-a83a-ccc6fa80eee3@linaro.org>
Content-Language: en-US
From: Michael Scott <mike.scott@oss.qualcomm.com>
In-Reply-To: <d543fe6c-88a3-40b8-a83a-ccc6fa80eee3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ko-ezp544S5o1We4HxXD8L_-NEH96meP
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a107d57 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FPRIOUAp8Z76FSPQ8zIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: Ko-ezp544S5o1We4HxXD8L_-NEH96meP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE1OCBTYWx0ZWRfX86lZrOGQHtHH
 oO8iuFRW/lztX3CpIg6quIZfFHPHDzEHJV0iULYuRYAS/MKFFo6zDi95a06olVHIlf4pUonXpA6
 NXlc9n1OsyoPHBTk5EAy1mURQh95m/4HyQDsVfttyIU5lzbZp2UL0fH0QxCes29J3mmhagTLUcP
 8N/g9Ot3FxFMmfYOTScem8O3qvCrCkXoUwxjNauLi2JIhu4X7IMq5ARYgU0kcq4TTNnJmh/zv3D
 piqshe6SPzVgfZrSuH5Di0KP3HeRcqV/Yy/W+iNS2FdT0PbtAbtTptOcNB8Dau6QEbXzmwmi+/f
 XN3uj4xCsmxerre7FlEcxIjKSNXineAdCGXZOaQI/fNNSgT2MPa0yyx3TxHLUKJWye9G1ixAlbX
 gGKsG2KBGfOQMs/SM0atRL99W6OpdVgceGyD7yUwRxuciFozB8JM6lzYi+W0+nH5xx1Yv3e3wKo
 0mGT0UJ2w3zw1cga7gA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220158

On 5/21/26 4:58 AM, Bryan O'Donoghue wrote:
> On 21/05/2026 02:09, Michael Scott wrote:
>> qmp_combo_usb_power_off() is reachable from an external consumer
>> (notably dwc3 via phy_exit() during driver unbind) after this device's
>> backing resources have already been released along a separate teardown
>> chain. The dereference of qmp->pcs (whose ioremap mapping has been
>> freed by devm cleanup) then takes a level-3 translation fault and
>> oopses.
>>
>> Easily reproducible during testing of USB-C role-switch enablement on
>> Dell Latitude 7455 (X1E80100), by writing "none" to a USB-C DWC3's
>> usb_role_switch role attribute, e.g.
>>
>>    echo none > /sys/class/usb_role/a800000.usb-role-switch/role
>>
>> which triggers the chain:
>>
>>    Unable to handle kernel paging request at virtual address 
>> ffff8000876c5400
>>    pc : qmp_combo_usb_power_off.isra.0+0x58/0x470 [phy_qcom_qmp_combo]
>>    Call trace:
>>      qmp_combo_usb_power_off+0x58/0x470 [phy_qcom_qmp_combo]
>>      qmp_combo_usb_exit+0x38/0x90 [phy_qcom_qmp_combo]
>>      phy_exit
>>      dwc3_phy_exit [dwc3]
>>      dwc3_core_remove [dwc3]
>>      dwc3_remove [dwc3]
>>      platform_remove
>>      device_release_driver_internal
>>      device_driver_detach
>>      unbind_store
>>      sysfs_kf_write
>>      vfs_write
>>      ksys_write
>>      __arm64_sys_write
>>      el0_svc
>>
>> Two WARNs precede the oops from the same teardown chain, confirming
>> the resource ordering:
>>
>>    WARNING: drivers/clk/clk.c:4494 at 
>> clk_nodrv_disable_unprepare+0x8/0x18
>>    WARNING: drivers/regulator/core.c:2657 at _regulator_put+0x84/0x98
>>
>> i.e. the pipe clock provider has been unregistered and the regulators
>> released before qmp_combo_usb_power_off() runs.
>>
>> The proper long-term fix is a teardown-ordering rework so the QMP
>> PHY's backing resources outlive any consumer that may still call its
>> phy_ops. Pending that, guard the power_off/exit paths with the
>> existing usb_init_count balance so re-entry after teardown does not
>> oops. usb_init_count tracks the balance of usb_power_on/off; if it
>> is zero we have either never powered on or have already powered off,
>> and there is nothing to do.
>>
>> The same guard is added to qmp_combo_usb_exit() since it is the entry
>> point used by external consumers via phy_exit().
>>
>> Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
>
> Something like this requires a Fixes: tag
Thanks!  Noted.
>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c 
>> b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> index cdcfad2e86b1..0db200292642 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> @@ -3926,6 +3926,17 @@ static int qmp_combo_usb_power_off(struct phy 
>> *phy)
>>       struct qmp_combo *qmp = phy_get_drvdata(phy);
>>       const struct qmp_phy_cfg *cfg = qmp->cfg;
>>   +    /*
>> +     * Reachable as ->exit from external consumers (notably dwc3) after
>> +     * this device's backing resources have already been released along
>> +     * a teardown chain. Refuse to touch registers in that case.
>> +     */
>> +    if (!qmp->usb_init_count) {
>> +        dev_dbg(qmp->dev, "%s: PHY not powered on, skipping\n",
>> +            __func__);
>> +        return 0;
>> +    }
>> +
>>       /* PHY reset */
>>       qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>>   @@ -3968,6 +3979,17 @@ static int qmp_combo_usb_exit(struct phy *phy)
>>       struct qmp_combo *qmp = phy_get_drvdata(phy);
>>       int ret;
>>   +    /*
>> +     * See qmp_combo_usb_power_off(): an external consumer may call
>> +     * phy_exit() after the QMP device's resources have been torn
>> +     * down. usb_init_count tracks usb_init/usb_exit balance.
>> +     */
>> +    if (!qmp->usb_init_count) {
>> +        dev_dbg(qmp->dev, "%s: PHY not initialised, skipping\n",
>> +            __func__);
>> +        return 0;
>> +    }
>> +
>>       mutex_lock(&qmp->phy_mutex);
>>       ret = qmp_combo_usb_power_off(phy);
>
> This can't be right - you check usb_init_count before the mutex and 
> then again inside the mutex @ qmp_combo_usb_power_off();
>
> It seems like an error to even get to this function with 
> !usb_init_count also check if that is a signed or an unsigned value as 
> usb_init_count = -1 will evaluate true.

Yep, there are a few issues with this patch (and this looks like an 
extra check I accidentally left in).  I'm dropping this from the 
patchset and I'll revisit at a later date.

Apologies for the noise.

>
>>       if (ret)
>> -- 
>> 2.53.0
>>
>
