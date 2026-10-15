Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE594CCDD8
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061759; cv=none; b=lglECu0A1fH5uvR8UDwcAci6r7f693RbFQpyJu/5kq1DWDmSgnMBrc85ZLx2wrKCIGmWhPWMHiQ/8YO+tQ7tGSydDo5GP44VvZo/zfcr9iXDTbvrzLFpfTBfyGJnlH7MhQCSfyqwWFucAty0daLLTjnWF5LVrXaasSRuaSllXCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061759; c=relaxed/simple;
	bh=C+eZiEQdNU3zDh9swlMW/4tanW7pYuBILnc0ncf5+gE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvSBBu7SioLF7RBjV95RRFFkigXkwBuXvtQxUBiWzYx0Pke6NJw70a60gvDKYq3X7psmoP0kPNM9ZdINhEZzNm7iygEMJq68e5aYNzlPMevoskI1ZTttw/SFbQ4yWne+X06yRqBMN5rRgRFri4W51BfF6ZAwkx2R7Spbdazt0HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9hfkUJH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pj5ebcd1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9hfkUJH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pj5ebcd1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSIS2662649
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABwLG7KYl9IdbJ2x5X9Ra6++rVxuwQh+p9U88YU8QKs=; b=i9hfkUJHlEtK81m6
	p9H6hfY/FNFrTUz8p+j0Ft9TyYSh3evai63/rhLdyRqZy/040bHtIbPyNxTAweAT
	OOqW004aHVAyab/ihvOWkox7fbUGAI7CGkWBLiB0mVoVIA1/LOt45fBs5Xd591Qc
	MJCkpL4A8+XPagTB837WUUNMXbBo/70uhLeKvSyWIaaB8nhetGEckwMTPxtOsC1I
	MlhnXG8cFdFNV4aJFk3AHlnWGr+eh8TZLvZyYr5jtvJ5SPUtHAZwNa/ySKxel4AB
	EHBRJfhJ9NIC0E+nfIeitrLrXAyPAejiMbK2bwAvUfhpO1v8aIJwe4/SuszFLSTY
	eN9mcg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda1nd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:55:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5356c6d98cbso14368061cf.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061750; x=1792666550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ABwLG7KYl9IdbJ2x5X9Ra6++rVxuwQh+p9U88YU8QKs=;
        b=Pj5ebcd1/FXGKRDuokaJxilskqW5UtFUzFgD5s19kR/FbgZ4h9X1Ozj1tfKE1EBCa7
         FfpfUbEUSHD425BynRSXW5q7NXKDmPOoUDRZKE7bpzfqpM6UT+THbWDR8Eq/9Q6G/JcF
         iot93hUgngirjuvqp4fzcMMkZ89cjpt4bjyWyXMlTKzjTm++PCKvywNUSmw1cbkx7DEI
         z4TEoo8+YjYlhfLxRpvEGNtlMn+zxHTkwCPRMfzDcEwGGZIM+DAFYAIf10RCJ4q6muQQ
         gUDhihYeUcQacRzJhFQeRyudmAFtMcLOGcT7chhOEkomqtRyvug3YM28EfvDN8Sh6hS0
         0I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061750; x=1792666550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABwLG7KYl9IdbJ2x5X9Ra6++rVxuwQh+p9U88YU8QKs=;
        b=1kH3e+r+EmVuRq8OoHZz4sfRtQm5N1kg5hItlyJiroHDT6sJwTEkaROFoz9qj4Nsdf
         +ImGulDlDHA7msFz3F2AO9mUhwsYLUvaQd2U14VeNknCZ8h9fdIZd0GVtdzNM3qNoMEc
         /I9k6VpTnTfpv+iv0E1OuWQPNEFLeqDUwY6lKeu0/Ue6Wn54dwWj4xoQQsphhzANj/32
         hXWP3rNoDZdl/kQAV4fd5bTLHjXpDt2LvjYtdo99UdPnhB8yrWhL2wackkPEhCZevv3F
         CB4DThhseDlSTHpobZg+9jEp1twdEGARU7/1nFKtvb0g1cQ8H7V/Iim289G7qIbF/Wj8
         Luwg==
