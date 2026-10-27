Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115418;
	b=ymz75KfOZQAXS8wTYasgZTQS+fjsPz/6U5aA7Gd2YXJfQ7l8lJSosxz0YOYMcKqli0L1
	 sVt4OSlqVDVLe3fKCxA1hRWfGabp4bXxOJ88sT0JrDBJ/pYB7ieHKTxOPZ0H75MPu2/iw
	 zhVKjMirhZeN5i6KJlcf2krQdcmDb8tX2/JSwxvWtA7SH1FEiZvbn2m5D875iz/3E9ypL
	 rRRPCQnNlM1aPG4ktKmLnTvNhhF6qOTBhlEmru7jmQzhluRFjlCTyaHk2J/O3Z2Qu5oCy
	 74AggakegCCSNrotly7gm5tRrpKfCVwxFtOVLduBxNf9SluKJeF5NyIzt2914sSyZZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115418;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iOtOrmbXs4tZg1IaJhGs/3w8x1kRlFAdZAd0OV7YngI=;
	b=D8+ux/Cewm6ZUeAIe0D20tpnHRv9mrWr7LRpYMyXEynSsg/M7EFILVrBs812F0V2KVKO
	 cEGR5VcrzCHVJgIBkJWc16Myvfguh2Po3QKNh42wv2imd8xVg7h+HcAlN9V1lEORHDu1k
	 OekPwIDWfk8jTg26K6MmVdxx/W4YARJeuwWEdZujbC2N5aJJaOlLsfAf9nQBNN0yeB5Vv
	 JU/lX3CHYyph+c3mT9icZmAdnAbWDDDLRuEaNz0ruFJfSUsJK7KZ01TWmEwbMlQC8iq83
	 /JusksgUPYc7GDR0493opgqZdEsH28JFYBN0eVzLSOnxWbdCHqG606Q+nG/ECcDu7MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0MuHBy0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKC3JbDW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B26606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60B26606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0MuHBy0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKC3JbDW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFLEeu2549283
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iOtOrmbXs4tZg1IaJhGs/3w8
	x1kRlFAdZAd0OV7YngI=; b=c0MuHBy0hpXe5W8PfLtmGmefH0M5DFXzxb0IGTRL
	Y5xNnlPri6OpN0wIpPmzqFVo5+zm3TyrgSVDqb98RnzD41ruqb4ydf+S5BObqqqT
	TKn3a7paA9lVJ7lN54zPvd8L0zdR+rbLj8KaO4Ku41TQLRZWZt86NJSRWmAtjrtE
	BpYra0wNN7oMBjsxKKC4So3Jq0DqtuCAu8C1qI4MpFAD++MCuLwWCvDJRCSAcSco
	uYrlIKNt5i19KJ9Sq0/oYBdyI6Hp/zRUp98/zYoCcdHehDYf072nJBsCnS19smRm
	mjFi0WI9KToK9GKz5hh5A8lqkEHLI/ScJANbRgMOeRpUMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq69nr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 15:36:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so879297585a.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793115416; x=1793720216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iOtOrmbXs4tZg1IaJhGs/3w8x1kRlFAdZAd0OV7YngI=;
        b=eKC3JbDWaMlexrbT47mXDWiJs8G8h7onzbVxhUzUxLekIBPIuJJ8OAEswfdg8+9yC9
         Tx0jF13QF1hj8OZjCsoFypI5pk+2/me8qr4L7ZwF/NjqoolY0hcGvSv0j2a4leT0Cy3J
         4gm6X6pPYdZXMI3FhWo4xEYrr7auRBerUkjir8tmGtI/EgsDrJ22apW+eqKtiMTfZqpZ
         9XVL2NfSDT8DylhOLzfpJBFajdXmPAnYXb/f4Nj/+Pq5GKWNdNWF7Ne/juX0ycBxMFHT
         2fJGpAvyKXoW0AKBZzy1i3seVsI1sDkTN2RMWonLJtIwGG/E24D+LN/wEV2/Bf5E7Npu
         e+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115416; x=1793720216;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOtOrmbXs4tZg1IaJhGs/3w8x1kRlFAdZAd0OV7YngI=;
        b=PZ1lauvFU+HDgYqp8xv10TDITMGw7Oz90uVXxy68rnVSEVj4rqSSz4myux/NVNmokv
         v/hinabt8nHuOE25VGSpE+fFGde2CO+kG2PFyevEIbYH6BIHjqpvhemXc7FsRppkDZHJ
         NzB0x2tdjUiSgIzMpIbjDncm9QQVu/ecfJIPftgFFy1SkAtPOv6dGqfq8Y7KYwgBKesz
         3JADTWCQddRmDxQletjsf8ZCnMCnKPWFYARyTeNfZik4ucqTpPaRahCwERsvgpcERWIu
         397wuGISinu3UWP3iGd7tQmSNrpr1W5nUmm+PDf9JDUXgwNlCpSdVsCKL+f4jMXhrFT/
         yYQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCzJvNVdPxL1SnEKKbxEieOrvQI3Vm3/4x6dLOuIWWfX7L0HE2Rlwg6HlhxQBXlehvT2R2pQRsLv79@vger.kernel.org
