Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665115;
	b=GDNI2PvzOiMbg75oNvEppNHlMVXUVhgs8Wkudb0TGeB6ozYYHNNVhw0yvGPWuZAhGR1i
	 08d8mQTTxXiBXdmsAhM+7rwdXG+98gETmkbKqEthlURA6sqwgZ9ukwhQqNnhyVkhL6IH1
	 0TJLDNBh5gBZqLMQd4AD8Tqxwi3Ij5QCd12ySRUli7kV2Zv4n1bxJn0XSboMjfnhoTruI
	 jq+d/wjjaME7brnH9lXVG6PXidlA9W26fQZv3GRkV+YWalKBuXUhyyLymI6Snaz1bk2iw
	 s8xBEb81Uc7m2urWRLvjDfEzEx9jKHHZktTbxJjUAP9Kg1yQZi5zlAlwXI57je95RgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Awbc1OwBDawvw0PsKGiEj8XSYNQmg3T/IWA4GpaDj7U=;
	b=0fbxVZkzq4GAGLEjR6x3u0jjMCYcMGhze22G8FqIApO3d72h/gEOL6DCKTmcYqT2yLLm
	 yrw26SHDCxxKTSfErIQEbTlP8Djk1IytApv7/NFN4SO1IK6wOaY/8xGqKfomWpMelxQC8
	 x6XJK87FjtypNKoVke4Xeop0XaZh6z0R2Oi1KLMCqVzawsrK4Kr1T2QdrFyXvr+jMWKiX
	 cTimtWeeZXynx4DkuX5TP6k3l4mcs7Q6kyqj6i4U32rywQmkt2asM7Mv4ZvRc6dMjDPGv
	 8NNrC3luBt4gpc6J9PsxwqbVHl0Fnz666+9Gcs0EgQqab0eNZK4a2EwMzkJnDO6iImw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JeJvgDE9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiDl1M54;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C507606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C507606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JeJvgDE9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiDl1M54
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xlQr2573520
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Awbc1OwBDawvw0PsKGiEj8XS
	YNQmg3T/IWA4GpaDj7U=; b=JeJvgDE9s6U4rKR/pH5cLI7hD/uIVCindZ8qA5xc
	jJOiT7VOPN0GQ+VWDhCj6e/88WnNFR1Rl92DvrBAgWlFQBpl73FJNCh0M+okDzpQ
	K1ClcvpDqpIVNTlccpcoiv88nOIS49DEtk/UofgNIhSuFLq1zgZ4E03v7zvaRmg8
	sVm/zSxqR0uJb6kMsB6j3pqekdqR5HxjzO0M4Gz9vRswjJPpdG4vxHLMdG/mc4hf
	5TDfxikWgcmlasdqmZBmAcz74xh89SZyaeyz9qwFbEwwwgCNFhYubFhMJGZAIFQO
	v2z30xxK402n5rp0cITnqovRdUUrET0BsilUcyUC7Qap2g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aj3ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:31:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so196169285a.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 03:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665113; x=1793269913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Awbc1OwBDawvw0PsKGiEj8XSYNQmg3T/IWA4GpaDj7U=;
        b=JiDl1M54vOyZMyIyAKuImMW56nmaJ9WPKvtjZ4nk4ZpPGpargDu8nJsXHgE0yPIebC
         BP5uti5dX0C7bjI04CUVXGVP+JNrXCmlzQSK8qfNndOeReymFyhtipLmVlfEVcoYc/a+
         gGt3XOkIsYO6LUCJg2gvdFkLjvc5O8acMxCPxiVACTlPr1vg5k/EPktDiPM125LHF9N9
         A+tS1DOJj+YVYmA1TBbMKxiIPK8rNLHVE/6r2jUBGByO2U0ml/zOaKWCkBDoLmaVnWHj
         Df40dgsb3fIWPcqrDvvSC4VI9dguraRrX+9Suu6ARGTPhSnIqFjhT+qNJfxJix0eQ/iT
         o7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665113; x=1793269913;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Awbc1OwBDawvw0PsKGiEj8XSYNQmg3T/IWA4GpaDj7U=;
        b=XMNIO8igK9xOOzbGUyOqgAAXpkIUJ52ijLVM1aOW+GogELmGO297BO9AcI7EpYGgnr
         TTkSVxrmmgFKmsexWfx90/Msm3D1+QqxmIh+Vzfwuuhmlg53k3R9BIea04wp+QbNhiUG
         piSKtd+WsEWUlKlmHUuVorfll4Mxbmc2HwK4f5f+RxCguUWGY25QiwbgO2/JHnjKKEYN
         0FiYRTVpJL3s1dKFu0kBvXovYga3UCtoNDD4fq1EH6wvxjy0AZtQsV3Rl1Hvr0jwjDlR
         JHEsHo029135MLWp63Nry4UUMVWZ3j4etP59mrOzaFgs28yZ8d4n6lafkygyEDji4pPu
         79fw==
