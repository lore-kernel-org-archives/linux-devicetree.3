Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CDC301004
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130747; cv=none; b=X0gqZNmMoaz2Vj4BpNdhKGTFtTw2Ca2mmMGj7+mSeplWPDHHsNLulw4YVurZd76aOvPqpulKbnMXHG43rDYsfLz1V8jNu6+SvHBaxAN7SIJYdhbLTT5s2oUBwoC2nZWSAhNxZdPll7AshodptakgQW7pCj/GC5rEtenedTk9cnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130747; c=relaxed/simple;
	bh=IDAQwkwElewdfh6Wf9mYqA+Yy4/BfY0aRhjuZlMQGxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdaxxkQ5qlpn8qJRvW+bwvbz4XF7Qcttlxag0vILIUfZdglXE09/421lBwXwOOzo7hv5Re9LKlpguzHpVpAawH//CbzyfHfHEJSYc0K+sdlyVuVYnkMHN6sZj+GWDxYRuesFDmg5vA0j1BDc4qznMKUDGXsbd1ti8J2qidIt9eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dITy+Jnf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YE8g6K/H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dITy+Jnf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YE8g6K/H"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAoFQH941026
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HeV8efjPqPS9nnwVB+vE4XQRlHFFHwy9Uis9TmOzdyI=; b=dITy+Jnfc9wiJxZU
	fDA8G1vgHoDCdn36+p9d1IX1URvQqd7CvhF6iy51qfjka7zwyKhY0OswHFYui9x8
	vDVCD3aIF7fkqZVNqpP8cNj6IUL4mLH6JdWHwF68lgyrb8j23wB2Io60Pf1FcaVS
	dVJvvSYJTbTKDS4xc0Ec2mRuNg2PanCb3TIfk7LZeha7bJ7AG55vqRvYNzYspOj8
	3HwvxOOCur3uvkw9EdtnSqbOFvzljTNKywMtix3LjFNWxKGk4cLMEF3poUJ+FSUd
	KNBZuRGqaYlcBN3ndovnvZSv/cJFMpuMJiG4EV3UMZJHQtfny/YsWzA5scA3q0Ff
	UNo5RQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb8aa0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:18:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-920eff1439cso30528885a.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782130738; x=1782735538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HeV8efjPqPS9nnwVB+vE4XQRlHFFHwy9Uis9TmOzdyI=;
        b=YE8g6K/HvmNAC6AllJMRJEGZ/jw0ql8+cv5CvP3L41bdtd+TLMx4ZqnYBxOHbgZfdT
         jxbCe3d+gATT3p6Q9OJipZQlfsT5XZ3D00fCdPXBlQ8NZOlcUewU7RRYX+le458mwn1n
         crgq79PtT6aholf5t99Kv4TQt5W83t7RvCi+6xp4VY5emXqpq003C+/rbE3XaSmQXXtR
         1Qfzxt4EquzVnA33piLJK3lvfoJDsDcfSENTnOF2899KNFkiDTKFXZi/x6LowRrdhxTV
         Ss0+b0JWU48iLCaVvE9GvP2bpaJ2lB5aVJJH8P4VDn+3wcv6JEmEVHYinJaG3R1HHjY+
         /Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782130738; x=1782735538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HeV8efjPqPS9nnwVB+vE4XQRlHFFHwy9Uis9TmOzdyI=;
        b=KWhgvRu+wmYKWIah9uud3Vcn0EExGTx0gkCFWsEzUdoKVVAktW6gbd5MN6JdkZvGKv
         Tzz7wwrRtz41+kd1fzQs2zrO51cTOO4No9Y+qG4tHLk4RAfmpSNAf+2xi26DYNjhlhB4
         p/GeH/zs+uh0f/7KttOGi8X/uqjjuS13v7wTyGC0U3MQuYtXA1hq0O/9ODilGQXiNZ2G
         iiYo7Cnl5xOQMu+Ke1FAiJIOVx4PC//F+ZkRYmU202JpvyxnKN0hBx2PgoBqEpYRtM2M
         eFKqPyN1DcK5L26yHvj2oUBEiqsBXBWpSzgjvgNny2aB70LfKD9Od3dxUutYKv/znrUY
         Ea3g==
X-Forwarded-Encrypted: i=1; AFNElJ/5V7vgg5DmXNrRlN7QJ4e5AuYGaZj4E6TOxdcKjvzRlvJ8BkAvYewDA95ygL3EaPONk8jP1iq4XKSz@vger.kernel.org
X-Gm-Message-State: AOJu0YwbXaxwhPHqVKf/AL+DD3srBiK/7sjbsoZ95ef9kwa6XcnhKcrc
	pgJDW1u3DVXhNDPye7uMmrw/k4AJkWMffpnlXi57/znrNOym7vF6Ys+0HBgoGyxXW8bsjgkAsQk
	tOtyh5mqF+LeGFOcCkYRS0eYVoqNdw7EeyMoLn7lhkNUYMtRfoFjb1GxmFRp8HWVI
