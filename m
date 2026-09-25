Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E86339E18E
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329424; cv=none; b=qWUQD07X2b7DmIP6K71P8obPXg+jKQFcKSiY/rstcWZR2rrA3vW5LXxDQ6clSD5o31khfeBWZA8OkAacT/eDHk1MoTvfSF/K3ppk/uP/4amrFaQzpl3dT0TYJ9pxYaKPy9kA5l5gA9HQZUbffsVkvhDY7f/K1VevgQBEL5UX96o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329424; c=relaxed/simple;
	bh=l6IRaI+dV4k/mMZV5b601pyccv3/YeQyQFNvf/v+a+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiqmOmgEPb1+eJAfsriRCeBUzs/EqAEEsb3lIaznO/xiO6npLoDBtUvOH92b6ZHmbG0A2JQJG/knQmaTVJFIVf0XPJBGcSOcaoJY3k0OCjvwkBa6jL3dleDqylly/5GEodK3l1sM3jjyu4UWtbVYNahFxLwegyKQN9yLF+oXQWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1WoSacp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iUfE9hGG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1WoSacp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iUfE9hGG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JDLr3627522
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p7f7+UakoQrWZBiD+hsXHAx4
	mws2Jt4zSWi3n3EVJlE=; b=S1WoSacpazV92PtqOVEedB/xrZFnfrlvMNyy4AQT
	TehCC+ri3g/BSeAYtPM3z5CQW9Z2oSrWwuUxNcN4EJm8dWZV7NXUcZ0fujf8Svpt
	enX6gw6MJ3O5jsLo/DccIuczEjmrnFniJLG8pEZl+pTrKApoRll8P2Avy+1cm1zG
	1psfzUC8v3Pat7se/vyqHRRKJegPCfXkA5UrQjIMLCkIzhhse8BPzBMDM+rCajFs
	7ar5nU+0CnR1hnfvMvtNdlthbnS/QVS69QYwiBZMx38WkqBAe3IoMJrpf8z18ruj
	rSqCTH9NfXWW3f85mRuFEmjEmdaVuZy9BteknIu3cigKIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq38suh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:43:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0050a554so142523785a.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 02:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329422; x=1790934222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p7f7+UakoQrWZBiD+hsXHAx4mws2Jt4zSWi3n3EVJlE=;
        b=iUfE9hGG/cT7iLnwxhnegpwh6ewkjQKtKYm7/kGt/Pq02J/At183c55HuDUJ5XqyLA
         e2V2dcMRgb6N5w+kpdNYsrLxIE0lNgGd7/KLew8o1v7Rt6QUs74hHhnpC8frb3NmFldP
         qqJlwFydcocrLRuTw4Mjz3YnTgSumjbkRqvSewZ76uRlobLVOYKKAQQUn+UT7vX+3B3B
         dDXBdvhf3YVOQCFcPUGDlW1XziBTA8UxyiC7cmRFu99a7E/q3VGINMT6nvKG5vitlvqv
         +YUubGg35SYQeNNnl6Uy4E7Edm6wS9jWfktImE58+SoqNdiChfLsRPu5lC7quYcRjk/4
         9L6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329422; x=1790934222;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7f7+UakoQrWZBiD+hsXHAx4mws2Jt4zSWi3n3EVJlE=;
        b=IHHgdmGSdLFcU/XqcRCtB7aukK3x6uhHv+HZR7Cap0j7od/qetaEiMAdCinSKVBKrD
         dHTFFi33usEKejtWbUwAPT4F/2qBZG5q0gYjf6htCiMzvomkAcbSMK1eFnhR6xrn5jPw
         61zFq1oaS+3wxkVdD9FW9jl2ymedFhWQLVqrdSO52UNVpuBDypz1kaHzIIbkr3OqzcxF
         696DIR0N4EIoJkQmokxG8nrRRR3OZqJVDeSlX53lOJEDnkL/gRFtX4BGi0piujv3QIt+
         4f4+2BKRYdx4Gx/ad0v5wHcEtfLdZXn2cw3GdQpSdpZAd+jyokY+GhoIsREg+lIEvL34
         GXqQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9TD9KVuQvIBVxpiMYg+ZuXQ4PMs3J7H1MwJTTSoqE1jj9M6tST400IF/BHrwfsRQyfpgQICo5EQS4@vger.kernel.org
