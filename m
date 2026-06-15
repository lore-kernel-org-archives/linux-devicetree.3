Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836B93E557F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525572; cv=none; b=CqCk6zdTXD8UwmQI9ikJKPsHLFyxXHvkgJLkVfgxtXPfoUwzHeMxDNSF3ukI5oBu1iXnzlz+JfFuMZbKpjwlNymSwwQwWU0gT7KVweqSWoNrd6U/e6kL4eBYnEcXxJl/iSjy1+RSc5RXXSXWag+d5VDwvOdm4SrW9+AeY7husH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525572; c=relaxed/simple;
	bh=GsQoEQnPlKYnZPQmyrDFZUSt2mrMQVwGy2vgcNIQTZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fqU6G5lAkZ0cV9iTXZeZ2GZ8U3ta4+r293++s91VRgrUr+Zk2UrAIvJD+jSCJeslSR05LmbV11opTsyG0elThl6OChssch3L9GKsJpmqc0VaFCEgpnWtdTGvy5nkMLbHAxh1WkOhAohsH1cxyKJ4o6JlmZcTYjWkvtoofISHO4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeM7KCim; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQVkpjge; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeM7KCim";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQVkpjge"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApXIK298358
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6DrWIt30qa8JhqcqMonL+wcWL/FZS9HuUKd2HFVHsiA=; b=jeM7KCimtOWvqj47
	+EeRXB4p1cmlIowdf9n4/A69FM/UpeJlq1Ewxk+jFKJ2UDm/cgrwxb4dGKLpD3fV
	zv+Qhl+D2WzkbEF70QGKJ+7pAe0YKXKk20zKWoNHaRWmgSvSDG55Lwa+LsLkZe0L
	qFeuQ+mVYlWlHUy7HbOcx7VBHIPpPVxraVnntu+HwvByJyjEVrdh1r1gP6c6OcXV
	EGqrgEFyet0+CmRX6+qO2n8AB0aR4YDQTqqoK7J1nu1YXgU831NEmySKHdm1rFdV
	NBPUhsRdt1YNA+IhkR0ZbqmjNVdWKKOyXXNi2Z7pozlzCLsyS5GkX7LoCuyIoODm
	4pH+JQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter20m4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:12:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8611b27631so2379505a12.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781525569; x=1782130369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6DrWIt30qa8JhqcqMonL+wcWL/FZS9HuUKd2HFVHsiA=;
        b=hQVkpjgeAQ6N2lcxzRM1a2FFgUCNA464D3Y8iadFx2yj1nJva9nAN8jt7KIK1J5meq
         B7pf6TuG6nAWxHxbGKyxjyIA2dFAq6P0ATR+qUoIBclC81at//kgM9O715KLUTnnmJgX
         Scda0W0rbazOdOBiFSfbCo/XQdN4G3m82IdIiqS50Hrq5cXZb6B+zvY6IqDx116yvVoP
         dNKOavMcVQQxCOMuSTSdXqSjc+3sm7VRzcQn2af2EMhd/zE2SMmUgPhI9L/INq5JGueD
         EsYv7/CoUs4Fao80C68P11yuR1v/cfRAxHP0W5kMh2E7HI/kkYbnXaZ9qTwJ2tPRkArO
         D7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525569; x=1782130369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DrWIt30qa8JhqcqMonL+wcWL/FZS9HuUKd2HFVHsiA=;
        b=KUFbonF38x1D+Ce9wkcv7XT1ylRva/zhwfadSsmFTIsPoVadxZE50I/STJECDVWgHR
         zHIZ05EQB18gc+IZwL5swc3CCY4VHwFcYppjv9wyfsLBm4CYZJi+3Gvg9o981QQTlSL4
         l36I/P1l+NE36AIp8DB3XkaROsZJMduwALf8H36KnmCt6zJl02ThjSIfKC+LVLK1KrZi
         6iMJK7XC3iTOtsf3Brjtu8MDd+eCae704XFvUd1nhX0uAt/mZtFXw9uGmMzO4rOQGuSB
         V5EwJu0NV4EmMJkUXyYQtkbowRsI6dT0Pke8M09PzLhCdc8DlFFU0g6BG2VynPuXSZQh
         IYkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8E3OGT15nVp5it/CV6b3rmBlqhL8ii46Qhqqz3fBG5V97c3iITxL+IvWrAEQdZV0I6wfgvACL39JCB@vger.kernel.org
