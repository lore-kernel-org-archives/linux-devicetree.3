Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D86D393DD1
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349701; cv=none; b=GIiPMuPZzcODxx3r0/kCjIAJrKhPy11Ic6JApUsI28OjMTLT1c3pyq2aLG1PF3t5aE7dB2wohl7cNcYxMBAeQyHr9KHl1OK7gC9JZPOPtLs5ab9CYrl7Ef/ca+kQDYo9kl90uE+xDJCwxGmPLC056McVbcCbUmIjQ2Lz7TsmBKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349701; c=relaxed/simple;
	bh=0NnB1MgNMR7uoJP6UWxzFUtlEQ+YNOOro6F0g/G5eqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WAfbbwh3u9MmIK/D8Xu7VSbQmzpAMegtMJFT60uL21Qq9zSalUxjBEAiNt2aoxZiPLyAPBY9rFzlrPbG9UVVie8DkQduSu08XUkQFgdEmz+MLxHD3GTvcUe258wwjP8qyuKrn0bpTc5Dl9JqaWivZtDLo0c9SpifANYlFqbfvHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nf+OGYvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDvshkZM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nf+OGYvM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDvshkZM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9g8WU3903825
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6dXF0IWEVhz/9ecP7wtx55JEEj+8kMK1bOYfgNiXuyM=; b=Nf+OGYvMIMjfsJaL
	MQAUHpWaesAXfDQqXr4BVEphIJD/PqFR1wn9CwK55Lzl187riePgomaY7+q3rfkm
	EOh/0odQPSwtxL7NS2kPLKQPVJSGXbQJ0DAxOj3WQOhZzm6EVYaHFbwJfV4xX1RS
	Rd+JLzXa2kTicwHMJdQDFDbIYvX0wDKS1NtiI+A9Fgfp9fxroLzpKPabJV1V0xhw
	1YVzfwUyXCIM9bDSlrHQTVt3KUJ0/38LPr0TvCkcMbilS30k6vI64RmP2zgaYvHJ
	55qcd6p+Y6XbBAu9BZKQJrkv3FRnTgzbUPynvRn8pNr9AL2SBfQcQFLadCNO3MrR
	zbcVmg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0hh5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:54:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2d15c360so40211091cf.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 03:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349698; x=1774954498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6dXF0IWEVhz/9ecP7wtx55JEEj+8kMK1bOYfgNiXuyM=;
        b=JDvshkZMeJpVasQbXAh+m5wheY78ZgL8CRzaGcv2MrEp35q6ZkMPd9oBEqFo4ba6L2
         5JnIvzk4M2O1wL2XCnFGtY9Q4NM+5t6OkNU6tV2hFzzD2WLy5/+WG9sWDZoazcYNPE8k
         LxglZ4dc9rBOK0Wu+CpqZ2G+5XwaIYfwxgdBReQ2pm48QXWM4v/vPTnoJzvCg2G13+9U
         kRCXdtQgrlflzX3EGuRH/yr37UsNu/H55i+jLuo6NZtquq4vyjDMVQxLigGgNL8mtCQI
         0AaSqiHn+IWS6ChP1FlVRDPrm74VkgPhS6HJ4GCI+kHcza0Xu/jSijiQcELHgKwpfdyp
         DcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349698; x=1774954498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6dXF0IWEVhz/9ecP7wtx55JEEj+8kMK1bOYfgNiXuyM=;
        b=ptk+Koj0IGa5LcDHngUJTxSa5jEp6zsK3indi7N6ibeggEjwuXfLc7Zc+R9MTTb5yx
         H7frTz3MhIdsD+w+rVftJMpeFxj/3Uthr1PQ1BLOuJAmXFjCWqd4XE1R1B9QWaX3wyi/
         EFlKQBJEJyvPCEhYHATix0r11bp8uu1ghNEgFUbvTca0q6CMwClm9gm4M0Km8hpPU7cr
         z2Xrkfr54ARBOx/ZpLoW9ra4xrpRqYY1FVMX2qeBWmLvBACi3BzJhcC0171QoJQO0CUm
         JI5DVZbGc6b0yStZKmIyqRgUkSDGZyMYGh1SZi3GXoNrbdS09Q9sfhO8KbgBA3ewVV62
         Eemw==
