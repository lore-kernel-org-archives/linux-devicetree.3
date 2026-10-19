Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025E94EC649
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411728; cv=none; b=N/g7+/OPCV8eQ88B8C6hnOpXwAitY7ulkkSdG0PvnrweWzzOJDbHXe8aQqe2A5hLLP8RhNZFzVQnEpP2zxC3lu3insQXzx1+UjPw0UBVj84BNyxBJ6IsiYk0ORhlxEumJD6w11N21ntQdQ8oxYivmiQcJHNLRGgIk8BwX8E1E6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411728; c=relaxed/simple;
	bh=CQ+LxFQSBmtnuVFJPPeu22Sd8E/FkQAEssKQRfoeiO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iq9Z6PKiIC235K1erbwi3z6vLfMfBqMIk5jRJeSXHTyXbTTNMUWYKml5SBJ2hGCyJCq/KkJdC7J607GD4r/xFeJFx3UQ8/22Q23JUf1EESc5EM1E3N97svXN5HM/AV10/bSxanthapi1BxGElchO2y6R/XlMPKJ7rp503LdbKSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8YQzDLN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2Jbyh44; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8YQzDLN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2Jbyh44"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OofJ3256577
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MPLcVEpabOhDQf+ydVhM3A3ikEBH8XfqoAA71Iezzx4=; b=F8YQzDLN93moeEZX
	KFLp9Pu4x3VfjGAFjDJxGm+FmgzN4G1bXSJKt2/YXvZT8WMIY+J0Cg/Py5wy48wH
	oRRmI7zzrmeIFP7wsLktFj6LOL7tnRkvLvtoXkjynydUqzHob8ynRMQI6qN/dgxO
	DCkNsIZFpNGl4KzbKI6g8sTMm2uj634y94kRlF1nX3FFeqBM8JLBISRVa1ZfqMM9
	I7gGu7bpjnGz+/D7Fvm7c0SgnL2EXksv/9d+MXjcWKGuXYdNwnx9/ApZUYjteqX0
	xBLwZ+yNLJTYmQ0jVGACPshw+guoFF7z0aTQ7eMwUVIO7MAjjHcsv1ZUk04s+3+W
	SJIVeA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f8yyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:08:42 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso42158137.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792411721; x=1793016521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPLcVEpabOhDQf+ydVhM3A3ikEBH8XfqoAA71Iezzx4=;
        b=V2Jbyh44pnPsArhAUcvdIKn4kbN1IXKzGXsZzPEvjLovBahKYZ4aYfp/a8JINvmANk
         XgznrwpPDdRAvUYsvSHiUwkOTOvKCUVuN2PAnfPGWzeTGvINbb5Hnc03klrRyVsZ0OVl
         Q54UE6lPeDBQL8vwytJQhSsinDYs+TfxcWMyDV4drFVD/fOOuOzDiPFkSW2aZp2uLukM
         ua0N2f/qFHW2Rg8upZrggRz6i0g8XakO+eQCOHKZMFNo/4UAiWCWfpm9ONqasIQz9qgV
         92nCBkEsCxPD+VFBREG59hPaMutejh9NwxGuIs7hk8+rGhrQMYCCKL2Mn8mQPIOuxbtl
         EZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411721; x=1793016521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MPLcVEpabOhDQf+ydVhM3A3ikEBH8XfqoAA71Iezzx4=;
        b=I256u8So/Ip3+DwkFsS6V2rOJji24us4xLWK0K1mDsqabXc5NPaOgwE+FxoLDoFnhe
         vf0JMjzc1WTJ2Ux0KI+S2hcgc6mLpHdO34yGHkw/PHY3Np3yhWOEkDxY+jcZTqe9jqA2
         Jkw/Bf8TyXZRcykjQ2FN4XZYUq/+vT8BuGhX6EwavnSipLhWMtMg/jZ2l0MTIZbf/qnE
         jf544XO245QiyaAHdjbvG03m3+rGct/p6MvLlb2agszvi5cL+0IPcGMqLtD7mPk3JuUc
         4Ll5fWuEuuZQplUH/DV7RVBMKnA+Dh2ydfGWGNckYugs8irovR/CNRtCdPkt9/IDtMGv
         IM7w==
X-Forwarded-Encrypted: i=1; AKwUvBzIPF6B7D2HY8gF/2F4MdIf/K905v+H8ZLZJxtkQfITMs6QVAsDkxCMfNDyDTSqqRY8IPb+go2F/vZC@vger.kernel.org
X-Gm-Message-State: AFq9FYI8WJvjJ9kPdx/0ZWrLLxdExVsaYqJeL6dSnwJ4YNqadrvP7AUQ
	SsE0/SeBoOALNu8pPrvNUioF3U1wqoXHQBalCauHuwfRLNFZrW+WTDz+9plSGEE5wQ2vweUGtep
	oEIWSCvWSGM4c8iDfdHPofs/T6IexvKn7qDcvQWye39leXzY0sDFej1X4ZPugyYEq