X-Gm-Message-State: AFq9FYL9k1Pm0YNWInLWuNNCeTgkNtN95UVwzGvAE5CHTSvQXFyQSsmL
	OQKH0e6UzqoZ7LG18nbBW0MMQ6RqjIKXBv9qCdscHtsIwRyaJ2143zdq3gI8uGtJ5p3WgOs0Usb
	6ji1jYbDHSjBIY8p7zu3c7utdhSWPwqhzAkke6rI0tMm+D53Zmm59Gy7MZgxRyrBd
X-Gm-Gg: AYBFou1yQ/idMTNmiyr8WF052UesOdnbAqXtDJNwcFj4zwg008d3SOBqitb52XmWkrd
	0Obz3E9crl89fjgNc6+/sujzeGBvgGqalm+ylRMyRqoDT2w/WDL8u1mZu+v1AsYlRE2gxB16ivO
	uNTEA4/SOT22WYrecbpB7RtkCkoaxX3lm+jZMdd0j8Dk3qX7KHiVipTH4PLxG4Or6KcZNotJDNH
	c7vCDKSdW6lWHWHBSbnwyy4c/F2INJ/XvTGtCv4tjr6Q4tebjXXnw1CNA+21kXU5nzwlApSwdm5
	3zCKfysMHH6Lj5FC11KuXTu7CeBq3eau2TC2dnYcZ7RkqGlwX+KuoHR+0aRDrYybK3nET/IiQ4l
	FwIv/HgM8S7Sj14Xa
X-Received: by 2002:a05:620a:4621:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-940ef8bbf77mr1636863485a.23.1793115416351;
        Tue, 27 Oct 2026 08:36:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4621:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-940ef8bbf77mr1636856985a.23.1793115415707;
        Tue, 27 Oct 2026 08:36:55 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm710704095e9.1.2026.10.27.08.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:36:54 -0700 (PDT)
Date: Tue, 27 Oct 2026 17:36:53 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize glymur-qcb.dts to
 glymur-qcb.dtsi
Message-ID: <rnpi6fidshkbol62qbvaofx6sg2w2w6bakt556gzxfjhjl56ej@cibls2wr7tzd>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-4-sivansh.gupta@oss.qualcomm.com>
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
In-Reply-To: <20261027114955.1266499-4-sivansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0c519 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SizAbxo_vVgsq06u93wA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: qNxa4_c7aJaUr_hjlCxRMZET_ccqepHi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX+YKdZIdX9LZB
 AugXKujkzKRF9y/atHbJLFVH/kXm0uB2H1PwmxcbappHeA65y1exIxNQku/0YJOFGPe2ajRG3cj
 AvXVidhtd3PO2x2Xn5I5koxxxJ3H81k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX0qVz6TDBwd5u
 e4Y4h7fdXXgDZ0crygc9VDpRQBk6UEKViXEYd3Voce9f4eKVzSI1SAZI2fdsDYwX8d2NMUEQZ8H
 cXpwGYXbeTsU7eo882HKnKGGG8vV/tX0L8U+0jov2OpWq/5PDYGXAlya/rAMsvhm6+LZLfaqT/n
 nnOo/Rs8Dzcmp2tGJXATXbhd7mxaw1yqk0tcBPng7DlEL3WuDp3GGj6Uk1WiGFBCJuN0PmGrxLF
 rKdNznmkXjeUnsdjRZNc5PaXD5/CsZ/l1h1D41AXAzZWk8634zttu6vTxE6Zjxd//QI8RoQxp+w
 MIXmL6XDPDLqKtmYXMutGwrj7zPHg+qe5x2bBNBUgOzcre935AXIxZqXV9CHXjnb3rUXPWHMqHx
 ksofl5kf7QkWLVtaEj90RcIw63JPgy9T90LEMaM3861vfcqNCCheV9yal1K+dSVGkZwQ84JT26h
 axjzPew8DKnjyLkePbw==
X-Proofpoint-ORIG-GUID: qNxa4_c7aJaUr_hjlCxRMZET_ccqepHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270062

On 26-10-27 17:19:54, Sivansh Gupta wrote:
> Glymur QCB and Mahua QCB both share common nodes as they use the same
> underlying board.
> Move all common nodes to glymur-qcb.dtsi file to allow for reuse.
> 
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
