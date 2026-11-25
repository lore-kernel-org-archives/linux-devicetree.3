Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601406;
	b=zJIfhcOrE1BRJdbAmRmLDV5NYKCnmCqReDTZs49W8CfO9iFW1ab7WEra7nf79DXIcs63
	 iD4xKXNZydlGoTjf1w2QL0O43D2IisPzP8TFwA9DpTq81As51ufvNjC8Dv1benZS/7+br
	 q3G2Ff85Q3xMgvM0GK6q2YSSy0Uid+3tF4li40HR+/0iRpMlVuMN7ocTvoeUimVVC1h+Z
	 p0aQk+PiGI9H9/naZRG2Vqyd1FMm8HDFXWcmgH9L2NGXAUMpoIoa4Jxxt1/r3oMRL4+SR
	 8MMS4hHWJpFco9oe3IPszbHk/Nt8QpcE21jmDVEYDgz5l/7EsdvpEaUrpR09hfwNKOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OU5JFLWRxxBLW3Js1yGWACITsN/nVqJUpunNXdZEfU8=;
	b=nlfkYApOtldPTQihCTyslCcV+IX8u/7bXaG+TmezSGcGmG1mBid2gzaz042PT2/MF5wM
	 ib514S9lPTpm0Xvn+Au8uZ3PoSSLZ8f12DDpJ8xpsavmLgJoO0G7297G6Y8aLFtpaKzWN
	 A/PruFTuAbvZS8m9uO9KTpjFB0pXhDigzvsW/iOeyURK85oBHBYK+6nWE0em8wbNik2JB
	 ZvscbXtafuKvBkqGf7g+y6OEd7vgICO8rgsg+eWi6sjv1XzeeEbsnBnx3XkOkrEMd3orN
	 A3wvIeRdAJIlQYZU8CpitjCxK4Dl4EFR37qefPqVc37BBdhuP+h1gsNjml2DKnYrlQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fS3u3tCB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eYA6fzND;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74170606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74170606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fS3u3tCB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eYA6fzND
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mQbE2121282
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OU5JFLWRxxBLW3Js1yGWACITsN/nVqJUpunNXdZEfU8=; b=fS3u3tCBem8GE1mO
	zsb3vErqGs0SV7AlWHyuOCHCcD//RX8nP58id7K2s+ehYJex/U31fFH7d0kHa62U
	KkLVxXfyvK0nhEDJbZuJfrbHb+iGfODDtRlj6/CqMCs+WpUxYGSnonHaxU9pSK9i
	BJFtS3uBtSiVZqvQhWtfQe8Cbe29XpIvISv7l5qzJBX8Ld1CCEhckqSJ01Qy76hB
	10OTWRG8ALtwpT9tR4f1mqyfU+bbtQAOlPtJJawtlp/4HFGtXq+ti+pQz2UhhNQk
	A/JDmRhSvSDqdOjO5VV3QWlEQJAf6MVnnWLoU+I6tKWOnk9RUq7b4LsVMXEoHaBt
	Xi3gsA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukr9hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:10:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso47946485a.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601404; x=1796206204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OU5JFLWRxxBLW3Js1yGWACITsN/nVqJUpunNXdZEfU8=;
        b=eYA6fzNDql5aG8aqCCn5HDL3XsqBuUxKFAnEAJ50I9A3B5qG2MyHGJLMhATOFvmgNI
         egsvidcUwNGHtWm5CaOpPZWYVv4BKEvu2wbYbgpzh9qY6VoqZhunGggnZHeUxRiWp8HC
         +JZ+mKsYkZHFj1tIpsjw36LhD0MGqb2+j1cPyhgXU0Uh5MKOVtbVxZG08AIJ2XJB7Le6
         /SqhVTTgXmoGLhNgwMcQzeRT9fSssOxOvXqtwXOSZw9UU2V27EkRntKUilOkR1fl715N
         bhBN3pPBjuOEQ1mZRSD894wKzt+Dji0gbmPgWvkSoSXx0gNk1g/T8ApeaMJZUQ2RJOWv
         TiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601404; x=1796206204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OU5JFLWRxxBLW3Js1yGWACITsN/nVqJUpunNXdZEfU8=;
        b=LDPb+tg2agQv8sgSF83pKKtPdgsGgAnvfxE2dqH27uBt0Qox26/bYzrGYG3JDWK3dw
         W7D34smIZe4chLvc9tXgi/SB+1AIwRB5ZppLS+YxSAg2spnglov+ru6cn4QqShrS40fQ
         VM4dHVBUW6mkR82xgYDhEK6et5HY6BwWgKLQnpFtrITqUyq4PF+ugJHnBtGEO4E7Kg4T
         +dkxbgbVegr8Ta48T6Efnd3sizydG9XijR3/UiYn//fL14sQplcYHg87hUtY5JG+bF8E
         Zz2A/QJqvnYf7cPY4rvGJzdeeXGaWL9fP0Ec3J5k379ysPJBBvscTp0/fMh+Aav+6TZi
         WLiA==
