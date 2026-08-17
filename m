Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2AD3C76AD
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786968126; cv=none; b=CH25kDBbaqXvJ6o3Iy0IhDypnXPKDWE1d9zgJtqvrQYW9GXZdILkg0eHMc3Fk3iym3dxhsBXC+Q9h8alIws8xncKvVuIxlZpOpGnFdPnlUfhXu/JBq7fOnnlVZutnOTcfXs4zkRyJ9ySGvHZQXxckrnwB1qo9NYH8DIuoj2XN6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786968126; c=relaxed/simple;
	bh=AD8tHINrnJEhZnY6h8zms5YMTtiNPbI4jba9YIotQNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3e9wJm2k5/XEUFNBUXfyHCqr91RHbxjk/SHY7WAGXXhOrgRDuuPb9zspEfD6wTryBbXHL5pjAfZB8mfeT+PBhVaWMEDqBbpXQ2GB9v3Wp80YcSW+b8xHT3MJRWF6c+OOOp2fqxbvIEkUu0v8T3EnKY1Zwe7AIPboMR7l2+QA5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMsL01fd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gw0y2Lgx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMsL01fd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gw0y2Lgx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9djjh1932191
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MeHZMvZOZuAxwsZ8n+gIZCO62QIfIjRdAX5vebKCDRI=; b=IMsL01fd1SOeHKF0
	S3GR7oxPotWqqw6ru0woMEysrngTVRhVfIG/sC6L2u6gkJgiivkOHOc98u7t8lsi
	wopHDQCuLGkCszqW9MarlNbefePw6zZZNseFFfiHGm5k9RzYVySDW6tgLmAh/5g0
	IvPzhhYnbxnC4MWY4rl4Jr8uUQDz1Nmvpik7OeY9RzI7FllxSHF1bY905TpubMhO
	L9wpkSUwHsYeBs2rTMU5eRx7WwZTRRTnEnaa99gg1niiqcZ9R/h7MkJ1N12Q9hec
	Ho81FJhvv99UkQGavDVQyfV/gZGN9zVkbnYAB9GvRLWPcu5K609rFFquo4QkcLJb
	Jq23tA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3txy9q07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:02:04 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97a2a39fde8so33599241.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 05:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786968123; x=1787572923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeHZMvZOZuAxwsZ8n+gIZCO62QIfIjRdAX5vebKCDRI=;
        b=gw0y2LgxYhkI9ovFRYCGF/zWF2tg5NarKWSvhcYxrv0nCBcBletRWRvWM9e82fnbvf
         h+jX9U8BN/keMt2XNbazJD0ognifHWFypYthuHnl3lt3PBsiT3FUqhjTREaOIOBBWDXr
         YVbpWFt1uhNUuMgT+i31Df97uJ6I6WoNVEGUZfPhwoWFNpAMu0vhM+pNKKqlZj54ZYsq
         hsUle3H0SYnyCEP5lTdlpDvjgm4dR38yOxwWf6Q5XSleZ2h4wCJ2q0DiBYYTHrHuYVzk
         lmxSrzTziUREnJpZzqdXAg7Km+YbNeqeb8bfsKAKbt7H4+/8pVGQ4juH7S+T25EIKpk0
         KuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786968123; x=1787572923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MeHZMvZOZuAxwsZ8n+gIZCO62QIfIjRdAX5vebKCDRI=;
        b=R6UPjlsJzG2VNYXpp+mMBzGRpUfv0Nng2arbj2UOJ17sL5jsUBoF+BBSJdyUnGMd1l
         /XPqSmXCmTpsztBwAznzRAsi5swV2nKqyfW5UkTmuzgRyO3q0vdwZknfMn+HQGlB6c7m
         LlaYleJXWbFkO13xO9mn7ziaZbspsMiYsE9OetD9lBwSqEyWjip+Dwjx4dkNeY3HI5J1
         1zKtTifkXoBdJfCMig+8OV23OzqtIKWAZtyLNtJ/+i4sxk6HPRjpV7N8yILNMNouNOTZ
         IXagtSzghmBGgEoYmUf5Hct+A5JEwy7ROGGjt1wNGFdGH4yUFPIxHbVog9EFuT5gW9+e
         la1w==
