Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA081370AC2
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 03:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614050; cv=none; b=HShOuw2xf4wz1+HecycAloKMav8ETS7kzn9NWyGtSNRxUuSmz27XnkCfxN1fA1/G07HsFN08+7Kjur+DBJ8xQLCwQToK0F4U9KABYeoNROOFSuFiMrkAdNyQYYF39UM3Rio4+MaTQSBzOJQB6D5hS4JhpqykStvPG+OfMPF/zrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614050; c=relaxed/simple;
	bh=omyFGu7zMrBNkx9/hINlWGA7NZzna/VDrEclEElieyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnPAOlRmtx5K3jCEYvI/pjEm0ttOoinb/g0Z1xhySy95gYIkwFUZYqoGqRMVzio2Tluy6DkG1EHGwY1MxTPX6D5KZfTK0gLWBtzit0fLCCjtC69qYs9FNkMwb/5a95PBgqoAAbXfNURz+LTXQYMOcNs5qAHt+BYiIIQ3YHicu5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPuoBMz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OegSdY8B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPuoBMz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OegSdY8B"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2IBTl3238103
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 03:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vmcg7SYP8ZXHyrIlBC+RXOu5
	dKQEPDtZ/2EtBYdhMEo=; b=PPuoBMz0iWjOZ+VEsY6UE4r+NR800lU++LYwlbrj
	+giumJsSCGFw9IQPBVUSkUncrCNjCw5wIKWY/ajEfrG8mK758GnmbRQV1eDveEI5
	kg0e4GKCMhRRsVAYZuB6nyZlwzzbhZ4LrSAA5pnMxmBPc6C7h1h451V6SWM5yDGM
	Ab0fuWGobxPhREqeCnxKjQ9ocYcjxCWy8fqYdz8KoUmQJMql1/V4J/EDxffrFkQu
	d4ijJkBxZKlmHDsnNYCofG0hB4haWPEykkBpLgTG/lKO9aMAEhTGk4T4VqqcvadE
	f/bXkGipQb+3bsjzVhY1Fkkzr0WuuADKZ5+OhaULezI0dw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqyga1x36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 03:00:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so342451a12.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789614044; x=1790218844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vmcg7SYP8ZXHyrIlBC+RXOu5dKQEPDtZ/2EtBYdhMEo=;
        b=OegSdY8B36FyqbpjXb65qUCR/9l5n+u+Db8vzh2vuo0fgeaDsrj79O4QnuGbLbtzis
         GYJ5WR0+0TFCCfvEKvOyqonQeIpSL8+j1GL0iNg9mcyef8Jh51kjQVsksNanjZYPdMG6
         AbVyObkqgM8D3Zg7jPyYSYWkCPlLS5AIVs5D4gxTN4Gn5cycVVVUMtWaJWk+61dQ4/y2
         NbISchfrnIlMV+BgafH2siFpUXMV6G7faf+3bwRdSZyIYcV7tXWZT6yN/vNB/JRvbc40
         HI6nEfmmFrS7H3u8KoEkaElY5gai1ckCn6ry6jhVWiLiKIpXFHJFEqHAxOjlpaDzhYnL
         FTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789614044; x=1790218844;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmcg7SYP8ZXHyrIlBC+RXOu5dKQEPDtZ/2EtBYdhMEo=;
        b=Wd7PPOZtpGrCoKpCQgODIDdoq4FLaVBtye5I0YlAo14aM30ERsqcHe9IVvIOLFWIF9
         WenwtKhI5fuMT8Z5FriLrjc/8K7zF88Mcuaci5RSZalDeIWQQWwS1Aykw+LIM/eGEAE1
         nI4GRTkLD+BaZ97cPVzZlQUPKndy3iKrPt/oOus98ojiOe0MN/4UsvyP7VeSi9XUTjh1
         vmig8GSAiHNHvIUCxrZn2mT3o/2Euxwq0NqsLHUTL7xZoyCZu4wkbCzH7cFyp1UA1kUn
         NasIf+MUHUGXGOSkLiKRuJ9JCujW1tqJzHSZaa2hcY8Mhgb9LmJ58MFdi9EA4D/viZT7
         803Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2Ov8e2L59x0IU4w70/Kn9K8WmcOcGUq06aWHOYy1N317GVZtEOKzSU+C1nBaPIIOL2dQva2AzeLF4@vger.kernel.org
