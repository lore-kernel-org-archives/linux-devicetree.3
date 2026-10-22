Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679079;
	b=i97egSC1e86ne4/hQgHQe0i2HyxvLFNBLJ41bgdyN3tM1PdzzoomDVwDOnNVxPtY1qUm
	 2OTeFNWqwdVv4qEujOPTwHVEqUavq+FnFR+9mrUGXM09cz4jxPbPHp2mL0sG2sCeo8DH3
	 bzAhGxLBskmzFM4LjI7tZG87+x70JOv1kLX8ov0+aox+BFzWGDRhujaF9hXPrFftAdaDn
	 vn+9h1vNxNufYozaZ1SljGiF0PhbrhmRfaTy+SJYN0JdNMsr9Rt0Ypz0RSE9/OqFBrKdV
	 GnNF0c89pp4C/Wx1G6cbl0fPZGg7i7VuY7Pq4cEXxyudlTkImOHw3aJPt2ToJjshErA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679079;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Iorya9CJVmbbeV06oongNxWV99dGCu9hixBeNSCACWI=;
	b=syFy49wOdt/T32s8gxuJdt9RFzwDTbHGpT0wN7FnnORW9u2Gxj9sLfo/Yf0DioSTZ5ld
	 StdnkbYao6/oaoGIX51Mxh+s3W+HPbsdKW5d+02Wc28cIyTMbXjC5S68lsgIIW0c5ifVG
	 AbI1Dgcy4e71M4u0si0FPKgpe2mGZPPF2k4QSzJm3XCVu3p/+JeLKCBiwDW9MiL153hBh
	 ImR2cWhkm6yaaQ9jRmI/TDXvdP4H/Q7kRuqpOst8beKf06gP7sSgMLcDcdMpfW1zqlos6
	 EDq7o8BWh3FEaBaAz7qDbmqglMgy4+gWwIZ/rn31hKLuw5KIJ6tuPfZfPfpcbzX8/Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Be6NBfr9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NVZCD/mu";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E71F606A32F
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E71F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Be6NBfr9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NVZCD/mu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0MEj2398914
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iorya9CJVmbbeV06oongNxWV99dGCu9hixBeNSCACWI=; b=Be6NBfr9WxHlkwvF
	6nOUpLIAC3TICYgkTGSPqkQGmc9FrbjdwwbEoeyHY4x0F4/oPnHenlt1Ed9kc2Hu
	jhAiWVqtYm+bO4j5UPJaLOWq8OAL80XWTnv8l0j7n+APsNAuw1Gkh9KD61DwQQN+
	lOQzfqTo3WkpCSZsUjiNGvviNfyK4OYpTTxyAN9bqw4SU3yMczekcce5hfcfyR/3
	+3HeutSj7kN9AKcFVnLGpCtK9O+FkzZxnnw93IbTFBDw6Zpzd4dbv+fdIzqdqsza
	wNQARzANHSc0UN5oOnySx9p1vBNM/MU/XOqmgSq1rDh5xrXo4IsghUysItnogfRS
	szIYNA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93buv4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:39:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3048213eec.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792676393; x=1793281193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iorya9CJVmbbeV06oongNxWV99dGCu9hixBeNSCACWI=;
        b=NVZCD/muE0lO60jqUZKKgtOyvNnOmvIHPHMpENRJ9MFesMq5HIM4e7aaNAT5m8FlzB
         i8wMySKrS2V1v+n2mOUtgeUXgG3yEMnnUhoFE+FfHwcoNN0z1jEdATXO9a0S3HrRwiSt
         VEbN1A3V6NoSGJnjw6H4XSL8SqEiddkKq04tOdpFtt5jlUu7eneVaGHxabIGUZJhIdXQ
         VGlIJdqcs1xzOyMXRH+T4oeUF4Kwb7OcvrBUCiimnxiSHCrbohwmAfKc9V7b19lB676b
         ThWpPSYgamnOap4DplpqCj5dU4P6USpYroA1Iw6Douqxuc7WR3xRE46EXop7F4YjyjF0
         VQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676393; x=1793281193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iorya9CJVmbbeV06oongNxWV99dGCu9hixBeNSCACWI=;
        b=UwEYVfY0B7zBsisydnMbUqMbNxCfDEsFExMjqh/zidDAk5F5u8s8t06HsxgapaQMHM
         hTzLcDr48rdVvWPN2s1WFXm35wk7b5xD/yHpymc5bhVAi2kNLRgfQPgPHTomeXx0XXG0
         ieFWfHVUyQVObTWvv+VrLVt2j4xdtjkZtkJksuNS2SaunC/hnIMdPmA3rh7NsgyRRwsV
         CycC7j7MB19fuLRa6NBzSeMMRw+QLORAyCpK3Uow3SeSMrktL/8v4I53DwoXAe4fWk6S
         aoIaKO7MHC1uNsUv88PA+7MNICDjge6fBVdPkTZhz8V4/ymn2Oos0OZn6TyusAueUk+u
         24PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcMD7xhsogFSzFbSO0ITW/Z3I9FSuAL5K7TtlQjcOmZoQR/ctEQ6pvc9FVSpNzoGSoNuSqwFcZzi0m@vger.kernel.org
X-Gm-Message-State: AFq9FYKKE+E7XVTmKc3JHBcwK3sQbCYJkgDgJr6RbfZE1kfGA3/xKsgl
	UGkVP+9cq8xdgMa+qIXwBVQ1dYHWV+YJ27p5qopzppOyBJwGRnu6YVBwS0btbrlGut6OnfMF5zl
	RhTpBS7mr+AMWDXD3rIDtB6fakNmx6hGaX1gtcuB4omQId4+m0ATp6COF7Tin6tqe
