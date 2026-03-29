Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2155F29B78D
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 18:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774808158; cv=none; b=T7x8GoDczDhqho0SwcXQcrmmCPvSfO5lGlML9Y2jq7uNE4UGvuZO3RwiXfSmj6RKeYTF+J2K0i/2aVadghuQCDxrYDF6HedZOyEf+sdkQ0MZ7Bx4gzivHG5RX582kJ81T5SLyHvpywLZRovRXFW50+SEkB0C5yf/O0copiDpXCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774808158; c=relaxed/simple;
	bh=y50ZCs8bU8JQGk7/n2N6NuoDk/aWdBuPYonIlgfj18s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fed3leA4CNLL9LF0C2nKXWTFxi/MAQWrZO05c6BD00Os/pyftL73JX8XbAZptBBDdxhXivra5SH6URlMuqDBBndIXduJmsAS+12wHxoXwjOX+P2Mf0aCyX1MBbF3Bz+tlCzrN+paMtRA0Yyk0VCupCoqpR1zuKKInx2QG/jQR8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnnGnu8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVy2tGeK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnnGnu8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVy2tGeK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAil2G4088648
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 18:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3bvGqX0pq5rUEz06cGfEkc0o4YS86YR3DLMVjyiAgZs=; b=KnnGnu8sdWUKWT9M
	t5qqlRNUtax5HpMqdxFWjcITggDsRPwiLwpNv1yk4NA6PMbT2U6/mR2iUBE0VdJB
	gpwfrVsn8flTQ4kPgpIrLC8lbp6MeqE230DRmg7N8rC5HFExDS3GvSP0kuq/Gbkn
	ERUs0JTLwJcY9yGtVq9z9c8fvt9ckpNOZPa+smf7GUGdpQEnvskroPCx0oXfs0Tx
	t0Rt+RSy8nG2zaDSCf/iq0xYAPZrjVoWV29csXD+oO5TMEhMoA8PwJ8LuGBZicZN
	3pmQtEdk6y8NaZZHq3xTMvyTrlddfGoAtYK7sTP2NYuVdV2lbMnjpreh0ChwkMjC
	Mgcbnw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67713c1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 18:15:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c1631e6189so13234425eec.0
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 11:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774808155; x=1775412955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3bvGqX0pq5rUEz06cGfEkc0o4YS86YR3DLMVjyiAgZs=;
        b=cVy2tGeK8FS0jtegRYwYqwXHSal38l6ZMKS2u2wSIksPAYLMRuuTrA8TECsxU+0NJC
         t1/ZFZNjJycLDPgxF6ZpGsrjQeZbA4DCiLXzZUPvyGJ+VOIRmPyeUwYIeetPeMYE35pp
         GX0EBtBkNYjaHAPlggSVXPbx08KwVYicmBwY9ncBIvI9C26sSyNMIAHpGIIndvzawfg9
         zsucFOtSkH01I/CNTZ1Lq5uXuGBIGfi2h2LgY9Ybncs034OrS6UYUDZuIesxqTmO24Y7
         vHWVMpm1SK9/eKdX1zJzhKepTTWfUzIYFwBUwG3PG8DXnQKtKeNO3fMbjFqSOcWtt6nM
         cBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774808155; x=1775412955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3bvGqX0pq5rUEz06cGfEkc0o4YS86YR3DLMVjyiAgZs=;
        b=drd6sfM3/yonwcihwGjDrOFcXGtBuaLsSlxAA9ezZhjUtHvlMR0mdIx21hUwG0SirX
         QDwJCYuLCL4ciIT1p1cUjh4JVoe5UUCGmbLH3U4/UP0UozrjVaH9f/Z05JaZgu3AYqkT
         18Bd22NeZmtwsxJiQsuUNOVLpfxEtrH+XHJAHmAf+9RZq3RgOAQl1O7FnAWmzNN7SUAk
         aVbCDQ/bwiZYI/ZtSQSEPCFFR/a53dsCeONqwVrcnOJko37K3M8W60M2nbmDjVGdXMMS
         fiBtPy5ZVxKOrN2r3xK/0JfmwGD5CFziG3W6oouK61FUKD32GYrPtRQqBF83DKQSkPmR
         vLtw==
X-Forwarded-Encrypted: i=1; AJvYcCU1NHdcMlip/iKTSilBzYM4kwdmkLqyv81NXHcuENLwEfKF+3RlMlydTfRnEYEy9D7+N+donl0nQ6V+@vger.kernel.org
X-Gm-Message-State: AOJu0YxX4+OysZE0f2/Wy8KJSD3OEUWY3Rt8eaBz7BDEU+QcUjFnIeLr
	+xHzqIj6jgh/tyBGzUkF1BbbsKB1dg2QKy9Tng7xZX6lCtYVdFiOCgT1mnI7eVXHuEsWdHzb+wq
	zRmHV9H2BQ067KB5XqmgqTMVHPfetd2dN3etN+zt2Wgyb/jCALjOmBPBimwksA9QC
