Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4FF470EA6
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778381; cv=none; b=SnS/886kjaHeHDZyjboi0nfUwqru8v/1R/7+c9CWgsu+4oMpzq2eSoBnhXa8P1SYdaFfDBo/hHwDd84JWIri0N2Xko7IKQp0W+6krouE2kMyB+8c0ex1w5mYcvDNM5yz+fAPqgyFxwpM+1RmBXRxTJlx6wXEF9DISv24UNNBw74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778381; c=relaxed/simple;
	bh=JjmvniVya9X9tOTvX/HKj5DtiFEetTs7C+oY88DsdRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNuLA8elDIorVDSW/c4mKPF9ySLbVlE1M4v0xQWLjt/PtPvA0XAfqED4vVfApBfWgKmss2+0xMCGlzKXRQmF0xg0gEWGOQHh0lrfKLLT6cMrkJGmoef2Ul00+IdoVwztqAG9SQ27o3aK0q3NX9zOqJrDB0g4F7gFGC3KRQzGdtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDkXe7PJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IE3UAH1R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDkXe7PJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IE3UAH1R"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnMDw3777326
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z5sYx4g1gwi+N2qkD2ZZH0sS
	StqyD/yADWA3xo9BovQ=; b=gDkXe7PJz4L1P5s2Z2wu/b0iO0yFDomwsQnIWnA2
	u8yXhZZRHrSCMdCkrWh86a6b9Z78K9ZssEksj9QIMjF+cfFrxBxVdlLeIzDnfPiV
	daTscmm1J5oIvsdDt8GHntoWTaxsW37YY69x0evwhYhjTUgjJEtAYGwyIM7DCCYN
	OxwSqAotG8fFk+fZ5i/sGv3Qhaiq0sSTzz+EsxuIYbA2Ul1PpeHxxCLzoP5qnHPf
	QGydyEHXrCIA5mgxfW5vnr70FgCV01ir20gwLkb8ctmzJyBC53bGENEb5ZWTSe3w
	jrOuNijvSSuaaqV/pumBD5SnUxt8/RCIc1USms7iYOlR9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfygqav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:52:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so235204685a.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778378; x=1789383178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z5sYx4g1gwi+N2qkD2ZZH0sSStqyD/yADWA3xo9BovQ=;
        b=IE3UAH1RZDlq0h6DX7SJjGiMPnaFbxpyA6JModiC408hruifst2woMfo83wBk4TJ1L
         alkZrjxh8FnXjUuYNA1heyGsUwV9ObmPSPzfG0SEZC6NiKBuQ9lDPz577X1fRfLr+g8c
         cX0W0RU+AMc9W0qW17h8jGgkvnZjZV9oFz0KUnrbf7u7uvbbXKefxeAc4B55S8NUanmK
         eFk28h5mJD6dnhPOBYKu8r8oqkInOBXPWerqpGduDGKeyF3jUjWyRvClVcssfrug09pC
         binSB5RnUntD3055crPmv7maKQpRXGC32iNs0YFIiVfsr05ZKnxVYwHghRvklnKqRkqn
         8cVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778378; x=1789383178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5sYx4g1gwi+N2qkD2ZZH0sSStqyD/yADWA3xo9BovQ=;
        b=nYwa9Brsudv+mjCMut7tuQI4gEB/8YivuG0kWv8rqer4FDAiFrSz166dyq0cB/vk3A
         d60eE7D067cJLeYc1yQNFNYxpQsbRonvMbW49tmL4BuS/qeNCTa6HBaDVIW0DY/HK1aE
         scp1dQNsRUuUZelnxkrV2vrIpCLT/UBscJ9YlgVL2LQ9GfyYDgGF8CzDj98vxVsfeNsI
         McinwVekiOswrig23GtVHLH+9DggncGGYGJ/mxNRXCgeEdHKhErnPn7N8pcSfEaERDHE
         sEmcZpUdFPabvYGOQYmBdKtA8S/bvCzGS0XaSKX4aWEXWFWb/4tF92iJp9SvBGreLK+L
         zDQQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1msZa8aNM/d/8v8N/k7DJU4AM0QwVpRTjkyPIGHr6QCXtpsLzNUdXk/Efvhf565dHV36noxVegOr8@vger.kernel.org
