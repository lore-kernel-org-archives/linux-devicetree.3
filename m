Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB96403E9E
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339398; cv=none; b=Mlh+5+5cmgC3rVtBuD/erHk8D2+IcF7WA2Dz1eQ2e0OPpPObbup02nHkZdOAc095LpoZSAD80C8cXC7t/jkUOtAk2PYSk1dMhcu9atLcgOpFuvAUuyKLR81kc6+PmqlMEtkrFzWcnwl5UUQcpcm+BT9TqjezgzCpnCFikOPbkxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339398; c=relaxed/simple;
	bh=Hkd7WTFmIkuhSa1Lj9Ua/wTrqEfFcr8VgdL7VPdGPqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3r0vlaetrfhXMH1oKdYih2HukgfDYd8Ft90dEQCYzwrCFMJ6iulPmbhiUEmfnuSTxss2NP7K/xhF3NAGTpEtmgWLlpOFfpc+40vn66DdFOktJ0rZjLaYa6KxfhHi8K3eUfQUztPV7Q8+lEUeeOfem15GqAl77fx1mFJvJnbUcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fU4qlX3W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MpgeJh/P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fU4qlX3W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MpgeJh/P"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VeZW960312
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 08:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/QOK9WvQe6jUV3BBjRVMVi73
	3JCIvhjtwq+YyPWtdNU=; b=fU4qlX3WW28/3oPqaAGLDrVjbf+XxneHLH91r71y
	Vv7W4MEcQAVA3MJoMlATX8IzXpfmdoPI34TckvUDFFL0A8wmv/wgnbUJxb7fKTkw
	QFkesvN9Zx8IKmmF0GoE+j0ZldC2Bn3ko171H74srFf0eG7VXWIvD0cQI5SQyOth
	S48R8SgNZFXZsPJOM1Sx5jhuKcMzS1wVe/Jv8SwAmHEJav9IJdgLSnNoO6PrrUIm
	c0PEmRnGTAVl1dHe8XhP8FCSWVzXkJOulrI2cpj6MhmYiK7S2FvcT/Teey5tCOZS
	3M1YOD2WQpT+xttxY5ydfSeUhLKIZhsACJVcJiJJwF6DSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge3n0u2vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:56:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so188546585a.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 01:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339395; x=1788944195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/QOK9WvQe6jUV3BBjRVMVi733JCIvhjtwq+YyPWtdNU=;
        b=MpgeJh/PPCQ6d7zxlsYz67fiU5A/7HSx6nm3zC0+ug1itCJGphudh6MCH3Ub3gExSi
         Cd4s55yN73ovn4ZZFTPxPAizFLQoqD1d5pFbigg0vSRsjjR7PvcBVz4ToKOOs4oxHBGt
         n5gr9fizMiNThSE7PoAgGHXCcX7W36XmlQKj+y0puOlylsRt7UT6ctZHOIF25Q7mPY/9
         3bgcD0vg14p+7OvapX+LYqPLzX6w0DNViM/ei4rY4LIQ56On64OHi0d2dRxuI+44w2lx
         NPUG+KGL3mqabw78sHmPLWi9svHIx1uUcKVfJP6wvXQwISHXO2dWd0FYXL5zEnQPFqSu
         jILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339395; x=1788944195;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QOK9WvQe6jUV3BBjRVMVi733JCIvhjtwq+YyPWtdNU=;
        b=pul4Vjb8qZpftsqSVwaMkUuEpxWKp0JJV2fCMRji1/EBRkPD4aflEMSCB0bGfE6UYA
         lboT+88Lmiue5NbQrP6HW7SNByen8O5DW+mqDjGKSLaQXDyu8SdOAXhH06jQvVDKZo9x
         4FRuH3dAkWBnvZhaC5WTBb5MmzhP+HEAfG1Edk4uWXwPgF6OQuTyLw4Q4arUdjFXqPIQ
         zRX5U+Irz99esaDbY+HAP7nf5vMwgDH2Sn5zeOUnwDhOroPjUwiyB6Ebn6DZNxOKYPP9
         9PTvau1K9+G1jvXa+SjS7cubT4nUCL7BdOSAFaVnT9GAHv0ob2X3Hl2hfwhP1ZQ5gNNR
         dKaA==
X-Forwarded-Encrypted: i=1; AHgh+RpSBrOP80JzHoUINGozc1g/b7gRnDDd31oeEJdCT1geNQvjb8ydV2o+HR1LnDnSA9/dzjTWibfWMyCF@vger.kernel.org
X-Gm-Message-State: AFuF++n7pKu6dsVNQ/dBld17B+JMG+j5xf5KlMjNj0RbTZOONWh8LXdS
	bV9q2U6hJ2kEsKD1e5jRSHDRmJFfLfnJyigJJGMwWQ1sZi0Ib0AAAG1acOLaITtAxAxOhZRcQyp
	Tst9b9YYSNJcxGYmeXqe8IhR3ZpRiKLy/r4J8m8Uo7ZXfDz3wIgHlPBGFnhzQ/ass
