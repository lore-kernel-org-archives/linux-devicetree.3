Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E0C37BE6B
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429268; cv=none; b=FNLd0SfLsGLo+BCUnnFIQ7IDIFIUPPEg/vVrK8faydMkBZovLXv3XPViJed9/NYNzfGaj9sSOv+ghE8kLPQmPabuPeWhMlvvFAle3l0S/PJ6Omr+ngJuJEaS3tMTOGbeU5IZ2eEIvqcHji93IdFQnbUR+rdYW2L8mp+pNZ8cG3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429268; c=relaxed/simple;
	bh=gXRfC2VjDT+XZheOHTbKbVXeBbM9bMyYA1/mdxx+YNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tuOpikl39Rn5qdeaJ/Rg9/dSATxb1P4V58c0ayMiO2ECq9lvfNApLGwMyo0icqujc5qUvqzeEwDRbJsSj+yRpMVelSKFl+cVoRobq/ez5Nl/d8/t1f0xCaxc/mSbK3j6sCzP8df6gAe9ivne4PRc+O7bAmfAKZ1eLVa9rldd8LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OPWTosx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hoXwg1RF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OPWTosx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoXwg1RF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWRwg1179812
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnjmdFxiHJbplHqHTRM7ARcmcbr5wAPPkXRM+q1ZZUI=; b=OPWTosx7xtooPdQV
	yHjJ9jqz2rPsoV/aQcdBbj2WYdVyYFc3+pR9Nj95skiup16r1SX477S/gIEdiIQy
	2OZEZ4XGs2PThTrpQbjBzqNmXguKyQeXssRrTg51tZX3w2mgPXK32H7Q8vSxU6Ok
	ifoB596Q+i+aNlqiXKsQsDi8o3DC//Vc2KJkYYa8Dod+TQo7jJ9yhBveMG7RG/Dx
	N+oJEj9oVl5z/Oj59WwKiHGgT2V2orrdjlxLrb6lnnfZRm5zgEVQFdJndVAgofKv
	aKW9LxFMjuoBN0DMBkUc08CI1upgaOBUUR/9PQ8EsLq3kb21g65hRauxd6QRRu89
	mOhP7g==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n80nhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:34:26 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6688d64bf2fso3358823d50.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785429265; x=1786034065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XnjmdFxiHJbplHqHTRM7ARcmcbr5wAPPkXRM+q1ZZUI=;
        b=hoXwg1RFG0f6ihOF8Nm6IKR5MVmyknRS1dlLi9BlqQxjoFyfA6MeoR2rtZxh+BC8wW
         r05xB+6lMcUgmdcZ5TjiIwqULlTgBlNfV7Td8AlSolFAatGxnLqTj3YyHsIxE89GVkrR
         aNiCRX7Op4qhr/UcCHrM1cJyqK4A6icFLOB+e2Icld99++Yxg+dGLPJBaVhMEBJ96QIQ
         d/Bkj8WSRj0dDaYX2uCAF9pFusvLKMbwi+u9/SniqC4AGpgJigbhEtoQJmmr5XIgNUNF
         h40DGkO1BWh//27k6pucvDZiVaPTU+NlUSpX2fyjFxvQOMzmJ2LE+R0MeSAwWxzuaWtH
         /HqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429265; x=1786034065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XnjmdFxiHJbplHqHTRM7ARcmcbr5wAPPkXRM+q1ZZUI=;
        b=g4gqiXe2lknateQirNUTTgPImwntOw0qtrplN76y8Doa+BBD2BCuJGxlpMfLtdndVx
         0Ko3J4W1U1QXt3qDfGe3eHRNfhlraswUSarck4zuaMh2JXYs7QOMJUHMSTJecF7tONPD
         aS9kRigIOmB6p9fcc6ewCMeLnQJJYw4Su2k71yy77fKokQxg+BQy/GY/sroOV+bi0xDd
         J1z6OGMZeORSXdbSG/B/dMHq8oDNh+IVxmSNTfEKkvFzJDI8doj1Cw50f3cBZllltPTg
         P2RCXbw0RByWFlp1Z64QvXXgQIiikI7wFXiqjhkPFyWPprDS9Xq6K6L1oaExf9CgsBYC
         Et0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq1jXRo/+PghNUl/V9uvtcEuPXU1eKoyDPeCgAYCKZ+0o2XEY6vCQ6C9eP0EOqyeg0TSsrsCfjPXHLM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmm860fj0+VQjzWxjPn2OxBO0dy7J2eTnIXmPd41erLaXVg8qE
	jyh70WYNP+q8y9nF8loirYj4DmwzkxcBTQkZgmqGWVFzHeCaVTfArWRHlexiBnxo7lmMcTRVxHg
	dm8/qHKivuZMJ6VZv/SE0WKq5+l2AbJXg4shLq4F/Elh77FRsQyovSCByR2fE2d3M
