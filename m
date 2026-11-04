Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779428;
	b=SyraUqFjEK0Jwdj0f8ffjjzN3QsbtH7telxXo1odlrMqPV5/ZBuVM8BbC589exxCudap
	 xjyPj7u0EU/qYeq39/bK45gl4x8NCoDmbk/8tEEcHcTGXNilsbNkIalHW/HHAAmJ/R4iL
	 fPBEfJOiGXfhWSmsiAmkm6J2zDMvgzeg90ey1cgMm+evWxpRhTh3Atsg4jqEkG0vuTdyz
	 obF549k1K/gTJlI4DQVC/85264D0DrwDBklSgu1GIymBU7+ULcyJc58TIT3PmDNONCyub
	 rnewt2slG1MDdComnClfPiZC2zkvO7kmctU4ULbole+/yZKuC3rQd/KL2V2vfrKpk0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=;
	b=w1PkBWcmn9ha/qFAkSCei96SSUrx83TPCznUblYHrBNwPklZ97xTdh3c1vG6Mb6b0Ndz
	 T4RCVDDU1G8lW/+pNbe/oAPrmTd3B9WKvP2vVbx/J5XbBsCqDrLeMGom6/JG8Cjjp6GAw
	 mqWuBHkSa3XrcoEC8+ykj0Tp6XL47g8IYvgaPvRuedewOzMSWlFhgssVih7DU+8ebnRCM
	 7I9HrfwryRNKgZEiwtr4gG9j7eMvrpTPPEqLb9s9pIgR9f1SvpuRNgTHxarWZchOtAR0L
	 BnVBspFOIyDxFua1VY6qAku1J/ahEAwAU4PWL1v9upPFzw9T3ArwWfyQc9ft6anYpLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NgIQJR2k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPrMQ0GJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18881606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18881606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NgIQJR2k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPrMQ0GJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A46x6fN193435
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 08:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=; b=NgIQJR2kMDg6KvMh
	1FVNp5L0EWvVnU5Bq8CVSln3ewpyUsV7Pj/bEHayRAUXLEjpYCDnujxPz1a4fX9U
	X+93cPcL7xDRyiEMLs54jHIv4eMLvw71YfDGWTELeV84byvpUhV4jpe7aDH2RSR1
	KE4oVh/hycHS5OiS1VcKXMCNJwHWQmtnTVXl/w+nNsB4e1pv9iw7AujOawB46pwx
	C9qApE20iw9BDj/GMQM1pfY4Tm+q/8sFJ0Z0Q4yGBuDRO5eUJQznPaae6s6ZS0bl
	z7tTwtEgQwuAN4sogmRxFNw7JF7MQ/RCq5j0K28CmSTcybK5uoNLCUZ2Yvy5j96q
	TJhk1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8njq48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:03:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so14494485a.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779426; x=1794384226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=;
        b=FPrMQ0GJuyaSguLfQ1ZBvEJG+Q43p/9mECrmpdDd1D+HdvVyWZ9ksugmiVgQbXrMxJ
         JrjXcRp8yycicvRuWXpdUfvJ+t4fRVBXlPAdi5GQEdjMSALumxAKS+kdCjNSSSxeywWe
         myri/xG9B+32pA/fvKCIv2bOLbXvuCynWhbEfYQnw2/6PysvbvwdxcjHOuDFPnwDQHQw
         dXcJ0Lvm0QSNiov78I4/GG5lvqN8eLpkjfy+kSR0CQtHmVytQXUpbqseuxjLy+uTLXp8
         irjgsmDVnNtlIgohwK78M+cqisuvSxonP1WkYuTndR1mhJeiDX8KQlALTWFsRPW9FrLx
         Jfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779426; x=1794384226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=;
        b=pJv6PpseAd/xgPeAalpkz6Llvv3n5oGz1CPdDshG5pf6uXWo0dTG23D6WrHh+dxyyU
         f5EAukxPIw0CtyEWNPW2845UUB9mDM8542tD+9iID4pBYl24G8gCyG05J7aEQXZD33Pr
         8ZZCR8kS5Vt7XrMOFkLsXOv8w/kGPTrAZ0bzYV6ayCJjnzE/0n6P+HUqw/0YOwUAB7KW
         HoqLONpKgQSFnifEYd2N/1SUe6OQf3QTkszgjKPFk/EPdvlc0Z6C6/+SXYjPX5AXdqf2
         sD+0MC5EfUyhbm2fM+8fagNaaemY8disw0Ux7F9XGtGeImJ4BtHWCRrMcaMbmet3ZtGN
         k5RA==
