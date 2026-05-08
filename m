Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E113A6B77
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 09:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233343; cv=none; b=GoF33HvuhnhY91Q0Rn/W2odKu2RVd8DQ5yZ1AP8EBz/XPC4ixf2khjj/A4IW+MzjbdN7xJuv8LV+oj43yNC/LdJCpfMwkGCdrIv2My4hI+hRAnpRvwEOvdaC0LO6DV/ZFdns94/+0dVZNylBonZUIvKq89yOaf7gCj7KYOf4+3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233343; c=relaxed/simple;
	bh=ok4NhKFhFvcs1mNcsqE+TbllqAiBSnTux/fH9ElthSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QiiTKrol0fmzUYhmcr18+dr9RcBovPVqpraYqTWB19/aU7QxMIbD6kwPCAaoDGlr53p4xnWgVofcOhayaMk1a2nnKKlt2xrLvipaiZss38H/qhg+YMqliPDGDO2HONFh1l22LC88RJ7zNd5Qiz9LY+fnMO3hMicGvV0JLVCCwVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pu1MNub4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UXpEutrU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pu1MNub4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UXpEutrU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485ABme2199545
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 09:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HH5TCDVgIoATyvoRqqRAUHJllMmgH1RFO36Q4LRp7d8=; b=Pu1MNub4sFd3Qznk
	05DGS3PicKOpMtkkydkvyBwzVd7kv+J+BRUMihraDy8EVOrnMUm3kcn7wcULlggv
	VPJ8HdLpQMT5XkougIv6J2gFaN80sIbUYmZEgd2VQ3QEg7jycptM6q71Qv2KfpVM
	hac6DG4swg6p+IaSgkpA5TFA2YgkJ03EtvqJ9aFb7ZMtMjDdlehdNUzLhm6Qx+qZ
	UOJqFL4hAvtq6SwT1kQcptuiJYCrfn4cIGI8sMEgEp2vy1KMkRt6/dRTiUDY7VnV
	JG6Yj4GqVow9LgIvuUyhQoVIhUJqiLNjNDXTdCsiaXKZJKVD8GSo3fYuFJBgP59z
	Q3qMgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sjpdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 09:42:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d59968444aso47973185a.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 02:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778233340; x=1778838140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HH5TCDVgIoATyvoRqqRAUHJllMmgH1RFO36Q4LRp7d8=;
        b=UXpEutrUZEUgEOTLXUMRJKHhWYnnXjuxILIk68+qrFI5bZMq51v/5UW/b6KtQZ1zkw
         eeG+f3OvaAAOvqcb/GHMFBa4A2mVcPW7jCvYicPogA6AYmlkRd8vs9CGg7ed4WvRtWyd
         B+pRSmmOf9hKCqDbWMz1rMMTaxPEMnqDOTAosvPX6bnW4Yd83rJ4WRUhkiNiJ4rAbFNM
         E4Xs/ZFNhCaTmZ0mMMKW4aRHm9fXk3/mFK6+lXN+yHXtVJdSCdJrXWtrwEb7Ya1HzIiA
         pcUCJCNGTYXmZY5jjfk7QM1UOyFrRMb21rjaK9s7MTY4OJ/ljECUH9NSbEkKgdwk8+GG
         LA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233340; x=1778838140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HH5TCDVgIoATyvoRqqRAUHJllMmgH1RFO36Q4LRp7d8=;
        b=DCCQMtaOgl0yPq4D1h9cxc82s+P9pxGT0ZkfNW6hliUgTv5R5/8FteswyDKdC09SNA
         y8meVpZdz4AiCRb0HMyTlPt4Eiih47Auyu+/mQfZOcn55kvEmyYJCgL5G+Kc6263sAl5
         WAO6JgBD/6SLwrXt/KVoz9UlzbawscFw1dNVCshaLB5evYaak+qM61QZ/K1OqitI3vrK
         30lqpp9FL6TsCPXUhcmwR3OS392edzM1iNkwuha+oRt2Ukv6DpQkHVwwgImNaDF++5Uy
         2ZCRDAKKr5brBuzUFULvPvDfpVk3S5Wdu/Be7dWYfME61NqxveWJS3UrCeahSLftw2Rg
         bE7w==
