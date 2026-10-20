Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530285;
	b=sCFlUB1DfnsogT1fKkX1P7Lwk+R+PF/d6cxLIVqPyIvt/xaBAQRkbHkEVOicb8W5W132
	 v7DrPLZi76qLmYTRxMmdc7MN0D9k81azScMv/8Qbgj+tGnqq27yiPEYXwI2l9dCSmQFcN
	 VxGcD3yIfRsQg5Hsa/+A5yHydcWkUc9uuX0uErbcRP2/XzA9+EFClBPRI8XJSOU2Ue+zV
	 oHf2bJufDFNBLP/a5mQxLoMSCT8felN1xFVHB4RE32HgZtzQ4+k6Xlj3WZhDlIKEN2XGj
	 Yj7qKfI1rubtI5o8XFyPyUMhLUMAteDvRVojM1Mfsbe2U02gC+DVXQ78GtEjHr5TSng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=;
	b=tNXXvJ48dtTKkd2Q1RfwGQgcKm22cUt4jndc5hVW28oV3TY92GbEGnVC5ua63yYLDBW5
	 N1ru/roaFbSid8Meef8H7vVkZaPmZkOzyljQuYQ/hkz+tqfg8EZoPFvk2R9uddGcMzNKc
	 SaWQ8OQ7geAUCauiQr6FivzE5tAt8G4wqlDga61wWyr0QK1QUhQKiGoWi/xpw/5i1vKUh
	 7riaUhBUm6gBFJPdxvb3qYhoZbMyHxMp6w0B1MydJryXKjBD1G6G8T6LbddHVjKDFs/5Q
	 dDs1xQkq5JUMNcTkGxIwtcXjrbJ3jYFc0GFELE2ASkmsJJbLDea9RRpgR2+OWg1lFQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdEK5b0u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeEJoS5H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C225606A324
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 21:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C225606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdEK5b0u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeEJoS5H
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtfYQ3856210
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 21:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=; b=OdEK5b0uuDC4pl1H
	rNfBFMks4raI2FTAL83yd+QaQu12fO2psfxpI+toA/wXxROva9zEopDXmpWT5h/B
	78RDs+JmsgRaQIS+o1S07XMwyndu6UuJ8KTcYyn4TQ8/Tjj/Yi1GZD4qBEhnKxb2
	IhPHLAiB5/zjJi1btP/IkvZ7Pt832Jcixk8FSdC89XcekOjN5L+kaZWLy9L9GLiW
	F9FPWhPX+mbwURIA+levjeMClatWVGcyAHCI9htozT8qPM/7LGWy1VznoOeyiWLL
	rjllWMgN94URv029cnS5fN2dSdbK+mPghpjqX0Ol28T8QrUmIFN2qHkDY1rKZ1l6
	6a7nbw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabgkuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 21:04:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7340482eec.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 14:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792530284; x=1793135084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=;
        b=NeEJoS5HBzjdHG6nPxFrTVlPnPcYw0Dvww/Dir8BYn2x43Re2jA/roecqpE84BpQCe
         aqYax/rZzgsTsw7YUbYbxrxeNRcjJjrhXLFhb0fsDIz8VCwCN17W6piUcemYv+WFRH04
         xdKm5zRaSzndO9ysfzM9qCPpATiSJNeuz3Pyu5jjCod8uKFmYX8tBiXOsqD9/fPIK/wy
         p3m7ypjy428ZLhcgaRMAwFb9IckPN3a+eVzIDsbYHq1wl9ZuAKC3sp/EVVV1BSb+ytJD
         7Jqefnkl82h40a9mUDwhJ3HrAGLNk23t3PVuwj1o3dxz3XvmA8x5uQ5qVfW86MdUOz4b
         6nOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792530284; x=1793135084;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=;
        b=268cYNsqA8vXbLT0N/GnH9GMS3J3I0EfWADqSRU69NJvXtuDIyguC5kSDckAxWD5/v
         /Cj5bIx9wRWcCYRX3qWQjn6/wu6mIyQiUyk+I4tjKugX+N/hnH5UluRFhXxSIPCxpUZv
         CXcV+if74YhKcpF3k6vw06GbipGZqm3BT70ESA8ZGCg7LfmvqKFfs9sbBDL4xYrOH+RA
         6Bk1D1tr384Y6fh2uk8rZE0ldpRPWXLbRPKA6aDaGvVFmSssjFxigPqdy4gVNt01n6CG
         H/W9ciCbFlCJ3hPVpJ7IfoSbJuNjj13YnIQ57AtLLSYziip3gbFxcyCdzLc2Vsj1GsIi
         ITJw==
X-Forwarded-Encrypted: i=1; AKwUvBzNclselDPM5Ly44iV/Uwg3RAqoxMsNVQXaEPnQTdS19rI/JVU61Z3Wzrt8OolbXMWbsjbVhqtf4qmC@vger.kernel.org
X-Gm-Message-State: AFq9FYI0sCeJ8gjGD+0vDacQ2uYPsn+NRL/UVNN2Jnvk/ME1B9imx6G5
	JU+1do9D0em7N7hq3vg5bVSP4UyuXpEnb+jZw4+cNYK5bLF73OHi+ltSIIf9iBTle6PjjNoAlE5
	21hTIEgP8phKYiOIXuQwdRAnyknLAHu3yhzRBOl2bnPOjRLSwJ2F0AROFF7fAUGJl
