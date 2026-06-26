Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF2E3E2AA1
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782488421; cv=none; b=WPeXKjYN87n1+F7sjWPSSHI/nKfpxzTz6W82sJ/iYst0c/n6Gxphkywpn7PdflbVPA7LteMOj0sm3oly2uGXyYYQfxCQKWksNWhVDTG2LohM88Pb7Wxb8OzPxU/yB3x4FYVAMR5SGOK5b60q3VPYTALVy57sxjLZZp6eKd28PwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782488421; c=relaxed/simple;
	bh=VPX+Y+I2zKqgUrK6npnDcblJdZdqqHQA/AWxPWZA95Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGOJfSb5oad5E71U815HQPnzx+ZdVniu7vpIqLlxI7HpCztf83X1h5JRxBT48AIvKLH0ExoTkavXGEnf52fy7K9ZUl443wdS65eOWjf5dScBSgB6mXH/ovLdtYLgJuN/njvP8uNP/TyNz/AaA8Gv0u3XoT5u0HJBW+U1qAWS+IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNIrHKHI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMzJvXjG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNIrHKHI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMzJvXjG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QF43K51150822
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/MnbH8+qXomOREAJjF5VA8g+RK45+UV5Cu1RHNLwxM=; b=gNIrHKHI6YoHyoW9
	kSMJXmAEdsowB5e12LE2FJvZzibpLEKz8JU9BjWrYttC0nLfbRHVfdFSN72JauhI
	wrnexHyHMsLuCUFQ7+Lg9tzbCTCpUgxHDYmlQcgpzeStoBupJwDNt1y04E1o8v3s
	h4k4MHNL6hO+yLBII8sBEjIMO3MQDNeKmnYsxQwBQ23fVQdmIUBPV1w9aDBRdn8k
	Sg7K19fsA2I1Uwy0TAnlyjSlKSIiI5LWxadbEOEe3g1SNjK5Sy2E/keS6PXGJIaH
	aoKCTVaiuqJeVHasHdigS3piTiuZVD2tvUE0p2Heij0PNozbLnvy9kM0g5c4nY3H
	aJKrow==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fgdu4cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:40:18 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-734f7d8bb37so82221137.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782488417; x=1783093217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/MnbH8+qXomOREAJjF5VA8g+RK45+UV5Cu1RHNLwxM=;
        b=kMzJvXjGERBQ3v77VwFVPzCXoCPmf2sFNe7VC/L6y/Vkugi30BKGJmD7WfCni1fomc
         WdX77RBfOZ7AbGy2bqQdWlziRoGuq24HwRO3W41D4zkar7zgU/QEE54pOKZh3GCBohds
         Qh6L4pT0fEHG38Fav8mdRRX7E8icwqn3paV6JnrTVXbOOzCaIlL78gxYsMEKMETlMP4U
         57IMtnPhCNn6OjDPQlj01Hn8DqIInAcmrp5fGDS/shveRlpAUs7tccF/9v8Jcjr7QgN7
         sc0hS2YKJGHWWi/AlC6zWZDwKLbwih20TUGTg73w9q9t4+p3rl4xAVgCtVCKa1PoeEFw
         IM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488417; x=1783093217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/MnbH8+qXomOREAJjF5VA8g+RK45+UV5Cu1RHNLwxM=;
        b=i7R4LrQMJ7j0njf0TUUeML6xRLP/SiLKOm+ohpqwcEQZXg/l8pQMQILwElbxhAtsA/
         ouYf0uR4wQzeAuD5jnJ7Y3AlIm2ulrFIa2A5pPCNY51hQdAbamapqPzopo2qGR5ARXRO
         xlrM6wdAYeqernrh+itqHSdjbjKdafKt7I4woOjf0wCAElIqEGDSiEJWy7Zck1S1LNPi
         p1unbtoSLkIn6lpV8ETLL7wf1lEQAqZ7Q+FTZI+gSVynSsGdbG/YYmyAEB/WDv/Nh09W
         SlhXCQsY+jR+4moiWnggzrG/yJusw4Yx+o+FK1qQUVGYLQKypBUSVweDl/R5dhiV2QWb
         8EUA==
