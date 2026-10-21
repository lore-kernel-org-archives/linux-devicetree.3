Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572332;
	b=sWRPdQiL2+pxOGQcFitrlCHLFpm47kATGE20PmRIzNvmeePYwbKl+5ahpngAa+dkxZ7T
	 nuNeFOisPSxJECQC/Q7g8Z6E1uoCjEhA9LPKHAKsnxgF+W9Mhvbv5rAdjH/APRX1URLWO
	 VURehLENc+E9unRakos6b+wTsEkR13f8cWZUXZx98HkwXZPqDmBs6GVfwTz7KbsWJOtzV
	 /sWLBFYNSgC95GQdGflaxvlD/ZTo/aNLaqJuPdSgjSLN5D98RfRHIKPDW4u57rN0n2Prb
	 JAHL9qc2OPewO6/1Hwt3faY4GFPFrmOHBls2OZ6qCYKYWYi9+FgALOaHsXNRJLUh35g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/L2H1lepN+Or++0TSx4iDmyDAjYluQVvW80vZis8J4c=;
	b=PaFPeItiRxw6oKKNg0r/6/MY8Bj31JvjcUmNspLFK2Ddnt8E2cli7J4nDXQHmVrzBRms
	 JxOW7IItNpHeQeBiYRvBIBPWkyLNWzsaQ6Uvbfjw357sJmO+gsF/KkLToZ46OS31xFOTD
	 Vr+peQAkjG9NGGhkQfapWLXojsmRZmj1dImbcDUzcfNcl3bwb9seXKBkiDgQAf/xfottx
	 SoYiRhO6/pA6ZRs569Cla7qSFI64xFTIhJ0vjq+CTfJjua+LzqTyHLhgt10667vISWUyV
	 MAC2jREUGyqdo3m5krCdXeUqD/hqyCZAp72pNpYXFHrZ+19xPSrNHjOFEPI3MGpvj5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EthEb8nU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZoAEtA5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB335606A321
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB335606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EthEb8nU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XZoAEtA5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jJC32848231
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/L2H1lepN+Or++0TSx4iDmyDAjYluQVvW80vZis8J4c=; b=EthEb8nUYtdG+GyY
	p5JwIaqB1vcxR0MDVovpnpyMxONuJ4ZHG08WVxoSSDhpRj+KpaTSVbN2mWNa/4nL
	7ct40Sn0ZYs8Zuk7CWtHcCpE16wbYenupEcuoKP7WJNSDLu/HUj6SZ2rd3f2LiPD
	xvfSaH3Av3eY4H7SgOJDWPNssbsQcp4jRK+HqVxAC3m1Fw458b30KFiGC1gr0mqa
	J0EH145lExaJBfa6XLOuGThKyfqJZTG4yfQ/QNLa343VOMfX3emx3z4nE78Z8S9H
	88O8+ejXsypEC3tg1Q2hcWwpVSRxDxQohEefz6JCnOf0iGlrRdLbd4+wR1mDQsqI
	nFC8tA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9astq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:45:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3960dca5so16095985a.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572330; x=1793177130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L2H1lepN+Or++0TSx4iDmyDAjYluQVvW80vZis8J4c=;
        b=XZoAEtA5+SSc7uWEPnJSZ9bn54TDFTYfTZ18AKDtIPBb3+FD7+483UBiSzQF9LW1zU
         mC4O8cKQH598793zsWIxX8RYa4USGbvTK9eIudqpSpLFlyetSK1ONlJhFCuJMPzJizIU
         d8J3KRrQ6MuJA5B0sIDl7M4TkBByVj3HXzOsQRvWtR5BBMSFwKhnVbKMtQzGNVfCOytx
         XUVDoCnMBB/Uyin33LhFVJh+LAsU75qKGS5haNReJEIgBFEC3VbOwPy6RBCGnkhNrldZ
         cxhETrtJKSW1qYoNXqTvpU0TkAuDZibTriQC+SAwxCt1q1SJePGGxWlQVoiSqnt7NnRq
         gFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572330; x=1793177130;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/L2H1lepN+Or++0TSx4iDmyDAjYluQVvW80vZis8J4c=;
        b=lR4rpLm9Pzqyy5lLoljFz/d1V4tMBQI5X5PX0kwCIYyqkZTQn+A263L1r041WzK0fF
         Lsk3+lr5/OR0e9fI0S5wvTMGwnEPLAVUQrK5wiUMBJSdzCr5kWWIJ1KRiWi7Bvuya4O+
         MO/46ZaNLzU2OSPW6wMsxQZ2a9LRpkbbYMHsZLW6r8QYRX4V9hcjX+msxOJWwydsdsNR
         lDt8RdHOF5IFYjiG0WVMc3gvQUPiCLKsHk43Bi5KSJCu852jEkmFuwWgv7levPtWdUJs
         4d38pOzBDCu0aD9UEGCVfeI31srQWGRwTyImpG4bCCWkDkJngVFe5iyDB/nlbIX8Jr2d
         9XFg==
