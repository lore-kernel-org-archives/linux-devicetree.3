Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08063839B8
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373616; cv=none; b=in0YqgV+knjHSRHWTizF2fJqTlAOtyIDzT3apMWvERg4vPipwSGgSP45SMk6vbpn9vg8G3O52JJn2FXyiY2EUIIUWVnuOgZpiv/WQbxdCw43ieey49a3sEClPuWMwcnXcIy/Enp2W3ibZ/wvk8iO77xOlWXq0mVKaSAYhz+Znqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373616; c=relaxed/simple;
	bh=ry/PHtCb3fMC33PA6aeOge+X7oula6IdRsZRjpNEJ0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVH5YWOECmpv8rVpUKZI3j1WYYCyxCkeGARVhRKe70z6f5vqLPtTeJMR4z0SeN9e+H+vO988ePnN0+11A8HPnjTwcDl1V29StfNGYOrVeZJgNj8N82vF7uD3rlAy7KkUPZE2gKRJWsOdPID6thW4OeJR9d9f0N90+5bZKKTmoLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJZnmSpS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O48/vgXU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJZnmSpS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O48/vgXU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jRVP794395
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VpOzWkUmj0fptxU1puX959kqq/TzTpUukH/T/db+xlE=; b=nJZnmSpSvtT4gSHS
	xm0c6XJ6eE1AmyI2cjT0LUjoiImQJZgXIJNmvUK28lECnEgv8xdNZ4TF+eeLLyb1
	3nj6nMWjyic+0+R74dM41nKTSwAQEn9o0uHWgP5V7vdrAcw6o/25brn/wh9qCOpd
	5la3Yy0A21zaWW4dVgobUo4/xVzrLpSx0C4/fkAh3CybB/NZnhIM/ZC2/j1uhgLQ
	eJ3nqC4NDLckKNvunwPEwAe7xQ9sxyMN46O1e2SVqioGCjksomGU1GeRkQ9eRr00
	NfD6ps3y/ifbl79PyUggx5KytbwsskQb66y8mQD4I2CSHG7eY4Y5zmNehcE/Q5Li
	uyM18w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnnah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:13:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930a312222dso31017485a.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789373609; x=1789978409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpOzWkUmj0fptxU1puX959kqq/TzTpUukH/T/db+xlE=;
        b=O48/vgXU7KFJ+LzL8qXZW0TsviT0vw9dKXURtpqUUet1nMMmmpjsezypBBkKXCOyZh
         CROLOhe8kB1dCySaQNUOYe6xhXwanch0VdrChH4i9JmBk5tvm3f1wqAmbbxPed3HxeTv
         ExbXOwS+leG3rvfV+dwRm3EiRm8AF2ZX6gRUpA9CCXDBkC2mrkNxMZO7ucC1/yBViMvz
         jvYrtwMof09RKlw3NCUoZtWAhpu/J8O41cFGJRqxAenJunomfE8T/W4HO51zSYbAr5qb
         CMEBOLURWfe41wyQe/JjOnGgB/mCRpB/A2IWpd3KPTVE3hhJQRwCo8zXUFZCViNdquPt
         yx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373609; x=1789978409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpOzWkUmj0fptxU1puX959kqq/TzTpUukH/T/db+xlE=;
        b=kMMBqWQe7cZApZ9OmNXjGn6n9I/sNCgDeNN4fCj24SAoXyHU626lXQf2hNfD5J9ZPw
         lgJc1O1TAVBH2SIDzUOb5YkpRCZqwFc125h+hqZjPN3n2DXrOVQ3TA5fkMYeOyDMDf1Y
         73iDgu+XlKiVLr2K1wGz80M3pyNha/11+KleEshTR2bh75qkoogplrTAYzL6Mb1Ef0Rx
         /HmfjWZP2WAchpzwZdnbr/+FTK6FFy/rti1I/D1qKGR37jQpF16Ehe2dIXqL/fgapA1n
         01ikyRm4YXnP/XerRa7IujOK4vX5mQKETrZOtDAFibr8QCr9xeNs4+6odZodtpZPs1gO
         WQ+g==
X-Forwarded-Encrypted: i=1; AKwUvBw3bNK/KWT5GMLakwcBIL91IPBD63/oBaqfWSbz7Gx0NHpHy5C1j7U43Csx8H0ShBK+IzkqGjInJ05I@vger.kernel.org
X-Gm-Message-State: AFuF++nijlOMjBT3iWr2N3tDCwv4OmRnk5pnCS1YZElqJXwdJj4+ZoP5
	GZh5Z79Nlj0NXkA6adJbEGcTWkpybPB8sKS9PEQ0zY5nR44KtqwEAsZumTSIoG9fKDlhXW9e9Vx
	Pt4ZZGjUogroDs58SYclfCRNB4Mxkec78O6AsCX7D0KhJ6ajngZqohAa3QfHX2ZTa
