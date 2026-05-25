Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295713E5A3D
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701267; cv=none; b=CKY6cXBzSm4Il8P1HdWEhW7r5jAPLgr5ACvHC9mAghEhATx7AqNM3WCnQEHzV3Mwx9Bp3dzhSyReviRsgXGTWlEvYOSs1erb6XxJpZUbtORknmIUPn25EtcsiQbbKaQtLXHtVecjS5/KAnVCpn/+zwSPVKR8wB959Ly/sN5qP3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701267; c=relaxed/simple;
	bh=mb83qbbxTmGxdL5OR5cWgWlR5gSfuaef+L9b3Ihqdd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p59c6426erk8SSZvbHUgKtjaMJwmdXhdJeWOwr2LHnM0/EWuNSYsspUisI9193VIaiMMj9XwMroX4DX/M/dpe9/qrkOVUCS/ROQrcyG554VaRnAwDv/J5cwkfWF7P3qjQUfOl/L7vj/e1jNC8NqG2/7ZDtQl5FleOmtWjB9XwFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmOJRszz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvEUM4wb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmOJRszz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvEUM4wb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9EmcC080127
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x2UemusCsMVtYZL72zrXHcNp
	cJp6eLVEC6vKKsQ8QBo=; b=mmOJRszzSuMpo7ZhjzQDWwbvTKpTkIkycy39pmpP
	ipxraPadlmA2unYtt0f33C85tZXcowA5qSXv79/iNfgy0ddZmEp5sdrkHTwvVPiM
	jDMb4hDV1kfVeGyIO7H/txARoku2Xu3WS9lZaZlaeI+atQOlIXrsBYN8LjBaXF7q
	x4yCz5EwOgOkZHhbD+lMipY7Tq86vxK2y0tlXpILRjj0QiCjo6jUg8H5Um2fXZ6P
	mn0rl9f3EXINXE5QDwyE/fAZpwudnDFnuWz0UAHZYEEGNMDe6NAahoBFtkGRFFnt
	ujacOxGq8gYxujTfPrcjRQMqLVy7YLeKEki+WF/QBrVUIQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma81rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:27:44 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6327b45f59dso3734851137.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 02:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701263; x=1780306063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x2UemusCsMVtYZL72zrXHcNpcJp6eLVEC6vKKsQ8QBo=;
        b=gvEUM4wb43wIK0qiMlM0C0417PtzJSiNdFSnUPVUkgGTc0qG6tdNB3/69ilwa+x9o3
         1ciDjkcdGPceLQVDMz3juhZZPmsLEhtGqMxFBHExbLfiLG4nT+lFluV+rZ2I3Z5Eeupf
         D7MdWfC3nTKBwG+5w6YbZAgG7Wb0s+hgFfxNPsDJHoBh9Gie5hIrR2umeZdJw/olN3lG
         OjVDCEPz2rqF+c7jGaNYBKVE1w5XbGj7dp7GgWXsdKhmggrc//O1375k3MlTRV5tQiqv
         DKQAWSYU0z2ETub5dKgfFhGgObLSOJtP/0Ld5Jpv57jTPDRocoFOOZn9koixltXGOTDQ
         +Omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701263; x=1780306063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2UemusCsMVtYZL72zrXHcNpcJp6eLVEC6vKKsQ8QBo=;
        b=JfQLsvbksomascvgGgPbrBzGu0EOiYiKK7Ku+z2Xnw8E0MqFQiupUaFUkRghkValO0
         re7ZvKTlHkhvoQetdU8egCsYJyDhJGJ756vatE5Gmze5t37bDDqEiwGIZIWB0sPtj8MC
         aCSibo9slCs1aVW1tIYIqPco+WnBaR1nS/bh7TgGZF5qn9J3cLC8qdAGxQ8SVYjkBPiE
         zAJyaySt9/ZdzaL8jxD0ZlU8Mn//Jm5oIUr9mJVyuNmO7ZOETlb97KfXu2BX/vPIbhwg
         lPq+ZxK610u19IyB3suE4O50ii+Jg+CNjeiClS30NKQslkTLC1OH44oQQpsQbI/saktq
         rP2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ecEE11KIn1xV0BIWjw9lRC7oe4bu/gbYDDkCvNS4kj8LQR4ImRZtvkFYD761sAwjV0fNZy3QUPWSb@vger.kernel.org
X-Gm-Message-State: AOJu0YxncD61keiQ3DdfFF5f6VfKOq+E9i2n5NJ+oj0MTZR//Mb86bE/
	V0b1dCgX9qKoAwkdPTBay+XnFXHGathpqeyKQ24xAz4DWBhlNlXIcL5YaemWFyvAfZUiP2lsBA7
	ZJuHZv2m62OR7wHrqgtWCBfN21pg7J/ZTgekQXGyibMgSUsvV6uDZCKVMV7cwMqob
