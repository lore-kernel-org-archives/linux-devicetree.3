Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA4841737E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430906; cv=none; b=O2SqdfPZknPz72iRtThhA8Dg+cbO2EX0t3lr+TWt/S8jobvir977P+tIie4ETecTIfKfZ8SPbfCA/9aFKTdkBDBryWax6KY+oCyzI1yKpczLE/YCwN+CWGzvM3vRSdBW1bJgG1RPhUZp4WYfQ/WcFI8884SXk0m9e8/ZLRLNgUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430906; c=relaxed/simple;
	bh=nuLeoUEvOpXq9AkGBJOxyT85nniQu7opj6lTMbg2iLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDmjlR+4F7LDfeMSa2BFZXOdQLylzckmd1sQtcNz8hl8uJ1oKPX8JIqv2uERMKm+2/pxpYh9/G10HBGyF+SnJ8Hd+IRwa8Qgz3IrI6k57c2x62wwOzc636NslPeEsxiHubWARHnUStkn495pnsTdqsaKU85rIMx3FWZWQUTN57Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWuVIwir; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ap3G1o2z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWuVIwir";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ap3G1o2z"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8fHx3606097
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+BWYw27ihfmCLaAceDPp5weMHgOmeY7qTCbRdEdx+o=; b=NWuVIwirqTZmHAMA
	2nzlt/+8dYkyruTu4xT2JDM9ZJYh2QtSz837mrOje0yYqeSby9B3Vx83PpTA2fYO
	V82Dk/A111COS09W1pr9G/vUnn/CClXsvcF90V8ik3MESbxd4Wa1te7vLKPv2F5f
	SozhbPVZIwvz4h8FdSQ/GAtZqdqjggXo5TUuAMBHkUiZ+oVJ2ZERG8R3kCnTC2Il
	Ky3F9N2MEMQ9/qrzTRmPPvf3h1TsjJbQJ0xY3/Zk7gnU2kd7hl3oBFbTlvo1rirN
	eM3grW0Glae5H4Xm/mKhTkgUdd2OG/+Shtgt7FdW/RPscPJ8zn9J4xr+kIPcZ/Ft
	LB6mtA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8j6bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:28:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso6879568a12.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783430904; x=1784035704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+BWYw27ihfmCLaAceDPp5weMHgOmeY7qTCbRdEdx+o=;
        b=ap3G1o2ziE0vTEBZes9PNqXrCMvicB38n3Oz8r6kOfI4IDVW4vfvPAHNmKx6+mSCKV
         PHrGvRIqGSX6oIOGyuL9no67B7GkQxc1PPfErbklx29ON8S7abWWTYphVHpDNbcjaUNr
         HFBPxgRJ9A825Y7BnRtPaaUIdDXTWWW+j9XHxRrwezSaC0imsAqM4KqmfF6X5sZAKPto
         PX4Mcdwfni2QCorQLGiygoUm5QC/GuYdkDIYIAZpdyW3iB9HXjdp5ap8YI34ROCMI/1e
         ia9NcQ5odKqkASwQwVAI86rwCCqd3n4K1jiSooiWTf0J34uK0a1NRTTBhTAxwG/aDbLW
         eGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430904; x=1784035704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+BWYw27ihfmCLaAceDPp5weMHgOmeY7qTCbRdEdx+o=;
        b=gEtuGCGl98HeOlSzR1P7QcjUX/2BpKVygv6qTGny8Wsqs4RsA9MM+yUcXg+ivBPz/W
         kApJItKyKXDDEUxDw1kELVeKyarLwbg/+Tf+C/7puaz1tMtEVKSfAubOSGpig2Pi0Lxt
         JE6QJclEt7hg5Gh6L55dAQ2ubU/chkk5jfcq1rRpJGY7fmIf07J4XaJhy32CAEv2lZgB
         pDwpgQeYl1g4rB7uJoI6eMwhhGMst4neQwHAwZyk92zVp+5XdmY6KYrluRy92l5lCfqq
         ca5TiyTClmZMY1FYs7OfdPKchyOL4FcV6Ludgq0rnxGRUJFdUsfhzH8ingv7uEYY4h47
         qZPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpL9xiuIvjzjvKzkhLn/rA0ZJ3m544oex1GA/JoO0kl2/3DbyrKWBv9D6XlPOpvSDfOraDiRgOb+k6F@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9sg8NIf/B3f69l9fSf5Sv0lq1hCLXIySNJHc0TNc114OSD42c
	9Y3Jlj9cIxwtUJE7mz2fXhHVQk+QTrPK8KASLLj9yymoQoTss9/gZRmaah0+A942FrGmc9Q3fC2
	YkXL6terdZD87u5isWDH3q/4JAuaB143M98qnITIO1XVNgS8X8YdlrsDfoghpwS6V
X-Gm-Gg: AfdE7ckktNUjEg9UjsiH3lCqJ/HRxtT9xy7yqRTMA4H9nOZgrUS8I2juGxBrLSaOUfn
	/MPjifpRJxm/AYPyQk5793vZxLLUReDJu3vxhopdDxVEMB/G0ayvFQrfzFqbdwQ49vvJipreHlp
	cuXJm6LQFh3knbefWFNaX3prbriU9/vbvqwKjRfSqCHAztflRjYShUBiBoW6oQvfk8QpSc74xBK
	HnONrB8xIcbO+CMDDzMiy0OWZ3v3qQhq+iQv2JGXpirUDu+KnLsm2I9HCHEoRW4en12zh76Cimp
	A2IYbYomwSqg96IWyst5ymAdCjx9j5h+AqMp9KZMiyhsfRsDjROxR0ZGUdh8P3W2Qo6vkzFrnfA
	WjNKvUQv1sc3dZ8O9Oake/UDyFJKoLry1sEzRvXBeWyjS
