Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101494;
	b=uIhVt7VYMqWV5aoE6+gLZoSZZArA3GdGKRiRfnp4AghnMR8hpKvG/SchPX4tfJB2b/9L
	 hDdRuX9zsYbzjlU3djApms7vnlUW/UFokTt3XzRzkpCFx7F9svdTD6brX9bTygoh66PPy
	 bmfmhM2dAgw0Jc+0RRV6sFjEuBNiLlY026TCk5Ku1R2WryrgTFPVmdsZqd/OiYTSOg8n0
	 +/1KmLolzXWwI8+6SIGEFF1nW8TZWOyg6YhxCSpu4XvQlWVm8nzCF2wJADJkpb/Ou23M1
	 fFVG+ippKO7dw+pCrIPsvi2qMjxBpuALYddZd/XUpgtIHLi/N15JUNEhoAkB7rK5IsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lE7AshOR9IvZTWb4KZq+JxDOO/khlLsKuqrhcF9jNKs=;
	b=nDmMCC51IYxZyHeiQhwWFEY94esI/nERdOp7YTnLoM5NFuS3yLGIMzBi7t6lIHiL/Bi0
	 28QAXHeps2HuNZtN1mrNOMGY6BNkCev26Ntqvj92J6jP7cwTMhOcu/E1TichIYHIjbGql
	 wJ0Jf2CP0VoJJq+UNPt4FJOOokLfvasxYG8JZHFt8+v3TpIkbtXvRJChDv41VglfbE9I9
	 Q2U7Las7SF+/Ht6ZIJSou+vCHYDEMTOUN3uYmUOswOq8AxUZQ7xwbzBctiZngqZJTouVM
	 ISaT4rwihe3uiElg+gTgNTfMqw/qAdGyHOm6kk1lOmgZWHtQKeVm5dZd4PH+AnF4Acw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JECJ1hD7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i02MCe3d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358F8606B5C9
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 358F8606B5C9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JECJ1hD7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i02MCe3d
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeBSj1061450
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lE7AshOR9IvZTWb4KZq+JxDO
	O/khlLsKuqrhcF9jNKs=; b=JECJ1hD7v8moO1XN6ecJsdDt6TuQlsG5Fw8AGyBv
	SRdm5mWhtl6JZijzfe7UdoOdJP+7kP9QjjLQMphlmGNiwqUQ29O/SHADAdC0drng
	nvZOlcFkb8PSwKF1bZtbJFygVxaXT1LYi+wh1uM6ONeX3IBCLss+MJJjE0FOQicb
	vbHBdeARg9khPu4JnTTJNa4VMO0Sk98DNk1+OjAxQvnoNtkEDqGmB+/23Jsl6KCM
	+BQaqRa0d3ZBR5UC3Xf30cV7FWGyOuQUeH1HPeJNxoL6aRlfKXiWLPblY+VWw3Me
	U29bdBvrEZhKiW8OK/Wn32P0WXPaJdCkrGbH3N2nLrPE+w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t9aqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:44:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc06b9cb33so664202137.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101491; x=1793706291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lE7AshOR9IvZTWb4KZq+JxDOO/khlLsKuqrhcF9jNKs=;
        b=i02MCe3dtFmpLqeN2Ogia9BGC/JO/y1+/1MnLqdM0yDZ7yHtrkPdZUEpUq/1Ozp7aX
         8qKcwyyLIH816CJQslmIhED5Eh4+GXkEPQSe7zYiRk6zd831+mWisHNASWLq5DG0g33n
         umKxlGXo4IkNuVFbMJa+a4KdVIQuPPvy8xbcaNr3Lagzx/eqvvqRqXlRMQNmoFmweifq
         tibtfBIkrjEQAHJ1I6cIuCwyzWu+vkAPbK5ZMYbY9TghAT0JI8jUBtyCZ3bkRsLfZTKj
         +lmUcYhmrBs8/9qw/1QY9cAKG2elA6SrV4MpLOly2jdoSb120ByNHrIyVHGnWzva29XL
         Prmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101491; x=1793706291;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lE7AshOR9IvZTWb4KZq+JxDOO/khlLsKuqrhcF9jNKs=;
        b=SnpOQOPsCakDCqOUsTkAkVvf9urVZ2K7mmhcYG+E3BWDw+YMNGX3J8t6mUE9No4tJ4
         945LQzI/tY4MRHFCFAVBtmVdjRn6VvkyeUH4vW+2m4uS/S/baT71lv37Ah9uwSrOMk7U
         D6KbaixACsZ7ESIcH5Fp5R9C9bwetsS7phQJk6urH82AkXbOAjrZCoYlpYMvjml8Uy/b
         LcOQPjx6H1Mwhw2X9pE/BxTKFuNrzN3XwROsdZA6xjBd2x5oAxBRwYl8TliNq5sVbOHj
         rUJAcSAo8QBcMLjF7Cg/tycEsx25ywK3cZKJjVQHfFHALUBGYdu95/ufj/N6AoFfYngr
         syWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGNnscfrqrkl69Y+Fx4cd+9LvfX2gPPn/guiIs97sH3SlJjg3k1BJRe+zdTWx7kXJ9lpmqZu7HLGp1@vger.kernel.org