X-Gm-Gg: AR+sD10f/cM7RfDuuUqMw6ro04anbohk5FxWK0MOxOx2boDjO2mJJNcKIY0O8JLSJdA
	O0nblH5isHc+44xMD0L03Pl6xyZ/Lash/l1f7xzOFJQuzhqgaXxHQbAGF14v0Y4cbd/hft778UR
	T5zRFaC5qGspduJcKN/R9YiNM43uTB6qZPHUYs8IpbrSTnFgVvB7iEbm/87uwO1Jqd/FWMmxnPv
	b201BYe8vnVYjmMdECdp19PopIZNnqtzHm2vDa+YXSnzPk1iA3Ab8kqK+I31p0X5wZa7ZSKtFIt
	nA6439Neu+pjRcc8pYp+jlhRywfuWwSdqh5ewVi5FhEBAP5OTzIDLHqWzWDH97ksx6P2GGWEDuO
	R8aghyLMGgzFh4iU7A20iO6hbOrqyd5FwdEq3Nd03MA2b1PC7dEQwbZu9x4hu27IYVA==
X-Received: by 2002:a05:690e:d4b:b0:668:8986:83a4 with SMTP id 956f58d0204a3-6692f83a99bmr1913821d50.98.1785429265551;
        Thu, 30 Jul 2026 09:34:25 -0700 (PDT)
X-Received: by 2002:a05:690e:d4b:b0:668:8986:83a4 with SMTP id 956f58d0204a3-6692f83a99bmr1913793d50.98.1785429265109;
        Thu, 30 Jul 2026 09:34:25 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c9315ddsm1608848d50.16.2026.07.30.09.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:34:24 -0700 (PDT)
Message-ID: <9d14fbef-43db-4463-b7d7-e5daee1368e6@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:34:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-5-973cd3a226af@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-5-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNCBTYWx0ZWRfX0bcSA+Z4E+Qo
 kbvpMyI1O/GG6DVj6N/r6Wiu8QHGmLHRY3fTfXAkgVqAbwVOI06+JJNHwtnYXnnTv2ktKBXPxMV
 snZTRJDJ/ewf0naaWBZilqcxoD4PuOfm0Z8KrKdfFP3izcNzbshl2fDngd2uti8JSr1KvoDkrBi
 MGZymxDx1pFd6NqYydXDt9zydyBKLzEclLFuWpA/FQgokLBf1bhvvnJenWlHLaXiOx6lJjfvn9G
 LZOaAD5IRcoEOgkaQrI4ov/+Prn82WQgdArOQskYoCXfzHIaiq/d2MT4wEVWJGjzJhAvPaoFJcA
 p9v5qZg3H7vsW7LI5LN8JwcS5itZS4oP4WkTe2i65JUkhXYv9hS2N+SibEh3uqjmsgmyA/gL1oK
 fPcqTQtaNYCHCNLg3+VYpL0JijZdBKOOB0Og0L/ZMx/E6Lw6sWwns6/ufkGsJWkeFruW+/vZDyv
 Mhz0GkCJ6t+u/1lqiAA==
X-Authority-Analysis: v=2.4 cv=DNq/JSNb c=1 sm=1 tr=0 ts=6a6b7d12 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=oKFihCAVH3oSEhwhxOsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: SOsR_dCxeUgXyxyKjkabvi6Ryn1Xnd1_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNCBTYWx0ZWRfX2++mfAQ5sMbN
 N+7SCqEyi+RNin8bmunYW4qSzKJJC4hXoxUfFOjssGnq5o1ynwHMN6DC1zvfgJgzypyE4/lCNL3
 ho2ej0UQfn7kKW4YbHkkzmlQW/FstMs=
X-Proofpoint-GUID: SOsR_dCxeUgXyxyKjkabvi6Ryn1Xnd1_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300124

On 7/27/26 16:22, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> when it reaches high temperatures in kodiak.
> 
> Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
> for modem when it reaches to 95°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Since the remoteproc_mpss node doesn't exist on non modem boards, the
> cooling-maps that reference it cause DT compilation errors. To fix that
> remove inherited mdmss cooling-map nodes.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