X-Gm-Gg: AYBFou2c59aK0mXKE/matifvWvFEFc0jDGntQWXtAtAeDN40h2Ib6JPnZnXmsBIeD2p
	bRLNGejRRTevCrTowObJ+HJEOGHHn9fhXsU4+vEnlFzV4+x2ylR5vtJ22XZiZUag5WEtphbyaHy
	MdmVkk2EW3UAI7LllKd9llQgV3mAaB4VpBhW0/cLgr7UuCcE86jvEBoXqwJFSMHFeeYZtoHpEE7
	tBWl2/HR42fWikb7NCupIlm8Dh8N83akz3Uqpc8miLbzjFnSvG3aaBsZQ0q7iZm2HhtyY3LFXzF
	/Hmbuusom2s3Zb4u4xxvirkgTwrHV6YnNwIEaXseYPVtVuzZSmmJxmbUqJqjxODDMrFJ5Q05KKx
	5D8G13FLPGGWxWP/36W6qJQ==
X-Received: by 2002:a05:620a:1a07:b0:939:48e9:51a1 with SMTP id af79cd13be357-93a2985be2fmr175417485a.2.1789373608714;
        Mon, 14 Sep 2026 01:13:28 -0700 (PDT)
X-Received: by 2002:a05:620a:1a07:b0:939:48e9:51a1 with SMTP id af79cd13be357-93a2985be2fmr175415285a.2.1789373608222;
        Mon, 14 Sep 2026 01:13:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9bc808adfsm3661441a12.4.2026.09.14.01.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:13:27 -0700 (PDT)
Message-ID: <cbc69211-0b2e-43d2-b8d2-647a9cfd2f72@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:13:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, abel.vesa@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260913201835.250085-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExNSBTYWx0ZWRfX4e5+fGFckwrZ
 UDsOEa/SGBu9dp5B4+Nf4MUy/nDWEsngNnmXgGWD5BW0PK2DHcjgFmkX7C7ZsgB6CElheac4W2b
 b9HngdJCVGGuOxvnMUE4k7QeH2PqYAEujEPtEOSr0HPa1pqKSXF0ZN3mLGGxjksN1GRJaehJ0NK
 DPPuCHxvRSMR+54tu/iay6cUs/qI86lZcnnqzxPkrBiYeqezG3rQqnMAEm2zCBVbJCpe9TX+pZi
 11IlifWuyDJ8e4nuMAVzQNYXdIkxan0I9MohvVGuXWazRvy6grc3oqrcMmw3F9tigaUYVcyEWml
 cjhCo5UqQNL0r/6milTC2+WqopiyCgaK6DwN3oQNMVucG6cmAMc1OC391MP3CW4Gu6P7vlsh+HP
 pbO1sjL0ac/JOsZO1wfs/KOoGKKW9hg75laroOuyO9mZtLM4vP1V9bUp/MczXTFk2LaH9lpqxuK
 Vm6/H7lXXj797KZNXCg==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7acae cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=2i8abOnZ9zkVdpuz0iAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExNSBTYWx0ZWRfXzhYWKtSYJgmb
 tAbQUHRpMa3NGLB2xmowFj3KWt6CEcL2SWg5Fuznr+XTULi5u/ZX5382gJF+3TK98aw+3yWh4Ae
 Kb0x1x6Nt4oB5x80Aw4F8NiLmsxV7jM=
X-Proofpoint-GUID: SFfTLa2cdAKQ6JwF1SqrW56q0maRbOg5
X-Proofpoint-ORIG-GUID: SFfTLa2cdAKQ6JwF1SqrW56q0maRbOg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140115

On 9/13/26 10:18 PM, Srinivas Kandagatla wrote:
> Introduce a device tree for the Mahua-based Lenovo ThinkPad T14s Gen 7,
> a Snapdragon X2 Elite laptop.  It follows the Qualcomm Glymur reference
> design used by mahua-crd.

[...]

> +	vreg_edp_3p3: regulator-edp-3p3 {

nit: please sort the regulator nodes based on their names

[...]

> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x10000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};
> +
> +
> +	sound {

Stray double \n above

[...]

> +		vreg_l18b_e0_1p2: ldo18 {
> +			regulator-name = "vreg_l18b_e0_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +		};

xxx

[...]

> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	/* eUSB2 redriver for USB Type-A ports on the MultiPort controller */

nit: this comment seems self-explanatory

[...]

> +/* Internal eDP panel */

Likewise, it says so a couple lines below


[...]

> +&remoteproc_soccp {
> +	status = "okay";
> +};

This is always enabled

[...]


> +/* Two internal USB Type-A ports through the MultiPort host controller */

I think the right thing to describe here is what they connect to

lg otherwise

Konrad
