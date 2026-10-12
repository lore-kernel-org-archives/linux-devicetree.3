Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D90349CF3D
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818719; cv=none; b=RDkpIHB9P70YIIrt5SjlVsH+dRvNgO1QH5yPq+qIMuv9FtNrO3ZfFOefAiQ7VlKOZA9i6ecdIpZwbnELya/zTQJiW2d50BjXHw2bGkSoVNch5uKSQFAxQLsAcFKqMhtgKjeMjrzFnjjqrLV/pA8wAZBECNqwpFJVEVpL7F0L7CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818719; c=relaxed/simple;
	bh=Mj4Yr1eXzYhzTFXQFevVuouNAAS0O5uO5o/fq/DFUaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VYtpIUg4Ha0ITmrfQtDz+bAHolbH5Yav+qB34yeo6VyuK6tdG7QXCyWjDiDwRzmU1T3R3kkxprKMxNmymyeJ7uchR4Gi170ugzcrNcKi3/hROj4WqJ/DQSObfLSbaSFxqY6HNIc+c4OskSb5eHz85rdcKQMsKXzfCnCCKDfr8hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBHVhghI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Idb9Lwvd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBHVhghI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Idb9Lwvd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0AuV3292357
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	To+IxN3RH6HOHfJxwIJNsoOJf28JZNhP7whkAoi6D30=; b=XBHVhghIAfm2+g0d
	xDA/UREJIgEiUlC/xs5QvWlsMDahzmAqepV8URvO1SfSFEQxAfHm8l9jSKuduR+x
	H5qItGC8n5IbSWNZrazvFbK4lMr35XUXDbWg2GRZSpFhsP2nuVrUA4a0yMhyBfVs
	vH99EiTLzkHpt/h5O/2m0Et0ODM0jcRmbW04v/Y4Q/w+Hqb8OQdwL67RhOhza3CJ
	z2WiJVRzKvbVM82rgbX1zjxW2UXjxW2/TOrQVJKOjTfbXAd+ld9WmhroFUqeS8hl
	JfSHANuj1AErAtf7P3w0URotqUSThGBE4cJZ44I/R0xEc0OvmeBZ0KxTDZ3jbSEG
	NB4yCQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j1qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:25:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so30103985a.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818716; x=1792423516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=To+IxN3RH6HOHfJxwIJNsoOJf28JZNhP7whkAoi6D30=;
        b=Idb9LwvdXwYTTkfp1nCHZfq6TAZ2nSl28+PuaO2lAVmJ0ycoLjWxNWIwFTWKWmMFvX
         rTOcoP5LoyScTHsBaPyXB2McxHOqGHzfhe2ZGERQ1k2w4POrKhV6vP6kqHb05AuQ1nDK
         QmfE156cC8fAa0Kuf/oYaqhjmxccEkh+xxrcXZ3iMfKpgSxRclKwsSqQRkqXV3cTiwpq
         zoNwgWvoLTyiMbOiymnHLayuYnA7o/n2qS5I/L1C2+rqEE3kW7KrKdyLtakhpxkwZjSb
         WZD6cPbqul91Z7pzcgimaGioObjyQEant0tyPmXXRTbsgUbO/xshCI4whjnumgH4ciqb
         7uqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818716; x=1792423516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=To+IxN3RH6HOHfJxwIJNsoOJf28JZNhP7whkAoi6D30=;
        b=vR5Z2YCHA26cvdY/f0KPEqmQU0gmEVrNeNPlU26qO/XV/VHC1EdkrpHkVY6GUvuOOb
         00/2t5nV3V6nledgbkLNNalR1ne6LvtqbLP9x1rucud6SXLSPpsXwSfN9x8FcNW11qTB
         opzjct36i5/olZwxKYtVq2xM2He1OwX70iTwAS2PumBDGKXbX+3f2R0MwSOtIrrssfSx
         AqfDOon0sptI2QQlMWkBTRUs8SipPo6tPPRx9hcMMhRGjR/lKfP36Ju64NOxal5q9HOf
         rOeFiZDjTjfFHtWRwIxcKS+0pyuAlKhW3yya6r2aYI8YZjSStGaRVBk2V07PCP0URXIS
         /VKg==
