Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2503DEACC
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781776269; cv=none; b=iQRzUeJ+1FIRm3Rh/ngk6uYmakYIkNx0myHxxvoa6j024oe983ENl97tt+7dc16hqasWFPBTyR0PWYIXWwTVelIW43aRYi6q/ILpxjrQLWu+ASAODDSgbfAfqH+dO/tuzxK/VE59qhfO0aFYGhvLi+cDKCVYk1l0YeDVa7xO6Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781776269; c=relaxed/simple;
	bh=n7aFmX4/1s6Ei4IuOvpaWZG9MO8OsZDWkfEpJqW9tFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g7710moWuzYzz880FmRM9vdmExHx8AMJZ/Y01U/998OSpWLUCjRCp+AZb0gfUw61PxOJ/yN3pT5KiMOR/eK3cQs62+ACvrBQi+9Oe/bJ6MCP53Ub1TfTtgDh3pY1xsqPFE4pTq/Up/TEyOISJbFAqeHckG8+C/C2VKOliRsb2J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SckUFbyZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGn9IMvx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SckUFbyZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGn9IMvx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I9ZpS31426103
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Et8K+Pj2aNhPpY3BZlq7Uqti3tCe7JP92yJOXp9p20=; b=SckUFbyZkW2RP6LC
	LLgvUtayBeS0pKwOxgz8WYdG1LDWVytl9iA3gqtDwkt907gEHMiiNQASaP9zqROb
	3cLW/YczFaQWOlC9KBYdafnaLXAEIQeVAqUv7ahb1HibgCOxdOwA/awJedrkkut7
	aFqTTxknRF5lQAtPswDn+WlVUj88O5e8/JKCzXdtrqd/JcPSfNFE2pyAJzbGzaIH
	siXhpfaVo7CSkBNU4P4RbeH40Y5PMIlaAlfxL2temYd4Ev0sGPt6n+FSaRECTbk9
	Rys9thL78hbTyK6trYwW6bA3FORif7d3bM09AY3pmdPhYySIUOokXaDir21zvXbq
	KaFXYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2juywn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:51:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915ccc2d4d2so22317685a.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 02:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781776266; x=1782381066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Et8K+Pj2aNhPpY3BZlq7Uqti3tCe7JP92yJOXp9p20=;
        b=bGn9IMvxNMCQpbvXEl62ecwTfkYpIvf8gyIxl+U+GGpePNOCL/VUYk7gYWcpgAFBHj
         UDD6DjCh1xOHvidAZHm0Q0v0fk16hFlBoOSo0ZLwgQB0eO7QsJ33WQZR+V6TmGlI6n32
         +ieLpxIq8JBX+Rg2OZO9JemjhFq7qxzmdhdDLYOGY3canAfeQcy5t62CacetNH0NDUHf
         9PCbAnR1XVAgOc07ZwGuAynDupNIbgyi1OASomWF0nZ7k8aB0pfPVyTDWexNmr4FUszR
         rf0Fp4q6tsU7+n11HKHsP0ps0flwQNtqnA/0g95wCMWV5tOk7UU6imDAn8OzbNWqWXRD
         crAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781776266; x=1782381066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Et8K+Pj2aNhPpY3BZlq7Uqti3tCe7JP92yJOXp9p20=;
        b=iK1nTzl3y4+xaa4kLd5X2A0Q8vsZvEDn27mvbnkyafZr9E+Et+KbAaqE3Ra0XeX47n
         Ai7I6tZyTbFQs22QDGX2JmPFo0QTujUXpjQWDrFCZI9fGwkLrqQGxMOEUevETTzAwJbQ
         gC+RaV8C86/PHFywCDZDwyfXDNrGQr6dQUw8CIN3vae/TmJY/oyoFjnq4HQfzbo00Vq+
         Bj7VqLPpgjCdmjnA/ayfsKSDLIKsC5jI+jAebK1rtlBlkHFOAetMVitw3I+W7f7wEk9Q
         lfMFEQISWsdQ9LCXYddDkCcByFmDuD4wG0OgPP7ZZu5A5XeDUeybns4JE9BXwuQUAUNt
         G06w==
