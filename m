Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4DF23C4F2
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100063; cv=none; b=Q8SBg7z8RsSPmf9P9qHWhO9gEHXW2BBdKbwHK9S0Lvd4orDRp4vd5ltL+vT6C8sw/16ULym7NlRyjaCYMfMGT062O8qJjJtLI+NDIMO+7gWBoyixHKPgnO6RjnDiVN1CwV3Qb38iRplQMgIAO+hxSeQMhflkRHSrC51qkTbR7NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100063; c=relaxed/simple;
	bh=4eiS+kUYjXkA/CvALLB6tTd336SKOSdr1Q4pSJh2b74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YKKek96OqlWPw5oRIPOGgLp62ZlDV/jUBL6TUk0ZUYcY93jvrahobmI9tBPPEQtYPz7jmw29ID9KAZiDltJWdCxmc2TOU1aQduQveit9BsoIePgTgSGu57H1LioxaNQIY9Ni/5nQwXXgKmNzvbevov6JP4SO5pTeDY9n0EeqikE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnrbPtSu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATeptUcN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UnrbPtSu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATeptUcN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBgSK1137457
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aal1Mp+rcNQykDJS2aT5UL079LVfF8dm4C64yY/zbBA=; b=UnrbPtSuKMl/ItjR
	Hm1ylDUS9YOsP/YxGefG+vJZlVfmd99/ZUb1UsYt9NMw93lXx5oTeinUYkM3p8qC
	xNSZ0/Tjva+v13f66TwpQAYuzhz4ZwNOJU834H+SSKa3vc3/olyym1YWcGmZFruS
	rsSQbyHfI+1yORGDGnXK1bhH8EJhrP5w6S7P9Cli0kmPP22GsFckAJkH3krglB6J
	3wU+orXqwY1MCeTDaE6CqMikVx8dFNBSz0LdYrYdhcmA2syKS/OlxWsQsUka+hnO
	EbIhnQXbkDmRBL2Yl/hOI82EulH4SP6wDm89/+R/Jdndn+z0JEDP8EdyDPifMsP4
	yMhnsw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh2t8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:01:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51780e3ca44so13421871cf.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781100060; x=1781704860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aal1Mp+rcNQykDJS2aT5UL079LVfF8dm4C64yY/zbBA=;
        b=ATeptUcNgUNECNe04WZY5p+4wXG9Y+22f3fOydCXTzfGfur8cs+8Rd1CKggs9T6Pex
         a14t7Et3/EtsWo4x9wzTjiorNReaTgPX2T7NEDejE4WfI0K1iEQU4zn+Lg267Vyo76y1
         KJEgqvlfigLEzC37w2dPZqjjwj2NyeSIc8qy5rTuqBjaVxypLEBKclXt3JnR1wBeTLs0
         3kouSUkymDHl8Lpyn7TihZaSROrhxNRMCwzRUhRNAgtRZLzqb9npiX9hhk4pPNLz8Mg+
         xLtIaOFBVcJfADQGuTM1Xj/JHHiALZuz//izHFMNMJuPUttgpYVwn9PLgPTu8gHOaioC
         QVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100060; x=1781704860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aal1Mp+rcNQykDJS2aT5UL079LVfF8dm4C64yY/zbBA=;
        b=PVSY/OfjWgu9HVFPjYgZ/wEIaJF5hP03IVYVtV1Of9yukAfIEoySShp4pXiWh1Cpmo
         QWVfT1CD2jzeTLHN5AGL4wA3BwYpp/ZW2or1x37kloUHnBDPJJoMHLAwYhYoBjOjip1k
         HUWmL59li0p3DRkYhWZ+6jTCztEgjwDyosNazbRKdxXaIicXPeSTdRPcfTTc8jOLHWao
         Lb1oO/jVpyQB27TebIEQMce8uQ8PNkLYLC7S9GB3UziL0XAPqSJQ8jO5o1NzbMyHj5ef
         twaRpZ29zE/CT14Y3raKGkO83umPciEc0z6DOeauDkLT8sDIyXLSSx1UdfBQ/UbRL4aM
         S7wg==
