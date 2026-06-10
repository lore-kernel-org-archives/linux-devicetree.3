Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4733BA249
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084970; cv=none; b=XaVT6alUFEhiruYtqvT0EtpKxzurtE3IjBV4xOeKFz5bswaCT0CzAq9kZqy4G9Cc6E5vhZ6yseTIV/ZIRdgpNulKZpES3VUuinQpLxzvmrUw6AeH+PHBvWWmTQaSWP+LSGspUiTQ/uPXVetHJOGNmzTo6wYOUCZbzO9fzwM/lj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084970; c=relaxed/simple;
	bh=cZcO9Jt+ROwZmqDp2yCSr6jFzdd6xM23Mwa+iIRCkiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LYzwOXn4zk0nsnp3kzEsheubGIiFNuX+6Pt8G3RCe6M4YLdpUBYDRe7Ms0evId3cGd9fU6isYmw1StIkEnTDKKLxIYqiYBd7seBiZXtDplP1D/me8SeqO06ZDH+834Nl/iYradjqgaE93JSlJJ7lWdQFCzPBqDZN37W1rLYvp2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn0XCStl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csxN7FDX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bn0XCStl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csxN7FDX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hrtV3151709
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jC48BHG4q/pkdmu9tL4+H7RyB9xmymG8F1LR5os9RJQ=; b=bn0XCStl7MK0FEzs
	rnDlWwoQxxDMO/KCVI8AJoDLJQJaaUQCQq/NXTY42ZGljHXZTOC4J2z6+RZZWi+b
	TraHmuy65E8xQhrvARlp2qo0EIiRDySMynXyPP9kROVhJZZqIW780I2mWgZ3j4Mv
	Vf05VEEydVr6zuONvYZQp3XWy4HqWS0IBbjV4gAv7CYcTw3z65aGZI19OOxDqQwh
	B+xKx2NkKMZuziGOc8GW1FxtiAjB83iqIGewOCmrSCwNghY/mZz84pH55fLUeCLG
	qSU506PGCW7U3x/F6OkQid7xLUP5RthKnCGj1HyS30fvoKahf9hu5m0qgqyLiIUZ
	VdGaoQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnesuha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:49:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842208d5b0eso4819902b3a.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 02:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781084966; x=1781689766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jC48BHG4q/pkdmu9tL4+H7RyB9xmymG8F1LR5os9RJQ=;
        b=csxN7FDXReBVJHNUPa/oGY9h3Mq27VCzJLiKhOA1YGCZGXRBpgUrYlMY+VjmVxy722
         4gwhier6VH1QY0tQIev1CgRoNaInYfo/Cox6FPQYMpU8T3A2HWhUKyQLL2M4qVQxYsHx
         5LEwGLgXZhXKk6Ul0jKyVVlaMVjln9bawG8EkjCmMEpZE4e1oBy8WvrXRUwSoEF1iCEc
         K5DSh/6n77fnbBTfql/RjVIXOEw4TUnXGFj2NULhYTiSgWKlfY8ZHX/GbP4JlgZ1PluQ
         3AtqlV9CYNTEShAsJnA3AWRYVw7YaQinJGR4d45YnwQVFZgjoZXg73mUU2u8N5Dc/cLO
         gbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781084966; x=1781689766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jC48BHG4q/pkdmu9tL4+H7RyB9xmymG8F1LR5os9RJQ=;
        b=KbNQrZ2TUw51dBhStWWr5WNVkwjR4iiUPaka83HmIs7Uw7INRRbBzY88KU0FB9hIRw
         4MJzLfFauK4k+H5G8HGCquhz6GSABPnKoQhliBfBN0B/XWH1bt/574VtSNi+Gq5FWRME
         Iv+jrgVqo+0zRj0QYFDrN20+r8pp5K4pL4p+xIFzL83FKOsm0QKxSlIav1Ufo/fZOVxe
         t3hbJa2OzvrqjOvDy8b6vow6oFU7D4gVz2aIW/TDpG0OqoC1iqIBYoaKoNeUAi69eEG2
         xn1P42v55bzNfEEFyIXJkjZMPnkmLoHlPF1bU07qVGsHolRNEEchZdEv6m5HYGa1ra0V
         KUuw==
X-Forwarded-Encrypted: i=1; AFNElJ/doQp6L6f0rGI9ZMl0JaLQXzCnOvb300GixIgr86Q+ogv9YEt556YZBZFaou4k6x4CQ5iqKUpus0aX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy35NANqy+zp2Q2NRL/FJDuWdC50iAQ8Me2IjuzscnCli7/lH7Q
	CrNe98B5mF/3ZGU66/O6NrV3KTSIGPgyCVRX7I78SuflzSt/RMjuiAn8nKOGDFNia4MkftJm4Fh
	mAMSJYE8n8YcqXkMUBHaIng6sxqQaOxjggXGflMMwt/ePCC3LbNjWHYyO6yNc5HEn
