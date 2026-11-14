Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644676;
	b=jjWXJmFBM6TWfBlyEbv9Dqt2+QQQYi3PNEEBzPP5pdyyd+zWsnN0LowyYACaLO/osFNF
	 NQzkdMLD0kGuPg/Bp8Or+fg6hJqfpsfBD9U3s0GzPqqL87IK03b4JPnQhZz+xGk53J/XE
	 3isYudt6Lbo8YZgQOUFBBXdlVzUDRAfiH9d93fv15VPxXaCFJRfp2leUZlEY+stDWfozD
	 X5uDKJRm8rJ6oke3XP2G0Wqy3gQuoHBBpE7V272dI4dGgPXDbjzTlcM+LqAQSlPBKZTKU
	 TD6SSx+KAoWoQw50JSE8BsVfXXZm9+W9/EWs7TqC7kRRre0RSz96Nhuw9NprsJCEjSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tkWtdDuequrHYCszXeT2SZPTUr5U6H8Js9diPv2r1wI=;
	b=fr0iz8pM/QeuJdJQh85//Rp3wik0Clx2d1XAYWxIjevppKzdT8MJXyfrE25YFTlE/pxj
	 DqWlQLZeo+/w7+pJVLPcEAsfuJye9UAxgcBrA9VcpVd4jSFCukeO5fauMYYk/9goxr9X0
	 mFic9mRVuF3l7zU+9t9JlYVT/RHYbm5hiT2tGxGXiPZH5GgXjKonlAEg2+Qi6ErQEfUUL
	 W0jDNKM+GYrOScEzNPhP7EhQ62SkmLRvb+2fZVNp+5gQS5Tf7J4tF8l/1AkGaMLdtnO+s
	 pR4oxJnYXmAwSmJ9pKnwv7d5FgVXAZcrouHB26sc8JBEpNU5ChrRIEHgyMAqU3DH7kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PUvU24D+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YW/WMi0O";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CF4606A32E
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 08:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4CF4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PUvU24D+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YW/WMi0O
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE60n1a3161604
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 08:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tkWtdDuequrHYCszXeT2SZPTUr5U6H8Js9diPv2r1wI=; b=PUvU24D+1RsVP8Ui
	CmHYXbLsHgFSIu4rYqAFbeVrlYWis28CUo9/g4OsbqlC3gdWqr3StS6MQWtu+dAO
	BPY8w2HI5hIGY6kHr9xtHjOWSR+RKpgcGYzDgU94Nqv1ix4BjDnIkmPd9UjFQ4aT
	E0d7xrUV3ddxltDh0kpu/I0XFawKI+BFB4RP5M59BQ+pZ/UttC7KopVplvKKRD4j
	qKAV9gwqAvYYZH0pXtQrygqI3j8WVRHm8AGTyPAdSJYM2flQ/dINEvfpPECjIaix
	6ob9zbMHQxH9PvtJK5aN7rrnPBftPpHZ3L0RomOsFewRiUrNiuxgA6BL4taBht3z
	FqCK3A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjratp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 08:24:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f9bc93925so210138eec.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 00:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794644674; x=1795249474; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tkWtdDuequrHYCszXeT2SZPTUr5U6H8Js9diPv2r1wI=;
        b=YW/WMi0O5mOOE0R3LB9ZrQti7BS3aJR4/WagSS3IkJo8wcbe3hcD0Ia9YGVxctlPsD
         1zfYI4rmf6pBAYLxkMBXaFU7UHQssgimjiFUjS355bd4zd2V4ne/Kz2dhoUQvfCX3EuJ
         o+AiE+EjQQNMM52pjjVeBhH/Ky78HKdKiAnrO9r3GBUrns0LAZ9HJ28Xjn4ou7SnQU0V
         ECTwaywSvn6Twd6WJac3cmhcvvNz7k7QlHPatHdP84Q4FhwDxgBYhfUxYUpVPXnQ2bkE
         EW4pKgTbt7GSNrAx5T+5lOG3luc5z9M+gUhL/vQ/ubonrCs76YYqRdFllT3RyPWmfI46
         WZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644674; x=1795249474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tkWtdDuequrHYCszXeT2SZPTUr5U6H8Js9diPv2r1wI=;
        b=zZerWbz9tx2wCYzq6CRdHKVnRkGvmkl77BxJpe+1n8fpFEWiUn3uEJFW6xwE2coQI5
         u35en32uoWBbJjIsYXTsSAgxH3I/cq0cu0yAi5Q5KkY0tHQszcK4aTUKfXtwNVUdMWZL
         1SRZ157NHQSwRPAisG7cEmQ1sFX3seXZA3rhNoA1gTCdvOqXu5g+BvY1MSjirrDAJs6+
         TVq0yb1uuigUHY0wRQBuo7BrCUJHb6300UchL3CuoZu8eCRwgfQLwU2f/PKRD+f0v9g1
         LNSx8uqHWTdca5qA9wedxKdDAqa1XFvZsNBAB1IJT+8VwCpxSZeYU+FVZuINHQWECeg2
         Q+7Q==
