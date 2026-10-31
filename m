Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437378;
	b=pLjyR83HOE3xWwXb1wSXvsfh4SGU6NkMZ5YxLJHvDMjE2Qch+l81HE99aCZy9N1UhL1l
	 kINboCJVk0n47uPDtILg+48GRXAnj43cGRK+ZKFnZyQVU8GdNtpTc2coUNj7XpoeKH1y3
	 vfvYaBZit/79k8XtuvQ1dTb0phht4AE9QTnf+MZKIKCU9PbT5OZA5ORlDqdd90qJKcM+0
	 pbVPfii+c9+kXEw2AvKjXN2Sc4sfOJQNpX8jtk3kLoSMKfPBo3btvdPaIgPaqQ0bAsFxP
	 NV6P8Eox1JrX85GkjDLLs2cE1VsRsYmR15kemQU97DVi5QwoULr0QJBjbGTtAP0d8BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DWUarRjMNL3pk4YmHhale63Ch3og1P+0l0Zj6olN36A=;
	b=iwDbRMIlzmeaY7o1eWboewfUdO89gKGUlVRV+GRLx5LolV/EFSA9mhNdQlFLnx2zRgAX
	 Cc6Wfqul1Sq48ZjwPGONHC0CbFo1+o4o6Xf4r9uqhHazBpzxwrRLvsyQdjyzSjPlHJAeK
	 sRwoyiuCUfXYhWgCbSWjnE9dDdzmNKXn9rYaiFVH0sEKqXw/0D6xzLncOP40H8Byqg5xs
	 5TKHEqrNE3o/fe1fKg2L+rBWHR9B99hdgFEZqnGbCOHaV6UBYfrZzTySaGCMZCaEaqacg
	 0aXllReqvO4lZChZhYkQmBKuOYgRCqQiWOda6Zml+kGOdtE7kHJqwQeMM2GFHoZekTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ia00+gGJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VC1iyak1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EC5606A323
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1EC5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ia00+gGJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VC1iyak1
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4aR0F1756972
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DWUarRjMNL3pk4YmHhale63C
	h3og1P+0l0Zj6olN36A=; b=ia00+gGJlTW3tAOaqlOsRCW65H7GMogwxwemGvMT
	WN3XceUXJ3fun+/RFk7atu0Vp9dW+E/IM2acFHcRlaa0wQ8RPk0R7rPSjNAlum+A
	0mbvo0LmBMsByjxP/s5ukiERLdBe0WT60u63rdlmwYjOAT6+MM64wZdxBRoPNQFp
	fn1AReoJZNSOG+Llb3kI6YSGPc5eXjFjpjc7gj1l+IonPhSFG4fn3EKG6BeYLDT9
	CosRiKAeQjBSUwnDEz1+7F4SZOnUO1Jjo/XMI/zHMknbKhfBsWd67BVIy3Wn7OFo
	9mUA6RjFAXkTGYFbay5dfLJzEx6emE3oJXPrhyr32CIUEw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxgs8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:02:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a223755e4so6011438eec.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793437376; x=1794042176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWUarRjMNL3pk4YmHhale63Ch3og1P+0l0Zj6olN36A=;
        b=VC1iyak1+LaYgB+s/LlJmDYNbv4gBWfqwyKTzEBLm4Ol/loWh3g6kIK7Gyv8GX2eeS
         Ne+Qo8UJbws3+lM87i2cd+RUdjL2DkjrUG4ujBYjVSzJHqR4ViXheLjo6FrdqiARnPQz
         VsT+Y67KLF3URLqH4kd/kN/b2MHFGrSuFHP4xaZIlyEXRMwn/aMFFydMUgks5KcWW/nk
         utfMNfujhhqMUiHACYX35WOtHIkc7vO4leB8qXvo6zQLZAbHf2TfdDFMeYU1AZODafzY
         lBhwieS5SlpPC6XzZROwT3hCubBjxgMX/RYqJM+h6B+RtiHwQl3A7G65scuHw1HnGzix
         ceLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437376; x=1794042176;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWUarRjMNL3pk4YmHhale63Ch3og1P+0l0Zj6olN36A=;
        b=E1LG0nmTLC+Jw4cW0+2TI43IqM0/vWB9wEwI5mhJ+KKrO+gn6Vg3RJxS6k/wd/fLry
         RzWNgdlfoKkZ2tlCNojn8Rt+NGl2UDa3L205TKhj6fGuZdVQ0nQelsMz9RYRzWizSb72
         G/rVEUqMi8gA1eP/yyFgWTRasmkUanKW1uObT5+Vq8lYSQWWbBBdhH7on4uKyTZudmMg
         MiAiPpSBEko4wZS2EsKJDjXTF1zrqrrDJfOLxdhm61Ud1EZd7RyRkL8I9e/VRmQm5spO
         d6uNjfpk84U4DntPQANRX+rcSAayUzLW/+SFmlrf8XzkYwCQd+O1hgAW23WwI1CO+bZs
         NF1A==
