Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB456203710
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 03:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786420042; cv=none; b=pmtBeX6lzhOnBBTdop7LvlydNBZVaBcuBLMV3MooOG7GfTqzvmz+FzrVS/bGkJJUIsHEt8S220ljhkPFEUxWmrFVb4KeQwyzSpydJt1xWDh/9O89kL8AFRZWYj2ITcKT2OXZ+r/FlykuEjtm2dDa3aiIBe00ZLNut82UOOMfmMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786420042; c=relaxed/simple;
	bh=edvAPZUlqdPxQvGt0zVokuNjkmj+7OzVo9zvdPz8oCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAzckLIEiBnaeEyeJqYoYjJTxjOq9n8Zo+rY0R4upfDjg/PmBqqlQtCP/AywiW9wMDFeYPaTCAiVNiyX93s9ZHF+EPImO32rl4sgqsICGWhKZ23/S15WB+WaEriKAiTv0U6EtYY8+w7Y196ac6wtoE8LwODFmwz50iZrjS/pUrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cp44ynqJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NwDwVWV0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cp44ynqJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NwDwVWV0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMptvH3047698
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 03:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ud9uue+eAmgOeli/UJM+eu9+5MxvNkXUbo2Xuvjg13k=; b=cp44ynqJNje5/9PP
	bOmw6YPW4iucixdbehwe3FMkrXR4aR/l3fhbCBdfmrv8FgkvuyuNna8YsfNqhYjN
	cevx8JgxvauDFNbLv7B3iy9xMBMJQsCvGZYK+iG+WGWV5cIbR3YR6B7KnGhLpI8Z
	nlCeQSg8uv5x93AoCUMFZ7m3oFb0HkXHo+y/0s0+KJIqrR2OEAhNWFkW0H3IRlKf
	7gFLRcJn+4K2GsUm9iP6/PxgfaTtC+3yKlKQ8VIuehKT13tI2zYtvbqIVWBiI4Zb
	kii4d5vWqdSyi7wilPTVNrscCHjDnbw7QLOBWgEaml/rzHiRNTfKGVDFVZheo4YW
	tfDWgg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk228ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 03:47:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacd6d37edso41470745ad.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 20:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786420038; x=1787024838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud9uue+eAmgOeli/UJM+eu9+5MxvNkXUbo2Xuvjg13k=;
        b=NwDwVWV07wJtxG0B44pINNZ4Uvuk06AGEPuBL0ey2C1WNdXi2QAAzuqAcO7TDi58WT
         IqCBQzR69Q7Zya/40h7aL5TI8LXBP4SGpEpMHlVn9Q9a8bOFHw9/tcqUV5DWNgCNsC2h
         ezCIb+cQgFoAXdGdlqK+M7fXcjljiWgBWDjGJ1GiZB1JlrAq3LediHlfHA3hi1lqnMna
         /CHGZDvNe/CmmEC9R+Jw5Y3gZ73LRwXm3IXGxlLwGvUyTbSjr7q4yLZpuay0oFaoEsWJ
         nri6dLo8hFifwQMnYOuZTQZ9qmU8x0nkAZrn3YwnJhwM8MB49ORzVzwxG2qKU+in2h4+
         GCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786420038; x=1787024838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ud9uue+eAmgOeli/UJM+eu9+5MxvNkXUbo2Xuvjg13k=;
        b=QnzWHW4icFufXgV9pCVtyru5IroYKH0u788F76vGoB46+SBmYHLVrH/OSbGDA4jnrN
         DgvZQ0wJ+Ot1G9Ipk95PI5vvM9cVhLmdRhzJ8TwWdJgj7aqe1R+7t1Gnv1GV6VV5jLaO
         u93Llgg0RqMBhPcPc6XYoKWDGD/MWyqQyFRsg5SlT0lAaU3YtucDCEUOAZic3F26t7Df
         sMyP6eNZH9wZdsFsEMcChh0jgvBebpK2nBlnDuUT1rTnTneshOABYfrFSF2sOgTW9BNJ
         8lxJcUWs3DP6Ivi1ctESJDYL/UBZBp6tv4jvoJBOpZFgGQh53METgDiCPHV1A+VOkZo4
         1cdg==
X-Forwarded-Encrypted: i=1; AHgh+RoljrxWQ9mJQanlyXfV69uwaUiOSYeQrMB8e8+JcYqjwKaLRG6FsW4ftOTG984vJ3KBMJQLoP1UyrIF@vger.kernel.org
X-Gm-Message-State: AOJu0YyAReZm9uulDyY/ix1xYN/rq1PLQYNlhQKIqvbeLx05ouBlbISt
	kbsbleLpAZvEk4JkR0HPw171+SlRZTxxRvXvu0i3izaLxPm3beMSqMIPGYiuEv5/BMzmhRMHmA6
	pVdQuk5DNPHcvD8sPTeQfYj+rPxOQQJfhSVkes9ni50q29LtsreYRz6L1bcyayC3K
