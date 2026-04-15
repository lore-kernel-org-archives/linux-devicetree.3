Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F76C31F993
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246616; cv=none; b=px8s9uUGEqNsuRrR6UNQWoNdsC/DeHoH4Vwu/sB0d0E6KxM55WPfpXKWlYAvMD+22fwU3DC+SBdNSCR3svT+ze2SbGQvrEiZDn8klMjbsqhrawhdO3U6IcwyrTdghebgDQvKXKRaO378pqCaPuddnene8YqvkRP7sR1Ekaqkd0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246616; c=relaxed/simple;
	bh=5i2y3GXDyHPHWiKAGjURj4RugODet/PRdhcJE+zWkmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fhXQh3nyGu9PbMC8q6vX52o/HKY1byVxlJxXfr5mH92AlAga7YItAHT5Glf3ltssjk8NQIqmN75XP5KOUA3VXbHtedwbJByQFQfZBdakp5ho7t8ktcHxtbO88gxSJ2mcN36R1KhFCTVAkJi7w6S7jLpnvMs7rCZk2KzRN52p9Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tnamk2gw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5sUyzeQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tnamk2gw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5sUyzeQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9fBRm1778836
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fg7Xik3cuCHkFBDijQ2pzu3/5t4YHyhp1BJEICZMYVA=; b=Tnamk2gwcR+Gc0vY
	UTdkeSkr2+wxWwsrSD2m00vmDEpCvXwjpdZrEoINHfgSziUpHT0kdOxqlJVfI9Gh
	/DVszf7s+5oOx53uMCACAIhCrwcOSh3CHCdbuGGsT6qbil1u7akQ0yclAi59k7U2
	XpsoDm8fpbqwfaB1HKlo+Bf8ZXW44ufBZf+5uHTsqjhtGX0AyY64QZFzk5GmvgQZ
	cM6Vsgh2xvM3pXfR8plupscBncTjaaVlvvIrnUFqCx9tCRLSfce+QQEGSLNIVXPh
	WGa79+H7g1aRmJIZREH2vGEG9+1IzLGpSQZPJWg6dm1jg7fJ+R5IBdsNrrHKtSU2
	8fgN0A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw032ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:50:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca8a79f42so7660706d6.2
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 02:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776246613; x=1776851413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fg7Xik3cuCHkFBDijQ2pzu3/5t4YHyhp1BJEICZMYVA=;
        b=L5sUyzeQJlOAfcH0ZGU1tgacYDZsvkeZTVhtyNy4sm62Zvm1qWtQcXWbQ53f2+B8Xg
         nCPnT9NRcLtIcRXBYkvSa/GY8dR25p7wl3w0gozrjPlC1EmQHXt2BvicAQZvqPPnl7YN
         bu5ik7X3W6CpWUEYHLIFT8wgFgJjq/aHTbIAMYLoOIVVxUfaiYHyacln6NDGDB2BGIYG
         W70DVM9EoVrJhJj6W7r9EBZXiaFoKCy7hrl7xbRzYwfodaLX3oW6GuNQh2IyDbBKRUh4
         2zPXZAhyII41LU2c5BMvXLnje5LrXUxJ7faEfNBSiRwMTtI70Ww+N1YWFxweeUFAqFyI
         rBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246613; x=1776851413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fg7Xik3cuCHkFBDijQ2pzu3/5t4YHyhp1BJEICZMYVA=;
        b=pqBGMx/oLjAhgvIco5sivkg+Xt/kByx/4/C6YhbhESJQImMdKwo8FSLMwYa1fPl6qZ
         8IyJ9y2NZoqTfbxR5gvQWVExkYyey2k6vTt5ytRJD4s0+9UiU1KcG/eeMxlf6UVbGo8i
         A5WMv93jECtC/WLmbdSqk+qFXQ7wU16cUjQLDxUFWn2Q93cBcysuf/zAMylg0zjumyK/
         6TxUdVTTnid71YkpKnNok9KOBBdG3JFVgXUlMY5dvOiIlz19b7y32kvFKzjWkJPUTGP8
         YfMKJUWeVJbfqGheCeBqAzqcXNouLWOO6n27hONItt6x47H1CyHZwuSZApiYMzfPoci/
         cLKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ky02HNQUxnzcH3ZOmOD1d1U3tPOWykH9TZyLPXW3Yiw8LdPq9oVgAY4oLxmUFgs2Ppn/0i7NXoXfd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4aoOq2vRjDCxyxzHuwNaeoTQ52eAmHDmgFF/FwVeUapKQJQPS
	hgr5g7wpp2CtjzilIYRCDMOjXvh/6fGxvUfjrBrHI4XHpIW3PqKylNn4HPm1qy5w8Mazlc/k1ES
	c4BuCrxZrs+iWZJL4AwaDo9im88DuYT3z7JIgiCaez+ABrczpm5X2gnjzI8MZ9BO+ulZt12UK
