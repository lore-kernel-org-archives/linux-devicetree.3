Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0CD4CCDDC
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070391; cv=none; b=faOo+b8gfgAc0hzxnC8HIIiGLkJ/sHvcYgVPKh3t9/6DsLGLOJVA3sFng0Rt7IEbrJLV7B06c3JW6MuFjOo3FqbUdWuA/W4qMzgY2dHr/Fa+xFgeBaircogZdiRmGS2zYipvHqIKTwzeGfrdOyKsiCMla6TuyZrCCb1ulqF4e04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070391; c=relaxed/simple;
	bh=C017S+WPS28H0KBmmCJHn2yw1QbkE42J+XEXfHlj+SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E53Nx7X9lSPps3mku1ojJ5lA7uxYfIB7z1OQwvYOkPuYB7qew+qn0qt0V6felOSZFvg99pD2AHnsDqOyO6Qjtb9d1KJ4MT77CQXZR0595a9sUKQVXap8bFpeGMc8MJw85LlgpgWGK4aHU568oEbBgE/Xq1/cwWrIN4+SFpT15SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+a9BUsw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0NEUFyL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+a9BUsw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0NEUFyL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7XNGg2175193
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wH+m4/fTa19EiJ6UA3g/PzW4QR25sui+i0TbH/t1//Y=; b=O+a9BUsw2VXm5ong
	k+YXzFo/6TD7ZlJefX/7N26o0qNhrLtg7TqWaVbvd///Fb/j1+V2TE67UNiTTxBX
	IJKR9mi3iXHF6HsIld1g36yKAENTjggviowO8uTA3EPXhY1pVM4h/f60p2rt9uKE
	rCiEdEXkcBXqbUAHp6IWbHAvJCixGG6EMpvVobEDgioX9j/SoM0T+1FpeSVPjGGb
	2I/EUfgm669VGXrEcYsVE2lv4xV/D0b//+TdmTWsyXdiigKRdMl1ozhbPj9MO3c4
	0sAbrZUIg/XAUnNb5JyZvfWgtfbw7gGH2C/C0Nyc1E789u0SEAamHyHSa1JeHo5t
	BLg3kw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsq9se4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:46:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f4002c1aso63397285a.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 02:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790070389; x=1790675189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wH+m4/fTa19EiJ6UA3g/PzW4QR25sui+i0TbH/t1//Y=;
        b=g0NEUFyLUllRTkXKMp9GVkSwSXauFeU4g/NbdOIVM+GwusEYHwfYwPktcVFHRKw/HF
         ys18USjwSlsxFjHksjmYGmP+J3Z5137B9SrCGRlc7gI44S7CnLRx7SVypN451y+AID/w
         7do2wo9F51F6kGEhmqXMN+LxivjKjEYxLKMrn9aFMM500PG94hu27etbSRCpHvhtpLwv
         HbbVUC7QzSupLTh2wvFVtIBywr8KlHZYI9Fp8eNgKv6VNiQoZ0lNSwk8cevXAfhTTYw3
         17kd3JQWlsnFeItZxf6XNnquVBJR3/fb+8nUTV+YAAPh93nNADQAmzRhTcMqXEfX71V5
         v6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070389; x=1790675189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wH+m4/fTa19EiJ6UA3g/PzW4QR25sui+i0TbH/t1//Y=;
        b=2JPOKqQ3GhHgKaHH52M3T3OLi+3EFd3fhyQfneejVJdZYJNP1oi4j197se+TiQXGdX
         t52eqaYUteCW1r+MgwtgxDQEeHCDYL2n1v4YDeTxNmNIhZi+QpnGL6VYCn2N6+6PWNPW
         QL/7p+9+wdr4A2ERg1nBSS6RNuIXQlFDjL4JGSltiqV+ay3T/+xV3iwZkmkBqp4q3Blp
         JtfMnuEGNfXQVfLf35gB4fvD+DpP4orAq9hwKvsE/mQ0ye341aEgiAoVqh9fYVi2PKLC
         rl+5kXHMDlwx47pGRuF1yUjlsJLyGW5KCW36EcLs+Z2xX6gsUEUDWvnGua0oPzlmasHr
         VkGA==