X-Forwarded-Encrypted: i=1; AKwUvBxX4/gVIU7X9MGz9J91twk8WpGNSN62CJRHkwkGvrViGk70+o2GWK8f8oy7ZeqYfA0rjrrwPNcMAtyX@vger.kernel.org
X-Gm-Message-State: AFq9FYL8hN2Yg2IZHG5iF/S6omdi/8S6cvnpHiVGUHShfuTGQkvAXReF
	JX3n4gIaw8weqbbXs8htmxg18TH32jAYM0n2zYTz4nnUIVx+sIPVUIL8NigjZ6TD8MAoflu3/r6
	mWY81xJKg6B4zFRd4DMOf4lbr2OD0n49OUD4QhWS+w4OAEYbVx1OclDCBAzVKUzU+
X-Gm-Gg: AYBFou13aXoAzDjEPhTdwPNoF3UL6XSh6JaQhFsDxc5hxOZkVLQ/aqP5/P1UCP4rnEG
	BK5BGYxv+97Z/H7OeFnVKgvKJVKijn5c57UfB4irS8HP1+jbVksBgm2xY41jLGtq+qma4TYP7ui
	WGQt/JkZY2B+4fbglt1V1PSVUNMBT4v0NwP458/2Zs+nMCSsWLdyMQdWROwQEc7q2CbfaGZ3mak
	Mn9oJl8f3T1L18H2sR8EuV2WI6o90uDc3YJTQOjDxl5cyba71RxTvE3xIXBklTx+ZYAVZnJuTsO
	8vrMGAImAuYKnPUeOcOeFsK0ob2Ii0zBXP2KeoCzKkyFhPs54CuDfsMNEiQqKM2Z5B5pxdlRfOg
	Umg/Gsx+AF1M6L0SkJ6rINETgMIXkeUgJl2nqq2ty63t0nc+h8PXk9z6mBSC5S4Mk4jM08DrwIP
	V6Bz7rV7kW9vdp
X-Received: by 2002:a05:620a:f04:b0:93f:34c9:9259 with SMTP id af79cd13be357-93f57f93a2amr866627585a.50.1792665112701;
        Thu, 22 Oct 2026 03:31:52 -0700 (PDT)
X-Received: by 2002:a05:620a:f04:b0:93f:34c9:9259 with SMTP id af79cd13be357-93f57f93a2amr866623985a.50.1792665112215;
        Thu, 22 Oct 2026 03:31:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f55402csm6899281fa.13.2026.10.22.03.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:31:50 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:31:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Karthik S <karthik.s@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/5] arm64: dts: qcom: shikra-iqs: Add LT9611UXD HDMI
 audio overlay
Message-ID: <b7kzeykjxoiuf2m4klkga7rnvtri5vs6z7qexe2uskrcpsh65s@dpkzcc4ykkiu>
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-3-karthik.s@oss.qualcomm.com>
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
In-Reply-To: <20261022094313.1074873-3-karthik.s@oss.qualcomm.com>
X-Proofpoint-GUID: oeDgaKWfz8tlx2UNCzkzkyOg20x9yG8Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX3dOBPaNE08wN
 K88FBD6cKTkyyo7vDCWOojuaLZHSTywdsLiJpAnS+1nBjlZMeBPfbPumPp3p7JD+O+B4EbCsU/h
 0Llu2Rum46tOBaTfSuV7br1y2FeaITs=
