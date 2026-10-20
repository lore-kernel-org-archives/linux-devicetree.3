Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484883;
	b=zU5711bbsOb9wyNAKmJ4fsScaxSitBAO8CdtIDz2chzAvqzzx0VMFWghR4owdrILt1Ux
	 qA3X/MOgs4PZ2iqwkSB52baZZrQhjyLc/yOCY538Sy63sW/W0UkRBbADWQz89MCqLznOo
	 4YlDUxhoLUwzEB9Z3gqoIC/QMf9ZeMCQYTVY7EPsPwqYLPiUKlf/8IKuDA3tIykAaZ/m1
	 62Gz5xP+xXmt/l9zFmWz/CNtTCEWYPZqSg8A9aNtStNArfvyjpiCwtJFsqDvVJ80V3FZC
	 wkEctdM/0jDSNdRujg8ASrg6fJeC0wwF+OuVOy4SdIu49RImsZL0zhOFCo9cvuvNULA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rvYWJFWcgvZUYKe8TM7FfKWltCT1YcCtXDDqW7fUltc=;
	b=OLicNCQDTa+e2H9fyVpvoRMOWCsz/wbU0blMb+22+em1kO7a/Kyy31KLmcbSoEuXGiIJ
	 Tu1PAgHuFnPWVOjCm+hKo0vKNStSt3n44QufH+LjCy5lTtDFi1xa5iN/JHHmQqnWfogsw
	 KpyC3Srpd0UEhzdmNrityGE5j7qD5+siY6bsLc0MpgSteymqYFjbzWt8O+w3/H1rpXf0w
	 rKybLLxv59Vjb6lCIIJeA0mq9dUO77yfykwAlhsoHXjGu6P9DfMedZ7kyknnqdcbXjMLI
	 6CWedz94p4EoieoWwsMW8nXcrz/i7lGef1q9EJGD0Kt0vF+xO/GLfH1OMwEXZ/fGbCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="WT/u5oY4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GzcXqymI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50888606A31E
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50888606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WT/u5oY4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GzcXqymI
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tF3T2877939
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvYWJFWcgvZUYKe8TM7FfKWltCT1YcCtXDDqW7fUltc=; b=WT/u5oY4quedgaYW
	sNkGzWJBXrGFl58suco6iOTM/CvDjTLebyfUUMjQd3LPvnBUhFAJU66cgBrgsg2X
	JZZyIFO5K9HmA/krlRozcBrmZn/r6kqRh68dgE7YbYLVsQHHWey4l3RpljtWcll1
	U0Dh55ii337z4yqu93Td6M7ZFJshHFAXtOG6Th5fW7lLD5dNppk9rbsjkcKPfc0+
	GZmSE6hXCG5PM/wYBchkExPQff+fwu4YRWYLX7MAB1Oob4lNGJrwz8sWglNKDR5l
	G81za669iwQOjSBwQkhTvGESG6Uz+qxUIRa7HHe4lrr3t9+1e9jl3gD/CnMauaag
	oT9xdA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5psmq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:28:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e58614290so45880485a.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792484882; x=1793089682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvYWJFWcgvZUYKe8TM7FfKWltCT1YcCtXDDqW7fUltc=;
        b=GzcXqymIWI+SKVdL/V0UPbFaK4oHd7Zdq5/vCJtBTu/t0ZaUuBKgrLmou/Kw/cjMHJ
         4ob7odx2U69tAp/OuKB0EJRooZ8jBQG0/Zav1oPLy0Ji8ImphyruGKwi3m02H982x9o3
         cwdUpU8O+laxzVbfg1+kPKnmA4OcCUNRyrSialruOkHeoEKclhYIUJrBChtMMTI/wmLD
         7CHvJTBlA4MxFQzTur987COlxTN0Shu17Swg72QnGGWPMWUn6IBm6ZMhpvg3NM2suR5V
         aje1nIYw96V6G1DlRkeTyabVONc1zlTOmsX0ldchljRDvT/wuebM1PM3hRp6bWegNKhB
         HROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484882; x=1793089682;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvYWJFWcgvZUYKe8TM7FfKWltCT1YcCtXDDqW7fUltc=;
        b=vyp3D/hRJI7kuJLMW5IO5iL0pqsHKLvwJL5hiDWCWbnQpMRqN3qyHugdlc6mnvwFTj
         Wqhv3W6Ub7i7EGLXbRHZsBZ7sl2Zi5aiTVpgb6bTcK2RkTOfpHUDER4YoX9ROviHxYtr
         c59ihPSdmbtPd8dKKhdB0zhWV4xaPhNwIRxs9jqohGh6wER5j/4e2MJwOeNuTIX4u9SJ
         +YZFL1yvplG2NJ/xLHHnHz4e95Qr7H4AWWW4TMYle/LWFlBuHr0xDLEXt8yGOmTO+Nco
         helKFsuAq5ZOP8Fer3luqJ/VF4jbOnqwUbkjSZ/UCGfWrXQwaG+isPhZZpVJl1c8rdIo
         E+7g==
