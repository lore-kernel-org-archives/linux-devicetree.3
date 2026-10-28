Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201098;
	b=NK3DzNyZr9U5U+ryRlV5ql0aM9ixysHELMEktMUHib352jYELVwkg4BPbt+NviC5EF9C
	 ePXJHeIX97YeJObHC5RJNp8HZly7zqdV5hLKPc7WhocjIM+p5qd0OBAm+zvIz3oLQsN8H
	 eOs/qgrR1kvWQzdMt7Qq7QEDRM9htmDUdRO90zCmyisPyv6fMRT2OoZFV0sAc0EHTey4s
	 wCnSGRtXypHnpNg+ag/hrYOV/iVaJa2htqBv8yy8/wXaAW2cZ7DZuV6aXopZIWX5NJLxU
	 Qy2J+UWGSc0YVz/ArjtYIWit2eeY07ZcaH8ITzvxgzYWZs9jj40xFUxVPpF4UYP5RCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QLQUXqUYirntPTS+AVIsP28QuGK/Ns+GbMRyoGZXnHY=;
	b=snf5cldVIjO9QBDjTBIxwLyFU2wfHUXKjgpCyeu2gh8nJpul2SRQeg7y/PHbYY+ZHLpm
	 g7shKYHkvlgCO+gvAz4VscvqUVyPr8Znox9VnLevJI30B0GYeIhkY/WM4RP9ySwVAfi+x
	 CNhukqB3+NHrYHJ3evwglb/93WkZD3mkGPT89u1ea+tzqtu+3pyEzHqu75xzeFH1xLoW3
	 RRRZIk+AfiAsVUnuhBdMtcLBsfHLK4UShwOcItv+/pcbMMsd06arzYg7leoR/4a7ouYqV
	 DcDuyetvHXGopWdp1iacLCeN6Hc9WDPk0d+myZKowqsJN1DT9ZjAkAAPJ4CmOf7txjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RACwGrfB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxMtTmSO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80820606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80820606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RACwGrfB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxMtTmSO
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFADPY2001635
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QLQUXqUYirntPTS+AVIsP28Q
	uGK/Ns+GbMRyoGZXnHY=; b=RACwGrfBZ/gA2Kqv3l52ojRFGLZ2TwI7tyazYofl
	h0AEGY/8tMLQWFfCsQdx7LUG2NtcoabfuznOh2PV9jTzT316ZweXD20Nv0eR2iRB
	fpAQqrlExWEZomtKYKdwhwQ0x8klqpJMRBC01d6mGTjh/1YJl9fwU/2oaDXXqrfS
	7Uwk2KIq13BOcgr/gepJfJOKdJUyQ5toLtFe4DcT16z5FuTFkvMp74OqcLEI3hY2
	hHOGMDyC/Q+JFX1AoGuuAYWRr6tph1T/5CkUvbmt5Ks3HX4X1TQBshve12JuasDK
	f9uTE1YXv7lXiKzdm2Dw+2T3zI5VYSpafFpGzJmeJSdSDg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7smrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:24:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eabb3a1bb8so369265e0c.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201096; x=1793805896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QLQUXqUYirntPTS+AVIsP28QuGK/Ns+GbMRyoGZXnHY=;
        b=SxMtTmSOs0xXzmv80/HN9uC0699yWPeex+Y5WeqIdc5iarDoOqHNedW+76e8/n2mcX
         4Bi7Job1xB0O2eMuwbL4RjU1LusJT8/NWEjAMN2TLTOw7G9FktKFwaWngqyN2d/Kctop
         QJHPValRdWuoCE3Uc/pCDDxjf3+UvzvVkKYJrCkqLBR5zWmjYN6GZqEHO5GkckzXWxvG
         L8syDiuMCptBzHsrQpET116pck1kc7drcLC4nQe1XAioqnbTt8Ise29F4miLr8tfHZWz
         rkMowPBhEmlJxsz7ag8HT1fNCM12/eeWWnsqKWgSX6AqSIMvKpybAha0MUaIL6LCmSqd
         Pyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201096; x=1793805896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLQUXqUYirntPTS+AVIsP28QuGK/Ns+GbMRyoGZXnHY=;
        b=Vu4F/w0ndTNwb0//5gRpYjFTLdabz1aP+c61ZH10mDyRxL+IUWDn1ZK9xoP1fD69uQ
         wMPldIXAkqG7BLC1EDSVHbEDME+KqLu7OV+y3h37pYjQpPW9BHPoQnF7AD8OA092KmQ6
         GTvs2A330LMtKAqHJoWVIzlRVu+EAsYCVvheMcSXieTuzgFYjR/VeEek/4ctazHdOf1X
         kZ77VZKzd6dXz2TG9Z33xz1Jx06i7LEtM2mydy3bqlt+RUEB+JAbofuVrvuUHnzqq2SL
         aPR1x7nczH4hpaYvFRFp1kZqyNDWCPRWHGIT+0V5C4tUE9wFzYGYXmde3BeOVSNJAvVk
         KqMA==
