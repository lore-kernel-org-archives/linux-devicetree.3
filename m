Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3FC38E5DC
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429987; cv=none; b=Q7DC1ObiwQ1cvYbXFal4gmiIgTF33z8pJhSJwnhDRnlCo0OROsHUQUFRFcESU+1+IbSsWIYUAJ+bzUYNiIa75bk0fRcz+Sm/Kdx0hhCgR9TlVkWm414iD8g+TgQ818yQU7pc1sE6CvW4XeUk1V0P07oGyMvhCmX+N7bd61mK1E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429987; c=relaxed/simple;
	bh=IAI5fPC8kUOmVOXpbjJOoXS/9005rgomTstYB1sbH1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7EIsI0F1+AvbNSfUeFO+DS9qpJuUGv326Kodku0fmm7RUOM356eEglLOGLnzSryWLYRRX2bvboIvCcbkq+/erc9/t1Q/VbjzKl3bQL4AQhNEt1LSCySb/l7pXlFQy99a8ltzIOef2D3BHmSGISFu371bX4zDTOei9aD+nQrvmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipmUR5tl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/x4foCU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipmUR5tl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/x4foCU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGX8qW1629334
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41bv1bQPLiy8a8DyzT5YhAkpHkoFIBS2fv2LzdT9CjM=; b=ipmUR5tld1IyruPP
	gLTAvhy5UXbBEOd/bHHBUvy61Ek7rWw+V3LY4Tf3rWescP7bFORUy41PS7fj5Kep
	jtTqQOvktgowmxUHVdIF8PsuO+bLpk6EVfk5LQ++oVw/iWOGACKvRrvwM/tK89eS
	C8C4WVMXWyfjwh2vQ7rYxPXv1104hLdjN63CVIh+Z06zJrnKJSlQ+NJB09/PhNSm
	pe30Z9avESrmQzHn6rRTkohbdv/1VIr11gxjzmdeb9RW6W3oiKEwCsRFhwYyOym2
	mkRNmta4Jspk0/Rm/I7P8D3UPUFL9PSMVY9FS9xqqPH7DkkNFwKU9UGQ0Fvo8NiK
	SHUyYg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7q3gyvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:46:24 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-977be80568cso17262241.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785429984; x=1786034784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41bv1bQPLiy8a8DyzT5YhAkpHkoFIBS2fv2LzdT9CjM=;
        b=O/x4foCUNwzA9OsePEbs81GnAhgUCyMnzwhHobTO2qihx5EVLXDmRQGGeZ6YeMCBG0
         v23sW6M0bLMayc3YawO3pDDyKksK4EnzjTgYyq1o43chStgm4A5N/AgMEugqNr/KBt6z
         QIWxhgmeQWG5Tx7xOt2mZu/g2LgT83DGd+gALkVvk6AOZnpEQazBaejKh+iwa62QnKQk
         LqCJ8uF/FZUgZX6KlqvGGS/10yrPpAJvEc8/atpxA3ruLAUp6ixvUHK0azN+n0DXyM6X
         1WXV31HSBTxQtLVGRbv+teHVdhvYaOfaZUSSeKGoRpMxjj4bui4rco2o5ucNqBEU0ICM
         IOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429984; x=1786034784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41bv1bQPLiy8a8DyzT5YhAkpHkoFIBS2fv2LzdT9CjM=;
        b=gwA7tUsWNrcn8nJZ1kgNzurhOJMPv21KO5xUm2wXBsG5EXru+Tp5YRg2/N91S4LQCu
         025Eu1OLEp2+zRPLofR95ODX4B1SAeT7zttNLd5HrycFl8xgXcn/kJlGMDOW+mjYtAB8
         fzNF1nLP0DccphVh3DsRoeGi+ErSYr+mpy5Dzqo81qTua8r40q2WYRp2lWOA6t4rL4Kj
         l9aR8HnLrTBQrJHJmCwH7ii8MYW1+AJNGnb2s/HxcPfml3IJT+NUa4/mTfOPsOKFsh6u
         hivVA2/Q035d09pSMFkSDYd+TxP7e2cLuGpu9CwLA+RfATnkZ8bboG0fraONp7X6STR/
         sWaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqm8R6E+CaPxHV3rjos637MkWQ21ZSM+hX4EKE96lpwyki0MydGJREYSfhlQGsmH4JQtC6Cvu2nohGE@vger.kernel.org