X-Gm-Message-State: AOJu0YwMcYAx4x65129aJKTSYY3L0prK0b0jvIVro7UYFmk2b+OhFnPi
	viUaMvyTf73tFe11I7uDWnejDGSVhotszVaLGTGuTikYbIA+XpvDPsBBDhgXLafbQW+jlBm59ES
	o7cxvR/yA6d1gqVfqDTSsWXIt6npEkl0jwI6JunPSC/o/GDp3VcF6txUSa5okGs/G
X-Gm-Gg: Acq92OEMo6keItJc3swbhygY1QFzmJfKwEeVqses0rBb6nCjCB9JJgEcsnSRb0KzNfA
	QY+768nuqKEbRLCECDERzPChNXnNTzMYtFsu8bCmCqV/WfuAJ9EGYndHREvrn++iSnG6RQJsbbX
	DskdNYqj1y5B8j6d/+TZxQ2bVlB2m6j+7RsTrQlHxTBChbGMxNvBH0rWmJArxujzIP92C7wLR52
	jtiVmi/h+4+0qH/0PBHmusm5c0a/F2sX0F0neK8fV3iqfopyEDYsa54yggAffdjIHt0mLo7qfXx
	Dm+ZVxJ28xdu7/vxMDa3t5fPCYgEm10I7vvQ5Nubmv7GnDXTY8V/Lx7nUeyCbv/+sGrsERaM7D+
	huS7uRIa9O9qLQo2CtIl+4NAXyawozg1DH8YnP+s75skU+s8MK6mIymdREnrwplyyF+t5cemum4
	l9oiaLVruyxQ==
X-Received: by 2002:a17:902:ea07:b0:2b2:4fc1:f653 with SMTP id d9443c01a7336-2c42c819bf8mr95953085ad.3.1781525569441;
        Mon, 15 Jun 2026 05:12:49 -0700 (PDT)
X-Received: by 2002:a17:902:ea07:b0:2b2:4fc1:f653 with SMTP id d9443c01a7336-2c42c819bf8mr95952755ad.3.1781525568854;
        Mon, 15 Jun 2026 05:12:48 -0700 (PDT)
Received: from [10.133.33.44] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac794sm100277845ad.46.2026.06.15.05.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:12:48 -0700 (PDT)
Message-ID: <41e340c6-f1a5-4541-8842-2bfad2ad90bf@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 20:12:43 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: ufs: Document static TX Equalization
 settings properties
To: Krzysztof Kozlowski <krzk@kernel.org>, bvanassche@acm.org,
        beanhuo@micron.com, peter.wang@mediatek.com,
        martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>,
        Zhaoming Luo <zhml@posteo.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260615085027.2102882-1-can.guo@oss.qualcomm.com>
 <20260615085027.2102882-2-can.guo@oss.qualcomm.com>
 <8ee6bfe0-71aa-4d3a-a583-f7495a86fc58@kernel.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <8ee6bfe0-71aa-4d3a-a583-f7495a86fc58@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX4re1GtA9KdHC
 3tKi33LJPr8ymH+7EQfLpX2ZgKUkXHRqIvVSHNIdxzx0OnXHhZMQDb2f3rhSWRD1tz7xEyl2mna
 d/A8ky1LG9dX8J+UOlCK+d1mFCQD8/4=
