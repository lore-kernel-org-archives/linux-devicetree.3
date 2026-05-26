Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD123F9F5E
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799383; cv=none; b=tg68QhuqHKNk3oZFRFsl660xtsgF67ZwY/uDJYIesY7OkHpE9DS5yLh7lPGnk35JWMe0X2Onj1jqmqS6Rkex5sCofY2AQwEutd+RNacGkl0V80F5ot2IhTcXlGZR/1lEG/QIKB5TjaiWgEGIiJGefgQQSNoBeBNM4z4nH1oS4Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799383; c=relaxed/simple;
	bh=JzkTMsq4LBq04bNQ646Iqxa4bdXXTQ0v2PavjRSkSG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJseei+SNjIheSnclGfG81NOMAkkeVLzjh0gwvFCIMQlTZw4C8vCc20JxBBnzwoJ7fI3L37Hpg5MT0npWCSmnub0EOdyVZPThQ2FiJV96hHjuWSNlWqUZ6Hp0+uAuqjJ2+KWqVZH/BM1uXEHDPrFB+w8ck+E6mKQHgpXU/l+b9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fWHz2xB1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KaufdMEG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fWHz2xB1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KaufdMEG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCdffj691683
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihX8W0YEq0NRQmElD7pN3QdBk0a78u//vqr8HXQVxBc=; b=fWHz2xB1HOToHPzK
	gZw/bdigtCD77u+bLi8I3O6mBvAarxoPMEdlsN0QKufYKBaY9C6Xn+0kp+0A2X1z
	Xbar4Om9jCfz89SgQuuXLlZhCeNlqmP1/MsZtEHVUbtvRUPs6JKb0D9uKW5adnwR
	Czzd15kLuZDM38GstK5aPRZcfRoJLfLGqiaqO8ohXxkeE1UVPwUjttXD7wEngmGq
	Pl3J3hZTOnnxIfD94L1EwDELWXilD8hxXdPje1ya0v8fp8qebdk6cwlsSDrXPXgV
	PT1LXpCM8Sq9vLp0sNFWUBxAO/4x5b3qSDYC8UIGNP9iCPvdAMPobG/AODX3THYj
	nxDX4A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2mb59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:43:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ef37c3f773so10575621eec.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779799380; x=1780404180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihX8W0YEq0NRQmElD7pN3QdBk0a78u//vqr8HXQVxBc=;
        b=KaufdMEGM+/MqwoiY5dbXezjjONUibEwEvYbCqnS4KxrTBt9Dn6sxkhY7NILd8l/wz
         mHM+2DnxOAXzqMAU+4SFedt2MkETFkdfq/3oOz7/HrXkqXsJg5bscCyD0PfXyQFz3q4H
         JHcZCwns+Uk3xxxvmn4rxonN4f97BwEFs+ZkWL4M58/MGKV9meOMHzhYkP4KAssVuLzS
         g90oohMBB0b8Z1kLKjA52FxDksoVpI0eGfzOmOwidDlPZuFyG4udlsum/q/wmofYKoMg
         ZgsgoeaGE9pYauZkFx/R/Bk2+EsjpNEPk12sFDGfB4eNJPW3eMOjCHD1VzGq3O9eliEl
         +04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799380; x=1780404180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihX8W0YEq0NRQmElD7pN3QdBk0a78u//vqr8HXQVxBc=;
        b=Qv33jX1zb4R5AfgdrbXE5tDXP0EhF8t+/2JsZFXzT5tXFSlpvdzhdyLNxrm9ejAU8U
         Na388MS9QK0oJlLMMtkHfi+T3453zBGuRWQKo6jGSmahWr+D2UJoxs3VLAepfPfDSB0D
         Ojzc40PZRa47ayY0kWW+tPd6VDQh0JSdGORKhEZcNUg0PLEV505/Dzut7ivGEHns/Zt7
         GvpcFUIlGng4/NwXdmbNtfnFQEcoN1L+S60VxUlMYl1lkZRZiZdNngQgs+G7dH4zq7nv
         LQPD9ftC5mNhMiQBJkpNxc+R4k49ZqbgM+B9fBOlFUp0kFFf1L9ECyq/LBFVJmLEtdRh
         sPlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+BmEwEOGVgUhflIlmRQoMRYeLConOP6+ppJRV3mvV7TeP27BDfFFOG7XYC2aNOmfNzhXwDgkfCngU9@vger.kernel.org
X-Gm-Message-State: AOJu0YyW2qO0IaSUVv8TmmSvRd7XRO6xzK91mncqxspgcux5Fxc1WIYr
	+tB1ZpRNUYATRlp6Wylykvik9HXEBpGChKaehqB5glQYh995dYTabY5hkAReaMLcnYWXJYpNY9d
	KIyGRbidFV3i1DJGm4ItunIB5YIO8C6oaMf0ElMD7HuFRQVaRGbN5LBFXH+AOIQrW