X-Gm-Message-State: APuU4Z9vsm/wDKEyd1G5aJIF+7PHHhngLmmRGbMWmQ4ZUTWlTLIw27FA
	C17t0lDfqjgVHUKSVTpQbwHVYw2286Dtl4KFb77QGwpcYl9ICHuiAUZ5cGFsf9EzGZVffLEMlB9
	PglbbJmHMk24h0sz/W/piCKiB/+n412Zp8Jfmxt5xxwhJcAU5/rKUhkubc3N7e+jv
X-Gm-Gg: AYBFou20H/cwkvNON1QS1Gru3qBQ8HHVKId6HNySIDhO712Jx5e63Knsf4vEJPx1CXn
	OTS/H2wvrE7uEo8diDIgAIfprQX4fgEKyJspj6n2e7vvW0TpVXVNzm5QqPkuQO5i0ttFi7Ndfza
	lcoNlUYLbK6gjoOlp+kg58rcUOm4tu8KfVXFhnU8W3HU/xR5xo0vcSTanUUCtR/O/geGPar24f5
	TmQPLpJgwfrgBql2qZsm//QE3U/uFMVUI82wG1hOS9S6OO08iw5VRwEgi8Wjd2nMbhpTa95LZSI
	aXBdcGV5yvdOYsylTVWCiq2XezCCfgvky/i87LO5CxZpdJVJttCdazHEbw0+s8UeJFgvx8l+pal
	2/CF/eqjOVjVtBDMzFg08fbdCsEZq+3tTUJjJresl4WoWqBXFkOWGGtihDLOd4Y6NoDGCTL0Tp9
	09e6sJOzbHBZqSXZEo7g67xdH/mnlDAK4gGRF8bj5nDFJArKFuLl8HQIiHGnr9GWlS0I5aHVyFI
	s57+ODbsxpO14deqdBzgsh/Nb/Sfw==
X-Received: by 2002:a05:7300:6da8:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-379659c6815mr9318919eec.2.1794644674112;
        Sat, 14 Nov 2026 00:24:34 -0800 (PST)
X-Received: by 2002:a05:7300:6da8:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-379659c6815mr9318885eec.2.1794644673490;
        Sat, 14 Nov 2026 00:24:33 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm13990323eec.29.2026.11.14.00.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:24:32 -0800 (PST)
Date: Sat, 14 Nov 2026 13:54:28 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add Waveshare 8"
 DSI touch overlay
Message-ID: <avgavFfjUpK/uGWY@hu-vishsain-blr.qualcomm.com>
References: <20261114-monza_waveshare_dtso-v1-1-4b7c80e90e08@oss.qualcomm.com>
 <sashiko-outbox-213671@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-213671@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAzMyBTYWx0ZWRfX79jS00ntWwHy
 Ln6mJP8WMCwPfzRoidwzWUEotjMRbHHYQzLdl6HvoI+H1ugzN5yUhjcf+0rKTZooh4uLQ+9OT7S
 AHga0GR18g2TGGtlF4XShEIl5UlNTlL6LWpkfjR2tr/Kn6sb81UxjOX8M8ORN0ibVSJErg1Y/Ig
 VrKKympbzKV9aUiXnckfu9WHeYwF3xYHUu6qMYynEMCzLTL5/Vk6lDgMYzunauMRyzhWtY903y7
 g0F7GY5Ky04zKXyyWstoVZ/Z0/tM8pkjraSadi7VXxgYoRRsmxR74bBysSz3Jwmcr3uWxPtz0+O
 12uusAScpTl/QTmXImQVYZiH4b9ZzRgRUhbzGVY3WSTWaCAa6bNdCv92CrZXIIyKMpLfcVDBTRD
 hAoQLkvXhIdJ60ZZJj/ZDszyn4VVlWD3JqbJX1Ja9tVJV8zirWKbnHs53E+zVAhYauBSQ5WiIxt
 GNTrBhizJZr3sjB1bRQ==
