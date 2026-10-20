Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482001;
	b=D5gXaG0O44a4T3ZXAQ06zld+d7w5YsPv4IxAbPBcXZC47VBSIJRfzuhBLa1pHfTmYMf+
	 Awa/uXCwrcsYMUeFtY835DP4p8UG5HNVZ3ZNCdU+V0NZ1AE2Zf0TYFPjIRxfIHQL8Jm6y
	 k9sEfN9mkOcOAZDybIOJ55Uf0efBx6uqlMH2gWJ61bpxnQ8v1CodvblKIyTuS89NQ9Zvv
	 KvEumaQXG4zrkJNh+1FsbbUheG3rT3msEN+8F9zwJUphKY5mNjfLhgOVGo5TXaC28q13O
	 h+p5mVuX2Mre3BfUjb4QRw+PWCrq1NLN1Ap/cIgACwqSpqrEk1QsU46flE75afFwXqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482001;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=;
	b=pyaK+EWIfriYjPuSvCIqXP4zPUQq7Kajlkdery56l6EOhh315n0p6p8/AgwxCodvmrol
	 SzVlElNckFmBT60QeS0vIQKgc9vIuGPHud5wU4at/UEqShSugKVQ5UZHxvSKIChr9dNoK
	 NOAKmoCEHT6EJTmtsffO4FBPe/vYewoVTd292MSaj+sSp7x8KsV3inWaeORJMHXGiwa+J
	 NK3NGqm8eO2S/xPyt6EmN14e+BDnLTbiiOgR9uRAClZCEQ8KtaJYZ7WkRLIv7nuJ5/RBr
	 isBFDjlPMGaUfazjfHnKj4HjmCdtCxMFcqQY35ueVU11cdOgqJRwPsMfTGAyTtQ09GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lC0XPaJz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkzFbT7i;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB4E606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB4E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lC0XPaJz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bkzFbT7i
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tasF4178357
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=; b=lC0XPaJz05GRIrQW
	n1H9FHcfsHzwjpXJJAkuLznQ3BULE/Oxb1MfCFyTfZmlmoLWt8gFqxe/NXJY2Zf5
	j38d8UJqo7WhAax3DnSIv+ltq7sA/D9++ecjqKF4u+ZIxqSOmkwlrq+piF/RfViD
	PTFLxopqD3Pqp+GoZwTJK5SuFwqzNfNhCgBujZxwiqBbHNJ/WGhf+0wX2JMKWcon
	FSsgEm1mYTmw3XcA4pguyo1eWHJlVKhlKdVA1Tv8sebX+dBoDfOoea5u54bYQYJB
	ipeoAagYLEoBsVavwAXGGI5yKpyH4YWyilEtgYvVCdcePYrWsoZ5hvpte0baZHmY
	EXeVkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1dcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:39:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3960dca5so43292785a.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481999; x=1793086799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=;
        b=bkzFbT7iSnrHUmc64jj1L2e6dz0XZCgt3yvGJNv4/v8yfTBHOa4hQHKnTHTTilX08L
         xkWp9mO41j65QJHtd13FWWEZdxoxP/MAhh80Sw/4I9w8x1ia0S0MjuIgXm3eMYn1wjwO
         IZuVsDGMRAaiMavydwrxtUplQKKH6dYTbHmyIvihReycD4QCX6WqKQQYTZjrOo7Catsn
         IGivRT9o5v/O8vjHDG5OEhe2awNkZVtZaSR4DavpNXFL1zCLEdemhlFklaEVD5GMjNqD
         yvNJE0oUHBDi3YvhSaELZ2LKh0Ly9Un/RKn/cHGC25FCcJ1SlqmG72vMAfN1n1G+x21m
         m40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481999; x=1793086799;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dnGgh3CjOTD0J2PXZNVkEflCmVafqUQmwSleEjekYw=;
        b=eh888LSsUvodl1Coc+kAUkMhH55kBMh88L3moR+8/4uz+VmJspCnGsRDkk/lBQ3Q5H
         ae9CYlVlpBfV2q72QvVkyHvWPmPIJRPcHMxEpMlD+bz2XNMx4K+AqYwKuL4N4qxD07Jt
         f5psA5M3x6gQya4WAZ54qXI7aZrKHRroKgz0LOj8yG3UqV00qu3Mslvp4BzHIsR4zTPV
         w4vSNIZBdsfgEc41+PboWa1vm8t5ziCm6446Binx39b+FPBQJUOfF8K1an/hC3GsAaq6
         07JUI1vABmqtGB8mF6r6XDMNVeNLtDczuHOuLFnOHJxeoN7gSUEnmQGkw8AZF9sGt6c8
         Yf3A==
