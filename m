Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660549;
	b=cYYkUH/6OZRjlaYIiBe81r4Vfds+ygot30bTkaxk5OS7JctM4yodM+6os9K6dJ/jkjvl
	 gOgN4fDR0Y3M+TxvYQ607CsLErAhA8HhNGDvQuI5Ydk0lDynlxcGz3cvko17r2ESIyubL
	 tpO9xkdilsiQSDknfRCwS7TEDD0dmvIyPfAySazEtQeaBYvBOdl0fFzH0uzkgQQrcN1Gz
	 3qsSY1bgX5Jcooqsxy9pTxPX+Y/Dyp2bwKplK+IwSh99w3j+Lym9c3slJ8l13oKQekEtY
	 qVC+fLXTjdGiDe60yklb2Ie2zdZNpXJdJsDWwt6xY02sXgWimQ0msz2rg0hzzG8zP7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8RwX6tNYBzJaiHwtZtMYHzLLMC2RohH8ZKxS2JYdRAQ=;
	b=0rFSRHRRWquFYG17IdKeJ3De8N+q7qdP4tX0uu9lVSqYoB4cWqgoOgIGxbnK7ezPV7uh
	 xlsSRIp1+wQFQU1vxKq5uDxROEJEq6+2x+JaLbU478/Kjfiadb67D+bP5LGEpRYTAJB6N
	 cGnAvzGntAx6aKAeUk9RTYnx6YjxFdVjEGyMEmQHbxj1B5CHKxcMkLkzs0OU40RfQfcDF
	 +UOHJoMMLI6gxJgZc3wzwgrFhlDgEOcrw6K2uRqg+TY9odWo5U0nO3vbRky81p79CY7Os
	 hDLsQ2i2uxzlbAuvoX5Klytci2Y7vyKMfqe22ktq8NTRCbv9rHZ/L0fBBi91DUPVUQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aCQWpE6k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ut8ee+Qd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68914606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68914606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aCQWpE6k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ut8ee+Qd
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M707qv4136667
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8RwX6tNYBzJaiHwtZtMYHzLLMC2RohH8ZKxS2JYdRAQ=; b=aCQWpE6kMqjIkg2S
	jE0PHueDDCkGqlclCKoSQ/nClliaSWV4Fd5lB5wjYWcLFTbn1iukagL6AEhwbLLO
	SGxI0kPy/I4imEXHHbQZEWT0eKm0Vv45Ha67io3PBm+D1/zQCL/VThQFqnk38IqB
	Zpj9TSZT1keH0Mgh6JJREBsCdix0hx+j6JsjuG1d3/0/AbCuTuKmEKt5yXpsJlOL
	gAuY8/9WyZaKU65pxBawLCCGeZh36YKgGj2udzTu9i7uU4V3XKKXfOUpsbEMSuaK
	buqDXMcIXxdpdr4ygC9WWq74JwfF0r45fT+0xHgxoJarHVCUo1JzFLnm1RlcEa6P
	xmdcxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93d9n4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:15:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so40366185a.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660548; x=1793265348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RwX6tNYBzJaiHwtZtMYHzLLMC2RohH8ZKxS2JYdRAQ=;
        b=Ut8ee+Qdxh7NHtFhXqvmLlIy7gHFkpsC+FxOHryjqlGayTBbqhaASAxkgWlcO4VNuC
         BZKrkmKsQuSbjwRTqXHmcB4iybn9jnWuzlQF6GUWmSYlGs3iNpVwm3fFeQ6vuLMR6rNO
         mcjg6m9AUL2IxRKCXUSczbRWSmtN5pNI67CF+/ES7SDZU3EhjxRQ9zNTl8NYrK7mKGsz
         XVmv1xUl7raKaMOPznvzXXQFCPK5o5LtLEXqPL6gYZwaFjCCT2aTruItjF9MsaITPSQq
         0nNeNBt7lUGTDS2Gn1uryLOTIM+Rx/lyXQpkNGbDev28JB4iw8YVPxjsWph5CWhqoUXP
         o5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660548; x=1793265348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RwX6tNYBzJaiHwtZtMYHzLLMC2RohH8ZKxS2JYdRAQ=;
        b=xUSF3ZH2znl9gg7FNrOtXpocbs6QzHcEdSQu3hbvT5RAYMYcnNR7akKZUJPJtkKp5e
         6DhWYShIeXFyRltObJtrx3ibaNveLBuDcBK63qdQGffVI+SBznWnUY/+mkIo0UxDExE5
         U3kF83jZHXo83WMjhKbVsrV1aOF4ugqFiezwFeS+BDFZAlglrtBsZXzIvQElErfhPBOh
         DaEHVGPI7MN5iUqXP7iM5Yu659w8JIRg/3dxfQ6XXmgaUWVuRnLuIePP64DK7joMuYkG
         BpU5cZtJ2AEiHAFYKRh0LbuS7YswnkCmTjGKJIJmYuvqfqPpBuMENY08QJKQLSiHBNJV
         eJFw==
