Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F120C44E66D
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141870; cv=none; b=mLErSKZAOZVROs0a7pDxsuiO0oJtBXLSktqFtN42ErKAp/+0tDSDwdlR6NPmwjHgrrkuvatKKV8M+fWuMdGbTSLnYerrEuTkjESWibTy5Cgn7OqsYZORKsDR5S/Sz09o4mnLDUccESLCBm3aHzmdk/+MXETo0KDGb/6qy/+IhFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141870; c=relaxed/simple;
	bh=ui6Bd43itbPmjDYfgjpB4sJYquNsVyCGU4xYMkeRH2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geYNBppGophDXWbtxrE+ZRIXq3f82mlBZTGBhXdJsXL7YCg0iuRzJwFy+x/p1Aal+jnJQstP4afl8McLQPffoGTRVKxTE+21nSSX6MGx2hQoryHT0dEV9oRCBrecxieVADdmBU3ybly7yUTYBys8IsNMnzwK+TdJcXLx0WLlYes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mO1EusKO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApVN/73g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mO1EusKO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApVN/73g"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lgMw921330
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIOZtlc4H5WdZ+JHF5mX59cxfjXnkubowR3t/yD78FI=; b=mO1EusKON6JQKbrg
	dwNjWV0Z0zHVec1VDd0Qwkn03nRBvGXbbG++qvBxjK1rGs/ZDAxT4bpQE8/EOOqB
	hefaSQyfs/qOWf+hNJ+mbdWf95Lo/lDzP8dVA+eXcmiBcqrhu7e3qRB8JC/9Vf9H
	m7XQM9iaqZc89S6tCLzyZRN2xL/p/BObKeTBi9m9D/lQXflPkx3W6xOZG/R6IjPI
	dz0m37f+Cey+mUWrh318vbQ1eTtLGjYK+CP4gNSSfzI584O6VD/LJlhQZUt3atnU
	7KwxR2FO5ui+Edo0JmrmppKNbhX+y0VmMLlipeZnG0hxWP964/DCJx6Za59R0wME
	1tVEhA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r3b230-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:11:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso115877785a.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141867; x=1792746667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIOZtlc4H5WdZ+JHF5mX59cxfjXnkubowR3t/yD78FI=;
        b=ApVN/73gGE6oqQP6YWv5XVIEzCk8Ofeo3H7/nQF+TtVWVGt5eDrX68n6ShIt9O9cPk
         9zFnqwm7hDd/IN14YJjBEBlBLuOTsYLcM3KTVLFeTSLvwuF9zJ8FGYRhGe/knFYKYxPa
         0KWQHaA8+rLNMDdJ1bnLWV4winTbKJy6vW8mTsW6T6vKHHSb7CHDsPtwzw8ZawJyvVSn
         45T7umiVBygVUUMqaG+TOpmz5GFKXzgBEX1WOomW69Vg2QTdTXxi/yS3wFplvS+ErEQY
         BzO1YCWZMrorx5yY122hrD7bvTbdx3rIFuVeptTZbjhtapjEGObUMRfxlS2lXom8ZC5C
         8K9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141867; x=1792746667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QIOZtlc4H5WdZ+JHF5mX59cxfjXnkubowR3t/yD78FI=;
        b=VD0pUIdVzzrQVLFVRA5pa+FenyMq7Bg7xzwqYsFIdMSuIt3GC5d6u8YEZTsUNLjYfA
         h0arFXN5HQpNm/H7oEyvrUPpN+CFLViNmVLm6P6Jp1dRdbqjFHVMsJk+UUfDvtFhpqgT
         t0/Ifd72KYt8CUgBph77ZA4Bd1vfv2Ds+ojiT3b0sMru9OCJol1qjZ6XGsOvW1Rb5XO/
         uWIMtMEXy6e5qnDJA28TuPyLm+GHaMHiWCaPytXoLDyoPbcRwaBPYq7OpeTitmIcAV8O
         asv99dd3us1PCLSSzATOSu27SHrUARCj/KbAL5dxBxqM020b+9pHYj6wi8y7Hx1MvqGh
         l5vA==
X-Forwarded-Encrypted: i=1; AKwUvBxcn5b91V63x/HzJApNM3zHfDZ1ddvDZK4jZKrQ42wbvk1dpQWoUJVtepm1xkeN7Gi7eXp5oUWEOwe1@vger.kernel.org
X-Gm-Message-State: AFq9FYI8RCi7oUjXzdGyzQu2oBdN8ULhDF7PMrs1HJ95auYul3U38Zqb
	7oRhkx1dl5wBqLdVdbsY1b0gQe4dEmMzdYm4BQ28Yt/I9WF+kRwfY7g8oL92KEMRcmip9z8HELu
	dmDz9OF120Gnte1937nPIthhkHhFnRVOTDgIcQ+44BblQIHJUyyMrJxkdoT9/esvX
