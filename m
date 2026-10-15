Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3066D4C33EC
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057657; cv=none; b=g8ySn0SzjUidbBhPUKuaEQ3ji67XDN4zzaBObtpiOOF+/0jxiVT7+RfbggZeDkXzqXf9eyRV77g2BSrrApw/+M/cVrpzh/I75cDe74bIh43t+8B/OkbCG4zJ3M1Nk3lEdVS48CqqGrXJC1ymKKFNIX3ny0iP6hH0YOewv1poIPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057657; c=relaxed/simple;
	bh=cBfxVIv9Gfg/4VI6OyYAvENJXNbIZlvGU84iWNLFcBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h81SuLpuLdyLmn150fo1VT5Yu5TIhIMytX8+Mykfdy+ttOKHqotUGaltaD/V6xQ744eslyAH9jPMDShF09wyvuZJBerBWZy/Q2PprxJukwzmF7kgzrkPBBGm4fgAwCUk8J2LCNEaGanyHc4iWd+Jr47Hzeqs7w4bkoXx7rXf+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2mJtIUb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gku8Fsfe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2mJtIUb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gku8Fsfe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9joTa3408864
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDU8TX1cEApR2Xu9eH0Ex4ReuufIE4RNU3D+Qgb3MnA=; b=f2mJtIUbpKj/k22e
	6MtZiIbTEHSKwK1yH97k7b/APUhS9eExs5HnAcSAE5S2dIkVTfPuf8Q8yIYUZE1Q
	16eo9u42TEycFCvjXvVSgLaKHCDmtf2lZLkBA9/UXp7M5oSqXruMOYHQtwS0ioIJ
	3klfO7c3tIV+vI8plFpGu+IqwLxTpFFKid39J/YF1D7KlQFiIctia4eTB+Pf4sHB
	psWZncyxGdb1eQA4e8iI2oCDKdrCqupCR2tilrHsuMpERVzGanP8l6CIkbcWWn0B
	XeVFvqDuCEiri0/mIQTfwzYkqVQnobc8T0i9P/aa6QhnVppiXiS32/pXx4+GMqwU
	3/K1BA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn241m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:47:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53389750985so10482401cf.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792057654; x=1792662454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDU8TX1cEApR2Xu9eH0Ex4ReuufIE4RNU3D+Qgb3MnA=;
        b=gku8Fsfe6Ts+A2jU9avH7BGM8Y4XV7v3eF3/wOVslPHEOzw79KulctRXk1PqpeWNph
         aiy8paMjQI1F/CfTHxZcYIKZVlXsKp//jRYvoB1rnWcc5oSXB8aFwgJFFE+MeunloR41
         MxIh1L2XLiIdlD3fvy9cJKsWVffdV1CkynvU9T/Y5kGLIvxxBmIkzdiyh7mpLqD06t/c
         lRU1XamhGhMmcX2QeX1+L8+iv6kKa4yGzGgknf0ZPgMhcZa34f5driMt+dWzoQGUFdpl
         Hws3JJuVCzT5MjJokM9lDfdnoAIwHvGemQNloPVlIs81nFrCTv8ZdUw5iErQVnC6mIEo
         CJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057654; x=1792662454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDU8TX1cEApR2Xu9eH0Ex4ReuufIE4RNU3D+Qgb3MnA=;
        b=KmHoJ7fJbmUKFVU4etR7V0tWnDM5nqiqyLPIQ4t55f7D/Zn8QBGCSERLB9smXs0/NK
         je3bVNvOLoy/z/qwhsyTbCs/M4Ci8L9R+BhxTcydmw5TmPAhfBhP8b1GfcfK2G1mR+8u
         RJQ5NAPOKmScfSZEXL6B3mNrcPofjhC7J79Ksp8h/wCwYDyARjCTwe61CHig7KWZv7ev
         AacGSxvXU7InasT/6L4d/xm4JmIZzMxNhY94xNKdDd+F6U7Vm29FDZebDelvamd6hWSb
         h0rHnIAC7P0s12yaHb9uL7zQcZwzvwhjd8+GYNZFJEalRsLLHdDSkRAR6zwELPO6oS7b
         MvQA==
X-Forwarded-Encrypted: i=1; AKwUvBxmpg9EOcM8Pq7gFBzw5HT4V67GJfXJj5+Cij2VZ1q+E4DmprF1w4lX7DFzyMnwI5Tgn3lZItgeaGY1@vger.kernel.org
X-Gm-Message-State: AFq9FYJUyDjlGXEXdyG/wHhMlw13TJwfJTbgDwjw+JoINpWsIyfNKYwt
	+Jpir4sK3WHsIR2/V9cSwtXw8R6igvFMfT9bubVFvzSsVO+5Ibjn5NnlFNOx8zOAzMb6HUz8YyJ
	AR9Lc/qKMO3U3WghX64T7/3/wwJDkU6zVWT5vC2Rdfbso87hxaPZWVgkvKW1A0qJu
