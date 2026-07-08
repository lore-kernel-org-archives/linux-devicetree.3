Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB59430CF0
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509485; cv=none; b=aCSk5GygdGIM1ftt3e9skKmqJsoDZNcqNCH2TSdq1tjAnNEDBwjASICbLT5f1EmgiI6N0lFH2sDV61MocCmSJ00/sX01PTRggiWvT2nfx3SGewx+41iNrSSC2iJYGjfPjdO+hZxY6mx6HFOHdfkiNwwaiY4tjg94//BzJf4XRCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509485; c=relaxed/simple;
	bh=VSqoLTkrdsdlpLEX58B2cgHXvT+EULR7iyBVMlx56JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQlkEKalfSlLqN/EhkMvNOM/Dh1iadLzqKQ6Ix5BLflQVdZrHoKwyg1nwHj4/5dUnxkG+egzqMs9wu1qgMc1sqFdGGq/6KIs2xR3d1h0MI5pqra8kTRTDhaL/F1m8YYqXDiQjD97DwC9voYw7rmr80YgSJceMGwAfsbfNKQh9LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oa6LuAmU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b2YitDI7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oa6LuAmU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b2YitDI7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66888nnB2204042
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 11:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VJRwhjmuZ6tlBGD8q+Kd3+t04VvHKNxd2/aOrFmlvhs=; b=Oa6LuAmUQsC6WFEB
	RfLonfZyVZFtWtHoQE0KeS6ThFp5BpyhHzpQ366ygWM8wHC3zymwH82hGApdMvxs
	RK4nbPkgiy3Qy8o7qKp+fkG3bn5ZfRzRPfl/27moFOc3Sg0hoRY42A1YEBcbOdMV
	QDzYvsithFGWXhYZ0CV3Xlh/9bYR6qnAu/Nt0rrnwUV9XFS7PLPupqnqSVG/bhtC
	xNktRxkdyWSPsMyQIMQFCvrJ0IZf9j89NFWX+TkjVo0tfO0S4MAawlpq1I0tCkP4
	8FKuKNNbrdcEUIt8s9shnfElyrV55lN6eBuSVnWd9hybqE4MLHWPEEOAHHR9Sv5U
	cMvVzw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv111q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:18:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381e93bfcacso1374107a91.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509480; x=1784114280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJRwhjmuZ6tlBGD8q+Kd3+t04VvHKNxd2/aOrFmlvhs=;
        b=b2YitDI7eJhpqOQOZc9b+XqPJU7pksi5UowOXyGaxeaAKIOqz1eiZBj+ykf/DxPJNj
         fJPc9cdanapA+/yVVAezNy0kh+G0tEoq1x7If8vz+oIYVcecoHJs6vJ/X7XsE+/vIZL5
         mI/7wClgbH+4wqi4DqpCxLwWoZgWuvLJJrOdsRxsqvxPrns7Yj/C3C8+VGHKsyY4BsYU
         1PV1+Vo7lwE2oWeoVcurtmIAyaNnllSudU9beTCZdyiZlUpv6mPKbbQYgmyO+FyRr/We
         9yinmLfkIHqRg5HJlzHdn1nQE9TdeVUR5oZrcZlC80T93R3INcsSeA/68wifduXnFxrb
         EfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509480; x=1784114280;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJRwhjmuZ6tlBGD8q+Kd3+t04VvHKNxd2/aOrFmlvhs=;
        b=n47eaY40DQviQwpvoVsc45oKw4GqFYnimGze/EBgy+bIQMdlOjKNwoUTUY9fZ9+bRj
         PifjxnxuVLsa7fzi8I1HeyobR/NFIAenM0A7wvrQ21rXfkN0PhbsGScOkRDCai5TNORo
         +AzcLDoyR19BVGCX1oRvBaKjY5FuVR+OuCBx/2Fy7ixdgekDrwIYKcG7vPl6Ymq6coBk
         EAyxXQLgGMjTDU9H5TSUB/Ui98NMaBfr00A84k6yVmSGg6idY8uhrOYPTMAWAjdFGs4X
         S7nPYxtcHrk/G8TrbQNCj/QljXznffdgY0YFwS+O5jjE9KK8jLHMHYjubNbZEt05a001
         48JQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCHJpBYMsv9skowhzi985Lg0FrjmXBIVnGbYFIBLAXwCihKrliDB3mnqbZGtk07ZwJOC2aid7hA/+0@vger.kernel.org
X-Gm-Message-State: AOJu0YzJJMUAtgQsuvEGko2BkzsmPBl6lFVcH48mesHj8dCXTVch4NMa
	E6FNM/qtgwWBrMyX6m/UFDiHwotaj2SEMCF4VIHceLsrG9PCMmzgQgNgSn9J61GKW0iq49XbV7X
	oRaMTCtOX58xb7/cR8A92kA9/NyVwReSfx0mP954df72Km+KXz5GMpq4chF452vJ5