X-Forwarded-Encrypted: i=1; AFNElJ8bCe+nsFxbivS+9O0jbhvty99dBSru2V6jrwHmZsUguOXP8loP+6kweEsuiGe0+NPCVaqyRBenJoe2@vger.kernel.org
X-Gm-Message-State: AOJu0YwLz5al6VHpZyCLgimmBt1Zxov4qIJ3SgMpZIBg1vL6chg2CO89
	UP6uCkINXhfJRqRezMJZ8IZED2eHBv0Bb5r14mDVMYDJyfGxCh8a4YCuuA/fr0mnYwaqqYSPhQB
	VKOpKXOg9GKfXmNfn28BrLNhMflxUDdvBqG1Gtqr9cFnDvpSTu5X1WiGhQKwrKgCb
X-Gm-Gg: Acq92OGlE00dDly0M9Dy+L+/UXLfytrM56tTjAl69RoRXBvgvoWO8olx7SmfHJpFN+V
	n03j6cx5KNcL+Gtt9JNP4bcMbtX+90e8YjVPBnLH0J1jZ9kIE14vc5Z2dFt2dSpBsIB6W/iU8Fg
	RxovVaWBQMuSylMy+eAhzDnoZCeD7r+gxdy69Iebt6NDOTOt+EfTtunAOyZu0bAyGJlW3ka8+Pp
	+aDK65K+ZxXWkeFBEwW3TruRLc0ociDgzRizl4tjeKxTuyWOo46zVi8DYdnjWtSR71DUBMLT0Hc
	6a2NbgP0iZoj/0FhXzTvH3fV3Nzt+mg72gY9XyEjo/zJ4ZJKenQFhJzGPolTTUe5HGdt1Qjo5hb
	A+6+f6EeH5m83LeqomCUkn9sd1JuX7txkPgLWEbqVElnjD7H+mTlIH7Yk
X-Received: by 2002:a05:622a:d:b0:50e:487a:bfef with SMTP id d75a77b69052e-51795a481e4mr227781141cf.2.1781100051188;
        Wed, 10 Jun 2026 07:00:51 -0700 (PDT)
X-Received: by 2002:a05:622a:d:b0:50e:487a:bfef with SMTP id d75a77b69052e-51795a481e4mr227755911cf.2.1781100037281;
        Wed, 10 Jun 2026 07:00:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055305d40sm1175978966b.45.2026.06.10.07.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 07:00:36 -0700 (PDT)
Message-ID: <55a34f28-26ab-4bba-8a0d-282b5fadd374@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:00:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-9-8204f1029311@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-9-8204f1029311@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzNCBTYWx0ZWRfX5+GyLaD6kfI3
 zhQ+FW50ioy8eXmXgtriP+caJtoX2wCJpid67h0fNEX7ZelCkvjASMvcMFGd1Zr9ttSSKc7wnJ2
 ZjjTlUkh1CfpHPGhg4ZBh9FpyaIteABXAYT4jaoPX48+wWQAUedQhjDLfldukHyjnIrXt53eshM
 7nCM03UgdQabRAYuzrCbFZVTvopyosEqjZJjmD6lK/7uLnkD6N+Me6hD4CaS4ORLbBcsoEHlWqc
 sZacqXf1+RWWpNtweyVwpTkQHIB8E9Pn7NUUI3Cy4vWrTB0hRh49+LHH/QQdICSnqSm5Ahtu+13
 DAVum9UlTAC41FFMx99crzr3RgB0eVcGoBXWELG/reUVjhXBT1Rj1E5iXXRTZnT4FpLlqM3fUoA
 2t2hFouiU7L5SouJLAuzUCR/DAosTySJZbTjPnLjmE3I3kr7R9L9xUCe85rS3Io0of/QZ/BpOC1
 Gtx7XpgjeGGUTbmjFmA==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a296e1d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zpiWAdgaf0cvek-7FL0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: hKxnwdP5rsqFr0QumdeqGe0FXrSDUkdu
X-Proofpoint-GUID: hKxnwdP5rsqFr0QumdeqGe0FXrSDUkdu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100134

On 6/4/26 7:26 AM, Imran Shaik wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

This RCG isn't marked as "safe" downstream, was it overlooked there
too?

In any case, this needs a Fixes tag

Konrad