X-Gm-Message-State: AFq9FYKP25ybNtv1mjwNK9X+I+qQD8C+exc7Dwa5Sj24gbUCAz5GuRnc
	2seXMEEwOxGC5qJ1X1ONINmFFde7hrFGdsEJqInZrNXsLwEhCy13/uDCMw4DJnC63kUukIxlicG
	jzcjJd/bEq8hYw2wultSUGdK2KzdaY/Ms5hk1RVkjOdY+JifljBWdPQ8CexWLHC4m
X-Gm-Gg: AYBFou1BBYTddgZZQT9kYaab6UHXcoO0I4FomIgk0MJTz9Zu4fUcusUA3yV3cf/mjpH
	LyXIe3wBbCDUeXsZHZhPq/+CHB0hL1PrrahwjCWhR8aaL6gwm5t29VNodGEHvTHzAHLmsWNFDRt
	KJh/3MtAAoCrmSjRm4CjTibzMUkZnp/7JQC8Y65KqucVNVZvTdqsY3XpfOhChVT0x0CO1SJ8MqB
	mnUeyvDnvM3RsF1pHcDYFYAYUpwgjpbFPhlHTYFVOmIiEBnThIm+uf5vS2CG9uzHJOfeHTmD7WM
	qOhA/IhyqnuPekjOk6O9UGBluZAhACQtHazqBSvEwnb3yLTDrtSCPAXYO3AKiyx7ZFs/AsSGtCY
	khdT34/AVLh7xYPWXGtUGKNxNby8UB0kKThb4kv0mGasULCO5W0pmJkCKBgWOqaF5LJKilkvuNc
	+H2NUcI1BCENqi
X-Received: by 2002:a05:6102:5048:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7ce5ce4227dmr2779184137.34.1793101490805;
        Tue, 27 Oct 2026 04:44:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5048:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7ce5ce4227dmr2779134137.34.1793101490117;
        Tue, 27 Oct 2026 04:44:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a8945esm2027201e87.53.2026.10.27.04.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:44:48 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:44:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 23/23] arm64: dts: qcom: hawi: Add DCP support
Message-ID: <zg235e6lnlml52ya5fj4f4ulmamnqrlvtfs4yj7i4z4ezrr5uv@zaybpfrp5hjn>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-23-7cf014efdee1@oss.qualcomm.com>
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
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-23-7cf014efdee1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae08eb4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Imd885ZT4_v8IS7qKhkA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: kUAnjnz-sxvWXfwtn_n7DNTw5DU_5fsG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX7oaXh4/z7Xsz
 wXJEmuoduLhW6nl8jTLcYxe/+adit0dCQ2myGx+I/z9UGDbtGkGy8Hn7tTR5DanMT1DF3mgvtpD
 6b1ur5jpNJmEY7Q65sF0qPICC8j8hkc=
