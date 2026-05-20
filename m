Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E7333A71B
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280448; cv=none; b=aIJ5OW/WBzljRfkTxeor+2jYUxCqY0GmG2jcN8Y41raTQ5TCGZk6DIAZXN5LXt4XE8RjUkyQV6hnvQ4s07mnlTkUEUeUUuBlCzJVzkiuu8lOSPqVNH904AedEvZbU8e7iwriA+Da/8yrBytB7mJuEwUs/xFukQa4+usBGpx+BDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280448; c=relaxed/simple;
	bh=FaiYDWv5ktpOfI7FbTjcTMjQgLuV8H8NQfFgpojEVP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrruPbCWTEkiASH1PbljKlVghHd24VpuMK7N04pnl4ZTeSmVx24+GYYAcOi2Tob3GRY3Ny3xeMfN6Cjyrc0ceTmGo1UmNx2Lh8POSsAIbGcltVKSiDgUby/iHnOrfoGFjiBNP34xNdmlYef6PiX3zxUmnCI8yCwOIsnj7hyq2rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTA9WPbK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BY4CKkUr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTA9WPbK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BY4CKkUr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7598I1953988
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sWlv1f+/kOxg4LIib9PaORtM
	K1pM/yQ62L4lr83A1ew=; b=pTA9WPbKFHaJ3i5vjoo097EkuO7KP9Oh+yMGs95k
	Yj6c2GeGk2jdInRXdfIk1M1pUTzFVfWSY9TH0JdwXh7FXM3Xy5TMUyJVF9AZj3X4
	yfm8H9/bg7Y6BgfQHTlNuIVWx5YkoVccRHLCj6gwk1p6G6e2x745Soeyo9/wOw0G
	fiWmYTwat2dhHEhxf1Pu58zLbcha+qDThXU3gZYw2HtGTq5O0rXvFxKXikZMJSZ+
	TLqM+AyVDhPR379c1B+QfdIzfghf/DxAFo9qzjSgMx3ZJCGlSVMUFd/M80NCZCDN
	qd+BY7HB7F3JbcU5TSSTdPsVmLAcHVM+1bHpsuWrFpwaZQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xvqvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:34:06 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95fc8572552so7978735241.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 05:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779280445; x=1779885245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sWlv1f+/kOxg4LIib9PaORtMK1pM/yQ62L4lr83A1ew=;
        b=BY4CKkUrUk1+WxrjlrDjTavjur4DNg4Cgwy1eXyzdDiVK2KcKuLtLRxlh3nf3AietZ
         X7q5x4fKHDU1TJdKxS3ynw5QiTX2LzqgKDeyf1ma+0kK+2b+m8GfjbajLcGSd1It58iX
         iWsZ0cSncfVa1jYy4ACHXOkDPjx7pNWr/sgPI0rH9KFZRN0t5knzYXbs+XGTuz90qTx7
         SQ7DfdxXUfITRrAn2RZBLvnklAGMlN20MYwZ/32OOhY4QvNVugd5ZKdxD023jdAkuyZc
         Z0sjKSEVWdY7HIUWK7B1IExF8qon44CGOzF5vOwKC+ZRF9vyhAHMkqkqUYwCQ7fdTaoh
         FAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280445; x=1779885245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWlv1f+/kOxg4LIib9PaORtMK1pM/yQ62L4lr83A1ew=;
        b=TmXST2QLJedUZYjkKStJ6uuZk78XduBpo654NuC5iXNJNYP5KIzHX58hULbgdCW9C6
         Zu9AJbv+eqhSgXhBcz/VaK/Ulz7R7AOMJeXKDcGew5P6PZWfnLVnnZ7HwxSc9zyKQzTf
         yRgwXAnQc/3OOQ7JbuutKxw6P2ef8niF9Z1TmeAhmUt3U/4MslxMF0kHQhs1g2c96y4E
         TvwSOeiWGliw11jqrKVzivMsCAF5RVKBTSwDzf7Fi3/jxXnUR0WW9GtUuDBAxyCVuvMW
         QsmlaxwaMkWma1tUtUKOWl9W4J02zUxeTdb6IXuvqq+B+TMM/XE1DJax95u2ay2zazUY
         0aFw==
X-Forwarded-Encrypted: i=1; AFNElJ8lJCzEpIOZOyjN2sj7LASRBGUGRIxne6MNXt0AYiWVS7vFygXbVrvZ3Bx4QX4QDemrC7EIzmZtKBm/@vger.kernel.org
X-Gm-Message-State: AOJu0YxuyRjnnngiNe+Pk/MarYClpfK9tEAs6UkfWJByIpfIi2dJIJ64
	fCwTj8P7/e5GhgrTQio/lHCDuzf/9uYJ8A8jW7Fx9J+Uerzu74JBmSFEaXEfEJrp7eTRmJIylgT
	XM3XCO0h8wW3cUvCA440v6jypSjk+jOTcyv2jmTghsKoUuhnKKTxeVXitQN6faiT4
