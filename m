Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC44F3CFF51
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 21:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629680; cv=none; b=LCDIc+U4UQRHZXh9ucxqMZgNf3GV4XE7P7tWuPuMoptfDPgxxgXYtgYmqCWo6PmXObdMrpWAYgV3QiwTxFikVUpJ/1QuZtLqPUvwLOW1sVmwNRiSu4LriLp8X2ghSK2435VUgWkK5bJ1RSVX/QARxW2O4Z9e99/FsL0zyVgBhwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629680; c=relaxed/simple;
	bh=0i9yQKbjU1hIXSuOnmpAvy4haUvfQLHFSxTtPHpjr00=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Act0ZB7Gb0F0gCj72/le94sfxrMY3SR6Hp6kN8+xxBreJqQTYznK0pYHKHg2TjBf0M71WayCHo22em6RkrO/ia58pXhc85H5Ik3zvRRHCR4w7bl1dutzAPDRCvQMAcJTSsUf5PWanjKmyMeJzJ8FciARHwYEtCfMhHiCZsAC1Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGVBNbA/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KC59GQqG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGVBNbA/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KC59GQqG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SHvMb93195799
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 21:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/hiL0qeixXa4oLwE6fqQAOzFaxdQ7/jcwOb7u6Pi4eI=; b=XGVBNbA/zyTtoClY
	9AjzKlgTH9oZtFKAK12M5miNGxIRk8CV6LoDfl7U3rPFWyBXdxTHbvTYwoggZ5wn
	AGuRd3fHZyxK/U43RndeXJq3POasV2qUQfmK2Aq5gize2nMMZShCIZI0LPA2Jgv1
	poD2OGdMmLgQjoAWfJmM5ZPhCVWo0HUCyIPxMXGIo9b9zVa2PSmfACOOXU/7/Y6C
	e1ITjMYJ+eqX+PH8vnQEK2Xm64/MaxZyf/6Ic9xzcQQoF1UjuwSnGPYnbjPmGvxe
	SwqlhnVhHiENh84N95CNc3cGqe/43LZYoqsedfmWkNkcZ/iPp6VERISdq7ujMjVV
	TI5N5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03gt84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 21:07:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso56112785a.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790629677; x=1791234477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/hiL0qeixXa4oLwE6fqQAOzFaxdQ7/jcwOb7u6Pi4eI=;
        b=KC59GQqGgIGPVMlLrrm9qWFn4sEERcUkpdEcy9j89g3D7mv6QZ34WgCBwgPiyMQP8o
         9xKaB985Vt6EbKJQhJTTDqLToZ+/FGhOOaO2rzGVIqIfALoVlyuXH0sCTqb1cAMA4B0h
         DPHA38vK6kqqEMDq99iT2Kze/rfRaFgWcbvA8CnJvAn0teGDq5wa4ULWfPZmM41a9HcZ
         spSPuNlgHZiBqLjqne2VnXgQA8arcMppRD8567eYHMimiv4JJXtJyemz0m8F0t8XexF7
         b/UpE6V1heDm9H2FAo2TpgKPr3GPPOeULzCL8lxW8Sg7xC/dtuxDn/TOTFE5oQ8VxacA
         tfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629677; x=1791234477;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hiL0qeixXa4oLwE6fqQAOzFaxdQ7/jcwOb7u6Pi4eI=;
        b=qGj2EWiLXAGJsjomgtklakYdKkddiQGu6bHmGGA6AnpUfy5CY+nZ0bheVLgn6D4QBH
         ollnaRrNyIykZn4gmYjmatfgvc77Sf+A8ImQ5cTVrZJd/LezCsN3hG6293kzpu7ZCRyn
         1vXKE1nFKDxYESu0MbV02qll/MxTrPgdVvTt3BJ8NNJrEqTPsyJuF9JyF6XA2qFy/lEF
         JDYxv2FeSqKln1+elmEs5tVj+7fTzV3Vu3+tN/Lf2LM+Wdh8fj8tp7GX+LlCeXRXLRbx
         aKfj5l845oa0LfJRyTXZGOyo3CX0G1bIu1NUBh08AfAOn8biV4GbAVqU+uXCPAqDeMKH
         dCRQ==
X-Forwarded-Encrypted: i=1; AKwUvByKMIZWSRESa1HlBC0vN26LxgNl67f1reOWd5P67d81JFIuDfL4DohvPY1UG/dOTWDUNilbKyga+ctJ@vger.kernel.org
X-Gm-Message-State: AFuF++mGrWdkBzUjZQRxwCrsbvqhcPixFgk5GPDFaqKDhQ64Q6b+BiJ1
	XAy/QZ+QlRxbvDnkVHIyvD8Oz1prGrtMcQ4MBmoANaY29W3XzjoWCVx3icqeaHP41J7R/OVdCUj
	esGXqHrSwjCUGWo7RYYD2hrkvKeShdP5YW8MJQq8guTrliIM9q/GvGVRL5vO0qK9c
X-Gm-Gg: AYBFou1QIWmXOPZKBtTCuvbB/L3C8rPLpJMGj0rJ76t21pK4H1UC8SHsCflckHLwJmm
	N9GJm5Xyh7FUM3bbS0MZUSRQfbDXi13XMAQgu2bFyp7qaPBqpSG46hEN+4Zn0/JHtGFtN0cQ1/i
	nu1jXcWYnE2iyj8urUrD+XX9QGlKWGDJrQGFyHexABr/qw1XSqm2lR7CNwCnMNpNtN42bu7CWHL
	Qbsot94TuunPsKt3HnvOYUBjXIAUQMZBUf7FQ4XWZcsXLizA4oz42l9WWbI8XFq7uzb+1PfUFl1
	t3x3I65bSGeOYMQbqF+C24HOrV7Jx4JJ1k1ui+Thp/JuZgI787PAJ3bIO3hA8LMo86I4Unrths0
	1GWdeuMNmR7jvW3ziypuDYI0IeA==