X-Proofpoint-ORIG-GUID: oeDgaKWfz8tlx2UNCzkzkyOg20x9yG8Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX+JzcxXi3M0qV
 HKX9bM1I+lk9G3dQv4jTYaFhMnI7IbD49fFQ8aVYV0LoDoM6chJH7yfzNpyG1BkNtD6MfR2AnVl
 JjJzZrV0zKbZHZTdF6NQINWFSV+1bBiHoKql+Ye88s0WMKJW7wjDEESyIvvdYk3jLaIjoIg6+aX
 x90N636674gECUeYkA805XbGi/iUNQGP56HKQOJmT0PA/OmatRRwF/y68CiC1qbx/0ZY3gVqMVr
 C+Dj1W0EVJS9QQp1PhGFlRtlaAzAjupAaAkEBlz+t2KUXpKBgUtX8fjZBz20gu2o3kEzYRSV3Xl
 BCMEciVfCsB3vNGwfhkcZQ6yKqUK0ayRwFgkah7uNF6+A2DphSDsh17EU5jDcl3h1vLaz557lYp
 2KZi1tlMp/08eJPtMhQJFsWaHOHYOGtxmaqze3tVWLxg7CNjqyLYtr6Q07QVtz6OLvCCIW8TX6a
 x54kErfQd9RwdKGz9Gw==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9e619 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=hDuEe94TteisESDp3jcA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220041

On Thu, Oct 22, 2026 at 03:13:10PM +0530, Karthik S wrote:
> Add a device tree overlay for Shikra IQS EVK boards that use the
> LT9611UXD HDMI bridge as an I2S audio codec instead of the MAX98091.
> 
> The overlay reconfigures the sound card compatible to
> qcom,shikra-iqs-lt9611uxd-sndcard, overrides the primary I2S playback
> codec to LT9611UXD, disables the capture DAI link, and disables the
> MAX98091 codec node.
> 
> Add a node label to the sound node in shikra-iqs-evk.dts to allow the
> overlay to reference it, and wire up the new composite DTB in the
> Makefile.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  4 +++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts   |  2 +-
>  .../dts/qcom/shikra-iqs-lt9611uxd-evk.dtso    | 36 +++++++++++++++++++
>  3 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-lt9611uxd-evk.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1c86e7e98f55..127c5c345eff 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -339,6 +339,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
> +
> +shikra-iqs-lt9611uxd-evk-dtbs		:= shikra-iqs-evk.dtb shikra-iqs-lt9611uxd-evk.dtbo
> +

What does this overlay mean from the hardware point of view? Is it some
hardware variant that requires reconfiguration by soldering? By changing
the jumper? Can one use max98091 and HDMI audio in parallel?

> +
> +/* Board subtype 0: LT9611UXD as I2S audio codec, no MAX98091 */
> +
> +&lt9611uxd {
> +	#sound-dai-cells = <1>;
> +};

This should be a part of the base DT.

> +
> +&sound {
> +	compatible = "qcom,shikra-iqs-lt9611uxd-sndcard";
> +	model = "shikra-iqs-lt9611uxd-evk";
> +	audio-routing = "VA DMIC0", "vdd-micb",
> +			"VA DMIC1", "vdd-micb",
> +			"VA DMIC2", "vdd-micb",
> +			"VA DMIC3", "vdd-micb";
> +
> +	pri-i2s-playback-dai-link {
> +		codec {
> +			sound-dai = <&lt9611uxd 0>;
> +		};
> +	};
> +
> +	pri-i2s-capture-dai-link {
> +		status = "disabled";
> +	};
> +};
> +
> +&max98091 {
> +	status = "disabled";
> +};

Keep the nodes sorted.

-- 
With best wishes
Dmitry
