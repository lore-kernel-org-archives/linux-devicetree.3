Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EACA27874F
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 20:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246698; cv=none; b=Q+A7kIysXdlqQG3i1t+MphmC9pCJboZwcjpHh9K6m4wDN+oRzmtYF6uL6anM1k9pFmtKVRsieG0ErZwt7upWeyiaXqhexGzVAWtnzIIN9Re42lsEzU9Pto46gGHgt7x5zlJrtVKv65bvPMPhH6qPXdf+2hOBd1U8FNK984PePog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246698; c=relaxed/simple;
	bh=4SpApPMGjFbxfKAN1ZNT+BLXJEP9lU+80DJn9TXhW+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFExLrcGCAqzXH0U4CdA4SxohPUalzrUEivaqfS6GA33JpJovYzWRk3otX931ydz+lCqgjBhexX2z52kjI2fOgmbFr7/2FlJWpTJkNUq5K1JNujSsIdKs8/sKEt/oYIQTxFf13AldfGKJuosGJgQ7lp6uzpupp52eLcdTDBU6IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWcKyMvd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCp+k4jR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWcKyMvd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCp+k4jR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633C3dRq823112
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 20:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8/wK4/dOjsvQoyUObggzdeAJ
	1MXSF5tzDRQ4C/byLIg=; b=KWcKyMvdK8TyEM2UiDTsve770Tg7tqTtEX+LA+oQ
	MI3GpC/iLcYWzAwvq8wQWhcNB0EdI/gAwfRKeNco6PZbKUi3dVfZlH8bylNuEiri
	wZVQd38a7zdvciNWdo7Dw8ggoOvhGKj20e5U3XAwJH8//F9bmEgLwcjma2VtP7ce
	9urxePLH6pZPkkOAdRcYAIDYhMLko1iNOr6bWxdBwLXgkGH1e+Mj0S/zyGmRk/l5
	sQZXG/tM60zQLIeGM3GAomeI33nxk9vHM9svldh8YjV3Buy/7LWEvrJ0kpcLEf4q
	TEG7cClfGFVTwVHjHolHPVvimd00SrC4x0dqGEPRE1vQsw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da673akys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 20:04:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so35510021cf.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 13:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775246696; x=1775851496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8/wK4/dOjsvQoyUObggzdeAJ1MXSF5tzDRQ4C/byLIg=;
        b=NCp+k4jRjmK3PrFqzd6aVf7dsWE91bD1PW6AGMuBw7bwwNGlhKujYBAn7/leNa3Des
         uUmCCrQN4wjQjSRDu0s1s13PU+OjDcArk+8MqEfZmH3jG+ilWUg/RN094MqBTgcxigUW
         d7BiEd+/vVXjPl/A9lNNX02MjKUAGkQdo65hkUzyKNjz/zNh9HnTRyiLjxy1vmAEbbe0
         vKRoSzELwE6Te++RbmUpCsRAvjF/sTdKbzi5z4eO9raxJVQifBPvb4MzXGl2vx6/9ZcF
         NQ8vJbezs8AT0/wKSaj48/wMH6vXVHFO0Lc86csTD92n9B+A7/kCuvTFZnVlx4f3cj/m
         w9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775246696; x=1775851496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/wK4/dOjsvQoyUObggzdeAJ1MXSF5tzDRQ4C/byLIg=;
        b=Cwp1lm5tc5duFakiY2RQoWCVGKSPunUBCUbdsuUssNQaNO4SkANMOHCEt/I8j2Ak/X
         oUdwwteWKqxoKWo2OwnMqT8dZKbtVBfrfzxMM9S6nV4N0KzKCYd5F8gE2G1c0qzj75c9
         J4J1usj1xLWUlrsGh+W3mkI71oANdoIRhEAABkvOO6u04xnRcnlncYtBqsge01oXCUbA
         PeaDxPuiQdrH1A/ZaOlfIsqUBRwguF/Q4iLQklSI2g3h8s4EAIsp3Ju8sA/Djiqr/+ca
         rETeZpiSwz5fp/xpIAx//nytvibi1puysMyM0IOF9yDoh918344lsBJqv7IaiYDYNgHf
         OWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGnSxNkZdLKinyDvRxlHoze76sOmYjZ+QQpcsnfO9wki6IG0UBsvc0VCEZ27I4pPCm8wpX81Tnv/z5@vger.kernel.org