X-Proofpoint-GUID: KC4v7F-AFH2TgFWbrdnNupx0SvCbScn0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX1UPWnb32NOIR
 l8vq/f3BJnffvIzT6rFc1jSesoYlJMccHJO+OhyKhUMvpINM40z9/EeWlDjKVliejMzyMB628QB
 JyZjTqAfWHbmWUskyDPIpZwnAXCKh/802omo4tTSafrMk/uVHCeSEhcNi09l46ioaHLU2PLJymJ
 RrEM7PZFs0DQshJgvAItUCJlflBEPj3wkb2NJUPPOxZc2tY/nKC90B1Y4OsBRPq18YEAlW37vSH
 8hsDQuJnOOalcGii8WLU0GmIpUH9q811FuDdXeP1GhJh9Mk82qd/wT1JL8vHNngPi23wa6lxhPZ
 3qRkriYUEXWEuwEIEVv5nNbSF5sdAFtOcTs6BxEkumxmDULtCrc1+23CldFbCBee7TDbgLeCNK1
 1tLWS73L+VTjltzdP8EKMwf2NdQhhUjkg/p2z+nz7QUuH3fRH9wuDblC1NApLyOdP8MKx/tHzGh
 6lC0z7Bxviqo9WRsQ0A==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a2fec42 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=D4ZC7sO_Y8teBw1Q4O0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: KC4v7F-AFH2TgFWbrdnNupx0SvCbScn0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150127



On 6/15/2026 7:26 PM, Krzysztof Kozlowski wrote:
> On 15/06/2026 10:50, Can Guo wrote:
>> UFS v5.0/UFSHCI v5.0 adds HS-G6 support (46.6 Gbps/lane) via UniPro
>> v3.0 and M-PHY v6.0. These specs define TX Equalization for all
>> High-Speed Gears (not only HS-G6) to compensate channel loss and
>> improve signal integrity at high speed.
>>
>> For HS-G6, M-PHY uses PAM4 1b1b line coding. Pre-Coding may also be
>> required depending on channel characteristics.
>>
>> Document vendor-neutral properties in ufs-common.yaml:
>> - txeq-preshoot-g[1-6]
>> - txeq-deemphasis-g[1-6]
>> - tx-precode-enable-g6
>>
>> Values are per-lane Host/Device tuples (2 values for x1, 4 values for
>> x2). PreShoot/DeEmphasis range from 0..7, and Precode is 0/1.
>>
>> These are board-specific signal-integrity tuning values. They depend on
>> channel SI/PHY characterization and validation (host PHY, device PHY,
>> package, and board routing), and are determined by HW/PHY designers.
>>
>> Although UFSHCI v5.0 supports TX Equalization Training via UniPro v3.0,
>> which allows host software to determine optimal TX Equalization at
>> runtime, static board-specific TX Equalization settings in the Device
>> Tree are still necessary because:
>> - TX Equalization Training is not supported for HS-G3 and below
>> - TX Equalization Training is disabled on some platforms
>>
>> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/ufs/ufs-common.yaml   | 55 +++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>> index ed97f5682509..145a6416e1df 100644
>> --- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>> +++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>> @@ -105,6 +105,61 @@ properties:
>>         Restricts the UFS controller to rate-a or rate-b for both TX and
>>         RX directions.
>>   
>> +  tx-precode-enable-g6:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +    oneOf:
>> +      - items:
>> +          - description: Host_Lane0 precode
>> +          - description: Device_Lane0 precode
>> +      - items:
>> +          - description: Host_Lane0 precode
>> +          - description: Device_Lane0 precode
>> +          - description: Host_Lane1 precode
>> +          - description: Device_Lane1 precode
>> +    items:
>> +      enum: [0, 1]
>> +    description:
>> +      Static TX Precode enable values for HS-G6 only.
> My bad here, that was my mistake. I wanted matrix, but gave you array
> syntax. Proper code would be:
>
>    tx-precode-enable-g6:
>      $ref: /schemas/types.yaml#/definitions/uint32-matrix
>      minItems: 1
>      items:
>        - items:
>            - description: Host_Lane0 precode
>              enum: [0, 1]
>            - description: Device_Lane0 precode
>              enum: [0, 1]
>        - items:
>            - description: Host_Lane1 precode
>              enum: [0, 1]
>            - description: Device_Lane1 precode
>              enum: [0, 1]
>      description:
>        Static TX Precode enable values for HS-G6 only.
>
>
> I tested it with DTS and seems to work fine. Please use the same for
> other properties, but enum will be 0-7.
Sure, I will correct it and validate the same for the next version.

Thank you for helping me out.

Best Regards,
Can Guo.
>
> Best regards,
> Krzysztof