X-Gm-Gg: AYBFou0Sjdhi9I6NtOFL9IaHtj6R6DPQdYWDHarZlYQDSF9K2ADqSa78sXVDn/1Qe4X
	7pIuvy64NQfgZ9CsK/xQ0dOVlTLiw9PnPLkcqBJm9ATK7r6luYBZIZL2AV1DMB6vbjFHJSHZAeO
	zCQFjuTutDbdNP8gJNB+WPO3TlcxA3nxgDPAuGLt2j6rBK+J7KaCAQwprVMadwZMgJx9OWhA0FV
	VxbYekvS/JZTNve3nv0QHeWvdOAclta9TPvjqzRWGpfFXmaPY2f7mICBPTajTXobvLbMMh7zG33
	V6O+UVE2s5+nxF0cOJNUqtbpaZqf9WMfBTi9MQvBu7+rsutRxYKH4Wyrv4ft7o+XyOAREEmsp2k
	dkr8/Qgur5CpT3aNKuguUJQ==
X-Received: by 2002:ac8:59c6:0:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5359f6a0984mr344359291cf.2.1792057654495;
        Thu, 15 Oct 2026 02:47:34 -0700 (PDT)
X-Received: by 2002:ac8:59c6:0:b0:52e:3991:84c8 with SMTP id d75a77b69052e-5359f6a0984mr344359091cf.2.1792057654008;
        Thu, 15 Oct 2026 02:47:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3f0a6sm103745766b.43.2026.10.15.02.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:47:32 -0700 (PDT)
Message-ID: <1a7d0385-db7c-4c44-9f26-74afa62c9109@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:47:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: add Xiaomi Mi 8 (dipper)
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260915-dipper-v2-0-cbade54919ee@ixit.cz>
 <20260915-dipper-v2-2-cbade54919ee@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-dipper-v2-2-cbade54919ee@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX3HrLlG8j3U8y
 R4Jv8QTwV5bcXW1p3/QygurJSxfwwRLcIlzcmppjJwNruLojrZ8nMj8Mojssjc2zWrDkzLVrH8l
 CEVVR3OGBg6TaDDrVJNl135bcRnzjrVn6ZAgEEQLSg6oVLnbJjZ7vvP81u0wyUiUAqA3yeeW4Vc
 /41VlgIO0jkZ3XaE6Zv+8SIKdbjz8zeY2AFMCo8SeAEJralhPzNwH0mJ7lqFzUY5ZEk+GDKR6cI
 vWpBXjFCcVbPcrPq8JoVL1opfSbUU9X42FQIOU6EZb5rKd4oNWuhM5tIOWdT5nX8Zt5en7cF0RH
 xaF19EmFQI0K++K+DKBfNSYSoIzJl6Yyf4uCAKFb46KFnhtIlX+zMUkphZQXYMTFVDp4jUZ8NEY
 1XR3CMF65MJJrLpNWcxOqFnUxBgXkwmsmfsR0/HYlmIMDqf5Xyz5W4/5dORtF69PdJou27QpzSF
 Gw9Otk7X15BsYsgrzpQ==
X-Proofpoint-GUID: aVLimG6i85rsNRpHT7FYnvPI_U_SH6GP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX1jKC6g+Zhi2L
 1qaVteChTe7MIazGpNdS5bqb+KkkAgSQeZuX4H66LBb4i77L9e0Y7jh08QFaYWd48P7ulWHp4jS
 i6NGodDGmdw6LEDRUYlRh0FBI/LjNjs=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0a137 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ThNut50O2AIRvfgEoHQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: aVLimG6i85rsNRpHT7FYnvPI_U_SH6GP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150038

On 9/15/26 4:32 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Initial submission for one member of the prime Xiaomi Mi 8 family.
> Mi 8 Pro (equuleus) and Mi 8 Explorer (ursa) are nearly identical.

[...]

> + * Xiaomi Mi 8 family common device tree source.
> + * Covers Mi 8 Explorer Edition (equuleus), Mi 8 (dipper), Mi 8 Pro (urza).

								"ursa"? ^
[...]

> +	reserved-memory {
> +		/*
> +		 * It seems like reserving the old rmtfs_mem region is
> +		 * also needed to prevent random crashes

Have you verified that with e.g. memtest=1?

> +		 */
> +		old-rmtfs@88f00000 {
> +			reg = <0 0x88f00000 0 0x200000>;

0 -> 0x0, please

[...]

> +&tlmm {
> +	gpio-reserved-ranges = < 0 4>, /* SPI (Goodix Fingerprint) */

drop the leading space inside the value

Konrad