X-Gm-Gg: Acq92OGJT1mfuYmOPgw78NHLOJPmJhvJDfM1W93mJGEWEjw7bQhyXZUXKYSPHsGMgau
	oIi46K6GjFRDZJygNbcS8WQkwC5fCt0Ti5yB7ck5k8ihgLU1PIttW7wyfTt6PE461wiFgrY2jhW
	mAlDvcsikMP3rp7+BEzrO97gbFCgy/ltjFmoTgSn7M6wEH8nMe4YvjlcOEau5mg65dyrivYJ/Ob
	IowOlPTF+oIgOWRjTo0zMLU2ogiNH6WyIC1YOWLPK06q5L+LDaEk4WFJaxN4skWVyrFPJBuGmvC
	KFNPATknVe76vBiiEDW4gh98jyVAbN6owb9NzI/vozGvDrEXsgULyaT17//V1738QC1wwEaBgre
	H6U4tMwV+xnyIOlL7l+OeZmAUDj/lgC5qJI0zaoC4yVvTEaKrcgbc
X-Received: by 2002:a05:7300:b507:b0:2da:a813:a5fd with SMTP id 5a478bee46e88-30449103797mr8471585eec.22.1779799380172;
        Tue, 26 May 2026 05:43:00 -0700 (PDT)
X-Received: by 2002:a05:7300:b507:b0:2da:a813:a5fd with SMTP id 5a478bee46e88-30449103797mr8471566eec.22.1779799379552;
        Tue, 26 May 2026 05:42:59 -0700 (PDT)
Received: from [10.68.117.51] ([146.0.28.136])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245fbeesm10486758eec.30.2026.05.26.05.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 05:42:59 -0700 (PDT)
Message-ID: <9ce2ceda-580c-4c58-b3e0-8d497876b7e5@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:12:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] media: qcom: iris: increase H265D_MAX_SLICE to fix
 H.265 decoding on SC7280
To: bod@kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
 <20260327-venus-iris-flip-switch-v5-3-2f4b6c636927@oss.qualcomm.com>
 <177979911665.6300.11726562589723045774.b4-reply@b4>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <177979911665.6300.11726562589723045774.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hHdQp1Jmx0YdVNTWOLYOa7vTJJi477PO
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a159554 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iVdU4/i4LgW7qdSeEk1S9w==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=bawNhQOPlEKnDeaCJUAA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hHdQp1Jmx0YdVNTWOLYOa7vTJJi477PO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMCBTYWx0ZWRfX4B2CoOxME/JT
 dTP+7Ty3ycS7dXV6FNtuxSV/64VIlX8xSEgnOFQ9PEzTLS3YVBQzzyDzGCx2nxOMEam+glGL8Xm
 z23+eV5gfNz44EHrPrKiTGOQbW1UCjgCuFOpIM9lF4uALcnA28nEinEbCBFaLsdSXCdtD6Tk5xv
 XW6m7BoClF07ipP3ryoC3sL2OW46n7AnOz/wp5L4pJ0XjEMHaHhev+mml4P8VtKtIN5wuE7EMAb
 QtI0giCzdCLDwimSnfo6Rx7BtlPeGje6lReKs+cJrtynfrAeNoaJuMzgFSXnfs/uKO6J9ImjcBy
 Z8ONQG0q5IP+tqY1ZJ8kp0sHCw66Z6sDVsl5/v8IVY6QC7jB+WCPN5a/xZOKhJmXPyAysKAV/3o
 YkxLHERKx7ZZqRcRu7m4zX0oSfHtc+lp9CEPUB5lsbAZ7IuLGibgWy5rRZnbB7HQHft8lngIpqb
 irTxPI5Z1QCa4vv4ySg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260110


On 5/26/2026 6:08 PM, bod@kernel.org wrote:
> On 2026-03-27 22:19 +0200, Dmitry Baryshkov wrote:
>> Follow the commit bfe1326573ff ("venus: Fix for H265 decoding failure.")
>> and increase H265D_MAX_SLICE following firmware requirements on that
>> platform. Otherwise decoding of the H.265 streams fails withthe
>> "insufficient scratch_1 buffer size" from the firmware.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> index 12640eb5ed8c..8c0d6b7b5de8 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> @@ -67,7 +67,7 @@ struct iris_inst;
>>   #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
>>   #define H264_CABAC_HDR_RATIO_HD_TOT	1
>>   #define H264_CABAC_RES_RATIO_HD_TOT	3
>> -#define H265D_MAX_SLICE	1200
>> +#define H265D_MAX_SLICE	3600
>>   #define SIZE_H265D_HW_PIC_T SIZE_H264D_HW_PIC_T
>>   #define H265_CABAC_HDR_RATIO_HD_TOT 2
>>   #define H265_CABAC_RES_RATIO_HD_TOT 2
>>
>> -- 
>> 2.47.3
>>
>>
> 
> This seems fine to me. Vikash, Dikshita, happy enough ?

This is good from my side.

Sorry, if i forgot to add on this one, adding now,

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> ---
> bod
> 

