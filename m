Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796028;
	b=OGBM5Lqydze35Qg+wroK+vrOfF9assNA52lmMcAQBAcJBPuZoFogElI+NVxvDPtKpP5v
	 vlxQqrYgFnsJwDclrOFiRB+RC9pGS3EZ1Tes9LDC3ceg1ZE96iFZ2ySgNZjjVJ7UZ65EO
	 0x4223J7ll7AoW9D/uGm2ocWxDipYvzuZr47NcUg/cPznPEr/4Efbwfy75xTlVfBLUbU/
	 6iD6VtxtCMWB6ni9OohSUE9zWfXnU2CI28OFbujJFaBw/bmrOZwx+wbprfmyCsxoECM9K
	 XTsbxK7+YnChJVhxqowIrBMxHP0Zu6PZomsxiEmjM5zaPhwgdQ9K1NKrrUJEVNwdNQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3JK3zLqAxgD4t3oDKY8+G+aUNHzEUIyP3YZKLoNRsEg=;
	b=Ea5SlIYwcYKphU8v7i58b+PCjgC28j+KTMWrQ6M5zsBB3D6mzF986Sg2GZAcb9IshVIb
	 IANhi3ort2gzL6O6+3X/wt03S20rW/RGRC2FEO1VNStZnVkKP3kN/05WCYhIdlkweKDcp
	 c3XwQ62JSmbUcGyOW9DV78gM2HIe7HaFKPbzDvBYegZmxINFLy2SlDngvj5Xl5xfqQyub
	 JAJEgSK/WKnkeAWsoBE7zKYWram2axngQZta2pGySgP5D/DKxoHUcFyPZT/jAcU1caorH
	 j9MfSzl+eiT5SHm6SeiwRUMVfSGYYgevZ8WVCwc4egcwDt/55qnKmDwX9ppjk4X+v/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwNMbCnV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HqCcLWzP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B18606A32C
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39B18606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwNMbCnV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HqCcLWzP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba4gY2310265
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 12:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3JK3zLqAxgD4t3oDKY8+G+aUNHzEUIyP3YZKLoNRsEg=; b=iwNMbCnVEl0qopmM
	z26LlSp/6onxPzfFrIGHpglgjNeNDGufF9VXPf93ENI+VyvjD9pF29uTSDT1XaiO
	lz2rCK2D8eIjdEZ8do4oxZyV/YxdxJKcPGsfAXU9cUsmkxKQVPatRYat/4steeZd
	FCPo0mFOC2nvDHg+nD9FvIoN6VdK+7qgaVIRWu60CH62c38fg9CLLhR5jexEGg2k
	SenFpC1jxWAd4oCysGV+rNVRxv/qKg0CTHLLIpIV76buG4Lu2OJaUpBHcpigcrA9
	Zf83vafsU4zKsKCUnyITXUGrWlCBXYXL2nwoK9mN9UQP1kgzn361F4zIYNY6FKFv
	AhMwKw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8muvc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 12:40:27 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8255327a28fso778381a34.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793796026; x=1794400826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JK3zLqAxgD4t3oDKY8+G+aUNHzEUIyP3YZKLoNRsEg=;
        b=HqCcLWzPcOh3EzSlHDcXplinyJKG0GBnwxFKSXylRXXdtpQgDCaUudXgGAZCa5p+jV
         AfvJchX7XlgXyYmccpvT960jDMvmPnaf5oLm7M5X1v5Jwc9mvIUBnJ1Y6/acKcMQBPix
         JOfnMVeNXMggSKTSgzmC7HSPW+kfdEh2T91yThzsqY7f1j/uz7VYkK+qVzbO2bdr1Yxs
         HQncNpi4OYEqP8S6Mu7gANXGmtBSiLBaIXALBtm6UiBi2coYQpudD5QHw8NoSk7lhoCm
         GVwiiDvE9C9FvxrLftvnm82wOymt2G7k3vjYbLqGOfUhtLKFA3Yr83LJNEIwdzfJKvgy
         xgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796026; x=1794400826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JK3zLqAxgD4t3oDKY8+G+aUNHzEUIyP3YZKLoNRsEg=;
        b=aSXUgyh1Vn/VYM7+0PJnjWmD9xMZUwmgMwPWsa+Xf8RBuTtt9b0YGA/s3wapVRFHPL
         +9MNt8YiOHxwk641STxbPLweNI5cieQDdmhfnoeYwe7FLR+9QGMrF/EbHgEKQOMrA5QA
         CY7TI2v+3ixfmc66CAtGAda+chy76bEwcFLv5G7KcQBXyaa0U6CLwva16Xg8tF0A7UHk
         sGg97Yir06K3pnR5DskqJBpLsXBukelUIL6xHjyS4yKf01SXjZxce3q8hsQ1dJ4xdz9i
         t0lBO5BoLkOWisrhQuRv9fRb+E3p5yIliTK1MALexNx+4lkcpZo8Ojhdl3991UgIOSXP
         IFaw==