X-Gm-Gg: AR+sD13Dvyiwsh+Wmw+qAeGV6icwycbwydo0lKG3+uDcmIivcgG5/1JNZbI9Sq0hJs9
	El8GFXcoK+GEW1SR2rY2HYrBjs/2BC9cJgHu2mARdAYOE59hMYsxOKRtWAT5BktgF7XR1F6urHI
	+LLh5ARXA1tQhCfnkZeqDcccKxcSN96K/4nWZCdFdeLtUJTkWKTcMTqgDznlJsQ+O1Knd6toGfU
	4KRZdtZmiK+0MnmjpeHkGgNYd9hJlf7kcT+C55PjSFYiCkZm+GT2ZuaXr8g8y/SuTJiqVHb+k9Q
	ddAK4Ou112rA4thHr/qvUzqr2IFzQc5HZb/BpR8EBTNnx3MCuTSdbXfTWF9P1DeKN1yqLeGK7ks
	n+wwdUaADy1Puh74=
X-Received: by 2002:a05:620a:bca:b0:92e:535b:e08b with SMTP id af79cd13be357-93960f57dfdmr345501185a.33.1788339393019;
        Wed, 02 Sep 2026 01:56:33 -0700 (PDT)
X-Received: by 2002:a05:620a:bca:b0:92e:535b:e08b with SMTP id af79cd13be357-93960f57dfdmr345497285a.33.1788339392514;
        Wed, 02 Sep 2026 01:56:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80388sm6241821f8f.14.2026.09.02.01.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:56:31 -0700 (PDT)
Date: Wed, 2 Sep 2026 11:56:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        "Dr. David Alan Gilbert" <dave@treblig.org>
Subject: Re: [PATCH 3/5] usb: typec: mux: ps883x: refactor DP altmode
 handling and support TYPEC_DP_STATE_F
Message-ID: <yit5hlvrumamlkp653uleqczt534aabcgrw75q4utxpistsnfv@ctd4lu27fndm>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX3FVET+mZ7Og6
 w43cUf1D6eY4kKAbi1YLwYBcN+O/FhQPjxImBm+VJMGy37wHiY9w6MJf4UeH3G+QUWd9DRzQa8l
 xVJIUO8dRnmlAe1xoYzLmGCJq7Mgtca9W0wkL3kQQhl/GhrMCDHi2xMlbaM+ZsmY1OniFMUVNIo
 H0HoA3lhWObjwjVH1mz89Xawig4ql15F1d80mKm7ppg0s6Jgr4dDRz9bJQ00uY5EJM4ISo7jheZ
 MjQSg1dHN6VNsmgHyyiy5/w8PKYgbZR8J62GXnIGTb3+Pj2wzQivHiAM5fqzHRrzVmuO46hKE4T
 MpOiEuF+QPXimdH98dxFNeiyuY4sxk35zYH6DF2GayHfC+7lfwJWIqmABqrSDqBiTfPg1ZkWwBz
 IZz61McT/FWdLpeko5GBCEzA+lYAo52kmySXi6IixN0X6tVtzbVW0SOtvu4a0Kp+E3lNPCiEn7q
 pS6mlUxxumwFWujIxVA==
X-Proofpoint-GUID: svPYC8GsfrJwI-SVo3iDcmZ9b5AqEaUc
X-Proofpoint-ORIG-GUID: svPYC8GsfrJwI-SVo3iDcmZ9b5AqEaUc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX+wGD/MCvwvUX
 tue2nWAzZU4H54JlagEENfjnBrmqarkeuFek6UZDYSzDCHrG5iF9xLZBHR7rI9891tSmJuQPmun
 IQD1AO28ehl/7Kas+gmY9eu8ZRCwVTw=
X-Authority-Analysis: v=2.4 cv=R9oz39RX c=1 sm=1 tr=0 ts=6a97e4c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=Xqxl2qIfDM1Vn1vrR_wA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078

On 26-07-18 19:06:31, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Several docks, including the Lenovo 40B0 and SSK SC220, still send the
> legacy TYPEC_DP_STATE_F mode request (deprecated since DisplayPort Alt
> Mode spec version 1.0b). Treat it as USB3 + DP altmode (same as
> TYPEC_DP_STATE_D) so that DP altmode works correctly, especially on
> the 40B0 in Type-C fallback mode.
> 
> Extract the state handling into ps883x_apply_dp_altmode() (modelled
> after qmp-combo-phy) for consistency.
> 
> Assisted-by: Grok(xAI):4.3
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
