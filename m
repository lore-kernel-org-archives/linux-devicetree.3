Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E40371041
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144185; cv=none; b=eCM2dJd8kEThfyBQRj/GLtqp7RGTngcc+UWPmunWtMRsRdYsoRcBqldIHuvJ6FkKDXmPxLKBwwtRb9I2bDVWG5sspta+7nytja6jsa2ppXqLorPyEHzyOVwqYfclPAH4/cE1hEb2+cOR0SCJRFLTDB9y/nJzEsDE8CFx7yVSQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144185; c=relaxed/simple;
	bh=sZ0YEEJM+nQC9l3aPVYzo33JA4V892pPBT/BXf8zA1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pV+qXq3oNfh3Va8TXhqf8VSqYp/4qvMKWhlLoxYMKiHklnCswiA2x0dQ3h+RQ6GEufZ071GghWLyz4ZNdwstWZKsXIB+CBYSWAJyBvsRlBbIJYTc1OYL+GN0tNWtng4OYsUJK37hCCuHVLi2DmQWjSp6Ic6pP8Bi4lxQe5NOU3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z8kwL6Sy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqfWtlNe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z8kwL6Sy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqfWtlNe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m0ZL2219270
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	56f64g6oLreLCUIowP41hw9zucQESMG8NygFkLofNIY=; b=Z8kwL6SyCsVD+soQ
	dLZ5g8n8IPDPJb/2xXKCcv0FSJCpiksMujS9qNAgdwMq58UXKG096D2g8n3zm2Q3
	agk3+qSCNj4nw7GDTIUg4bkDc1J1ty4RCQdkU7YdOfrEQjUE/1f5sRJnKO8IBuW9
	kvDllT6dkS+/bwoXMXFpLIRnMQdkVnwkXXS9OLQLPjuRUqNMS/YypUpymFTrr4qT
	zZIrUuuInxYomymOWImDyarCNrb89gXWZJfmqXx9KHv+9kzI1WA4dtnRGk6L3wm3
	GtTFBFNDwx5IUTi+iJI/2hLit96ec6wFNRjErIeGlGWTAG3v6SEqLutlZYPRYgnr
	3IsXAA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m3umu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:49:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5356c6d98cbso17106401cf.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792144180; x=1792748980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56f64g6oLreLCUIowP41hw9zucQESMG8NygFkLofNIY=;
        b=jqfWtlNertLx8O3w6Yu/V/ruKU4axKgy5bClzIn91gBi6UE9Xbin+4wNw+vxvU4dOM
         5KvqUIvs6CP+xj9xlMjRgmhmOMoELgeg1CTtUpjyrGCOmj4om62c/+4zZFicHQtJRI0e
         BINwHaDt5c4XdmkKg9WY83J7CbyW/wPiUwt6MQVY9c1O4zt0wxqvm5zdGnjC4CR/ZJtE
         qH9XZ3Q4H4E+U05jo1SN5hrPBnlToxA8cbOVkTZJ18ZiyYLX1R2CkYocI3zPfgcpSS2c
         J2QYCMtfh+BNWtDVtF1riOoksS35WYy0VMLi25s7OMnBRn/1kz18RTALh38U3FhG/f6A
         GaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144180; x=1792748980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56f64g6oLreLCUIowP41hw9zucQESMG8NygFkLofNIY=;
        b=ongCPV9DoToUrKbedHbKsNudL5yh5bwSr1HOPMT5WZPcDtaq35yRMa4++ehVoIXiMu
         L856Xr7F1MqFxs+DRtpH8oaiV+LifsnexObiEsDil70Nd1gNuvJbPWwcFkqm3y3ucvOG
         si6EnSFj/rQbrH/DJ/daVlVQB+tG5r4FtFSTkJ2Mqh+DUwzVagSK4crZgWNF0hwBzETt
         mrVplMsFEX4rzeQ8lfluDPqmEnuG11leoo+pAk9j6He/y7NABktRnx2Xqb7UYuY4jvFi
         qfirOhBIFH6ITwrXG3GeWc+F4D5XjZNUCTr+MLMZqnFh7ohMyEAdgrrbBCNq4q1uOKI+
         4m8g==
