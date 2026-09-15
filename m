Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A7D47FB1A
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466265; cv=none; b=Ag3ZU8C8QXwQkufXTWmyocN0S9cvVMGUVnS6/Nl6UEv0o2xgvElsDMcpsWmvm231aMukF5+tKlv6WocNSAeVDI2Jg3wgEp1he8kHNkxPooZuBcOKeorx0smbTgVORspJk1YcNDjiOQIWgpFG5t5jr7bC/i92votebiZZ/vzLF4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466265; c=relaxed/simple;
	bh=V/hzdH2QkH3VAqZiBtIzZeWx577pOOceqTjQ9JXOVaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tENoOFLizHhEdht/F0JCSlo6ooIuSNZ7N+c1vkLjv0qjJRojayzBGkLHFanuCDq7eFBRosAWOGVypVkbsyVq+ojOups8wgu5SnFpPHXscSMjIMNeMKmD3FDUJQFbQPnEFk9gorcy11siMPTvosjStBn06WCUYG2HkqpBHcb0vYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2JYTq7t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLjjAFNm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2JYTq7t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLjjAFNm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h8XO2086809
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vHivB0Etmchj894r1qph40xT
	L7+4vfphDOHMRIbg5ac=; b=W2JYTq7tU/pjhrI/JNfOkqi7Z0iHotWtnxjjGKSy
	zhRFM7EvImD6HWCVv7sOG2AG3/Mo1TcbchrM2rbOA90KtE7OwDF0miG2euSHvGi4
	m49goRS3yR/8csREpKa093CtESrgDFhTR42mcpAa11J/bkjwRB9Ab3p67L6ovma8
	dYuPrDNyK4ogokfm50bCTR4VygnQG7XWxOfe4eyfnllJeck1bNhI4eF6TYVRH1Iq
	PoHIgy9MMqZ/109bJpNxlDVwuB5mhJgVCgOULiV1mmpkZXqgLPQF66gSbe7uJz3J
	emwTgKbNCzNzi+XCxHG/oMucb2Tr0oXuXT+uw4eUNExugg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp8q1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:57:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936e393061dso688622985a.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466262; x=1790071062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vHivB0Etmchj894r1qph40xTL7+4vfphDOHMRIbg5ac=;
        b=iLjjAFNmXz8xu/ggwuL9VQlpugp86hANlu+HRQjCZ85mz2UyYbJT1NkTGZNGOlgeu5
         g6tWxfekjNqJe2gqR92Az2tNcAZw+FW4Y5kbIz/pJ+rSe22MCCJIUyyVIVCt9r4Vat3K
         MFlago5GN4AOkkfO/h+voHADxYsx0LM4NHwIRhIta2AELg7sgj7Ygg3a2XW1t7Ay61+H
         WpqBVF0s+doX0EsgQhE/JOQPNLwVP7I28Al6DWcNIaFueigxCBQ95UyeiSfSOsf9LPVT
         4K5OJW0V0+nDetg25itgo4KRbg49VO2fmhq6c0pEbVk0xN8NyDF0FhDLRjt1CnklQd+9
         R+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466262; x=1790071062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHivB0Etmchj894r1qph40xTL7+4vfphDOHMRIbg5ac=;
        b=KHWU+yG0/POVv9z7xaEPN7nnCon3rAXAv1VKLnK4jCrYCxOuSER3FliucZvhKWeFZy
         rqqtlZuW5o8AvVR+2MENeOSVCiT1rDlpvpgcd1fy947xqXTMLazucQj+qrIxWv0fIIls
         qVOeL+Yj5hTqPjRgvlq/zJkUtJDNn3j3do5Lt4E+Y3QNYSBR558oQBL6wGSv82bDtd5l
         YaLBRPJ1NZgNj+nxvK+7rUWPd+hjLu+TcrK7a1/8GUgGjmAYZGANR0//JEQqWSjwzNhX
         0kp3XCJKomBQGNgoDdv5y4wFhUBxHOYZfkUd853sWPUR8dRftHIIB9p6WDxbmqyWtwhi
         +bYw==
X-Forwarded-Encrypted: i=1; AKwUvBwfwoNoSAAPCqx17DrYjb5C4ZQtlVIOEVBAN//puDDjUxDRyoUTRy/+3rACrQa19gnR61Y5iupJ/d30@vger.kernel.org
X-Gm-Message-State: AFuF++m4L+mVLYRvss28d67nfgjSMwcQ1Yy5GiK1NSbIwa2K+Qqs9rd0
	ziEEY+8kUJtcbi5+T4eNBF8EfSxMXffoTIO2Wg84AQltXSQJovSwzDd2dz181r7tjEpTzziNbEE
	Pb0P9+jzEVESLZNBTh7h0Bc9n1ZL1TnzZ3p+JhMQz+ET/yjK0D5k6STrUkyXkrJH/