X-Forwarded-Encrypted: i=1; AL+hErHA9qmkCsEjlb7hUbjqi6jNEOH3EEmX+IPp1BeB70z4DsNEOhfoOqfMWY77OLO2gA0leXsbTrCYeazM@vger.kernel.org
X-Gm-Message-State: APuU4Z+xQeICCCUhcTqKhgyQAiTR3pfa6IxOR+JBgmdMWFHs6esRGRjn
	u0XqucroZ80zoi7MtJSs0i1jSdZRahQPXcuo0bqcuzVlRMV/TSyXd2ZHJ4/mkLYsTqAzLcrI00J
	L6uO6EuazwUySTE3he/CyVKrZI0hGXvYz8nt3v2bShm2UwAMjH9YvRbHfbLnHz8gG
X-Gm-Gg: AZFdTZeEb3SeidvvK0v3gmuKtYRY/Pl5YuxXQwqt/n1DdXBEoK/Wi/rcXEJFScD+Qbq
	H+J+QvPq0EqaVcsqzlemgspd+u85mIbg+PzZ/7fXngVkJS8Mq71NMHb2ZWe0FKpKq3Ma7VtThgE
	4YpIn3bbodZe0xsJlCDw0/+vSc83CJ70kV4fdYUFiapj4XRZT/WyTyPgo+Y7O0uPHtZYLn+WCn9
	gsC2981ZBI2Vsb4ri43xdg2JwCkwo+JgDMq2PDAT2M/tfJsLoFqIBHya27wGYaeYauFcToTR4lC
	sX7se+dMzuPaKo3jI6iBvuoCxVgwsYHhslUVdjafVWGRbuW/1WTMPniWQHFp1y3LtEivy7VXspz
	+ghWQcpDggoDF3OaGalrJ2xZZiF5kgS8H/TRe1jtjQtRSElA4hS8Uy/QFeJWQP6Ruv9G4Rv8=
X-Received: by 2002:a05:620a:8b8b:b0:949:5a32:af48 with SMTP id af79cd13be357-949ba96eaf6mr2467777785a.3.1795601403628;
        Wed, 25 Nov 2026 02:10:03 -0800 (PST)
X-Received: by 2002:a05:620a:8b8b:b0:949:5a32:af48 with SMTP id af79cd13be357-949ba96eaf6mr2467773485a.3.1795601403027;
        Wed, 25 Nov 2026 02:10:03 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb34386705sm167817a12.35.2026.11.25.02.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:10:02 -0800 (PST)
Message-ID: <3051b140-e9e6-4513-a400-d4d58be8be34@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:09:59 +0100
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
 <20261118-fix-tracenoc-probe-v1-4-0298dc5f05ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-4-0298dc5f05ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06b3fc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rNxy-IUp7fSqA_O6V1UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: gewAQznvTUgUqrBH-YxkonnT5IaplFB1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX5HsMq65r/Ofs
 td10BTe60gy+Ic54DjBmW941r+Em7GC3XBQ7Wek/ehVvhZus2j9d2Ys4lDXbuL51JT6YEHWQCrA
 LtsEyTU0VQVmBwkY7ntiXL+bftp61RI=
X-Proofpoint-GUID: gewAQznvTUgUqrBH-YxkonnT5IaplFB1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX4S8R0lw9yHo1
 eFHsfAu/0FsPH9KmG0Tt4Pg//nYEpFUQeVWeZAu0Mr7PIn2tMe0w/wcFlX467FVBx+sUI4Qzzvw
 wmrM9mUBUsSoivxRIrCzUUYBj9mxqMfy1sHZOYPcaWkprgirGfL0Pnbs3B+MfVxgG6msIIrtmkN
 yY8cj53cCGj+T52UXKnd1+myc+IJu0z7OwiTAKurjRI/jd05PmJ/6s7siU7O1foV/JlnRmaXagi
 T+D7hIToA0LBUMQ/eRgVNN7DsqOxvukguW0ay2PHrbCEvB5PKzf26UK5PplFIeNRa3Ys070ZgJ+
 TSi9H5VnElU+1dvSIFVOiQ7AXGeIIM+/SGX7S61kViJwrH5nH6Xy4tX2ku1Wx3uZD3xm+Tsadih
 eWgcavxt0aQu97Fn3Gqa07Nk6UEmbFnz9GsVOfOmhSjzfbSXGdCVMvhte0WV2TAfO/VgoMPqJr9
 TK8J2XAyp+jROyamOag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

On 11/18/26 8:01 AM, Jie Gan wrote:
> The traceNoC node is the system-level Aggregator TNOC, so it must own a
> valid ATID that tags the whole aggregation path. It was marked compatible
> with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
> an ATID. As a result the aggregator had no trace ID and could not tag the
> merged trace.
> 
> Switch the node to "qcom,coresight-tnoc", "arm,primecell" so it is
> described as the Aggregator TNOC it is and is assigned a system trace ID.
> Rename the node to "tn" and use the "apb_pclk" clock name as required by
> the Aggregator TNOC binding.
> 
> The Component ID returned by the hardware is 0x00000000 instead of a
> valid AMBA Component ID, which would make the AMBA probe fail, so also add
> the "arm,primecell-periphid" property to have the AMBA bus use the
> specified peripheral ID instead of reading it from the device.
> 
> Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