X-Proofpoint-ORIG-GUID: kUAnjnz-sxvWXfwtn_n7DNTw5DU_5fsG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfX+vcQb7VcK4Qs
 C3qas4GzbV6a/uLiDEhaUwmFiaderT4anCHSTYoqnX4rpUzxW3x3Zjx2enCdMD951v+9+C9XqN4
 ZAZ87TX+vJGBA7cFEs7+n+fg0TOWxxjVKnAx36QIj1ot2UNRsAJV2z31tsmoxZX4w38tTn4LXmB
 9Q0TE05R+FYpUIIBQhQVMo/tYX6nLp/f60xXU1mSdX1XfFZ/e3fjWluB54Wwfk8y3C/321sr9I6
 b3ljhxAaPiY12ekRcWPj1ERwVBVv87hYXKlc9ycG66X+DhAaoYMB2sN4HaZQPgUDnNgwe14joZL
 XtjymmBobk6BGBT+EMWt/t0LGZ060wJihQC6Jcb7zc4jLAr5F8Vi7BV5wHaFUqr9Eo9ApLpQhjK
 7JTM0n56GXuNfKo0s1PVVWa6V5osTqY/wCSLoYJVgOu0dplGc5c+7H8jpTgSbPAVc8aoFUHloJL
 WiDjDy+qtf98IvVGIew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270046

On Mon, Oct 26, 2026 at 11:51:33AM +0530, Jayant Shekhar wrote:
> Hawi display hardware is owned by DCP firmware, so the platform device tree
> must describe the Qualcomm transport wrapper, firmware display subsystem,
> power-notify channel, IOMMU contexts, and display graph used by the MSM DRM
> driver.
> 
> Describe the Qualcomm DCP transport and its VirtIO-MMIO child,
> the IPCC power-notify channel, IOMMU assignments, firmware-visible IOVA
> range, and DSI display endpoints on Hawi. Enable the DCP display device on
> the Hawi MTP platform.
> 
> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hawi-mtp.dts | 129 ++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/hawi.dtsi    |  40 +++++++++++
>  2 files changed, 169 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> index c38e5fab7a2c..a27003f69d02 100644
> --- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
> @@ -34,6 +34,18 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	display_panel_vdd: regulator-display-panel-vdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "display-panel-vdd";

Is it the actual name in the schematics?

> +		regulator-min-microvolt = <1100000>;
> +		regulator-max-microvolt = <1100000>;
> +		gpio = <&pmd8028_e1_gpios 2 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		pinctrl-0 = <&sde_disp0_vdd_active>;
> +		pinctrl-names = "default";
> +	};
> +
>  	clocks {
>  		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
>  			compatible = "fixed-factor-clock";
> @@ -142,6 +154,7 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
>  
>  		vin-supply = <&vreg_bob1>;
>  	};
> +

Unrelated

>  };
>  
>  &apps_rsc {

[..]

> +&tlmm {
> +	sde_te_active: sde-te-active-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_te_suspend: sde-te-suspend-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};

What's the difference from the previous entry?

> +
> +	sde_esync0_suspend: sde-esync0-suspend-state {
> +		pins = "gpio88";
> +		function = "mdp_esync0";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_dsi_active: sde-dsi-active-state {
> +		pins = "gpio211";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	sde_dsi_suspend: sde-dsi-suspend-state {
> +		pins = "gpio211";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};

What is it used for? I don't see GPIO 211 to be used. GPIO 210 is used
for panel reset.

> +};
> diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
> index 6b0a0ff0faa4..836970cdef71 100644
> --- a/arch/arm64/boot/dts/qcom/hawi.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
> @@ -6841,4 +6841,44 @@ timer {
>  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>  	};
> +
> +	dcp: virtio@9be8000 {
> +		compatible = "qcom,dcp-virtio";
> +		reg = <0x0 0x09be8000 0x0 0x1000>;
> +		interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;

Align properly

> +		iommus = <&apps_smmu 0x15a3 0x0>;
> +		iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
> +		dma-coherent;
> +		mboxes = <&ipcc 13 5>;
> +		mbox-names = "dcp-power-tx";
> +
> +		dcp-subsystem {
> +			compatible = "virtio,device34";
> +
> +			iommus = <&apps_smmu 0x400 0x2>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dcp_intf0_out: endpoint {
> +

No need for an empty line.

> +					};
> +				};
> +
> +			};
> +
> +			dcp_dsi0: dsi@0 {
> +				reg = <0>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +	};
>  };
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