X-Gm-Gg: Acq92OE5M0fUUxoBk44/OyxFwPpdbFTtIlEokSn91tY33ePRNveZ8AJysdjaCxoOviE
	9zbgtcIQr1hSDzgI1UVIPLis37YqMgttEp0PfAZn0S5HWzirW80SLHjkpuEV468MdOZYAH8Gbst
	h1hgXwObu/ujHy4OMuhEZGpvIuy1YvhUzZFoZYguHCohCVtjhX16ZaPg7Q2DC+PX3hrgf3r+GHj
	6ScdBcZ7Dc734cBoCDbomPQ1c/nv4G1ZeBqRk0IHi7p8cjJGI11gShz+MPY35mAhdVDpnlxfgsS
	osvLLKimtjjxR7psOHva6dIf+G/K+p58Yor32UkoXylK9jATYRl9vl7rgdiDu6lPuLBaNYG8XSF
	T6RDyfsCLhtosKftW/OUp9Av07lI1g1CZVnBplRtepJ+irmrKjc8oqHHjkbsmpf+oBkntTqcRGx
	O7dv4dZhlPHrO2pIAWPVIXjqHUDzFX/+fwGR4=
X-Received: by 2002:a05:6102:50a9:b0:631:2624:e5ec with SMTP id ada2fe7eead31-63a3eb8bb94mr12998996137.16.1779280445401;
        Wed, 20 May 2026 05:34:05 -0700 (PDT)
X-Received: by 2002:a05:6102:50a9:b0:631:2624:e5ec with SMTP id ada2fe7eead31-63a3eb8bb94mr12998977137.16.1779280444859;
        Wed, 20 May 2026 05:34:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c4fasm4905823e87.5.2026.05.20.05.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:34:03 -0700 (PDT)
Date: Wed, 20 May 2026 15:34:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add QCA2066
 M.2 WiFi/BT support
Message-ID: <jetl37zsfcs5kl4b7iarbngrdu4ebp7ag2cvpqvkku6tbl6r5n@qozh6n5fq7f3>
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
 <20260520-monza-wireless-v1-3-9f6942310653@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-monza-wireless-v1-3-9f6942310653@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0daa3e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=STQ2a8oQ04ts6E9hehUA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: fC3mQEYhmRQ4KusQ0SyFE3EvVzcc1_HN
X-Proofpoint-ORIG-GUID: fC3mQEYhmRQ4KusQ0SyFE3EvVzcc1_HN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMSBTYWx0ZWRfXxlxQ+t4dtSvT
 NPw/0UZaGG7QbtbSPBgMFWTrfn5iisxWSAJpo2GAtYFocY1faD45cBS4WQ/wnR+5g9ovcGnrKfH
 B63IqYugFE6E9D8g2uiNt8idVAm+VIX/3cO3lf1Nl10vECJ1nQPwdiXKMlZ8HQLQ1et48+IVB9m
 UrssZ1qmgyzmAwTbQfHJm2Rghc9GJF5H8C7fvAN0SyFkU0d0qMvhgrwdtmawEWbaimoxq07lV9P
 31qLtCB3X5tyLsxdbNHXJEHVfxd0DmxR7/+Ng6sNmuqDiIntbs7zhOvlYRbdie1S1MdcYeY8eG9
 JrKIYbAA8r8aw7MD9oNYqikU0FNj35f/m7TX8mQdqsWCwEC5POa4POjKokAl9SfazZwl/0g+RmT
 zpKqrMEP5yE67UNcHgw0/Cn5zj3U0S2I1qSdju2TBm+rj/M6UtBywS5oy4z0s3HsJpS8HosVvvB
 EioBEyilUz+u5WCCRRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200121

On Wed, May 20, 2026 at 01:01:44PM +0200, Loic Poulain wrote:
> Add support for the QCA2066 (QCNFA765) WiFi/Bluetooth module on the
> Arduino VENTUNO Q board. The module is interfaced via LGA and is
> compatible with the M.2 Key E.
> 
> Add wireless-lga-connector node using pcie-m2-e-connector binding,
> connecting PCIe port 0 to the WiFi interface and UART10 port 3 to
> the Bluetooth interface.
> 
> Add pcie@1,0 downstream port node with pciclass,0604 compatible so
> the pci-pwrctrl driver can acquire the power sequencer and enable
> the M.2 slot before PCIe enumeration.
> 
> Add nfa725b_default_state pinctrl for the W_DISABLE1/2 GPIOs
> (gpio56/gpio55) used by the power sequencer.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 65 +++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index 93ed575817af1c5e903662c209ead629fe202ee2..6fcad77f320cb82eccb6f07244d185abfb1976d9 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -154,6 +154,39 @@ vreg_nvme: regulator-3p3-m2 {
>  		enable-active-high;
>  		startup-delay-us = <20000>;
>  	};
> +
> +	wireless-lga-connector {
> +		compatible = "pcie-m2-e-connector";

I think it was discussed that LGA can't be an actual M.2 E-key
connector.

> +		vpcie3v3-supply = <&vdc_3v3>;
> +		vpcie1v8-supply = <&vdc_1v8>;
> +		w-disable1-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
> +		w-disable2-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&nfa725b_default_state>;
> +		pinctrl-names = "default";
> +

-- 
With best wishes
Dmitry