X-Forwarded-Encrypted: i=1; AKwUvByl7fLpXx2FZmrE2Cn5pp3pI4Z2QR1N9HtD262JqoVp9glWkzJR1ZvMQICkjPUVO+OfagVMJqw5prJc@vger.kernel.org
X-Gm-Message-State: AFq9FYJFhZPUZFAIaJKA5iWahPdUy0+229Pkb8Oy0PpdCcSgEjAdguZy
	7PhpY46Rra9jKAg7mQBAH9O9rgBycpZuep/9JyZFkbdp/uyKQO91rep20fXcKWObvD4W2VPGUna
	7yCwUEb/XRKUBan3FP/rlQvxks7blY/X6UrTaeYlkUfU+m+lr/DgHZI9Ts6hgDpcn
X-Gm-Gg: AYBFou2IWyK/0CIBFfuHgoovnZkAmI1TYjKDfZk7Qlz/HXN6b8NnIA5kqmajyYfprgF
	NleNjWksjHM9x4K/wccA1lxGPBbVrky8aPuJlk+OI0Q/zp0Lfzm3/snHQ4wff7Mc8YiIlKNwJCh
	OEPSz7rjEGU2vUu8k4q85xwROJ+FJzM6Jn1uASKwAzHgFZBOhYHodVX814JPPaeL5DBygvUQP/m
	aUx6YUYhD88TjsCdZlnCxeRBQCXhn+e1ZMngwGOTG7JXrejhfoBe/GMDyi3JP2gh8GAr9PmIqke
	aDNW+kkD1odM5u1oVgxmeTltLDqz6bhuiqCo/Fg975/8qzMHZXVMtXe3JvBtsY2vpbdX2xZD6AJ
	GMY+p0ARqIht8KSwU0qxZ9w==
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr4276517485a.5.1792144180515;
        Fri, 16 Oct 2026 02:49:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr4276515285a.5.1792144180098;
        Fri, 16 Oct 2026 02:49:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d6280sm690572a12.24.2026.10.16.02.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:49:38 -0700 (PDT)
Message-ID: <734a6666-e420-45ca-ab5b-f00a0a7aacfe@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:49:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: arduino-imola: add support for sound
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260930124607.1109167-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930124607.1109167-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1f335 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=iMdRMZ7CqAKYY1MXlagA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gYNSBSGse_R-iOTKol_Ejmgjj15Qc1Wc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX7ugEUjqDOY+Q
 6NVgmQ/oXDfCF8ERXVB3wUObk39UPPLtK4B5OI3EVN9P0oWi0XHC+Ca0ASm+k5j4iAterm8PkKy
 hAsEg1Bn7CyjxIUixIpiRvrp6a5IBQU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX+NqKxhkdaTgu
 HCBI9GKgkKHEE55Wca+Qx3qU45SKCv76Mu/jlBxSER+nP7II6+A516zdY8unu6uKbrFUlwKfpuK
 E1W9GKuCHHoL1eAyat3p0+eOlwv2CsR7cold8HAv/pBc4+dCtc5Xzpwfryl9Whi+l6yj9hJSZoq
 ijoAWZWnhSVie5DrPZGvX1YtV4P22aRhbloyHMK9mGku5Hfr7mJ+kWGFQq9EP61BcgSEVLb4X9o
 y27jlU2L0iYBcD0Q8fYMC0EFwBxqeJ+t5eUyMljCYBnXyKbIdW5ne4s0G46bzHGdaLVFgBvv4Wy
 FnwDWe2EmIFcKo19UjyimK6xMnQedUSylQtK5UL1BNv8/VOED+gFwlOeKLaZNUIq0WJpW58DPqH
 ZvlJocT6Vml63Lx9NYM2C328X8pY907puzGqVFZiKBxorVDXyPBQqWc0DfYBFtzemTCuo7jSz+8
 XLVrH1JgTGkNFF9rt1w==
X-Proofpoint-GUID: gYNSBSGse_R-iOTKol_Ejmgjj15Qc1Wc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160039

On 9/30/26 2:46 PM, Srinivas Kandagatla wrote:
> Add support for sound on Arduino UNO Q board, which includes
> - Headset playback and record.
> - Lineout
> - Ear Out
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