X-Gm-Message-State: AFuF++kOS2qY738Kpo1w1DN84HOA4BFi2rJpNGl2JseoSwWQOTCW+GXH
	uHWLdL+mnO1DLD9RRerWcya8T+3uw1sHdvNgaJZ874ZGefz2qUxYHaTKRY28HpZ6FgLTryX17gv
	FQYXar/0Yn0qI8MdH8WnQOuOhQlVE/Q89cvP7k/WqxtX9IDu7dVvcaBjKmcXtEGWl
X-Gm-Gg: AYBFou1f4FSpb66qmQa8xEYOpN03ypcwt0iwHdHugmyRk5N16S1O+xymLaH2B18NOdy
	9oVVUDG+9wl0FgE6+xybSi5pfpxG/AMqrd8eeJ8135X0kO+zVI4TvkvXOIt1W1DyQBEexM+HK19
	MwrjVFKPZ9d1qRfu5Uf973tsX826ZXQBZ5UwXIo6xPIiufg4EiBw5hZMY1ewlPxq5C3gXvg+HdV
	LkCqGsrPq5Gsat70LF/U0cP34gzbBee/4x+wkd+Ba72NgNO/wbs16F4HGiP2pLeHFrVfBzfe/RI
	iOKZ8JL4AarAfFG/hzqSxwcfFJy+qbGimguIUnhjtIEahHeI1DpiWIeSfbQTypHfkxjBkKs0LGm
	p+uxFSYb7vGi4OFE=
X-Received: by 2002:a05:620a:414a:b0:939:191c:cac7 with SMTP id af79cd13be357-93c43b7e4edmr353676285a.13.1790329421453;
        Fri, 25 Sep 2026 02:43:41 -0700 (PDT)
X-Received: by 2002:a05:620a:414a:b0:939:191c:cac7 with SMTP id af79cd13be357-93c43b7e4edmr353671885a.13.1790329420834;
        Fri, 25 Sep 2026 02:43:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff044406dsm53968535e9.1.2026.09.25.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:43:39 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:43:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
Message-ID: <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfX6UwlxSVJiel/
 w/3Sw9cDSLv44Q+okC20UUXUVzi5tcjYcpJiuHtSyIfHEkaDKNg9cO4ungXedAvu+6kKIR61v/f
 2QwdfWsyEuEp7qXYH+mSmxAoxfJ1W+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfX/CybHXVFzcPg
 6nqFIXSUOSzLUY8q+9MLJvAVFloogxXAJXzyHly87DmIWNUexz1MOPgWNOZ8lR6NiZuwrxY2btW
 zN2ioGz47R3qLu8jPQqtQUeetGTTM2Kfi002wsUJKGEKcxuaj+Nf37TaE8qa9eiEaIInbXj/k0e
 592PB3NOwqPixfJixZVkKPsjFLIV7+PorAA3l213qEnpqz6yGb1JbrF081aenOgIDXGSVF5eExT
 3a1pK6q339SUL9ygavGpa9PuQ+cwUYBZsPIivDnharWSi1G3BePG9wYXB8eGsslcXWhqqCuGvUV
 jWaHsaMHiS0zOcbgMTKxmnJh/Uhhml/WT0WSa4ClQ6kG8odzT+IRB1GhbhuEn2UVwHhvNXFT4WI
 tQ5AUTFMaqjvns1+zXoyIs22WYC0ixpVh4uoJAm5fr4902BbpO9JRZwlIlWV52bLYnnapVtxwsd
 znVHUaGBiP5aHnsyhhg==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab6424e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=i2aUADT-vu4eOaQSyNQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: BQ3nRyO45S7pwWvMCOCm5Aw3g7bKe3LC
X-Proofpoint-ORIG-GUID: BQ3nRyO45S7pwWvMCOCm5Aw3g7bKe3LC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250038

On 26-09-24 19:52:32, Gaurav Kohli wrote:
> Shikra firmware handles CPU thermal mitigation up to 117 C, while
> Linux CPU critical trips trigger at 115 C. This can shut the system
> down before firmware reaches the end of its mitigation range.
> 
> Drop the critical trips from the CPU thermal zones and leave the hot
> trips, non-CPU critical trips and GPUSS passive cooling map unchanged.

I thought that was the whole point of having the critical trips set to
115 C, so that the kernel can gracefully shut down before firmware cuts
it off.

What happens if CPU gets to 117 C and the critical trips are removed?
How will firmware thermal mitigation handle it?
