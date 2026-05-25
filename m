Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BFA3E3C57
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698150; cv=none; b=Dh+5wXmb4pQ1bZpWTr3ZlzMb1FrFcEUrOhwT6+F4bY8QZcc4ZBbp7ITFB2yfW2ZKVfsQybT633KzoJuTs5ba1PO0DYmKATv43btC4aUOJaiSfiGhZswKaN5pu8auTIRUxIwpAsaYJDy8Mo4/B716g8Mugvi+hLM2Drq2815VIwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698150; c=relaxed/simple;
	bh=I2MAiCnnFa+M4QSFFwvmD8oY6s7q7pmNHYOivoqkjhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/GZttiruGqhsbUpqpX0KDu0w4wN2IZY2kf4xSXc1B185O+LRu/WFGFRnxw4SGFnFfCCg/JBt7dAsTSeieS7/mE7j6km85SXgWy+NnQH4aIrwEB84jAmk0OV7hPLpcOsEJoEIC6CVxfsJzYGEGVBSMWXFWXts/aX+CtsSTVzI/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZBfZLuj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wj2klee+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZBfZLuj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wj2klee+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P4v8pq168750
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EHsuf/oTXbo1Vza9tR2cpzEb
	OYDDWjdkQoOzilrn9IM=; b=YZBfZLujPs8lNeT76Pc//1R2VeHLqy1kN8Q5HRzL
	edVFsmLuY+ymeAa/sZjxVlbClmJ8PDcoMRRQ/Wg93dmyIo+o2xwMwIrgJ4sA15yt
	LSY1Pu0YtYOwYN0sAgDf3mGudp7TIsbQ2x0z35eUBECFEwWzmL6QmOSYgJ3a11ld
	82IaoctnYlYDlWBqA9yrueB6HSlY9qlxLY01+OBBF7817OUpDo5Ql7IlTPVAMuGL
	tVisgikP3PGmT8Y1CeFJcRp70s6mri/Mx8HfSSW0J45kaZwQFkggXQ3q8iT3YPZr
	lLhTM0iFVdSUOkrTDFKuPYmgvfRi/Dj79bNSZRe18+QCLA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0w1hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:35:48 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63271d633b5so5138371137.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 01:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779698147; x=1780302947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EHsuf/oTXbo1Vza9tR2cpzEbOYDDWjdkQoOzilrn9IM=;
        b=Wj2klee+y+6dTTyXwTTrgId0hQF6ih61ndHAFbDSy1/9U2FdUy05NlQggU+evzgbP4
         XNTBaWc0T209to0MRyxB9UVJelDZFhm/OwYXgkD72PsxI93CqnxjZLK5CXBaZqm9wCMF
         DLQ4C9crjlkSnZblLaDAvthfbq6DURQjKhZgmTdo7Rc82bEtDWiCKo+8olvLxRntQLBf
         FPIJ7gsr6km3njoJ9JzutvohPT6Ii6W1SfJOgWTArgTofgK7jaEOzAEQq9qA99kDdG8t
         W6j84j4HOmcvgToe8bXjB/7FrA7aACYuIg1bLhizTCbA9GVcwjry7cApYbfdiJiQ2BjH
         TkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779698147; x=1780302947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHsuf/oTXbo1Vza9tR2cpzEbOYDDWjdkQoOzilrn9IM=;
        b=Evhgka2xaNw45OupnJ8/NVfZcO249zqOT1/A7kH3xk6I8M+OECUE493ro37Shet8hM
         S++BTp7qoYF9z0xl+uDx1YagBf4B7RFTGLE7LHtv7ny++Azz2PxX0Blsf1ohUuqwvckL
         Cdp3PiissdWdf43tuO99xzrO5iSSUxmeV3Fhk3jgfztd3YNlIxBtSmLQ3GTke5Mt7v6E
         MtSew7Ihof5Mk6r4o1+RcFWjD4hJcjHDa6R8DnuyeAFFuNVaommUYyxtd1WS+Fzr4Iro
         WkWbQBiZcPnUd38mEsxjmo23PaKXI8s16dtwB/fXQJ1U0fipjNbKFGxANjnsqchtnr+c
         4EMg==
X-Forwarded-Encrypted: i=1; AFNElJ8XgPlKGx74BdQquF0L8nL/M5+onH/EWF10E2TagGoA4iCQE9zGGCw3bOrQzWheEBSvdYpO6Em0nu0h@vger.kernel.org
X-Gm-Message-State: AOJu0YzNhtuTQfkcDR5HzxnOzWo+PgSJp0XSETv8FYfbtv8mhLg4gYnc
	YkCosDNUyMlf0AJjQE8CACkcN7cjUwrH35rXY/BpExcPjwc+eujme7H0CYuyu50nmLZNNf6sUnA
	4yn8qG+d1Uv6/2vkIN1r/sqf22uqPoLWR/NbRyMdscTRRIgss+brW/60I86sNMkJB
