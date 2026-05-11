Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22187375AC6
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778477741; cv=none; b=kbTXa5/8zo3ejzzQ/acTI7c4wC9D5QNM0jhaFQf3V4jQMTia+PL3X946x2mIWHppxP7thcysYp+Di2luwFwN3tfHVmv8Cbtq7x6opKbLUO6raVg/c6fMMduz5dtThoaH2ZumpJ7wi3MuYum3NBiAWdvpRIXC7n6pQeBx/KAFjJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778477741; c=relaxed/simple;
	bh=jwzVGwaK8X12Fmx6Z2iPx6BVLyjWslbMA1jpIWzu2w8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pTi0vZHNnEqUjW0z/ZE7W3lpZAsZxOntiUCO4nnaKUFu4ahqsxeMrJNXab/drynRMszCzsXtkSWD6h3epbDA0CaxwZLOjc3oUWuAD+Kmkaf1Ys8S6lc3YomSCjPwsBgoZRbeJkoB9zi04TMwFnYlsuAaD4VjanqUO22CG5/prSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0ZFJr9l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAZM9KmM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0ZFJr9l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jAZM9KmM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B2iJ6C3798796
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yCDZHP2KRhvOmwGk8RIlLDxbs61cjpW1FARVt8QP0gc=; b=T0ZFJr9l3iq5llZT
	mqi9ljNX+R/bdMi8xgHgSYCJjwZqfQbSe7gGca1QoqgdxsCsU8dCvuEZcuAFVUDV
	ZoXxo6NlW1w4LOmRE+IS7jn0qLQMjau54rjA+F5Pd7UmYw0pY8hyIH6f3fPBScaX
	CT1fD5JM2tg96KW8LstmSQkozNvcuYVkqgB4VPX+tA4IrYvOnG4SX4A4zQyJDD9l
	N8Z5QUx8diQe3yx3uFcimLz+Q7G6NTpDDWjuxPhPMwVgDmuGt+eohOkSRQoVY4OR
	LGF7wNaviY+FLop2CuXJH5CeOyLCyyn7KgE7ezZcwrjqqpd818uyqoSuezKQ318i
	GDGOUg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1wpecj4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:35:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso43207905ad.3
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 22:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778477739; x=1779082539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yCDZHP2KRhvOmwGk8RIlLDxbs61cjpW1FARVt8QP0gc=;
        b=jAZM9KmMt+S9kk14FhprGNv0crrPV4K5jRsUcd90c4+1/K6750z/N1OvLBTeMyy7wW
         5twALO8jA9cbgPfmW4lKklRpRtbyfCqlu/lCAJtrK2L+/o5JbnL84A32c35At3NMiLQC
         idCuycD3Ar0NptkSmdcasgKrIx1D6uXAJbV+aQ6jwGQNOyaFjCXd9c2OciDOb5eNWGaX
         GDHvnWi86pdftGMVhP+d+8x68hKyEKrgveHc/RNGfn9StKA4+4lWYbUq8ghF3lNx/+t1
         818nGJuT47IEGCwtvfKFZSyGq4hIQMHpfMYtDq98TwOTg3ji7Wa9x3rGBNG2KsISKDT+
         FxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778477739; x=1779082539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCDZHP2KRhvOmwGk8RIlLDxbs61cjpW1FARVt8QP0gc=;
        b=ReTwi3Xg8x/K04QyhqDLeLw/t0zZEThss1bhEzTaeCL8WY/4OOwkghD6i5ESLNYKgH
         vLVapOEPJm0SOGvY1zWpfyj7wypv6O3h4XObG/vdXAGudXItA8UOgUWg3d5pN6iyQvU/
         T3ULX91LNu73yl51S6HOvZyD83R7P9Q+gxAisI++5s/whMM/Iu44CKdBo4AcVlWypX5R
         L0RY/6HzTpS4b2qIHguWtgPSdjRzuwiYEl3gPx4JIfSbTxUYEDb7w6SYfprFH73ToyTD
         TUn9GFufDb1clSYqyzlJItMxlCiOBfV+OosVRLb6axQjyGBb2nLIV0d89Lv1kud5dUOD
         /ZMA==
X-Forwarded-Encrypted: i=1; AFNElJ//esD9gpLviDZEXrmkyP1UuIfCFBFdKYuN72jj3dJNylDv+nLE2fPB3fwurqgUdFDInpdr8ejPkeVU@vger.kernel.org
X-Gm-Message-State: AOJu0YydiUNT0K4PF5VOFGHY5X8JLVRxEQaG0/3BxxIMwkrkTPwa032O
	VgB9V/9oyHRMDb4NF/ZdOCh4J4N8V/ysV1Q9zvPZHiCKNuAkaT2nMdJOsXcybtWt7LydCCVcLo7
	AnR3tiwHfczQGqgMr7w1CCAc2nanUPy7tUwTMgeFqRhmBiUJZ3Hf5Bu3PtAFrCA18
