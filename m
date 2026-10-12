Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A7349B1E9
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818533; cv=none; b=d7xVN4jRjIvBQFzz0q68ZotseLNRgf7g1QajmMr/K4Ks3UxJxn1lvbxhIoJJUtCZT7rFfr+UPV3lfTcFmiEp5GSksPLQPgLuZpnmCV+TlthD3Z3a2iQQsEL19dGWxgDFSt+gzOxemCxZzWG6xMx0z3l+sKj8oyeJ+qWGvgUSM5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818533; c=relaxed/simple;
	bh=IJRoYw6sJZ0+0l+od7X0+0OrpYFWPVf9diA5uu82KIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSCV9bKq2obMO1BtyJwk/l07lkoEAc2knlW260jLeKT4/hpHPKwpL3fiv+Uv/DnCz6hZXXc5z8/MKY9pdWjdMo7008i3JI4vaWIe7J+bihef5qp86ywQLUQnaPFVWikrdJZb7qmcc4ARZNxLGWic7ZhpT85EVfTQE2ms+hIpyC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7F0DrT8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W0ctDeiM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7F0DrT8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W0ctDeiM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxumm1404987
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=; b=h7F0DrT8M9BWmZVq
	03NmCIdq00IQ82UOes3tXhmMdgcYRyXxUg+QgKkfEJNLgFzfB4Y6X1gJpPMlxUiF
	dl6rXBbm6sLlO/CoWPY/q1iCkp6Z8mIiGrj/0iB1axoeMR07SUNdAoJmR0Hmnc+8
	Qys5Bg2CFpNLJXgtQQ91TGAyMUzlHXgs+KwFKtMg0hgjanwLkjKoYzBXHeVYp/hV
	JlTFvZTae3hL2sBVvsapw3o4Iigp8aTrnv/O3T1It3xukVF7pAaYXDNASe+xLSAM
	44vEaMoFTLrImOPIe0d3i50uaaxBOO2k/ZJNbl7nutFcnSlFbQyYFsMQ3lHbR9PU
	OwZEpQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kssem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:11 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e91e42209bso29621e0c.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818530; x=1792423330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=W0ctDeiMCiEG1VTUFYAAOdNh6jPAqQRS9HAFSGKlVszrFG8sUO7VqfVC687WltOIYG
         951JWkf9XYCrJOsAZzRSOa4n5dK4jM4IFHP1ZNMIbrfPtU4h6pSF7b2XVQT5j8zdntEa
         yYe253B/O9GckT7gXFxLnc8bPKRtqBhcdQjpMhf1xwzwnRjBLKBeTFYhuNIu3lbjSIua
         UNvfDgvxozxf4Usvjhdq+exZPPMTSTrxjxBRVAGGpeq6D40QOiitT7fqs1+j9KwX9Bpf
         jW/bPZfg+9krPjmNvr4NfeTBvaCyyBiKocKo+dAWFLBDnVbXWG9VA3VyBsNVnUpn8hrG
         HGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818530; x=1792423330;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=Z6ptoRWmG7lC9Xsh5sRLOIkM+0VCOHCOP7ZTLyXv0FALSlbi6WIa6kZw1HQF7WDqKH
         1xr5s1nl34qjFBEUezk15uwoFta9iMSWAiHmb0lk86M6N1gCMJ0dVY82fyzFI93FfpPB
         miJ2MvIjtm2/JmiV6ZvDE5uIjQzcOly+jbN/aiCTSSl0oNOmoHgBpw6wWV5QizcVIPuY
         //1QnmzD9hecTJG28kgeDjXTWbWm55/N+kFKXt7tk5q24Bu6nnnSe37uzFsLp0JMQqri
         4FyKkktg7jRSDK3flrPBzGiLxPvnXqQrEluCYB8Z7bVSjtzs0Ni120uEA3TIm8ZO2S05
         PPew==
