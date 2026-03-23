Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CEB38645B
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258621; cv=none; b=e86HwNecNz1rt1CPfy4NjKdv7Nw7/wq+g8aPmvGUj7XLpFVPcWJPUqtykGqxQj8HbhM24hIUA5F8LrLN6YCYPxI0qrAIRCp9MnJAGabPXsX5l5OpZ3rddcBxTxW+X8i5pIlpfIG8EKEYAlfzyzAEmiMRsjAGM2vqV2KEcxkFLAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258621; c=relaxed/simple;
	bh=PTdS4DuNCC8UIouhKxz1ZsGRjCcZsuhaZkWZ2JoRdmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vD52lkDUoRb+kuS/zvs1wfkVaKilENoL+n83X8TgKR5sdENfYekV61ES4O85qe58Zt088shyipA1D0swu09ehl+BKVaXwX9iWx1RKH0WUH1bZbwAcSZFXi8bTV1QiFcYfiHw8RfJsNjNElkBV60Z5sGhFHJF9PlIZZiproetTAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lah6QYiP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5EKjvrf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lah6QYiP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5EKjvrf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N41g0G3737909
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UiE/km1+jrCkPgOrNnhX8dW5D3wRm7Tbxq+ZiX5Sohk=; b=Lah6QYiPhzPhyACK
	NOSY2gBGTsA2/naYdWt54OtVOhgX6PRPIJPcJkg4CMWttdxzmiJkVBT+RUo1uWa3
	q4x45HJgm8n8nDXuVie/fTq0MpkSVDPYiz/CNIQ2BEROQ/EHhMwCsLGTzSk0eP0h
	bOkoC8u3X87dSv/qFqmvgfy7bxr06mWSyYzxQlRfoWBsCAqnYvkrmQUrkHh3e8ZJ
	WPxDONXiOBpBbbkg8NeM2wPVyIfAyL2jPyQC/ykAuezQdxHn0m8mcKZP2HsX/yfx
	TBkzh3n0bymDDeK37QVh4cQG56AAGeqsoLlqTWMmjHfp6E+tNdK7w1F4T/8Xyxug
	BanZhg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghcmhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:36:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b317c4041so26867941cf.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774258618; x=1774863418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UiE/km1+jrCkPgOrNnhX8dW5D3wRm7Tbxq+ZiX5Sohk=;
        b=N5EKjvrf8h/4uTplLUlmwWoWQMgnPwevugf1dd6Y7qWSz9R5f/zh9G2vf+9ZZK+p4+
         uS+wDmDGtBo7gYo9e/Y4HwTfYO/nhICXA9b6lITgt1BU6tzrcpVDOZbIzgXzgheuruji
         9x/Gdt+cpC0w44dxzoRMKd1CC+YP3e8XK+qQbYVsdqOz/4IR8/JYLs2N+sYNWkPn71Ne
         mQzQcL1GmyWa/nDqsmt1oc5DZSTfUTetfCM4aXYSX7GzQ3ethjYDVHOfuot2nkSBYg7D
         NPdMZhL7H1JPtabtX0Hzx+FcQpVEedwCRlwIrq2vB9biijsHrphIfzaQ6v451jgZCGjh
         evew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774258618; x=1774863418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiE/km1+jrCkPgOrNnhX8dW5D3wRm7Tbxq+ZiX5Sohk=;
        b=OgvhDQLw2rHtOp5U4Vorn+umwwIU386hZyRmH9HtXlT5eVC4Bb3B/ZIaoeIFp+Zr8b
         sXvSjSRRYRj0JYtoDRBcIDxJzuP0Dw3CWora0TOPvoR9JpU5+jDGhFPaEO3So1g2R+4z
         iEgIguEwixZ0x+ZOv/WGYS/BVe+GjqS6uOi1AfigqLx9sZkb9Tw5GLrHRimWDn6RItPM
         dRE9/3f5k4HZR9aKFIPX4ptxgsEG3z/iom2Q5p6L9YE9+BVRnUUxwunRKNMov+GToBuu
         +awsASeED+Yhwkns9nlLj4WnIaSTKx3hkyw7N41nyd94QWD/Mi5onGyNu/+CWACZ3G5o
         iP9A==