X-Forwarded-Encrypted: i=1; AKwUvBwi9QHWHxj0HTMAMijFFjtRhjvMAxv7ltZSdnCqbPKzdUEyjyK8DnVoX5BJdD6kf/B5Ecn1ZOA0B/42@vger.kernel.org
X-Gm-Message-State: AFq9FYL8jgepq7/FElV05OSErLq8BhrchOVPCW+jmtwoCv+Z8v7rlgOu
	9ZF0TVZ/EpezhQ9K0CJSsTVKlYpKytM3WzpwJpt8w1NbW6aQsnZeiXmqn1DD4PpyGLMkPLCfc+f
	Ztmf7rplyxljuW4zXQfgMQb9BL3ni4xeFzmYrW6wltluESHCk44P2kuol1jbLcV8H
X-Gm-Gg: AYBFou13g84pwgqblGMzHwcJUZ9ZtsBOSxcfj0uz2KkET6bQLYrWJhZaoY4W6WQchoF
	X28RbWqjorGGQw1rugVFsliv7+7FN+MtH2uFOoIqaSDx/X68nMcwWDEuEWvUrNcf3ngnbdNZbt4
	Y77Y0hY0Rxz4gSdfe53iHavp4CahHEbODC0fhJm/aR90h/Ils1Zqqi3Va7/AWB9EgIOdG/+W5jL
	0IWGzyQz4S03txX4bx7gdXF21IGVmwDHqwgP1Qfzz7ln/TZp2ZLAcD1HgZrOlBFuKLGa2G6+D6I
	9Nz4pjshVWGmnpf6be7GWoV4c+UlYM/VMUeg+uLaBDJTyH6kziBZCc77esYOgXFWRdg+IIvmria
	onoijC7qsEREmr45SwfmKjg==
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr989934085a.1.1792660547893;
        Thu, 22 Oct 2026 02:15:47 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr989929985a.1.1792660547440;
        Thu, 22 Oct 2026 02:15:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcf7sm85881666b.24.2026.10.22.02.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:15:46 -0700 (PDT)
Message-ID: <d8978154-e99d-4d3b-8d0f-b707b2ce9722@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:15:44 +0200
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
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: eliza: Add CQS EVK UFS variant
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
 <20260928-dts-qcom-eliza-add-ufs-variant-v3-5-9a2fdbf6baf2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-dts-qcom-eliza-add-ufs-variant-v3-5-9a2fdbf6baf2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX0Jrc3RkFsJlE
 iq2YG8jXkT75Bq54+M/XUNdZ4HF5FOA83/rd1bKQ2L13i8wfWSOW2lwdDzkTaqZ5+/t3bwbez9t
 iYsnMaqEu0QR1u2nz9ciOSY7opbnKpo=
X-Proofpoint-ORIG-GUID: fvb_SOy3fmAFuDZrKdE-tpQofZL_nPmG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX+bY8axeCOzmd
 o2vZmV2n18ePhkNT+B2ihDKmoM3WmTMmCZXVP/5hsq+4w8wPCdzII3ocwskqNUkM3uOgYXGVK1V
 pbQQmnZz3VI3SkJJIAWbX5xEUuBoUnaoqTQL5tqg0Q8aWAanF7PM4LdTOTLRWQlzTEFizZFPnwm
 fcsOU0HgInUii2GBHfCXyW3U+lo8ec9pgz62+Tu8YuXMRlznffZqzlOM2yRaarXQGbt3KUd4AXd
 iegBJkRha2pVvoCc41t0nfBy2F9Jy44sihJ63nAPNH04T18xcol1UGg/EhUUqHWbeu0MvLKF5VJ
 e3gtTkqZ53NYRrf/LGEw6MkbYzZuz93jqNzTSKvP//oVAp7jVQaPP4f3qNeoJTassOc0T9ySUF4
 f4nRf1A5SS2/8KbIbxzIjhd4BJS9oBevyvSxUKh95C/3JnoasrNgIPfmu7QLgb41jWpspnMuV1v
 vN8+ZrtpMKxICvjlU0Q==
X-Proofpoint-GUID: fvb_SOy3fmAFuDZrKdE-tpQofZL_nPmG
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9d444 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JxYTsIeC_X4Nw1WztroA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 9/28/26 6:36 PM, Abel Vesa wrote:
> The Eliza EVK carrier can be populated with the UFS-equipped CQS SoM,
> but the existing EVK DTS describes only the eMMC-equipped assembly.
> The carrier board itself is the same for both storage variants.
> 
> Describe the UFS-equipped assembly by combining the UFS SoM include
> with the shared Eliza EVK carrier description. Give it a separate DTB
> and the UFS-specific compatible strings so it can be selected for the
> corresponding SoM.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

could have been squashed with p4

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
