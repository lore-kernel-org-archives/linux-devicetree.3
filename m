Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201173;
	b=FFu9gjgaPiGXwoZvUHRk5kqvNgAYXwvvcr7W0dSfLRujzA0qiyBAgIHsRzIuRsFTUju8
	 gQDviLJ44HifRxmfwYl8fOrgJG/0Q71QuzG9jviQrhDd8XlB8J4iuPglxF5yO50nbFj/r
	 MCidTQ2dwwZEyuQinSP7/gQPLcwL/tpYcuGkvvtxe2vTFXo05Mriq/PJK4GJxpbgHdrsC
	 /Ri91PTf5aQ+9woAedVGKD1/ipLbY4oGi8Lk3fqwdzwMIntrH+fBhxXqkrUM9dL8S8I7A
	 e4ADntRx7feiuuN1e4IZcdB1CNjD2zyUZu9wSq99br4123Co92NmHAXSCYLP9rRuPPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201173;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ESuzb9mGlbzEuJZWgE2L7mHUTd2bVeRjU88sdK3aSnA=;
	b=Pd6n3vL5abkH9Kjm92g1a3BzrVtIgy+aGbETF292TTW/ALypRhPwaqy+20feXkW7HEpc
	 Iu+a005pNbufQxCFQiq4bpGKHq6hieThJIln79/Zz5yENxsijILK8oSfWAYZ3owONvMek
	 hA3+wz0G3v3AGTmFNgi7OsjD0D6FV/yDpmeQPr6LX2iXn3y86vK9MI3i9TzBlDyNrJLxZ
	 RK2YSHbMDzAaB2jy3vUvDMUC2KKs79ZI0FaAQk2ntzJJKEh51SZOLJhaYHXIjR/iLtuMl
	 u5UZjo8UEYo5FCvVJH6HOroFXzURTSFcWFdD/xLdCNbYEW1j5mm+z4zoXmat4WwrmVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EXjX8reH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bu7WQSQJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F33D606A32E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F33D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EXjX8reH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bu7WQSQJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA4ke600114
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ESuzb9mGlbzEuJZWgE2L7mHU
	Td2bVeRjU88sdK3aSnA=; b=EXjX8reHa2KNrA2LGI8s2Ahf2Zmow+agLi9E4cHO
	9SV4Hdv0i+oD5Of3hssDyyEstAdMoAgA5mjKHnx8YUDJ3cEqPt7i/gebjFn4XBoE
	FAIQxgdDD6lmld4RpgjjCpxMZaHxYCEHVSxkw2b+36caFYTqzp/GExzw2jLGKU0f
	ddiRRjxcWdps2X5q9Ifv1b8XMQSqo8f/VGbNIhsAS5QPL54bW0FHAT6u31afypPU
	IffH1eARpTAuMBefiU9pAQbTuXtGMHjzHDxQcf+V6Q6XiLDtt5buCFUlN1HT8nlY
	ipYh3awuU3XA9aQN0VPSxEKR2GCKm+rZThz9uawCEOZCUQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f935t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:26:11 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99082f450bfso877911241.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201171; x=1793805971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ESuzb9mGlbzEuJZWgE2L7mHUTd2bVeRjU88sdK3aSnA=;
        b=bu7WQSQJES2mMKNAClM0Nw27F8A93BWaz8K0Bs0bfP+ONTyPBgAC1akxG5Xfb6O9Up
         9GuzgcHuZc2BoarYjOaJ7FFsbRYJzOoP+fMIctxn/iyc7b9W6DAD/auYgM0vKiQPy7jm
         Xn7u8KrKP2XQujoCd1pQoOVLWmcOn3UWvR4TgzowUCocsY4CmzywF3AvOZo3mQOz+IQz
         3w+sm76wh3lsrBVz2AoUIS1XEofx5HquYkxGUaBNpacM5QLs1PsxTPb+938wzIAdpH6E
         KkpSuKHqp5dilakPmAK7fQ5INVe6EZxtEXx/B3V3itPK+yY5t5KiwND/2MTjleEBu2bj
         MM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201171; x=1793805971;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESuzb9mGlbzEuJZWgE2L7mHUTd2bVeRjU88sdK3aSnA=;
        b=gcMCI99cq8o1fEHkn7GlXKQv8uAca1mDD4MlJjt3Mqmh0xarCnkSOPCbrinuGzrUFs
         2sZWQFJj6M4t7XNVPaU0at4FM5Q2Ah+dtunaIhswmF1R7maqDVQA14zpH8EIGziJi5bL
         /cbz80pqFqUsGzRRhGVXoL8pdsFXlYopJgEar9TBetEsPy6yalWlhqwhmD8HubdxdjTl
         TFuADJfgpM8AN/P5Nemeeny1iVG8BpuWB9vEy033nR88hgi1sbVouKg/GVFdRFANIBt9
         pQK4Y8/XnJSv0qkq2I5IGKA1jKM05Qu+z1Zrk7tmx1U8Th+GETJhKYzkkmp30B7AF8gr
         jFtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEC4rHBY/B+GW3mJl8XKPmfFUUKQ1fJ34KuMSLyzV+iininXIIHulqcysrqbtNhpfwTF74GgLef9eb@vger.kernel.org