X-Gm-Gg: Acq92OFLoI653IJa2xShm/XQ74/EmMGReVuha/Hjq0B6znQa56gaNH/zUplFSvqb86f
	7RMOH8NKZqnIyExEhJj7edoIyvSd7xmminCyvf7yoP5CYz/ytnSWamoYMPLrZv5P5vqVmB41tKj
	CIaCINAsQmLhAncpL6+sn5MbYi4+0FugR9XDc1iBH1VT8Pi8+1bEz63qO/q+80QHj0N9REg2TUU
	7B1ZsSbubJ9To3r2cm7cl8y96MeNm1vXT3lbs455pLbAedCqajQ2Uv5rmBu1nRHSWFYcesjNmOx
	QgCP+1KWIwmBKIog7naxhj42/1Sh0kGEfGrgRutk1okV5tfps6khJ+iCGcvoWi2WysI/xhhyjY7
	uNxTRM1msps/btRbWxTmh0TCobwg6qKKAtPP3sI1cdJaXblG40bc30gnfYX51iASkbQUwFwbHtz
	FTgt+bgtNUVaYTzTp21WSm+HPJEEMqfVCfmNS8gDh10c+ovw==
X-Received: by 2002:a05:6102:809f:b0:62e:c54:fccb with SMTP id ada2fe7eead31-67c85c33d2emr6532607137.28.1779701263289;
        Mon, 25 May 2026 02:27:43 -0700 (PDT)
X-Received: by 2002:a05:6102:809f:b0:62e:c54:fccb with SMTP id ada2fe7eead31-67c85c33d2emr6532596137.28.1779701262751;
        Mon, 25 May 2026 02:27:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb37a7sm2564336e87.2.2026.05.25.02.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:27:41 -0700 (PDT)
Date: Mon, 25 May 2026 12:27:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH 09/16] arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS
 remoteproc PAS nodes
Message-ID: <4guumv7ve7rshw2pjvumenopxsefha7hvj26tw2pgayz24ytxk@iry6qyqqqs74>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-9-f51a9838dbaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-shikra-dt-m1-v1-9-f51a9838dbaa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a141610 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6L8jDZTAue_LqfRzy1MA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: q7lbcrxgRbsObitiEeh4GfXt9qsk1hx6
X-Proofpoint-GUID: q7lbcrxgRbsObitiEeh4GfXt9qsk1hx6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NiBTYWx0ZWRfX/TBRBTHCEUin
 6Oevxw2D6j2Jh/0fVQ92Nk0Te/qBEPrwpXeQIvswnv81mFYo3d/dVlmzXGT5rnzpWalHepEVT0F
 i4DnFzkD/KftkQ2+t1YXOroTRkJDrDnvC80lfYXs7+tTwDvJM3D8rlZMSLRPaCcM6la9BefQ+OX
 z2+FaH4t8F8Alwm09zIxspZpp1hsZrDtiYPyX2HXHjOPJYFO1J/cHxkxxKCxAo4YnMNQ0cilNm4
 7tVQmg/SjQWl/JHQql/tThu+xbZjx4Wn0ISHKUO6vI1Q0iZB7wX3tgC8fB6HcqmvhzBQTu8Pryw
 K/12C/AIpitj66yBCz3WtFllvdwYMqTvyqs7NLXcbkMrf/D0k7K2C9GNYAkmZDr6tzOEYOeYcyc
 guq9O1/s4DZcq4F4uUUNLKjd29KNuBGHDaRg5dPp8hCZjHnNBjR9fOrNgyTbObsViaLvSBvexTi
 f/bKpaLtbQnpH6qrhEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250096

On Mon, May 25, 2026 at 01:19:13AM +0530, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 164 +++++++++++++++++++++++++++++++++++
>  1 file changed, 164 insertions(+)
> 
> +
> +		remoteproc_lpaicp: remoteproc@b800000 {
> +			compatible = "qcom,shikra-lpaicp-pas";
> +			reg = <0x0 0x0b800000 0x0 0x200000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING 0>,
> +					      <&lmcu_smp2p_in 0 IRQ_TYPE_NONE>,
> +					      <&lmcu_smp2p_in 1 IRQ_TYPE_NONE>,
> +					      <&lmcu_smp2p_in 2 IRQ_TYPE_NONE>,
> +					      <&lmcu_smp2p_in 3 IRQ_TYPE_NONE>;
> +
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack";
> +
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +			clock-names = "xo";
> +
> +			memory-region = <&lmcu_mem &lmcu_dtb_mem>;
> +
> +			qcom,smem-states = <&lmcu_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			status = "disabled";
> +
> +			glink-edge {
> +				interrupts = <GIC_SPI 286 IRQ_TYPE_EDGE_RISING 0>;
> +				mboxes = <&apcs_glb 9>;
> +				qcom,remote-pid = <26>;
> +				label = "lpaicp";

No FastRPC for LPAICP?

> +			};
> +		};
> +
>  		sram@c11e000 {
>  			compatible = "qcom,shikra-imem", "mmio-sram";
>  			reg = <0x0 0x0c11e000 0x0 0x1000>;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
