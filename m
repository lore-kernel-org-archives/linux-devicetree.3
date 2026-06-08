Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EFA2DE702
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780923651; cv=none; b=g36nz4CLYcGl+wNmSW/dbJy/1f8Hv8MIkB5RWJhbgWBtltg3dz2Vou/Po00Ip0WsPXqO6NXTtK1LulV48d2rN4SNMJ8bjQMmQui09nyKPtk+nVp+heja6QHaUw5/zIuWuTBxnqGczYFOsrsZVxSvhmPQzFzB0FgwahUNRKtexfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780923651; c=relaxed/simple;
	bh=5CPeWiybnuarQX89JSsnELL5gZi36koS7oxDYutM69w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJ6ItWEKSB/OgK7TyF7wHzU2YvMZqvRituy37vnvkr425XYWPAsVSo3T6hoVDj6XUSZFFMKIDSp87sG4YnC5wSllxcI5SQUZP6Fam9iTlNZRqy6KVtm92nhfqlX9kHqmA6jbyKyBn9kdQmQW4dpTy3PM4HWlhhELN+MheHzYS1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THJYMksA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pl0dBQTs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THJYMksA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pl0dBQTs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BBkfl3454684
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 13:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sz10LbxlxIzFGKgPz2INDQUt6FN8Eaw4+BxLG+zT1cU=; b=THJYMksAV9Qad3zc
	bfkabOoTb0K9nC2fiQ6yyMBL2F7Vq9KzW7u1MJDstSDyJYIKEMjWL97r42OmntNN
	zWs950gwiJLot0/mTyjIMAzDgGSU3wTb4RF21GIi/FC4Zew0iLxw4MF/7GptVzrf
	6NNdvKfyI77KVEbCRqgmP+31slhuN+xh3ODSBBh1y7VqaVASfyv7I1bh8XLaDkRV
	UP88jfBBBH38g911SSZ5oBLNp3NTZvp54HjDQDYGKxSsXqw2BlDQk3+3F2TEqRYG
	vKc17PYpCWqQkLNxh60gp862shrLf+ufT6Uf8XH5KYDGeZODF3WvPlpAT14Cujho
	KA8OVg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0h0ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 13:00:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf335549b8so67810965ad.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780923643; x=1781528443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sz10LbxlxIzFGKgPz2INDQUt6FN8Eaw4+BxLG+zT1cU=;
        b=Pl0dBQTsILC9YNrn2AbFsoG+krL4n5+JKnwwjwlVTJ2QLs0r4jfaRjZ5z7LbDZqvYS
         hPQoLlSw2EvV1E7EFD0XvkQ0XffuU5O8YrIBQcc4Hex92KicYRM6KFHL4U+D1pUsOFUq
         IG9U3Neal5EL8/d874qfQwmCMqQHzzBBy1tgYlWpftdkrwdnCfuN21YoLQ8FL7XNs2PM
         XzaFE/hCYrzMPViSLiCT653wwLNdHaWjMFEY0f8cbeR4LvQfRTQIBIgZ6GkfL/yu4TBq
         MXUCJGUA6ZAIFsDjb20qwZFdwoVttAKr25V+l8rGWYI6nAElNJIP9lC7bq8qwcSIJooM
         NrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780923643; x=1781528443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sz10LbxlxIzFGKgPz2INDQUt6FN8Eaw4+BxLG+zT1cU=;
        b=EjqPVGZ4mxDiyEyYkp5MFnjuAkcZt4+oqpPHqKT/KfUB2dfbgz/9x2E5N4sKZP28or
         ZTo0I5j1W3X5Pc6oJGgNxfY202KYjknFI6zuZVeMULENSMrDSby0nshXqrMy6pVKtyB5
         i1dOZgFeLaKfc5TxDDF0NNN1SYkVrhcBFMzm2Qi3OhR+Va4QyB7GQruGXaaQ6pn+cCfl
         8367KxlFHwJTyh7KC/v7WaY5NRnsjQpoxkWtLN6eVwDh1e2ADeb3u9tzRG9wvwndNd00
         fl9N4HFaT71Efa7pB6olbs8x/pyW52vqyDAoiHwBMVDjoH4byRnO1HoC7pEBzDkMGLE4
         csFA==
X-Forwarded-Encrypted: i=1; AFNElJ/bhNGF61bhvq4XcSZLKHoqRd6PSIBj4TVs1MArz1krnfVsf+fus1fYBcgxeCXaB7TYLxVJbxLzd9nU@vger.kernel.org
X-Gm-Message-State: AOJu0YyCvJICsSW+tclzg1CK0oOHSkdmFl1uo0qC7VKIDs4NMzzUGvjl
	rQbvZ25gh8LCjsb5LXpnowOR4cxb/CsvGPdgArBAyILBf1R+yyTIn3uMTO1cAQv+KmtCEgO0Wcu
	qov+JB9/UsOD/dEvD1UqB7gAbstsGC/mpfQcIeNooQoce7N8lSY0BJQ+RlpJ/3yK7
