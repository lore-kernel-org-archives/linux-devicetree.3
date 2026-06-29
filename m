Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E8F2DB788
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710461; cv=none; b=rQmbcaPGnVAAybOcZBPX+F4XlkR/cT/Ys+U8Z9jNO57hQiYOYo8VkmRY02Mh97wNYCMAqppnUh3jf0n8FwEtwIbi4K/oMEG3VtiWXthJE2VCxBDuu8R9a5qCxfYne7aoS508v/IZQNo8JNty/DjOfj4vnnRgE3hfQw+sIQBixnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710461; c=relaxed/simple;
	bh=2WOdzPUG5PUNeTf0BqyCqnl/mvY7CXGX0jeuTNkSMjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZEc/Z9OyaLdDxqVXW3NCst90rRWyDkmee4bEZkLPCRHT/ahXi57q/Cg514KehQJgN/UWZqp5LNAjtnehImvFhwkQiDsPJU9AF+Is2H4Dug1Lagi2kuaECDnFItl+4bh43gjMV+RCw9waWrtkwhw2Ji6nbkbkjOuQrxBLlC75K0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YY4OjkzT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dxKye+5W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YY4OjkzT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dxKye+5W"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHPl1787649
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeK3bJgoCKDPXj7jg82bDuQiHQZGh1KsuSqDPgEOFTI=; b=YY4OjkzTUiPvSbdl
	1AnIgnP0Okf+79VT78dFk0WDbyBRoGcm3/WWFucjPQMDVPu/yaf02NKTJL41xMCn
	7QGJaT8XuP7+kzepxFUHgXjqjsC8l/185ojfKYoexyyuqXYX+cZe4QIQgU/A30op
	wOMe5xQQAzT8NFKsNme8lrnWx9NROMNVUpOkwCSIWDM9OeT29ErqxBhxjkse4uO4
	Pur+gQ5BJp7mIEyYDZJajcPcYnCIImkzWKUy3+XNhkKs4HMPyFiRYfgBBXnCgd/Z
	MCZ/4Xm680q6rVST+8xpwIEPUBI/siMbp4CxYhdFYQK1EIRyxzho5CFjtLtxIVsX
	C3BTXA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tuvmf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:20:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ed9113e03so7268eec.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710458; x=1783315258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QeK3bJgoCKDPXj7jg82bDuQiHQZGh1KsuSqDPgEOFTI=;
        b=dxKye+5W6MUArvzURzAaAdHluvgWQQanVBYAFjkKc2iPjb0WHJYR4jhPZ0TqMTA8pv
         36jqYC6ruW/fU8/pQq4xlSiTg8iLMhRHzSIk968GkaBu9joYaHlKdB+l3Uir3U24es2Y
         Su/ASrBlkFnonyNeXRD3PP2Vuh7VGnao+T9MvzV8L4UBKDR6jj1HaJD5Ja+z4wWRL0OW
         j1c97qiDlIyuTyiCRgqMMcyxyRBlhClDE5J6cEs9Y4LWzp42jsXdTfW4RFZQ+uO2BWQF
         KDFYngl9iI4TCsAeQ/KCnWq1yFwOkjG0PDMson6fAbF/vQJyn1JzhSkC8o0Hg5qsXqYH
         /zyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710458; x=1783315258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeK3bJgoCKDPXj7jg82bDuQiHQZGh1KsuSqDPgEOFTI=;
        b=N+lDCLjmXeNHvqw2+DlOL9YuA7qlQCyWaADKmipLpC0XS45XOHzttpDN3VTrz6FB2b
         DCTjOzGKft0I8FTm0nWvdfWOnH0S3w4OEkeB6MBYf2IKgyvUJpfOBYvE7UtK6JojXgz4
         PvKoUHYSop5Bep/PPhzccV0kVPj9v7Pz4vi6UWhY/MsO4HF93bJ4d+6tfGDGoe9/ZYyL
         I2mb4jUeVgvR6q/uzDPAHvd+JJcBHpZa67MNFXJKEq+GDDHhljspDW4mukTXPu0KmXHN
         6BRtvzNJCIHSJTPXW+ObJPwe7h8qmfJ9WyrFF66sSTRasz1Iqk5E4VbZCDjevwITHQwq
         Uh6g==
X-Forwarded-Encrypted: i=1; AHgh+Rrj3sNGbxpIMu1opkPq1zetGRK2dB2WlY9ZbhZ/BHaXzDeuoK+L2kHYWjPPMC/vMRObidMI8N3CIaSs@vger.kernel.org
X-Gm-Message-State: AOJu0YzpO1eNWoyBEqlUlUU1fYkwtYkWTYBJLaLFDL22+ljiSkGy6Nrl
	IJaNbb+KlRQb8W+82lozSigW6gwDAG/P2p0jqRcB3acLDYgwn4PbdnCPj1AEyVWv7kpZd9FQFls
	9wr1TPUIRuLWFy563qKsu0WwvozHZKLEekgGQ3tZAmGmOTLvEz21FWdf8JrQvFLPI
X-Gm-Gg: AfdE7ckOdZ89F13L78YHm1lMYWH2XKN36rxZ/uppv6Axrg2cA3KlHUUfGnVkc7TyoKz
	uXHTbKxQ0zFo5Iq++Kuh5QG3Fv2muaQCE2z+wK7Px7oZle694J2hLAYlSahaV3O0ZvLNoZniNO2
	Inx8b0lMALKtHtoMksYWTklsD7rHqgC2Tj3F40Ig8pmqQwTAuJ6UVdU/Va3FKAhRFNmcP5HeJxa
	S5jpviojTa4sLfAu70B3APUVsh/yDOqLndMgT2f3gWulQVm//H3L553KO9FFpPaxYjfLYTVoyLP
	IqUuh+W2z+tlJBPagnOyyn12ORun1flKIBbEb+LLm3lfnVh333NV3h4qHV0LSjL1QQqsjkr8uwi
	EutQSx0qt5KXp9HEl9K3M6+/NXjKGdZ4J+pfDiA==
