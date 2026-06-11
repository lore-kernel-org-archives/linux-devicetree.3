Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439EE3D813E
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176339; cv=none; b=iR84VoLLQkO46kegebh3LLleJLiNIBtkgae8E1te0K/srVaZ4yEcyIUttFS2biLZhA+GosNQ1JTdqEoRnt3vhmxBBk6CIrE2nGoYKDpeNujZfoHjMLZuN07JXDH/gUUoE4qvAJml5iisWRMtYhUF1t2BrjUqz2t5+yoXpQhVBz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176339; c=relaxed/simple;
	bh=k8RSWna5l+sutgVFwIL4tV7HYt0GmcYYL3d9N0V3OUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1+zQKOh5/bdUR6563CRZjBd9KhegesqlXMAW8D+WpN+v0fS2DMHhw4jNRWgjyiO5XvqIFKowJSFkeFNRQSIPnjW3nj006klc4CjigNHa2egogu9YlWyjGQaFQDYUXE+N068j4XGIpXWWWed193i4gQ2d84bWf+xXE7s4UOdIy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAjhRnoF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D0vhFYY6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAjhRnoF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D0vhFYY6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA11wB299664
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2YOVwunfwE9zdytOfHRsQTwQu8TbVNXg5l0jybiWzY=; b=NAjhRnoF68q3xKdd
	wThiFcCO2aGOsmuncKDZT1RXAzDDc8uGWF0fiUieDqzTbBm/gvSSgiUYzgNgbxoi
	FOfmfXlM2tV+6FVqckWlHfgvx3uMqDzRnzD+f/bwkpPoj9wmal/zMDik2AZmfV7c
	SfpPfX34PvL3ReO64ZrmTASYwC6YkTr+JWA4OpSeYEaK5EjkGZ28tNpJkq6WQ1bc
	XNaS2UHo8hItqWrqmSTcqBVbwDC130Ox6Zmo5E0VFfRp+Z5AfPDK7ZTZPFy9sbQb
	9C4vUAlkoR/csJTdxo9a++LmvDoj/gbKrgj0fHqMNk8yeMNZaPQZFAMZZGsBqzTz
	E/Ox5Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7032kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:12:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b982ec27aso5779438a91.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781176336; x=1781781136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2YOVwunfwE9zdytOfHRsQTwQu8TbVNXg5l0jybiWzY=;
        b=D0vhFYY67IsLKT/blh3AY4oOlBm2Z9KX89DqS1fmZMVnvetpLXYSfQShQQa63n8nCG
         3jxxxOnyvamGqz98ssORWYGJGaIiiP90q0spKuJ9qLI0dEHZjhMWhdbzCwDayxIBf7KF
         ABOUtrB8O88gi9QkEjAk8TAeYAyoZF0Xm3dcgbRYwaES/vqz1pQH5oUJkL2x2TpRlB80
         4oOcuJXwxjNqF+nfH8DstO+Q0CNddND6K2XGjlW0gCRW9SxmGhVYLAMqb8gN7bNxl+0e
         5IAXzHIPHYYbp0cMHkw7vWfUcUJUXWp1+Nbx+z/ADfM8SaBvscAhsSCOIfoXV5dgCm97
         Padw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176336; x=1781781136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2YOVwunfwE9zdytOfHRsQTwQu8TbVNXg5l0jybiWzY=;
        b=p42vCreENAzX0VOmR75pUEX5s7p+KuqbcxcZIAnRDXPJVsMnDR02VIcl3+ZAMna457
         WEA88Ug9CnLBWLp9orLvoeMnt+BG3ngyYXpDa6DV5W304y5UsxUVw8ol5QGOXcD+U0v3
         y4aR//5TKkCuTleHs/f5OyXoSrfI9CYX/0TT3Pn18nM9qEgQMiNvnORF1975iGOdLn/e
         +TSoI2wzRzC2KJhv3xr7LHfa+Y0UgnT3GWNWqW8jRUuxWfkffffpXrJzmEHrJyummOFk
         9mJQEpCf6rWC80VfEgyuNnH2Toma5t0OGjSj7zqOZnu2ddBIgC6ljToi2fDM+k/qFm8I
         BDbw==
X-Forwarded-Encrypted: i=1; AFNElJ+dtO+dxC2QwPIzvN+mjDjh7IXYxWhKnYkHGcPMmehRqejB5uX7PPbeN/GcQyDDQQ9j2eDR96c+7yLN@vger.kernel.org
X-Gm-Message-State: AOJu0YxvrFH/LrOophyKF5XwjeVnUZ6DF2liD/+5igPME021oZHwWhP4
	kBnSZzueS62dr6PQB7YlzPuavFhQEEIrF3HV3Jyvq+sEnkjSHv+thAK7KRHqUnh0e/UmdK5/Erj
	CmBGj5CL/cI57f7tH+Dmz4nnzNbGIF4vOINhtHAFunMOiU8fgFhn37fCwazVfInUs