X-Gm-Gg: Acq92OE61Xekl9tk0J0DVOceOGY5fsaU8ok+k9a7eeMxmj2iwAMLKtKxtAXa4Umwzkc
	MpyOUXT7RGfFDNU/W0hwlwTqQaz3IAkLYJQNh7mlxwTe0UnwEK2m3rN2e5X6yNt65N63yhC6VWe
	TLTWuZyVn6TEPoiGEYok3CVvyeKr1Sh1yYR2g5mDtIPmKX7eU5h9/sib0FAoi25ARe8pBOrf0YC
	gLHGxlRESnu5f4K0wmfaF39yOzQs+UEveRpIaSeSqgQe+/DNsEQbvsbgHIZGP0TwLd75tbpLZSJ
	dWQpxLCzlgNIdKcDiTd9yMUsGBT12kan2ZMGlPC7jajGzkx/64yA/gp7CcIrkCS/HJa4RcdzRlq
	ne1QBPvqujwVQSopajrBPfABT3XOUeSX7uDLj7GDOPgyVVo3vhHuX/GNv68yv
X-Received: by 2002:a17:903:248:b0:2c1:564b:4f49 with SMTP id d9443c01a7336-2c1e7b35a10mr172173965ad.6.1780923643112;
        Mon, 08 Jun 2026 06:00:43 -0700 (PDT)
X-Received: by 2002:a17:903:248:b0:2c1:564b:4f49 with SMTP id d9443c01a7336-2c1e7b35a10mr172173015ad.6.1780923642286;
        Mon, 08 Jun 2026 06:00:42 -0700 (PDT)
Received: from [10.219.56.230] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6cea3sm177993205ad.7.2026.06.08.06.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 06:00:41 -0700 (PDT)
Message-ID: <19df2647-309c-4345-896d-b4cebec07e97@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 18:30:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
 <20260601-shikra-dt-m1-v3-10-0fe3f8d9ec48@oss.qualcomm.com>
 <j2l7ijr56b33uru53wiyhjkd66pxusxopr4c7xmztlqfnztha3@xp6ciwnngcv2>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <j2l7ijr56b33uru53wiyhjkd66pxusxopr4c7xmztlqfnztha3@xp6ciwnngcv2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyMyBTYWx0ZWRfX9D/KQoNKt331
 13Q0xMZidSt8ZMqb5zz/Nvdx9d93Ys920+06SFq31wR+MMe7BkYX5y763PSo+dFoRO1P4xdMJiS
 yBbF4IMyeuZwS59Ye4SWAZ3XTfMY/agUKF8C5EdSQF34PYoQObSlcF4j5onWFDYiYwDDmemL0jq
 +Havv5AkQrwbTBtrh1LsiKdsmmRiz7J9SDyktxaEPk6H5Z7qheJnQxJhq4OUYW3YhFl6+fVbezP
 XCe9T30QS6n82o6sEk7Ca26gjHqo3gZuShlulGoHM+Zct3N9PGk+4RA8J32u5b/PGZoRgf+uj+M
 PIk2ExTKo36WopDQNmw8c98QGhskPwMcK4/mZRAjJ2WvfYa2n7xt52+v54KBC2NUsfv0lOtpfq2
 KLB2RS88OyhErqyPuNVQd8h3NddfMw==
X-Proofpoint-ORIG-GUID: 0-MOCK_rBI5AUaFmVpI8Jh1UEfiEt_8l
X-Proofpoint-GUID: 0-MOCK_rBI5AUaFmVpI8Jh1UEfiEt_8l
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26bcfc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DXfNKwVoJAfSTobcJs4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606080123


On 6/6/2026 6:15 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 01, 2026 at 06:25:12PM +0530, Komal Bajaj wrote:
>> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
>> EVK boards using the WCN3988 combo chip.
>>
>> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
>> board-specific regulator supplies across CQM, CQS and IQS Shikra
>> EVK boards.
>>
>> For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
>> with register space, interrupts, IOMMU configuration and reserved
>> memory. The node is kept disabled by default and enabled per-board
>> with the appropriate PMIC supply connections and calibration variant
>> selection.
>>
>> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++
>>   5 files changed, 223 insertions(+)
>>
>> +
>> +&wifi {
>> +	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
>> +	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
>> +	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
>> +	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
>> +	qcom,calibration-variant = "Shikra_EVK";
>> +	firmware-name = "cq2390";
> firmware-name = "shikra";

ACK. I will update the name in next revision.

>
>> +
>> +	status = "okay";
>> +};
>> +
> [...]
>
>> +&wifi {
>> +	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
>> +	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
>> +	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
>> +	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
>> +	qcom,calibration-variant = "Shikra_EVK";
> I hope this means that calibration files are common across the boards.

Yes, it is.

Thanks
Komal

>
>> +	firmware-name = "cq2390";
> firmware-name = "shikra";
>
>> +
>> +	status = "okay";
>> +};
>
> [...]
>
>> +
>> +&wifi {
>> +	vdd-0.8-cx-mx-supply = <&pm8150_s4>;
>> +	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
>> +	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
>> +	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
>> +	qcom,calibration-variant = "Shikra_EVK";
>> +	firmware-name = "cq2390";
> firmware-name = "shikra";
>> +
>> +	status = "okay";
>> +};

