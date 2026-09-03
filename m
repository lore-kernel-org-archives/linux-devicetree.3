Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFFA4A8FFC
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 13:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440785; cv=none; b=bZV/9LNCxjb5fA/zkhjJoGjJyz14bSIvdP52agybpDq5l97W0UgZR6LpiQT5NvU+sJKMRxeM3rqUalukYFuec2hFll4e31kOzdVMPAMA+0g/vP3Zsgulybx/OGBKI8yWYi4l7EUBlSHzEMOtWhQfoY+E0tyyIYnHUuKPKaY+B/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440785; c=relaxed/simple;
	bh=04XyEh+0Ry3MVpSq+udwOknhTIYoiMJgQkAcP5KbKek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lnhUC6cGcdcqpj9D9VNv5WV9SXg80p+TlzyJm8hzxAo76pyTG2ueULGXnOFe3lyKd/n2XTRwSyzjH/7j66kTNdwAbUt5QjGCVHz14fG9S1p6e1QMay0CyUU/V5IPYqob/KSh/Bt5g+ItEmBeTQQ5Shgh49D8TJAO4q/M/P/mB2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IaWlyzY1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=faLPkkqP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IaWlyzY1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="faLPkkqP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHMJX3852440
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 13:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i7X7VOXCOH0N8gUFf/UKEI8ds/3ghWLhJseA8rCyTEM=; b=IaWlyzY12P9l1GMw
	9U2SQhAom53GwB1EUXNjWsXUUlzKvFc1iJ+040NiqQpqJRJqETi365kQ8mnyMrDb
	a1GaOhKVfJwM8L4BvsLPGAitCbS8/h/WdLXRx0fLBFk3ZkfJJ12oDpGf7A02thKQ
	6N3mG3R8oMDXWdBQtFpOXLSaeFcuvey9b6Ycgcgl/fyEuBV78KOq3OIymIbK8/p7
	cac/W8n4wF1OaLatT/PCZ3rFPL/KR164Einbp3N4H/2eVpc6Wazsjul0jMjQKhXa
	iLt67WC0u1ooLFb+cvJG2lU4t6LZ5BEiSpUzIRlNwt1PQ2TnGXRi5XMroUQQhJUU
	+mEh4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m16h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:06:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ffd22d2b1so4849331cf.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440774; x=1789045574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7X7VOXCOH0N8gUFf/UKEI8ds/3ghWLhJseA8rCyTEM=;
        b=faLPkkqP71bAuYGFvHqd0hsxu/fNnGZAiw569ofF7t5QnXEX3GO7rC+YYogF/GF0Lj
         bbr13MJ9Tg4cCJYZEYVsVojQQBJFr2o+To3UnPHrxXJsOP6EZvFwgswzxqwIspmITUjZ
         KsirBm0bH6jiG2ityHgllD1Sej9S4wzNj+DUMHqTjRjnkW1Mck+6uenNydrCGeuCAytT
         30JWORjRZzxjmeE0z/JU4x6+jdyTJ6Qx3AumgehJBafPuPycTN4s4aXpe4vGrSRjmsVX
         FrFI1kBKZ9Q+XH2i3uiOIiaUdDkNVN93GzE660ce/rf9UTRd58OOPtK9m+D2RXxix3Ii
         bLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440774; x=1789045574;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i7X7VOXCOH0N8gUFf/UKEI8ds/3ghWLhJseA8rCyTEM=;
        b=s59U0CINR2epppQ2JbUCxSS5ei7IcrvHrejZi3XDex9QZ7wtX1Cb+xz2ICZufQcbn0
         4p/+ANlcmM9QNWXHtmLe1EYfMOhkCnV77IGIxdnoV8tKEFy00Fm3N0LIteLhXpaHGsLI
         vSocf2z0mMAvtMq82uGsV/CmEp/kUbDD3+mRMkJA8E9UzXf7XOjBGmWEVRFsZUPOza7e
         09rFPWVSD/Wsa4800oWtV+0S3DPk3KA4MMR1rWk6AslcH+DLmWjvNsGrDFlXT9l3yHqC
         wNNrMTxonuTDYFQ2gNgGCxwrfCX1+f2H9GTASRP2qUBDUXulGPz81ZAqvY1NmyR7AzEe
         Vbog==
X-Forwarded-Encrypted: i=1; AKwUvBwFUOgTfMGTwLonOYUed+mHckoKhRgq0q8HHtUmmEcYrGqywQ01vCB/btosZYMfnVoPnLj1Cf+6ELZ2@vger.kernel.org
X-Gm-Message-State: AFuF++lmPErtB+LyK1Vma0gb4+ucFwJA8AflSkLtlrvoJGXXWoAjC1vL
	KVsw1Hz3mNasz0ukgiihk1WE7kkSSv1Gd6Hrs2c/fVrHNfB8L/mwAibjcWZKGQ5IwTsiho3GrYe
	oD3aVjvcF66d1GiJJ3xsP6Vm7RhbuVW7o53i6E01laYq/CuzFP8SRVMe4a1n2jdHe