X-Forwarded-Encrypted: i=1; AKwUvBwe5RSRmwEh64jxBLZynOpX+OPMn5jTAJf+NR30YjG2Y68aPG6qgkbM9lhUETI4yW54bJ6hdpIngHt0@vger.kernel.org
X-Gm-Message-State: APuU4Z/saI2iloPTIuDqIYjBrMh8dGNLmRte02KAMOYS2kO+IVfxpY3X
	HnEbhbzjTe+FXDCV+BQRS4BVehNJTm+E76AvH6L8WjRus7NXfS8+ynsxB7Lqnsc0wFNJLU/cegM
	HbJh0qQ9UON8QlbAJaK/BZvxlCoI0lXZJ1VctGqAebeLQxBl7/4FuUWtxiHCqo1uz
X-Gm-Gg: AYBFou3EbGeimFuVJFIUIW2CwcBU567U1y4u9qRwU6IgckZFhohld3g1gQnO14Yx+Jx
	HCmgpWKOyGw13Fc+qFnrvrxbGz4NwSeLIbooIydOPWImEdpToEbiYSO/iy4lKluLx/1ECAcTLfT
	T+PgHPhFBjOQBLYA0dEqX3sp9OI3YICo0INq/w4pIcDyQepG9BeNrFJwLJPAhp802bu0MHDCZSz
	+w0yXFNnQ8aYytJdfSsVgn9V1g2nVbQ4juDUGBTMfJsI9MM5oJp/te30GwjOtaPMHI+fg+LPa6+
	7UiiTHvGOob3Pf2PaQ+fSkfpf5psXKKPYYPZ3DinfbRreDsfFHYVOdzWQT87AJ9fKdmTM/TfmEN
	XLTGPAjdt+P3tfms1oVaeooC6A4+EDNcJ1BwnMkHZSlVu9Pj7FVvMhsVHdSv+LNoRldI3j70nMz
	n/XzMyYw==
X-Received: by 2002:a05:6820:55c9:10b0:708:ec28:6fd1 with SMTP id 006d021491bc7-714f256cde8mr6042780eaf.66.1793796026378;
        Wed, 04 Nov 2026 04:40:26 -0800 (PST)
X-Received: by 2002:a05:6820:55c9:10b0:708:ec28:6fd1 with SMTP id 006d021491bc7-714f256cde8mr6042773eaf.66.1793796025883;
        Wed, 04 Nov 2026 04:40:25 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c12d1f36sm1517007eaf.8.2026.11.04.04.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:40:24 -0800 (PST)
Message-ID: <3463f5b6-e498-4d06-89e7-8b0fb873f3da@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:10:15 +0530
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
Subject: Re: [PATCH v4 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-3-50b9a8c730b7@oss.qualcomm.com>
 <43a57f69-caa2-4943-90a5-729e0f378b21@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <43a57f69-caa2-4943-90a5-729e0f378b21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mBbTixd8Zur3ZOtreyCpvZ-u9OoeeMqc
X-Proofpoint-ORIG-GUID: mBbTixd8Zur3ZOtreyCpvZ-u9OoeeMqc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX/PCyX55Y/UAc
 GGLuy/HnYp8kFOQhDkl6SyjgP+OLar/3zz2+t8czymt6R1Vn3OTkaRLIlRqSG7CISH/c/O7+pXW
 E3k7WmB8twoGgt94N6vAQiHxFJODRu7s9vpMnzudS0uguQ7p7ghdTqjWNEEZk/DJ6QeBICyduHW
 E25JBlMzrKPaJQs158M/SepaZ4KMRfcXTywE/9dnu4B+bwni3CBDcyTfgTx/84jyOR7xizBjKtd
 CRwcJpanOio4/tCocJOyl3bi4hLwOnM/yrXGh9JbrL1JaDzBqQpkXm0uYit0mzgPYTKmhhcBWkO
 ZKn8JBP+9n49u+C0OlaxaCfHoN4lYUUUdBGO9Y/H3iUfc77aLs9tW8xT2FKzZ42t7qvRqRaoEDo
 1rhhJ0FeCrlFrzdIvIPqmWXXOB3s0FKipLQ1kT2WQFrKEwl2PNikXw7WUV2iaZTkg6fJ1Gn1Zd1
 LnZ6keql9MzbzvrtiSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfXxxZE7vUMKINo
 l1Mtxhn8PqjUtkRTekA5j6jo8rCA4rKt5XioqHV3VY3I1gBBX0ThB8HAThkUwB+XyFny7uJq9Ij
 5YO/zU5gb6XLNZqSbBoBs71qP4mqd28=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb27bb cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IhMxsDTVYy43m0kJnUIA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040050

Hi Konrad,

On 10/19/2026 8:21 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add Battery Current Limiting (BCL) hardware monitor node for
>> hamoa-pmic. The BCL monitors battery voltage and current, providing
>> hardware interrupts when configurable thresholds are violated.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> @@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
>>   
>>   		status = "disabled";
>>   
>> +		sensor@4700 {
> 
> Is it not there on the 4 other SMB2360s?

No. The BCL peripheral is enabled only on the first SMB2360. AFAIK, the 
other four are used only for USB functionality.

Thanks,
Manaf

> 
> Konrad
> 
>> +			compatible = "qcom,smb2360-bcl";
>> +			reg = <0x4700>;
>> +			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "max-min",
>> +					  "critical",
>> +					  "emergency";
>> +		};
>> +
>>   		smb2360_0_eusb2_repeater: phy@fd00 {
>>   			compatible = "qcom,smb2360-eusb2-repeater";
>>   			reg = <0xfd00>;
>>

