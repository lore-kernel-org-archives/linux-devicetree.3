Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AC74052D9
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339177; cv=none; b=aOtLvbbMcQUatLmPahu2+/sWkVeV4xLwXRK8FpvZGZgrvj8ijRulShb6saU2y212lBgms+MfXw0CdJr+UsjAkqUlAWG7ddjCeVFfW9QBrJSujvQ9tkDf+rtdXtzAAtNCmDYp8PmQfvbqUiDmdttghQjoPiilDps0jDWx2VXVpzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339177; c=relaxed/simple;
	bh=yfrsC50ioGPIMFrNhawpkz8O61LnsoDnGzPO6q6DRQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyhrkHYWs/098E68bicDYbvFz3yxbqrllOeRqB+et98tCUdaIFE8TcCOEpfMVQ0VmiF/JsunrdN7WHzhdEdRwSZWKKHBFqKbSMhVjTlBLMgfZePS1SCmLXb2IHvQRdDFv66GyJEt8Csxu6rAyW0kDtzJ4t5tyVMHKqYayvA1zC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4Mtw74K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e365tQXW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4Mtw74K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e365tQXW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF40ZR2413267
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yoh+63SttaOY9zCSusjP2waN
	JNCY11RiLRNnfqSUL5Y=; b=b4Mtw74Knj8bjb3cqtocKVGS+Excgkj2UhNKT3vP
	1APzxR86R2TYk/YbG+ThF+rRPJN6LI/7PyviOP9OC0GLbtmSme0Uw69qVrMk7Gcf
	3fPQfTPNKocTd3Nd5xBWbX2rPN6LWDLVQWFuLbtIDXeNEqENT1ONWhmcfiTJ3uvQ
	tMqfX7/NWnvZyhcNNAjFIfYyjkO9yKreTrDe8UrcVahi2HvmZywrhP+hN+YjyjrV
	reWQ/qQhsLBS8cgKwC+wQKYWVx3jMdfPMBNHCNYm88Q5BV5n6aymLzVI/2OS33Ar
	YrUQYkmBqt5Jfc8CsIhs6LVXYtbELRsR4fcA4+4syKampA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3gh21j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:32:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-522de3c645dso20781661cf.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785339172; x=1785943972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yoh+63SttaOY9zCSusjP2waNJNCY11RiLRNnfqSUL5Y=;
        b=e365tQXWa99gI9WiJ7DsXJTtjwZJeeSn5mKsw6a3DoyWv+Fz+4qtoz3PMnJ02h0EJC
         rf4zprChOH0OYcXPQH6SOUJB4kKJI8auF/ocMwDGzemR4jZ/bmE+ipX+Z+x79qr0HVtl
         dUzIB1uqLD1Mme0IQHcxUyf7b+tkhjSnpFohMiyHzqkMlmwk6On8wVkv3FagvTTQCUtZ
         57Y1etHoDnqSnaZuIxvYcqcBq3JPg1H519AOYMlhA35XcuuvajEY1HjgXP8iReMdMzvm
         rP0pxdIvyEiefp7NQbQ7ml+asDTzNysVUJ/4SMIpLGXbcfBNhkixZb2p7yJDGS4Hgq43
         dF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339172; x=1785943972;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoh+63SttaOY9zCSusjP2waNJNCY11RiLRNnfqSUL5Y=;
        b=cxraXweBPXe/sAXFkztzubC8bIajoLmAo+54cMlXDrBgLl0pVNPgZYXKvVOfnBtbgL
         TqL+bLjSzDrP97aF/tNnJ72JCn8CJ7xjVgmSM/Lu3HPJh3i6MX+ARCaR3KxUwsIjTE07
         g+g4A+J+WiBBzdcYAnisRBjxEW1yB8ABzRIwY+Gt8tQ9SVkLJSdrsK1GUktRdPU/r6Sn
         tTfuDA9R2dm/MfovtyqvsDZXoXHagPUflnH3f6dzmZWnPDifsQNZuzv/jZ9xiexy0c3A
         JMAQkZUSafhT5UfPPxarlpJrapMvjW/wp17h0nJ7iou8NZBJhIigxiBhE3/f+yaS4FxA
         pLKg==