X-Gm-Gg: Acq92OEmWAHIo3jGOsL7OMK7twA/OmQfSUN1vNKndeCXFi5AhqmQUHdC24IA76stImj
	2OFDLd7KxXEDl/eVMMfy549iJDNr9I7WyZuI9P4O2JFt8Da1Xwybf68yal2Jp+W4GQp+/dK8ZDW
	U1vZGeNfaxbPFKw7Sls3Ze0fMkWyBKRzTD5gGdk4WdtYzpA1ixYc0LZMx1RkSBLGh+kPZJhhWUH
	fxuq0MYB0qHeSjWn03ut7X/cqkZ4zo55JhL0iezOChxOmNcHbwfFqRxHvWwptJACfsYKVp3jZC6
	RmCUmdpDFXn8k4mJNG5A5tPuZo+qX8MsBCqVYv79ooc9MDYcEcXnjtPrVmzAhdEBdw+Zt2b+wwx
	FPiDtlXOr9pjUR1PuTzlwq3MpfKmTDpjK3H7zl5HQFNzvsX0akaUTOoNFTlsh8ybn2dWp3oXRNu
	m4e3rfgNXBdEk58BCcWoX2DrITPm5tDFeY7Vs=
X-Received: by 2002:a05:6102:c89:b0:65a:fcea:5a4 with SMTP id ada2fe7eead31-67c749055f5mr6447086137.4.1779698147072;
        Mon, 25 May 2026 01:35:47 -0700 (PDT)
X-Received: by 2002:a05:6102:c89:b0:65a:fcea:5a4 with SMTP id ada2fe7eead31-67c749055f5mr6447074137.4.1779698146619;
        Mon, 25 May 2026 01:35:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf4f27sm2489401e87.71.2026.05.25.01.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:35:45 -0700 (PDT)
Date: Mon, 25 May 2026 11:35:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] dt-bindings: soc: qcom: Add Maili soc related
 bindings
Message-ID: <5k7sh2yooj4yn4wtpifyamaw2dglk6xwbix623rvt6i2idkxr5@63rbo7ncduym>
References: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xY5Hvx4wQzi_UXoYtuanZcFDLlPXaR1f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4NiBTYWx0ZWRfX9M3VOg2+FVZW
 Ldc9Cmd99qAbZO1tFBFrnn2Y/Zui88E4LI2T101MVAnjpmDbamz5+cPpxmOISl5hmSd4LhySWSj
 kKoyVgIHd//+NoYHEzsyfSE7mqcu/9KmrfOQ4G5hqEH5Oe7FjYWV0m2xCWdjqPF38jPudfOqqAs
 l8YOJxf/Cy9N3WVvZH7jqNOzZyfAvwyn5LqnFadCh/1I9VKocwvCnhp00480ylg7CRWEoAZn21c
 7kwtnSsPa0/dR2RbVG5gkrRWE6sZjRGRwuxghZ+0dO7HHGKjVdOiBF3pT8XlFGQdfa/zg7htRN5
 wMAr3Xp9EiUI2FajB3v4Gtaa19H6g8bB21caMR2Rbx+WhFOieR12tt+dGwu3dSiIBeLJiIKEvY5
 m8Zucs8hL60T37tp63eKOxE+zacHbUe46wyDt0TduuswqTtAr7AOXamA806xw9vMRJkii30j+Ap
 AEPAAsdhRypKgzJk4bg==
X-Proofpoint-GUID: xY5Hvx4wQzi_UXoYtuanZcFDLlPXaR1f
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a1409e4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=NSv3qpHqmDL8PqNx4EkA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250086

On Sun, May 24, 2026 at 11:29:43PM -0700, Jingyi Wang wrote:
> Add soc related bindings for Kaanapali Platform including aoss_qmp,

So, are you adding Maili or Kaanapali bindings?

> imem and SCM.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Chunkai Deng (1):
>       dt-bindings: soc: qcom,aoss-qmp: Document the Maili AOSS side channel
> 
> Jingyi Wang (2):
>       dt-bindings: firmware: qcom,scm: Document SCM on Maili SOC
>       dt-bindings: sram: Document qcom,maili-imem compatible
> 
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml      | 2 ++
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  Documentation/devicetree/bindings/sram/sram.yaml              | 1 +
>  3 files changed, 4 insertions(+)
> ---
> base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
> change-id: 20260524-maili-soc-binding-2a2287fce578
> 
> Best regards,
> -- 
> Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
