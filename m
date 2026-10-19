Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E164D09FD
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405564; cv=none; b=t7XNnioghQ4EhHD8L4sdVvAxgEu69EuTvCWTnX+r4dyqH8XFNTBB1X33T9EgdXCPrUO9IPUQyEtnL0qm7pH9i/lToc5brZ/5STGCsSK34/wyX1xvBxJ7RiNNrsRn8LGMVN/gvKA8H5wYMN98Q1OznLVkzBw87sM0xMQTA0RvnHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405564; c=relaxed/simple;
	bh=7iANtpwwx27y2DvF7f+rRXOAxzX/QoIXEDSEYxaBEHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksX5bLEl+AyQ/pxSbfa0LwiyNOuaAnVMeTrsHjSr/YYUR0Uyjbhxfx4ONan9roTA8CYVLphxpMYHWvtMDQetETdjVv/cSEtfdtdZCIyxPcwXN+z2T+gyShu3tPMYRYT7lNaPkd9gUlcVUtDM//wTLtqdUHErvOp1ne3sWipaGIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4nt+keM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvHm7Kn2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4nt+keM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvHm7Kn2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Ymn92688775
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nvDUo5SG8D2D8txystjgjVrXxJ57+a3ovSYH1tkYEIo=; b=k4nt+keM1Tio0GGi
	M7Wg8A3+spysZMBtVeo4ig64WWaGUoNXCqhoiboa/aaBhy04hxLmgKtPQUWvQ45w
	wqMssGQvPMgWO/eT6nEevgUor41evnS+Exp29ouMNgLp7LiDRsJIE742wdGuTzuy
	2BDvZrjqC2SRHLhLJJ783jKvqyF/U6f4dOa/akJbQbtqRC2NeQxuS7ciXHIdQ41y
	y7l/PkDerq9VwF+CRB+FRvIY6HlaxwmHo9069PQ1GzzLnozZnS1eJevyDQjZWZE4
	Y0k4J4dC+W702fhG0Sm5bKRzRG4LBPjAEevSthCcOHkKDjgPXzLTFBZy9pP0xDpH
	C0D/eA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn0e0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:26:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e58614290so27473585a.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405561; x=1793010361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvDUo5SG8D2D8txystjgjVrXxJ57+a3ovSYH1tkYEIo=;
        b=KvHm7Kn2Eg0UvdcWb4RdvRlnmuGO0linhya3fN5+bOhstSz6bMNs3F5KySJYgBD+32
         rOLjZrFZkICXz2Iyw9XoIu0ujnBjfH/Z0qE1PKfbbU00w7Wj4vqpDpbnzWVUuxSOs/F4
         chhp1xb3z8qEa43oRQhRGz2AtTMBQ4M6a5/6YKtcvMHWGpu3SGvzaIzP3x39dHMLr932
         Lk+iOmc46CmdFmoKb3S9Ve4hImV5zVBYb1fQN3piHNk3otSpLKPKafDmAOvxB7pfOLXJ
         hYTgorLl+BVSklVSDy9XeqfWHbsySyNr9JOemC9aqQ853o9A7tk8mhJLRarwZKseCmVk
         OsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405561; x=1793010361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvDUo5SG8D2D8txystjgjVrXxJ57+a3ovSYH1tkYEIo=;
        b=kcVP7xIbK8ZQ4x8w+FtZ/ywdQ7tViehWc8i86lFiOnNfJTYhslkDYAxGYp88hJNKWV
         HyStV3IwYJC27TCHWc5XeK4xRT+/u9Nz7kNiE7R9JJT97UBTt8xWgYWdGJFElOWSn6VF
         dpkC/zs4skO4JdBYWKXOmgCqJBpWtMNUm90A85Z1V727Mb1XOVNjNjEMT0tX7JUTsdS3
         zyxAHximirmN2Yq2f+ACvZfXGfKfhQ/aVAj7/55P90ComvCWcXjf+VYEVqRIQBw3/IGB
         iHRhXJOKZqPxngzOrVUD71PXQgcstcgamjHxGEjhBJ7qmVo0QylHpudQJBVuNo6iiIrw
         zHrA==