X-Forwarded-Encrypted: i=1; AHgh+RpcB6Ddj+3rPNDyAwYEFCl2Ko8d4DF1Sy1Jv+ylTvEZ2M8mkis2CgJ6dcJoUUS39kAzUNwBrLvAac0t@vger.kernel.org
X-Gm-Message-State: AOJu0YxMvauP2nCMzGJOVPIVzXvdwkWXOuPb9YBYvXRdLmDc/HUPQqyA
	u4tr6g7W3ra704P1LnWZOgqv+y8wEYh7q8ToWreKRiJAKTb/woY5AkrNNtQzIYFIT6WwFCcUW16
	O9BIPZyoVgqlxp16vvXEfJSixZeMTRCWbQPo0llBHSM1fVpUOGnnaZvJVYlmnKBNa
X-Gm-Gg: AR+sD12+RKNg1e+996rF/fye+VuQ7alAwljpBE00In0SNohwyV61eOojcPrtsRcH4gx
	PZVyW5TTsmhp5Lch48mwfRIIn8p+YUdg1AL7hadM+Sr0iJ8FHRsh4SnoIhL/ZXlv7zjqvPk1QfC
	wnrZrzQLrLZoKwX7vYrEf/wQa+KZccI6dxaGLwNaLRDJq8mzrhRmkpVzePABNsZPZaZ57dxQrHA
	VPCjjl6vg5+Dm7OR6SdNZB9UCimOEyIYpu22C6oJAE5lyhMXHGhI7t6Pu6osUtRdu9dvuoBkmFc
	ssWM8XH00lfNjLRvbQ9etkbZ5pOx/FcTQP8m2RWwTMHeqrBAhR7q7aPQtxVQx1t8H/fYQ9bySo+
	q4metaZI42E/4vnE=
X-Received: by 2002:ac8:7dc7:0:b0:51a:8c86:bd42 with SMTP id d75a77b69052e-529d7148884mr64378871cf.63.1785339171921;
        Wed, 29 Jul 2026 08:32:51 -0700 (PDT)
X-Received: by 2002:ac8:7dc7:0:b0:51a:8c86:bd42 with SMTP id d75a77b69052e-529d7148884mr64378391cf.63.1785339171272;
        Wed, 29 Jul 2026 08:32:51 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd83fabsm66366305e9.15.2026.07.29.08.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:32:50 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:32:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with
 TC9563 PCIe switch
Message-ID: <aajfoxioypwxysjme7wmdlkhfdvklwjc26dldvdnkp2axlizp2@df3gcwfgjadg>
References: <20260729-eliza_evk-v5-0-41790a5a24de@oss.qualcomm.com>
 <20260729-eliza_evk-v5-3-41790a5a24de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-eliza_evk-v5-3-41790a5a24de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX4vPTVp1gQRhA
 QF8ondVyrNdOxtZx7nEL4Wcjdu6tcys5Ucl7E/sFNwRmSTr4ImwlSk6/967grkBEAGHVhDC69oZ
 0Ptr9fQjHaxWZ8HRZK7CEj8N+i0lk9XYc6k4Fptpkg+DmBmMsdUiZOzglJ8AtMsmku9cN5Ewi4i
 dRTV5IVZLPYtZGjwVYT/4KJoQyn3pKmijFAE10Rski/C9ODPQOpbqq3/hNXVO/usHhDKscDswP9
 /vig6uRYa+AX1KkShMeTRp2J14o71gAvgQU98bPpdZEHoQ2i8zf9ViCUyy9pci/lc4MKsr09qFl
 xWnlwzonrevnORgmCNEcgYvaAWiMPJy/6JTziEL4G9DPMTMcMWCsShVio/LNGFmse+DzynQiwPl
 PPBwtHf8bXu2QKClB0RWffI4hy1kV+bTQkxgJ5zszpcKlp1IXfnTfRTpSodHkx6xk9l+EoNaDqK
 +I7cHPh4uPYW+nQGR9A==
X-Proofpoint-ORIG-GUID: DDJohDhy9POseo-6ORMir7Kjiviloz1c
X-Authority-Analysis: v=2.4 cv=EOw2FVZC c=1 sm=1 tr=0 ts=6a6a1d24 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: DDJohDhy9POseo-6ORMir7Kjiviloz1c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX7i6HhGjmckUy
 p5sjiE9gUyEQrEOnLJON2NMIatcrS5ldnr2HjG5R+T8ohSu59pq+FibTMD+NGs3DIa0tcWawCxw
 0SPqHnbJ9w3rjU3WDDMZ3VeItb0Uq0c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290125

On 26-07-29 20:18:38, Krishna Chaitanya Chundru wrote:
> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
> 
> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
> 
> Override the base iommu-map with the expanded set covering all the
> switch's downstream ports (0x1400-0x1408 SID range).
> 
> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
> from the PCIe controller.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
