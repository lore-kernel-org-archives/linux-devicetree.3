Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C54B3D6CA3
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162642; cv=none; b=Hq7xS2f1NX500YnAhw6sBq+xDAtIq64ssEWXngPnggGXdwPN+2gPwbbD/vwR+YyQ93hKFkhnLMbgACrBIZomnPKL4luSOC+iaHTUInZ3TaeJ244RMhP6sYxBlXDam+SWUtLBsAkJ+AyQxbq3R1TH8vRfhWsr8auaRSv8100+/jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162642; c=relaxed/simple;
	bh=37knq3BarReMdHJGIwkVqi0G+bltRDwoTcZKP0HE8Qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZ/il9The2dlyUxZfpszYGKvi+Pp9B4XXUkB3Gr5S5P+P/v3yOXAAWXQh7tpyqkIgiWLh6wDck0EMDB/S6joOWHiWHvydm7Kkrlyp3e+0XfiFjCRuKzBoPeQ1GvzsU3npi6T9amFKddjw90BGu8xklvAEPkyQBxSHDPbglmSrLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bicN4g58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Odmk+Y74; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bicN4g58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Odmk+Y74"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6Rvdu1479049
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ap/nScOH8SyTtNz7MDWSz6sn+0rsjWhoxTX864ChwzI=; b=bicN4g58U6QbUH7I
	qbu5RHdwgpGEnCyZ3zVgIXLjx4Ttez9yppgluaPhtouPHDrFd5l5KHfsExTc/pfF
	uQQ5muezcwxxT/1uNoukEa9hDkv+13vecD2a6oUHRktpfZ2tB4/XPyu8SPfOzSQm
	O3UjPwDyYHCK8F1kzui8Z5MomIiZplzJBPY48orkMX6e89HQOpW/lY06ccVlan0q
	z6DRh3KvLQVDSzR9tS8GAmx5hCluA2CJhFA6l3ri7yCzRD08tL8pO56uJRg7NPAX
	VF2b6CRV4wcNmad0/x40v0U+ov25yhP72xnmadE3g0AdAaKA3sTE8pAXjL/FkxKr
	1rTTLQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87j2agn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:30:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50dec198720so8124381cf.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776162629; x=1776767429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ap/nScOH8SyTtNz7MDWSz6sn+0rsjWhoxTX864ChwzI=;
        b=Odmk+Y74pkPXQiHg1NpQU/AqiBc4tmlCIbh72d9XYl0tbKQwLIVMwCqUbK0C02yA61
         HJIAJMllcADAMzf0coqNSROzzYEHNxbAnav0KS27WKCtnM99FeyVkBdhQvN2Q4GGIxGD
         8zSsGRIi0Tob3ukMCyEgYEfSjvuy5OtEBkVmNzPNUm3FnEPPJvGtUlaQ/Ysu99iDLS7O
         MOkXJEagvZWgW5/SjQJgCpxOGOlbp3dWJ7FYrWHDHzocdpJx9TasOTfMcm1SWewAwVL7
         K80VXbC4bZtM1XHp3u3NX1wc5OLCrDeixm98Ni9qqbCLfdRwPcOJs+xRkd88RSAxvrOY
         aZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162629; x=1776767429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ap/nScOH8SyTtNz7MDWSz6sn+0rsjWhoxTX864ChwzI=;
        b=QXrfdS4XzwhJktty3UJOZIRAF4Me550vYTZQd5vAzEXgw2qT+AqPmzViuZKEuOb0yV
         IGnrkis1yOF4KDZKFwBdJDitHpokPjGxyv94790ma3WykG5hc50mhyEzlMCnq0URh3gP
         msRQm0SczYy71/5iAd+PfHqGQPc78yNrsvgJ1z2Z4dOc0lg3Uevrs2+S7kXrV6tIWmDY
         52+30KFRGfu6IaC6ATBnT6TxJCMAg3vSHpe4bUsIXqIAYsgKU3K8ty/spl0hoHV9W5bh
         vTplg2zIS1dTVLQd5gDKiFO+SmCdw1eI5Amv1Vm9acV//A7E/H1o2yqSdPZ5W/eoQDBn
         0JYA==
