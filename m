Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAD63DC878
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165060; cv=none; b=Yvx/WZpEOc7x78z99r1rxZ7L082vUmsL+TGPk8vDUSk2jeSH2DnVqCYTtpKB+m7ucCRAf/fZVe6eWc3TNphgxuSx8/8j56tok0BOC7aFzpUHT/DtQHvV49AVjTEoZUl+AHLaTOJ7huet0GhJGTXoC2xYRSFYDPMkBi4h+cOHVX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165060; c=relaxed/simple;
	bh=OWEAH7dAyo8wyOBbzh7BRpsj/UdLAjLarQG9ezdkfQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKOLRFrqdcZtaNTFiSekIQJhJm0B49bqo5TTNUr/tlGiezTAsr7YNGgI3k9sFdOxmR9gDoPrhgYxZ+h5aRcrZeoGIk7BRawlxulpQa3kGY0pvjDWNKb+8Ex5ppTXYkNMlZmYb/RFUg8vSfVfE4mxJefjyYy5KAAXjRgob7yKmYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flx/W+Nt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJ8TbQ+L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="flx/W+Nt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJ8TbQ+L"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xbbq3427333
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=POsKBAuXc6ANE9hBmQcr1oDm
	mA+VNlB8F59fCl/wB3s=; b=flx/W+NtWhKHUnewrqgjxsTdNJ5iy+nhPI0NtSHS
	gVB2yBkT6n6zjB46fzH3KkBdRYw6kTYsaFLwvJ90DPNME6FUZqsIjWJ5sa8UFDls
	muaPG+DYB3AYjp7gqzsGbvxAI1Y1Fe3RMhXMqhlBrelA5WG2xSd9o9L0R9qhoZu6
	H/MvuJ911RZMU/5asgpEaPoWo6tZPDaG681qoQkuW4GQOBibKCmzMcNzMXG4NP/a
	Yg0b4xgY5sYgYt63l8ftT63W0MiHW3XGOAAC3qCLYLVKnz38TpBcFeSo8jVbm28y
	TFLuoesl6gYsPiHDR+22f84T8tdnhMFLMZLRGzVxRRu+qg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pm8dkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:30:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939187562a1so778863185a.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165055; x=1788769855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=POsKBAuXc6ANE9hBmQcr1oDmmA+VNlB8F59fCl/wB3s=;
        b=cJ8TbQ+Le1Aa/cKaPeIiMhtBO6+IpRnVWcHrOc28Z2jrY5rEFxKjbSpT7lGNWlHNqp
         XD5nAMKX/qGA4cBUi/T1nIAxe7o33dV3pA4m7RYTzJXzlrgM9+eDsXCAwSPf1vwfY4kB
         wECeXs8vetvZ5k6L9ywawnTIC0YrRvhyA5/3flyQqZotpW+kYtsizlzRB7vs4k9D7MrE
         lSNMg732VSeUg3Gob3oZKzue9ca+Ul4IldvQ8kLLFN8uo8kL/VZhbrlFVp3S6gqKvL2j
         1D2ltNwbC5FrhuVPOj3Z3i2uR33MZohOURshRhbpGffZ4030RxHDEGJtThb6QaNgFW2B
         YKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165055; x=1788769855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POsKBAuXc6ANE9hBmQcr1oDmmA+VNlB8F59fCl/wB3s=;
        b=lGd5B+7BCSWVevnd/xP1csujfh/R8Wq+n0spCWxcnXE225joIag65x/Op0R/DP8tPp
         3cB+9Wi/D/g2Zawyf7AixmGWGk7N0LJ/zQVmTT0E7tXrFg+DF4ZAnMykJcVf9+eVUIXW
         vjYLzaYfYpj4h8/UJShRt8rhiD9ty5WS1dwSnh5aavJuYty//kzQZx4XjlkuEDtvPcZ2
         NAoVT3vkLxFQ3WkJA6Xp1kcmzW0TDHwImzwu3qb24yOX30EOrjJRHcAFhe1+3CKomX29
         hOFZn8S20Ybuq4yvQiGBfgHeIrFPNCEuwHn7BVvOThE+FKxbIJCsNQm/iID46HN+S8+Q
         4OhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpeZ0rViXt1h/kOLpB+U46hQXrIjj12Een1o/DX8+KI/4Fyva77FAkCa4ZB3NspJKjnbM4DZXbZxiQs@vger.kernel.org
X-Gm-Message-State: AFuF++n9E4AdmwUBIv1+6TqZGk6T+3dhQYKy9LmVuyzVjEXExrpMfeMp
	lQbKLaPYB8rn1zK0JlFwM8PvJuOTOY2Wge+PM3QY1Lv1iSbACHumLC2FKHyk9WP6XumyjaHR+79
	Fs4TeLCHnQpMGRXR3PvIfhNtvAChrGnNilZz9tzHLUNTixPZ5h+BiRhgERO4K9ibi