X-Gm-Gg: Acq92OFAy3orFCierX771Xq4L9iQM5oclqaKhIhY59q/RUa7cftshXsfWeTvWXaPZz3
	nVyh46JzayRPvQgqXeA+HsWjhk/orFFoS2nA5BIFTFCeFansqXv6ipupB8NJRjOBkjafjFEcjp0
	gUZROnKd/jdl1n2L3gg1Vw62/97bTKo1uGB7MWgGoLQQGW+HQBDpb+OqaTXF5CqbeJQr9iMbaVT
	ZHPJMnAi0AKpjvnl+X0kjOCycjJEO8k0esCFc/KG5Erg71mIV8kK9VaTfLCXTsZRG+MhL6z59Ql
	HxmEPNQMT8+GRaSLa75Ppr2gQFYj30OP0ZA2wyBECybF1jZEUccR7WbKb/JCqLUebw7HHabKMV8
	puaYBmleyXbxIg/Ou0UErhrYg2z7KoucBZANu7eta/XNbCFB2Tv6btH52Bq7rcFo=
X-Received: by 2002:a17:90b:2d0c:b0:377:424b:59e3 with SMTP id 98e67ed59e1d1-377a937f654mr2732738a91.24.1781176336174;
        Thu, 11 Jun 2026 04:12:16 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0c:b0:377:424b:59e3 with SMTP id 98e67ed59e1d1-377a937f654mr2732683a91.24.1781176335715;
        Thu, 11 Jun 2026 04:12:15 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377540f7ec2sm2193426a91.15.2026.06.11.04.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:12:15 -0700 (PDT)
Message-ID: <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:42:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5Jg1JjAfC9gulsgOu-vbX6MuDvRLMNJx
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a9811 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JVF5FwQYlvdi58aEJx0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMiBTYWx0ZWRfXzktas39f/7vo
 E3fT3Eks7JgzHLw5StkRWyIUG51TUzUr0glPWyxMkZQxDBi/KVUVy2YEANngO/gOK2eYcnGajYK
 AgzvjceHwUxoTX3oJEssyv8rcz6nh0+YT3T8HSI38E5QzExqVHCf8RLY5l3TkRvYcnuiU26OegD
 th1FZbyaxBgxMY1ngCXpkH5v28c/m74lz486ff59y0ARznOXnMdKDA/z7anoq/EvKP9a0Z6Kv3J
 UzXTWOHNz75kT2limPvxmng1O+RCGZmCD+ZAbyEIEtogaWw8+YxAmNPdgidqt9+vQT873ikuMG7
 TxXsN3045mIp78Zwd6vWCgYugtq8PtVZbqCx+Z/2xwTlDqq5QvN6fLxKwpfjo2OVevJPvtVrM0L
 m5unoFkGp+lPiNU1CPetEbvRKjaaVWRyNDfywOCXaa1iiotS8PF0O16+vTFyoG+xe47KvuVXWg9
 3k95sU9nlueGdpGz6dQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMiBTYWx0ZWRfX42A+qZKcVL3s
 TW0sf+bodxQnVInl5pGYiZM8Akx/GVnQkA7svoKejLCrITrwI+ZOVOGZVGE0lWKEsAUwlJzM1g5
 wa0mbiC3LPemhOlrusiQqEI3CxgXs2E=
X-Proofpoint-ORIG-GUID: 5Jg1JjAfC9gulsgOu-vbX6MuDvRLMNJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110112



On 6/10/2026 1:01 PM, Krzysztof Kozlowski wrote:
> On Tue, Jun 09, 2026 at 03:52:56PM +0530, Gaurav Kohli wrote:
>> Document Qualcomm PAS remoteproc thermal mitigation properties used for
>> QMI-based throttling.
>>
>> Add:
>> - #cooling-cells (2 or 3)
> 
> Why 2 or 3?
> 

thanks Krzysztof for review, will use cooling-cells 3 only as it is 
backword compatible and will add why part.
  >> - tmd-names (thermal mitigation device names)
> 
> Why? And where is this generic property defined? You cannot just
> sprinkle generic properties in random bindings.
> 

Ack, will add why part.
These names are matched with the thermal mitigation device identifiers
populated by remote firmware over QMI and define mitigation devices are 
exposed as cooling devices.

Without tmd-names in DT, it is unclear which index corresponds to which
binding. With #cooling-cells, tmd-names in DT provides an explicit
name-to-index mapping. Please suggest.
> Best regards,
> Krzysztof
> 

