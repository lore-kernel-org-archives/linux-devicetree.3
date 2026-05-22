Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D853B7B7A
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444523; cv=none; b=UZmJQTD0SrpjBucbbek9AV9F9tAIrQYmOlODpIinLzGEjXueZuDT+WqM/npFGZMKC86oz4a0qkg1eS4WU6v7YbLmLJasY3waQk725Cmlq8mM/vN+MSGxC+g+KtqNKy1qwka/lUvmoZYYLjocsVYR0pnu0sercl88hn9KChgLUhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444523; c=relaxed/simple;
	bh=P2kyltBA6J8KNAYonTDpKbPDO6R6nJqsHFS+b9EzjAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4Sn2YgDtQWsbynu7j/JsPHllAjttI/dQCvJ/uw+wiaiuTSDoa3miowpbSYn2GXB3DZN9gIu3LtoRtr0zDZkNj6REnEzUKTrtEm2D1HR/m4/DjMM28g0tVZ33E5MRu3xAmN3eiKOWGBeIL4+hCD/UHvbVd3bisEp3f+fh+Hdvi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UtYl94lR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AyAEAWug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UtYl94lR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AyAEAWug"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M5f0Lx312954
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZpZL/fGUYGfNeJBmp7s5qe+N7ItZ1tD9P6J+MaXyXGI=; b=UtYl94lRmWbIWvrJ
	KuwubPhRfQJd5vs08UAgWGKRMEQ0f3aVjZRiC8ZusYYqoxHibAFDGVhXhtGuTKjE
	HDfbeiArHRpXi9dTRkNGDs1vIpOdjh+6sR3yQjqUxBiY9vphcE1rgpuKrlMBoFZi
	+PBCRBrLBkDEGbEZxoBCrwZLwqmz5s7P/Qihwz/9eB4MDqaQo8HvLLP2pqjDdc0Y
	GZnfamDBuM/ZL7rgXE+asF8DnQ5pj6xpzzIfJuDOrSWF/Wb9pjx+2UI6yM/R3ktR
	6OzyMSNZREggBQi4qB/PBJqFF0eDJ8/ay3FudKwhym1WiWUZZ7IHZM3p0PCHGXkS
	e87VJw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8833a5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:08:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914aa01cc21so34500485a.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444520; x=1780049320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpZL/fGUYGfNeJBmp7s5qe+N7ItZ1tD9P6J+MaXyXGI=;
        b=AyAEAWugc6evpsEVb5LJ7dufhmwGWcGDy1ZDi+5fnDR+7KuIPnMAu2Y1IttG5ftaDc
         GS0EUSjQIkMEHwb0Mf9n9UrezZTj+oPhBYNGUv/rCLrp21UM5bSDM9QGkGgP+JJ1JUpp
         HoTF1z5Bs8tLpTA3ejnBSD0cjB92tILr6swBkXsgQz5guh9aN6cWihMgrKcsq0aGjjDr
         f5nSTAxn5p1UQz0Ij2r89yBPoCWtt2CxZJ6vvzlmgU23OLgmMUgG51krHmq1wqS2t3VU
         P15AivmxPnc1OX2vpvkgQblPcsiBi8Q1Yrxs7fm9mYWRPj2ijd0SD8D5OT8ZGXa7ZsHK
         A3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444520; x=1780049320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpZL/fGUYGfNeJBmp7s5qe+N7ItZ1tD9P6J+MaXyXGI=;
        b=SxSxz2DFy967kx7d5iEHXN9RcBxpYVWC8s2GD5aY3S7bAHbHvGl8EwsjaDN6qDz3nB
         EBhLQCZlENXE2Oxmd1XHyswzP4PmkNFCqlvlX3RDcLVS6FlnC7/KBs78oFEu6YKeuQzA
         CG2KBweXeQX7mDR4ymqP40ek0/qwctjv/CDP8rNzJ6JTxN7JezEaN0nd/TKQ9jH8OUWt
         Jc9gkuuFNyffJLnceBTo9H8bGzELJfGocEuT+DqG07/8cG63tDviMFPB0QxzbGBRDzqt
         ovMW1CDNtgoYpdSwuD28yT8an8CkIMiLh76Nl8V/qbGmCjBveDTWs1CQ5zL8Nl6dZQ1I
         OkHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+beEKmL8kPft5vPhihbvoOSWjOw4yQjHWbRpc40xr5/JpiFvc+HCfyGPvAWizke8KRhTg58tWt4Pa@vger.kernel.org
