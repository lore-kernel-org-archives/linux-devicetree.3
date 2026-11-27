Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758550;
	b=pUazGRRH6TrsRqYV/XE09feVDdiRV9yVVSVbZmZJClAUiJ1bFyysSupNeT6b4XufQJCG
	 zO+/wvETrEApl6H4Sm5EmPCBZ317eiCr/i/VS5PDgYkoBxl4pt2vVVY4gHd5Yf1IRknrE
	 UfH5uffeiH2GUHRDlROCV3tLDnCngSHQeIMrXWVlAbpEdYYTa5gjFzJrw7IAXZgBaUz3v
	 4a8cwXyRuakAPsYqcMdQX4ZvGsn3qT6wbMJFNZESW0+na1YWN+yTnFbu3p45ZeYMczHQa
	 6oIUeWVJSp6oKjBNOWsUR03vQqU7SuL/YoJrJPjvInsgd7ggZt+URVNAIQKFY+x5S2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GfQs4vr9UyydQ4+bgkQHB6QahvelFzQkYoZoBIDv/zw=;
	b=XYg+dZxAdPXq4+WOytX8SJDhfOXxXBXpXCqP2v1ALDv13pHBpJXOP+XRXFUiI/hNzPF+
	 mmDlq8wxf/iC797xxOC3T0s+NLu284pzgHeXUAx/mZ71FCVShQH5JxgL4jiaY5hGcfTuw
	 wBqEcLFgHKnoCRdrcNTwBxyKQgZZ9lotz+IumyYb61A0G1dGKHo5iy4rv4umj7s8nvbTg
	 hONgzb59iNLpdswsgy7JRAC3u/nWq62iZY0dSEPyXglvRs6XB2Exp89oarIJ8owjOvUa8
	 FGgp+SznmB8oOF+Qnz0yA5cFOWvEsMHh/W02/LeC0ecdILEl0VH6k6XLD2EXHpzIK9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Tz/Rm94t";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C3RHC7km;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71534606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71534606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tz/Rm94t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C3RHC7km
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR4Z1l3565241
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GfQs4vr9UyydQ4+bgkQHB6QahvelFzQkYoZoBIDv/zw=; b=Tz/Rm94tgiqXwDEN
	uP2jXrA3DvlCgsru70ovxcZhMicU6q5ByvWYzz5f/nA6otkegSGhs+wBUif4LL7J
	hyo5P791CdvjAJHfs0Evhi/WChrLNRfYGYe/YUJi6MRzaBwQXIdVNcmBjaUylDwi
	GTxo2PA18Ayt8KS9ULW5ezUZXvfojT0TVQmxG4GVVQCZNEu6q+QI4Ct7UBmJxfhN
	idMz2v0GQUOmrby1nroC+b4Tutdn80M6vs8slaP4uyF1WIWN2IfxuEJpYDIwXrBT
	xVDcUZwZnb2dqzGcwbgczVZxsYs7g+BFu+EpkUYUB3aprUdFdvRXmzdEOuHWRc+n
	nXBf0Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru396fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:49:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b45655b428so6742784a91.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795758547; x=1796363347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GfQs4vr9UyydQ4+bgkQHB6QahvelFzQkYoZoBIDv/zw=;
        b=C3RHC7kmJFlZDjQ7yn5lLjzSBoEstHesgtLzfAk9nxKnch8qjy7RQiQqkS60SgQYOa
         qD1pLQrcCLqXUU0cEPzP3NwJ2NarQW3vZQaD0aCYuFRTo7TWv9Ztes8bcebkrnn5GWGW
         Oh1RaZDfOwDaLCYUtoZ3xHF5QVSv63MNlgkE6OwKVURJKUmtQADiZUq/cQLcAPGMpOmC
         uND9kN3Nk/i+F+ohDGIeS31d5SdSK5DL+oNUi5yuog923418zknLVlQEziwlekMRjAD+
         IHbZD/NSI5S2esYnCYTq4abhePNyGYwU+Lnpyi8kzCIVCjDOI8mXkNGjIhlyV3NCpPUb
         MIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758547; x=1796363347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GfQs4vr9UyydQ4+bgkQHB6QahvelFzQkYoZoBIDv/zw=;
        b=rIkRT9fIztt36SnLq0t8GIxYMKIEOeQdvZkVAPvEN2ao9ZkVPX5GuerLzmYKNq1CYR
         yoKfC1ATZGe6iJTGpWNKAsdTUQ9qjbaHJ1YZnbU2c0SXkGZ0qj1kbLnSY6GbDAemwsYi
         6XRuLBSh0OQti2T1aNYUw9QYk8LFhP5qVJJm7nYgRBTzLu2t9zrcttKm/8HV53h2xxsl
         IKimd3uN1/vTVXpR2zHrG/lmC8Cg3VWC26/vyR/E8Ere5EJ/Hifn4qQO/DUvJJtAvcNp
         Gr3haYS+/RZTF2EXtLyqrK8l43fQeSptPCGssZB+XQ03GzSXdW5ppT/pzpZNzs8bUHtP
         cfcA==