X-Gm-Gg: AYBFou2C6NS8xhIO4S4BjxDLVhCE66LAM9sRNrOUx4bqTcKKPEWu53fYMw6XNNz5pTK
	U/DNo5OzQfIh5rIMgll9wEHHLL5kXfJ8CpV8Qn1TfdHboGwiLhttVE/vdDD3nwfUkjxHCYctaxa
	1wpjbLK4SwUYalpZMWEOkbLvGat1d0067Z8KtTTFnaQhIdzuvFSIP/6uS05ph7r32UDo7iwWvqb
	W9h7gQ8toEdxrJwIJ4vZZ5VFjdphDhczzbrfrN420yunU726se+9ckPiqNIWu3C/6wPfTsTrHA6
	PyTr8+nSCJMSR6ESXT3zwYWwXizxNOGjHzIO3IVZViwASCOzzmWlgQt8LnkJTGYincvX7ZBsmnv
	watr6+5SLGfqjXGayxr5AUw==
X-Received: by 2002:a05:6102:418a:b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7cc36731b1emr1233388137.1.1792411721003;
        Mon, 19 Oct 2026 05:08:41 -0700 (PDT)
X-Received: by 2002:a05:6102:418a:b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7cc36731b1emr1233382137.1.1792411720491;
        Mon, 19 Oct 2026 05:08:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32874bsm347024866b.9.2026.10.19.05.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:08:39 -0700 (PDT)
Message-ID: <f9de345f-ae9a-450c-bd49-3598fcfe3137@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:08:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: glymur-crd: Add PM8010 camera
 PMIC
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <20261015-glymur_camss_dts-v2-4-e7b1f403146f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-4-e7b1f403146f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tIl3p8ItybO3gmcGU2LeyTFdKsypBnyW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0OCBTYWx0ZWRfX5J/20NE22CPa
 Nu7bBRtJ+tx6RWIh7Rpd1YiBjG8jjiTNQzuECYe+ENsKs7xLJLbEyCipDIfzR672S0d5KVjAoWn
 +zVd3qEyIxkQwCWOZfVyyirz30i2uQPy3IpqlcoBOgIzj7R20nsIdcuo8ENZEyVh7YcSa++TTov
 Upu53OqZCJ/B9owxTYBON4nXUdYJISSLRyLFJjZlhKJQbsN4uLUjvdEyxSFD3Xjwa6ZPniMCKvk
 apOZpahpFu4RNXSbmakQHGXfMhrwqsCBdRAFy3zilIprIEJ61/vGqurVh4hHpXjfl/x/OSRL5ux
 Ub49TulcdSaXTck7w+VfjBPqgxSpXooHgPl2ufY26XfBOHgcFdWPh/bYhcUWdBDbXMWk5yZHY8B
 c4wdkz5oNYDHlvH5lN4kOtH9il5LHThu6YZgJWnhpjRnjb5Zk8ik6sCyuoM2C6578k5tmS0RWTQ
 TIzF+UYeJjYlfYndI+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0OCBTYWx0ZWRfX29iHquUyrbyO
 gLetfdonBfGbQFfhxiCgIAv4spxH58htnVfM3o1ElAdoHV0Noqpt3HLdfs54vLSAeNDAhZTL7db
 cK1z874iAOuO1k77diyVEEujPwD7jKg=
X-Proofpoint-GUID: tIl3p8ItybO3gmcGU2LeyTFdKsypBnyW
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad6084a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ere-zjln2nqZyYFjUl8A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190048

On 10/15/26 12:52 PM, Nihal Kumar Gupta wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Add the PM8010 PMIC node with seven LDO regulators and pinctrl
> configuration for reset pin. The LDOs are needed to power the
> camera sensors and associated hardware.

[...]

> +	pm8010: pmic@8 {
> +		compatible = "qcom,pm8010-i2c";
> +		reg = <0x8>;
> +
> +		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
> +
> +		vdd-l1-l2-supply = <&vreg_l6p>;
> +		vdd-l3-l4-supply = <&vreg_bob1_e0>;
> +		vdd-l5-supply = <&vreg_bob1_e0>;
> +		vdd-l6-supply = <&vreg_bob1_e0>;
> +		vdd-l7-supply = <&vreg_bob1_e0>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pm8010_default>;

property-n
property-names

in this order, please

[...]

> +		regulators {
> +			vreg_l1p: ldo1 {
> +				regulator-name = "vreg_l1p";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <1200000>;
> +			};

Shouldn't this be 1.104 V?


[...]
 > +	pm8010_default: pm8010-default-state {
> +		reset-n-pins {

Drop this inner node and put the properties directly under pm8010_default

Konrad

> +			pins = "gpio106";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
>  	sdc2_card_det_n: sd-card-det-n-state {
>  		pins = "gpio221";
>  		function = "gpio";
> 
