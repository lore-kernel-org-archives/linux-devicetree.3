Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162EF49C4D1
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162774; cv=none; b=cAlWmc0anUIGhrm7H10Jk76Lv9OHM9zuZNEd3d6cGqJx3cbgrHtO+Ct1TeGm8FY5ssxccpTXIxi8Y9+WMaqrOzIDlDjPwCBVv5S2mosTYVhr9yWBjvMMv5Bn0/7q4EAIU19F1z9LcJwtUVkGBSgEcMBGRVLgNu6a0AZH1/bbMUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162774; c=relaxed/simple;
	bh=1MCzPuhkOUx0yiCuhAWhyHvppbKmv7dz62NnFmmX68o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COX5ghRlhTDY4z5RMKvlui5WGdtnV318dKAllnfYVfpc0aZZ8Pr2VVLV730tt1TneOYoc8g+oo8/KsRo/aCPo4SbA16QGBWrgwKh2jcuf7tZhprLBTegVSoBCgwYVySKS095e+vyZEF1w9VwuwH/P4zkAF8KKfio3nKWjoi8mfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HptVv/Mm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/jbzqCR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HptVv/Mm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/jbzqCR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3gCQ1623761
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=; b=HptVv/MmzLlyy6aW
	SWMDsOq9FeecDMFcKgSUvkiXmdZx3LxUnhHOgkV9PLObA5OD5u7aoJc8DrK3qCGp
	1PZd2HLhj9W9950/cYWWaeekldN5+7tV/xRqyNHSVxa07Vcrxs5tCeXwty1fI8MM
	qBb+olSYXpK6Rm6Dh3qfs5mPrDJbNSZbKWSP4MTcDZ27d62mNpOHfUOhf3zEBFSy
	suqaTrw712vgO8ruwiI7BKyRR3PCCpdx4Xt1GwT0tquW9SGBxZH8ikKg8Py8yhD/
	2AGNTLQ2HwcMCnicaq7njhTS9g8R26O5h5z7Y9hoDUEQ7+/9tNtDiJU7bYt9ExS/
	HFBYaA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma3mf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:26:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33bee712354so985730eec.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162761; x=1790767561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=;
        b=O/jbzqCReHpnfiHgSP3671AQDPQRfbW9pji8r4BdWszkKpH3dWbyjH/eXZkthtuTaw
         FS+XVJqhs2b3CIx13+FAmdBEqSlYBQYwJcFXjCWrxJg40S+/tfbJkukyj5TQUBLLDSHO
         Qufd9FWN9IL1q4qufW92IOxq82l+JaNM/JPJwQn06mvaV8GjczQ7EOmu3R56cNj163NO
         RevRBZ2wsQ6zgRCIaJ4yWymB6mNnaw5Vgk4c/uKJXWZ4vrRpANFUALTM9C9mD+tCGlpp
         eO0Rxy9fsGrPlGWa3k/svHdFqbL8xaVsPqNP1Tqo21XI8XHJdCBJ0cEbD1gQUom12gX/
         AFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162761; x=1790767561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqrKcvddEjNxdraXN5+nL8C9yc6R7w3YPVbh4Z3k6lY=;
        b=P1bzKWteQEpC8p+c4IQJWfmMC1KIvYCN/x1BthKY2ktFpXJn6iNW0FItl3L7J1icQ1
         e7OOYYaDP3w1Q9nllFMPpaxCWyxnghHAyXO5dg++YVcZPLEctZmhA5/CkNI7/o6x19Tp
         tKEcsa7Eszlx0yU5+Gw6/GtXugVkEcj375/j5C+69GAcLE328yWxqQdsLky+6Kv35oej
         oaiaoq3zd21OFYKAYQlFU604Zt2D/v57rAW1dnAxzrHVmqEsqEjaR7EqFX95fDOViy7d
         7CLdITo/uSahqubdX1ax/bCfG+3HCgXO1OJhOBHf07M/vdA5Mj+7w8ykwqLMFc8F9o3O
         hvMA==
X-Forwarded-Encrypted: i=1; AKwUvByAVKgTrLicDPFUYWT1rpxighnytGY1TpO8SPAP6g9ZHMmZ8zvQkSbPouUC9/vB0Cmmkpjub7++HUae@vger.kernel.org
X-Gm-Message-State: AFuF++lnN2X339szZSq463QkgwuZ43K7H8rBTSJNcF2kJW6e/XPnB7H5
	ChcEd0fZPEMV3SSyQIpDO0ufDiFoLITC6Vapz0kY2q2ss+/wUZpkJS3ihyvVQpgpnzztULwXEIt
	/DbytPYzMwkifXhmxpQwY5Kylj87s3Z9H6JqGMAm9QRVELy5XJSTH/4S9p0zDDWOG