X-Gm-Message-State: AOJu0YxW9GvpnPXlm+y7pcuVIltKmr5qcQafsAGng24c4cfnaNXy4RVb
	xv2SsW7fq5EVhkg7otfj/dsVCdEbEKBROIOkk7SY4jaePLCFVASFVZv7lwE6xLqaRrDlkvtwdIo
	2JKOvINM41gyuo7yxu8ujJg9MhCi8InL6Y58ljzbJYr8Y38BTGrEg+z+H4U244HXo
X-Gm-Gg: ATEYQzzTwwKGJCta2BPUb9F4tJZN5Qg5TTSSKr71SRmlgNsSYrWq2VG5AoVqcf4IDRl
	utW5TrjB2jgY1/dVEGUTXjrTtAe+lh/UNianOtKK6MzbZhf8QYiw4RqF0a893zVZV7q0kmfVMqr
	TPtkIn83QQcpZ6WhupJ2otuc5AJkAn2dTyQwEWKRCQbT2Gc6qslUVddWKt9/1tGQvMZdbgx13nV
	Eye6UMPsDKC3XeQTxGckj404YJ5UvM8+Ys+DyzaaG2RxReSnCiJ1dAnXL5pwWPAXz312ozeZaGB
	yHBaJafdlnuaOtQp7KgZTAVQcCKpZnLATn6hLB+wt88ytfeOBzQkmM+estvU+Kod4/OgLCI2NEO
	z3X8UBJP5WokQxJSTho7iIYt9gJpFnHAPe0ctsMJJlISp2/v1YWjr5QDndk3tCezytVDUba+xrD
	VcQG9PtNrALSZeIn/aT7XWYVg2bLaTD9iXc8g=
X-Received: by 2002:a05:622a:8c0d:b0:50b:31d6:f7c6 with SMTP id d75a77b69052e-50d4fa3616amr82584231cf.7.1775246695787;
        Fri, 03 Apr 2026 13:04:55 -0700 (PDT)
X-Received: by 2002:a05:622a:8c0d:b0:50b:31d6:f7c6 with SMTP id d75a77b69052e-50d4fa3616amr82583861cf.7.1775246695367;
        Fri, 03 Apr 2026 13:04:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217d85asm14037901fa.41.2026.04.03.13.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:04:54 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:04:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: aastha.pandey@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Enable cpufreq cooling devices
Message-ID: <ybptzcfs45xn2tkjm4vzxm4y56bh5m6yuzvzhagoifdycrqgdh@hzvad3pg3dcm>
References: <20260403-cpufreq-v1-1-9d465988c3f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-cpufreq-v1-1-9d465988c3f9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=erjSD4pX c=1 sm=1 tr=0 ts=69d01d68 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=PKSGMhPC2aK78RK9aM0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: oBM4nYvXMqM7CszoNIF9R9FtgsI9tL-c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3OSBTYWx0ZWRfX2ky87nkwv3sv
 xlpeKYhCNI2ARxA3FzGDj6lWmHI8AudFLD/IniPfNQRVntUZ8o6IHb6edaGzOgpAHbw6xDQOxRu
 HarNa/m0CRiWxAhHi0SmWZXosPa6xSrXEsLlH06JjlVKzrNGbs0XQlYyBu0VG60yMLB7HoAvYdh
 BIP7kCWVqb1SNMVv0Ks/7AHDHuA15Jvxj15w+HH1F+UZoFYzzVkU3gRWxlTXZ5dH0oN9kbI+j4F
 erT2VlwTaWQOcLA/EmQvSnfNzSxO2zXTHEw4eQQMENS+Tl0a/VI1yxCmnmaNxKjpzfcaNCM/eE+
 +XuwBcSqOOcdenQ/MqdS6CohL5JbvJX6ySIXBH6/KseweOF3lXvyQU6zsFJfzbHi4HKyud8HDCr
 gnpiROPYiUfNce7o+fpON3QgPlsWrAz7eu5NViM/CAOzh8EuCVd8SHF8KrOby5HBpvk5iq9hUar
 NCCrL9h6v4rx0D50udQ==
X-Proofpoint-GUID: oBM4nYvXMqM7CszoNIF9R9FtgsI9tL-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030179

On Fri, Apr 03, 2026 at 05:26:33PM +0530, Aastha Pandey via B4 Relay wrote:
> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> 
> Add cooling-cells property to the CPU nodes to support cpufreq
> cooling devices.
> 
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
