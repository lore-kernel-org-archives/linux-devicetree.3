Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D57B242910
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048540; cv=none; b=GIRFgTu3RLUmCtTlTgKVD/NUcOTLsopHax6dDtfXS0A2F89VlzAF88ambA/XMZNul3c8HoqJEtdhrMmF0EVJpPdYZII/G/vOdthTkqcfzlnxKDHyBvOXaAx7my9bjcBpGZxt3owm6SO0JeCuQbmS6HDrgSBc8jC2uRvHKgPrnfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048540; c=relaxed/simple;
	bh=/1gwxImvfbX+kqBJ2oxN0RD9tJRZuIRghmQumNZUES0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FRzGSxsSe/fJLeki50CL5oAhph3Bjo3gC7rMmh1BckN42RVPgejvOlUnoXsotU0sQaBPusvqR4f+Kdzb2Apd1kUWJnzHyt8wSxGxp8MA0/WXOzyMOoeu+vEQucQa4eIwwgHV4XRaIQoy03grYDHIROmao4ZnA2doz8Fyfl+Em+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bEAi7yhu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H01v9mvs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bEAi7yhu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H01v9mvs"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9vGDn1809307
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WXxgbr+zoksqo3z7jo/Wh9E0btSV/B3EVlHkOx3aGMk=; b=bEAi7yhuLxyWRDfy
	fmlQRK+XtqEnkLrvKOjKqZsXMKj8f2IAU2o39gzHYPYeZsamlJQ5P2Mc9i1NM/2R
	K8KErIqV6Viy/XBwKtQtDUn1zDUcaAPEl8oZrOKIN76RsiiPlUSlk07eI0yOHn3U
	uiN0d54oezdqaAIahSdRypFh++kmOCIziTxycF6asy4RDLsmYEymGd0vZlZ1seDm
	A5mLHt9m9wdFm7bi7uPItUdd0DBUuuhOIU2/fjeMVsflELBfHjlVyJ755NPDdBao
	1Evn30WjdtTY6z3fMcjEWP/s7fXv8ekMNy4Rl2lYxnU/TkUdJTDJZhhYQ1BcMc2y
	12YyYw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk8830ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:28:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf1dece2ecso37805115ad.1
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 06:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048537; x=1782653337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WXxgbr+zoksqo3z7jo/Wh9E0btSV/B3EVlHkOx3aGMk=;
        b=H01v9mvsUfKcuZwkuOzftANW0Kdg9QFCX5uMgLwpj1q7drfjOCduY0hDftx746j5qV
         /YrHAMq5uAy3R38katQS2fuu5Iy8gUHkbdaEYXXNe+YIst9FNSWzURzxVJDrrw/zlyRI
         izckcrGPDDNr9P2hWZRx8l79aYLPO4PSb4qEACn/6ypKwOBrBbQx67GRj+4+n6g6nytx
         bJD0iSYpqT1DfMleL76oGO81Z3HuCPTdaL6Q6g4ch8az/CNQdHE7bVljn+4RrikGtnk8
         Fi20DmBXvSJXUf/EJxFFrO9jZqTz19gv+W+Djrrp4DQqLOFiwn5uIjBgSypn9vvNtABB
         jaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048537; x=1782653337;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WXxgbr+zoksqo3z7jo/Wh9E0btSV/B3EVlHkOx3aGMk=;
        b=LnvEbp1gynPW93huQymwU8d7EXlfEOyMzP1RYbFNnSiiW8zZTP+HvgOjGkl/huFHaP
         PVgEJWM5mhki/DR7QNWzdo3CvNPE0uACARg/GhwaiegpodvCX6+UQ9lGVp/jVPb/MGH6
         WKSVR/4arY2i3mhkMuKBKYPFyzFqHwr/U/n4hsulFTW0inRN+I5bMaatFMn+58zhpkbx
         p9Ka+gIfm1h0Gj99VvCkoMPMBgXnp9yxJvaYRLJWZJl8enVHrrph3AnaBk+zHeRmi1hE
         BeXNHPtX+MAniZwfwrR7X+3LsEpS1dD/VDyUhLt53czoajpwLTIZC7RDK5vGi4OHBkcD
         5LrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAaZOv48Z+fJnMhqhXUffbaOTpRH8i+adUpeTUdcJjn0elcQtAASC1QdrjGuVa9q2ylHqDDHx5EfaT@vger.kernel.org
X-Gm-Message-State: AOJu0YxysszA4yqv9AAQwk2Xu1fZuFSgRfF5uiTuQbviFZCjXqErbLQN
	VMZ34VmI4C4KZx+WrfAf1y46RHB5ocKpTDX3Asu3FnCa4PHc839vISr49Te3/TLzrRJZXuRHnPW
	CDKS7MlfdryydyCrUqngB+Ay++3YbvpzUHGUQ6sVM2QwEyV70PCfnTgF1kpZsW2GG