X-Forwarded-Encrypted: i=1; AKwUvBx5cd3jfcirbpnPq3xAej0JvxhbcWCCz3X7QyFIUQtpjF0qTxTl/DnPTsM863Tzd6Db1qWLwjbjzDyL@vger.kernel.org
X-Gm-Message-State: AFq9FYIB0sQ/dLvg27r2WTCMWvZOMYYebVUHjDxlDiRsvXCosDLZpeCJ
	LggmobMoXTuEkclZdmosrHWkf+BKC0zOfBScGU7Bc946ev1/jvleBe/9fWqTAoAFkdCWBdfyLJF
	+qRJHvoWSK/M9FYM4OoizBRLDjc4Esuz5cj2NB4n8QcTQOvTdZBvwwOPmjAjBcdZP
X-Gm-Gg: AYBFou28TNQ+dOrjwlghrChj9RSJxNkhmkQYjZYckbEi9/Ezd8JbSAPwZLULcXWpP++
	OYvTa9qN/9/NZw8LhiQRsnuCBKTE78DMUxiE06lpkkBkuARH3t4p3llEqBmdphrpEpYQv8i8MHj
	wnvED7/MV4GgffvndPi6O0/w4ygdveSsTNqKIOODmIRSbOeBCkJwOgRknGyi/+JtZVWGAhVt6XK
	nXOU3QLvASt87S+VTDdyLXzQdWIPo5/vFBHwk1NGBGMU5cslR2yKGE19TDo/YvW8iyZ7d1qtXD3
	XKD9FkkOLcV1ubqXOvfgOuyJB+2kHszMyFkECkq4L5T4YaZBefsALmXw/XgW60a/+TNw+GfkSer
	Z/C9XyI0u1U3ZZZwzP0G54a6Bhw4OFHwC5X5INhND+3nNmzqzvi6Il/VBU0Lf8T3s34D7D2Mws8
	5FSgwc3gSK6DQtQ1Q=
X-Received: by 2002:a05:693c:8945:10b0:36a:3bba:2e07 with SMTP id 5a478bee46e88-36a423becbdmr6600206eec.26.1793437375434;
        Sat, 31 Oct 2026 02:02:55 -0700 (PDT)
X-Received: by 2002:a05:693c:8945:10b0:36a:3bba:2e07 with SMTP id 5a478bee46e88-36a423becbdmr6600187eec.26.1793437374972;
        Sat, 31 Oct 2026 02:02:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm13711825eec.12.2026.10.31.02.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:02:54 -0700 (PDT)
Date: Sat, 31 Oct 2026 17:02:49 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add device tree for Lemans
 GearVM variant
