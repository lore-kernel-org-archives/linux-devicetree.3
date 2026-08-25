Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972913E8685
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651607; cv=none; b=DTOQSuc5ri2TULsEUFGwG/kupIQbAxvr8GiaFmK1IMMVaqai2t7NlqeeQ/xjc8OBXGtMjSUtmaXLPPrJw6yQO1BW4ZziabKI1T2Qo4MjugQ2laXZeP68qpcF1lP86UTlxXPNBPcbDZ0RpTaj0m8fP1I3JSfIK63MAhxfXhmIL50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651607; c=relaxed/simple;
	bh=l5X6ihKbm+gmWczFyqZudpJABTmGS7exPIXHaJYGFxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuopRlbV+1XdKMYR2aCFdO8snZYFYFlAkxyM36JK/Ps6yz/Kse6TKhnrnAXD5chZW7HhcbJ9ZKmjvvEv224YPPsAjaVzc4D9pmhR/33OGQ3oAdm/2rJf6tlmUFw4fo5xEUrNYJvx+B8PPZPv3PF/vReKg7oM8A82ofKRx6eGt7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niYAYoXO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YcZ4BFda; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niYAYoXO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YcZ4BFda"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88I0Z870409
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dql0ic0Yn/JBQsVTOCXTrILTSajEuRbm9CRzP1GLCp0=; b=niYAYoXO9OStFEvY
	oBLMZ2QFwuwv5XNwvZQqTgg0YG8OO8tCsdwxy4j41blGlmYO4etpQcG6ehQdOSxM
	SAG616GbzRA3/qiZjhC6yUUaX7FBZTBKjtIAI7CFWqtFEsjFmJssx+7TL3E2haT9
	rKLH8l4zNw1+yIHi5J8byyT+1dy43RKvku/z6MsOgsB0LwgKwyWwgDWMYjPjKz39
	aDxGPV/vVRNALTEDheriZVSFwNn75pAedj6KOqZG6I9co+tSdf+O1LSZ5zgOKesX
	M9EA3BaTVxHwX8soSfBIlcos3xAuzbMQVnVxxNKmwHHawUmp8L7mcbi1TtRnaW/s
	1uE9gQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t3duayw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 09:53:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52845bd815bso8919741cf.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 02:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787651605; x=1788256405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dql0ic0Yn/JBQsVTOCXTrILTSajEuRbm9CRzP1GLCp0=;
        b=YcZ4BFdax4Uc+1Vv4CWjxKw4ftbI0lNQ/6+WPcwW7A8Car2fcl8y1os7vi02BLgP6p
         oO6M6/yU7s671E1Zup2WnaeJJncGc/gCey12wA5HvRoIOv3o8ML8ki41EJ3gGbcyBLB7
         1r8lxLad+6geAdE91p7A0suay93/hkptDAvZuZh7gYE7cvQ4RPoKSoWK4n0akjMazUT0
         NliYELc413fedIFLfgiOUv5Fmu/hWH2aLugOFNF2HELB3FMQVq7CMCxhBqc5FwZEn1DI
         +8iz7RQ86XSN1XirTiGNWSOhuzkXFKgzUBRE6mqG+frsYq4biAumEt4w+lc0FzLePvqu
         K2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787651605; x=1788256405;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dql0ic0Yn/JBQsVTOCXTrILTSajEuRbm9CRzP1GLCp0=;
        b=Lq4oMnQJyDW02aaT6vXT4zQPIchpSlgwVXipwE+5dgwM5nbBD2xnGOof9ZkH8BBLFQ
         HYox3MaIHudmCzZ79thAHYMgyqwDGhvSnXLvZiIhnetgh+tNfNTdH4D1UbCIFdvgqHsV
         Or9hxFmTlyRkfH2uCwHCh6HuWIdht77kd6nLhUtEg+KXTN36hXrgCOYq4RUwVex3ml7b
         NEIefJd7DKaU2at8YzI/EohwnOhXrLWBuJQ7fHdUjDqV4yWqMbn2G11x1rbDWqB8I3P1
         FfBZ8EAlXsI6mqeDrXTXiZoaIafTvj+NXAuYC9MylMNbXRzeoUoTwN9pzIrbeD68GMpS
         dfRQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKOkZKgERPf7wkcuLtmuKBDq3H1DQQsWLL6EtZ91ai5p6nmpxXDFQFgzl/bgyK3au+nG5TBQ6cc2dy@vger.kernel.org
