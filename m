Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F553FAE15
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383772; cv=none; b=WGVMwbcurMjxf3Ekgmmv1qm+hsIgTUeIyqjQFYz6TVx9GkOYmPGPkXWf25E4HYFoKA0pV30YJgq+xssfB3pfAxxLslGnL6kTTBO14RaCCIAdnTvvanw7g+MEWUBSTZWs6AwU4YfG81GscXa6e8fngNHG+cxmH/cOnEXuuB2vHMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383772; c=relaxed/simple;
	bh=Jtif2RA99xqemNh+pGm5sjKIjSLoxIXcRkKWYQqcSgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XX6ou4afF2QshU9t7U+d6oibBX/+xMt0czUDPAZprS9tE2g5+NTOmOYGRzaOfHYkY/HFFNepq9+zaBnxLwNdtY94vXZ46q0W/Zid2mUrsmu0wBsJ4MJIWY8DnbuNUicKCVf2in/Wg+Il58K1g3mWhdmv/tMGdT+7v3Zk0S4EZ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9Ca1+0J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMi/vWvg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9Ca1+0J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FMi/vWvg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm0h3727550
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6wnE+gO60PuqLHvAuGY+mC4+Z9CstvC+Ue4Va2dTcPY=; b=Z9Ca1+0JZvL3kCqp
	5QuflEKmVseuabNwl5GDt8hEKQlOvSrjUllr9DmKZqM64LwjWA6zNH5zJiXpGk5F
	0nku6ocCWH8BuafjNIYYWX+/BqWX/taGckCaToKaO0z0GKx+ySuN1DrGp6E+vyZy
	THk8cDAaDwu2GEfaOOxgSKdF8BqIHqcFL+gFDpsJo+RIQ8d971Zwda58CuRlFmN3
	bE4IMf9IUH2t6LZn4KQ0LxLCDmSv3uVW3o/MAGIXcGNtauxKWi5/KTsV97YgRKKQ
	51/wZ2emPE5UBxs+BiOjk9s7rJljDEqNPFB6c3BR30O6A8qltOttpGbAkc6/Jc99
	A+7Y9Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rk0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:02:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e8d3a2d3fso4860166d6.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383767; x=1789988567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wnE+gO60PuqLHvAuGY+mC4+Z9CstvC+Ue4Va2dTcPY=;
        b=FMi/vWvg/4WkjYvbjj8BDWbwMruQ0BCLo/wZpnFYiSdNRBVFxHheo2QoW2kElzIcXW
         DMlQ8j0ZKQBZlXEAes6mt+8LhfwwpYdk5x2IVMfPCrja+fZEIR5pK3QIv/kycUBKaMjk
         3xSHzMWcsRFM0sWnBzAieHyJ69Au1ogJoFC4G2JhtMX59Hrgm9toUM0FXUJ21x+AbJE1
         YQ7Rg7nh7T33yymM2idnMJXPWxQgGY05gSTxCHtjzTevlLOHu0HXAbzFZVElrB9jJFpn
         Kul4lsJ/D3zuZg1CnxyhGXyFqqOorMU3HFzB+u+UjUB6RLObAnJGotAp7kGsY7Ls7ARV
         Fdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383767; x=1789988567;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wnE+gO60PuqLHvAuGY+mC4+Z9CstvC+Ue4Va2dTcPY=;
        b=B8Ww9ApcLzYGnfLYjL6tlFsapywLh0yqyCUL6xHlpZBy48sXgwRV+Af7tfmBt8U6Mg
         nYEexoZp9AxkWOgtRrKosguw5qModzcfLJwGUVOiyP6xJw+KYqOeF6mkT4CYF8BinEQa
         xKO1rbJ+QRP3u1avyzOwEjeDPNbQ0oktmskCEqMG9b8Z4suV1zPKfGyOz54yRtIfibDe
         HXrdfZvNrY1o4g9cKNtALc4G1pFgd4JgnJ+HZx8mMNtIKzrkXjfhqjxCRMg+N348KoZK
         xV0LMkXkL6ebW3sJaidYPdzbC9K7m3ixvX/t2OFbjzaE4TZBLkXWwoEcq3LX0cu717aD
         xgfQ==