X-Received: by 2002:a05:620a:46aa:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93c8bf00b56mr125014385a.17.1790629676627;
        Mon, 28 Sep 2026 14:07:56 -0700 (PDT)
X-Received: by 2002:a05:620a:46aa:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93c8bf00b56mr125009685a.17.1790629676077;
        Mon, 28 Sep 2026 14:07:56 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a00c0d538fsm31156575e9.1.2026.09.28.14.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 14:07:55 -0700 (PDT)
Message-ID: <c4d482cd-a670-4e0a-9e7b-a0d383d0527e@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 22:07:54 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260928145122.1337186-3-srinivas.kandagatla@oss.qualcomm.com>
 <20260928150404.D18611F000FF@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260928150404.D18611F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA4NCBTYWx0ZWRfX75WezPVlU5ht
 lgNmAHh64n9A2B/e6VWfrfehx3l3lG8isrulu62VEzNbtY5mLXRnNuoddFFyghUXHmxNZrnfnXk
 DPdT8SuIvFxcO3LrbVDu9Ofnz4S/rXQ=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abad72d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wMfHEhPWk0epOlVY32wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA4NCBTYWx0ZWRfX4xAnkJWcrQfe
 FvvViOTapXR1uJjqkl7lOWO5V9Oxx6Dc2j8dej9b692Q0pZkdPilDRtwerC8VnP+j2oAjXG2IF1
 xQT5BpZrC5+IahOmAxAdXvjYpF6w19iu7Fz/lpG/2tHee1rNqFpSQUJy02XR2hofNYDjkKDRSlN
 tlhWQS6sLg0JqODS3C/9t7uE1mshFY0FmbLM7swfqzhpyKGoQ5yc83Lp2MQ6sdE3wQcogB33xzs
 G02p6BC1tadTEQPvbbkQCIsVDv11PW67wH6tne1aNmDsJX1F2bcddEeqYyWQfjnu5NrIhrn2ofz
 M5v96Q81ySiyOAKTbnI92FXcnGNMgFob5g13uyZSVfTV7DJdpoBN4x0x02/G8G3en5ba/XLXdEA
 o2PEKtp7tCrKDhG1Lj58cYJCoiSZ7rSJrqfHfcb8aBTyTJ9wOtad6WNRisl+UqJC92dpBG8/PFw
 R5Oq6k52W5aEYy7KwfA==
X-Proofpoint-GUID: 0dmcf-ihRfq5_2mAwYJR5ZK9rtYnLmeR
X-Proofpoint-ORIG-GUID: 0dmcf-ihRfq5_2mAwYJR5ZK9rtYnLmeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280084

On 9/28/26 4:04 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] dts: Reset GPIO conflict between ptn3222_1 and ptn3222_cam
that is correct, I ended up sending some stale patches. will be fixed in v5.
> - [Medium] dts: Panel power sequencing issue due to premature backlight enable

this is same across other glymur dts.

--srini
> --
> 
> commit c99537659e637d229456f818bb7c8fc0b3d7fcf3
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
>     
> Introduce a device tree for the Mahua-based Lenovo ThinkPad T14s Gen 7,
> a Snapdragon X2 Elite laptop.  It follows the Qualcomm Glymur reference
> design used by mahua-crd.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
>> new file mode 100644
>> index 0000000000000..26d6d8285e040
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
>> @@ -0,0 +1,1272 @@
> [ ... ]
>> +	ptn3222_1: redriver@4b {
>> +		compatible = "nxp,ptn3222";
>> +		reg = <0x4b>;
>> +
>> +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
>> +
>> +		vdd3v3-supply = <&vreg_l8b_e0_3p3>;
>> +		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
>> +
>> +		#phy-cells = <0>;
>> +	};
>> +
>> +	ptn3222_cam: redriver@47 {
>> +		compatible = "nxp,ptn3222";
>> +		reg = <0x47>;
>> +
>> +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> 
> [Severity: High]
> Could this GPIO assignment conflict with ptn3222_1 above?
> 
> The ptn3222 driver requests the reset GPIO exclusively during probe via
> devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH). Because the GPIO
> subsystem prevents sharing an exclusive GPIO by default, assigning the same
> GPIO to both redrivers could cause one of them to deterministically fail to
> probe with a -EBUSY error.
> 
>> +
>> +		vdd3v3-supply = <&vreg_l8b_e0_3p3>;
>> +		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
>> +
>> +		#phy-cells = <0>;
>> +	};
> [ ... ]
>> +	aux-bus {
>> +		panel {
>> +			compatible = "edp-panel";
>> +			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
>> +			power-supply = <&vreg_edp_3p3>;
>> +
>> +			pinctrl-0 = <&edp_bl_en>;
>> +			pinctrl-names = "default";
> 
> [Severity: Medium]
> Will this cause visual artifacts during boot or resume?
> 
> It appears the backlight enable GPIO (tlmm 18) is passed here as the panel's
> logic power enable. The panel-edp driver asserts enable-gpios in
> panel_edp_prepare_once() before the eDP link is trained and valid video data
> is streaming. Bypassing proper eDP DPCD and backlight sequencing could turn
> the backlight on prematurely.
> 
>> +
>> +			port {
>> +				edp_panel_in: endpoint {
>> +					remote-endpoint = <&mdss_dp3_out>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
> 