X-Forwarded-Encrypted: i=1; AJvYcCWos2ELhINW7KEsYAlWX0fgHC4sCKpxztmfwU6OG6ZpGkKNO8Y7N7worR1lZDWhsXZvnwpNhG6Z6bTc@vger.kernel.org
X-Gm-Message-State: AOJu0YyqJ9hT4igrdI8YUfWuhRyRtzZvI/E/Ez/pVmXQlUnt8Cj5qf+U
	jlhgokgpsEsPwHscMlnM1Ca0aZ04niBe3QMr5M23BRc1Rcp2g/96NM02zuhn+5pqfsicaWIE341
	bMRZIJSQwnsa/vTY9b6JIC68Ylb0hQQIQeWjXdCtRaGAXuFSAqdnB+z9mQphHRdBv
X-Gm-Gg: ATEYQzzsTTCPAQmH9yqDmCOWIZrLuZ9qMZrm77WaOHvc+Z1+zlGblNsM4Yy+oiDKs7o
	6he1Mnmgq9sCDclvrTpUozXT3T9KPmyztlq4S9IX9IHj1GmIrusnMf9OLk0NTgn68/AUdK1ODYU
	imYXP5uS7Gr6aa50QHu6O+re9vqwFYoSnuOnpReBhe1Xns7aQZ7Nw0ChX714nywFO0/mAF2WlCN
	837AANYMf5VjzCG7q/t+7MRvLFdqmGrFvB3WhquT7khX9dMA4lmMeYIlb78NnOXi+MjkjCP0NlO
	Fo0D0K6pBhjwz67XENvfvepOM6+AwHJhnxGjBiWkaB+c9cH3hES3zSQy3zuIwRkmhEp5H70mF19
	n/3tDha2X+iA9uswMMMkVCUVszX+PBY8lnLJr+IybPeG1YOrahWFG6fAiT6u19ChcB2nplO9JSp
	H/HCY=
X-Received: by 2002:a05:622a:5a11:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50b37215c43mr130730461cf.0.1774258618359;
        Mon, 23 Mar 2026 02:36:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5a11:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50b37215c43mr130730231cf.0.1774258617936;
        Mon, 23 Mar 2026 02:36:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832beecf4sm477756366b.0.2026.03.23.02.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:36:57 -0700 (PDT)
Message-ID: <c05ae272-6498-4af5-bf30-2bd151153195@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:36:55 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: qcom: Add support for per port VBUS
 detection
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260312-qcom-typec-shared-vbus-v2-1-99ed9e500947@pm.me>
 <1fd9048c-b0c0-451a-a6f7-e5474352d118@oss.qualcomm.com>
 <pvmxnx7fmcdli5qoanmo62mmoxd2vslh2ujbka4cfmxyo4hxl6@dueec5hukqi5>
 <90dc434a-42a7-4719-8006-0b141d281ac7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <90dc434a-42a7-4719-8006-0b141d281ac7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c109bb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=uUS1cO11Uey-smSlg-cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: TUSZOakLN1SiuDMelJQKb5GlmH_25k4b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NCBTYWx0ZWRfXxd0IqVce0LvH
 6L1Xq5YHCdLESFV+JJREAC+pMnJ0TJJ9Bht2gmpZZ50eUnersvAlGVWSfZOEZdQzzsTdRIzXuL8
 77UzzY+OX7ikDSEo8vdKcN1foTnPKpdj8gg2cxA4ewl9nrkJ0qUTbLj0ozhJUwm0Pr7hFDTL8Vx
 wtgrjs/v2O7X0yVimTkgi73sGLozcaztrQdKdcvVjiCsn50E9vtLwFpQ/CkF4KUAzpFbU4shlZk
 jS76B7l2YTw1KCfdqLuaBnYFLVALeQabSKyAIMHy7NOw7KhXS2M6KlgtxetJs5e16xpaL7Ro+l6
 eR7zcVCvwuVaDqAh/ESSCkIFuAvMFDnzvBfXZvztBqAfBfmy1R51xDMKtAvFdvGUJjgCrgOmTqg
 VJ07myo6vJxi+rHxas9UdYpR5Zs7sEt+zxazZ9ca1LbGgKkHgAuwOMQWMrjVM3TAubZBpU3Gbgj
 +om/dSgTmcimZ61wO5Q==