X-Gm-Gg: AYBFou2Xh4RP4bz2EA4LJSceWTmjnS46WW9/gOzI9XW334BX6M6lpa6jULeqLl2wAHc
	dPHxsnpXXQDZ75EcUOdSze1jQp6AeeEM2O90rBZ9TYCKXCrgcQZZ/q3q0fzsLvEjT+9g1BS/BQC
	Z5umSDD6DzgjW0md6JVL7vBQhXvaSriFy+iWtJ3ZhYHBUfG4nDJ481FtFPqe/OCv1PLThpcQemb
	XMeR9XY4BOau1BjrrOaNwIar4sHCRYnDUEliRGMicFI3rCSdpnDfimJp8JlD8MP969alCZAugFt
	K9ltiYZE1GuyepzCZ0rsV9A1BCdx8d6oCorFje5E3KE2ok5vJbN0XnwjaSgzBPUstse2opbmcPo
	5KDw3gBGRsiaqcQ==
X-Received: by 2002:a05:620a:258b:b0:939:e5a3:10dd with SMTP id af79cd13be357-93a297cac1dmr896733185a.2.1789466262036;
        Tue, 15 Sep 2026 02:57:42 -0700 (PDT)
X-Received: by 2002:a05:620a:258b:b0:939:e5a3:10dd with SMTP id af79cd13be357-93a297cac1dmr896729885a.2.1789466261445;
        Tue, 15 Sep 2026 02:57:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bd1esm33238115f8f.31.2026.09.15.02.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:57:40 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:57:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: purwa-iot-evk: use on-board
 crystal for PS8830 retimers
Message-ID: <aczv4t7v6rk2cersl44iadrzvbnhyn5aebwn7jcjvo263au62w@2yccbdq4enpr>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
 <20260914101233.981643-2-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914101233.981643-2-xin.liu@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX1rLX/V+UV4jz
 gTqsp5HFKvS/t30GqI8kVoz1/UMiQ7b4+9OX040tiDRf72WV7A8YkUXZ5PDSogaBN9/ro7azQwO
 6Coe4o2UCvhkA/EMwN8MJ20pnJxkzT4=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa91697 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=D9jnvxXfBeoGJ7MCLz4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: kmBdGtYmfLWAizp590oPBLE4rOV4gUJa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX+JeJRCP2Pyt0
 b0y8lj5aqrV6wasfppkxVpBTNcTPSm46m2OGWslnsXCa+rZJkODuL7XxLVvSs1mG+t8DzmJfj+x
 LGPVJ40N1WzMMCB2yFMONGRkGn7s3pg2KBwkp8bVGDeVt7YLF4As2liKUIG1pPv6ArSHWfxBcnF
 PNGESjCD0OM9+2ZTVRq/2vd5UVGaCUNshn2LGvgo2rdX64z3BvoOZ4Vrvq3ZaqEXtoYZAWlzj8w
 8GL6WIbCdqrgaLuWf9OJiDX7y8sEns5MdkZAn47PSP3HAmCe9cIG4unTClqW27uLBVQnll1MYuu
 ChMMNIp4vlqU4/TRqEdVC/bwMJNGtswbi4CzlpjaHtdnRX73oQaM8yKjw4JCDq1ghneB6YMbrDJ
 kWsBzwCuR/85LJeeCSJogm0CTvD5VH2BcLOH2Tvcq1+X9pyc8VnWmbpukF+UyQWolKzs2UZZdg4
 VK2iOT0WRusXkih6QhQ==
X-Proofpoint-GUID: kmBdGtYmfLWAizp590oPBLE4rOV4gUJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150142

On 26-09-14 03:12:28, Xin Liu wrote:
> On the Purwa IoT EVK, each PS8830 retimer has its own 25 MHz crystal
> wired to the retimer's XI/XO pins. The reference clock does not come
> from the PMIC, so the RPMH_RF_CLK4/5 references in the retimer nodes
> are wrong: they keep those RF clocks enabled for nothing and describe a
> connection that does not exist on the board.
> 
> Remove the stale "Left unused" annotation from the vreg_rtmr0 regulators
> as the retimer is actively used.
> 
> Fixes: 9ed20e877239 ("arm64: dts: qcom: Add base PURWA-IOT-EVK board")
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