X-Forwarded-Encrypted: i=1; AKwUvBwokPCcbbB8lzzllAPV4O6w0uZT87jY7D54kZHHdlpJzh5dU57tsu6yOYs6Sn+T5tOJ+VGaqe3bH8Dx@vger.kernel.org
X-Gm-Message-State: AFq9FYK89u7Ld+g2EiSznAJV/5YMoXoX1pRMm5lUndLasGgS/hHGyz7+
	lC/akAjDl03E1kYeNLfyMP7311WVOPYKbfqS+MMLCRqo9rK932RvfyKr60xpj5YB62c3A0PpdyV
	CI3w4rF6QIktU2aHOjOTV/bSAyHWGylDktwQ5W9rZyUqZFm9THfKBPSXFj+pP4Ii0
X-Gm-Gg: AYBFou3htyHoFDVycNFpLlXJgh+qIBb73zkBF84LI3X6eGcVNaJmSMvWPtBDyv0PpoQ
	StBAWqHU+CRXC7Slr6q4y7QPZBN/Iccuv/7OUaUcocOqkDAmyU/2XHlan+J4xlAeXDeJFjH6xu6
	+AB272q1iuC7UwlOWwtbNLTXr0QPGuFf7y/QVoJF1rqCi9/4SJOEXJ4+YSxrL9U8G4uQWvBdlTO
	Glnl9z+jhvhkZu7wkjHqPFOCCrtt6mBi85CYV1NkwTQBDEShpDZ1zg3WA7XmYenn0tLYvRuWJhr
	8rlEugDmpXpWr0uVJPhphFFRnmiw/0hrvdBFrQDG/Yv2CNmx9ByPT0S9AeTRg3QfF/AL32vVsye
	XI1pZ1eV3+Z68P5tkpSpz5Q==
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr337844485a.3.1792572329847;
        Wed, 21 Oct 2026 01:45:29 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr337842885a.3.1792572329524;
        Wed, 21 Oct 2026 01:45:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40315a59esm601649a12.32.2026.10.21.01.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:45:28 -0700 (PDT)
Message-ID: <fb6a7e59-5265-4eb5-9d41-504ded38454e@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:45:26 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sdm845-sony-tama: Enable UFS host
 controller and PHY
To: Shujath Mohd <shujath@outlook.in>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        angelogioacchino.delregno@somainline.org, martin.botka@somainline.org,
        linux-kernel@vger.kernel.org
References: <PUZPR01MB514158F5EDA660AC85FA8D5BC3BB2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
 <TYSPR01MB6204401DDDDB12AC906BB9F7C3982@TYSPR01MB6204.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <TYSPR01MB6204401DDDDB12AC906BB9F7C3982@TYSPR01MB6204.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX5iRQDZ6S9/ah
 scdqQ3nhdoqhfP9RaVyLQXcANJnd6WFBEwsZLV/Uz3cl6LtGqbENXizP+5yaNeFjH1t7+kUr4cw
 4mwYhe+9IFW04Zi4PQD1XWd65KSGw+U=
X-Proofpoint-GUID: vNu28O0tzQ0vrHJiCsxxtLlOuUOtrqff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX0Ry6dS1PdgCU
 Tqw7qNTL7ccTf5RNRDHhUQXVwvpUgr25zbStJ7811YExUKohr7uQ/rj7xo06dmX5MwJ7DHMK3ju
 LB9pzEDYi6MunlHQ9B5qOf6PLGtuuU3b3AjJxc9yP4cvVFbZYoB3q1AsmUCUMLq1tAJOR9QFYve
 awWRFBpfgP0iECMEJbgTXkaqoqygx02PN8JmkEMYoWC8/7WCxqiVS4JbHynj0RRqOmDCp4P2S3/
 /F32MYH6IWY/F47IkKUCwrrNJxUxfNfYz/U/PwyHlWfzRh4knQz/UUzOfdM9bmzmg2ScOPYIi/D
 BgfBSr4f7v1TAFWmK5qdJDnwGCgXz4jfupSgBujQsMYlvBsS76RNFwUiqF1scS+2Y/dMm7RpOkT
 B513HSpxLErJWiDZK3khK526ilP03P47TMEQvYOnY4+PsKfBZdy75NvV1tplWaaJ8DFtZXM0YS8
 NesGLkoy07JPK5Hxe1w==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad87baa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CYTpYu_piMVnSvLoUqcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-ORIG-GUID: vNu28O0tzQ0vrHJiCsxxtLlOuUOtrqff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 10/19/26 9:50 AM, Shujath Mohd wrote:
> Hi,
> 
> I wanted to follow up on this patch and check if there are any
> comments or concerns.
> 
> The UFS host controller and PHY have been tested on the Xperia XZ2
> (Akari), XZ2 Compact (Apollo), and XZ3 (Akatsuki) across multiple
> reboots without observing any UFS data loss or corruption.
> 
> Please let me know if any changes are needed.
> 
> Thank you for your time and review.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
