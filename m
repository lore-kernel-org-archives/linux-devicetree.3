Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB7333B6FB
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 04:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786163887; cv=none; b=KqeJwd15ur6pRyxiLcQJuN5JoiP61hjMMX9ThxUgj/uEQzZL5SlJpZjZTV3YT9cM6X/S7JGmV8lgJ3F0JKcpKGgifXtGiVSuFHiUxq030+TI0bduM8xMXElaYrnT0APJG0WhBPSmgoPyGerkSvGwZYtwtZbySJ+Alu5ZcwzzyOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786163887; c=relaxed/simple;
	bh=Dc5ztGsIy0aJz9/GJTri7JwqP0wGVOI5md1RsmAa0Iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gzrhu/5YY4RhDONAR309JwXT/QB82vna+3iFrfYA1rms1cOtoFZjnjRVAVUOCQZDnh13u+SeOCvlH1W1N+ME2iFakQsn3mjT62kOGG4lrwWb/0OvI8xENbVkRwejDpZQ2L2Z78WGzyqm+96BUhV5UJ7zNd744GotlzGDvuM1Zkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dd8mmTdT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rk35nnFb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dd8mmTdT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rk35nnFb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6783wKxo3267329
	for <devicetree@vger.kernel.org>; Sat, 8 Aug 2026 04:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PcfdXVqVda4nR+T+MGbj9iOc4TJuUh4We5btZ2d3Qbo=; b=dd8mmTdTegq4j4Qe
	Wm1sDnzLstxCwrLEa6jYFXDUqP1acQRWETn668FS+liOGJs2lPF2uregsYiKovMG
	BH5i53i1S0SAFjWjMfMkxLT4ng0vCOlGdsHitZDox6LM9cT3fKnH3q10IoCNWWBe
	TjYSGSezKClmtto3NEpUlmEQRVo6dQJzo0B3IVZm0Ux3qyUms6+47mI6/KUqmaix
	jJ5+DtbsuyhJ6ZM3q32FnoLrdnOn6xNGGuO5Q/09dQY/lc0q9s5A8ACJC1KL3Yl8
	dRhZtYUmYGBU2XKEYq2JJbyNnTJFqlT77j+ecIbt9rEHNwas7TUNOzr52vuTCxT1
	vSWM2A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwv1y856k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 04:38:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso270422a12.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 21:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786163883; x=1786768683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PcfdXVqVda4nR+T+MGbj9iOc4TJuUh4We5btZ2d3Qbo=;
        b=Rk35nnFbI4sY2wjxQCFBn0Q1b8ZP6g2Ky2q73ytzpBllcdnFEffKgiyXbthR39Vn3q
         MsXRYSE/GWbtpAEslUCkD2M9kvNVufObNnZdL+mKK9zJHXTNkhVW3EzMnnVdUeQ1gMjv
         o3geDTt87TYEosYaUp2BTHfT7tRCFM7EX28pEjJRdj8rmcjgX3UDe1vg/eJfBZmLTGaU
         bs28+w6rszD+/HnfOQo0lYkQD0OWe23ZAemWAMj96lbazQxGgK3IlY25nkvL3SM62c4/
         gW2QRnqkiXT0+unI1Ax70mTh41ES15UrHjcgGbDuYkGyzhMadL2XZFnzN9k3nyLVlKhQ
         eYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786163883; x=1786768683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PcfdXVqVda4nR+T+MGbj9iOc4TJuUh4We5btZ2d3Qbo=;
        b=gAoJsn0qEKhGREcCK4ibNFmjdHo+U7sPpXXR6vt5lSYDwFK7jb2O1XbQE7cLAFhzLY
         YmNYNHFcMx5lln1hq92lMvtd/p/nsJdo5yxKlpB5WFqIppgEAeJzWyod3uqY8fXbRXC1
         GQCyd6u4fZWmaRrmEJIMRSMbOolvuoscveM6SfEBOnRXzCffYsVl4ipGlO+de06DgaNq
         4IZTC85b9P0/WXxyOaSY59d9+cU+04Dd3BupaGhbrt+Rqb3eTen1LKMm6oxVooqNwKk7
         VId/cTGagJ2Ns6qffAXpjM86sszXIMdkzNILXoQ8NxRmP5Y19eggWQt14HO7ZN0Z90A+
         bk5w==