X-Forwarded-Encrypted: i=1; AKwUvBzxuDDAHHlDfW740BnSO+gItmWB3OF/wUkZtDvrBoGBuOdgwWwrl1w+G1ImAeZ9FZwFYpuu6XpKtjmr@vger.kernel.org
X-Gm-Message-State: AFq9FYLr2FHuwdJzRKMlpmssXU9H67fJQo4grufeOoz81B+lEtFIUhxe
	tbbBjKP+k9U0uTO6jArCXxqd2FnY0LWNuC8WfRgLGfeAABWatZRjPjDFfEBNYoP/e3U/oYI6qIg
	kd7q5ysugRtC3cTPmSwY7QmHhj0XjpIp8eGFbZILuSCg92X1Uuz8ThGaPPXBzRoo2
X-Gm-Gg: AYBFou2uM2nt8tsLpUUR1eDsrwxL/S6P190kcM+9jo1Ua6jQK36w/oZht3uWIBGQ0/4
	NDp7MEso+WKfQDq90KedVrTnIEb4D7WjbJfY+RX++ohlMvlL7+LFWa3AA+B7ExBRhs+GrSmiwon
	3IZ5OR8tl2g9fzYXNef/LtEy1afQkJNq/hNXLk/b4DrWMD92Xzg3jKoTKT1pw7FYr7z5lCMRKXI
	CVfqLnmaaench4t6v/cLqY6LcOjhrfVpc1ux3BDZ2BOnkWsZXW/f5cu5cwO6i9QfeXuAawUwq7S
	nV3vTUBu/pFIpP4X4LukirOjw/t//55YcXzanv8B+eDPJkOzgHEFSvX2PLlZxgynCB0ckIyPJTp
	AqemfhEa4uXYa9btzfIt/BA==
X-Received: by 2002:a05:620a:c55:b0:939:9205:4d78 with SMTP id af79cd13be357-93f29d39ad8mr1871581685a.3.1792484881641;
        Tue, 20 Oct 2026 01:28:01 -0700 (PDT)
X-Received: by 2002:a05:620a:c55:b0:939:9205:4d78 with SMTP id af79cd13be357-93f29d39ad8mr1871579585a.3.1792484881209;
        Tue, 20 Oct 2026 01:28:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb165bsm451124266b.71.2026.10.20.01.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:27:59 -0700 (PDT)
Message-ID: <3bb9a390-3b5e-4321-a25f-77e4f5c88f9a@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:27:54 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: add Radxa Dragon Q8B
To: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com, Daniele Briguglio <hello@superkali.me>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad72612 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=u2Fyij-s7XdpVA4p1MkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfXx/Nv21cfyFJw
 nOshAxPz7aYzAWnbbcyubgttmn1Jo6x79fQ8KqWxFyB5q8nktTEKtUv8N5szYD8ytQyjaLfM0ZT
 7CdzKkan2Lk5trTS+suX0PRkWaQ9X1V6U6uEiwSNbBjhXEwYEbDBa0G9gVZuxvQiaj+TBEH1lRn
 NpOym2ycS0sHEn2255xy1zgvB2uPNXmeNATh4QD0AKtoYrvEHDdIgqvPe2yybNw76LJKc85TAKH
 htURQGiUeQjau1g1ap9LcZClQrdYWEZAnEMI+znjeo1ZdyWS8/8BlTi2fZsJBC6PSr2b8hm4B7q
 Xn856+yUwFIIVgL424Ob1gf+j2h4M2p4OsQw3uaNVYeXtTVGvV/TzcSl5IZRxLSDrhBD9wuI22e
 rVu2aIAwnCvIb30u88klkmuG48XVE0R0KmDYQ0RwE04Uq+I1Q+mfNcRjXZ4fdo+vNxMwYdIeZeW
 NR5m+u2mEf5rXL1TQ3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfXwvsczcVFPbB5
 cwqCPncPKyBZDi3fK3jPi/MRFGX47HADDoqakJPKjdjW6neybClyrgJKwKCaIM8H/ZrbSzJxoRF
 BFkeIyZOasFI14j9kZ3zXJfxjl1tu9E=