X-Gm-Gg: AfdE7clLfvB81besTorUx017N6Fems1WV7iUKZn3B8jzO6zizce7ZcbdwB3arg47UMl
	1sCu7wIb50HrdHdcbAp1SHr3apzcy0gt322kvi+pQgHItnPacyAzgozjFD4A0kYpKhdYz59cHKK
	ipBl2MZ46W6yrUdzAJkcxgImFWR8UtI9AUvCUZAKQUOsA4F/Hx52vgY36H78BjeWr+FDjz9Y2Ts
	FaDpXSexr0Ymq3GWKjU7cleOhMd/rs6V2Zyazu8hJPhbfoaM6aa2scK4J5pjtVGeqKEjqxQM63m
	WvF4qFV9K5yRnZXSnpFjmB4WWBgGxV3ao9arYKRr0xhiUmqhOmDk9XB9uxms0zh5UdcD26E9/LH
	P7RZwLJgU4j4mmovFrA6sQhLjbjZPreUo4AUo4P2M
X-Received: by 2002:a17:903:94d:b0:2c0:aef8:23eb with SMTP id d9443c01a7336-2c719001a1amr130799765ad.25.1782048537209;
        Sun, 21 Jun 2026 06:28:57 -0700 (PDT)
X-Received: by 2002:a17:903:94d:b0:2c0:aef8:23eb with SMTP id d9443c01a7336-2c719001a1amr130799415ad.25.1782048536750;
        Sun, 21 Jun 2026 06:28:56 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8524sm52980105ad.47.2026.06.21.06.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:28:56 -0700 (PDT)
Message-ID: <f6264995-a6f6-498f-9557-723c39becf1a@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 18:58:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/13] clk: qcom: gcc-qcm2290: Keep the critical clocks
 always-on from probe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-1-8204f1029311@oss.qualcomm.com>
 <w2y2wz3cbifnko3td3ovxfom26lll3vl5qgulksa7qnuvzukpf@pqlrh23sljsz>
Content-Language: en-US
In-Reply-To: <w2y2wz3cbifnko3td3ovxfom26lll3vl5qgulksa7qnuvzukpf@pqlrh23sljsz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX362DC02dr9Dn
 TCwyWT2wc3C0rvq9asM+k1JROkbW+lOByVRj0N0Q7u9Eb+HkRpCD3q+Z6V4SjKtz3+mUMh0A6mj
 uG80i7paxqp2nNgzZSTEQP95zpFlS1x87+PkPBbJ0KqkvVny+zMIewsMQAH6mxWyoilS4cDooNy
 ztKKGcx6BIRSzCeAyeUeW6RWx81aVsO0+XNW+ndd/eIaZN+zArQYqajXnf06JS9XOlXYHtkyp/9
 dshSDsbSNetTjy530s6fWT11mYL1cjauogV1mCtPyOp79bk55ixWs0GwIDBccRgEvSvxQPHuAw2
 NFYzTiemj7oEjbysS4owQV+xhNJV7tYKbC0EG5oIzXw3R1oVDSSmnjBAtwphrQKbHKzb1VxCtG6
 wKBuUNf1r4BkStoA4d+plKq1meWwNEqx6OsMoSUeuYkXzICNcRCB80/9mN3Vvs3nK+OkzUb58ha
 QwrylqOgSNwppBicAtQ==
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a37e71a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1Eoo6ObXIGekxtLEpGMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: uXITpuyvVBa6x07owLlDif-ZYZoMQG8U
X-Proofpoint-ORIG-GUID: uXITpuyvVBa6x07owLlDif-ZYZoMQG8U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX7HTGg3m8b5L1
 mLxpvDQb+5xDjk6FGbW2Dz6qto9YiwuRDZ1VlR24TzPdZCMvlwjwYaFChGwxEZOBmq7yiuULpPD
 ocpjb+QyntbYaSZGPRkG803c2rOMef8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210137



On 06-06-2026 04:54 pm, Dmitry Baryshkov wrote:
> On Thu, Jun 04, 2026 at 10:56:07AM +0530, Imran Shaik wrote:
>> Some GCC branch clocks are required to be kept always-on due to the
>> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
>> clocks and use the latest .clk_cbcr convention to keep them enabled from
>> probe.
> 
> You got the feedback, but it got ignored. There is no explanation about
> gcc_gpu_iref_clk and several other clocks becoming always on.
> 

Apologies for the late reply.

I have updated generically that few clocks are required to be kept ON 
due to the hardware requirements. For gcc_gpu_iref_clk clock the 
Power-On-Reset value is default ON, and such clocks are kept ON from 
probe. As Agatti is working functionally, I will keep this clock 
modelling same as before.

And I will update commit text that the GCC video ahb/xo clocks are 
required to be kept ON similar to other camera/disp ahb/xo clocks.

Thanks,
Imran

>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/gcc-qcm2290.c | 160 +++++------------------------------------
>>   1 file changed, 18 insertions(+), 142 deletions(-)
>>
> 