X-Gm-Gg: AYBFou113ogchlbJ7WHULRofhavxKP8T+HIHtQA5acpbJs36gVlxQ0vdBPxX7LOtiwU
	uzCl+5ttfyrQErPU2SshBFgZuvDaWkWj5mB8LhiayuPExCmeBQ6+sGXfK2pHjJg8Hh/TxjALj/+
	3F1MBEJ2TvkvV55B5JNdpB/gLH4Thi3tLN5tFYhy5l7sr9Ao5CjQ9pWebfOI+ARmmZFJu1Mk/sC
	8dbjwlpUTLdojbIMACuu8AKfPjrZJDyG1w4FHJK8NX/GzBbYHIeuJ0HeiakjH0FBslF5ZOhME4u
	C2RlgDrz5x5eBj7MxBh54ebt3UNCZE/d8aIUku2BoDC/n7dNF6BBAzkBFJc2TigfzR2G5pBKqeB
	G6PIcRLy2v7k9H5HE+TyjuQ==
X-Received: by 2002:ac8:5a09:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53036bb138bmr87718541cf.2.1788440774167;
        Thu, 03 Sep 2026 06:06:14 -0700 (PDT)
X-Received: by 2002:ac8:5a09:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53036bb138bmr87717631cf.2.1788440773501;
        Thu, 03 Sep 2026 06:06:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9565bfsm2309145a12.30.2026.09.03.06.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:06:12 -0700 (PDT)
Message-ID: <049af81c-d05d-4ce4-9627-8b2212979f4c@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 15:06:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
 <20260813-lvds-support-v2-1-6b11035e8ab0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260813-lvds-support-v2-1-6b11035e8ab0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RwK2d3cQZxkybtzFYfZk4K1a6CIaa9DR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX7y6iA4pNP88H
 ZPn76qwTyi0wQdAl0gVPh/nNq/b3mi4W2mh+k6NyFYy5qv3lxJZ/7BHsltuGvprF1hbQDlrUt5D
 D+L7CefodWZGjKe5G0NgmYH3gtyS/uPnMU+NZ6gV+xXssNZUiA/YQ0+VJInfpYfDwDOBfGRplQh
 K9MUp/KLf0Kvy4a+GCqfhSm+KKQQb3+bMLcBIDbN8H0ixBft7ZvyIYx6tcU2LTX1Iqo4MEcMX+Z
 PFbAWZ269kOJjf9iUt0Qddzh+UbCEwLl1BoeNh9m5OdeD+EvWy03VoDQZ1mtsurTxmYiOgcqxkA
 n6/EXvt6++33RVEOfBWuRU56zObzDLI4rcJqXf47IYnzHFxCi/Y55nuHTeoK33oqF7g7oYLD4eZ
 EQeE/T7gs5IphEO1neQnMGvOqk2m1ZsQoFL0e+Rv2mBkVAl2M0UEtgCnQACuG1EM5so/9PEZFbS
 sO5SXd08Qt1v274u0dQ==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a9970c7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cQV133JH40Yl1OylBfoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX3fxSTzFsmIaq
 6ASne3Z676RLXPNczmNZSjJT1R0/v5HiB7QFKHanqIC9kOEJKXV2r+Ww/Cxr3DCutEfxBWclKWM
 3t6ZcfFnoI4VfExIQlBTwSlYcTrURUY=
X-Proofpoint-ORIG-GUID: RwK2d3cQZxkybtzFYfZk4K1a6CIaa9DR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 8/13/26 7:33 PM, Vishnu Saini wrote:
> The Lemans EVK IFP mezzanine supports LVDS display output using the
> Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
> DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
> VESA-24 mapping.
> 
> Add a DTBO overlay, lemans-evk-lvds-boe,dv215fhm-r01.dtso, that wires
> up the LT9211C bridge on I2C1 (address 0x2d) with reset on GPIO37,
> a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
> panel-simple-lvds-dual-ports binding, which supplies the panel's size
> and timing internally), and an LCD display bias regulator supplied
> through the GPIO expander. DSI power is provided by vreg_s4a.
> 
> The overlay is built as a composite DTB combining the base
> lemans-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---

[...]

> +	panel_lvds: panel-lvds {
> +		compatible = "boe,dv215fhm-r01";
> +		power-supply = <&lcd_disp_bias>;
> +
> +		status = "okay";

Nodes are enabled by default unless explicitly disabled

> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				dual-lvds-odd-pixels;
> +				panel_in_lvds_odd: endpoint {

Please keep a \n between the last property and the following subnodes

[...]

> +	lt9211c_codec: lvds-bridge@2d {
> +		compatible = "lontium,lt9211c";
> +		reg = <0x2d>;
> +		reset-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
> +		vccio-supply = <&vreg_s4a>;
> +
> +		status = "okay";

ditto

[...]

> +&mdss0 {
> +	status = "okay";
> +};

The DT which you overlay this atop already enables it

Konrad

> +
> +&mdss0_dsi0 {
> +	vdda-supply = <&vreg_l1c>;
> +
> +	status = "okay";
> +};
> +
> +&mdss0_dsi0_out {
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&lt9211c_in>;
> +};
> +
> +&mdss0_dsi0_phy {
> +	vdds-supply = <&vreg_l4a>;
> +
> +	status = "okay";
> +};
> 
