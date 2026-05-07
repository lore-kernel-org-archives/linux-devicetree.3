Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDB5395DBE
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159240; cv=none; b=RZ52VbqIhF7IVz9YsBjA3YjZlAb4N87YVp9UF6m/BC29OuSR0243u8yoSk3Xd3lpTm5nQ0w4myjRIL2BqFQfJc5/KgW0IJbGgE9bfhCjIrkQ30gLjsMT7eh5QE8pGRZhOSC/k5jZ/aalVY7fiGHKH5IivYZDdRpZcfkHBFAenKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159240; c=relaxed/simple;
	bh=ZUyiKciw6bl4ENj0XCgLW65D5u6UhS7JLeemG9SWGzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AM42M9vcnOx7MTGBIveFTaYN+BHwbxyZg5Q8qNnBaWZTtK1fQjqC8oA9xpfsEpDBR/Wqy+0kzkjY05PI1widRUW1yjfTWxnxVdcDB9V5OVlTToVJbxKvKTuCh2mq3gIt3VYAgEvEDyjlis0gJ/Uav14uge8Jps3aH+yov6rOEYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ry9dN/na; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDw3TazE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ry9dN/na";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDw3TazE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64791wlA3464037
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 13:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alNndE+DEmvOgK3PpbgZinouRSm3ht7GhqLFHIt1Qa0=; b=Ry9dN/naFMHXo24r
	R7poMpUOPzo4QPl8Oah7JhVdAawfqKPfw/eU56VIE9Hg0yUFUjMA9nXzeRCNxkzJ
	t63iNRElR3MN8Xn8V1QIbRyBJD91hrK9tsFx0fajwDSZFWEFvWc88jz4yAJuJVya
	bfRKu73reuoZblHdNZp+R6f4b/UgyGrPB2u8CRivKTDxuZilWlf5OIGTqdQ0FhTB
	CSqVKdSV4SU/ArOTuFrCiaOWfRhtE7MaoIpvDCZZR+4uU51AV0VvxAev73YMCSFe
	5ftQAp4rC6hrFnFa6EltRyHM1xGYrh62ylxsGrIymH2LuY9ybn4UURIczlrDNR6Z
	KRee/A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn268y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 13:07:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3662990c03fso225256a91.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159238; x=1778764038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alNndE+DEmvOgK3PpbgZinouRSm3ht7GhqLFHIt1Qa0=;
        b=SDw3TazEd1DVyPh72fWEhaOu7UuatlFKZ+rbrQUbyEZiDiZsLENWiZR8kgzbM3BTnq
         ZJw8pVXdFesyrbsEpRdL6FNSYk9BeeaA3KZtafcLia+aWrWDZKALIMoBDTQpzD39JMm0
         zvik1I+PJMjImp7+7z7RoS4SNY3Wdrn+zujsMD+610R/j11PqNz7QsdYQ4OEjtgL4m4B
         hN/BSrrgJ4lMq3uMYaJGgNkAxwpTnxXTMXcmpl61Oh3Bp2L3b2mhyTdjgvHq/WF9w5jC
         utL8SWUPSMyHHDJ0vBUOLWvaVYatTr03cGqOENv+xCf+0RFGfJzOSPELlaktX2JXo3L0
         GEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159238; x=1778764038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alNndE+DEmvOgK3PpbgZinouRSm3ht7GhqLFHIt1Qa0=;
        b=MyhWi9PGFbS89TqN1gIMac+eP184iqrC/g5FVRx/2o2pa2QhLWgPgCkX4dPwa+xX8r
         uzxsUnj9qx4Z+lQRbrhV35/NTZyzquYJP3h0CzByQJ/5oHBy+FLuLy3qSwXawNSFWHrh
         P/Iqb9tyGp8oigTnSwejUk9ML/Max+Qe5JAGzyYbbML91vRIMAt2ebKTSIGFsQNysnf8
         iAzIiREsQzr1cPpNPi2kbmAipTjPdPnuMrYJluFU+adeRuWSKgSWxjNSGso1M+Fz+4SZ
         5203iUVbp11WzvHplW17z+WfKfcBKORht/EszbUc4AbT84Xwm3zBy1qsxrIi89yDR1CI
         JHMA==