X-Forwarded-Encrypted: i=1; AFNElJ/zzWZtJmhPjJsYOf2SaGF4wTsjHihfbPpX6UoOPd2rh7vBypggSI1HWvaXaNLnA6c/L6jW4gJn++iU@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw7VLbLg7idCuyBrzMsZu9dFXRwVU4lBSpFjOkeOiRQ0bSY4YK
	1jfurpIt4sYjkcvNLAXpc5EE5eDTjotcKpuVQlwZtBOAGuffTB5NYLlvEPv+hXwdkJTVFsjjtu9
	Q67HkrxzmtsLlKnYcXnmXSh3LHqQcrTfGNK0MPw1DJAGtnQmyImdlMrEC2MA78qXSnp5f+rlu
X-Gm-Gg: Acq92OFJvmBkl2yqZpgdfcW0wD/pMGNZV5LBFhaRycYPW/aQldYNln6W9b4/2AUqvGz
	B0VyPe4q2FVx34rC1dU+RFCZgo7cEOmjo7wVDOd12ErETGjbY0GNb458HtfdxUh5vHMTGGmj77z
	ydqV/sz7JNJKDMRZSK8cpb1LQ3UhSzqYtAofcsJnb8PWMKeo38m5H1b9j5FvJvTN60s/Nw/wQ8o
	e5hnMviNN38tyhWvEG3p6BnNzc9RKen5HJcN0asMhZiT9tWfv2OUpebcOmzxWIpSlfhZl4ABCFL
	lKwAA9s5XmgXcbVIuxVmXmizulefaj8RayvyqeDiy4jZOYEGv28mXfBpMS+NPqLSMDgfE6Yd3ci
	1YCq7PpcWMKDdFFnurf+MLGYXoa0OAEeNXsE=
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr281933385a.0.1781776266487;
        Thu, 18 Jun 2026 02:51:06 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr281931285a.0.1781776266089;
        Thu, 18 Jun 2026 02:51:06 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c01ee8286c9sm630453166b.5.2026.06.18.02.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:51:05 -0700 (PDT)
Message-ID: <9ab808a1-9db6-4294-b7f5-365d71cbaa34@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 11:51:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add passive polling-delay for
 gpu-thermal zone
To: haritha.k@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        gaurav.kohli@oss.qualcomm.com
References: <20260505-qcs615_gpu_cooling-v2-1-1ba42260b29d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-qcs615_gpu_cooling-v2-1-1ba42260b29d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5MSBTYWx0ZWRfX0UUd3JJYnpOW
 O8XsdF+7xwRwR0P35Y9ZebHl2uQ//OYXQuLGS2WisQa4E5DywdDsCl/4DTZjlN0HKnhIxlDx+Fg
 dkrY/XVh2UdSm8/pWJTLev4mm+kteDxQalbpZ5G4+nNuScCJCsLcnmzSvL4MEB/ERsudy3iyWPL
 6930g+4Nyyug7mNNvqL0RMEZsddZN3QmQ8JphuK4kaPjGy3aQxQnLk0QBgF+uxH1480SoqJP0Qt
 QfChXxSxY7q1hBHGq+Q+4U7O2g2t/cvS9CyGmZHZBhU3te0txmAEis22Qnn3HEsGjopsvPDg98z
 KgH0Cm10i9Z6ieNLy9qmWzpFbevuOgDlE7upxFEclc8Pg95/XnibZ8Iblz6qRlqWEVP2gPirK1Q
 NZ5JsYXhr0BtRDebQKhyO/7unfTbNSXG01V393Ompsl8wTgNT3OGuR+GKJ267WSUygMl81I/Kpj
 sLpoky0PE936b7r99ZQ==
X-Authority-Analysis: v=2.4 cv=Fsg1OWrq c=1 sm=1 tr=0 ts=6a33bf8b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5C3irSmljBUfJ0kUePkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: H34e7XnzSsghlPqC8S2PeIMmxH6HA5Ta
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5MSBTYWx0ZWRfX8MnkgF2m/sKO
 T9R244za9cLIsbHnVx5D7CacoYUTG0VR09WyyvtgNJ/7M4UQNOWuT9nSOqaKsl+Tj6hhoG8dGr3
 VLT95QJFSkYB3+biyIA39uv4TPCR7mU=
X-Proofpoint-GUID: H34e7XnzSsghlPqC8S2PeIMmxH6HA5Ta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180091

On 5/5/26 1:26 PM, Haritha S K via B4 Relay wrote:
> From: Haritha S K <haritha.k@oss.qualcomm.com>
> 
> Introduce a passive polling delay to ensure more than one
> "passive" thermal point is considered when throttling the GPU
> thermal zone.
> 
> Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