X-Forwarded-Encrypted: i=1; AHgh+RpVC2byKW/p5arEO5eoKpg4VT4S2K0gYrLMxRNre/ApCdxL9BGiPD+a5uvxqCSdKybPCpuLsd6O0mOI@vger.kernel.org
X-Gm-Message-State: AOJu0YwteSan98zp6Yztfm5pc+m318LtIO46cAgPoqlZ2jIqtaTk1nJe
	qHigeN3QB/Mp7EBIGKxAqwFJbm8HXlVFKL+HzM19xO5xQPLR3vETBwo8e8//rbLuj/khf1mdFh7
	p3YakWfWOK3+JCj+QMTCmI5Fxdv8T5kN30fQj1qNH5N2EmNsfTNK4MJDoK7DVAwub
X-Gm-Gg: AfdE7cmvnBLGlSt3CGs0ypPqkH4twa66VNirJmqCnlRlralZGQgc6MSgMKLs+xafJ56
	tWCjTXD8+4V/BOpKRdItqIBZaUwwIuKVmoOY2rCHlKFf6E2bC0AS+URrorfTUR8Hdr4Vy+tc0H4
	H1+GxjVQMdpXy3HqccaT3K8+m9H+KiPM1rZyDEHjqiFMvQJdL6N70fwVseKlx6jHiClV6xyW/VB
	D9rPIoT+rmNxab2shMUM5CejQbiHeQTl02QZBc6dh4Dw6lTfPkqr5ese6nDmDwvcbPBoSZ3Sdi4
	v+Z93QUyMk7EXoCGwHVMKSq+tXGY6E5AzSue4NcSalGSjVIyVSKYEj8dMLKCyPyIlIadW4pZalJ
	A0zmjc3Vz+pzIwGWpOIBzSLZzsVKFjqGw1f0=
X-Received: by 2002:a05:6102:440f:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73433e2e7a8mr1296504137.1.1782488417139;
        Fri, 26 Jun 2026 08:40:17 -0700 (PDT)
X-Received: by 2002:a05:6102:440f:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73433e2e7a8mr1296500137.1.1782488416715;
        Fri, 26 Jun 2026 08:40:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ac4774sm3143421a12.3.2026.06.26.08.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 08:40:15 -0700 (PDT)
Message-ID: <eecf152d-ec0c-42e7-beed-5a592661d9ac@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 17:40:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260624-add-label-node-for-glymur-v2-1-e8420fd7025f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624-add-label-node-for-glymur-v2-1-e8420fd7025f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=API5kwXb c=1 sm=1 tr=0 ts=6a3e9d62 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=eoqsAjppAhVGH4h0bNAA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEyOSBTYWx0ZWRfXyfPhF4ae7Ngm
 2Hj2eHERdULgeH/xGuLfITNvbsokeso+2D1dVn8w82GqwB/C2p/gYZAHO19V4cqkuJm1ABKxwX1
 lqilUW/YXOqdVKDucvuR8cW+44qWOftyThaTkTaGusYrqJfhGoo/n0CP205iaSTC3L0zt3R7fEq
 0na9MjDqmInegZHYkazVxc1sS5TiR6QyOC3uJN+Vp85BemKlRZLFJLkJ5g2gbK25Oe2v1VLCRe/
 XKBQuE9D/pvu1kG4+CcunSopUWQ7x+DksP1pnKrEIyypG/MKxfvQPiufLQxtGmgzcuifwoWnFnx
 92PSDTzV+IQ73PLnkhWQQA7x9QR//u79atDBe0+Qs+JFVztG0Q/6TGXCjTMutKyg/rfrNwopXdw
 3cFBYW6l9Hud2EOynHsdLDxa5yJRTKLQTa2NjljKGUXEx9ZfVZyAB963akLsRKGfexMhxK6wEQr
 rJGmZ0+jeFMeHrFeQHg==
X-Proofpoint-ORIG-GUID: p_06cC4OIn5XfpUIfKTUnkXF_66ktwX6
X-Proofpoint-GUID: p_06cC4OIn5XfpUIfKTUnkXF_66ktwX6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEyOSBTYWx0ZWRfX5DEqe2YkFBXN
 TN5BtZcIgdHolsSLZkM289y+ntPnrZ3EoDrnV7oRPPq3Kzfzrhx2sAT1hT56c2lRa/7saDr3Zc4
 i2aE8ykY+Zz2XxBsQTOrzK0NqX/carQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260129

On 6/24/26 2:38 PM, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the glymur device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