X-Forwarded-Encrypted: i=1; AHgh+Rp/ejpQDDdpUfhfPU/hFYuAUnq0KdBuINv2JbH8nhGAHZa/EHpaWr6cOJg9I8irFG9bZm0WVf0gEhi5@vger.kernel.org
X-Gm-Message-State: AOJu0YwC6joOqLJCUqwRk5EsPAIhH65yYwNj+5K1MLCk2R7iv4YXBYqn
	9qxHLSelHyFpZFa+tnLEUIYJ0i9E0h36Rh0CnnWhEa5PE6K7+DrLXHS8yMjhrNKNVzFC9qFSbLF
	fi9wochay7DUhTWzxJztdK8VkrgAOaBrS0z8IaOJ9bz4ADxeBAk2pGsS/T8daLHOo
X-Gm-Gg: AR+sD12aPlLN/5ivkmh4idZiMcL9pP2aWpFcJVxwAqjFxie8zieVK20a1VyCu3+/pRR
	5VBypqqGjBlv/w/ZHwwFK4dZHJWZzvHtf6CiRlWy1BQpNkMUfG0doUi8mTs2Q7eCQOHLgLHAq0f
	bCpUL8g4gy2sHJspRnu5ZNIl+PL6tzLu/f7hu2uPujqJUobkzflBz5qWIhdVemiIMWK+B+6hp8u
	vxeZ/T3qrVkJ7BSrZJtniwrn+wQ8CUhuNWfxAT5LBGXgUwj2tQKcntS5GoHr/Y0yDpZLQghTFKB
	CF0MCCn6iCbWdnp4mkO+ndeid2gPWrhGZtMTF48PzXsSwq2BHVvzgtMOlKB8TliFmrhAJ4ISFat
	9DCw4OGYj4Zmy7sh1OtisocJU
X-Received: by 2002:a05:6102:3748:b0:739:b6bf:bc9e with SMTP id ada2fe7eead31-76f2cf64f8bmr1309035137.3.1786968123177;
        Mon, 17 Aug 2026 05:02:03 -0700 (PDT)
X-Received: by 2002:a05:6102:3748:b0:739:b6bf:bc9e with SMTP id ada2fe7eead31-76f2cf64f8bmr1308970137.3.1786968122518;
        Mon, 17 Aug 2026 05:02:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b97aa1sm12677966b.46.2026.08.17.05.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:02:01 -0700 (PDT)
Message-ID: <5e8e6701-ddfe-458e-ae08-2d8810816320@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:01:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8750: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
 <20260809-pakala-gpu-v1-4-207ad1fac1c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-pakala-gpu-v1-4-207ad1fac1c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5MSBTYWx0ZWRfXxHce608bpjlZ
 YroFMePZBnkEOn9c2fSfa7dZdZt586ql3Yjy4YtaqrjarH1iVt5JmGAt9feFhXhK/0GvdLXCYXq
 SIm+GrXct9MLN2KswyZoW6UsPgkF7rU=
X-Authority-Analysis: v=2.4 cv=auGCzyZV c=1 sm=1 tr=0 ts=6a82f83c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5MSBTYWx0ZWRfX64WX0g1nREck
 j5l6/ss1ytEgpX2kM1kTCwQV2mv0ZK/N4UHv2PpQcCto1uk5HAqN82p6SXnFdgdM9bWxk++7mny
 R9qpTP9gGaPuTdMSugZ0dbZzvqKFaNeSZ4HN0UuMo5QTf+p1qtHQHdKqOSzUVsy3lxj9W8AYLOT
 6ral2VFXnTKm6vGsZDYFRVlgxF05S4FCPGVcFmBpnXD+MEjz8g/yLMPVSaVqjjmyyJs9WR+VUkc
 pPQTNqLddhAffy3KThZC4ATlGCap3u8QGhqVz+SKe301J5pOtPQDcalVbfrTo4361TfCyyd+ZTx
 BrvtzxZyk5f7SoPVXtFQ0LgAhhsMoG+6OiwzIAfq/yDDtovlOtgPxTLuKqIJJEP0vY/wN3hwFgL
 GfIZNubV+M20Ov4UpJiA2+FxC9y9t1RPHLNPMkpYJSrXfKLcQ2iHfZcS59P0uV3ehoHr0jfrsvF
 pZWui9/RD1h4YVuR6TA==
X-Proofpoint-GUID: 6l3Q-w-L2y6Cs-kCzwbxG9wQxErpvoX-
X-Proofpoint-ORIG-GUID: 6l3Q-w-L2y6Cs-kCzwbxG9wQxErpvoX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170091

On 8/8/26 10:23 PM, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically
> when it reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
