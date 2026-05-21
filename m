Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C960A36B04E
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342954; cv=none; b=mpbc5odlP5mxcmgcbsemhmam3n7mBkYyxaNIXslad+JjHRBxk4U03UiUzLzBgssD/dU9JijaG4Siv7KnLdGHAkYH/F82xcmdmd0S/XjLFDCra1ktkgFCoZAPyB1G2nIU34sU3Zw0b6JYHiCpfJpxTOyBUW0VW9LrYcnq5GWAAxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342954; c=relaxed/simple;
	bh=F7VqFNmZGbADQDE8OiZtq4IHfudgK7KwtlqE4HaJ6zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BIfhmUhrInEiA3ycXAgRaUHHOe75V1UMykH3U4FoZCPh5e8DBWXNcm2qyW0tznzRBD89vACzc7Xw2PFhfovlaMbIrleh7ebKaOBhmsKDPWDObQWTwAiuiBa7XJZQ257q4hq4R+FwPKAZWgTUWYc8itNKjzfGTAcjzLXpokp+Iic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckzqee7/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZEpjkxt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckzqee7/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZEpjkxt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2wXmS2180418
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bB29QB4y1Hf+TL1lvG+ncW8LElTa5mItRg7WxbcXeLY=; b=ckzqee7/9qSCrBMj
	keOMfh7G7p2KguQL7LMcbKM3GSnqP1uRbmfzSNQIkTvOv1xjgYrpNq84XSPkrYW9
	JXf17cN1ReHWSiGED8opxx6oStfDaNU/JnB47odu8D2buBV2H/lYD30cE/eVz8wP
	VOP68A/7doxJxIGlACVv26Wll9iF881Tnc1o6+cLNpJRKHicmWblC8cwsiusMTy2
	wKldKMBkjE64LLf2MdEqpz9hCKPcMKZ1+S8TtAj54NE+z5GLiKbCf5bjapA/fyAS
	/9ljXFyxIFH2q/3FuWtxMvWErqrETwAbU1LKvFqWiMSyY0lwTdj7ck20NdQgT4q4
	gvdBHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr30jtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:55:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so81131925ad.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 22:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779342951; x=1779947751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bB29QB4y1Hf+TL1lvG+ncW8LElTa5mItRg7WxbcXeLY=;
        b=aZEpjkxtW3VJlmiu2mlaKxXycoU6OfLpNCjqfqpRM2JznktNzUC0wbKUI32OMgm//H
         zWU7A741K2pINgNNT9NmvYkTEM4R7EjQji8McKPq7sWTQqhZEah73bKFZBPtyH8D2ooc
         JmBsDHKr6hMACpPAx5RgayebwNEGQ10kMaTkIpnDJY9ql1CdaYGSEbo1Qan1HcVHWkRT
         WJXjfJarT7alyDuuRODeCRenAivgKJ8EtzgOE5/2YsB1866CTRZdbi8uwifD77RAxjzv
         JHaMY4FhDItNG+X5NHDzb151tUuCAPnXZSgjjEpoGssoMWJ7CT8eEjxIoUoNN2gobrIK
         lLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342951; x=1779947751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bB29QB4y1Hf+TL1lvG+ncW8LElTa5mItRg7WxbcXeLY=;
        b=LpJ/JXX+HgUO7yK0w4EtWeuGXBQSyRKzP9qkzP6nbnFj8NFAmJbEqUO2F8q1fu6W+N
         TwqIR0bQKM1MRflic41/yHlLXVy8EsnwaWJVyS2H/CWlOmpWHQWIPBXnMbaTH7eXMDgB
         JIWpC2j5NrOS0DrHV4VumDrSvaZtaChTpvqn5MMNl18t6dgbU+21A/+igdKLxJBWVxsn
         lbgs/+whwc1yy+tA3w8ybyfVNSVW647yVghd7kDs0KnN9ZDSURN6cPxbW/uB/meVNQm/
         oGXLB27jAn3c6I0k/MJ3mulEfhDjVJijJtLplfykKJhokQ4C4vRPkHLZpGbLMo9qvR4Z
         ZQVg==
X-Forwarded-Encrypted: i=1; AFNElJ+Jbr1EE3XEarq8+OzPzNKeF0MR/uSnbTawU2nO86v3zpaEmiH6cun/eQoVSx1UbxO06fOH6FN8Iv/1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzft6clCiJ75fmh8n2NMW0EsbMONBw5Ed9257Z9O66qJxxi6V3P
	XZ+dW0OvJ+lWA2m1K8QTGBzEt+NXi5/3NPbqitr3PrdaWiGAskc2HRKTvONjfuA2k2BDvEn4a99
	l1W7+JDRwx4XX6gOrqyNVezXQXsqKnlxeVtRSGpQigCb5WYT4yVBPX1+pGy5Vg2Ap