X-Forwarded-Encrypted: i=1; AFNElJ8JzcEIMxs63zT9xyhx0ODcyffwR8ook1hxstNaZgElRKF+3WYZ0rTWr74adgDp0LZ8T+gI2iXRfL+4@vger.kernel.org
X-Gm-Message-State: AOJu0YxIYHe2bMTTLtEpKCDbYS/9Ir6kdt74ArMI0Aw5UHv2VJ3ylAQ0
	/zmNmPuOKXz/1j3GcKfGiUB3/a/lSrUPKD2dTSQfAL6kx2KR5zPkwCtsJ/rrKsBipgj5otuNyoG
	9oVnpkqG5ppsxzp3N+FYPFIFbM5j+sUEcQ1LLT0ltxYJjKoUFseZQGzWUtATrINzm
X-Gm-Gg: AeBDietMGRqILECAbozdcsalsgXjyThRxGGAxy5LaB9wj8zgwSEQDnkJvn0DvYFkG5s
	9oNzjDkRyk3HBvXEYcfL2QDZkig9z+vZyygl5NRIxUZFusUOoohav85Wiar/1SGwWOjFmhidGkn
	sJOKkHegxgo49dknxelA3ABE4K8k504PzRktZO20kPgBU3W9tr32z5NROB0nxbKc6TE4PoJggVd
	Np8d2XQ7PKFrEMLC0kSmtBxCj49dTBJ/RjSkDVM8HlC0knwuX/nXlsf48PruNntG/XsUXLxglUY
	VnfZEzijuwQk8uxjn9Bj9CuPPfovmu/EsLRaWSdKXxkf/7/eUW26GGAumVbGVupHDeyggh48k3Y
	vqOuIxg1uRdhtrRUpDbJXXFZZrbqZlGC9NvQSOi50j1Vtl5ysIfY/u35ev1CH66fzs/cTFF3UDr
	rLjJk=
X-Received: by 2002:a05:620a:46a2:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-9051ee7d238mr1080082485a.7.1778233340219;
        Fri, 08 May 2026 02:42:20 -0700 (PDT)
X-Received: by 2002:a05:620a:46a2:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-9051ee7d238mr1080081285a.7.1778233339848;
        Fri, 08 May 2026 02:42:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e1a221sm451304a12.24.2026.05.08.02.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 02:42:18 -0700 (PDT)
Message-ID: <510811aa-df44-436b-a435-b9cd7ad16367@oss.qualcomm.com>
Date: Fri, 8 May 2026 11:42:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: drop unused
 polling-delay-passive properties
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-thermal-zones-v1-0-33d4395b1be9@radxa.com>
 <20260507-sc8280xp-thermal-zones-v1-1-33d4395b1be9@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-sc8280xp-thermal-zones-v1-1-33d4395b1be9@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA5OSBTYWx0ZWRfX8yKzjjqBbWVV
 9tso7qqrDPWBsi8qUN3FT3ZhsEgkBowX6qIATmixKb7MW1E2e9d6+J63R2N24lbLcOQ7CoQ9dqQ
 GgTcZchG3zrdNVgbr5QRzjNVId/WsluuO1HcZ8UGZlVkfAcZgVYFBZ7yNIhsOh6Qy6e/u8GnRnL
 ctP3I4RGF2eGWP+MQ8i3GZaZekpB+6kAR8bxvE63zZ7/EoK3oXfK0NrFQqrjuGN7BhwIOj9utuG
 o9KTN9WGGLfiPE4KnLw6usYR00vQiObLD/hQzwE5PA0GnP7OLFDPmdHxgEI/5VzZ5xAYH2Cq5eH
 JV1NyVb8aKIGyb0BOwfWjpLmdlN2XhNtzYiLfj2gXt5LH247tEH6FfQ23GTwe+yrfcOmPm0ZhBC
 F+Vss2hqU62Br1fReUFdVa457Uk6Vwb+ahTMvtQ/41q2IS73VuDMU+kKprwJgO2l6wz1uP735iE
 ExZoK8Is4GXtsRT3Elw==
X-Proofpoint-ORIG-GUID: m81-wg33nAcXeVHQY9VoKjNqY20aYsXj
X-Proofpoint-GUID: m81-wg33nAcXeVHQY9VoKjNqY20aYsXj
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fdaffc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=nRX4f6Zm5Q-hqNJcDBkA:9 a=QEXdDO2ut3YA:10
 a=2o7jZtLZQagA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080099

On 5/7/26 4:34 PM, Xilin Wu wrote:
> Remove the unused polling-delay-passive properties from thermal nodes
> without a passive trip point.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
