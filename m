Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A57492E3A
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726116; cv=none; b=F7pgCwSNU16SBMqWD/i1kgI60rfs4s5dXcihU/iG3Mor3hzg13sNOysB1YQYdA8JpKF6YGqinyYCfRNSMmRjj3OD4bT+8OKzFiCJbiPLpg2Du76KBPMoZteV+Js71z8nBZ28Qp80Sc3KnL7voHjDivDHlnU1Pq6HInus8DFvp+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726116; c=relaxed/simple;
	bh=kszFDuclNdfq0CP9WFG+uE4j4V4VvM+PcDa63yU9FKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNI/kABb6IVtLGisAvMwHxvaymXV9OKncH/4QET3JKTOM07K2+Ftfn40Ya2cSqimDhskW7GH1IDonPPgcjXXbSEjS5rPxBNKByxGI+ccL+ExmR5qMaYUO0c3VtkJPiJFsG5VvWkirtf7G0h4jIPENpVDnCIP1lnk8jTq+ELvTHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sg7CSuxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RrL+NL6U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sg7CSuxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RrL+NL6U"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9db5K1404321
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yY+tN0E6aDJtS5LXy+Vf5AHguWRqlBrG1L1fZBB5kOI=; b=Sg7CSuxGrw6JEael
	T7HUYkr4BHbFeBuL1Bi3Q+NinEXgsnulsj6Ply8n9QgHj6+J13bDAx+ONpEjDpSm
	KXOJrKzTT2Pn1ALcjt2228RrBWz+79y3p1M1YLFffyPzl1EQP6rTFTyT/TkiCqei
	Rlrb4Bco2l5a0nFwI9L369cFMT0umyGond96Qt7fN5xYVGwzPHLfhFJjAmXPLY5M
	8QymwDYDbC+fSPF/WgCR7o20nzc5Obs+HMr1RPftUM30i+bFjcMpJ+scWpBkeILx
	kq0N9GtNUDKZYQoZYtdvHnkTOUKY+gDZlHMMyq8kwhCelTRHKUj+LyPP9OFnNFL9
	A66hGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpt4h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:08:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso13980885a.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726111; x=1790330911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yY+tN0E6aDJtS5LXy+Vf5AHguWRqlBrG1L1fZBB5kOI=;
        b=RrL+NL6UcKyLn6YlPfhjSrVQsHh5YiItiXUNvo5nNP/30It2XJ0D3o/bTcznJiEpAi
         ch/bQ5nZOFUYN/MRyVAYg+qB7uU5kWI1HCQ70huoA5+kYYbB2ERD5/VqrOo0Io+kG0rH
         WgLQ2iTqFOq107G82jjdw32LIcI1Oh+evNe8QrnOJh3PA00Zp6lBeegYJCE4FXhesT71
         Yvv/AifokuG9EKgRez3fy60uB3wwt1h5Yj4Bn/BKwpa/4OtJVbexL0khYJbsnoytxlCL
         Fd5BkbrtblOGf3ltIqm5Eh/ksFVtvRh5x4+7dQjASGqwyTdKAGp41aautrk1NO87SA5z
         ItIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726111; x=1790330911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yY+tN0E6aDJtS5LXy+Vf5AHguWRqlBrG1L1fZBB5kOI=;
        b=KhOayzzJR0lNSbghlL7lR4RB8u0FpooCCMGRA/6vRFnDAtNAKpgW8J4sgFemHlyR4G
         om2pbuc8tVcE3+TUbhpO15NvY/1pg3JBnfp9T5lwBNRKdU72SYqaZiuXylbgEAvBSEwE
         AFsstKWWWqa42MFS5ScpqWLIXxSCvB+S18c3cnSceqDwgpz9tRjL/U2KW1KrRuWClUPY
         d5VEshdyCsOCvhn+vjHOyCG7KkvKnntL4NqtEhAkW/FYJ4VUUv2uBi1W02kfcRbSnYp1
         up06TRS68hkLzUUe2z2T66pdHKlXztt03EWU7rXqXhlkasXJWZ78ULTcaQQ62sYxlYJ4
         L1Aw==