X-Gm-Message-State: AFq9FYKw1/ICt4oC+67b2sQWT9SnkLRqSNHail4abuRcwZvuPueHP7XG
	XwjJS5iZKdhxTwAwtkyXH2hIUBEYZwExP8WQ3goaoqS2BaD8Oqv3g4vC0mEoq4xooKJod/OdFcV
	Vcv2z0/lEqNZoP3YRdydaoq7u01NbLiX0X8/KooJTYP5gCPVur02Ml8xn+o4SmHQX
X-Gm-Gg: AYBFou06ckbFlbrYHI+bAD4+vfde2clyt2BKW8Y+yxIEWhufPsmaOBJkC7jBa74FpAB
	RgLJcZMY5O1TwodYlTzO/DWcxvlJB0HnQXBfLDfF7fNTMSU+/Es/CbL5WqGz9pgg3YkYY71DZDo
	L4cgMRnzvVI5Pi+Rwj5ZrzjXabJ9LbTx91x4PvL+v9xitMJm5tduFLi8qTpM9L3VewuIbhP09ow
	UZsR47UBV1W0ukgh7W/QxhFmNHc4O9ZbfjHRGvkn/eRI4C3OKqeMq7So+ks6P0Whjfvyu5Q8VBb
	BvE/DOVPhGdcvlkS7dw0iS3f1maxi7rLml3enELtTaJ2CMQJabDDHbXAqNuWOFlSzUFo/9GkubV
	E2D2LjqqZG3vmYQXpt7m5IZ4AVESgxxo/y1tVO/rs/yLN8DP/nXu7jfIjw6u9GmDGMg==
X-Received: by 2002:a05:6102:290c:b0:7b3:4199:2dd7 with SMTP id ada2fe7eead31-7d039ef4abdmr1403686137.0.1793201170565;
        Wed, 28 Oct 2026 08:26:10 -0700 (PDT)
X-Received: by 2002:a05:6102:290c:b0:7b3:4199:2dd7 with SMTP id ada2fe7eead31-7d039ef4abdmr1403628137.0.1793201169882;
        Wed, 28 Oct 2026 08:26:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a978d57b39sm83510445e9.10.2026.10.28.08.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:26:08 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:26:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v23 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
Message-ID: <z3oqnmse3plnnntqwxrpi4xozyuxn6a47qc54agspwuzb4djqz@hzz3lbcmkvlv>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-3-95f250b18612@oss.qualcomm.com>
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
In-Reply-To: <20261028-kaanapali-camss-v23-3-95f250b18612@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae21413 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f333AuverTXq-OlsU_MA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX3LP8EQG4FUwD
 yjR+rMeinBi+ELiFiDmSDmaUT3anp4+UXTjeKNa+1DX+xdaBfTeNwXXVo+75mtOswcSv08SiP44
 1KsW86Og/EaaxD9/7r/4fZ5qc39ksrA=
X-Proofpoint-GUID: 7h2ccIIvnG_5wgy19He4DegZZdNC901j
X-Proofpoint-ORIG-GUID: 7h2ccIIvnG_5wgy19He4DegZZdNC901j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX4RfzMYxr2hxN
 bY2KKi0cDcld0sxOzDOLbpT1B7j03IvPz1JyLUSIIRnULOXSkTCwByydv2F62RQ5eIq7ReMeVSt
 5MIW9UhWOPdZmK9WvFlluJ4K8YOnO9vx4o3Z557Kt9NqltOQYn3WXoaiKFStwcMf4upmxCdzhKj
 GZYcTS0fCfoFx4aAO3uMz5QXtVSZWljH5CV2nfMVIEyL2byHQZyWoXrPX3k0NcWs3oLg6dPVJ7w
 r87/OjQNRD5I0xyXBfpHqc5COduTpyJuIvMsSi/2wn0/rB8BrVJaw5LL+eyggRu58bc7WDuWe1h
 JxVbbUB0tZadO237ELCzAPn65MBWzmHUiMBtbAmlioQHl+ScoRFwfTtIkjLds7xEZe2y1hCgEmN
 uI+19sEUcGpTtcI0anoj5IDpAhjmLS+tcqJGV1eeNZLDe0TBQaUOyAPrvIKO+OUHszeG5mo5j2M
 mE2H4fzi0qNCtN0dK5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:37, Hangxiang Ma wrote:
> Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
> driver, including the Kaanapali common status offset and power domain.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
>  3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 8cd331cfb4b3..658a39463104 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>  	.genpds = x1e_genpds,
>  	.num_genpds = ARRAY_SIZE(x1e_genpds),
>  };
> +
> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
> +	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
> +	.reg_info = {
> +		.init_seq = lane_regs_x1e80100,
> +		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
> +		.common_regs_offset = 0x1000,
> +		.common_status_offset = 0x138,
> +	},
> +	.supply_names = (const char **)x1e_supplies,
> +	.num_supplies = ARRAY_SIZE(x1e_supplies),
> +	.clk_names = (const char **)x1e_clks,
> +	.num_clk = ARRAY_SIZE(x1e_clks),
> +	.genpds = x1e_genpds,
> +	.num_genpds = ARRAY_SIZE(x1e_genpds),
> +};
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> index c0a4fa20eaf0..aff9e66f0352 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
>  	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
> +	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },

Nit: Shouldn't we sort by compatible here?

The rest looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