X-Forwarded-Encrypted: i=1; AKwUvBxFeAPZdbresuVdKrbgDnXg7H+QvB928pGzwF4wJtApgC7kWbc/042rUWOn3IDDBTYgIFZHRZj44d3p@vger.kernel.org
X-Gm-Message-State: AFq9FYIRCgHqNe2JNEnRzry43CGA9k3Vm2TxgrnNLFGdNVeJgmDGzYPh
	tyqHeOHF5XPJJIho26lLIkkqyDacvpm6xXB9GlcgwyOW74hU97nffTmnTU1RauSeLFZAiPcKJiH
	6VyWzRJK/lDgvCZuSBAW+Vx0S6J4GuPEyYJoE3D5FMqzgF8sRV503WB4kSymHeXCE
X-Gm-Gg: AYBFou3+33RGiPGyGUbiyephABWQej+uOtMb0tw4M9yUyoYxwKJCxQyu4H53cZm19gI
	J/fUbCnakKLO9Gt/Hr9tuUS1AxXiUMWZkGQMyyRWi8aileZgp9TLHmMsJPEL9r+mmBajTI90fcb
	MwPmbTfpuFtdcLQZ+U2FqKhXEOSxBzI6MFMzyyWfk7h0iunNlnbPoGdmqikJx4jT4KnW+SxQASL
	GBmLMgHVZMPaCEuAodPH5VKm9ugJmwncVkjc7gxXlsRe8NBbIJLvhExQbet/c+rYRyRB+WtAAv1
	4mYVBWYm0Td7kECilVmjGgAurPXA/KpcWqs1lVxGSaZvDFuvdQeJUG27uH6O8oDTZWkEKs7BSCX
	3U1WSMEoa92xlskJ+4jpFsLZVgTkz9cu4p3ILFssA7hAkplyGQurwJ8Fw2m1EAAUAaw==
X-Received: by 2002:a05:6122:4d09:b0:5ea:e324:7c19 with SMTP id 71dfb90a1353d-5ec4caaa352mr1308293e0c.3.1793201095535;
        Wed, 28 Oct 2026 08:24:55 -0700 (PDT)
X-Received: by 2002:a05:6122:4d09:b0:5ea:e324:7c19 with SMTP id 71dfb90a1353d-5ec4caaa352mr1308242e0c.3.1793201094884;
        Wed, 28 Oct 2026 08:24:54 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm28208441f8f.14.2026.10.28.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:24:54 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:24:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add refgen supplies for PCIe
 PHY on Glymur and Mahua boards
Message-ID: <keiqrug6itasipmizdqrpjtwhe6qibgtallk75kyorvpxsbjr6@uhpyachmpc6h>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
 <20261013-phy_refgen_1012-v3-3-f28305289499@oss.qualcomm.com>
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
In-Reply-To: <20261013-phy_refgen_1012-v3-3-f28305289499@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae213c8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=n262S7Ma3DPWuRD1FHQA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 5yILMaKL8BIqJkvlOnYlnD2DGAa8y8mN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXxZh3Y5gD9sG5
 dDHJVVNap9FA/5Hh7twIQQKDhYw1Pg1NSTmM3QhkVArwjShJq4+3q/GQYGiyzT8tBmUD/SwFBxp
 r/WunnGJFkGW5CCkAk+2GJXFH1N9eS8=
X-Proofpoint-ORIG-GUID: 5yILMaKL8BIqJkvlOnYlnD2DGAa8y8mN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX/UFKGr9fUG/m
 ErHHJZp/nJkbGPrYnowk/MYkMo6WRI1Qxg06BHmhyKSTK+/XLYXQUua/VOquPNtJbGMEPk/pgjh
 9986xH36IKAA2z1TM6lvX9Hfn0HtNX3pAyNv7eHf0JmeZOH55OuAZ5/2b8L3pVeHqn0dj71Jhkv
 b0JZ80gRRxh3i4hUhv6z41PLk9/ROr/0JGxvqy6sDxOokJ2dVnSmbwTN6BTcpHoMTwk7+COKFK9
 FfBrYE0SososbMBixdVfNskbs//7Ry+PGky4E0i/qIfVtSinMe9Vi3h3sDU3aGkHW6dz5jfYQWK
 A1+ZK6bKAfq+wj0zVEg5ZZwWT1YX3nalNvCmpv94qg4HyWJdMFEL+RKI5qbnvke1+Kl42Uhc5ot
 FPxWXk1ZbWa/XDrySZsGRdquj+ULH7XoLSo5RbsQ+y8or5rCMx8J2HiQY+jt8f4uGshmm3vqmHg
 GCCS7ngjw5ZTQdyea7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-13 03:16:47, Qiang Yu wrote:
> The PCIe PHYs on Glymur and Mahua require a reference voltage provided by
> REFGEN, which in turn is powered by two LDOs.
> 
> Since there is no devicetree node for REFGEN, add the vdda-refgen0p9 and
> vdda-refgen1p2 supplies for each PCIe PHY node.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