X-Gm-Gg: Acq92OE+9xg4NkhMFMZldWACg2eK4m+BSq20Ou3oe9oJY4x9USmJ6/N3GV5uK5H+yTc
	fW2RaMQwS0N9/d0wcV9+jY9wHCnEs3UEemn5Q85kgSgviBCRHQMueHq7duWNaMnxr/AWQLN1pVM
	osBrFRGrmQbJwbp9wcWMnGir5PXEYC9WkKfsjh2f4RzTXnrIA4GxGLaALn3hZ34CXa5aawk9DGX
	VprXFSGw7yy1E31qoSl5TXIZVbf/8u/MaGMrynXoXGCYC0egVlWWZ3h/ZhG+yWrnses0f9SiSha
	ojQeed53KJ+NV8PLKP0QnXuL3j1POLA9bNuwfirCJfIw2geERLQYMz/lvNYCpNhoiUivK/702iN
	CRcDYKV73I9s80uL7DKBygB7xBjRBU6ptzY+WImTo5a7W1sKlkw==
X-Received: by 2002:a17:903:1a2c:b0:2b4:6470:760d with SMTP id d9443c01a7336-2ba78f473a2mr242876485ad.14.1778477738605;
        Sun, 10 May 2026 22:35:38 -0700 (PDT)
X-Received: by 2002:a17:903:1a2c:b0:2b4:6470:760d with SMTP id d9443c01a7336-2ba78f473a2mr242876025ad.14.1778477738092;
        Sun, 10 May 2026 22:35:38 -0700 (PDT)
Received: from [10.218.34.110] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d271b7sm88946045ad.14.2026.05.10.22.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 22:35:37 -0700 (PDT)
Message-ID: <b66df3a8-bff7-40d2-b378-43235b79a8c3@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:05:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar
 <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
 <20260508-shikra_mailbox_and_rpm_changes-v2-4-ab76fd9e71de@oss.qualcomm.com>
 <n26qxqcft7rh24a77h454py2ye4kgzxiy6ib363vmuatp36mp6@otavb4hckcdw>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <n26qxqcft7rh24a77h454py2ye4kgzxiy6ib363vmuatp36mp6@otavb4hckcdw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rnaRMznoknyASTA0RUtn6KD5YEkCAjpp
X-Proofpoint-ORIG-GUID: rnaRMznoknyASTA0RUtn6KD5YEkCAjpp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA1NyBTYWx0ZWRfXztLjdgKOVzNH
 z2KnHT7XH4z/Bjia5GBY/CpH3uSaNM59bViJMgU5ss9yFnJmwAsU3zvso9LtTDs4bwRqdnLrWBo
 iykdYVx+RZFSEWvFJw9jNoWB0xIj7E8uLek8pDeovl7+mOl2p3WHLf0nH1tjL0tZtgC7EdaI/vi
 Gmfxd3GO1w93K2kIF40P9NjD4+A2wx4Ayz/xi9XC3LRqX4JD3JxHYCNDZkOSshKNDe6VOTDfoXx
 rzaW/FskyOFAo7FF2NxxAVbdMiTjkHlxyiDNkaTdMGDd2SWI4rTQZImaehK6qpaGCT8salmJ3BE
 DIusPAg6uNyL8/PmxrOpOnx7c9AUHTWcPa6ESQB8pw3/FCiN6Gw1nEM8jFbpu1btRqnw7EFlMM4
 fGGnwgvBrRgtWFQ1CY2ed9PIrGaOy3sj6S5wkbxS32+l3VZuEri8MDRcjELL3GStN95fz/ePP7n
 YJC+B52NX8su8SqzxKw==
X-Authority-Analysis: v=2.4 cv=EeD4hvmC c=1 sm=1 tr=0 ts=6a016aab cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=f6HuTeiPA1jdPvv1JM8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110057


On 08-May-26 3:27 PM, Dmitry Baryshkov wrote:
> On Fri, May 08, 2026 at 12:49:50PM +0530, Sneh Mankad wrote:
>> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>
>> Enable Shikra APCS IPC support by adding the compatible.
>> It reuses apps_shared_apcs_data.
> With the DT bindings in place this patch is not required and useless.
Yes Dmitry, I realized that and had raised v3 without the driver side patch.

Thanks

Sneh

>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>   drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
>> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> @@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>>   	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
>>   	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
>>   	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
>> +	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
>>   	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>>   	{}
>>   };
>>
>> -- 
>> 2.34.1
>>
