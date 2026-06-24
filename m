Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C6B391E7C
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782285625; cv=none; b=LjFsdqodHBF7QZqqrzIcJxcnuiRDh+5QCKSZ4XvJLyamNLUyqVqkix/jNQ3yLQ1KnwKK/G0Bhb72dZIrS8yDRPC3cpqgEiZq1SR76auIDr5avrNX0IqYkFQ9zhn+D29WxuZyraXE12YibS0ISinEMhJ9A3XKs3pqNPGMraoUHhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782285625; c=relaxed/simple;
	bh=xlY0uacPa01koNo1kE2f0hDhz5c8EWJ31wVjZqXkscM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DyExTalyejWhwYQ8lXPU+T7/fJ1+a4ic1vWbwlg9DW6qEnoyGUro8ojsA48ipksEcEfqznsl4uiE/geQIU/w8BPjKdXFLL51a6mBF+2TwCcsVdPSrtEm81wzTGvikfDfemekRYO7MmcNoK2v6V7gelvOe//rqLDnUDPaXi8Q5qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YeoHuvbB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnGOS53T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YeoHuvbB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnGOS53T"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5twxj1892324
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rwrkizMYse0bcX80v+kV5BrSxP1cuVvt+qMAhQ+ZeWo=; b=YeoHuvbBVxVnUEKy
	FDPm+q5O2hu6yTQaExhdS9jB7ne2OpxgHjVd1OUDhk4CM1E3A0/0Fsu2MB4Nt2DK
	8aTnqTDx0ka5eBPr8ajQl1fepxW5cTyDwXE/jEe/cmtZFIhqxjgjy+pF+30kEXo2
	APU+w0El5yWrfKzRQgyvd85HocOhr4yeZ8pu5pfuP+Jtf08g7hA6DX2CUv9OiwNk
	n1Op7N/B40i+xRWloyLg4+HZYbMUaRifu17ZU0wniyrda6eSfplfx35zLEiLPtY/
	ayLpGe4Eo8Q8cTvvUCdek/LQUrfbWhM0foW0H9z96TVE67TbNA02n26hYDb26wIL
	WEfvKg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bf91aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:20:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0bf6904a6so10390165ad.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 00:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782285616; x=1782890416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rwrkizMYse0bcX80v+kV5BrSxP1cuVvt+qMAhQ+ZeWo=;
        b=bnGOS53TI6iVlW9M50eyz6w3QQGhYgrzoplXfPpIH5EFIqTA2SqRfNbZwo2QXcTQFI
         TG5rGGarnYw/0dsgIiZEmuYJGJi7OD76A45S2wnYJeGJv9T8fMgJNoh5DL+6YJa3YUWX
         FtAP7tqk/MF4yDQbDGSPfekuGUuHf+EOKcNCugQyMWgjOLJXsJdsVbXBLmSf6VR6HmBK
         GXGraMkMjxRYzWM9xEjUJVgA+DDTvUbdW6dEus2yHllqCtGhhYZcz0tYBFTjghJTsz+D
         NmoMyaUmUVDxcn5IfIYcevbC+cidg+4WCgHbpa8udxshL5aVQGYShON1FkpveM3KuMIg
         55Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782285616; x=1782890416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwrkizMYse0bcX80v+kV5BrSxP1cuVvt+qMAhQ+ZeWo=;
        b=SE349s/1u7GbiYwOH7+NaPUCn8mzUTvbEeCECyHiva4ISpnR97lVKc+PqGN+XuT1yf
         UdtlSO2hIyw1fyZbaXhwErEMNbNOkXLQAfw/XAdbbowGEy9i8Ode8JFG9836L7CUHYZu
         AEENEdM6C7ElBQ1m18BK/QtP6dRWUb3vo2BcwbSNq4ShtLaSMfPhADdLGWHX6ug78BkE
         Cr8ZftbsUKOiJL6sAvKmYbQDRia7/Wa+KVZf0HI6DZn7FZ6Ybg+L+KTOgeR1AeWSfe0O
         73Eudca4LGaVdkzG2As6SFS1qDLtDenJL/8xCXetWXnjowBsSEJOFaXehEqdNsnjjW9E
         z8KQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7LCR1ofUV29u6ctlU6PjEgJWGpav/Ho13bF+HQdfb5dhtiDnSSVFMhW6kgjFOLdDWQPLBPo46iZW9@vger.kernel.org
X-Gm-Message-State: AOJu0YzUgjAja4DM8fgoazBUPou+b7unG+QeD62m+InTFo2GmP5jykMq
	74qu7R7tMpY8W1yLuierwdNMbaL3iW70Cp2s9Ug4XBqHXLVxtH6ls0RD1VVlfLMEdTLUMX3NhTU
	D7t1i5XfQXnBdBM3VrNMg1Hx2AB+wEfT2uXYSrh25iTgIT6adarpy2Vyw3Jct5cEf