X-Gm-Gg: AfdE7cnFWLANv8vYHdLCkAltYCv9pF7q9OS8sqZaZEj27ZEW48nhUsFRXXAIv+JUoSE
	dNFwuubkotKKldukzeilrzXVszoUde6k3i/0vq92T+ZTt8p9spYn+6xRoO0TD9Bv9pjAn5d/Vu8
	37E1NR49kT/wERZPXa4CD2QNcc1t4dB4BTFIaF9w9ZRspehF2n9mpiL7vX6qqJbrSIEDRjav7Jo
	8j/dQ25qt6Lbp+jVRre+CCtm+cFf4ClutN5P0T80/f9XWxvLzs+eQkk/VYAdEnj6FWtzKXEa198
	nRYXOEaQGkpSb+7zpDGHf08iSLAiJV1UkTdv6/SA8AvKXQwa0Y08w7nCEiNkYF2ltPXoPKaSg2C
	Fy4nXIdfRb5Jl3nwwpBaGJLB8MOCFQ0D+4bOxmNI=
X-Received: by 2002:a17:90b:3e46:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-3894279a828mr2030953a91.40.1783509480494;
        Wed, 08 Jul 2026 04:18:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3e46:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-3894279a828mr2030902a91.40.1783509480045;
        Wed, 08 Jul 2026 04:18:00 -0700 (PDT)
Received: from [10.92.199.168] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d12fccb2sm2576438a91.4.2026.07.08.04.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:17:59 -0700 (PDT)
Message-ID: <07cb0617-efcc-4828-a590-407e4d3702bf@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 16:47:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/19] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-6-cc13826d4d5a@oss.qualcomm.com>
 <17a83e3b-cc47-47f3-a7bf-bc0c92f09f98@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <17a83e3b-cc47-47f3-a7bf-bc0c92f09f98@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e31e9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hnoEmpZtci1S8sv95UQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX8O/RxBv1UbbU
 pvusWnAQuWWDoivRwI0fQcdtgQxBzuobyGIqLZdZt9xHnydA3YOefkuCMchPeGO19hIVb4eDvDE
 GmndiVL4huNr3ufBY9ZuZ6wUL1y/UxA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX0FuWt4Mc6Y3f
 MCh3xMB+rYnySFvG4ZDJnaOmt9fXaMvOkWA/dmb4isqzy/PE8hgc1nfbaLx9FBAzr6NDcRAnM5j
 DE7Fb8gTST0DAaztrLqqsW7phM7UVrimj6qX/RhETb/Ojzr1jXljrXu6Xh1B2L3yews1/iSnQDR
 sDJlcXTBirp8P14geQdD5eXDfJBwiqQtVmth5QL5zlOMPzo7R/rR8iazsZzJbsbpb++zVWcZpX0
 AotzGwvZJbN19Is0xf5iaQcSI6mzaIGLUFGqU42OdwsyrJYFD05M4eJrmKXI8GDXxSl08IU1EAa
 JF0bMVzk3Bs/RzRhqmMYRzsrsVBXWhBZ6FVN4uRw3k4Abwu31OcCtoY9KNMlZ8K6261lwPQH9iC
 PyZ6nSspF+nnq9U1un4zICxQb9QEJpu6NU7f476AFIDE/6Q7oL9dahq8rv4fCJ2Gkm0kl5F+gaA
 0b/IV4yo2ecc9ks4eBQ==
X-Proofpoint-ORIG-GUID: XPJzR2Nxcj7ubHOXUTk8zAOccjk3vHyn
X-Proofpoint-GUID: XPJzR2Nxcj7ubHOXUTk8zAOccjk3vHyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110



On 03-07-2026 12:43 pm, Konrad Dybcio wrote:
> On 7/2/26 8:31 PM, Imran Shaik wrote:
>> Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
>> the critical clocks handling and PLL configurations from probe to the
>> driver_data to align with the latest convention.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>   static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
>>   	.config = &disp_cc_qcm2290_regmap_config,
>>   	.clks = disp_cc_qcm2290_clocks,
>> @@ -498,6 +515,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
>>   	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
>>   	.resets = disp_cc_qcm2290_resets,
>>   	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
>> +	.driver_data = &disp_cc_qcm2290_driver_data,
>>   };
> 
> Now that this clock controller takes a power domain, this needs use_rpm
> = true, or there will be a permanent 'enable' vote
> 

Sure, will add use_rpm = true as a separate patch in next series.

Thanks,
Imran