X-Gm-Message-State: AFuF++lI/vu7iFrNgg0dgcaIoz5A/3pKk6P4oOwQ1rJaUQPEn4MY5N+g
	QqR9GdiHi6Eelyu1eoNqhcU2QSb0xEnipmnGG0TW1hNEvTah7II4jDyYq68IQSXmG974RJFX4tE
	DiIVUlOIPBp8meBkHGBtQQY/jSP86xzruhiP6JgVLNYbcsU/40zSRzgpedY+hcwA2
X-Gm-Gg: AYBFou1Q+2wmsZdmsMhwLkLZTdaqajV//wjy4StP65+Z1Z/GMDmzpNq56dzjiatFX0e
	rH9ufnWZ3WwnTjRsm+1765e5JoRla8x09D52g9OV2OtSTfTeGKDCiOr6Pvg5G+gZV2hGuAg7EA+
	SqAOWB169rv/YYnGKcpEhUPWBQIZyUB2cs5xnwFOwOymCeO0cn2IOtfE0BFDXMnzp2hFPlZJPNL
	poFRerfHuRpWXFbl9V0CnfCw/xnDDNwxpkczDtrnfu+IHDkvCoyo97vJi+PULQiLD17qsvyNwT2
	eJndAtjdl3rg07rz2bJW6CnlOgocZ4h2FR+3uTXrMJWNLAM3X10goGskIViM4imei86Ue/G1z3d
	v6+USrhRUGo82sL8krN2weQf6o7O0ClSpJkVHcPyaZCo=
X-Received: by 2002:a05:6a20:430a:b0:3da:6bdd:2308 with SMTP id adf61e73a8af0-3dd5f5d673emr11853310637.18.1789614042966;
        Wed, 16 Sep 2026 20:00:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:430a:b0:3da:6bdd:2308 with SMTP id adf61e73a8af0-3dd5f5d673emr11853194637.18.1789614042305;
        Wed, 16 Sep 2026 20:00:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ac47cfsm10357234eec.17.2026.09.16.20.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 20:00:41 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:00:36 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Message-ID: <aqtX1Dvi2uyCEdMx@QCOM-aGQu4IUr3Y>
References: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9cmjBIkQ2xSjaGre7Fr_RQ7bOhD_uAjH
X-Proofpoint-GUID: 9cmjBIkQ2xSjaGre7Fr_RQ7bOhD_uAjH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAzNyBTYWx0ZWRfXwpNQ1AJ0ae0s
 bnuPJ4XvnFTuia8oCdO9tAlIWjDyQ6imR/dlpqEsCd0gENxhD1SPDaeflwJg/UR9W1kOgcxlski
 SsKJ/iiCxOOWJWodPV6o3gUErkZQBy4=
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6aab57dc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4j1a0SwZ8iOXVT74WvgA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAzNyBTYWx0ZWRfXxje95jzEJUu4
 s9vajAnZkT+PkY4GO3EyIy49bf0xPNHgy30kC6pWav6ZnuWmL2LiHCihxzvJadl3fGVcllJbEGY
 3PbYBevLoUTd2oumzK86j0/rk7/egCnwj0Oq3A6QB1mRwi4W0oaT+UiA84bR8y7CV69IA3BLT4L
 yIGsM31t/ZPe8ZguINe+hJTkmA04XDlpadypJW6UikIRJ8h9y5zmhIYr7ialy+DM0USGXwwu17g
 ARDxqSVlWVo+IHmKHouOHOCLd+9OXt5z3O82PkCqjRRGmV05bAOWR+pZ8vvq3TVzViNRMYASSqg
 zuZYJI0gElyaIIvVCZFXK5z5YXpQb9jnIm5lB1UWrzKMoc3ojYlIzZBU6u6FadCmQU/x6l/Utvm
 2tPo+Re6oILtoszprTLRZil4bNOnM2t58JTTrKm30/pQNR4+mA0+YePkk1oH564jaJY+n5Otlk4
 MdBYLZRvx93r6yx8HPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170037

On Wed, Sep 16, 2026 at 05:55:37PM +0200, Bartosz Golaszewski wrote:
> Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
> nodes.

As the nord base dts series hasn't been applied, we need to call out the
dependency in the cover letter.

Shawn

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Bartosz Golaszewski (2):
>       arm64: dts: qcom: nord: add GPI DMA controller nodes
>       arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines
> 
>  arch/arm64/boot/dts/qcom/nord.dtsi | 219 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 219 insertions(+)
> ---
> base-commit: 3c60a5740403002069d54463b6b0f603b9ba08bb
> change-id: 20260916-nord-gpi-dts-40456500b7b1
> 
> Best regards,
> --  
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> 