X-Forwarded-Encrypted: i=1; AKwUvBxUqrFZH4y75YHBaVRYMaJXxMFe8jumEojw2amu0YtZrooy3SfeUPncWVxcd6F88EEz0Rgl3fyf2A2M@vger.kernel.org
X-Gm-Message-State: AFq9FYKNmusUencE0YWVB6LS2vda3S+O5ODMjcxHIAa5Pi3sAteG3ZR5
	CD8G0q6K648kKgGjTUvmelLl62XUMXnJUXgJzRiBkmNLysNQIAE5ghn8cBRb2iCVqGkGaBKSMhO
	tnOlCWHynjxXzBrfsS2sMRLh6sl91w1yNtr/u4ce1qYJoqUcovTQiZCQhKYG7Y0MV
X-Gm-Gg: AYBFou39EK6UJq71o+GXb93O3JxqvLXznQ9/G7IgKt4tpo6J1o//gvSdm71LohydzCb
	pDZ8R9u+Z8aQKxcfGh1LW+Sm1swk27S63xRyWhT0W2aH42ROIvS6yd7Xf0BCXrgPVSjlxmsNpwC
	ZJ+ohMYhPicEXAVNZIXcJ5FOdWA5gUYu/F3sdRoGA5IRes1FZzfCNWUiZaXo0W1vNeIjQv8Forr
	bwzyfe+jtYVhBbo8q8H0dA39a1nmY403Mex6eLLJ2bScJlVKGzrV6/S+YvubqouhfEfVoCGBOMi
	yzuNSiU05GNmNk13cxq1mcf2S9HKNPg2VB1FIfOdZ351BDEGxuDPpm+StubZQdvY2bXUfDSrokz
	RE0NvjzXMdFy9Ly6Tzq7NwA==
X-Received: by 2002:a05:6122:8711:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5e91f339ea0mr2105793e0c.2.1791818530351;
        Mon, 12 Oct 2026 08:22:10 -0700 (PDT)
X-Received: by 2002:a05:6122:8711:b0:5e6:6546:84c7 with SMTP id 71dfb90a1353d-5e91f339ea0mr2105770e0c.2.1791818529874;
        Mon, 12 Oct 2026 08:22:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bcbsm478161866b.38.2026.10.12.08.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:09 -0700 (PDT)
Message-ID: <96c79d79-328a-4174-b0df-4e3212d5d3da@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/38] arm: dts: qcom: pm8226: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <34fed5048be259dbfd389acce205461d21dac6bd.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <34fed5048be259dbfd389acce205461d21dac6bd.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX3GpDLFS6KNmH
 k6gzYV1VllMv2Mwh76MVvjouBzx/nVVBUZ3odhLU2MS4XfYUZkQjs5wZEI0deBil584o+eSqWoF
 szIICTwpPxIeij1xI4VHEsoJbuc47RT2Q1hsrL4dqPfkLxAO5BJul9y5R/QhtWV0yjvF8BZFs+a
 FBwvr1n4G2xf/K8eNdL8rPgLozLDymeoUob4HEZSBbfvO1J91UskeRj7tEo94RnQBGzAs7/kUCv
 F4R0g75yMzahekfbx08kEeLfw0R1qvixTm+FUBjurQoDiqMJX8wjyCVAYpR6LAQvT6P3Kt+sTNQ
 fb6KzGMrjcJju8rCibcthjFjHbbcxzEN8QBFtBmoiZY75pqZKmBlLD6TTAooXXTVJvHct2Gof+H
 RrCrc3KjXNoJyiDk0Y16H3XB64/90lcNIaaH0FLAq7WHZtbwFklC/qqdvvPY2rcoZcJg4J6kXMd
 It1HqrSAb8EmMJMpYLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX2E0X8/zCrTJj
 hjaH7dj5BQ3SbLJLQItbCSVCp7OhHDO8a36oPP8GCm+FEp2MsFdJah+yp4MkD0bnpEOOBrmhG1N
 1mF7nlNUrxlj3yFtJY3vnXFzy/8br/8=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6accfb23 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: VMzrvmJb3IUcIjhzPCjmddP9LQPOS3oU
X-Proofpoint-ORIG-GUID: VMzrvmJb3IUcIjhzPCjmddP9LQPOS3oU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