X-Forwarded-Encrypted: i=1; AHgh+Rp1IQotgISz82/vXjOcM+q/zHvvsSbQf/rmv/4LVxwojpgGL6xm53og+fXf2quINkKvk9CLxwphnQqR@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiz9pR5Q5vnoVxhJJ20Ne8x0iDwnBod2ZJUX1RtMki09lREWOq
	83JZCozeroe0yKEYqmMfTP2wBR52gCOF2jtWEFChI58dpF2DMbb6udWe2Fd3tyEUZLcr5QAup4Q
	stJy7j9sGYFLvhq57TO0D2jG/gbXJwsOpLmPKJ98h2H2SdQ9BXmzy3hRdAI4r8JZK
X-Gm-Gg: AR+sD12mBNa0gZOp54J0OEInnmLSvdunuH4OGJ/Q9/KVChF5g+/Gl9hYWMlSDC9h1GR
	Gpi5kQYy7YI/A2DPE7i7FRXvX2swXz852pcJPXmcp3DiB7gs0R/udI9rzUdoHQAfwyXOKMjMgA2
	tKkWCNhtr7EPrsymA8ZdzReFIQr9BY274VRyxXhQv6zjxg4Xin6uqBRtVmEuQOSm1Dr1uhg/7Tw
	FAlVOzPeFbM4ooj0HWIN7dSrPUtfslgYDYMUybwk/DkX8qfEF7i+mxWT/pqzx9TIjgfVqi7lug3
	quH1vQ3osb4OhuDioWMS/cA7irV21x3Ueir0cwZNFItidRjL9zRMs/Lz+cc/ML8XKtb98AnO7XM
	dYL/Lf4e+41VX70ZdrXKQd3Sbpvj4vw==
X-Received: by 2002:a05:6a21:2293:b0:3c3:994f:b4f5 with SMTP id adf61e73a8af0-3cb85eefa11mr36524078637.28.1786163883104;
        Fri, 07 Aug 2026 21:38:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:2293:b0:3c3:994f:b4f5 with SMTP id adf61e73a8af0-3cb85eefa11mr36524024637.28.1786163882662;
        Fri, 07 Aug 2026 21:38:02 -0700 (PDT)
Received: from [10.84.15.18] ([106.195.78.83])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3d1sm14702970eec.2.2026.08.07.21.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 21:38:01 -0700 (PDT)
Message-ID: <6ee7f32e-eb6c-e264-6f0d-541555f8fd62@oss.qualcomm.com>
Date: Sat, 8 Aug 2026 10:07:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA range for
 Iris
To: Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek
 <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>, stable@vger.kernel.org
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-4-3996f67e33f9@oss.qualcomm.com>
 <ruow4uus64krlpy2gvm3g2d6rq5kgmgxnlhstmecil3gw7lhkd@2golvucd473l>
 <20260807162405.GA896590-robh@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260807162405.GA896590-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ne5bsMeg4oezjC9tGYLmuKR7RNid-BJx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDAzMyBTYWx0ZWRfX5cidApHRcVVZ
 CgD8uj7qz4puRPptwq0hHc14HwxcDJ0TljrU6QVUIwYOwsnGfQKzPFuff6iti0USOJ1CxeuBr4v
 H6ro2m+6rb/jcjewCy4Wk9qFZh+a+NwSO398zBlvVtaReTYOZ7vdVXAottQIl8SsSSaWC/WpdxH
 ahp/ZTHGQwzhexcsgTVFH7pxo3b0WOSyrIOw+QBlPzFJZ/k85ukXsKm4qmschBB1yu0VTSO7byJ
 X/Y6lgR1CTHh0XsFuabsnRxCQ/F6NIfjePe551Iuv+5RASO207sXMDRIxx0F0rNPoIM1v5+0xzX
 WNzG+8AEYcZo9Wf2XfbtsuvAPv1TMoNkWG5cwwaP04KEi1PfRlwARcVDIQinqbcDJXelXdbF6lI
 Ahcp5BYqVWDVSYRBuRwRFa6vM37L26xCAp5jq48dtf/Hde7+MWoTTuL406GgSZNytQKD2IJFgXv
 D6NhHAyRISo0sSDMk6w==
