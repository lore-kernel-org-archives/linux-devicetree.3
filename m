Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D571EFFA1
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314595; cv=none; b=X92JwO5v0waGeHfHfFxxZBozloLPmDFKtUBIAGMRzqH6BVfbrYsdEa+2amuxnsiYWYRszPMFpWpZ0WuGqVwcez7JHbBqCvhVPVpCGnXu/U7/hFe7aMWyFR5n+LU9bZL3qGUYAEG45gYPXQLRLCzcG6TtKh5DIBqaSuFL2THa0Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314595; c=relaxed/simple;
	bh=es4m+wmD6O0W+VN7wgQ8sffnaTdgYhBLh3UIN2laXIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAWnKm2klhNHzieypOP1m9b5zEDf/uLTQStcClJ/JTNmKE94SsWP+O3JGpVKOj1QG4Dta990YKBv37hRN41c/6OeKoge6Gn6I4ebJ+tI4/l1ecboqVpMOCQCsjI5GIu0Y5iFVg55eG6g6uTDQmKXCFpVMdyfw1cB1Q81B6mDiMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEY/YKRW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/tTn8+B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEY/YKRW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/tTn8+B"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LBq7RL2872916
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/GOHaKR3RVBKb7RfCMkw1x2U
	2ZbnpAPQz3ErgjJAqYc=; b=pEY/YKRWaYXsc8/X+VYkCLE2o7iblD0/zIvHooZJ
	/HNEwZGAPe0zXvDBZmWlrWjfwcnXRyHDrV0mJNkI6bs7TgzJjbDrOiXzU7VTPdUJ
	VjHjvfRQT0wsTPiZrePTrQvOaYQO4uEawhoMH3iNw3dMfy/fsC7BQiuP1EJqYUmk
	1btyqompS70zkRWORkgHFgKfXqMFs7LTRzISdeAiuWH88eIpWWM7Mf4lxt/f1jyz
	U9bW94BZYA7UIbF0pPNxresqRd+31KeJen7tLjQNMWShcsWP2z+Aw5z6hVO8WUiJ
	d1gR8Odme+TFdeKS05lxRa06elbdxTu1m6+qbpKbXPRQ4A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fuhhhar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:16:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so9981101cf.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787314587; x=1787919387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/GOHaKR3RVBKb7RfCMkw1x2U2ZbnpAPQz3ErgjJAqYc=;
        b=H/tTn8+BDj72UkeKv1EZdzGGsAOaYi0A//xHZCn3ZKW1iCSKdYndca0/XwJL7w9eId
         cFwnN+bTRWYDNQRgg6dMgAh9XPrsGu+FwuylsBXO5uAmDX8Gow4xfrv2M4GwPKv8xvij
         gYTTE0ZMI9OL4J2rR7om28VI7DrNeRi0ycKPeCfcrcwvua0kBQzJBlgabDVmmjqUM9Ez
         r8ejO910ooKGplaj4J2/34YyIGM4PuCku9xmBQaS4ub++a7ijONBMJVKRe5ZvaFag9UC
         xzN5c9I5SaKqnPrJ0x5w8mQ0QcDJ/p2cz1eZUTvINl5OsREJk2CnmOUiPeFCSu7ZOe0c
         Eycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314587; x=1787919387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GOHaKR3RVBKb7RfCMkw1x2U2ZbnpAPQz3ErgjJAqYc=;
        b=bX4tWN8EhbKKVLZzQdXrzFjZuSsy/BEEZOuses/TzfB40bzNgEJ82zVkfjyDEN0qDx
         NXnyxjxCq0wE83z0S8d87nHjgtKbVlk0kxRemndJ94xztWX3j5dYzMhcMfWwgMjsFjHh
         M8a5t2bWgkZEwVPQ/k5pSc9KOM9uujlaNo4nLtuJickAmdU8yDV8ohI4GhAPetus+qeG
         1NliUpXAtVzqWIqMsIufw40VgoboScfleQRy+NEFmCNzoF9Sgm1AhNZWBVqtVzcxjnMK
         JaYXdIZq+B+NP03EnIT7odo4ei8Nd4P76dKfoH+gUl4cMsv8YhhBp10BD/GpDAorapko
         ZqaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5ZvHkHMmPFWRyDF06iUaCM+kiuu78aidgvGOa5Fw5IasaXyKnoO9tHZEr7aTnafIrFAUAtjOeE3A0@vger.kernel.org