X-Gm-Gg: AR+sD12Et3EwugcaFEJkT4hdKRspu7D1GQSy/U+gAJ6u3KNnTeYUChJXAqou3c4wyQ0
	xVS/wwVnJ1c4QzFcXtfsg4Va1FmItZRLOnggnmj5G/oIDGi03I5N1k2anc9rmpzyHWma4Madtpw
	f63/ILZTJ3xqjhUN4mWtVm0aS2d2clg7cJEI4biGcOV3AF6Rp/L25C7lnXtchpR+o/5c2gZAvLb
	B8SUZ9zJDX10JJ10QIjihBSsBTDbnnVguqnXM74u/NZfryOE4IqxFaI3hU+Xm2dyjE27FqI6CrM
	II+zTQX263/kR7DOAshCvZz+NiMAOmlTLkSPaxIrk1K6NGjoRcrrOntxzxAicBkSGMriJIOJij/
	6cq09BIgHMEdB
X-Received: by 2002:a05:620a:bc6:b0:938:61d7:badc with SMTP id af79cd13be357-93913924d85mr2445486685a.36.1788165055263;
        Mon, 31 Aug 2026 01:30:55 -0700 (PDT)
X-Received: by 2002:a05:620a:bc6:b0:938:61d7:badc with SMTP id af79cd13be357-93913924d85mr2445481085a.36.1788165054730;
        Mon, 31 Aug 2026 01:30:54 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436e2af45sm12344620f8f.9.2026.08.31.01.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:30:53 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:30:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
Message-ID: <e4p3eycp7tmwugjdei7kyqt5rkrbd4ml3f3oiferqpfpxvnjfg@ildezttj2ka2>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
 <20260830-x2-hp-omnibook-ship-v1-2-9feada71dc79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-x2-hp-omnibook-ship-v1-2-9feada71dc79@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SrU57hk8A4P4HS2XyYF0g3NjEcEePn3e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX2jcVaSAy6V/V
 WjUV07mp/2FIyRvnBNCpFi7riDl9B7oPJT6ZBoWgYd0bYRbhCk/hEqBuocD8BOI9qdFSuCKpN9g
 xqyO+juc11gYS7f1xkJNBY9S3st1hR7/N/9J7nnhIINczUxu0bCVzDQPfizLCp0HJ9In7pB7lY4
 8Wt0RVLj4dYbOF/liDk1dL9p4oV+hRVMrrZZ61g+jwl5uxMmRqmRrwb15hp5jcK6q1FgUtVdgUs
 wHJCa6i+CU5/VlX2p1jr7aHrql6rSg/qcFF/pfmROA44VkjDikTUBEpXMd+8eespseV5uzG5jjT
 QS/XCizAM9LrQnnxHucANBJnbPMveUDg9GFMh+V2Ahzk25+uPHLaBBh08tax64pPFCiPOQOol38
 iE4Loy23rAMRUvhu3As5BldqktodDD0yHmRL/v8y98zEj6eIhWpDnnuToWZ/drLnkRHWbbOUOSX
 mDZ9WdEHdp5V6XFrPGQ==
X-Proofpoint-GUID: SrU57hk8A4P4HS2XyYF0g3NjEcEePn3e
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX0c8qWwr0g08k
 Iv0hFXFh7EkZs7NdI/Fq95yaKbk/DJJqy1bGeDGmpZZ3P73DCrlJs3Yr6rEvw9caDi05t2Xc5xg
 HxfhzHa0pV9Wqa9ANnIpZ3NYkzyhPx8=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a953bc0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZUcFhDScn09uu_8yJssA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310072

On 26-08-30 14:56:15, Jason Pettit wrote:
> Add board support for HP OmniBook Ultra 14" Next Gen AI PC
> (product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,omnibook-ultra-kg0xxx" / "qcom,glymur" compatible.
> 
> Enabled by this device tree:
> - internal eDP panel (2880 x 1800)
> - 3x USB Type-C with DisplayPort alt-mode, USB, Power Delivery
> - NVMe SSD on PCIe (pcie3b)
> - Wi-Fi and Bluetooth
> - HID-over-I2C keyboard, touchpad, touchscreen, lid switch
> - Adreno GPU and GMU (Freedreno GL on Mesa)
> - Audio playback and capture
> - Real-time clock
> - ADSP and CDSP
> - 5MP USB RGB Camera + IR Camera
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts   | 1012 ++++++++++++++++++++
>  2 files changed, 1013 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1c86e7e98f55..6896162a9171 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-omnibook-ultra-kg0xxx.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  
>  hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts b/arch/arm64/boot/dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts
> new file mode 100644
> index 000000000000..d1c1880a50b9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts
> @@ -0,0 +1,1012 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +

[...]

> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/glymur/hp/omnibook-ultra-14-kg0xxx/qccdsp8480.mbn",
> +			"qcom/glymur/hp/omnibook-ultra-14-kg0xxx/cdsp_dtbs.elf";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_soccp {
> +	status = "okay";
> +};

Drop this. Already left enabled by the SoC dtsi.

> +
> +&smb2370_j_e2_eusb2_repeater {
> +	vdd18-supply = <&vreg_l15b_e0_1p8>;
> +	vdd3-supply = <&vreg_l7b_e0_3p1>;
> +};

[...]

> +
> +&usb_hs {
> +	dr_mode = "host";
> +
> +	status = "okay";
> +};
> +
> +&usb_hs_phy {
> +	vdd-supply = <&vreg_l2h_e0_0p88>;
> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> +

No redriver?

> +	status = "okay";
> +};
> 
> -- 
> 2.47.3
> 
