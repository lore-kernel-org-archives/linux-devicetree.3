Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB603D79EF
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743519; cv=none; b=g/UK0frhoHyCOZ4XGHPcJjtrDNGjZCVaqysVHvFFVw6ssdTWdCWJC2t+4TPAC8yAuVG275uuEdNy0G6EB18tXx+JbwPcXqO3XOl5iJ1I0fBnnYWfAyRTE8szPbGPu6ydnrz2etDdP7QXi1rhng3i5MbYvOEbwr3UG30lIWepVS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743519; c=relaxed/simple;
	bh=0XCB7De3/3UmkyRVbH9S/Q+7qzzvs8n4+HeLrSIM4rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V66fWLmSUYUMx+p2S8lua1Y+1EkPwVQMfJGk4sOSe5dWd4tr5kad5KfqQx0zaR3K7yemlGS+LE+4eSto++pbQG4JsGLdbQ4PWz+wDsJQbJo9tLmuPahKxZyHxVsYr5lYEXKE55qX/f3Z8L7zKc5KzHTXGQwPvaFw1aSQcMW+hgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVGZiIbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5FIdkXZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVGZiIbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5FIdkXZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATKYr2579321
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MYh7cIP72DN2R7IDyMw5swr101H9ibCpywVjfyuBqxQ=; b=fVGZiIboijZ6fTYw
	suniisXUBIqPqHJ125RaQHLiysKolr3+rGP5YxBt7WAK9bajjPCjkWPTjxqAxPmj
	tdYAhes6KJBXRQ7PyT57dkkPPN3aM/KR8DLrSzvVvfCXREtagSEvi/RBCYEeCdiB
	OkEHmc36ytSYbzeSB9ZP1gaUYa5TW3ZzFokKegQFOBo5bSquxCQzsk+nnyGy8S09
	dchZGoBGK/qFJR9Zs6RY5hcxfkJXjUzsz46qlh3DAwBmreELanSCg+5i/FTGSfRh
	xSItycfN6JKPW3THNIj+eCAo6FLOxFLhj7vKG4uSOn2kHkZ4ocv8dpLq0w0YREqT
	R57MRQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7htks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:31:56 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a14113cab3so4676821eaf.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782743515; x=1783348315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MYh7cIP72DN2R7IDyMw5swr101H9ibCpywVjfyuBqxQ=;
        b=J5FIdkXZNGUp1qyvsYrbHOLUUAjsnga6plX30hUBUKjN3d8tbUAYYdRswTidt2ycMQ
         4UIB6vVUhxhOGu6MHzB3GC6SLS2iO1tO2d2ibbFiH9WwcK60Bx+cT+XwoxZRdkQAMpvI
         WZ1JSLKKWZ8tdqbCCFC7dSSaigpqEwdzzFCgKW724fmVzgMEkZRIKFBrwDeieuqZ6gVQ
         N4fbWvkxR/CKX0sIpGNsRVWSommIHp0+0rX1n3L1Joygc0GLNKu7x/crk9aAmqOlSCmF
         KIjj630sNyKCUDMfe9UQz9sfprSCKqndrCGCNfmXeld2PmnAjDmG3jvphgqyMMAqeI6m
         4WJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743515; x=1783348315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYh7cIP72DN2R7IDyMw5swr101H9ibCpywVjfyuBqxQ=;
        b=dHSy014VfabuEyiGjI0pG9ByUCzMe+qt+Gd8tokatgeHKvTLI1aPHrA/LMW2GEw866
         823itWnuCGa4K59H0G3/Y9uaxpE2ot8p7ekbgrBFIOikWUfJykZ85ensnHyGZLI1Pswq
         z2hHTvEoUy0scFOuJQ5n2JzlvZdtIejAhdi/V0iZgXZ5UqroHHWEcRPy6rxWuYuEn3Oz
         FEP6O+EF4mb+FGCaoUkA71m2r7tC6y7xRMhtc98P1gocmmqlVNfvQYNNGC73WQI9NwjH
         YTDig7fJPnswlLkBxUe5kANJszh/QBhL14Rd1ROpsI3uC+5+Ae6l/j6VvchP7NG7XcVW
         Jekg==