X-Gm-Gg: AeBDiesQzOB6lIwSSXX+Bi5NBIcjYF0lafjF0uMbgT8f2x2BuenQZRUfrsPTfBq7RHo
	xCO95m/mm1mX5GDu9rs3gO3rXgf5UeXX8GehXE0X4srYxA73qQ0ozye02gUs5cN1vVg470OTlUx
	tj5cQEZQgnjCszMvRxwb+Mz+lP9jCqkmNHPRmCqOcCE4+QPFRwo/7OYKegV9+yyfF3/IhYBCUt9
	B5CaHbNfOh3fRWs8WE3Bj29W1MgVj159ht+3uGNmU6/xD9O0wtoNKRw4waTOyrEpDIB9zW53Ghj
	GlnkfBvTx8+jYTpKggmzWBQ3icgik8ZFiv3fvcdTae95b0/3gy9Unvs+ve9SL7dsrWrh3Sq8MnH
	NBvXjZvznZzBuQSEq9uOXfmWVB3oD1Rb9h1tcU8QU54YSAo22zOeuGaS3oMXop2W0ltlK7Umanr
	lFDy3/rpZegF2TcA==
X-Received: by 2002:a05:6214:4111:b0:8ac:b4d5:50f0 with SMTP id 6a1803df08f44-8ae6a94537emr18051556d6.7.1776246613553;
        Wed, 15 Apr 2026 02:50:13 -0700 (PDT)
X-Received: by 2002:a05:6214:4111:b0:8ac:b4d5:50f0 with SMTP id 6a1803df08f44-8ae6a94537emr18051336d6.7.1776246613036;
        Wed, 15 Apr 2026 02:50:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba173d5d698sm40176566b.25.2026.04.15.02.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:50:12 -0700 (PDT)
Message-ID: <455942ab-a55e-48cd-a37b-6ab9efde84f4@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:50:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sdm630: set adsp compute-cbs' regs
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-2-03b475b29554@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-2-03b475b29554@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e3p7WSPS9lhSPODiURNRGLBwRasdx1VI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA5MCBTYWx0ZWRfX32q0o5nk7jHG
 5M0s8SaBxQD1mIkaJsVKfRsY+GTuXQR7xIS0pMKTFp84oC1iR7CyKWFqh3zoalOxIJInmDEf9Xi
 qj+LdA35rIYMm5IvMXhhg4992x34+MftL0ReEZ8aWJlx+3aLiDZwG6vOER5waHN2SLXG+mYOlfu
 c9qyJdiVPPdNslVwHoKjDY0BZ8cGxPOmiVewLkZplMcJGHfLt/LE3f3p9INEeL2OpZzPl/oA6Sw
 ojHk0+6Jmdxu1kPpRRrgle83Z0aU8L6AWzlH58D9kqrIBK5UVJbbgeglzOYYn6GALUvs7Rw49/h
 TynEsj9fgsHKd6fDUt5XZQ5ZKBJ55KhDkYjyv8FIz884GE/00IyFmex0som/qrbdHvFGsHamXUy
 YLHWcUZnTZFT1p8TjjIatOsUU5EHZlugJ/vTRb0y4cHJfdSPC+luwiloRvZQrPftQdOBpn7kcj1
 dj1QPiOiE3hh9PLVYmA==
X-Proofpoint-ORIG-GUID: e3p7WSPS9lhSPODiURNRGLBwRasdx1VI
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df5f56 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=G6eyCl79rmFccwun_h4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150090

On 4/15/26 11:40 AM, Nickolay Goppen wrote:
> Changing FastRPC compute-cbs' reg values to matching iommu streams
> solves SMMU translation errors when trying to use FastRPC on ADSP
> so change FastRPC compute-cbs' reg values that way
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---

Fixes: af2ce7296643 ("arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