X-Gm-Message-State: AOJu0YwiZRKee0EawmEMln5icTLDccUYjFx5dhKtgrpkraULS44bR5qu
	hdfeotd+3nTUfoshZpO5hsuW61pqAAtNNKQrKrP7Pk4spo5Fj7E4mF8e4s3yj4WKzWgzxCgVTga
	qs4YvYJzYXgdgOmzOAQCMpPgZa+5S+DmLjPIzrLJU3N4fG5lbw/hYhqlMk9GMbBD4
X-Gm-Gg: Acq92OEfnYJOgU6mkETGB1aHqTsmruoQCZGeOC7ZsYJAkOzE3XONqioZnafLt8rby6v
	X4h8OgcPdjpZyFqvkWAHtTAswjtEZIdmZyjY882L4VGyiowa5ln5TWJPR9KO7iQh6AVmYtFJUXP
	/r4Xyg0zC337sxlAkXBwqXgYz9u88IEkHP8DlHuDOVFIV3VENjWXxssfxPDfOW+aLO0zhlG48VJ
	Zw/628gfx72d8Z/UZEn75h3PB9Lha7dnEmYLprdXY7agCh1m+CZb9qZL7Mj7Bum5RlWG2huZmTg
	4I0TvO+AR/C4v4tixBGGZpgbyQbKxgQ9zEcdmXjWT/ieCpk27VcSNNk50E1WJ7ztQiq6YeHM9hv
	NM/ZLJAYk75S8YC6VRog9D5pLujO+lLomGbRnHfzghcAxDw==
X-Received: by 2002:a05:620a:2a08:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-914b49c2f28mr295793085a.7.1779444520348;
        Fri, 22 May 2026 03:08:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-914b49c2f28mr295789985a.7.1779444519940;
        Fri, 22 May 2026 03:08:39 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ed2d38sm37794866b.34.2026.05.22.03.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 03:08:39 -0700 (PDT)
Message-ID: <6d117343-ead6-4f91-ab07-d315356d0ccc@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:08:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260503-expressatt-touchkey-v1-1-f7dd5db64e0d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260503-expressatt-touchkey-v1-1-f7dd5db64e0d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMCBTYWx0ZWRfX+rDR2eWxEZgr
 aI4tCv0LTl3lyhCpKINqoCMn81ue0iCbRihmhvSSj7LZh1FMRAWnLcKUBE+Trvlcof4TL4oXwuP
 vPAMqRFh41LF6rKKMsUgEvp5Xuo8JSCNX/PrAqGL2GWLmdigVryyee6cg9GT6KkvFzt22WwqrpY
 8TpXJKNl6OLhHiaYfWoddq1Q3ZrjHrW62ZzJyl+SYNoKEsO47GMGlrN7xpDVe4QGJHYbECblubT
 1ff1SzMMlCvG/lb65Jv8IehIV4JQ8FdCGzpPGfeqzI3J2jLB0sUeBAOLBeBI8zGj+xKTUrjM7Y+
 FsoGm63qqI9l5EtNd/2bdFqo95QdIJ4/n22roNgOi0RIKDwhm2POoYjpwHxoC9j0IvsspCrC9Z3
 bSjXOzN3pPT7AdcAu4eITnM4OXdpSuYXZX5o1j97ZV/D3fOSciNl4yPEnN7u+u6qi2yDRUpz0SO
 LaI56R+UKhDu2+XSCGQ==
X-Proofpoint-GUID: qCB4vRMQZyBt4ci1i-D8icaTp8iycxdJ
X-Proofpoint-ORIG-GUID: qCB4vRMQZyBt4ci1i-D8icaTp8iycxdJ
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a102b29 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=W2_YLVZPviVWVX_7ETMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220100

On 5/3/26 11:24 PM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add the tc360 touchkey. It's unknown if this is the actual model of the
> touchkey, as downstream doesn't mention a variant, but this works.
> 
> Link:
> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/input/keyboard/cypress_touchkey_236/Makefile#L5
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

[...]

> +	i2c-gpio-touchkey {
> +		compatible = "i2c-gpio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		sda-gpios = <&tlmm 71 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm 72 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&touchkey_i2c_pins>;

property-n
property-names

in this order, please, everywhere

> +		status = "okay";

Drop this line, it's "okay" by default if nothing else explicitly disables
the node

Konrad
