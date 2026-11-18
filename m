Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979408;
	b=RY96tnPn4iwDrgZfyzNTH8FxhclFDaIGKS83H5MFwSp4dzvcgIy/hftb5CbiqPYSCJKO
	 5bWN0LGqTyvYxX0O2YYj0zrNFvIWsiVh2S+nMLYHQq8QG9Uf4Fu8+gVFvbOL2UIx02ydP
	 gBfciBZSRgq+1nME1RvL4waS42v3fWXORiI9XqdaL/IpsFPvSB2wS7TRq6+nkPcmFZcOy
	 ek90VnY4/LZKIhq4WUFOJIU3TzUS52C0AQaCR2X5Uwd/EDf8HkF5gUUmO50TcQ91IX3xA
	 FDD+X0QKhGHviKulHN9ihA3CWCpKc0Vwrk3aW16tWRvFYc1s87TbNp4FkIaoAbrbltQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979408;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KvlKFwhN06lwVbrkhz9hsAuHwVFHzHQwbKVuqeI2S/Y=;
	b=UPx4OQvXL4jYHPis5nins5rMK1Nemghr2jlvCZvyImQZg7PX49aL/m/8VoGxBVr4mM7X
	 HSQk7Sa5/eczcOdL30ehgwFmT5ZqwNVSQRSPh0c5uWEP236F/dSS6s/LUOJfc2cwGlG6M
	 Has6OCRHpC5yN91p/9rAznMwSy4QqgeU8W4q8fNrNvwCSi0IDHhdRrJihqHYW+p7tCPdE
	 uQuBeDUmIWPRzcgQ5sQhgm1l1XuIMPnfJCP749DdWP/I36YHMcxQR+tiohRv6CZOWsyR3
	 ta9kZnSaNkglDUZyFjQ/WWb0CQ4kQrxLc37xM+39awbQY135ARNl1c/4qg5WNV87kzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bvPG+c3O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQbuWXL2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7DA606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B7DA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bvPG+c3O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQbuWXL2
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V1AL2106311
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvlKFwhN06lwVbrkhz9hsAuHwVFHzHQwbKVuqeI2S/Y=; b=bvPG+c3ObKfev37U
	j3IWYTk0gabF0OgbX27E78K5NpHAfgFliZ7q5NR2FHJLxjXoZeyIB7Z0rN3sG7L8
	FNzJBSLmEKouDHCBCj8PXm7I/HmNkL8/LBxQd5lUces6Ek/WpnHoLivGAbU3tg50
	Hu9eE5w60JkBT4AjqOSRo5T5VOJzbZxBJlCC1t8rm5A8pfx56hDViT41SpdOjgig
	04lGeSl58u+JO4N8xeqVC1hWAtGjcDw07hza+yLec9MAmagPdmWT+FJdZT1UMXlB
	sBWSf4PhgAmm5ep6C+F5dcjuuT0wLsS/CWktqIq9RUBKVB4kV7zeHjp5/IDtmctN
	bQol5A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sac6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:23:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065e2933fso788148b3a.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794979405; x=1795584205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KvlKFwhN06lwVbrkhz9hsAuHwVFHzHQwbKVuqeI2S/Y=;
        b=QQbuWXL2CflqYUVDcoRxFDTjBdP9rtATVbaCVVt96eYmlD8c1Db7R7m2/fYSc0o2SX
         mEzpMnBmwtW2uFiDiSk5mBbXAePO1+WPWXQReYXyrZo/nkpIubVd2vbElxmcpXiP34wR
         hFzVE+yuTtjPlGb7R97LEPrCATQBNktE2Cqs2khUISAdQ5Z0nj2kBHHnbsEhqtXS6n/Y
         Z4LFa/x0Xx2qVUE/8iLFuzZSO0Hx+ANfj4Qp+NKsc0P8S8CRjPTIrQ46we01vWWFEpoW
         tK+lT1eZ4LwY2JnEK1WR5yoQbDjIc/m0gzh7cJfdO76ljH3+/5eZFYHcznzVNCV34l83
         BkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979405; x=1795584205;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvlKFwhN06lwVbrkhz9hsAuHwVFHzHQwbKVuqeI2S/Y=;
        b=hqgk6UoxJxN9m840dM1CxWRam99kZZ7HnLMaeGahJeNkY8QAG/HHZOOi3GNs6KVs/U
         5s24GkeLmiofvde+j8URhDX1ZgmVq4HJaoPum7hTaAa0lZ5FhJcRCYpKE9U0r/ArQn7Z
         UhQWr1L5kz0Rrh+hw/vtyyP9uM+Gpn7pZRcpmmdOgZsCrqQxWDA3m37NrqHqNAf19/Y+
         YL5U+ll7Fq6uJGEO4rZ/7r2EMhRTxq1sw0oLCGsQxlMfha4XULJ4EklJNE6HhlJaUxoM
         M/8gX3y77tVQ6dWZgCHOE8MTGL9Li5TyMBSiFldjTbTkKNogUBHjV9Vj4jmdIfJHJ3JW
         c/Pg==
X-Gm-Message-State: APuU4Z+Ia/H0cn1ILSdcUBDa8/kFxAsKWkTgGT9JsTq70HsL9wk83zTi
	VrOBGKr5TvESz1bcuE8YojVH5hVWXGoS4Pj5ilNmBTg8cg/Wfl8BH4Zz90WjP6xPYwIi67ATux3
	M9EXl56JHlwsn7yeGkvIAZSJzDIIeiUtG4k8kY8iX8FkqVyvoE1alby1Z0GaoSuWG