X-Forwarded-Encrypted: i=1; AFNElJ9gApWrpOvkEWAEH6XySJnWxK14qlGSzAuC6oDc/9oFahcZUN/NmqMLsTbmTXt1QLiI8pIZ10HJF8qL@vger.kernel.org
X-Gm-Message-State: AOJu0YzmxIVSieIXJppKbZnRiagtNDOwsIAmsC8SQVrdMfMB6qclj6BY
	Kwnl9v90VChDU0vc+hxUTL3BJ4Bo+rcJ70G0++yAAS7Qwwzas6kg0YIRCH4xq0uax+7gJBnvdUC
	E9HP+JECHAKomxVnfBuTQYsG+EtIsvXDdwJKUavmpUMCYyQcn94AVeFDjU3Xe4WXo
X-Gm-Gg: AfdE7clI82e9XRPPTsDSRmrlaXtNU+oFlSKNQKr3ojTQpc4a0IJSyawrJVjGs5P1fLB
	vJYzHrfLlK0TmdKNODPmVyZKH49klVPax5JUSy0hnN/rbvpXv5nJryRs5UKONMf+Fx38Dl7nECy
	vdoakBYLnsYpTsjpy+sbVf9x8DLMFgXwBluWSxgkuf9/WZaSR1lY9W0OBEeqItdsNckngQnSN+O
	n5/e9RhSCfU+hGk0gg4Ul59uS3r/CGvXdhjrVo5qzvZuivpg3eBBlUKQv6AnqOR2i3HyznqkdwT
	yF+bHrs7egQbBd4WRswJDaVI+cVsZYVES9ih42uC76FxeL4TXKuqh4Y1Y5961gJ6YTwGD7z2Snk
	R5CIqI/8V+9Y2cjSa4JB3Tam4oIe+hI+3gy4bP2ZyZg==
X-Received: by 2002:a05:6820:1c86:b0:6a1:4e5a:e642 with SMTP id 006d021491bc7-6a14e5ae9b4mr7017867eaf.2.1782743515264;
        Mon, 29 Jun 2026 07:31:55 -0700 (PDT)
X-Received: by 2002:a05:6820:1c86:b0:6a1:4e5a:e642 with SMTP id 006d021491bc7-6a14e5ae9b4mr7017835eaf.2.1782743514691;
        Mon, 29 Jun 2026 07:31:54 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472f0464a6sm21209882fac.15.2026.06.29.07.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:31:53 -0700 (PDT)
Message-ID: <2754f738-04ef-4f54-86bb-6744e768a8ad@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 20:01:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <c32e263c-ba4e-4899-a935-e129de0f1269@kernel.org>
 <61765401-3397-497d-a0ca-e9bf9d76cc6a@oss.qualcomm.com>
 <5b0f1f39-ddaa-4a2e-ab29-34aacc9ff672@kernel.org>
 <ae0ec05e-607b-4022-a006-2eb1a283144d@oss.qualcomm.com>
 <d9582027-8555-49e2-9a36-c3b952dc61d4@kernel.org>
 <af39bf37-4ab4-44d9-b91b-b8fa1784783a@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <af39bf37-4ab4-44d9-b91b-b8fa1784783a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfX/flIyE8vVhgT
 ho1Kv8moWvXPH7nn4I7E/ExdzQ0Wh/3Mt5UepAQUDF/Yz3HahNwUhBdlK2Y+j+g1VI6xp8X8yQ/
 miEN6niBEBFZrhahB3LWAACDKAMJrZ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfXx/bOnsooS7AQ
 d1wVQM5n8l6WnhzlFLPrlAQPlMNpr5jLCAgv3UmkbjgyiEu1PcflTbqUfqY3bMzoa+OQdlueEZj
 I3wwhod/kIO8o8iDHOJNfvPCvxttjlot6C98EcP/Mkv8lVCo99W1T+0VMUaPoL8n3YQU17Idd7x
 +wEvKTvfBsdp2zv2ZppHfzmTMGkGYU8mPgdw6IMCtUlIFRmv83zb2Zfb8lccQTUhUCctkx02V/B
 l6B75U8fiCsZqKo7fC/sS2i2Oz9AzxRgFOC8Mo3M3rDjSrMsvDLTAaX4JhL5FWewAanBWr86E3q
 gdE4v1/9SYveDLZ0/uJ9OfnW/oDBQXuPZRsGwSbZ68yK8gfCJ/ELt0AjMPXeuhpOY0NCVP3COPC
 jQIAOwuomwLmxbvqFAwt4PCSUWoyFuRNpRpgRnF9BkRVAeid7zL3c4D4vojgKspLlIPp+DLvvfC
 VNkm9Mq8J+kiueTS5xw==
