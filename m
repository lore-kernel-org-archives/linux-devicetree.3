Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E5F1D435F
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 03:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780283146; cv=none; b=OKhM0IIlx5TCWGSjUBTMRVPVEzQkJ9M/pmq9OPt1KxEdr+hakmLtnn8bfLgWv4uWPWP+i55MVwf1UEKBHz5h2E2wHJvh2nWyRKWohLLOPsx1GtMh+nxlFGiBsl9qr0sNizoekIvFjFR2FBZh4cYDnSG1jbnRBW4FYthMufTnSEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780283146; c=relaxed/simple;
	bh=Vy+YhFE2gSXb5OnwZrw1eGd4N0Q6Gt8IqQN6HNr4hQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cTwueUEPRqrbVBHaB43iqecXGvT5Drfxo3RtYSo8FAP7c9UP5ZZjxv3eRFQB9qAFGgEd+FsrBV7tJrMjAhaQOF7n6A7kCn9pl1cyQmqgprGRu3hnDAFzp9yYGKAJ5f9vav9/dskX/UNd0jtM3XfanLwLGhAn7wmMWQqkm51TFqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSAwKYNJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9Yu6dZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSAwKYNJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9Yu6dZJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VJU11S1886235
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 03:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rr8eNIJSregUU9TOJrUB75ijnJ0oWETbhJRkNix2tbU=; b=JSAwKYNJgfeQHv1E
	VFTGLJwlquA8pV+O5K9DfrDl8KkjU5Nv5zHY/LwDevWWYw3yGWV36PrnWKCqY8xC
	J9o7Vr2P54ClDA5m7/WDRLFjXJa0mCyDy/QSR92TzXWxtJANaX2lGa+LmL950Tjv
	EVaTk9wb/9UtMHi6WgmxEMEGJ7q9PtONuMjS44t8eK8JbAlnsIR/LlQWdCfqz/Gw
	aPsAgol5iUG6bWiMNeGDGUTobAFGYsJA1Qt/zmwSnoLuEjxHFBv2Q49XNzrzQO0L
	/6HD8cMcdiGodgIOH5yuRPos6fJDNJVKin7BHzFG2GHCzpeufvmI7bqzE+CcBAR1
	9TCa2A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqfxwdm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 03:05:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2bf5388so412674a12.1
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 20:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780283143; x=1780887943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rr8eNIJSregUU9TOJrUB75ijnJ0oWETbhJRkNix2tbU=;
        b=C9Yu6dZJbtXH5IIo+L1BtdeICz1ggEU7MSv6eUKT4yuLfgv2Wv7/7O4krX7l2HYvwp
         AJaBeRBq3PIcJxW9AouSAvNOf5zwKJZ2ANzsz10UjeCKQeB4KlGJhq2O6Nh+dTuoWzBu
         lLXwUIb7dqmyYGdxE4+6FZBxm/Pq48rPQVy+JzXn6p086Wy2+j/UMJrGPRIoHtfkhmAp
         J7xvelq7XkqHgYorFzekMhBzLxHct4hGMhR6aAXm9Hsu7A53lQix5ytqv6vWFgL2XOEU
         V/lvl+oqJOM2Rz/bNz54nyDPPjz8S+Q+zdd5Cokvcx4qZrEWxDkAlou7gQy7hr5VK4PM
         Ph+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780283143; x=1780887943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rr8eNIJSregUU9TOJrUB75ijnJ0oWETbhJRkNix2tbU=;
        b=b5utT0z7cmIUZQeioyQ5f045v1cJc+Ml2A6CJ7ltUcHX3Ut6svbflUfhyXWHLni/cx
         a7zk7HB7EEDUDyj90zToCcwChXZ/7pmFR14AYLQFhyPdx10hGYLftMpRZeQanw2go2ZV
         nWs2lONZ21mh2Bex9ELaP0eMTpOyaLQHbWSEAzVC7PpyDUc1FdTVxamjEXrMfbcPJNjl
         5qUz9tjjQ+ldHxc5Wz9VjOT3pfWBmZN8Z6AlWvqS0bdzd8XdUeruh8BH0QKO3FEmSzYt
         MeXTax0pehtFg+9zg6a7HBR62I4pCJDYMXl/pdA6GOAWRoa3zxBESYOnqPL9O61sPGHi
         /HsA==
X-Forwarded-Encrypted: i=1; AFNElJ+o/gz+gFJ4kskjZSDqbA5YmMFS7S4mCHCq3omKD8kdnq1s3yEeuUsdq79qBECFp7d5zzy6/GZjcj+O@vger.kernel.org
X-Gm-Message-State: AOJu0YxJJVDRHiwrF0YzRhcXIyi9sIW1Vrko6cZxdedSJTbeVHTA9tqR
	NAEZ1OY+Iq4Qrb+10kvLgbYdWXhAAZKZv8gEEoZ/6iXzxs9lqi13a4LQWITtX/umyI/udPQO2Gs
	JmSpw41BPwdPKhR3xmn8Fy904mWExobJWdv8W5Q9FseEvD/7oIhotMzJXC8YbBXki