X-Gm-Gg: AYBFou0c0DrkdNMHKJbj+O1nANhIsuPKwjdhqBeO+++fxhJti33+m7ZR/kKPZVLBViX
	WLdbJp/71mTztrpdnUZbUTkYZ5dXPzzXxOgUCa4jUbqYw6oIQE+w8g08PZ5vEA1mMfvxomX1GYc
	gYe/PxU/hUVV991Jak0dPZF3dkdBIvCQA0V6+28/currHkbfrFvjyAgg441MIuSa/Lw62BxPm3l
	Ot28YtIzp6PvGFYZ2DWBOJkygj/fefCgQlItmDTeQgsvlfuUmyXReQRsnoz0n8wiwDwxOf6HBKa
	Q/nlF9FQUVSrBapLXcXC4zR7kgHB9IKFAZMgnGDQrsR7h5kKPAaI5ttunAe2XRWDCKnIaOfXj/H
	de7VnjpCcnu6kdR0FypvQTXqcJbgc56W2aKS/6tUHkHC6pL4yAHBl0Fkdc6s9Sn2CZdxUe/XzIv
	gKbPKUH11iDw==
X-Received: by 2002:a05:6a00:2296:b0:898:664:446 with SMTP id d2e1a72fcca58-8c5d4cbe512mr1463000b3a.54.1794979405168;
        Tue, 17 Nov 2026 21:23:25 -0800 (PST)
X-Received: by 2002:a05:6a00:2296:b0:898:664:446 with SMTP id d2e1a72fcca58-8c5d4cbe512mr1462990b3a.54.1794979404720;
        Tue, 17 Nov 2026 21:23:24 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa75esm523475b3a.15.2026.11.17.21.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:23:24 -0800 (PST)
Message-ID: <c539bd0d-e54f-4858-96ce-84b02f7f9ef7@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:53:20 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 02/15] wifi: ath12k: refactor PCI window
 selection to per-device layout
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-2-3f30fbc2bb69@oss.qualcomm.com>
 <sashiko-outbox-210781@kernel.org>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-210781@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 16sMsj-aygLpBr9PrfTUrP8VDWGTqU1e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfXw+ccsv7TUE31
 ErtXkvQMoULY5rSNIfKe8Bbf1XoXPIB0zGoiWaX7MCab67j+e+szPwLc1//wU7fCovoMa2iEzPN
 xOh6K7VTRMDHiAnbG94PbxZIfFWk488=
X-Proofpoint-GUID: 16sMsj-aygLpBr9PrfTUrP8VDWGTqU1e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX0mH9l7q7Gfwi
 AJvD9++AYjROkiMrdRoG/9YsvrRmPxpqyuHa743yUtWswMVczfPY+SK3PyhIW1ptUC0yuks3BXz
 AcFYYjj5MesO2lFFSK/i0pXf6BhIeJ2jQHaQRD2x13v91Dc/Chk43O2wpuA2i0RCoq5SqRe+zIZ
 SfkYxHf0Qa+/xLzXLMSU3DmXWVtbh2FK/dTX4E3yTqTIc89f+HKR7HaVy5aQw3zRJLTHal5qkrk
 FrCkIB4iDE9ya8yoOSBeeP/07rJ8tvdvGc+HtwiLZKGWsEnBs6UH761CpZumAC8hwKnkg1iDAZd
 ZVJ6XgPFnvuW8GCGqQyPxbA7j1BIe4dVyoKQeLvgKdPK3P7jRhYoRVbdVWWrDQrpDQKAMHV0DCN
 Txnfv1BPen6ZBr3rloPKF3udqP635sALi55o3V5YOAKWWHdV4TIbFXj1A/CWx/F4Y12YAlv4PSY
 KJeIlOphYcqnBuaXh+A==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd364e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K-b-3miF6ZPmIZDwxpkA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180021



On 11/12/2026 2:16 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] wifi: ath12k: hardcoded 0x3f window mask in
>    ath12k_pcic_select_static_window()
> --
> 
> commit bb1726c3a715437675ea3d3a7a6b0b741f959d92
> Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> 
> wifi: ath12k: refactor PCI window selection to per-device layout
> 
> This commit moves PCI and AHB register window masks and register offsets into
> per-device layout structures so device families with different window layouts
> can configure their own window mapping.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
>> index b6d306fd3b99f..cd04b9531d912 100644
>> --- a/drivers/net/wireless/ath/ath12k/pcic.c
>> +++ b/drivers/net/wireless/ath/ath12k/pcic.c
> [ ... ]
>> @@ -32,7 +38,7 @@ static int ath12k_pcic_select_static_window(struct ath12k_base *ab, u32 addr)
>>   	const int max_retries = 10;
>>   	int i;
>>   
>> -	window_bits = u32_get_bits(addr, WINDOW_VALUE_MASK);
>> +	window_bits = field_get(ab_ahb->reg_base->window_value_mask, addr);
>>   
>>   	/* Update window bits [5:0], preserving other bits */
>>   	new_window = u32_replace_bits(ab_ahb->static_window_reg, window_bits, 0x3f);
> 
> [Severity: Medium]
> Should ath12k_pcic_select_static_window() use
> ab_ahb->reg_base->window_static_mask (like ath12k_pci_select_window() does)
> instead of hardcoding 0x3f here?
> 
> Leaving 0x3f hardcoded leaves struct ath12k_ahb_reg_base::window_static_mask
> unused across the driver and truncates window_bits to 6 bits on AHB/PCIC
> devices whose dynamic window field is not bits [5:0], misprogramming the
> window register during CMEM accesses.
> 

I will address this in the next version.