X-Forwarded-Encrypted: i=1; AKwUvByAU85WHp/zbIRVb76ZlQdGzpGrUF7ZyJUisa7t0FEAN7eVtfIj19/i+FcWr7TiDHaXsl5Jc0GEEdTH@vger.kernel.org
X-Gm-Message-State: AFuF++lh+jl68JJO3MeyLye1Yey3lmvN5STnUm4v8weWFMJgTC/YsQIB
	YaZMuUI6r2gWPJG+UqkpQbNVt1qpunLIH7zL/ulqC00ZuHuUvs1Oy8Cs5FOZ9TCvu0tahqE5ReW
	/zmzhW1TjpxbG5iBk0fFq8WwdK0FwF2vHgxgLnxLkEjolN1JSucRpXD/ovlvhVWo5
X-Gm-Gg: AYBFou3dFOOQ4yONIcNfOa9tBev+mTdPK4U/kfa5haGFC90FdP7S0MIB9PlO11KzDgE
	5cKxswVRhU92T1OBtiqPey3sXtISYjVj/BUfM4fi7pjEnPa3ZEf1Z8GnC/lWFF1QdcjquA5uBCk
	YuipU5jA136suoAuEDrBiEe0MDnCqVLy2szzvHvc5kl77bgJFyKG67XKDoXuYm6mGYxvtH68PUP
	oxslIqDLL+ESJ10WPm6pEku1g/72EbsZmm7MkxyEhsXnZEoOeD3N4CoYECRLDU8ba6oslg5se/Y
	a3xNEioCC4RbN6buW9pME3zEVaHX4cxdWOkRB+loPftjclv370qrd6pYRdSNvaaLwVqPY95Yj55
	yJar49tGu06YtNUBnwZTBUQ==
X-Received: by 2002:a05:620a:6cc4:b0:939:c7d1:7471 with SMTP id af79cd13be357-93be0998bdamr169258985a.4.1789726111270;
        Fri, 18 Sep 2026 03:08:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc4:b0:939:c7d1:7471 with SMTP id af79cd13be357-93be0998bdamr169254685a.4.1789726110714;
        Fri, 18 Sep 2026 03:08:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59710fc0sm648914a12.13.2026.09.18.03.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:08:29 -0700 (PDT)
Message-ID: <ef3beed3-e005-4643-8f4b-fa7b9c017e08@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:08:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] arm64: dts: qcom: sm8650: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-12-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-12-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX3xD2tld4TLiX
 ur1JAW7MOCESuQ0+eMvz7X+vdkBHUmM7wFQZEs9UVPXOkBLzOM0eL90nkemfCTpazUjmYmhmxPn
 AQQBPKddrDgbUeeNsxKYf7hV2Lc7BD+GJinLmQF5qKPfJf+UF55GLpuM8XS41uNbdalkF8Ci/yb
 /8PHslI19PeNjtk/fIoTxILaze8Q2FwdgSr6dJov1TBneXFSQhoK4d2YJ58d+vPMYcg+PDv2Gyt
 7x91JXmydSXF04/4aIPGbllEJRd1RR+ONhrj2nwTpT5RlKCulBoBoUb1MViJTYeSLGOPpuQfWYI
 0wQ4AX1znh/zidGQl+oxROvaDUt4PH6jFtW75uNNcWNHgJsXbOikVuS5b1L2affsD6NjhmNU2/V
 w2csRW3DzDQhdhCTEPxq5k/y23SmDIe7z2TEX/XcOQU3QmUV45jYG71BNFO+/Bp0UbFVt6WGJIR
 fvQU24DdhIXOd9Ntz2A==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad0da0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tTWuevluKPo1qLNzH3MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX5adqPI37+nyq
 2BFJ7/CwXhHu50AfjkyukVG3blhNE8XOGcvnw1f9t9qRVKg8XL69YQFcAUYQCmWMhGEvrQeWLqd
 Jh+obCIEiUp78vvy4JCLGvF1H732sV4=
X-Proofpoint-ORIG-GUID: RDtC_dt6DD56yGX1BvWG9dXfZogt1tMD
X-Proofpoint-GUID: RDtC_dt6DD56yGX1BvWG9dXfZogt1tMD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and pcie1_port0, allowing board-level
> overrides. Move perst-gpios/wake-gpios from the controller overrides
> to the respective port nodes in the board files, renaming perst-gpios
> to reset-gpios to match the binding used in the root port context.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

>  &pcie1_port0 {
> +	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
>  	/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */
>  	usb-controller@0 {

ditto

Konrad