X-Forwarded-Encrypted: i=1; AKwUvBw3WnA03GkrsKFQauT5TbXelA8rqNHKDP2Cr9QPQVwegvatAEHhuLUb5kEHSuy8I4+8hdntx9r118ZL@vger.kernel.org
X-Gm-Message-State: AFq9FYLA3N1fKqIAxKho9/ufBdjAnJfpQNoK6FZgHIB4l+hGwi+eB/7B
	QiFFbRlklLrKPDxq+WhqgeNkdmwqxDoQRdCN91kzLnZXXgl5a0iZbHIcdh7s9WQBS4tRiC32g6O
	yPfz8ZhS3Vlvw/lMA9R/3uqaCa9kb4QceW2MyJwJGi3EOlmzVJvfbaxPZ3XHhbNbV
X-Gm-Gg: AYBFou0x+tmuLUN6OXEN6H57IKU3FpINX9RNm4adeXzkwIl4UDlArzT15yWcryST7z4
	Cre1zng4BhqlnmHOssZHEKn26wMjZT5yu9DTJuTg7soTfUtf5I6neXsSik7x9PkREeqwP2kGHGj
	scnjf0Idr3b4BRZVtB3u2M8C9z74Y+KOf7GWvvyLy7fN9tOoEXBC/g0rKrDUU9qBVNYBVC1u3rT
	idLblj/Zy79/2FQa4I/eVOvMO3ATNajjTcQReJEqmjHnIWP6LtbaynsaO1C1853F2Oy1bmq6FEA
	9WKSVcCaxrrLkA+3e5zsCK6IAan1UMe2uMk1mey1FeUKmd4hUAGOLbKyudebR6pPX1UvAUZzghU
	d0SliiDgB96HqhMwaixdBrw==
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1772976385a.6.1792481993998;
        Tue, 20 Oct 2026 00:39:53 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1772975485a.6.1792481993572;
        Tue, 20 Oct 2026 00:39:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b0f75sm4978138a12.13.2026.10.20.00.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:39:50 -0700 (PDT)
Message-ID: <491df02f-c122-4349-ad6e-c27987290f73@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:39:48 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C
 controller support
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261012094835.647882-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012094835.647882-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ArNg0Hmwhi3T8ZpM-91DeUpn2I9NoKNH
X-Proofpoint-ORIG-GUID: ArNg0Hmwhi3T8ZpM-91DeUpn2I9NoKNH
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad71acf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0dpjz_nAn25EwL7gGyMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX31QrhlTFL0FC
 c2Rm8XTALeOaQjy6h5bZe9tomwVaMBEn3EOhgKG88SrmgQKMpRClOH5Z+5WKnbh/h94ka/nSRiX
 cmQ44CuSC3m+O4cTlbJZioBfNkZnNamt9eH5ZGMovq0r6lEXlDLEM7BfHs+82Xfh3SEVL2FrsC0
 Lah9nXk/+uVPo1PymlS/6P9bqJgFo4SGOtbgzZ5QpWaRzlYfOen+Tli32sThR6oHHQDWfhHNEos
 wtaQvMJ03EWXXadr1s8wGdauEdqWzN6P0s9Xpd4nuyoFoygyEhPXuZGrMaJ/CehV1mJvdaqnfEQ
 CfguAdocnjuqzw070e6lmykxNusLBwug0m9HLvPPQ10XJIQY63F6dX21pytLDJ4QpFMY6sNRNxv
 DZlSL362EATt4sBGCE0rRjNU0PD3YzOkPv08Dwt+iwPZUbXiM41QISU4KoiGXGigFMp6UZYDSUS
 MLKsADGPiS8qQbz3wGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX+8kaePNTQ3tD
 /RbXKma1mZSfQ4S+A994weWg2NXeeUu2aeZ7Mr9b8+PZ11ybFrJXKY9RZe3h4NcX6tRBBRCPoYh
 EVsc4nfhBWbAmJDek2l2VGcgrJnfB2w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200030

On 10/12/26 11:45 AM, Akash Kumar wrote:
> This series adds support for the Cypress cypd6129/cypd6229 dual
> Type-C PD controllers used on the Shikra CQM/CQS/IQS platforms to
> handle usb-role-switch, and wires up the corresponding DT nodes.
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---

[...]

> +&usb_2 {
> +	dr_mode = "otg";
> +
> +	port {
> +		usb_2_dwc3_hs: endpoint {
> +			remote-endpoint = <&ucsi_ccg_port>;
> +		};
> +	};
> +};

Do not redefine existing nodes. Do:

&usb_2_dwc3_hs {
	remote-endpoint = ..
};

instead.

Konrad