Message-ID: <auWuuRmTrK_h17nE@QCOM-aGQu4IUr3Y>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
 <c4cff6d8-83dc-4290-938e-7f372be605e8@oss.qualcomm.com>
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
In-Reply-To: <c4cff6d8-83dc-4290-938e-7f372be605e8@oss.qualcomm.com>
X-Proofpoint-GUID: TDvT6Se09bN89_uId9nkA8GW56nEurN8
X-Proofpoint-ORIG-GUID: TDvT6Se09bN89_uId9nkA8GW56nEurN8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfX8HA3IBpud1Pf
 vsDDn5dRXl6VNUmOMLQLBDlwhi3nd2FKJ0kvhOZqtVUHG+uU+Xv40zIQTyG58buMvf8VKQirZHv
 Oq5LXEcwZNX51IbohMlvk/gb0HIZ1Dc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAzNSBTYWx0ZWRfX9jtawGwv0oR/
 S1k/WZ5corR5Tv4VOFWKkBSn3EHAapiF47avk1VlR7x9ZfI3YwEZw6a6MNblf8B7dverHsiedmT
 ljP1JnoptwfmR/NdzK1YErHCZKuMZz6iV11mVMIwBNce9Nzi8WQqyElHiNHRsz5l1rMS3jdOpbz
 m0IVNAstJfcklUGyOT+tUilKzm2+vZGNhdDy/xZ+DvpYyy/Bkf21+9A5UswWm8Q1Ayak1UIA4V8
 /Y1U+9Vlmt4X5A9jadTcR7je1d4dzwObzP8IYDz5uGmyOj/4nQdmGTWm+GaS4g/UOuWYabon+Am
 cFZkYDPavVOiABL6TAXsHjFfSt7BtFiYBiDl4WBkyfsDjL1+v/p2PUPgt0Ss/ww5pACflVoVdAp
 KAusdd8KXrNGfvi79DaB4TxmFrrwkgOulWmJArEqE7EF6kUXd0D2Aia9ZM8aB3ZAFb28nE+PFuy
 +sC+0C7PEtwPqQWuE4A==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae5aec0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=3ylGVn1-VvHPnHraYRkA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310035

On Wed, Oct 21, 2026 at 02:17:40PM +0530, Shazad Hussain wrote:
> Hi Shawn,
> 
> On 10/15/2026 8:07 AM, Shawn Guo wrote:
> > Add lemans-gearvm.dtsi for Lemans GearVM variant (SA8255P) that utilizes
> > firmware to configure platform resources such as clocks, interconnects
> > and TLMM.
> > Device drivers request these resources through the SCMI power, reset and
> > performance protocols.  Assign each device driver a dedicated SCMI
> > channel and Tx/Rx doorbells to support parallel resource requests and
> > aggregation in the SCMI platform server.  Operate the SCMI server stack
> > in an SMP-enabled VM using the Qualcomm SMC/HVC transport driver for
> > communication.
> > 
> > Group resource operations to improve abstraction and reduce the number of
> > SCMI requests.  Follow the SCMI-based resource management approach
> > demonstrated by Qualcomm at Linaro Connect 2024 [1].
> > 
> > [1] https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
> > 
> > Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> > Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

[...]

> > +&qupv3_id_0 {
> > +	compatible = "qcom,sa8255p-geni-se-qup";
> > +
> > +	i2c0: i2c@980000 {
> > +		compatible = "qcom,sa8255p-geni-i2c";
> > +		power-domains = <&scmi11_pd 0>,
> > +				<&scmi11_dvfs 0>;
> 
> For I2C power domain should be scmi9_pd and all below I2C's.
> 
> > +		power-domain-names = "power",
> > +				     "perf";
> > +	};
> > +
> > +	spi0: spi@980000 {
> > +		compatible = "qcom,sa8255p-geni-spi";
> > +		power-domains = <&scmi11_pd 0>,
> > +				<&scmi11_dvfs 0>;
> 
> 
> For SPI power domain should be scmi10_pd and all below SPI's.

Thanks for pointing these out, Shazad! I will fix in v3.

Shawn

> 
> > +		power-domain-names = "power",
> > +				     "perf";
> > +	};