X-Authority-Analysis: v=2.4 cv=PbrPQChd c=1 sm=1 tr=0 ts=6a76b2ac cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=KknAIj/64Ji5C9Eg1IdENQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=YG64nluAAAAA:20 a=t9ty7G3lAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aHi8tEQZ11PmSqT2gCsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=CsAS6f0m0zARWR-uHzm3:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDAzMyBTYWx0ZWRfX7G8YXuND01rt
 TSQxlDae9AGc7ao93AAsm+Wj2W/I2nxIzjNp/2QVrkJVf6sfEwWOWJtl9Rz1gWnobaaAvth8hwz
 lwMst4iNooJNdo6A+ZAnTEicpj6DF30=
X-Proofpoint-ORIG-GUID: ne5bsMeg4oezjC9tGYLmuKR7RNid-BJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080033


On 8/7/2026 9:54 PM, Rob Herring wrote:
> On Fri, Aug 07, 2026 at 12:03:50PM +0300, Dmitry Baryshkov wrote:
>> On Fri, Aug 07, 2026 at 01:54:48PM +0530, Vikash Garodia wrote:
>>> From: Daniel J Blueman <daniel@quora.org>
>>>
>>> On X1-family hamoa platforms, the Iris VPU reserves IOVA addresses
>>> below 0x25800000 (600MB), primarily for secure non-pixel buffers. DMA
>>> into that range, from any other stream id would triggers unhandled SMMU
>>> page faults that cause spontaneous device reboots. This is readily
>>> reproduced with one or more browser tabs driving multiple concurrent
>>> video decode streams.
>>>
>>> Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
>>> and reference it from the Iris node so the IOMMU layer keeps DMA
>>> allocations above that boundary.
>>>
>>> Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
>>> Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 ++++++++++++-
>>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> index 8a96ea1bdb9c4c409b2af997680d8c13fed0643e..87f424765d513c97b06303bceb75ca9f176d2ace 100644
>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> @@ -666,6 +666,17 @@ smem_mem: smem@ffe00000 {
>>>  			hwlocks = <&tcsr_mutex 3>;
>>>  			no-map;
>>>  		};
>>> +
>>> +		/*
>>> +		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
>>> +		 * primarily for non-pixel buffers using different Stream IDs.
>>> +		 * DMA into that range triggers unhandled SMMU faults and
>>> +		 * spontaneous reboots, so reserve it to keep IOMMU
>>> +		 * allocations above this boundary.
>>> +		 */
>>> +		iris_iova: iris-iova {
>>> +			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
>>> +		};
>>>  	};
>>>  
>>>  	qup_opp_table_100mhz: opp-table-qup100mhz {
>>> @@ -5439,7 +5450,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>  			interconnect-names = "cpu-cfg",
>>>  					     "video-mem";
>>>  
>>> -			memory-region = <&video_mem>;
>>> +			memory-region = <&video_mem>, <&iris_iova>;
>> I don't like the idea of this series, because it _again_ doesn't tell us
>> the truth about the hardware. This typicall ends up with bigger problems
>> later on, when it starts to affect other bits and pieces.
>>
>> I don't want to NAK it, but I'd strongly ask to reconsider it.
> I think this is an abuse of /reserved-memory. reserved-memory is 
> reserved *physical* memory. Reserved IOVA is a property on top of that. 
> I'm surprised this passes validation. If it does, I may go fix that.

As per the reserved-memory.yaml schema document, the iommu-addresses
property for IOVA reservation into /reserved-memory is allowed — it's
documented for IOVA carveout reservations:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/reserved-memory/reserved-memory.yaml#L56

> Rob
>