X-Forwarded-Encrypted: i=1; AKwUvBwl9VkQqLnvDbe08Jfda/NDXTCbaWZF8ByGvRfem9h8wG6tTdZ5P81mRLtbKqSiRcjYGREggLOHtBVt@vger.kernel.org
X-Gm-Message-State: AFq9FYLbSjYtjLmbWfPldPyDmcTKC1wKP2Ewpf7FLCrmkkw/iM6Hs2Ka
	g8pv/6Ia7X98osl7WEHD2Fu4mkdfDIJYQmOKMAstsNOQk3W/il07W192jExyy/wmdY+HrirN3jT
	AJ3aFJoEQ4p4vrh7uuafbInIf55O8DexI4Hh8+pwwEFlUiVaEOJ2myfKkGEDPsllr
X-Gm-Gg: AYBFou1lgfjlCKKUA+JBkPWz+h0R2uaYcl7PaPsrEP2yNSEcQGFbtHV364LBFkNVZJ8
	s0b3U5W3si4dpxBtgcQdZPkZmbcfJ/9NHI3uLmZUj6fpKF+bVMaajgqc/bQKEOzNEhEyUK2UfQm
	bcVAD377Gezp7ZEC3sitnxdVpzV/d1aJ2fhpnqdVKBHE45fAWuTXaUcHTA80oBnODdFMF7nW42k
	LFcWX4WYrOsN7y7iQDU0pETDzT1rrX7yGMY//38VK+TQBEC9G88acvLEBzrIMForYMgV4yQ17fl
	qNP77cyKmzwY9wEW7mwV46KtZiVYUVDLKZWtx9uWiS6Py+br+KC6UTMltSxo+48/pD8j0awqZQD
	ibSReuELYBZZbbfzPu5uJlA==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr3451185585a.4.1792061750512;
        Thu, 15 Oct 2026 03:55:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr3451182885a.4.1792061750055;
        Thu, 15 Oct 2026 03:55:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2038abf24sm2285454a12.37.2026.10.15.03.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:55:48 -0700 (PDT)
Message-ID: <90d33b88-d171-4aef-8046-332a518dafca@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:55:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sm6350-lena: Enable PM7250B
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-7-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-7-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX0JpQdIW9lwvP
 xsQda/C1IvnMOgtP1eAuCbhwWUObi4u3CZfYR4ipYeI2D7HP3AGG2BSo6xOoEO+DGsBEuO7qw2r
 wt76nV2kjmmLuLZMPhH4FhltBAYEluk=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0b13c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JgZe5hknAAAA:8 a=dNZ_EX_IlpB_z2sQReYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-GUID: XFKOKTgyb9wQq1klSyqKJeZP6YVgTaIZ
X-Proofpoint-ORIG-GUID: XFKOKTgyb9wQq1klSyqKJeZP6YVgTaIZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX6uMXopJvg4+C
 fxx1IowsM8fBMTennMvg3Gy7m7J7XFQBF1s2PT/XQ0dAT+dAXLfvb+V7UQcdzVAZSBZnHlxVtvo
 K7dqir3xPhyrzjGefnHxkxRZF4Q8l5cUzK/SaGCiTOobuctDPSeR/d9jRkXWsdZxY7z9eU0jrji
 kHg+6n/r7OYVcStVFJw9+DAYj3UP8C41m3rOQwezLijpz3UAnRaqv3WP1pAmj3wKHG7RA87seY7
 RH2Rw/vmAck1loios2N+o3eIzr+PlyeqZzCBORbssBi22Xq/LeAe+P0IpYz+Nfx40VrjkP9p3Sq
 dZQpuRTkFty+QAYcoavgZlTEqn58tRmCVf/3KJ11kM5KUTFpnl3bglMd5r9LzisvzEB+oNOPOLw
 JxAE8X3qPU/qfgULvk2bq3l0/vd8f67liJK3ObY6ljHmr1+qwxDZE4LwIqcZYCnbp2PYMa/mZ0p
 2Kekhl6Pj+/b2FVs3ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

On 9/26/26 4:00 PM, erebion wrote:
> Enable PM7250B and some components on it for the Xperia 10 III.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

[...]

> +&pm7250b_vbus {
> +	regulator-min-microamp = <500000>;
> +	regulator-max-microamp = <1500000>;

GPT believes the downstream DT setting:

arch/arm64/boot/dts/somc/charger-lena-common.dtsi
18:     qcom,otg-cl-ua = <1000000>;

should translate into the max being 1 A here

Konrad