X-Gm-Message-State: APuU4Z9Te7enWGE4BdfaF7wkfg9VWr6MviD6xfHoQICdk9D8A94NBruQ
	Ale+dPwfZmOz2k7SeJYzpCDapqIibPkYT2uG4xsr8VKskG815JUhPbt5OVRQUSyXLH7HmPW8dZf
	NBsXLi9mqM6okbJJvraQ9waStR2bSVPsBi2w2hiYb5fkMIe/0ZLwLNlV8SnYqsigq
X-Gm-Gg: AZFdTZdfSuaXkjDWgyjK0OO61XedI140I5oXQ4EDZI2MvggLHLWc03Gp2nI4PhlDQjp
	kk6fgVLQ44o1ZWoHxhcPbKZOIGxiG0aeQGo5IYvs02DtIoG5hcro7Y4vHIX/1CwtReH47onqNj3
	08CUXKgF6aasJsvkg2bHMlo7ug4PtXQ31uSSQCeyJSVTUove6+0PMbECQhc1k5oWOPHEAdjlHT9
	uwv2QxsBNT/vxiDzKNGbYdc89uQMWjwyuRskaeflQvMKd9hNi2fC9Ny987ZnbKaWtdIpCHk5aMm
	4fwSPLqEBZELLZtzYcd9gxJGvdn9GO0lnUASMO8GYrBJrZw7pBmpxW64AxQdAfck9uhwRYsS6rf
	0RfS2D9Pvo0suSSJMsGErbDEZKPCSFkPYdxrb2ASm3dmsGY87SOl6+mTf10w75+q+vZE16JzXNI
	8rcWn1GCo9OBHpUFyJs/JlKdBcowq9VmbaxsZpmrlbT4BlyTEt++TZ0O/YvvtiaPpDl/RmIT5gW
	+tH
X-Received: by 2002:a17:90b:17cb:b0:3b1:3598:f881 with SMTP id 98e67ed59e1d1-3b41cb20b9amr23485254a91.53.1795758547090;
        Thu, 26 Nov 2026 21:49:07 -0800 (PST)
X-Received: by 2002:a17:90b:17cb:b0:3b1:3598:f881 with SMTP id 98e67ed59e1d1-3b41cb20b9amr23485235a91.53.1795758546535;
        Thu, 26 Nov 2026 21:49:06 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm11203285a12.18.2026.11.26.21.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:49:06 -0800 (PST)
Message-ID: <ab598791-650e-4f7b-a52b-8c1143d4f7e5@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:19:03 +0530
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
Subject: Re: [PATCH v3] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261125-mahua-surface-laptop-v3-1-875b9c63d4e2@oss.qualcomm.com>
 <sashiko-outbox-234804@kernel.org>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-234804@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b0919d5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FdlVxMdq-3g6CkBdzlkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: RJpmTcnKVcWf6v43IkBuqSBgdIV2JOes
X-Proofpoint-ORIG-GUID: RJpmTcnKVcWf6v43IkBuqSBgdIV2JOes
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfXxxtjPcZtKpli
 TdVT6nha5a6iPsHhZdpYjJ6xgC2rG6afYXJNbdcP/4s687kPHFcp5C5ZkvDy0wTIssk7CM09mMZ
 FbDSXVKeEG0XmyIbwXW/7BdXmRDoq4Fus9GeiFGWY7FBEl53CH93zhMc99yTtNApDgpKZI58YLr
 6UPrr+rAC01iB+2Hy6vx/5e0x4iZWwirP0BnG1k6y81+p7tCMoi9pmyH2CFLaBBdxLP5zkh/asV
 Prx0n39icTGCbc52rx5DI2yLO0Ulw8iXI2pSrdbmnQtVa2mhXNucyotHAV2eF6T7RJ94Q3RkGo9
 7EvMflJ05qudoRgPA7uJr3tl8KIl0QPSMc+HETpJNEbt/a7BXfGlPUlGG51o84f+egiiX79Py5k
 zw5FzBjJiz3/CDqO1emBmccQFXNUA22a2Az9nrz5awKXNQdFWVFFpVmgcXEqaBxfj51xMUJEW9K
 m6+C1op+zEZbyBO/fYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX5rT9EWNAxPta
 NzEZMzSSOoYykk3NMZKucaxvZSPrmzub+x2VCp8c/dY5ZMrwjn5jNRT/CcH32V8QMvqF5sAiTmK
 g96e7MQgRPiu8qt0YRQoknRZ9Hcodw4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270022