X-Gm-Message-State: AFuF++kBtF6o/hDsIc76pDunQZztlASY0KHTVF9xMAdqke9FJv5jf7PH
	X3wAP2hS9XME6nWwB9egNCaPYWCytsDHC+sSGGapSOFwLajIAHADfZrmLP2Wz/wR+Wp/mefdSvK
	bkpN+G6tY9GgSVvkGZoD3i8ZuNAE2FZhnIa703QInKprfIQQHT3GSwycyn7D0gPMI
X-Gm-Gg: AR+sD11jW/h4bpo0iwvGF/nT8FIorTkPTRXRXVFkKmfYKI2uuiGCOzft8gkNKF1hFdX
	npTXIutrel/pSH1tzGRjF4BBdcyQfk8ZWhCDsA/TjBVpTFcVj0Y1d9k1bf3XsxhMHqZgb2ULyuR
	6Q3+rGHQAtJpfrTym1xTtUpFpxXr9gINELsboHSyTlMk3ky2zKLIYyNnkYqXFn/4fpBSj3dXs8u
	KbwljhnMNspIjnsFhHAbusFMfvYHik5y3skjX/ejrlFU2E1h+ghBd/64H8/LuicVkuqM0kshclq
	YMc/u2U6zHl78AVRdhg+Kd4sVDwHuYVOsHwxbkCBLWFFWKeCQLk9G5/N7hpE58c+0WMdiRIfnrL
	yigT8csXqA8UKcbnoIeHAQMLG
X-Received: by 2002:a05:622a:607:b0:52d:9a83:419d with SMTP id d75a77b69052e-52df54d7275mr238711301cf.0.1787651604769;
        Tue, 25 Aug 2026 02:53:24 -0700 (PDT)
X-Received: by 2002:a05:622a:607:b0:52d:9a83:419d with SMTP id d75a77b69052e-52df54d7275mr238710981cf.0.1787651604251;
        Tue, 25 Aug 2026 02:53:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b59fsm1923235166b.12.2026.08.25.02.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 02:53:23 -0700 (PDT)
Message-ID: <150c1500-4d78-4350-9ce9-407615a08312@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 11:53:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260801-dell-xps-9345-ec-v3-0-9f4bdb5a5dad@vinarskis.com>
 <20260801-dell-xps-9345-ec-v3-3-9f4bdb5a5dad@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260801-dell-xps-9345-ec-v3-3-9f4bdb5a5dad@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iuC5OGDWJL49wcXwfS7Wvk7Koz5xdfAT
X-Authority-Analysis: v=2.4 cv=OLAXGyaB c=1 sm=1 tr=0 ts=6a8d6615 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8 a=BDX-M9UYCxStvK4FQfUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: iuC5OGDWJL49wcXwfS7Wvk7Koz5xdfAT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4MyBTYWx0ZWRfX0TH8jAmlWgG4
 eqvmEeQqLk3lrpmF5E/lLzJOMkK3UdhmJv0DDViy6szSNL+5QkR6P1LgWzA7d6qyGhOP0vCKCFP
 erVbxbJMC/43CoCag9zvBgbfsPPZ5OE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4MyBTYWx0ZWRfXwoX0MQBNCVur
 v66HoRZp1Gm5mLrbXciZVfiM7hpiy3iI1Xz8n32PK950IYd3t8QceN4lk+6INmWEwdtg/3UOBhg
 tKEzL+LRIFvN5QHBrA7FYpvs6eXMC770UOQbthElYIkKR2XQBijuynd2VEu+zsP/k5M3/dtE2Bv
 450W+qd7XJ4doQ5EWmb3mBCo0XMzuef+4tnRiuyxHnrUXobHH9Vov8vMVZr0QCWXO9jMtVOwSLv
 ktRyd5kuh6AdaYiak1uuChioVgW+gImVRSKvbrzajUPvo+GABctSyNqQh1igJ8tcqZh+4XKBAVA
 VNxjp+j34ncAB63+JrdbF50qDViZrcxxyojVyJt5TO90MQECWpUg/VY9BEU4nh7dYincT7hE++g
 RMraSPZWU1rzx2bmswllseyQciitPlYbPl3CYYZsYU865dpbbzQilsNRJ2mXRwa+x4yh62BU9lx
 Wv0XhGw8xaLi/BVvzuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250083

On 8/1/26 8:22 PM, Aleksandrs Vinarskis wrote:
> Describe embedded controller, its interrupt and required thermal zones.
> Add EC's reset GPIO to reserved range, as triggering it during device
> operation leads to unrecoverable and unusable state.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