X-Gm-Message-State: AOJu0YzVPMnl/tu9/94gmOvbliCuWRxY8NIwLxqkqmUYDJFf+dfvGxwT
	0e4r94QNx8mezGXFzkvZRZjBh6PUHyTe0N9Ch6jR9x9Ds9u4SJQkbiOrQhz42W3rnUhY6xWk/ua
	f5wIATp16Pej6NhP3h0HdOQH4Ha9H6GfpOS2CrQo5vFizX3O5PA5bzqpa1uO1KFUm
X-Gm-Gg: AR+sD10pTMGdRWUm5s+LrRMlN1ULnSHGP+uM3fxVafXsieMUeMlbvL8LR6J0MzhTViV
	v5f93jH029Fcpr94Roqfqw3l7j42YCheEFSKQ373BZXoYeU1PZm8mc/KnqWAnNrLGxm7U/lxegl
	Vncqe+pX4VBu264aC1bTn0Ng40t9vPlJtmkYTL17wWGk5MyOis9THmHRrYVC3usbgFSB22XGrig
	Q+/sc1S5UUafkKqZwh8ineIzlMVAN+jP+xezLK9AgDIhdGMhuAXrN8ue4nDjk35fw3jIiPeMYHd
	B2mVoCkzOFMR2DWnmkKcuUSJbqEbS5crodlQXcH5OpbZP6H5Ki2/0DM0LugVKSPCcw/KNWHZHby
	ilF/bl6j2FoNxMiqzCrle/Z2e
X-Received: by 2002:a05:6102:8090:b0:756:32ba:1a83 with SMTP id ada2fe7eead31-758407c7a45mr602061137.2.1785429983604;
        Thu, 30 Jul 2026 09:46:23 -0700 (PDT)
X-Received: by 2002:a05:6102:8090:b0:756:32ba:1a83 with SMTP id ada2fe7eead31-758407c7a45mr602044137.2.1785429983191;
        Thu, 30 Jul 2026 09:46:23 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa851b322sm91019666b.7.2026.07.30.09.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:46:22 -0700 (PDT)
Message-ID: <1bcd1a68-a1b8-4604-8a2d-ece01ccabc00@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:46:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] usb: typec: mux: ps883x: refactor DP altmode handling
 and support TYPEC_DP_STATE_F
To: jens.glathe@oldschoolsolutions.biz,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org, "Dr. David Alan Gilbert" <dave@treblig.org>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNSBTYWx0ZWRfX89ffwKKHqpv1
 8cmlgd5MjZ4n6hs21cNUt7Ri9iuEjdZ5tAiYNdrdev+My+T+2KmIIfiZHKmrC6NMs9cTStI4xMr
 5JH8mJnR9rHZmwG8eGfIiMBCx3iYFk6v58Z/aCxuijtG0IahB1su1wdUomenxsc6z9JeNFGPSqL
 BH823TZfm+Ia8m6HyKJMd3wqKWUH1FcWtRtY5CUGzfHePkrSnhwnwQB+tu5Wcv7w4V5/B8FFZfy
 bTDOBRGjUo1COz7oGO6GfOD+qnXSJibu5N6AWGt5kAzmQ+oRTBWvmLcGgiBkrDr+9TRE1ntZysq
 QiFXNfrYVihGHgypN6BQodDd25PU7yHeP1SGXBD9+r4RXkQtwgw6vxCX04bZqyslm4qUG2L7eHK
 bEght0l24rS346b3uncAEeLHHP5J/pQetSlq+Xa8JCZAfnk/4RGY3k0bMVc1RQqHvRB3C3ZBkZK
 k0/TmT+ojJKbjDS/+1w==
X-Proofpoint-GUID: z0emOl3JKPeEawHw7xoVLdCNcXD27Oh1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNSBTYWx0ZWRfX90eTdCoP/OcK
 vPLdorLkeGpk3DeqBYCBaIr8R8s0aSJGLROsjmT7DMncG11T13Ck/+UryN8SidSvRjxYVV4bhjK
 9eMtlVXgYcBAlbBAmV5LFfdxo0sMVcw=
X-Proofpoint-ORIG-GUID: z0emOl3JKPeEawHw7xoVLdCNcXD27Oh1
X-Authority-Analysis: v=2.4 cv=WuQb99fv c=1 sm=1 tr=0 ts=6a6b7fe0 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gxl3bz0cAAAA:8 a=Xqxl2qIfDM1Vn1vrR_wA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300125

On 7/18/26 7:06 PM, Jens Glathe via B4 Relay wrote:
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
> ---

I'd say just add a oneliner `case STATE_F` here instead

Konrad
