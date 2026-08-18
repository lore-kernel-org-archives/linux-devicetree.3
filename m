Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BADA38F226
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043706; cv=none; b=IbceB78eFkw/KtmPQlOvJzSz3gHvNV/NbXkTmdYyoY20nC+NILOxslk1E01s8HaYx+VuEUdMpFdgopLtX4D1qaLo6VHQbOohmCyvw9uiRjNqH74sY8Cj4JPi2q3RZM8Gf04NZzcKq9J0znhb05D7B1ZY1XSVcBKLWlkWe0Orhe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043706; c=relaxed/simple;
	bh=pb2QXmWDRe1qWa3OnbTw5ih2alpi6jINWluLOqlN3Do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cNc4p5e1U/YarZ67Dmt/PJxiuznqnXI2iFZK/tpCq3m8IaabeHV7WCCS7EcfQHVDgfSUHhV/yREZ/DDeKQvZjo2ITUdPRMBcalw4zlxuy26uOKPT+FN9Xgl7aSFVyDglbyDaOZEDu8V5rzmd8OsXf0xLZrxVKAVwdwDWsQZQv+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKqlEk2F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLACySBq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKqlEk2F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLACySBq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8Ba5d645670
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXMj4xvl/6fCMpk0KIcN9SXI5nmvjMbOnCTA1HJw5ek=; b=PKqlEk2FgcfVN0Xd
	a4fAFtQj0UG6gEJr2z2FrYgd4p9ZqnyMA1sAtotnsyCi5DxyAInm114J+T2bOaiH
	D58ck3WadCjeZba8B7+XC9lMybX0W2OePItQ9Ui+Vjvf7DbzSgMsns6PvIpjBEL4
	ocYAyrGn9kwqshsdocA/SHWI5JCCNztG+xOdRxTXqokmin62crPssTU/8Br9KC3c
	votDhPP4ytYX3dPTRUAOZqJA+S2HF0oCs4KZeetKmn/9NnBmYBWHOFt1Wyf6TtuQ
	caa8CsCXgnNuOgflS7FV5rbwXmZPFs+muLMY30iSLqIXKfxmg8qjgrPWABDNorgR
	Bnp0lg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611bq9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:01:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e21552dso30965685a.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043704; x=1787648504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXMj4xvl/6fCMpk0KIcN9SXI5nmvjMbOnCTA1HJw5ek=;
        b=iLACySBqw2gmleCbpQSLyUgYXCcP5M4OcDcPX51usSMC/GTBChl6FZg13jNrKZCs9Y
         k9RCox37F4ato/V37h1o4M5sRBrDeDTXqcjP6ZYQt7NhxHYp4i2Z2nJepbUTExO5FGqg
         9qeo7P/gcKZZvPlDkanqWKrqbpt4/degpIKCME9peTliwtRxzrtpWURFl6KFsgagSax/
         JxQIuzE+mtegukVezkNDYsvmg6SpSvkfLPqM2MHd8dSCYc4lfPznmAtc0FB9y2pyL/IP
         gskN/16utw/9F2EfbAWP+opkPdamsuslwZ39WnE3uDGhlBJxgDPvkdg4KjE4kV8XOOSG
         yvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043704; x=1787648504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXMj4xvl/6fCMpk0KIcN9SXI5nmvjMbOnCTA1HJw5ek=;
        b=fSVpvvaNJdCiPLoDvXvpehtyxibgvrUPG8fLlYThH1iFN6iSz8Y0+PmXy7MOcoFAMn
         4VMvEuSrm46hd9gufnr0BFNv+DRqsw5C+Rp87doQHLY/li5LC/xE6/Ukid9rI+htD7qQ
         eyB61MFDSxICsCkFuO/7oaU3RNZUHm+oIqzh9uqdg3aO6oVn+Dcmj7wsF4HwhaQZ6WS+
         f/NjhbKqEt8r38tnp7IM+yuEHQACcVNonw7obTYo8u8rpbMhN+mwYPMtmV+3xtVBaFFv
         UZpflTElQZ7qIlFWdzwRa0PhFX73O00IZD+zYvqSREwAatWfzK1AdKYgeqAFzl/rzQRo
         IIXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpD3o3Drf4pQiFEzuloaq2Y/K99TKM9E4BZn3TVpuNtNAofyj4yEQYkylRNzDXGHwZVY86DFtL44MN@vger.kernel.org