X-Forwarded-Encrypted: i=1; AKwUvByk4HFWtcDhTUhfphIHgZ1Djz0yUvHBwqeMLWw1zRBhK4Rp5IA0PR9YH53U77Czv+s4ppvDuNvYrFDS@vger.kernel.org
X-Gm-Message-State: AFq9FYJxMQEw0+K7devuoMtZy+V0eh1bkZHt5XWXg+/RLhIK49BvqK2T
	1z6BtTY1i0ukVE8yzfOhG+q80p/Y+es7Axc5Z5x+AdLHx98ujb4z0v/IBLtbT6KB4mX8JN4SiK6
	Ar9T7ylsZ9/3SDSuNggyxpJhtTN2bnlvxTD7ANd1rmUQWehnLYAL4zaKusIwNdV6X
X-Gm-Gg: AYBFou03A/HN1fiIKTn5ilOraD79QQGImPVQK1DXCnf4kpcmK7JAGAk9JmdLJyPi8Zl
	Al9y54HqiMox994Ifr9scuoLgyz3BENq6sTwyhx/CErAOTqDFQp6glMI/gFBLVFiBpCPSDfPXwL
	fBOLSqLBiOKdSAb2ewY3/HYL0qhF/C1AksOBoHXoNTmfKMRLTmolTozcU4wWFQdjdTH3EdUbAFj
	KZjZeLdeuP5rZForyZWPwU2zqiNgbA42FoFhFHtkx10R97E7uNAxP21+bAk1e41aKtAxBX/27Or
	jp/5PgSsMcsBt/jZmthl60J0EnCy8R0Wp12Bte65oEknxLKe5EPwFS9zFBaYPFiTB8L4yBsPiHC
	xYnGninsu/4ahf6MAi580Ow==
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1373206585a.0.1792405561292;
        Mon, 19 Oct 2026 03:26:01 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1373202885a.0.1792405560807;
        Mon, 19 Oct 2026 03:26:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c615esm343612566b.42.2026.10.19.03.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:26:00 -0700 (PDT)
Message-ID: <4ca6842d-766b-4ac8-9fd0-df514104b382@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:25:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1-denali: Add missing pinctrl for
 eDP HPD
To: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Haipeng Lin <jimmie.lin@gmail.com>
References: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
 <20261017-sp11-lcd-fixes-v1-1-0eb916c01a3d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261017-sp11-lcd-fixes-v1-1-0eb916c01a3d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXyZH0x1Iodv0a
 h8gmTHQEWfBDXxvSnInw22cZ/oBn3Fd73rDy72wmF5EOqxLUprfC2Vi7UJws7oo9xSp/FDYf4ww
 eIJNKybjkHBciD9g9SFlzRqNOwLFjS4=
X-Proofpoint-GUID: wYzqTtTsBGEw9QTcSiYPzjlyk85yGGyu
X-Proofpoint-ORIG-GUID: wYzqTtTsBGEw9QTcSiYPzjlyk85yGGyu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX+107rTfjolti
 ONENK78KQnyznzagDWct7fmAz5PoymQQLTGWr7CajXg9bPce/w36GXq69MMkp7sc+wuxfJxufwP
 PALuX6pjyiVsmNESbTpGwAp9hReDGFgyWnWAnRqI+p+vtXoJ8DvDPygmTbm8VA8C2gO+N1bsvEJ
 rA1UlZ8vWDHneFc+YHMceRJRu62kODzi0pGgFsu7/2PvO7a0NJrHoep/UXtjjaYiSTpCvyQUZFO
 42awDoxrho6KZfJ9PCYw0JtUh6cyf56sjUY7K2chJI24aV82/87e0u7BCNj6f7OSkkF3CGFQNNA
 61z2ZnKOlrroP2kWQqsm40+MNWFYaT8eOS+0f9wDJgaptfOIK1nhFlI2ErWXm1JbMRNZUt+LwiW
 nyBMVaWHMCEmpXukO0waAJA/LWkBWMDl0ZVaS/9pAYTX0sdZzWd7Qn+EaXuWluiixWIrR0VLE/V
 ZGiFk9y20qHwIaUyJhw==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad5f039 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4IbvtdBO-GTxqnRxzRkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190041

On 10/17/26 7:52 PM, Dale Whinham wrote:
> The Windows ACPI muxes gpio119 to edp0_hot for both panels. Describe
> it rather than relying on UEFI.
> 
> Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Tested-by: Haipeng Lin <jimmie.lin@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
