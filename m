Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9823B3E0C44
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843983; cv=none; b=dxCU8biVVKPZEHkPllt/UUwRbL9tR5usv0l+noE5tBrM/eyOMTiv4aDvG3ZjeyUM/VNDJRUufA16ZXZqRFjyGiJLePl4A5Q0Oy3yzKk0cAWM0dGxtRP2aJP1bw2NvR9bQ1lbM8vrCWNISX9SUP0mxDkYuMLvPK62j/WJ6Whkfak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843983; c=relaxed/simple;
	bh=2jY4/kzFvO+9VqBwBcRKev2G9WIAnsbUYz9bRalBVRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KKCm+LxLpt92XvPbiNpNetX2960W8UwnYWzig0bbjtz1WJLGG8JijOz4yGNEQOqapcPMyYrTwqutGs9WPcKVMwdOXloLx090TlKwJBqL9XcwIgSTxVKfwSArWDAq/bOP2qbhAzZVzl2UF40lo89qzhE406+McoCIIGlVHPJacQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETWx9IT5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hjj3Yw5u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETWx9IT5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hjj3Yw5u"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xKsR2806225
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 08:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ViB2hPkPT+eeeH4k92vbHVOqiR+Ad6cvNpNGQw+EvoE=; b=ETWx9IT5nllmdrbl
	RoogQStucaNfYJzhc9Ow4zGR+FZk80CtYt2A6wScmm7A9uQ9lBHW+NaYiTICcO3H
	y22UQvfi50+fUxXfJgMeXv2IVDdboT9Ae9/frg+xIdXH60YvB0HqqQqSN75BgISX
	ZwQ7O2ONmuZKyX3Z+q3bviFO2Mx/pq4kUyGoFwwZ1rmNgyenMjnjHMXOwCSLudsF
	Tfg0CCRGfiPiodsdEZPl5V45XofHw2wurHfuLFlamfivRMfZJYy97HNDSUK/CXQf
	O5VgZV/3ADJ8dRE3N4y5UOBlV9xptigEg6E4M9rlyjEE7BzuDfMG7nALe0ZQusAI
	+j/JtQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1hvkgkcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:39:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso84181085a.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 01:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790843981; x=1791448781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ViB2hPkPT+eeeH4k92vbHVOqiR+Ad6cvNpNGQw+EvoE=;
        b=Hjj3Yw5uGcJyFu2QcRNJpmqhr+EVWmD9GvCBqc2xmiNGdieQkBZH7rVOimcZsbduhE
         7U8ymDLtrSS4Y2pjBRQ9fAndPD+du0tKkozZF5gp68aSavezozO8tyqw7BPMCwlDxV2W
         1xNnuDKZ40SwH/4O6TKQoqOj+dyD6ZrXVSNdWoZq05BbaeKM3TlzIPYBhtSvptE6oMEJ
         NqI7oQdDTKwGTQ4IXFNaNlvUSnHp5fTEvybmCXb2nNpXM9wm2HgLWXyTADaVcxafFlCW
         32BDZUmU2JdZL7wCh3oHHfz1UE8/S/Fftp3Txx2QYczw1Z9QGvS9yBDy+Bm9nd23cb7Z
         KLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843981; x=1791448781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViB2hPkPT+eeeH4k92vbHVOqiR+Ad6cvNpNGQw+EvoE=;
        b=ZyJu34hFwEvtw51NQ3EPC7SAB1T2leT0kLpEuUZxj9/JD/peuqX7Xy1hP2HvT/qw+0
         ojK75jAktKHJvKubhcFeIdrPYdC0XeidKnp51DIXPg+LkAf4DA+CbcswCNioqyzy4udH
         Y70f3t67OHXSVJINwKAwvURaj3+WCiZ+PWKSjr910xjp0HWL8KbnDYyubiIsDvixEzTn
         1oR2vU9uc9ihJm6HruxFEowujYkKQqylsRQPVv4QV6RnzhrZZmTmjTBvbwgp24L2peYy
         fB6Zdp6T2bfH8SJmu2M8En0sS0REK8KWKCSxCd5ald+4fgSl7p7I/ctKwobFHJBWNEQK
         5vaQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9PnFgliuq8wgNgNp72Lvk63UcrBJG50JXqrd4BJJU2mKS1FOqyCATT0WGZqS9WFzUFB+GmNRWaTTV@vger.kernel.org