X-Gm-Message-State: AOJu0YwqrFUPQib1wNvuEMMpS3zg6+ESR6SjWhKczpFeZQA6AzTBrkcp
	+9G7vPM1Lm0jM9lHS4R9hkGS1BayCMegESuoOL6ou+NWjm5tAO0juBc5QM0qae+173r3jDOJyW8
	97VLKZDnKHxV8+cknPJCk6ya8d7MGspWzAr+3jiAESqnJDsV57JzdZ811hqbYfL1J
X-Gm-Gg: AR+sD11Jz7te3BmQq5LiY8WXfkFPsGdajzMl8fILSRGLgNa9DfZ13MQoA221+REY+So
	Ju6cvF2ZY9ygmLZPVRIDPLn6kU+Q6knZsD/QNbPO7PGeZdVkdQw4VPTOr7WSJm/TQTG4LZe3J0q
	vb53q+hDCppjmWbgDi+jvYDUYYghlbfRtQFfzwo72mQU2tDymPP5RsBIgx4r2fqbYS5dLNGrs44
	w3QdJxEoxOLnS+42ZcfuTpwDIVvrJ6CU/xjmNRUBnZyEY3+fXIRR/F6ZnKIlw9kmYPH+rHFX2Cc
	wluuR7FP9mpuQrYMoWQfkmmC/GC00onpDhgum/X1J7DsCIXDUG7iFFClyu/HUC2Zs7ZyeeCV0L9
	Y9NcA1aF7sWB+UOE=
X-Received: by 2002:a05:622a:4d08:b0:51c:92a0:b2ca with SMTP id d75a77b69052e-52df5a5ede3mr53201271cf.34.1787314586750;
        Fri, 21 Aug 2026 05:16:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4d08:b0:51c:92a0:b2ca with SMTP id d75a77b69052e-52df5a5ede3mr53200581cf.34.1787314586141;
        Fri, 21 Aug 2026 05:16:26 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b094c4sm471695566b.22.2026.08.21.05.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:16:25 -0700 (PDT)
Date: Fri, 21 Aug 2026 15:16:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Job Noorman <job@noorman.info>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 touchscreen
Message-ID: <3p7avlj7fo3f7dcuamznmgzbfxiixnsrvq4qfma4f3p6jitikx@47ho7nom5uf5>
References: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
 <20260821-fp4-hx83112a-v1-3-474941bd8860@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-fp4-hx83112a-v1-3-474941bd8860@fairphone.com>
X-Proofpoint-ORIG-GUID: hu1llnv16vSkr3p3PsR1loXbW-c-2hVN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA5MyBTYWx0ZWRfX/4ivHAyn3Zd3
 gW7nrkN2/2RYdKKsl3gbBc954tvMWHgAsbwiTzZU3eLXKnSGkX/s16FFoq4A+Dtkjt3D6IoggJP
 Zk/VxmAI3TcMiEsjiR6nZIc98/qUtJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA5MyBTYWx0ZWRfX3/K/cQOS0Nb3
 Ik3ewTBezLow2VmiL+1S/tGnlF2E/J0SdH67K90VpoqZFgzRb9sKk+zzvQHl8AE+zTAlZNpEVUU
 1gqATDXnCR1dN8g8xS+9K8lAljRmSSuTwqjwsVVbGhLTM3ESb6tDmAmlnkDJtyZZR+/v4DXYJnp
 9RwKXaV7HUSMsVzR3wfKBP4pcY5o26nZRWSB0mlFEU8l0Ul+JrL8bIANkwbKhbuSZMw1KBjK/g5
 tkdDT6SCVVFsVzNHwj7ajf2lDDXoofKipErFvRRVBCHaZrjM9EIgvvyYnXW6/A6JUhSQ5TtxY/j
 vl66ZXCGD4aLFe6mdEJ9XxJAmuYnD/LKgAThYapZF6kPpAo1NFW2gfP3F8xaAx0DuZ/baOcN5jK
 6yTJ30a+uo0gVGdtYCOHkXnFqUBOCn04NsUXn9W2+fdRwuC2/5NuA0l41rF6G5tO5KG7qNXTwnN
 kqDUKlfwmav15j1iD1A==
X-Proofpoint-GUID: hu1llnv16vSkr3p3PsR1loXbW-c-2hVN
X-Authority-Analysis: v=2.4 cv=UtFT8ewB c=1 sm=1 tr=0 ts=6a88419b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=AYr37p2UDEkA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210093

On 26-08-21 09:12:20, Luca Weiss wrote:
> Add a node and pinctrl for the Himax HX83112A touchscreen found on this
> phone.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