X-Forwarded-Encrypted: i=1; AKwUvBwprbR2Vde4WFzSflLr3BMJZSSAZvxm7Ur4sA085hlZK4TGc458/z2FJEyQJzGkNEFWnkMGWqsuJG2b@vger.kernel.org
X-Gm-Message-State: AFuF++lCrlXuH/FjPaBn49YRipDoXPO/Fd6VnXj1YVteByu/CWNX8Gl2
	yd+e3lXFPMhxIjq5oMHThVBAJU2V4V4uJRXWROPlLo3ajg/UGbUOXZGE5oBiITFkAo1No/UTEDh
	CPpZ3+7uCFNMrYDlkkFqBWwrH5MP6ApTjAPf4MLz1BPr56rM26utKxxKCvqTfKl0Z
X-Gm-Gg: AYBFou0/WtbDXo9SU/0U+nR4V3Z41G0hCf+KaexdSSlBFm4pL+kk5CPrXQskx+SOTSd
	yLaSZ4SvbkN2z7arQ3poK1a9oeNtbZdfJyUXJmTrXdIIqpiLNpHyyT7AJIiGCdGTw6MbE8Jk3hL
	kqBadA2AoWZF09DpbyMjHZEwqCLr69bj99l5HTN7gcCNYhS3fx4ifNdgr8GLFjdI7Z+olnc/xEB
	SQG8JaaGNLsWySaBmFYlLrBbVx4viK/SXbta56ezMMjAgYU8BOTZ+F3PeYC35AZ4sXEtvMXQwEr
	0AkdlwM3/ofWsBRDutYD/S0pRUuCbgJp1lf5KabiKDiUv+Vae+XTZ5EeH7i2hs+59Pv5/+zCxxr
	dQz52TuxJb+OwhIAD/NrWmw==
X-Received: by 2002:a05:620a:4006:b0:939:eb09:4458 with SMTP id af79cd13be357-93c15f34b74mr512911485a.3.1790070388506;
        Tue, 22 Sep 2026 02:46:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4006:b0:939:eb09:4458 with SMTP id af79cd13be357-93c15f34b74mr512909185a.3.1790070388166;
        Tue, 22 Sep 2026 02:46:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9f1895ddsm40279266b.9.2026.09.22.02.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:46:27 -0700 (PDT)
Message-ID: <0b5ae4d6-13f4-4f48-bd25-65cffad0fdd3@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:46:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Add PMU node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922093446.493606-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3oGjDQL7FSlb-nBIA3U99urKvrPgiqsz
X-Proofpoint-GUID: 3oGjDQL7FSlb-nBIA3U99urKvrPgiqsz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0MCBTYWx0ZWRfX1cxfwxTCEmxZ
 iZ/ZQsJSeptdfclNEJEybGK3+I7rGGia+Dq4i5NDS9qxXk/Nbqa8OfarZpe6opQmyci22Us8+LN
 0ajWzTEAvwVgqD3P0OtUkMoLl50uCeU=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab24e75 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aHEHYAZx7hSDT81ZUAAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0MCBTYWx0ZWRfXy7LMFMjGH9lT
 LXMmmRfnJaoVTbe+kA72Tx6HCnj/hpuFD+Q5gRYZI7dPbgfCvMvexZzdwsnoe/0WX8+HfretsZl
 JQg8Ir/kx+3qLYWQDzt3LwYlLK3B+HbhPzaMCB55GnrQR4zyNkoJHBY/Lwp+uXreoWTnS9VMHec
 vFwjfCDUmluFyDQzSPVzDMZoeIWjnSLOJYAtdKr2xTXEBJw89wJt6te+1JgOAv6ww046aCtqDdi
 WbCUevAZrvOZdTY7G42Z+SqOoipy9DgHy0qKfI8lsVmjLYSVkjlqeSdhMIe9WuliecU9kbSxX8A
 Cccv5HOOf1pv7elH99W/lIJAX6s7tdlxFKYUc/IKoFjmC06U4c3XdD9JvM1+1Idr/OZ7ZrMTG0U
 ssKkxxmMZMFnggcDtjSi4ik0roiiH7WmNhX/rFRo6S6AYSfgojtGfHvxfFD4prcVPmU1JpG6Dri
 n6NGeNFqjHDV2UIyWuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220140

On 9/22/26 11:34 AM, Shawn Guo wrote:
> From: Anurag Pateriya <apateriy@qti.qualcomm.com>
> 
> Add the top-level pmu node so perf events can be collected on Nord.
> 
> Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
