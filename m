Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501609;
	b=LHdI030HWGfr6IPyI9MdqakzacJ32s3sEZ5HjmSvapPKXrKUdLsWDwUQiMBFFqHJxoem
	 0yRcwXYorA88Jz1Z9+3XWfREDyvfXqqqoUPeu4DkxWOs+EWUoSON7JhoElRyfC7WraDVi
	 zhnelv7Yco1lCDEoU7wIdSUVQG/rvbTXARD5Flt57KQ9k/vEOs+f5Tw+YMQDNXTN/svWC
	 sPXDqXblonqTZzg3j5u4giI3vAgiZKJpPjiVSarmpHTsoJLuShEkvHzAdoillt8FV/0FS
	 SBLvStekcZIZpjhHQIz0BPb8hB5azNoGCGeW+ZlMapsxAObEjAXzWbMnq0GGSUXxnRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=P8PnBpQSPjgMpKEa3DFhjRcbocMPaeiZQ804/GTvmxM=;
	b=siBxzG9C0UoY8sDMJwugffVp227B9hd/T72p++f0f9HZRVbTtmTDXgLIG6yjiJquIJEJ
	 m5NH7Y40mfZ6cjXXfpi5XrUxHIfUiPygLPK91kNCoiTP91bIgXbsN1fbHhntYyZNU30Sv
	 6IpG2gVpraFd8z8fitU/71EOWNxVVDL8K88ZV3oJSYwtOlxj2jbZhs/IrZRi70n9mIlux
	 +aY4EoxPvgtxwV3lTIxO71a8Q7FDJ/+woLvByCBoUs8Tn32QddP6lycE0E5Df2cXVJ7Ll
	 upgX3EM8WIKwGnpeqjCJaw3FmbtkTcG7ArCQR6lHLZaNaZA9bIUq/EiDj6yNKbJS6Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbiecpSW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuTE6YrR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B878B606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B878B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbiecpSW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TuTE6YrR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxICJ1292949
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P8PnBpQSPjgMpKEa3DFhjRcb
	ocMPaeiZQ804/GTvmxM=; b=XbiecpSWGqbeXCC5HGb7RQpHgodCzVBZBjh0Un3f
	dKKMUM4ZgEkkJUxi7rSlgZyaHTAZzZsD8IoR2MfNIr8AsROurWJ2esbN97gFvUvp
	b8Ys9jwsj4/XodGQliBRRIQoOVJdAbhzcAsBMKntNYcFx6BtWuB3JLPrFY8X8wpa
	+UdI8F4paFUkt3xfu18a9cvUyvMIZHXHi1Kdfv5DeS3qFlVII3dSDHjTcg5NPsj2
	5A2KSbmpgPiLnmH803RHdLQr9R5ETRyQOzC0X3RYCNNgGFOqrUHpmbjQQng4c6XJ
	6USPdznDLRClNUSwfBqDubzAKOieFqoFT0o346uZ6gz9Ew==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2jvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:06:47 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9905fc56b60so480727241.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501607; x=1793106407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P8PnBpQSPjgMpKEa3DFhjRcbocMPaeiZQ804/GTvmxM=;
        b=TuTE6YrRijRIxnGGV2rSFfP5CAx3neopC/0Md7ZyIMW7kO4OtOjFcbqWBSGhhLlAeO
         K0IAtnD2CGS1lz4gMxlb+yPtlRFEfo/yduTsiiSPyixyickIk0KCQ6pZLv9TZv8RPzAM
         NbCukuYxlnxP3f5iJF4AmM9mUSDdgU0VMfZRxiK08rw1R+e5dw8a/I5rnnEUEZabtInB
         J8dhHGWPbNBGVC87zztu9OMNrZtgB4GcgqUUtTlamtUS1O+myl3PlbGdzvNsnqqdpi6G
         m6G4N3bmRgxc3dzfOCk90tSTxIGZvoi3dvOAgHuSOtCYSTcysbNFuk7nMnPQ9b8PV08y
         qV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501607; x=1793106407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8PnBpQSPjgMpKEa3DFhjRcbocMPaeiZQ804/GTvmxM=;
        b=KuGFRznIl51f1B1N8GoHW411dzN2NCmItIiR5NgY41IlUJ9B5r1cWbAQgFfwAS/LpN
         dWv2FO32RztPbMJeK87qi1YUhBY4HN+E0qY7c3kKZNUUH1odmtzrkvmb2+j9tb6RmLgj
         ZOuzwum3BJwANvlByciAQbHQsg9vGwjQZob6wjq4UJuIm1IRN8vqG5OgcYOBGLVb6FmX
         VC3XUMZvhDaswYD7tShjtOipEloIp6tHb/Pzw4O5KL7iRR6gMii5xAUQgh3tP8FxaEy8
         OTbRdqDixlxni0Aa3MQ1/Ig6hWiODJp7oQ0UByk1lSbw7DCKA9ae/Vlc+JCRTOt7cGpz
         EI1w==