X-Gm-Message-State: AFuF++nFJfqmEdOBzmkHOLuZPnog2rTrAsFOggXxYNzBr/TCnJtnqX9M
	3MRjQu/mTdUARQbb/Ul99nOfRH0BfcAyT2GgjS7VBY9zxIYUsF3PpPgHRr/ibdKr8PZO5cLVayw
	PqF83dI1DiZABqPP6Px793k2zvKCIjz3+OoX3B4rj32aivx1p/9/4LVMoDp1HV8E+
X-Gm-Gg: AYBFou2lvOF6jNDYTAp+nEcrV6NfGK/IjbKd0HrU1fDCs3NtZmf8hOjUBf2uTXoGJkf
	cJmvDOUfEkYCyKvGFo5noXp9NcDl6iBYQyglPc9f7a43EpqnHEd3bBRnBUBtfw9jm31/evfqjQf
	RT18xtb57n6xWAZAekCYBh6oO+gkaXvZgxCS/GA3oxw7/uArb9odcOJuKnUiSIL2kBga6T67NlG
	ECZawpr+3zoQVibf0dc/b1XI1HJQbragKKXRazkciOFW9QV/GvSSYtmEyIBDsQfopZfQP4d95sQ
	3ZNrMC8nrNsAgiYL3FvCECG5bf4P1vzgNnGYp2lsU9gqgQW6m4w33H9dr34HqTgr8CD99OLhM6z
	fNhFhSNspKcA7oZLz0rznnw==
X-Received: by 2002:a05:620a:1990:b0:93a:14c:329c with SMTP id af79cd13be357-93ca95f973emr717454385a.1.1790843980845;
        Thu, 01 Oct 2026 01:39:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1990:b0:93a:14c:329c with SMTP id af79cd13be357-93ca95f973emr717451385a.1.1790843980369;
        Thu, 01 Oct 2026 01:39:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31dd9fbfsm109857266b.71.2026.10.01.01.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:39:39 -0700 (PDT)
Message-ID: <b1dca609-cc63-4698-b760-bb47646687f5@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:39:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sdm670: add digital audio codec
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-11-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922015801.32373-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXwx3fxcxDu4iO
 TKTHM4mgk2gBnRO8pB7zTcT8ph0exl2ac+Tdph0T9YPH1j1t0rz8mR7kaKNKrCNq8wtUu+Up0lF
 a2IM5eTUd7/JIwLXdndW5xlphE7Fkd8=
X-Proofpoint-ORIG-GUID: aE_h6IzdPvRHf0WXFGBwCeZDT-r9-qYs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXxoIOgVLPaYpM
 kkztVI0i9ywt3q7bcob4n7VwIXQlffyeUkgb620EDCsO/5qLsmge0029CoMXS37YikEtVeBx1hK
 ZkSJIN+b73O7Frxr4Jlu+CH9iBjuO5XlmsQ1U/EV4H7EwK00WuyxL2Qt5jz5EDNqoXsfnSx09um
 dSWS8YTXm/7DEcc9HKmPvColZ2lHpjN8a2r4aqdt8D4hq6BTpe8hlPBR0M5/tSlDw4ik+DqAT8m
 gyo/LHVkAOBFTezdOWLI0C3Uy1+BwMOLw3tQV7Cp9KzXngiue4pkcKQe/fMiKvbKsuqe/TSoKZi
 xnU8QEawrDYzIVz44Cc23oZ97VaFbaKowmBioULow149+9XSZB4NdoC59MBXDImU/bwxAmHTl/J
 63bCHw+eP2eNG8zJJpRHM5HJiXvKiOG3OgilW3DcBHZz1+Srw2G0cKUN+pDq19k97xMF0lxIbMr
 qylYMNndyA4LiWSen1w==
X-Authority-Analysis: v=2.4 cv=IY8Symqa c=1 sm=1 tr=0 ts=6abe1c4d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=GbMiANRL7AQ389lSoXQA:9 a=QEXdDO2ut3YA:10 a=Ql4v02ufxVEA:10
 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: aE_h6IzdPvRHf0WXFGBwCeZDT-r9-qYs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

On 9/22/26 3:58 AM, Richard Acayan wrote:
> Add the SDM660 digital audio codec to the SDM670 device tree, as both
> platforms have the same internal sound card.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Please introduce a SoC-specific compatible for 670.

Konrad