X-Forwarded-Encrypted: i=1; AKwUvBy75/CmFykIR0DBxJ86VP69e4cgesIb33OoihzpAN795M0VB+ZOIHQb/+mkrJbZHhEqBmrFJu/rz5t0@vger.kernel.org
X-Gm-Message-State: AFuF++nYf2/957mUn0ffStF6br0MebZ4IU+t7kqaKqo6p3iqSZups3D2
	ocUm6piJnpEjNsvPDQuXBiGQE/XP/s9DfH9JxJg4Wlz3LzjhbGTXCvihafVRCwY/tPhKoAuO9V2
	0gKYqMTnY3lR1YHFm/1XhhS+KuKPC9ysVsoYDbMq6t5B2CWt5w7Xc8ISf2S2krq/p
X-Gm-Gg: AYBFou1Ya0UsSRXYrP0bcyvEAA7w083A9EWsLx/EFtKp8nu1nAccpzJRtZ5E2RPxkX0
	RL3n8UGyrZ2ryNr7+0dgbl+94U/nuQzipEsJnJCgUYSzsZpp6SHR+MY0PHK7T9cZ5YOyFyX3fGI
	QjtH7MTNpji8BpmDBf6f4EDyA0EzhO0qT+FMP9vd3KKFb4uTd64MU/SJYtv+XOJyrYaHzwgDR3D
	Mxo0H/AIJZAqR2ogaJAFUMTRCJxR3vhTRfYzfxAaw15vcYvkPr9RyF1PO6di8e3499Ywt0pbkWh
	Ap1l93/twf2g/wTwpe7fpQ1tCDL0TebASNYnJli6aK54calUPOXaLF1n1qLr5HiXtk4oBnRhfgH
	RpS53m6acaKqn3QpNYHKYew==
X-Received: by 2002:a05:6214:4283:b0:90e:9aba:f095 with SMTP id 6a1803df08f44-9122e6bc978mr28865516d6.5.1789383766680;
        Mon, 14 Sep 2026 04:02:46 -0700 (PDT)
X-Received: by 2002:a05:6214:4283:b0:90e:9aba:f095 with SMTP id 6a1803df08f44-9122e6bc978mr28860336d6.5.1789383761856;
        Mon, 14 Sep 2026 04:02:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5968cf3sm4024671a12.31.2026.09.14.04.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:02:40 -0700 (PDT)
Message-ID: <ee193823-257c-4ffb-beea-b3e78996cae4@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:02:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/34] arm64: dts: qcom: sc8180x: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-24-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-24-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX52bNIlLslsAQ
 kwMrAG0Kmk2pCn/yY5QAhW2OeWzWCjgsg7Mx/q+QKpsNaF+qbHlMDNRIoNIEwjxB9kih6dUu3+o
 T8F0gpRgVI9s4FyWyCRVvJPWkBkyDS8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX4irLAfnOPPq9
 TfAdC7j5dUib9bKxnqClQC7LbE5HPRlF7nMjxzm7kxX3JlB7oDUGin2C3RdMiAsV/joA/zZrrMY
 yefmlJ97ZVJeAmETwHrk96zRmT1ys5sD++l5t5mGKlQBA6n1lV3eEKUrw6Gq3sYiySOaiuVhIhX
 MRhO3rV8QIbFZcsusLhL5+WBcnoPYTjfdf1D5wR0+Y+bT2K6H3jsttIBBMwZplQEnNorT/IWtQu
 OTsQcryaXvMbTWlsVAfeZP56Ohomf9HC0tVxIa30ZQVgSqaITyvyg/3cDb48fUjwzBXZsord4gO
 7VHXqtdZlPR4IEGKKQ0ICUUQaXNcagmhhzaMj3wO3ESsbFD4XzkscO6p+mhZPEpxFWYfqVapJug
 j/pjAdEIny9i0KRCrLklT3tgvdHiJlwjV4AjTKvvFM5V/fQremhkyM09GfxExKBgFkrLD2UQvRg
 KcEX5L/5yFCpqgHt2Pw==
X-Proofpoint-GUID: PXsXxjuoKnbRoDhS-TKQmCIUR6gfMXJo
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7d457 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: PXsXxjuoKnbRoDhS-TKQmCIUR6gfMXJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0, pcie1_port0, pcie2_port0, and pcie3_port0, adding
> labels to these nodes to allow board-level overrides. Move
> perst-gpios/wake-gpios from the controller overrides to the
> respective port nodes in the board files, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