X-Gm-Gg: AYBFou0H69XpcpRo/6HOgc7A8S0eIxjvXT63okNDLVg9dYW8L0DoC/uk2XZpGbuGDX9
	Ld2prKPUVVlEuH7b5LhAL7HTARtRL1WcEGrcwsHqsfy5wvVsrdrHQ+tijOK+rfq95tNN+sRh3nE
	sY1eHFC1hcWTGD7fhaVYp1q08mPyPAjTh3oQtYaASsGfAlmWFc6ljwPXBR+iZpht/bQqnTRP/70
	iyNjkeXpyLu95hfzfdtoWvHKSPLV4jAhllH1IHkD5tlH8+KM8lL3HeJiu8vGEUsYC5k4TD86/ud
	lbwO2umQRYC4es1K5qNWNXB6FrP8fxtvOIqLedZ/rj9p8y2bdSy2hSH6YvLcNy2x9BIXkGc5jKe
	rme3lbR7HVLOiHqmRvJdXtg==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr4105011985a.2.1792141867016;
        Fri, 16 Oct 2026 02:11:07 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr4105008985a.2.1792141866485;
        Fri, 16 Oct 2026 02:11:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb1c55sm54193766b.74.2026.10.16.02.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:11:05 -0700 (PDT)
Message-ID: <e7768d31-a6bf-4ac3-af30-9de313b16ccd@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:11:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
 <20261015-kaanapali_dp-v2-3-c15cb83d9140@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-3-c15cb83d9140@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfXwXnQ+ecGNrQD
 gDT/KCev0ffP5Bcik+OhM8lSAaqJkBYiDB49y7wucC7gR8/IkV/+03+utcVqIXOlOo3lxiQ5ZHL
 ijfysJ4O+WzK4KoZsjP9HNyXO29xHD9koDzpiyg8Hm0JFOM0+mPNegYzPg3BE5eUnAY5p/tNvfp
 TEMgZ7LSxX1KoLN3tcfv4WTCG54zZe7ZNOn/seehAeY+nf47WI/kxiMtW1xWZNSau/BZ2ME3aiP
 U/Ma5NXy/jQEq5P4EYSxwVFHfb48LwcEtkGvVG54XgXw9xT1kegpkMz4TH3tu8ABYP0M/A0d+Ga
 UHeM0p3dsbOw76fdqms/PnunHCYiyFAP4AxQXa6RJfJEbXJiGjfJxC7IicwD8YnI189N5OGBAlU
 wxTSGU6+W29a7kjENOkLwSh9XxYyGPP16arttIIBMo603TtaxiQ12PtXroY3V8I6/an4shfP7M5
 S5k0DZPQY10oXMoMnjQ==
X-Proofpoint-GUID: JdiyL6b3TvKs_7qBUwnTN8X9Ehfo-20C
X-Proofpoint-ORIG-GUID: JdiyL6b3TvKs_7qBUwnTN8X9Ehfo-20C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX4XQagJQL51Kn
 ZbYtxmIG/opmV42pvFlzSqfU7e0O+5EQ9c6AJeH+999P8TAw9IMzh3Eok/xp7+/BTx2Sgf4ykmd
 o7UObc0m0KHNdTZvo7WXzoTKvTT0Fuk=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1ea2c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=dzNGixxSrynEd2cHrbYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160036

On 10/15/26 11:54 AM, Balaji Kalkonda wrote:
> Add the DisplayPort controller node, including its OPP table,
> controller clocks and power domain.

[...]

> +			mdss_dp0: displayport-controller@9ad2000 {
> +				compatible = "qcom,kaanapali-dp";
> +				reg = <0x0 0x09ad2000 0x0 0x10c>,

sz=0x200

> +				      <0x0 0x09ad2200 0x0 0xc8>,

sz=0x200

> +				      <0x0 0x09ad3000 0x0 0x78>,

sz=0xc00

> +				      <0x0 0x09ad4000 0x0 0xa0>,

sz=0x400

> +				      <0x0 0x09ad5000 0x0 0xa0>;

sz=0x400> +
> +				interrupts-extended = <&mdss 12>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
> +
> +				clock-names = "core_iface",

Stray \n above

Konrad