X-Proofpoint-ORIG-GUID: YIcnzJ6Tg-SDRj8Q7aUARMBKGgKOyBlr
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a4281dc cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=p2ZdXy1_vrHN-z_H-RIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: YIcnzJ6Tg-SDRj8Q7aUARMBKGgKOyBlr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290120



On 6/25/2026 1:21 PM, Daniel Lezcano wrote:
> 
> 
> Le 25/06/2026 à 08:48, Krzysztof Kozlowski a écrit :
>> On 24/06/2026 17:56, Daniel Lezcano wrote:
>>> On 6/24/26 12:42, Krzysztof Kozlowski wrote:
>>>
>>> [ ... ]
>>>
>>>> Therefore I still do not see the need of tmd-names. You know the 
>>>> name of
>>>> cooling device, because you have strict one-to-one mapping.
>>>
>>>
>>> There is one remote proc with one or multiple cooling devices attached.
>>>
>>> We describe those in the remoteproc node with the tmd-names.
>>>
>>> Anyway, we should be able to list the tmd names in the driver itself if
>>> we ensure a consistency with the index by defining them in a shared
>>> header eg. include/dt-bindings/firmware/qcom,cdsp.h
>>>
>>> #define HAMOA_TMD_CDSP_SW 0
>>> #define HAMOA_TMD_CDSP_HW 1
>>> #define HAMOA_TMD_CP0UV_RESTRICTION_COLD 2
>>>
>>> In the driver:
>>>
>>> struct tmd_name {
>>>     const char *name;
>>>     int id;
>>>     bool disabled;
>>> };
>>>
>>> static struct tmd_name tmd_names[] = {
>>>     { .name = "cdsp_sw", HAMOA_TMD_CDSP_SW },
>>>     { .name = "cdsp_hw", HAMOA_TMD_CDSP_HW, .disabled = true },
>>>     { .name = "cpuv_restriction_cold", HAMOA_TMD_CP0UV_RESTRICTION_COLD,
>>> .disabled = true },
>>> };
>>>
>>> ...
>>>     for (int i = 0; i < ARRAY_SIZE(tmd_names); i++) {
>>>
>>>         if (tmd_names[i].disabled)
>>>             continue;
>>>         devm_cooling_of_device_register(rprocdev,
>>>             tmd_names[i].name, tmd_names[i].id, ...);
>>>     }
>>>
>>>
>>> In the device tree:
>>>
>>>     cooling-maps = <&rproc HAMOA_TMD_CDSP_SW min max>;
>>>
>>> I think that is somehow what Konrad and Dmitry were suggesting
>>>
>>> Does it sound better ?
>>
>> Yes and I am surprised that it came now. So you had TMD index available
>> thus the ID was defined. If device has unique and fixed ID, you should
>> not have any more properties defining it, because that ID is enough. Any
>> names could be only for users, e.g. label, but that is not the case here.
> Yes indeed, having the constraint of cooling index and tmd(name, id) for 
> the connection between the cooling device and the thermal zone was a bit 
> confusing in our discussion.
> 

Thanks for review, will send new version with this new dt binding approach.

> Thanks for the review
> 