X-Gm-Gg: AYBFou2eZyatsKW3LXr444OFNCQU4xlzjdxLwDrbV45faTQD6IkI3cFJM+E0YnLEjoB
	oxlibTHv5hNwnwWyTGSmQBxnvDBL9L27kcPgBYy8GU3V1iF0u91izQilHSBWUTKc3wRn3RR6meA
	TZ6yijzORzwcw/1GrKYBLKcyK0uWjfjNOERsCOeKFvcwYq+TIPfbixHTZvdckyvaFbpuPB6vnn4
	48OrIe72kgxeupaPLqkrbuPfMoVK4TtpOP71ZVftfU0GRug5zbRMLXDeHnib3CMGG3w2liKyaG5
	hfSMR8MqdmdQQqL/BCT6h78SC8u1anCTfMml+xfvxbDicE4qGZkzN1SM2SSXbwtaCV3xMz6rgpG
	NX0tBca/A6pvKfQhxP4Wa6/ylBAwPJhc=
X-Received: by 2002:a05:7022:282:20b0:144:eab0:9cbc with SMTP id a92af1059eb24-144f9170182mr2757118c88.37.1790162761175;
        Wed, 23 Sep 2026 04:26:01 -0700 (PDT)
X-Received: by 2002:a05:7022:282:20b0:144:eab0:9cbc with SMTP id a92af1059eb24-144f9170182mr2757074c88.37.1790162760586;
        Wed, 23 Sep 2026 04:26:00 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9877462sm5682402c88.10.2026.09.23.04.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:26:00 -0700 (PDT)
Message-ID: <c132d8a6-f845-44bd-b0c9-33b5a99f9759@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:55:46 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 04/10] firmware: psci: Add support for PSCI auxiliary
 devices
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
 <CAPx+jO_tDttD8+XpRjG6E+XyQa=-_v-Gr=2Unc+6OSBJ2P7Oqw@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAPx+jO_tDttD8+XpRjG6E+XyQa=-_v-Gr=2Unc+6OSBJ2P7Oqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rOW5c4mbE1GkxOsM00PG3duvsyFaqY_D
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfXzvW8PlZzaYEn
 QWtZ6sZF1rsrFF7hpHWMpTlR8tlcLKb4SczaxbroEQ7hIu3mjSMnphEv/iam5uNTpq548CLg+e8
 T83B3xxOII4NSbQELpNYRVLqpqJyd6k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NSBTYWx0ZWRfX6akfNQYfSw4P
 U0OSCRIuMjLPgFZSm4gkaADSXD0UHZh+Juk5QfSsBs1CZwDm8Vig7KJj3ZNcDfBUT0UIH9SS3vJ
 a+8wrpmWfo/E4or/dcah496kPBGofIxMSXGuv5Xn1vZeI52ZfuGKUqY5YsjaBr8uaCAIPRHcbP9
 46qi7vqP9YxbD+5MnJv7+0rPEd3cooj6JZ6iYySlntC9WrkRXwOC7qBQwEZYwsU29sirKIn0woQ
 Bk1WxJMNuChjrjJ5g1pw8lzvOfEJc4t1UCv171mM/7KjrhJ0qSKhExnnAyEh8+yNzA6rBTpNxIv
 EOVW15OTnRLD4zQHLIqMj1gh8Wohnf4V0HmjuK+TzJWO8Va2FC2dcD8j6tNzpd/kzJYsfr9iT3f
 H0zv+lqGqtNAao+YNUSk+w2hvwZWCvFloxsB3EGe4D/ifrA6n0Ixe7ZuuOYgA9c3B0Sxlqv7FQA
 FTeOerOiPWP5eq2qoJg==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab3b74a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=2jq_lC5E59YAp211iCsA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: rOW5c4mbE1GkxOsM00PG3duvsyFaqY_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230045



On 9/21/2026 8:36 PM, Ulf Hansson wrote:
>> +++ b/drivers/firmware/psci/psci-devices.c
>> @@ -0,0 +1,41 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/init.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +static int arm_psci_probe(struct platform_device *pdev)
>> +{
>> +       struct auxiliary_device *auxdev;
>> +
>> +       auxdev = __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
>> +                                               "psci-cpuidle-domain", NULL, 0);
>> +       if (!auxdev)
>> +               return -ENOMEM;
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct of_device_id arm_psci_of_match[] = {
>> +       { .compatible = "arm,psci-1.0" },
>> +       { }
>> +};
>> +
>> +static struct platform_driver arm_psci_driver = {
>> +       .probe = arm_psci_probe,
>> +       .driver = {
>> +               .name = "arm-psci",
>> +               .of_match_table = arm_psci_of_match,
>> +               .suppress_bind_attrs = true,
>> +       },
>> +};
>> +
>> +static int __init arm_psci_init(void)
>> +{
>> +       return platform_driver_register(&arm_psci_driver);
>> +}
>> +core_initcall(arm_psci_init);
> I think we should move this to arch_initcall().
> 
> To allow the platform driver to probe, the corresponding device node
> in DT needs to get populated, which happens at arch_initcall_sync().
> 
> That said, to be consistent, we should move the cpuidle-psci-domain.c
> from core_initcall to arch_initcall too.

Ack. Will update it to arch_initcall at both, cpuidle-psci-domain.c and 
here.

thanks,
Shivendra