X-Gm-Gg: AYBFou1czj6mHUdhauJ6pf/fR7OpzyFG7sX39A5ynp66HPhcgCYQBXEV+dx2VL5s4iD
	d38mqe9GqjU44edjSCFRBiRo3wzrk160BajfEGF8gMaXil8RuhC5ZNGqZ78B2QUnKkNXfJ180I3
	4FmbFaQEv6/EGKZYysmzmjECig4mgKLW6fzJTkGCN3ZBPDdaR+3FT+VJDuCN374GMLE+wcgMJx8
	1V8nOf9Rt+4qt0pWQk6TpiOohYtf+2Hp/0a+Ux8imaK3fVpkkH+fnaMfo4FqWwt+AztpVyPrGfp
	sCibnV6uAd1A/15Kn0rF0AbM6f9xo7Q2hgljl4WF5FulR7CFpunvLzJFPnsl/wHpKTYeI0fb5aj
	O/ExkbznKa9cfhlU9WeRvxNzHWAAEGw==
X-Received: by 2002:a05:693c:87d3:20b0:369:7c:bfce with SMTP id 5a478bee46e88-369008c220fmr2325126eec.14.1792676392927;
        Thu, 22 Oct 2026 06:39:52 -0700 (PDT)
X-Received: by 2002:a05:693c:87d3:20b0:369:7c:bfce with SMTP id 5a478bee46e88-369008c220fmr2325059eec.14.1792676392215;
        Thu, 22 Oct 2026 06:39:52 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.235.141])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367416a1fb9sm14556522eec.20.2026.10.22.06.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 06:39:50 -0700 (PDT)
Message-ID: <f83c366e-e3fe-4921-8407-ffa90b7f933f@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 19:09:42 +0530
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
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kodiak: use thermal hw-bin trips
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-5-5a29be7e8ec5@oss.qualcomm.com>
 <9800eb77-0188-4b16-a672-adb7ee1a603c@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <9800eb77-0188-4b16-a672-adb7ee1a603c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s6ECFUDhcKPC2-NIltitNiZ7kyQZMR4v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfXwtzYKzI3x3Bi
 SUv/Fx/Dz/0xdm474hxTv5CdHfdOnbLaOjp/oTP4gqZIzhCr6NIjgJ5JF6E/rBAYh33+m4KUFaD
 TJcAbXEXONT+Vf5ohlAYzfndwE/BPiU=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ada122a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=8wa5AUNoahJ04lRaSfAPWg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2wNLjvyEnIyB1ESV7yEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: s6ECFUDhcKPC2-NIltitNiZ7kyQZMR4v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX7iMPjmAUpYjB
 s7h4jSHW/QQ6/sD0eeVO4fUS3OPpmjtIiUmCwJlVGLJVBbeSTXdM05JiW6CxDd66oWvqHot/tsh
 3kO3jDARQMwPG5z+mASMYcPH4mEbyLTI0KhBPmXLOt8GBOhtvIS+lAgR0Nng0wiuLEGsb9ZJmyM
 u1nl9Arg99f+vgRnlmrt4xOsBLuJUjUQe/z+S6EVOtzALjT3QP6CQTZDUFsrhAgxQB28uc0c13b
 P1u+RMaFwBJGVbw5/+3sS7Cu2fjUUzAmXbBRzEL498XTMj4Nv1tgSiNtz8iqMR3mUltXMTauNus
 sRmITadgHPaJDDAww+SQd8RspyNGq0p2GK3H8YaScHBqu5/yGxX7Byub5lRh6tXmgC/zQqhkjs2
 RKpFKSTEr5tmCSlD175Pq5QWyUSjiWUWe990vsPM72Nk48S+ySITBVHkKp0dfsiJ71nlaeLraNm
 LZ61kKWDTMtw8m6VruA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220054



On 10/22/2026 2:39 PM, Konrad Dybcio wrote:
> On 10/2/26 12:47 PM, Gaurav Kohli wrote:
>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>
>> kodiak-based SoCs are binned at manufacturing time, with the bin
>> computed from the jtag-id and feat-id qfprom fuses.  The tsens driver
>> now reads these and feeds the resulting bin to the thermal core, which
>> selects per-bin trip temperatures.
>>
>> Add the jtag-id and feat-id nvmem cells to the tsens nodes and convert
>> the passive mitigation trip points from a fixed 95C to per-bin values
>> (95C for bin 0x1, 105C for bin 0x2) using the new
>> temperature-bin/thermal-hw-bin properties.
>>
>> Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 56 +++++++++++++++++++++++++++---------
>>   1 file changed, 42 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 347815e5983e..f3bb9cd8f393 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -1019,6 +1019,16 @@ gpu_speed_bin: gpu-speed-bin@1e9 {
>>   				reg = <0x1e9 0x2>;
>>   				bits = <5 8>;
>>   			};
>> +			jtag_id: jtag-id@180 {
>> +				reg = <0x180 0x4>;
>> +				/* bits = <offset width>: 20 bits at offset 0 */
>> +				bits = <0 20>;
>> +			};
>> +			feat_id: feat-id@180 {
>> +				reg = <0x180 0x4>;
>> +				/* bits = <offset width>: 8 bits at offset 20 */
>> +				bits = <20 8>;
>> +			};
> 
> Couple nits: please keep a \n between each subnode

thanks for review, will fix this in v2.

> 
> 
> [...]
> 
>>   				cpu0_alert1: trip-point1 {
>> -					temperature = <95000>;
>> +					temperature-bin = <95000 105000>;
> 
> Please do <foo>, <bar> instead of <foo bar>

Sure, will update.

> 
> Konrad