X-Gm-Message-State: AOJu0YwWQFk/7oDgMRb60fkuT1afb09e3CU1tSq3gnWxwlw6n0QNvZZo
	DH71pqQjv7DZCkcIkDCaQohl4H3vsoTfOOi8raIwtNpfSP21t08LXzX1yFNRcYzP/M7L1UDWfta
	azTzMUhUbVC/zleR/WqovzX7B3ZUkQlBhvVdxd3rvVp0GiW0nJwm6+oPXA9Ip+ot7
X-Gm-Gg: AR+sD13s8l4ImUs6OFrXCqLoMrvRlQGMJirMsVWOshCVEvgAZcZ2o6v6dYFdPPin4By
	tVvpc0QmO2VUHkabIIFd21a0zEOR7n2IrdTWQoqBs7Iz28B6iE2SLD3l/Rcml5scEGcwQPqJbkI
	sUw1WWGXSUbtAXCT/94IxvRzsK6f+BPrP8uKTF9PS+jnZerToiPfoKUjkQ+rtj3736sMMxIK9vM
	eRvWkJvfLs0T8aL3mvHnoHKKQBwvf+GevhAt0P5RxtnllAjjs/Ou8HFBcNK1BJaExeYD9W0b/xm
	wheU1vyNzHvTSs+Fe4sv/dUyLV5xj+I4scPfL7+flDuZsR6vW3oNgge8tzk9j9NDHwGWm/4PYui
	uQA70Y+d73rF4F9HyLrzRd9sS
X-Received: by 2002:a05:620a:6910:b0:936:2f59:dfe4 with SMTP id af79cd13be357-936d1edd4fdmr2347613385a.0.1787043703623;
        Tue, 18 Aug 2026 02:01:43 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:936:2f59:dfe4 with SMTP id af79cd13be357-936d1edd4fdmr2347606585a.0.1787043703156;
        Tue, 18 Aug 2026 02:01:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8596d4csm1471059a12.22.2026.08.18.02.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:01:40 -0700 (PDT)
Message-ID: <ad484af6-9f38-44a5-9f01-8c8bcdb6fa0b@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:01:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] phy: qcom-ipq806x-usb: support the MSM8974 SS PHY
 parameters
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross
 <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-8-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-8-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nHU3qp3sJGKnni14LRA0r8zyOvgM5Kzo
X-Proofpoint-ORIG-GUID: nHU3qp3sJGKnni14LRA0r8zyOvgM5Kzo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfX3E5alQLHwJlA
 l05bppFqsVs4Ui75ud1J4gYEgQeKQL7OZfNtcr3QEb5kgea4zq8IKW3paCNTSiKfzrF6lsGmIJW
 xSjTL8yTZGVr+SPlMJWBtBhqe3M9fD0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfXwk5zylZ+z5rN
 2YLvFnE3fvfPrS+DCIhbV22DswOBRPc8c4Nlc7Ae3SELpJHaFkY0LA3ewSTDQuvgIUMd4L4gPwc
 PStWF5L8A03ydJ8CvuTh/Oa68iZq/LvjYo0ZzLmgmrxGz37/KL7GSsR5te3ez3S0/tbyKDJPbSo
 o1/F/pIP+VlxPKYw1H9ficyjZcGoybJ2qTvmUVHJutOowI0SxOfuBYeBr8isffT4tLrzoLwq8CD
 4JMCL/d0XoMB+P7+oatZBA1Zc/xs7xh3uUJnihnGpSzxt+WOsCHUEV8K7wGHeuRNYzmGHVKFsSA
 wT9LFed/uO8eJYkeEG0+sfoUxDTPlPf4i06K0ET4SiPC2g0WNeYgwDhSDRGpDKt7fzLbOw6djHD
 UVy89HCA9vum0U898RRNdTm8nfGVXJjvzouMz9EwVRmsNsXZAkiXjE+C3gOwxmnV1Pi2eOzJ93/
 bL0bcoDe65iqDbqH+eA==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a841f78 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZJdRkJQ8ho7aap0qdPwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180066

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> For the MSM8974 SS PHY instance the vendor kernels program analog
> parameters different from those used for IPQ806x.  With the IPQ806x
> values the masked write-readback of PHY_PARAM_CTRL1 fails and the lane
> runs with wrong launch amplitudes.
> 
> Add platform data for the MSM8974 compatible.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