X-Gm-Gg: Acq92OECshXHMGWnNwsX3s2I70Rbui0eoFjktxbCx0KtzcFWp8NF6jz2xPGdJ57+eWP
	u8Sc+E27VhUTORyB1HK066xCj/HOa88GNChiA6hAVEPmYj0gpNEw/Cnj1KKyamzqdJvFilNf598
	3bpsFpTEInjJvlB/46/GFYv1uwCvGVpzNXbibqTHrzqGPzOSzmm1TsadsCxjAyQNm1UHei6YdoO
	2R9voBeqvnlmvmJe3do7QJwcLaQdF4E0C5vZGl6YuddikdKPcs7OU+8BYlSezrTTs0KNKVkkX08
	Fx3X8SeYTUhaacMSPMJg2lencMjquySvfTt0GPLRL7XW2Im3FzUPqgMT45xC4LSmS69m3qmIUdn
	6+g6jHynCpiUaFy9oPTlTshML2hbP7s3np3qyeYxXC8L4oJwoJ8dBLr6ClwKd
X-Received: by 2002:a17:903:98c:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bea33315admr15185295ad.18.1779342950672;
        Wed, 20 May 2026 22:55:50 -0700 (PDT)
X-Received: by 2002:a17:903:98c:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bea33315admr15185015ad.18.1779342950241;
        Wed, 20 May 2026 22:55:50 -0700 (PDT)
Received: from [10.92.215.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2cesm244847525ad.14.2026.05.20.22.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 22:55:49 -0700 (PDT)
Message-ID: <1de2e8a8-08ff-439a-a0a2-fc1387a7efd0@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:25:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] cpufreq: qcom: Add cpufreq scaling support for
 Qualcomm Shikra SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260519-shikra-cpufreq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com>
 <20260519-shikra-cpufreq-scaling-v2-2-2b09f0e1c9d8@oss.qualcomm.com>
 <fmqsbwm6is5qzflvyt53ax3ls5vnxabb2fbl4bttbcxjnhnwwu@x2jso7rr743y>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <fmqsbwm6is5qzflvyt53ax3ls5vnxabb2fbl4bttbcxjnhnwwu@x2jso7rr743y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0ZNTAtXfFoDLQODWO4iKRDv3qziy1W8z
X-Proofpoint-ORIG-GUID: 0ZNTAtXfFoDLQODWO4iKRDv3qziy1W8z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA1NCBTYWx0ZWRfX7BcVLR+w8z/i
 cfncqxnwxy79WIt/LV7+r9KOiHOkVTwapXXtv9vSNPjEXtubeBN+PWjw1P9dzQjfeMbCyMP0RAw
 qcNS5/iLTV6gdyHh2H1q0Bi5Ck8bKXUYiYY/gLgjLCZOkjJ3FKpN45YG33GWuk8LCdE3cCPfl52
 Wc75/1V8NkcOS7WjZtw4e1UJiu5fmozBQu/BGT1Nr/BbAGa7P7dDB3E1zITARCeNQzKHljZjyQi
 NiIqt0g3jNXH4jb66LofdPTOBapG62WlsMCMf1mwoxDQds1QiqlvzUtxrvv2DFkpyPUDCz1Vq/D
 Y+2UPRjB9SfvObILY7UfNHoc/o5HTgsIXgB+clxfS5gzexwi/ZMo+S2KUlIZP3H6bSBCRcf0KCz
 yVurmn7URACtirB0/snerEstBRcDE3VpVk2uQSKntWaYFv+fLRKYTaG3dSqwAPlooM7by6xN4aT
 TucThNouy2woTCnz6/w==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0e9e67 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Flm-1UoPJwoPlLdpieMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210054



On 20-05-2026 06:11 pm, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 10:58:04PM +0530, Imran Shaik wrote:
>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>
>> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
>> but supports only up to 12 frequency lookup table (LUT) entries. Hence,
>> add shikra_epss_soc_data that reuses EPSS configuration with appropriate
>> LUT entries limit.
> 
> What is the drawback of not using the exact limit for the LUT table?
> 

Without the exact limit check, when all 12 entries are populated, the 
existing repetitive-entry check may read beyond valid entries and expose 
incorrect frequencies.

I will update these details in the commit text in the next series.

Thanks,
Imran