X-Forwarded-Encrypted: i=1; AJvYcCWzUtsmSmlBeYWOPVDmS0HQavTxSXBcrhV2Fz5CzMvEGP58FEl7R+EjV3AWWTxuEATNkueklnCQc1aW@vger.kernel.org
X-Gm-Message-State: AOJu0YzbjJWt/C4/mvVGvFcXIFfRQ3KNH63kh3FpGOaSUMx7mLLfmBdi
	z1zBxwvBHkI2upGN83jFx/I8L7R61RqS+oZZpmRb0wP1tsz5euNmy+cwpgpzQMrSo/yARwKDTdd
	r0QQ0Z70UmGbfCi+aJm5EzH8j8BhCOYERsD8gY95S/VIb05KhRSGo9BGZAjoR+s5V
X-Gm-Gg: ATEYQzyMz+KpqZRMn4cYzgsRFN1ciJrHyZHsHqFrflriJmxs626e0jWzDqw7pqqrAmq
	rt1x3JFxIDQYwL8svd3gelL46aE7odq9P3mBP1umU5/LYbMylDlBu9ZH776X3zxGMU6CnXbLOZw
	J2vZpc3+J5dkr1+uAJEaTTQVaEBecaQZ7fcsE8I4CqkVChq3oshP1NNdIOnPVhZ8/51k6xlQlXS
	dU5QXU/XFjzNFL2Aqa3PcKhyDPaeSB0suqzYAjI2zesd0rgUkmTN5acYcSWx7tHqqsTFXA1N+8M
	8A+hWnuOCU2osgcdl/ilaKZesbKKPWL2dJI8yEqtZgoYLjg0XsH9Zx9HK9RgbyIpVjYRJ9FLbl5
	lqqj7O8fyK4T0uZvQmVM200n9uKcO8D5m/KLFDbK11aJnjhBOC/X+3/sX+DA/vECtRowDkiOV4P
	HHxVg=
X-Received: by 2002:ac8:7ed4:0:b0:50b:6890:fca0 with SMTP id d75a77b69052e-50b689100b7mr32954371cf.9.1774349697710;
        Tue, 24 Mar 2026 03:54:57 -0700 (PDT)
X-Received: by 2002:ac8:7ed4:0:b0:50b:6890:fca0 with SMTP id d75a77b69052e-50b689100b7mr32954271cf.9.1774349697244;
        Tue, 24 Mar 2026 03:54:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365a166sm628563566b.42.2026.03.24.03.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:54:56 -0700 (PDT)
Message-ID: <f3d76c8b-17c2-4be6-a205-c163816ebfa4@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:54:53 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] interconnect: qcom: icc-rpm: allow overwriting
 get_bw callback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
 <20260324-msm8974-icc-v2-4-527280043ad8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-4-527280043ad8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oiEzIIXL2g5P1ki8OqQu_mEII6tT2Jmz
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c26d82 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QE2Rp95VnyMwAnmAKP8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: oiEzIIXL2g5P1ki8OqQu_mEII6tT2Jmz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX7uFYAke0qZDu
 VvuH5RNwK3Hn+BONArPbGCtqkhRVxLv6lhbrTXhNADLCXeNj7DqIieNt/ouwZeW2wG453eYDahK
 eImMvT8WanI9gmcvSzO3QIeHfMUYz5dd0kW5saCDkET5iddhm0tJ4hPhrYd+NGoqjoAkIHKrCH4
 WSPzwfFWiU7DY8tt6s1jr2YOQ7L6CfxD8thENfrqzbMQm7kKsVON2je7C8TbvoF0XEMf6PKUxBP
 KSkBf72ZcLruwNM1NR/fPSM7bFlA1RK0uS5g2WU15OX3mHTbkZXjbeBxZbtit7EWPmlXKR9sDm1
 8sb5nH7PruO8+Y7+EDxDH929xi58eBYHCHtyrNA+uaXGAECSDcuxYrTTu0ilqberAzaDXRgZwgp
 sn8TXbKqCAqlWesi3pIoDILrDLHU+e9L0hVg2HUQC6/TFtfAmpDkLF0HpVtKcR4zZAMG1rBsMJM
 kuQmPUATsuEH4WJZgdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086

On 3/24/26 1:10 AM, Dmitry Baryshkov wrote:
> MSM8974 requires a separate get_bw callback, since on that platform
> increasing the clock rate for some of the NoCs during boot may lead to
> hangs. For the details see commit 9caf2d956cfa ("interconnect: qcom:
> msm8974: Don't boost the NoC rate during boot").
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