X-Gm-Gg: Acq92OEHQoSwdxlj3vdPypd/BkIVndbdKx5CxNRqzUqVT7T7Ap/WJyPOizGboVyY5sp
	t3vjKIa8xM2w6Lu8FuyzM3xgw9OrMH51LagAwjhn3AL+fgUOWfhj0MZmwW/wn0GvXeZXffcxKbv
	mzZfcI4OE7iRxJdvMg7Pzx0YYWhTUizP/V3Q+qpAmiHbuo53nhnsmZ0V3rJT9od1Z9QFgGRy7wo
	zjIB8WuFCKOpXZtS2eDeLl7L5VihJiO/rVSgf3fq9A5p0h1fg4V6IP1UFbxKxj+2CVU7h18zuYX
	8jjCKQn6iFHGAjKqDbJKm/i6MgXgCKVfwaAtl17aP3BQi+qwBt9IosElL5YgQHiGgzySuB9RyXs
	ghTM+dH0BEoNWVAAhmz3Ufwxjs+byfeDohOGnzOhnFpoh9D8vzc8WfiBktls=
X-Received: by 2002:a05:6a20:748d:b0:3a3:a55f:405d with SMTP id adf61e73a8af0-3b427c572e9mr9284080637.13.1780283143088;
        Sun, 31 May 2026 20:05:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:748d:b0:3a3:a55f:405d with SMTP id adf61e73a8af0-3b427c572e9mr9284033637.13.1780283142589;
        Sun, 31 May 2026 20:05:42 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c857fb0b31dsm6793462a12.32.2026.05.31.20.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 20:05:42 -0700 (PDT)
Message-ID: <3a623652-dfde-469e-af55-d4b54e3ee1d4@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 08:35:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
 <5nghgd3lt6vyewd3a7l4kahlxiidxdhgtu42tuyb7xeq62ztvu@tvclo336xtpi>
 <6d5fa33f-449e-4f22-b0d1-60a3a21a9907@oss.qualcomm.com>
 <pxio3igdcylbowpfiwb7r6s7q5spbo7g6i4iiun64zwn77v6xw@2kfvhzuhyxex>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <pxio3igdcylbowpfiwb7r6s7q5spbo7g6i4iiun64zwn77v6xw@2kfvhzuhyxex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QGsoRLuMrvPFox-QdpYEPKQf7ZgSfgls
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAyOCBTYWx0ZWRfX1RsuYSCFkpiQ
 4n2ToWtlQa+GylyHccesaz/tB5yRXpE0j7onPFSeXLJJZQNbvW3tqM7gE4fg3EKoJso5J1Xq8lC
 1MfKgl+xGey2J+Sk91HtTmzjIQTlfVAyhBNJk6gYYi1jww3ywRTygLwjAehS80muZzlr9+rWi+0
 mVczBXJQIS3aVDolXg3EUP9c5FPU/90eWT7/OrOizxrefDiyDWnl8NlOUbxFvq24TBLCvlZz8VI
 nYbjohXjACzSkovpuZxwFTxDHXR5Huf5HdWnRpT4C5dPkXOCrv4xXroLZgMbuhsYx35+Cy4nSi4
 OcheU5WxwdnDFA2batq4lnKkMwUbrUufiPYmbhKQBy1ynTnrwIPx5K21TYDtufDItmshbq1/GrI
 api8/uyZFuPD72GgWSFH4tFAaclqr+G756y1xYCbBdn/UN3A0bmG+So4Sja6MiS7oQ8wCzJamX3
 H9dAdImpQCm4EcbOlXA==
X-Proofpoint-GUID: QGsoRLuMrvPFox-QdpYEPKQf7ZgSfgls
X-Authority-Analysis: v=2.4 cv=Zq/d7d7G c=1 sm=1 tr=0 ts=6a1cf708 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=TlunYbtFrR_dMKcEUgQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010028



On 29-05-2026 05:03 pm, Dmitry Baryshkov wrote:
> On Fri, May 29, 2026 at 02:53:29PM +0530, Imran Shaik wrote:
>>
>>
>> On 28-05-2026 07:14 pm, Dmitry Baryshkov wrote:
>>> On Thu, May 28, 2026 at 03:37:03PM +0530, Imran Shaik wrote:
>>>> The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
>>>> but has minor differences with the number of input clocks. Update the
>>>> existing QCM2290 DISPCC bindings using conditional schema so that the
>>>> QCM2290 requirements remain unchanged while accommodating the additional
>>>> clocks required for Shikra.
>>>
>>> According to the IPcat, display clock controller also has (unused)
>>> inputs for the DSI1. Please extend the ABI for Agatti, then extend add
>>> Shikra.
>>>
>>
>> Sure, will add the DSI1 to Agatti as well. Since we are extending the ABI
>> for Agatti, I will remove the clock-names from the bindings
> 
> Why?
> 
>> and update the
>> DISPCC driver to use the indices-based approach instead.
>>
>> With these updates, the bindings, driver, and Agatti DT must be picked
>> together to avoid any functional issues or ABI breakage. I will explicitly
>> document these details in the commit message in the next series.
> 
> Well, no. DT comes through a separate tree anyway. Be sure that the
> updated driver works with the old DT. Also make sure to not change the
> order of the clocks, you can't break the ABI.
> 

Sure, I’ll keep the clock-names property and only append new clocks at 
the end without changing the current order.

Thanks,
Imran