X-Gm-Gg: AfdE7cm5YFCGRCbLSgG+YFLxUeFoX7avlJNZA9b/uq27Zb5U7Zw3n/r+vQEgkQXLKwb
	uJK9OpWOb9eqGvNS+f/NRUgwmlYVG/QS+4HfiLbrRkEjei113MuAgJeHe1gaCTiTy0x4kVWMm9p
	69dpAectVsh21uc2L6TqKH44DawMTlzWLWUKpCIaR/J1AyaYR8E4DijYYJttUg1ZNRW+0PKPI8Y
	UC62MOcqujBVOLhMy8aDGXbpCZTWQWUnU0xvLAI7wfw/jEdlyCtxmgcZLc3yTLCspa3py85ni0S
	oZ55RnHOVMalOoxIMgL0aMFvHZ+V9inT5no841YQlogiZMBkPiH76kd8BOMWWm9YGAlzHPxoOsD
	lh2sT5dnK7vheI8J/F6vuAHd4nFYEc4eGob1NecsQfnlvpZSn09AhJVsHwYfYfPtJvp2CKU4Hbp
	fC29Co
X-Received: by 2002:a17:902:d54f:b0:2c6:a2a2:13c4 with SMTP id d9443c01a7336-2c7e14e7778mr25647955ad.24.1782285615583;
        Wed, 24 Jun 2026 00:20:15 -0700 (PDT)
X-Received: by 2002:a17:902:d54f:b0:2c6:a2a2:13c4 with SMTP id d9443c01a7336-2c7e14e7778mr25647445ad.24.1782285615126;
        Wed, 24 Jun 2026 00:20:15 -0700 (PDT)
Received: from [10.133.33.188] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f86d0sm119429115ad.40.2026.06.24.00.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:20:14 -0700 (PDT)
Message-ID: <be2b54a5-ce9d-49a2-80e1-60da874350d9@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 15:20:09 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] input: misc: Add an initial driver for haptics inside
 Qcom PMIH010x PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260617-spry-greedy-chital-1276e0@quoll>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260617-spry-greedy-chital-1276e0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3b8530 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pZM1ahQh0IU9lKbVnbAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: eCZC4luJ7qajx6mAlxz_u4iJgx3-dRQs
X-Proofpoint-ORIG-GUID: eCZC4luJ7qajx6mAlxz_u4iJgx3-dRQs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA1OSBTYWx0ZWRfX1gQhtTgBvtXw
 ZTt5Ub3NZ3cVRFCms/GIqUCVFIawT41Z5g2q/uFesWFZ0jdLwiYt1P3+T4N+1pEj5axdzAYZR9B
 rDRZWVR15CYMO3MCvPYiHUYDte3/1vc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA1OSBTYWx0ZWRfX1N4NbNDwCyus
 2c/6jrIA5BbiigscvXGcuEVZq4hcy9Azbn1rGt85LR8/GDj1+YTyjauXNtUi2GSJfS7M1G66d2g
 fJ9EX3P1UvQallxUYzRGoiDMDnkmoM+fxCZKaAz95QmJEX0atllkmKZNrgICpYi6Og2v2WcfchE
 jTJLq69ThwMCvo4nNyAr9UTZec4MdLQT1aiLav/aa+1fz8/oEv9BP72sP3MsYLwaSP6OeL9QaYt
 RCwhRmT0vCiO7MTTzx1Pr9BE719h3QsTaLEneznZGIb9rjEAZsagpbJ5YLdYzW1V8PhltfdTunk
 S9uY8OX0FrSL0HYAH7ghvVNVzepOdJwzjAhKzpppc7UBTBo1N4z36ihLoCfmFS8kxIoqgMwxhBP
 UoPsIWWPwSgg1cYB8UrSTDVf6zGvGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240059


On 6/17/2026 6:42 PM, Krzysztof Kozlowski wrote:
> On Tue, Jun 16, 2026 at 03:08:23AM -0700, Fenglin Wu wrote:
>
> Here - the first sentence - is where you mention merging
> constraints/strategy/dependencies. Your MFD patch depends on ealier
> ones.
>
Did you mean that these 2 MFD binding changes should be listed as the 
dependency of the MFD patch?

https://lore.kernel.org/linux-arm-msm/20260609-pmg1110-v1-1-6604d0adc907@oss.qualcomm.com/
https://lore.kernel.org/linux-arm-msm/20260610124119.253456-2-krzysztof.kozlowski@oss.qualcomm.com/

>> Qualcomm PMIH010x PMIC has a haptics module inside and it could drive
>> a LRA actuator with several play modes, including: DIRECT_PLAY, FIFO,
>> PAT_MEM, SWR, etc. Add an initial driver to support two of the play
>> modes using the input force-feedback framework:
>>
> Best regards,
> Krzysztof
>