X-Forwarded-Encrypted: i=1; AFNElJ9zHxRTAcGvM8kNzHtyVyHFoRp8WQa7KzRuByM7Vxx9A8h7QWaRjYol8PTPGBYXV734wBRVkwwKuk4S@vger.kernel.org
X-Gm-Message-State: AOJu0YzUv6C6D49XKdRkvphQHyEngR5A4yOpqEmSlawTxWRKhICxF3Vp
	PIJkT9GJKNNAAhlJzaIgRBqFIBhMM+Ty1YtNJl4RQKOH5cJw4qQZ8Yf3xL6Y4gKzjqpgQVe5oxz
	9Vkefv11gyhrCQpm5o0gKFdP/QmdgZOO2ruDxgQUxQWks5++NOHFK8fld67CTmDXZ
X-Gm-Gg: AeBDievgv4tXClhDk8x+85tcfzR7r4IkOG17lIZHLmsADSKP85CbYrHhjXXfg0piTKC
	FeE1rGAwUc5sXlERhean4ilGxGJDcH5O4C0LrpBUmBVuJa5ou9xzpNKglOVXdS1TTzC4vpp94xw
	Q1mVAGxqT0Lj1qaZo/5CZSemyuGiIm55WYXgyHikrCRJ66+NRkOdb0lcVdQp01zgbJzd4ys/qG3
	PH6Ggd5bQWGsX0w4QSgD8UAPr7pDijnX2xQQzIwP9687waAdl689gNx26ROSTGlSRLV9zFV5gMq
	mWVamJznNkEWUP4dK7K1UG4SyGkWmAOoc/6b/k9clDnc0LvRwiBGB/HwbnACFKRw2c8xL/SEBU/
	MWdTRe8uZLFEzgf7iMhuAzvOzTF7/dXloxL825rXvO5KXB3F93nmxi0T06r1V1tVTVV1CPolEw8
	NhyA==
X-Received: by 2002:a17:90b:582c:b0:35f:c6bf:2bba with SMTP id 98e67ed59e1d1-366055e33afmr2306799a91.11.1778159238387;
        Thu, 07 May 2026 06:07:18 -0700 (PDT)
X-Received: by 2002:a17:90b:582c:b0:35f:c6bf:2bba with SMTP id 98e67ed59e1d1-366055e33afmr2306747a91.11.1778159237855;
        Thu, 07 May 2026 06:07:17 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365f01a4f51sm1816381a91.4.2026.05.07.06.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:07:17 -0700 (PDT)
Message-ID: <112f80a6-40b9-442b-8aa2-a374fedd978c@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:37:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/16] media: iris: Introduce set_preset_register as a
 vpu_op
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-3-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-3-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMSBTYWx0ZWRfX4zYkRLatKgRj
 WJb4b0Bn+W7yv4oRYc8qMsYMaLh9qvdBGmZ7I03xsqfnYv4tElzbivyBkHC41bB1cpD6Xx0eIjg
 2H+XDHyWxRsF/qfX3Ync2Fpeoah2Xx1nUVFkPu2IWtspsJlVss5kEfbN53poWXdwany8/489yO2
 GS/qi8VUQdKg5Wx4OVX9/2B+XJnpFWSUtZVLOBVLg1NmQHVqHT4AXtmYKlaibdFKa7IaQXa/iCS
 cxgeQR+eBfCKSKub7Qjc8375mu18jSrT2yz8xVtRLAn4+YD8N89JuwywEpjl6ktoFHJi9pevNiG
 /foaDc/ML8nP/Dpw2F8jdYcL0cdEoJ/EfT/pFp46guOeEyVEqaKbfs8wq7R+rlkRJGWxbUbl16i
 MXqsilGGqtCouAJfuEeGf08urGhzbPWkO1tJYpl51rd7MGEgrvk5UQBxIGx8sTPUiGVTKxgZ4RF
 m8ys30bzLdyFo541IMA==
X-Proofpoint-ORIG-GUID: abZlqfmNBBCU7aV2oE_f-_m_uDlHwdeH
X-Proofpoint-GUID: abZlqfmNBBCU7aV2oE_f-_m_uDlHwdeH
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc8e87 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-LUH1mPZw7eumpYd8pAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070131


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> The set_preset_registers sequence is currently shared across all
> supported devices. Starting with Qualcomm QCM2290 (AR50LT), the register
> programming would differ.
> 
> Move set_preset_register into a vpu_op to allow per-device
> customization.
> 
> This change prepares the driver for upcoming hardware variants.
> No functional change so far for existing devices.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>   drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
>   5 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