X-Gm-Gg: AYBFou2BC9UIA+1K+hIkZhAZ/LXgvYksUxZeh6NFDYqEOAB22VjUdAklGdgZRag1BgF
	vGhyl8saFzK8Qpe+0ewBkeMO33olRIn0+a5aGKjn7LP+FEdSWsCPWVakrYK7wfrLnnzDpYfIyxE
	XA7Hte+TQtey0lll+EKppJt3rXMMb3HtZLkz8f+Lnl+yEtzl0L0SQiRq9t0yA6h1O1UTs7MSZIo
	oQUsiqIAOouw3djsZHDaEYNLEh4+LBOoqK/BulOomr0A/4b/+Qg5F5QZH3Uhgn69ObLqRa8Appy
	uEq3fmZIbPZP4N+m59eXuXjXU5vsd2kzp3RjkDPwXBg9wU0HfUzWqUx/PIWIH6ma/39tv9sZvCj
	sX/ujS1sX3K4MdFZ5Fqr3icgR5OlZZqESTiYISN/yRVAHP8en+hf5sez0yg==
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr60125c88.25.1792530283953;
        Tue, 20 Oct 2026 14:04:43 -0700 (PDT)
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr60003c88.25.1792530282524;
        Tue, 20 Oct 2026 14:04:42 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm1009238c88.22.2026.10.20.14.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 14:04:42 -0700 (PDT)
Message-ID: <0c6b0b6f-af1d-4b7f-8494-01b1990b2d52@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:04:41 -0700
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
Subject: Re: [PATCH 3/7] dt-bindings: phy: qcom: Add qcs8300 to the CSI2 PHY
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-4-anusha.nandi@oss.qualcomm.com>
 <20261019-majestic-gorgeous-sheep-a9eae0@quoll>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261019-majestic-gorgeous-sheep-a9eae0@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4NCBTYWx0ZWRfX9K0P22nRYAy1
 veec3M2/e+YLojO/AwZ3CfEEEZe6AdIEhx6dd8KRr7k8D9yaZG51l8yqzEnK6UW2Pn14t1A6dfY
 XNEkbpMEmmdDXAtMz3g4CSiFGv1AvDs=
X-Proofpoint-ORIG-GUID: ZmI5RHfmXUu--vvLTMRo1WshY_YPISyA
X-Proofpoint-GUID: ZmI5RHfmXUu--vvLTMRo1WshY_YPISyA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4NCBTYWx0ZWRfX3h2q71VEV/Ws
 t0AFuHRYW4ELQBqeXIaFZ0ruv6jMwBNYgri+4MDvANVNcbXSSPtVJx5RVFHYx4C0NjCK4Lkr1by
 KZqXE0E/GhOHsx9ZCYwVEK//mZbc4AstNh8QU7ljNsoY9Xb5A5OEKf08ciySlnZlRdZAd9jE5uu
 tRmGF0++2oKk3jP1u6dyePggfdgH0Ov0UaxwkPTKT8k10LMLYHgqbsR2UilDjjZ/7COyJZy6Hhx
 ZdreWAOdfR3Ln3CYWcQ1Z6IwpvQqvnR5IohSWEVHUzD443pX9jA/H5AF56dbjDkYTpzcR18F990
 YjXlS4pFlCT243GEKM7SB9eyRrchk1zQFzL7A7p5u07q7zWdcaVskuvuFmZ41IqExwH04DnRDLe
 wbjFgePnU+y82I6H6IRzWlhHK4E+rOeKpevLw02hrgE3TpieAAqm1Ze5rr1F1zUxex3rw8Tgftz
 sMSASDTVbEdU96ZtjDA==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad7d76c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Xvw101RpNOGDi7fnrawA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200084

Hi Krzysztof,

I can drop this file if there is a generic yaml file.

Best Regards,
Anusha

On 10/19/2026 12:18 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 04:54:58PM -0700, Anusha Arun Nandi wrote:
>> QCS8300 uses the same MIPI CSI2 CSIPHY as SA8775P --
>> identical D-PHY register layout, common-control offset and clock set.
>> Add "qcom,qcs8300-csi2-phy" as a second enum value in the existing
>> schema rather than duplicating it, and generalise the title/description
>> to cover both SoCs.
> 
> Just squash the patch.
> 
>>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml   | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> index b66ec2f14189..8e60ef0714bc 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> @@ -5,18 +5,21 @@
>>  $id: http://devicetree.org/schemas/phy/qcom,sa8775p-csi2-phy.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: Qualcomm SA8775P CSI2 PHY
>> +title: Qualcomm SA8775P / QCS8300 CSI2 PHY
>>  
>>  maintainers:
>>    - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>>  
>>  description:
>>    Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
>> -  CSI Decoder on the SA8775P (lemans) SoC.
> 
> You just added this line. Changing something you added means previous
> patch is not correct.
> 
> Best regards,
> Krzysztof