X-Forwarded-Encrypted: i=1; AKwUvBzhdn4HbDqC8YlaqMqo1i9XrAiriSoMk+whhZLX1iTkJ/2BEStfCjjBQPxh9F483ztyQR8Qo3KjOdA8@vger.kernel.org
X-Gm-Message-State: AFq9FYI0Il24czvvjzAYT4PC/oE0WHuSiKNKwkuuODjWPAJcCusZcyTP
	HCyYkwzrkwqBtpAZqVbScLF3Iq9SdDn3OUnWGi9rJcs7kqKwU0oGIPFnA4FZshhyxvoqWVlj69I
	o2PgdHkhp3waJlYlQNx52k1BFD4KuK/71F+EZhdtl8Ie5YwW1mgLHrKGGrfijsXEC
X-Gm-Gg: AYBFou3gyfrgXOqPxX/8U1TUKai3V8LzX/qpJfSxEDczon/3kwhLY7fjleE75KwxBj1
	50BoM1BVkHSHyf+wVc1maVBH3ppyPjZvFZu3FgQuj958l1R6A+HroxRPV/GOjJFft2Y0pMXImf/
	KLcC8ZIWStukcPWXSW0lPXJe/qkVJlY9IRD6NsKJ0pp4W+V3V8FmBsQ/plMmycPP3tWV3PqHVwW
	yBLlJIWY4zYRksCKSb2bYLW/xyH6PAgalElM0QnQNB8p7OcErOMNPn3lb2AcbOJe3Zj0XpnY0YQ
	o8sGrMle2MrmkK2uFYjApe+YLbMW3EsRw9aLl7VcIA+4sUXh96NOQH7KDKOEPH2e2bFUmAVGliF
	ulQ1RBTg2QAM4lUP0d3U4JQ==
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr1897877785a.1.1791818716539;
        Mon, 12 Oct 2026 08:25:16 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr1897870785a.1.1791818715946;
        Mon, 12 Oct 2026 08:25:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa8511sm473121166b.59.2026.10.12.08.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:25:14 -0700 (PDT)
Message-ID: <989388b6-15f4-47ef-81b8-b35d1977a0a9@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:25:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/38] arm: dts: qcom: ipq4019: Add newline between
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
 <f7637ab5383b8bde1cde248a60d0e8bee01e05e2.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f7637ab5383b8bde1cde248a60d0e8bee01e05e2.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXzp6zRg19jwss
 g5bZRZQ3TCVq+no+JMdizj1u+t6vV7FAE22jE/Vci7tow6g0YZQl/IC8m9clxakLpMYMBFONNLx
 1MAZuMXKTIzZz2OPuHulIn8Dox7NFImS0KZoiGMMZW8/9+TiVUyGFPjZy0sOrrgvGT8pUhC44/K
 15u/gV3vmXqDBXz5zeoPqBWNSa9/e2Ab9CESFlDb2Fx63rU4y0hG2oWkFNM9DS2qQvjUmmKb9Ew
 8HQlKiIrBFW0Rge0XgozFZnXuPtK+l0V3e9upYKVta3dt5GVtRUHPRKtQiTycwyKnfXpnxZq6CH
 78KChO5+1dNzuSAVFhqDkFqgUPoaV/b5eqQjxKJdHmQK0kwLLFnmX5ec9WvX0whjgTeiYiFhxmr
 H6FW7JOudZphKXOn/pFTvkxntuabYHAWC0cHYlzozxJfPC8LF1MMGVYkFEDkdgV/QFHbU//DMu0
 BSq2Rhbyr4YI8pE69YQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX03EowiV0IKKt
 uCf6QCASNytsNEO4CJTQsRcxiHzogfWReXRg/zg6GIjPfi2VwbSEoDjAySIoCMAWsLAN2Xp/1IZ
 SFSFLnuz1YD5l7KHeD4CJ8tT6TPQxwE=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accfbdd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=mzYhBs4nDBQXKrYYQc4A:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: HN1xw-kDZ-46F79qHx4VNRgPpdG-3orC
X-Proofpoint-GUID: HN1xw-kDZ-46F79qHx4VNRgPpdG-3orC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline (and only one) between subnodes. Found/fixed
> with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