X-Forwarded-Encrypted: i=1; AFNElJ/yZb+TL5KzvpAQLlT4AqkdCiCLif6G3dE0hQwx5yFVNr5+v3+f3aV7EB17K7uQlOgJsEZfSjKBBr96@vger.kernel.org
X-Gm-Message-State: AOJu0YxysDHdMMjw0PGJEnh/v6bvNHg6ZX0G6e+vpaUXwi3Eoy6pX7Vv
	pfvrxx78neJB8k50Yhs/xh/8HWQUtfvM5s5avEw2+ND+XqkAre1z+Po8n1MmDeciXTEh6bCHZRq
	goWAnCPcC8dfe4K//dR10q+zFNkD2AjR4Epc9zz4yDXfA/yW5q6kNNrb4+GGTMfrd
X-Gm-Gg: AeBDietz1F2KIkohkmkAns462E+B2EWAZ4Asdln5sgDqSZWVDCgz3fCjCa/vVOPTWCJ
	fNDv6NxZKI6PsPFmgEAaaJdRakw3EEznmFNZ1++IA7e8uQMIBfDelt5jFuKJ6G7wqRhQrD9cp93
	kJsOjKkneNlzl0p/qIDSdWG84+Df22IfZtLWpQ4GMTMpdEwF/B7zxK1B0rcJhgfvqE3j/ag8lDW
	c2cSFhHAvVBZt6FghB4i7lha183S+LKfEj2pV3nEt31I3iE5Fq3czMWLwjsGaL5YPUzeVlsWiQg
	FO7iYxqXxtbX+8Bo6xnnLKDqW8Pbigew8mr062XoWqfUtDHd6WSEsv/oCCwTMBxZrmHsKsc6FNK
	SY2TeOAy5BHK9SpnLvXvRczig1bMvSnf57uieiXKk8qimWskGEfHPpWkV4P9ZQIGUHBdm2EzQmm
	lQLCY0eLlCDz8pSg==
X-Received: by 2002:ac8:5fd1:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50dd5a9118cmr187675601cf.1.1776162628854;
        Tue, 14 Apr 2026 03:30:28 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50dd5a9118cmr187675131cf.1.1776162628229;
        Tue, 14 Apr 2026 03:30:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6717eb70fdfsm1265526a12.20.2026.04.14.03.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:30:26 -0700 (PDT)
Message-ID: <aba25e15-176a-4df4-9d8f-e05d36d52c9e@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:30:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: monaco: Add iface clock and
 power domain for ice sdhc
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
 <20260409-ice_emmc_clock_addition-v2-2-90bbcc057361@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-ice_emmc_clock_addition-v2-2-90bbcc057361@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: v3DO1dvQ65rLMEZN2azGJdIq-suxZ7Co
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5OCBTYWx0ZWRfXyyEdBG67WKuZ
 J66ZFokpdlk6oxWTpaYV33zSVlXOnWYD0tr9CnB8itIk3Hvv82mWxgAnMGT8osRY4t9CNstdiFH
 WxrpaFAe5x0Bedaa9eq0BIqJJd8Oh/HK6uJwre4q0wekBt2nyiikTRLQAjllYIfSJGCwDV/2DRV
 EnGfweAD1aigurPoCYLhzU1a7QMSLBLzv/DgdXReU9oMXN5T0wOY3/p3O871ufbYeKEEFgndbj0
 tgN+1pGOkMf3U7+cNMU33Og2AlHOME3KinJPSPgVh0lrJVzkVpNf7YDYdCDjfpPKdtZS9TzRbOT
 voNaTkOlZ39AfX1ZSAL9WrlBAp1/+ECOPnD9nWXB1t/IngMQR+wXH90s7OA7TCohIAjlTUWK7Ka
 Tt4Cy7z8CySz3ck00t4gRbyZLEzgSsVls2VmS0pbISj6L1/DUZqkLkzB/Fm1cJ+//Ib5km8bSxs
 RPYCjeOjTgmcGH/KtBw==
X-Proofpoint-ORIG-GUID: v3DO1dvQ65rLMEZN2azGJdIq-suxZ7Co
X-Authority-Analysis: v=2.4 cv=DrpmPm/+ c=1 sm=1 tr=0 ts=69de1746 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=D6AGceYv9MrH0eYzXVsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140098

On 4/9/26 10:31 AM, Kuldeep Singh wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core'
> clock the 'iface' clock should also be turned on by the driver. This can
> only be done if power domain is enabled.
> 
> Specify both power domain and the iface clock.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