X-Gm-Gg: AfdE7clBhYAw2xajb4z26zPXVLyLyUuGSVv8/dpvC8wK++noiimdn3StbWFQAsoHeq/
	G/uV9f6Y6yq+yIa3uOo1C+6GF/eNSCExGqWqS7BFnjdsjBN7AzN4lssv8vCOUuNn9Hb/YD+zGZb
	BqpLfTJKhLhWj0qHnA7kbao9QTIvPNaykeVAdbcOQvRw+eYtsHZvdL6hJKOoWJ9QamqonZn4Ktj
	wXe6UqBOicU+NIWydNL8hQNbqZ3GujyaxxuqMAf7zuCyPYkfxHSaMt+m4+Zsu21xFD0gl4vd7AI
	/6TocktpKkF3A2xS+GC7H+4hR5i8VYW2/7+VvZluJ8IjLMIY+g61I3nWvGjfCWCXP2IikRvRam8
	FVWCGAow5pVCqLdAnLXgkfONPlsh8Qv7nMjE=
X-Received: by 2002:a05:620a:1791:b0:915:79da:a898 with SMTP id af79cd13be357-925cbff2a89mr6047385a.8.1782130738218;
        Mon, 22 Jun 2026 05:18:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1791:b0:915:79da:a898 with SMTP id af79cd13be357-925cbff2a89mr6043785a.8.1782130737667;
        Mon, 22 Jun 2026 05:18:57 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac9406sm349372966b.38.2026.06.22.05.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 05:18:56 -0700 (PDT)
Message-ID: <e6c0971b-ec41-4914-aa34-6caef51d2327@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 14:18:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-7-c939c22ded0c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-7-c939c22ded0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEyMiBTYWx0ZWRfXyoAK0CIK6jpv
 mZu+MxxQeWv/9NtHlfGiyFn1DD3Y7TdJ6xxDPiu8dUabEFvbjpX2XG56S2OvwJvF3Uu9/t84xxl
 TMWAqE5bCYIFWVu80MyhkZj6k4EPaGQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEyMiBTYWx0ZWRfX9ZUikw5D2/8c
 Eh94RqV0p4Y+29sECU/X1OfllSlhvt3cLAXcULPEamcLesxzOFMVhy/yVqoWdhk+8UVGZXnkZim
 tx3QS/xgkjan1hF6WPxC5ycsE5KAnJx49gKnIS9SYMd8/s7KxZT+QZkwUMAlqdoKP7K4CEtfzKt
 JiZbP/TK4BVnbzJAhgka/H2arDnQisZsShMrAwIZTv7shg6Ty7YbkxM+Z6jdIcKA7Hfiq4HS+Xx
 rEmZ0rRdITN8e2Ytl/Vgcch7x/JbLzxEXeD9c/9rPNJ8x3gOKuzchtAHRtDB8vUDgDPLZpS9NRs
 MsgpDzfTEV/vn90keWzJpWoAQ52al4unXGrmzmKCc4A7ReSPiIibFSTX+SQdPRIix2BxK2gUMnQ
 xde5P7pmel8NaZG+KA4OXpD/yzOlXM3r/lmhQ3zRyDNh7q7qGTrgtERUm/optZjWK1jHNZy+Fhu
 odrAciFXFYeKHVl7pgg==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a392832 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0OB78NtceWqr1_yVbOgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 3UoOfXL1yanc9aXSbD6TO5D77XiexMUy
X-Proofpoint-ORIG-GUID: 3UoOfXL1yanc9aXSbD6TO5D77XiexMUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220122

On 6/22/26 7:11 AM, Qiang Yu wrote:
> Mahua has a different PCIe QREF topology from glymur. Override the TCSR
> compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
> LDO supplies for the PCIe clkref paths on the CRD board.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/mahua-crd.dts | 15 +++++++++++++++
>  arch/arm64/boot/dts/qcom/mahua.dtsi    |  4 ++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
> index 9c8244e892dd..8b42f5174b31 100644
> --- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
> @@ -19,3 +19,18 @@ / {
>  	model = "Qualcomm Technologies, Inc. Mahua CRD";
>  	compatible = "qcom,mahua-crd", "qcom,mahua";
>  };
> +
> +&tcsr {
> +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
> +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
> +	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
> +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
> +	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
> +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
> +	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
> +	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;

The supplies are correct, but QREF uses refgen4 on Mahua

There's also rx0 with a 0p9 supply on l2f_e1

Konrad