X-Gm-Gg: AR+sD12KTNQumZSSTDVeKFRBlzybhmnv6ato3R1rpHr30az6/H/eP3+fBY/yhBEKJHC
	UzkMaD22/Ejb2LSj/1pJWaHw9JQxYBDL0DqO9673tXNJIESsr4sZYwlNgxPwEecah/SGmA1NqtZ
	r/OZjFRYCkd5ByrdA1sGAuEaYFLzQudSu/OgA9j6WfyqeR5Q+eF0FqCmrw4tKOGHG+EXQAJ15a4
	Nz9IY6K9n7zMhYEJXNTAJ7jWFRnkCEyhGmKTiMkB/ebpdNIM1s/NYYR/wkSLM8+b/DRKfPEjVU9
	LO+/WMNpFgOEFwnL2W1UVBLImtr7fEyip+NMrw4EHR1pydwooaSQldoYHEG/MXs7gHObJrBSR1Z
	aezXIXThOZxehTgv0p0EOZz1tp/W3HejISGIRGkFh7f7ZMTu6kipxDtBNqYviJPRITHlNKuzarQ
	STmqfOubZ1b9ZNB7RSvBg=
X-Received: by 2002:a17:903:2c0e:b0:2ce:f9db:a9e0 with SMTP id d9443c01a7336-2d3178f4e77mr6309865ad.16.1786420038260;
        Mon, 10 Aug 2026 20:47:18 -0700 (PDT)
X-Received: by 2002:a17:903:2c0e:b0:2ce:f9db:a9e0 with SMTP id d9443c01a7336-2d3178f4e77mr6309465ad.16.1786420037844;
        Mon, 10 Aug 2026 20:47:17 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm50674040eec.16.2026.08.10.20.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 20:47:17 -0700 (PDT)
Message-ID: <f7a76790-0e7f-4c4c-bb33-36134a0f3e29@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 09:17:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] interconnect: qcom: Add Kuno interconnect provider
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>
 <xmj3xhnvdixooy3l6wro5f7eeehlrlrq44y2mwojzzeb3yjdjf@e3eo2772qctz>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <xmj3xhnvdixooy3l6wro5f7eeehlrlrq44y2mwojzzeb3yjdjf@e3eo2772qctz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAyOSBTYWx0ZWRfX0sE7OLRpkH3k
 Zd/6TZFgxIdAmPgVJlyl6vpSUbuWTJSzqHCln9Nhyhw2d3qauVcA+IFJP3kVunNsc21FifX9X1J
 92crC9bXc9t3JzQYYS+7t16KUFJYa8g=
X-Proofpoint-GUID: HMIr2oZkQWl3vd1IwkO9rnudLJFBpaN2
X-Proofpoint-ORIG-GUID: HMIr2oZkQWl3vd1IwkO9rnudLJFBpaN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAyOSBTYWx0ZWRfXzJ1nOGsqs0Yp
 FqV9PvVrvTa1dZmtMuUfHoyeyMv49JjGAkHI7V+dgxxikrwhMgp4O+3jWmWYfnzcQ7FGWwNxAg/
 smW0BuZTck2FIpcFUWDl30VPsq6Xr5IFesHJJwjoyr8KunjJks0J2TCdHj2RfkIX4X9Gtbpa83C
 5m+lmE7z7Mry3AWSJppand/bQNTV0GEjC8uhFdWNBb6jO6YNQoLshkMBFtrquaebyE8F3CIUSlB
 Dmz5epPa2bDLub7QmBJu7DxhJnDyFL7Za8XooECP19zbd2VCwPL4pdSAtd4Aj9RZmN8uWGnRlrS
 OC8z1nWdjveMShGTX50KpgGa0Mq7uoGnbPI26y27+psvLVIYP7Gxg/paST/JdhmTzDWoKloPGRq
 XqKz2JxmSyVvTL/TgNJIPllbCDepPgV5JwnFMCDjb5fOlWZ8VTUEEWhgaaqCVQOMsIRC4OCLer6
 b4QdeGZ4wvCU/2OtmCA==
X-Authority-Analysis: v=2.4 cv=eJ4jSnp1 c=1 sm=1 tr=0 ts=6a7a9b46 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=58NiY7KAgNsMs7qA__gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110029


On 8/11/2026 6:30 AM, Dmitry Baryshkov wrote:
> On Sun, Aug 09, 2026 at 12:57:06PM +0530, Hardeep Sharma wrote:
>> Add the interconnect provider driver for the Qualcomm Kuno SoC to
>> enable bus bandwidth voting on the platform. This includes the
>> aggre-noc and cnoc-main NoC instances with their associated BCM
>> nodes.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   drivers/interconnect/qcom/Kconfig  |  13 +
>>   drivers/interconnect/qcom/Makefile |   2 +
>>   drivers/interconnect/qcom/kuno.c   | 978 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 993 insertions(+)
> Please add QoS settings.
>
Thanks for review.

Kuno's NoC QoS is provisioned by RPMh/boot firmware, the same as its 
SDX75 baseline.

The upstream sdx75 interconnect driver programs no AP-side QoS and only 
issues BCM bandwidth votes; Kuno follows that precedent.

Hence no qcom_icc_qosbox settings and no QoS clocks in the binding — 
matching qcom,sdx75-*.