On 11/26/2026 11:13 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] arm64: dts: qcom: SAM compatible mismatch breaks
>    ssam_platform_hub_probe()
> - [Medium] arm64: dts: qcom: duplicate CoB PMIC includes and stale
>    regulator overrides
> --
> 
> commit 5ca42311513062b6586cdd08dce26ed93bc509a5
> Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Microsoft Surface Laptop 8th Edition
> 
> This commit adds the device tree for the Mahua-based Microsoft Surface
> Laptop 13.8" 8th Edition.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts b/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts
>> new file mode 100644
>> index 0000000000000..2f8c93d900df8
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts
>> @@ -0,0 +1,1146 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +/dts-v1/;
>> +
>> +#include "mahua.dtsi"
>> +
>> +#include "pmcx0102.dtsi"
>> +#include "pmh0101.dtsi"
>> +#include "pmh0110-glymur.dtsi"
>> +#include "pmh0104-glymur.dtsi"
>> +#include "pmk8850.dtsi"
>> +#include "smb2370.dtsi"
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/gpio-keys.h>
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +
>> +/* PMICs tied to Glymur's cluster2 are absent on Mahua. */
>> +/delete-node/ &pmcx0102_d_e0;
>> +/delete-node/ &pmcx0102_d0_thermal;
>> +/delete-node/ &pmh0104_i_e0;
>> +/delete-node/ &pmh0104_i0_thermal;
>> +/delete-node/ &pmh0104_j_e0;
>> +/delete-node/ &pmh0104_j0_thermal;
>> +
>> +/ {
>> +	model = "Microsoft Surface Laptop 8th Edition (13.8 inch)";
>> +	compatible = "microsoft,surface-laptop-8-13p8", "qcom,mahua";
> 
> [Severity: High]
> Does "microsoft,surface-laptop-8-13p8" match ssam_platform_hub_of_match in
> drivers/platform/surface/surface_aggregator_registry.c?
> 
> Commit e93536b1fcf7 ("platform/surface: aggregator_registry: Add Surface
> Laptop 8th Edition") registered the match entry with the v1 compatible
> string:
> 
> drivers/platform/surface/surface_aggregator_registry.c:
> 	/* Surface Laptop 8th Edition (13.8") */
> 	{ .compatible = "microsoft,surface-laptop-8-13in", (void *)ssam_node_group_sl7 },
> 
> With the root compatible renamed to "microsoft,surface-laptop-8-13p8",
> of_machine_get_match_data() in ssam_platform_hub_probe() returns NULL and
> fails with -ENODEV, leaving the SAM keyboard, fan, and platform profile
> devices unregistered.
> 

The wrong SAM compatible in surface_aggregator_registry.c is fixed
separately here:
https://lore.kernel.org/all/20261027-surface-laptop-8-sam-compatible-v1-1-022cc782b0f4@oss.qualcomm.com/

> [ ... ]
> 
>> +&apps_rsc {
>> +	regulators-0 {
>> +		compatible = "qcom,pmh0101-rpmh-regulators";
>> +		qcom,pmic-id = "B_E0";
> 
> [ ... ]
> 
>> +		vreg_l4f_e0_0p3: ldo4 {
>> +			regulator-name = "vreg_l4f_e0_0p3";
>> +			regulator-min-microvolt = <1080000>;
>> +			regulator-max-microvolt = <1200000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
> 
> [Severity: Medium]
> Should this board DT use the common CoB power grid from glymur-cob.dtsi
> instead of re-including the PMIC dtsi files and redefining regulators-0
> through regulators-4?
> 
> Since commit 6fdce1f4a17b ("arm64: dts: qcom: Consolidate Glymur CoB power
> grid"), mahua.dtsi includes glymur-cob.dtsi, deletes the cluster2 PMIC
> nodes, and wires the common on-SoC supplies (&tcsr, &lpass_vamacro,
> &mdss_dp3_phy, &pcie4_phy, &pcie5_phy, the eUSB2 repeaters, and the USB
> PHYs).  Redefining the regulator nodes here overrides the consolidated
> glymur-cob.dtsi rail voltages with old CRD values (such as lowering
> vreg_l7b0, vreg_l1c1..vreg_l4c1, vreg_l2f0..vreg_l3f0, and
> vreg_l1h0..vreg_l2h0) and re-introduces F_E0 ldo4 (VDD_LPI_MX), which
> commit b7ff5f19bb27 ("arm64: dts: qcom: glymur: Drop L4F0") dropped
> because RPMH manages it as an ARC/RPMHPD.
> 
> Dropping the six PMIC #include directives, the duplicate /delete-node/
> statements, and the duplicate on-SoC supply assignments, and extending
> &rpmh_vregs_b_e0, &rpmh_vregs_f_e0, and &rpmh_vregs_f_e1 with only the
> board-specific rails would avoid overriding the common CoB rail
> constraints.
> 

I've dropped the duplicated nodes and kept only what's different on this
board: the rails CoB doesn't have, and a few min/max overrides where the
voltages differ. I checked on the machine and the regulator voltages and
probe state are the same as before.

This will be in the next version.

Thanks,
Gopikrishna