X-Proofpoint-GUID: TUSZOakLN1SiuDMelJQKb5GlmH_25k4b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230074

On 3/20/26 11:03 AM, Bryan O'Donoghue wrote:
> On 19/03/2026 19:57, Dmitry Baryshkov wrote:
>> On Thu, Mar 19, 2026 at 02:26:00PM +0100, Konrad Dybcio wrote:
>>> On 3/12/26 7:16 AM, Alexander Koskovich wrote:
>>>> This is required for devices (e.g. ASUS ROG Phone 3) where more than
>>>> one USB port can act as a sink and both share a single USBIN input on
>>>> the PMIC.
>>>>
>>>> Because the PM8150B uses USBIN to determine VBUS presence, a charger
>>>> connected to one port causes the PMIC to falsely detect VBUS on the
>>>> other port, preventing it from entering source mode.
>>>>
>>>> For example, plugging a charger into one port prevents using the other
>>>> port for a flash drive.
>>>>
>>>> Fix this by adding support for the vbus-gpios connector binding so the
>>>> driver can use an external GPIO for per-port VBUS presence detection
>>>> instead of the shared USBIN register.
>>>>
>>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>>> ---
>>>> Changes in v2:
>>>> - Dropped RFC prefix
>>>> - Remove redundant vbus-detect-gpios, instead use existing vbus-gpios from usb-connector (Dmitry)
>>>> - Updated cover to better describe scenario where this change is relevant
>>>> - Update comment for EN_TRY_SRC to make more sense
>>>> - Skip vSafe5V poll too not just vSafe0V
>>>> - return gpiod_get_value_cansleep (Konrad)
>>>> - regmap_update_bits -> regmap_set_bits (Konrad)
>>>> - Get vbus-gpios per connector (Konrad)
>>>> - Add bracket to if (IS_ERR(pmic_typec_port->vbus_detect_gpio)) (Bryan)
>>>> - Link to v1: https://lore.kernel.org/r/20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me
>>>> ---
>>>>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 53 +++++++++++++++++++++-
>>>>   1 file changed, 52 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
>>>> index 8051eaa46991..a8f6687a3522 100644
>>>> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
>>>> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
>>>> @@ -5,6 +5,7 @@
>>>>     #include <linux/delay.h>
>>>>   #include <linux/err.h>
>>>> +#include <linux/gpio/consumer.h>
>>>>   #include <linux/interrupt.h>
>>>>   #include <linux/kernel.h>
>>>>   #include <linux/mod_devicetable.h>
>>>> @@ -176,6 +177,8 @@ struct pmic_typec_port {
>>>>       bool                vbus_enabled;
>>>>       struct mutex            vbus_lock;        /* VBUS state serialization */
>>>>   +    struct gpio_desc        *vbus_detect_gpio;
>>>
>>> I'd like for this to include the word 'secondary', since it's not obvious
>>> that if an external GPIO is at play, we have two ports connected in this
>>> uhh non-standard fashion
>>>
>>> perhaps just secondary_vbus_detect_gpio
>>
>> In theory it can be used even if we have one port.
>>
> 
> That's true.
> 
> Its quite common in OTG devices to have VBUS detect GPIOs.

Sure, that's true for the qcom_pmic_typec_port_vbus_detect() part, but
this also triggers the 'TRY_SRC/TRY_SNK' and 'bypass VSAFE0V' workarounds
which I would assume would not necessary in that case

Konrad