X-Received: by 2002:a05:7300:aca8:b0:304:70d0:4f03 with SMTP id 5a478bee46e88-30c858d23aamr12222756eec.6.1782710457841;
        Sun, 28 Jun 2026 22:20:57 -0700 (PDT)
X-Received: by 2002:a05:7300:aca8:b0:304:70d0:4f03 with SMTP id 5a478bee46e88-30c858d23aamr12222738eec.6.1782710457322;
        Sun, 28 Jun 2026 22:20:57 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm39914896eec.5.2026.06.28.22.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:20:56 -0700 (PDT)
Message-ID: <4980d925-ec32-4632-a377-d65b9ac1d152@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:50:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: shikra: Add support for AudioCoreCC
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-4-7ee6b5f2d928@oss.qualcomm.com>
 <b3a0fb12-5595-43ba-b552-cbf06d1f9260@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <b3a0fb12-5595-43ba-b552-cbf06d1f9260@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX4utb7bUnaKiw
 ZtZn5WqP671LQcWKYg+gROdmrXXhOWPw6eep4wMYwrp3LGhVy415jbDdk0JQkOJDSuH21e1MtR9
 ew08Wrwq7DSLiEIDoCSG222M0GL+eYU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfXxrGZHzR5VxKj
 8teEsDkl4W6bvYnLQ1cfpt1I0nWoMFi9wyYdhOa7QVShZDHuVuWslm8mlmacKZQQjTOncxLmE4i
 AYfuG+cmFHWl8Cov7LzCUFzOQfur3izxSL/tsK207vcIXApSvSsCWIyu20xQ3GD4wS6YUecKt3S
 MoqN1aZ/TW92Dmugju5s0aarQWoeIyzKg8GK2Avt2ijMbFw+3qkFASJAkpiPQMRJFVQL26SmhGO
 2DcWil376Jb7mC4s0LjoG9RdsSH34uSiLuTwvVkeE+ZIXRwP8GTNHo0dJPRoZFWGVMSp+4r0/XU
 eCc6yyIxMFa/lCKl3GOEjtdu8BiPN+5NBgPDn8Zp8QIC/nyZVpyGWLmMR7xHi2cBjv0fv9TbBXa
 06vov5ZnZkz+nwViKepmG5YjhCCj3wnIZ75DA40YNOXr8t+FWh72JHsmAhrK0r62UmM63CGROEi
 CxwakqO8KrBVIcG0aqg==
X-Proofpoint-GUID: BVW24pP3GeRd_jfUcSJYKOJgQzXQaoyF
X-Proofpoint-ORIG-GUID: BVW24pP3GeRd_jfUcSJYKOJgQzXQaoyF
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a4200ba cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SiY_No2TDSAPns8i4EEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290043



On 11-06-2026 04:55 pm, Konrad Dybcio wrote:
> On 6/5/26 1:26 PM, Imran Shaik wrote:
>> Add support for Audio Core Clock Controller (AudioCoreCC) node on Qualcomm
>> Shikra SoC. The CQM variant requires both clock and reset support, while
>> the CQS variant requires only reset support. Update the respective device
>> tree variants to enable and override the node as per variant requirements.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  5 +++++
>>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 13 +++++++++++++
>>   3 files changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0883c480bfbc80d7bead966b9ba932dee8a77bbf 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
>> @@ -23,6 +23,10 @@ chosen {
>>   	};
>>   };
>>   
>> +&audiocorecc {
>> +	status = "okay";
>> +};
>> +
>>   &sdhc_1 {
>>   	vmmc-supply = <&pm4125_l20>;
>>   	vqmmc-supply = <&pm4125_l14>;
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> index b3f19a64d7aed3121ef092df684b19a4de39b497..b5e3d573868a836ad5e5e8eb3024cb5fb71dbb4e 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -23,6 +23,11 @@ chosen {
>>   	};
>>   };
>>   
>> +&audiocorecc {
>> +	compatible = "qcom,shikra-cqs-audiocorecc";
>> +	status = "okay";
>> +};
>> +
>>   &sdhc_1 {
>>   	vmmc-supply = <&pm4125_l20>;
>>   	vqmmc-supply = <&pm4125_l14>;
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..f15757d52af04d8cb5540354a239127cb0d174a3 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -4,6 +4,7 @@
>>    */
>>   
>>   #include <dt-bindings/clock/qcom,rpmcc.h>
>> +#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
>>   #include <dt-bindings/clock/qcom,shikra-gcc.h>
>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>   #include <dt-bindings/interconnect/qcom,rpm-icc.h>
>> @@ -640,6 +641,18 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>>   			};
>>   		};
>>   
>> +		audiocorecc: clock-controller@a0a0000 {
>> +			compatible = "qcom,shikra-cqm-audiocorecc";
>> +			reg = <0x0 0x0a0a0000 0x0 0x10000>,
> 
> This is called AUDIO_CORE_CC where seemingly all the clocks live
> 
>> +			      <0x0 0x0a0b4000 0x0 0x1000>;
> 
> and this is called AUDIO_CORE_CSR where seemingly all the resets live
> 
> so it would make sense to split them

Yes, the clocks and resets reside in different register spaces, I will 
split them into two different nodes as suggested. This will help to 
handle the CQM/CQS variants requirements more cleanly.

Thanks,
Imran