X-Forwarded-Encrypted: i=1; AKwUvBz6xrlR8MEAh3sn3oEUNEiz3RNIDV0fERx3IqKLxehhT6lgi7covkdbaO37TBgsl7ml6QuQlIMSy5uB@vger.kernel.org
X-Gm-Message-State: APuU4Z9y6lr00DrU/wUfvteQZXxuysIlR4wMygBGcM4KOTzXF4Lg8cX7
	SFkwuzu9CTrgw5g/XO/vx2v1nQhClqkmVyuHMPWiduE/MqJdrE+wUGanoJnPT8ZuhOdabyqO+Qo
	06HNnZ3P3m0F5ixSLpOtjWX9mX2PsfrVxQYS7oxApCGNQs+oNreeZRUoqfQ40hZ9RgRs4aMut
X-Gm-Gg: AYBFou2UCHzQqi3d1zySstRWwDya/awL2yyfro6JlqXa8cW9akj3QCXJtTwz7h1ZICO
	wpZkLbhpP9lnMjyOc66XE5n0zd+OUNrvdzIJCgFBj5NQ4atlJ7d00fK4NuE1HdnFHaESR8z6YqJ
	d9D88PTSdmpRTpx5AF1z4zgwmUqhN5s9Y85tKBxPj9BPMDxPCO13GIq7ccF18g08sIK3QgJ/cL8
	awOjOypqepiPSqhORYpNU9TEmUfr79I9POqOjzW7H1e3BOGl7Ga9yUgHrBIoGnjRl0dTQk7Rt1y
	k62pZQOk0b6KR39dRBaznA1+IowTQIJhfL5ATG9+/vkxff2ADHoFnOKwI4T300DS2U8v6DeTpB0
	BhiWvB497SG+x3jxyFrhbqeuQUOrvIfs7yAnlaeW+UlC/+2YuyMRucn9usge9wqJh/TG6
X-Received: by 2002:a05:620a:346:b0:939:9ef4:79eb with SMTP id af79cd13be357-94421872589mr2773130185a.6.1793779426273;
        Wed, 04 Nov 2026 00:03:46 -0800 (PST)
X-Received: by 2002:a05:620a:346:b0:939:9ef4:79eb with SMTP id af79cd13be357-94421872589mr2773125885a.6.1793779425768;
        Wed, 04 Nov 2026 00:03:45 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55abd3da7sm520250a12.1.2026.11.04.00.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:03:44 -0800 (PST)
Message-ID: <1f57f491-56a5-42ad-91c0-9c55e1c6ef4b@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:03:42 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: pas: Add SC8180X SLPI compatible
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20261104080200.135431-1-val@packett.cool>
 <20261104080200.135431-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104080200.135431-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfX7T5ur4KbQGlM
 JaKs3xPqkPnTLOJWu0uo7VX7piomzVDzgbcYlkKsbS4TRIIhCXbFLqtDekQVSltOCZM7dgRriUu
 rUIFd4n0bJ1IvwhkR6vG5WIOQ7wviLRWNScBo1K6wYKM0J5vtwMZKVUesVuTbJvrlSMx/Rk02kL
 famRMx4iiBYtTb02NUmttIXcgWh34tj/hsxmOl+SgIL/Ig2jWW9oLQSbZ/kDjDJ7lC97K/aI4wh
 C+bAGa9Y57p2Z5HQhYNeTURrFj9zJAlXMOXUiaDtwfyhz7ZxKsZlDlo4Mh0NF/A/HGnzoFAgEwl
 gr1zOHQgVD5T/g2oK/rwqZHJ04r7k7vBR1rmbY721PivPvUdJfqA68yf0GVP8GuapH4BIe1FFtw
 GBZQL/x1O+yzD/I8nbT7DvQ7PNhZBARwptAAUpQZpipH/zYvRMywYXr8PUc/hzDSee1BRkwAIKk
 C+MsBxQ0iAeeZP/KY7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfX3eXLTUdnswQU
 Wn5A626qJAGLT0Vr7dERSyVR6CtrY2bbvXv85AMysYRioZfEsqLHK4aE33JUAvaUKkNYJEHramU
 SKfREX990vPUmQyGy02EMLCVWVA+Qk0=
X-Proofpoint-GUID: c3GhmeLPXFcnhiLR2sFgp-7MwVAZ67BY
X-Proofpoint-ORIG-GUID: c3GhmeLPXFcnhiLR2sFgp-7MwVAZ67BY
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeae6e3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Uz0uFBkuobC0VEtxzbMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040031

On 11/4/26 9:01 AM, Val Packett wrote:
> The SLPI on the SC8180X is identical to the one on SM8150, reuse the
> same data SM8150 (and SDM845) uses.

fallback to 8150?

Konrad