X-Forwarded-Encrypted: i=1; AKwUvBx0M1aNbWOkBam6S3BcXpzz+AfsN+8OX28sW1T3Opa3YR1WnLRSpUf8edhveboRtHQxKEKpTMBSGvul@vger.kernel.org
X-Gm-Message-State: AFq9FYKk1ieshtPHvww1oprW0xDOavkBumbV/aC8PrnKsXOL9D7JyE/k
	2j/blw0E9/eLoC6Mwi67KW1Aivu9tNug8VN69bFV8wJr/cpiNG82ZJNo2OYyH/8k1mVk6mgjchH
	+hxuRMD1uM+SeoIFrzntoRLcQxeKUSjpmsjejDuCciAzhm17p87Ztp2jXDn6JXaEd
X-Gm-Gg: AYBFou2EmODbCr2sQAoxa23CZ5+AjgzO5C+QEmzJ7iiMeOPiCuEsIYuopp4/NVnuriE
	pexrAWQMR89COjFBVfkCzfmxc2z5dnriJVP/75AHti311XNbT946V3ZpGNIBbr8xYIYOggkN10+
	5FmGMi2+N1zvnU+uxMRwVgqp9TbmOWy2YkLnfWJBQPJwRAzheBnZ+dMOot2ZHUw/o/05pJtGZuh
	NDY8IqO9Ak7owNsSgnes4EMCBlAFrskP/zk2NabQ7CeYjGJTMRogo0dBqkI9te4jhlMKMK5PXGc
	iPYPpHookHu507SKB455xU/ORe7YBT0X4qn0ldfxpc7NzB7GG9Ko2sP01YLR3ZOJlZisZmn9ipy
	8vjw6Uxe94WXDTz60
X-Received: by 2002:a67:f347:0:b0:7a1:f2b5:6469 with SMTP id ada2fe7eead31-7cc7bd326acmr360815137.38.1792501606798;
        Tue, 20 Oct 2026 06:06:46 -0700 (PDT)
X-Received: by 2002:a67:f347:0:b0:7a1:f2b5:6469 with SMTP id ada2fe7eead31-7cc7bd326acmr360809137.38.1792501606247;
        Tue, 20 Oct 2026 06:06:46 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm6527902f8f.36.2026.10.20.06.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:06:45 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:06:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sc7180: Use ICC tag defines
Message-ID: <w6wsx2id3nfr74dy5xuvcml6hnwrjx3mrhwk3zgn7lco5f4prk@p24kgufpr42p>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-2-cae8d22649ac@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-topic-icc_defines_ao-v1-2-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-GUID: YFN4M7XO7EhrAkWaPMYZusP9bDD49Uik
X-Proofpoint-ORIG-GUID: YFN4M7XO7EhrAkWaPMYZusP9bDD49Uik
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad76767 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=F3kk8pQfqi94-d1tg5UA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX/WTe5znuc8PF
 ewdczaFHrGCkJYQ87sqv3msnDkeifTd5gXaH5kL/wUMuKh9w/OGGeRJfK9M7TrP4KYZSX4FQR0K
 Eyu6D8lovSX2mjGZA7aatZBgrOx4IWW2xJfOYWjzBaUH3dWVEBBXkx5M5GCGhLSLJ/J5qsZQ1Z2
 IWk6A4fL7JiWmEFKoX2BEBPTPnV5s2HIZC3FcrfgC4W305ij9aUU1k1UYZZ/ttxALjtA4La3e7x
 kLKnfoFpOTIhpgk991L+IKfaNf9v2eUFvzhJdWMXeag/ns6mEnMlnFNUe4PDkSk+GMfFVPlJ8Pf
 KWtu1Ydb0+pLlqV9bu8Ux9d8s9BGlkhOFn6wSKk73WUGiQfntiBc8bUCXYCn/SGgqf2on2S/VgN
 K1ZrJSiNz55an+JHVKVxiERbAUQhLhdbVwvB3FcC3yAvLyds814sGoYngAEJpvkiakVl8IxiNVI
 exNkAuDb6EGZIaIjaAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX+mDjpZc+7ePn
 6p6D2So4aATdvxW0NzBYerH+HLaeHt6kYBTT4Xbe9vxofVG+nqQtcS1VPdGpA1SXOM8wOGKgMec
 tSwcITxNdolSCfVlavNEcLa7vMUG/bA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200052

On 26-10-20 14:42:06, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The magic values come from dt-bindings. Use the existing defines to
> demistify them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