X-Gm-Gg: ATEYQzwGkb4WVpIZ7iEodL9iwa6lSZX3Pcp3njod8kKRKqBfI4S/eWsj1ixfFMWmDBX
	TxPC6SoSUVJA7clN0yAYXpKrcsc+eF8ttWMjQD6u+JpFj3/2ylY0+lDFFCVoI7kiv2ZbYtX/XL4
	C3eLnDq1ZNipGxNyLSK/j6/4RA/nrtF7EITYKmiOSh9O/SkO9+cjkyOEUHEB9gw5SOXRvJUai9S
	OIMH6KuDd04/XDyHaEP/UdUc+cj38GDwoiZvxVgmXCbZnelWBu55vUp5NZPW9GhlcRvzUKlxh2j
	p/IceJBNA0hbQ8aJTkdfBUf1Y1qDtRgAERP6COk5zl1Ljy8HB+Tl0HMooUsyvigNMpX3mumM43Z
	uOWq97OU75VDC9D9gGzELfPkxUu+Lx/709bCquoP3j64y5UzetDvwoW2myQ==
X-Received: by 2002:a05:7301:129b:b0:2c1:5b23:1752 with SMTP id 5a478bee46e88-2c185f5a3c7mr5237865eec.23.1774808154528;
        Sun, 29 Mar 2026 11:15:54 -0700 (PDT)
X-Received: by 2002:a05:7301:129b:b0:2c1:5b23:1752 with SMTP id 5a478bee46e88-2c185f5a3c7mr5237845eec.23.1774808154004;
        Sun, 29 Mar 2026 11:15:54 -0700 (PDT)
Received: from [192.168.1.3] ([122.177.244.238])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bda147sm5052425eec.5.2026.03.29.11.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 11:15:53 -0700 (PDT)
Message-ID: <eacea84c-ce3a-41eb-835c-7da55d130d88@oss.qualcomm.com>
Date: Sun, 29 Mar 2026 23:45:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanpaali: Add USB support for
 QRD platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-4-krishna.kurapati@oss.qualcomm.com>
 <qycxxxlt3koyt7snnwpkmpo2udskhad3l5vjpj3mpdi5qyoriy@akxv27lrpi3n>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <qycxxxlt3koyt7snnwpkmpo2udskhad3l5vjpj3mpdi5qyoriy@akxv27lrpi3n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LlubY0-hlC4Xp4rzjoSXVfvBASK1zJ_i
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69c96c5b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=0PkvaV8+DZ6AO/3G7kZGsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9EumiePKSsg7Rv69g3cA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: LlubY0-hlC4Xp4rzjoSXVfvBASK1zJ_i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDE0MiBTYWx0ZWRfX4bwoSX2+aKMm
 e59GcPv6Tq18UThCfjTTF4JU27DiWkGKE2RwSUUYaSisdjPVy7oRc/2qrGZEDG8r0c/wiORM+bV
 AQQW+VMIdez+xbMd7OEzoV1G+2b1QpzOSWTXx4fgwstzyz/27nNtUDLE/xZ5qQ29cy8MF6pk8NU
 AcKtSf1Dqq8a6z4JXI8PdJ1f/v2NAkoPy3irjiw3Y6xpAXNb5amXEkHYXAA6P+gWywRXLLwZxOO
 AHyFev4I7tXF8jfA4HB7GppJDausiv7pOrr3wysvRGOzyHsetm+z5xAFmmYeNG8wgBlfkemtItR
 zWbwU9zAk1abwZdA1Y1R2M5PXZMMxFg4pQ6flk9/l5LWrGy//6+EKfy/IZ2Xh2PF+OuOEFNA4dZ
 2ipv+ljVVA5Btnd+soSp+b5ri8RoiJx0im+9iKgP9FtjrPtOgBH/tsfXuS7wZvl54QwuVjOVdSz
 3lfxoVkjiJD9s34NCmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603290142



On 3/29/2026 11:37 PM, Dmitry Baryshkov wrote:
> On Sun, Mar 29, 2026 at 11:22:49PM +0530, Krishna Kurapati wrote:
>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>
>> Enable USB support on Kaanapali QRD variant. Enable USB controller in
>> device mode till glink node is added.
> 
> Why can't it be added as a part of this patchset?
> 

Hi Dmitry,

  SoCCP changes are not yet acked. Hence I wanted to get the base 
changes in.

Regards,
Krishna,

>>
>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 27 ++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>> index 6a7eb7f4050a..1929ea273a4f 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>> @@ -80,6 +80,11 @@ key-volume-up {
>>   			wakeup-source;
>>   		};
>>   	};
>> +
>> +	pmih0108_e1_eusb2_repeater {
>> +		vdd18-supply = <&vreg_l15b_1p8>;
>> +		vdd3-supply = <&vreg_l5b_3p1>;
>> +	};
>>   };
>>   
>>   &apps_rsc {
>> @@ -821,3 +826,25 @@ &ufs_mem_phy {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&usb {
>> +	dr_mode = "peripheral";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_hsphy {
>> +	vdd-supply = <&vreg_l4f_0p8>;
>> +	vdda12-supply = <&vreg_l1d_1p2>;
>> +
>> +	phys = <&pmih0108_e1_eusb2_repeater>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_dp_qmpphy {
>> +	vdda-phy-supply = <&vreg_l1d_1p2>;
>> +	vdda-pll-supply = <&vreg_l4f_0p8>;
>> +
>> +	status = "okay";
>> +};
>> -- 
>> 2.34.1
>>
> 