X-Gm-Gg: Acq92OGuXO29Hh0ggOBGWmH9KTwYMgUE5JgahL79PjIdyuUFGXAmk6ge+ngWzmWHPUj
	a46s9f2X1nKYmJccOk4a8IeIHlHjc+lhYqD+shjmwx0PdLCkbDdTHlhS3vQ5ipJw722142I8aLf
	RS3mp3gHNsnKCUD6xTIgpIzQl4JWgqKIQAEr2TKL/F/t+eVfZgEA3JpT5t4DxO6+sCvTXxj6GjB
	VqsWkxRpw/K1h3UoWLlhRy/2I9PX6+4Uu8aSadld4g9rcP36i5TN/4pAA6QP9ZdosDVs81466+C
	0q2SgUeon+IwT7ee+wnTGXnyt0aMPgmXuSD734bhgomPog/eNdQEObeWZoZ+fK3kFyP+V7JLO8R
	Hx+GizqhAWSS6ZeYe7QxJe/Am2vgM6oqytg3VuCCPWKuk0ykkbU1tf3LC927aDwyNZUuZKcLt7W
	CU
X-Received: by 2002:a05:6a00:2305:b0:842:6155:45d0 with SMTP id d2e1a72fcca58-842b10d9659mr24913592b3a.43.1781084966406;
        Wed, 10 Jun 2026 02:49:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2305:b0:842:6155:45d0 with SMTP id d2e1a72fcca58-842b10d9659mr24913568b3a.43.1781084965977;
        Wed, 10 Jun 2026 02:49:25 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282220d1bsm25722217b3a.12.2026.06.10.02.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:49:25 -0700 (PDT)
Message-ID: <1df97802-0956-4d2b-97f1-0c1570d0c3d7@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:19:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom-refgen: add support for the IPQ9650
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
 <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
 <b7c5441c-de69-4a1b-9121-3d15bc24612e@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <b7c5441c-de69-4a1b-9121-3d15bc24612e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8oSAhy3Dnn2v4-8WiiyMSs_15yBW1ang
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a293327 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cPk82LopJyZTTbnMm5cA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 8oSAhy3Dnn2v4-8WiiyMSs_15yBW1ang
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA5MyBTYWx0ZWRfX2eD+zELugROs
 oT7BEHn3KkQJzlnyCGOcmFVboCp147D3l/Vw6zQiFfoyJUPJ0JRLq1X8XkvXzYl0m27wu5DqL3D
 F/evRb6ERGrghBvXnS9FqYacuDtxgz/tfFKytI1IogaU2OPyN4pqZWLtW3CBfaNNG0GRHtwgWyM
 FCt0zYloQ2faFm4RwyLWxmfTaiEv+m2KR7FQ0kASLf8quQQui3VOQNPvKDPHM2cEywbTr0e8Lv1
 gFIisd2KQGIOpbm+m71B1G0xo+NRFVmPY3FOTnMGAZAKWgcduRd3mWkCGJhJhMn3+xi3FlfoJJi
 JlX+/1wDgmBGFz072KnK+LwIem/suJ834YKjM6bOIbcilRwDzaQ0J0bwV8tdYL+ErLBCRAl5hlM
 FVdCeCwahqodaaSi5dgR9wcsXm1SS89NV1/9GiIoEeYDA0zDL7O+lzaoY+o7f5rHqTCvB7M/9S7
 QQn9FW9I7aPAjSGV93Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100093


On 6/9/2026 7:18 PM, Konrad Dybcio wrote:
> On 6/2/26 11:22 AM, Kathiravan Thirumoorthy wrote:
>> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
>> PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
>> enabled on power up but that's not the case for IPQ9650 and we have to
>> enable those clocks explicitly to bring up the PHYs properly.
>>
>> As per the design team, REFGEN block provides the reference current.
>> Hence marked the regulator type as REGULATOR_CURRENT.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> I'm slightly confused. Is there no register programming needed?

Yeah, no programming is needed. Similar to Kodiak, PHYs in IPQ9650 does 
the HW votes. No SW vote is needed.

> Can we at least retrieve the running state in .is_enabled() by reading
> some value?

Based on the discussion with IP team, I can use the REFGEN_STATUS 
register. Let me update the is_enabled() to query this information.

>
> Konrad