X-Proofpoint-GUID: 56jRcpktWFP-ZKheFTQldHudHoYj4PSj
X-Proofpoint-ORIG-GUID: 56jRcpktWFP-ZKheFTQldHudHoYj4PSj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200033

On 10/9/26 9:55 AM, Xilin Wu wrote:
> Add initial device tree support for the Radxa Dragon Q8B,
> a single-board computer based on the Qualcomm Snapdragon 8cx Gen 3
> SC8280XP platform.

[...]

> +	pmic-glink {
> +		compatible = "qcom,sc8280xp-pmic-glink", "qcom,pmic-glink";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 166 GPIO_ACTIVE_HIGH>,
> +					<&tlmm 49 GPIO_ACTIVE_HIGH>;

Please align the '<'s


> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {

Please add a \n before the subnode

[...]

> +	vcc_5v_s: regulator-vcc-5v-s {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vcc_5v_s";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		gpio = <&tlmm 159 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us = <250000>;
> +		off-on-delay-us = <150000>;
> +
> +		pinctrl-0 = <&vcc_5v_s_reg_en>;
> +		pinctrl-names = "default";
> +
> +		/* CH7218A needs to be powered on for HPD logic to work */
> +		regulator-always-on;

Does the power supply reference at the connector node not handle this?

[...]

> +&gpu_zap_shader {
> +	/* Reuse firmware from x13s as the SoC is unfused */
> +	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn";
> +};

Other than the signature, the zap firmware is wholly generic.. I wonder
if we can just add a symlink in l-f to get a generic path..

WDYT +Dmitry?

[...]

> +/* M-key Gen3 x4 */
> +&pcie2a {
> +	/* Place ECAM and BAR space above 4 GiB to accommodate large BARs. */
> +	reg = <0x0 0x01c20000 0x0 0x3000>,
> +	      <0x0 0x3c000000 0x0 0xf1d>,
> +	      <0x0 0x3c000f20 0x0 0xa8>,
> +	      <0x0 0x3c001000 0x0 0x1000>,
> +	      <0x5 0x00000000 0x0 0x10000000>, /* ECAM config */
> +	      <0x0 0x01c23000 0x0 0x1000>;
> +
> +	ranges = /* IO (1 MiB) */
> +		 <0x01000000 0x0 0x00000000 0x0 0x3c200000 0x0 0x100000>,
> +		 /* 32-bit non-prefetchable memory (256 MiB) */
> +		 <0x02000000 0x0 0x40000000 0x5 0x10000000 0x0 0x10000000>,
> +		 /* 64-bit non-prefetchable memory (3.5 GiB) */
> +		 <0x03000000 0x5 0x20000000 0x5 0x20000000 0x0 0xe0000000>;

Please drop this change on the board side, this is SoC-specific.
Likewise for the other ports.

[...]

> +&pmk8280_pon_pwrkey {
> +	status = "okay";
> +};

I am confused why this isn't enabled by deafult but that's of course
not your fault

[...]


> +&sdc2 {
> +	pinctrl-0 = <&sdc2_default_state>;
> +	pinctrl-1 = <&sdc2_sleep_state>;
> +	pinctrl-names = "default", "sleep";
> +
> +	full-pwr-cycle;

Hm, is that something that comes from the controller itself? Should
we advertise it on other SoCs too?

[...]

> +
> +	vmmc-supply = <&vreg_l9c>;
> +	vqmmc-supply = <&vreg_l6c>;
> +
> +	cd-gpios = <&tlmm 131 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";
> +};
> +
> +&sound {
> +	compatible = "qcom,sc8280xp-sndcard";
> +	model = "SC8280XP-Radxa-Dragon-Q8B";
> +
> +	audio-routing =
> +		"IN1_HPHL", "HPHL_OUT",

Please don't break the line here, start right after the '='

[...]

> +	usb0_sbu_default: usb0-sbu-state {
> +		oe-n-pins {
> +			pins = "gpio101";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <16>;
> +			output-high;

Drop the forced output state from both SBU pin states

Konrad