X-Received: by 2002:a05:6a20:cfa8:b0:3c0:9c1a:8936 with SMTP id adf61e73a8af0-3c09c1a9bebmr3947184637.62.1783430903558;
        Tue, 07 Jul 2026 06:28:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:cfa8:b0:3c0:9c1a:8936 with SMTP id adf61e73a8af0-3c09c1a9bebmr3947139637.62.1783430902989;
        Tue, 07 Jul 2026 06:28:22 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm8137106c88.15.2026.07.07.06.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:28:22 -0700 (PDT)
Message-ID: <1f258146-4ef4-4442-85e3-84af7ad735b5@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 18:58:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] media: iris: update buffer requirements based on
 received info
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue
 <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-11-583b42770b6a@oss.qualcomm.com>
 <6f7622c5-2bfe-49f1-ac05-81e33c8bd66a@oss.qualcomm.com>
 <cxlhuzzvst3joilbhglxogx5hedqx6esbo3j4o3qzkeevqkrt2@47aaykt6z7yc>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <cxlhuzzvst3joilbhglxogx5hedqx6esbo3j4o3qzkeevqkrt2@47aaykt6z7yc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX/k6/6A5f707L
 qULCtjCT+r3mGw1ZkjvfNUoHTefFZozhDYYWzryVvS9Yvg4w0OHPB6WK2vcThpwqEBKrg+WCLnI
 u/a/8lhEG1Q4DA/Ao0ToJ0kGsGgkcKZXZU6CxJ+/9LIKmpjjcWCXrQasYM8qE0zLxHlVNcEfIkS
 A2MJSzB4lPk08X+0rLin6+/oKIwzHYKuGK7rq8EJv1L54JroBcewCR0V2tedPG2+QVlB7g5gPcx
 oe9YiefkMhAp/qRv46ToaGTEc/JBPl6kdCBtfqfFbRi7foww0kYyPN0AuNKTqigDpVW5t28R3SB
 akGQb+NF/Y49/HH6bslM8Pw5ju9HCZoEOQndS032rBBiQzEqskVOyypsp0vjmvoY6jUUticqVTW
 uaMyYhPCazCarUwxWJaXbxyrunaAVVbWVXb/ejV3ThEvy0L7qQrCyEzfDd2H5Hgi8JUfp5eoeyS
 uGOOZJsLNLyRzhrC6Wg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX3CWxnmfhfzcc
 yecnqvhTQOwzHraOi+KFo0ekkxC8rbEhV3SENPXhIVbiu4RzOKOqYMh7IULVhHV+ysNdv4DhIWI
 0eAlFHaDkKA6H7jTmSijr0YNJ6atsOY=
X-Proofpoint-GUID: 9XGUuEKFBzqHRB1VKLkW8NFaleuzaSJx
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cfef8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=--w9Y1qBsydm4NR-mTQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 9XGUuEKFBzqHRB1VKLkW8NFaleuzaSJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070132


On 7/1/2026 6:55 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 24, 2026 at 01:37:12PM +0530, Vikash Garodia wrote:
>>
>> On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
>>> Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
>>> driver should update buffer sizes and counts from the received data.
>>> Implement corresponding functionality updating buffers data. This will
>>> be used for upcoming support of AR50Lt platforms with Gen1 firmware.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    .../platform/qcom/iris/iris_hfi_gen1_response.c    | 75 +++++++++++++++++++++-
>>>    1 file changed, 74 insertions(+), 1 deletion(-)
> 
>>> +static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
>>> +{
>>> +	struct hfi_msg_session_property_info_pkt *pkt = packet;
>>> +
>>> +	if (!pkt->num_properties) {
>>> +		dev_err(inst->core->dev, "error, no properties\n");
>>> +		goto out;
>>> +	}
>>> +
>>> +	switch (pkt->property) {
>>> +	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
>>
>> If i check the venus message parsing logic, it loops through the packet till
>> it hits the case.
> 
> It doesn't, see hfi_session_prop_info()
> 

I see the loop happens a layer before during msg processing in 
iris_hfi_gen1_response_handler(). It calls for 
iris_hfi_gen1_session_property_info() for every packet of session 
property type, i was wrong in assuming that one property packet would 
have multiple property types in it.

Logic is fine.

>> Here, we are assuming the first packet type, in the pkt to
>> be the property "HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS". There can be
>> multiple properties in the packet, and if
>> "HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS" is not the first one, the usecase
>> would break with incorrect buffer sizes.
>>
>>> +		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
>>> +							  pkt->shdr.hdr.size - sizeof(*pkt));
>>> +		break;
>>> +	default:
>>> +		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
>>> +	}
>>> +
>>> +out:
>>> +	complete(&inst->completion);
>>> +}
>>> +
>>>    struct iris_hfi_gen1_response_pkt_info {
>>>    	u32 pkt;
>>>    	u32 pkt_sz;
> 

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