X-Proofpoint-ORIG-GUID: XiXgI59N4DjgKLjS-NEHe7bMgRuM_voR
X-Proofpoint-GUID: XiXgI59N4DjgKLjS-NEHe7bMgRuM_voR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAzMyBTYWx0ZWRfX+iIk+LqKIze6
 yE4dzvb4kTXZWTUH70k3vFzxptfL6enJnbOd8oEG+DCw8HHbQxjEv1kWlWLiw7gy/zHM2WibJAd
 u8GZYNMZQuyi72+qThS1PcfSXkrKcH8=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af81ac2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KXWT9uR0CYtNx511idsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140033

On Fri, Nov 13, 2026 at 08:42:10PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] arm64: dts: qcom: monaco-arduino-monza-waveshare: wrong
>   mdss_dsi0 vdda-supply
> - [High] arm64: dts: qcom: Makefile: monaco-el2.dtbo applied to non-EL2
>   Waveshare DTB
> --
> 
> commit b8a3c8f8c7e536ea10afaadd72a3ac9f01d55e3c
> Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco-arduino-monza: Add Waveshare 8" DSI touch overlay
> 
> This commit adds a device tree overlay for the Waveshare 8" DSI TOUCH-A
> panel and touch controller on the Arduino Monza board, disabling the
> shared DSI0 HDMI bridge path when applied.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 8329c06b60a3f..faa0e0f7b867f 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -83,6 +83,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
> >  monaco-arduino-monza-el2-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo
> >  
> >  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-el2.dtb
> > +
> > +monaco-arduino-monza-waveshare-8-dsi-touch-a-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo monaco-arduino-monza-waveshare-8-dsi-touch-a.dtbo
> 
> [Severity: High]
> Should monaco-arduino-monza-waveshare-8-dsi-touch-a-dtbs omit
> monaco-el2.dtbo?  Including monaco-el2.dtbo in the non-EL2 target disables
> gpu_zap_shader and iris, and attaches EL2-only apps_smmu IOMMU mappings to
> remoteproc_adsp, remoteproc_cdsp, and remoteproc_gpdsp when booting in the
> default EL1 mode under Gunyah.
monaco-el2 is default configuration, i have verified panel both are working. 
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso
> > new file mode 100644
> > index 0000000000000..003c5bcea4973
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso
> 
> [ ... ]
> 
> > +&mdss_dsi0 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	vdda-supply = <&vreg_l1c>;
> > +
> > +	panel@0 {
> > +		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
> > +		reg = <0>;
> > +		backlight = <&wsgpio>;
> > +		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
> > +		vccio-supply = <&panel_iovcc>;
> > +		vdd-supply = <&panel_avdd>;
> > +
> > +		port {
> > +			panel_in: endpoint {
> > +				remote-endpoint = <&mdss_dsi0_out>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&mdss_dsi0_out {
> > +	data-lanes = <0 1 2 3>;
> > +	remote-endpoint = <&panel_in>;
> > +};
> > +
> > +&mdss_dsi0_phy {
> > +	vdds-supply = <&vreg_l4a>;
> > +};
> 
> [Severity: High]
> Does setting vdda-supply = <&vreg_l1c> on mdss_dsi0 overwrite the SoM's
> 1.2V DSI supply with the LPDDR VDDQ regulator?
> 
> In arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi, mdss_dsi0 already uses
> vreg_l5a (1.2V), while vreg_l1c is the 0.3V-0.512V LPDDR VDDQ rail:
> 
> arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi:
> 		vreg_l1c: ldo1 { /* LPDDR VDDQ */
> 			regulator-name = "vreg_l1c";
> 			regulator-min-microvolt = <300000>;
> 			regulator-max-microvolt = <512000>;
>     ...
> &mdss_dsi0 {
> 	vdda-supply = <&vreg_l5a>;
> };
> 
> &mdss_dsi0_phy {
> 	vdds-supply = <&vreg_l4a>;
> };
> 
> Overriding vdda-supply with vreg_l1c leaves vreg_l5a unvoted and causes
> the DSI driver to disable the LPDDR VDDQ regulator on display suspend or
> probe unwind.  Both vdda-supply on mdss_dsi0 and the redundant
> mdss_dsi0_phy node can be dropped from the overlay since
> monaco-monza-som.dtsi already configures them.
I will correct this and remove the redundent phy supply in next revision
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261114-monza_waveshare_dtso-v1-1-4b7c80e90e08@oss.qualcomm.com?part=1