X-Gm-Message-State: AFuF++lc9Kq+XKVYqdK6AO/frAZ4tDK1lnEcJ0dlcxPIe9y2q7JTRYIT
	hd8PrGb8lVHjVh/1dZHkExgHd4JrWbJsKkYs/Pg9p4nXQvMioThDmkxX7nqhdSNZpOZp1asfo3t
	B2R/ggt/CJs44k+Ug5CWkJsIUDNT+liWVXSMuOmT8Wra+in8JR2ERaejTtUPhmQua
X-Gm-Gg: AYBFou1uoGWoBh7mdf6qzhOiPvIEo6OYqhTwKGoB6jAJftkEq8FC+AXptGB2ZxCnhk+
	BTT2fvRZ/aqAG5DfjyBX58vLQaDMLIJwelSVzcmVYBeVnMSstvI82zr/LOM6WluIYc8r6rpBjYB
	trKVgZOBy79BRQnwTaLq7G3UwMRpkzIiG291CiPItlzQbniv81Krag7mCNZxgb3t+dUQ9EKaEWP
	LeJ5rJE5AVg0zrmUXCswietA5RnJi3CIhVFSn64yfvEUeQSk3QfbFZq/oQULAq9gfc5cSQm8lfB
	bfEJH7HAKXchE/BKqIFbjrV583W05qySFzl7xjDnP1wK/Wvuhr8q3cbEnFZNGIW6o0XRq3GfMNt
	qxJqBLH7ICTQb
X-Received: by 2002:a05:620a:21c9:b0:939:597:e7af with SMTP id af79cd13be357-939804784a0mr1730895285a.35.1788778377984;
        Mon, 07 Sep 2026 03:52:57 -0700 (PDT)
X-Received: by 2002:a05:620a:21c9:b0:939:597:e7af with SMTP id af79cd13be357-939804784a0mr1730890285a.35.1788778377405;
        Mon, 07 Sep 2026 03:52:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm19922442f8f.20.2026.09.07.03.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:52:56 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:52:55 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: Drop
 NOP override
Message-ID: <xv2woply2khzvprxgatysgv5bqt47map6v5pm2q4ail3znm5ed@nmrxwi3jeziz>
References: <20260907-topic-medion_touchup-v1-1-10267ae55aae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-topic-medion_touchup-v1-1-10267ae55aae@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: U8GWNYiWCMH5Y6U-UJ_VdsCj5LcY3M84
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX2M8JKB9XFcsm
 NVNkidGXeDxY92Qc0wSIahYW3XU0H3R7U2HIB9nmxTv98xBPLK/FopRLbVjUajAVX+ADs/ZhV/+
 xPmu7nTen1uxDnJSXi++8DhpZWF2b1/op+2osDRLfA3S4/bX68DGBJ8NubiKKD0uE+Ht0gF51Bz
 nNYAsBGemhNyTp+hG/jKYznJCEqY/QJe7JEJSl35drpbVfoJFkh+OYqG+YdplL+16/QBjx7kVtI
 LuFP3jXwHKDNgWcsZdEM1T87+nCx14I36w03GgzfNBZ6nLmyNSpQUgEFHl0hri6Z2boQTNCmu6d
 bU/rZziVxBnjjIovgP22G7qJ2gs4SBwj56t2uGU3AlW+bBTTP1s0ON0Az0eemqhbzU6EUrfz0s9
 zCxBGcR9JN6g0Vzm59Dv1B6GGpnRPucGtLzC1Ew2bR310r1M256c1vUM381AeLRe5dyDzH7lVo2
 zcCDrIgG9tKTeQEfqgw==
X-Proofpoint-GUID: U8GWNYiWCMH5Y6U-UJ_VdsCj5LcY3M84
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX8gi3rPfpkXk1
 16X1wEsb504BujfPk1LQLHfpuf3D90eWVl9kKAH94+0/hAbZFtYW2b6PJ5fcitlJRNOtsGrGZ3y
 VI1eN9d08N7T3NRrJvhuz16uFuAzZlA=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e978a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MLhcJcjDbrHNuC7maEMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070118

On 26-09-07 11:01:17, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Commit d12cd85a4ff4 ("arm64: dts: qcom: hamoa: Add sound DAI prefixes
> for DP") took care of adding the prefixes for all Hamoa devices, drop
> the unnecessary override.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
