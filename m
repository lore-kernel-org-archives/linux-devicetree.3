Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC8A3D0BEC
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271692; cv=none; b=m+UCwHU46fJR50dEeHGxL3czB9yhSwiaXbEjYvIoJTlPTHfLd4hMka0kkzO72OtbmmSf/6fJARnLr0DDJ2+GQuan84ygzdgz5GP7ruhFMsu1CmLJf9zYkmJnSjkOEljp8HFDd5tZr0i5irLWPeQukZcwIu1Pxo9o+AtjkmKEpf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271692; c=relaxed/simple;
	bh=5fbnBvWi+lTHcB1CMAP+kXzI6sA/MMAvO1oj8KtXlug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecVM3BIpQ32EGNuZMXkQ1NaUya5ua+EAKv6yHgxOGXxekjxn9rv9u4fWJRo8r2Nu3Q/5/cECipXzs/1rg/u9YSyeOhrO6w9h7t8Zft6UgxwaNLxxSJgTIposcf0629eRGsNX+FL9uaauaSSQoGMv10smEFbPCpNE5oqt0JSMyA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EU1kbSXa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UN/o18uv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EU1kbSXa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UN/o18uv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K76SN5629788
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b0jt1WrNfwmf+YLbPjq2bHxh
	n5Z57n/uD+wlyxusIdY=; b=EU1kbSXao65YToB0+Pz8kmmULOAQ4VXHx4nZI2mg
	xn9PS1mMzMl/hMFJObsziqMasn5bhEpxTUAGZh8COmYkzFY0JfjDToHbJ9vDTm5Y
	VG0+XKuwoLVWfPnFne5tPXYvqmR1dlF26AhrF3JFbrVnEpI/l89jGbmM3XwbCwBk
	Pf2LfDzMB7ALP7QmL9riSaGsAf4Tyb/+KXcm4gB1dRztLCD/xV+fRIF7tLOgJuXh
	dCNlRGXCaJUb9p4ALJz56PdaVO6kltTZmxavhaAaWBKmdAe8cdWJ8ykfG2RqzkHQ
	vekMCPHgCrfLw7fT5pMsM8xhDJFjdnp7S1o03mZ46be6pQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3nv8fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:08:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51605cf3c60so27450651cf.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 03:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271689; x=1779876489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b0jt1WrNfwmf+YLbPjq2bHxhn5Z57n/uD+wlyxusIdY=;
        b=UN/o18uveJJx82VjIrZSU81SVfmNmGNvuuh2qpaAEBPDo8EIDA+Gv16llmRK/TVG/d
         nwXupFruI6pa8QEeY75Q2EugOQBEgzJERByPiQCtnQU+TE1gesW/5IU8YIphJUKOlFD5
         lNptZ3o3P/2oHLMCwy723miBB6AMoaoeBZtkt+rv3AjYk8XPGbNAVEvFoVZWSinepztN
         D7f6Ci3c1PS84ooXgB21MCF0jbtfWQEdOk+X/ZhvcpM6Pdo5LD0ZuljuyjQQMjdCza2H
         RMXRofMKbzWqzNhXx3VtIJLtFwqn7UQ0QqIoo+YEQiDWz+YlY1bR1KcbkknMRm6mB89F
         /OvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271689; x=1779876489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0jt1WrNfwmf+YLbPjq2bHxhn5Z57n/uD+wlyxusIdY=;
        b=XChrcUOytTLzlOOnYIXeRnMAPWbEk+yY6slguwWyTu5BQKcoaWWxZYJxdI9HrZFcsq
         4mF/QJg+WeJPO2oIhXxI2yGOGPP6ga0yUenLNOykIfDKr6FxGyadbIs9Bp6idc9iOjqB
         CelHWzW+4CPsnKVhMup0mEWFw8iWlclFNkWazSvvy8UK4Y1sGtFhT/Y1Hax2Ui1IvJgc
         hyWicjwWdCByJ/h8MuNPiEDuDIJpPxOYrErg9Y8bdWAjLru3eDOOWycl927bm8/ElA20
         VvBjEPTGQ1NqxQJp0FZlWXTKWdkOMyTz4BFKfaKnKIcK5P0dV7z6yHG7UDxBDQvQ7zOP
         Z63g==
X-Forwarded-Encrypted: i=1; AFNElJ+T80H9Npg/A4xD7lqxp8mD3rJ6/eOe/VlD1lOjIRbertEO0y7SUbZqcPKtaBI/R+4n9dm8krzm0aAK@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrum/Cwogxf+RwkI26wppAHm0eB7tgQo6OgxcZjOFgkg3gq4mU
	URC6QC7HZLemqkjZWL1C+yOLkfvYIjqNwf8CP+2mwiu+0AKokw7tL50oljMtvxBfDsQTI5zVnT5
	DVclK8NesVJw+TEKy/6aNy9ylWywPfSBtNlacmtMJwO1HoCYsU0tO55gtdSbKonNr
X-Gm-Gg: Acq92OF+G2xA13aGwg94H5FjbBvkcxIY7FfemRMjS0xUJ6mBSTtiWQUo3aWVwuYQ043
	dVMgJ6AFSTnD4itiVy86RB+D1O3bvZltTGq7NClxxhfHVi9fP7eDIYNLgQ6zMVJRAX4V47zdRkU
	hjpNv978XyMwsBykb22pb2q2zXkTQKo4X15qHy7TzUz1Q2DrmFxn68YkvYZU7SaksxaIMTztyZz
	p0C0/7EHr/gzKOnG9s9tPcZ/Mjxb7CcodcmAVPZ9dcKGHTAdJ2pJMnk3hd1qwFAUt89slxgM5sS
	DLBdpLdG8QPwnFE2vz+U0XGoB0VaqrY6uUQheL64qxGEybEHiPBG0S6CZ21iThDeIk2tZa/TFvY
	TV9gXgFRd3W9PwVDDhnC3e1xQN4g3kWqN/IQ1cbI3hQiIAlCQM75YBgJ6tToJo45jYajtV4/NVR
	nPGsxTuJx9ah4wtndnTr+PeU0VWj1uv/5jAFU=
X-Received: by 2002:a05:622a:1a90:b0:50f:c2f8:4075 with SMTP id d75a77b69052e-51659fde983mr300690551cf.1.1779271689306;
        Wed, 20 May 2026 03:08:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1a90:b0:50f:c2f8:4075 with SMTP id d75a77b69052e-51659fde983mr300690201cf.1.1779271688921;
        Wed, 20 May 2026 03:08:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b3c3esm29210711fa.34.2026.05.20.03.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:08:07 -0700 (PDT)
Date: Wed, 20 May 2026 13:08:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco-monza-som: Enable USB0 DRD
 mode
Message-ID: <a6fj22ojpdp6edac2vquor5n3ehm5xvc62gofi54jpsg6u4k6b@gomg7n5ktmp7>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
 <20260520093902.2064730-3-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520093902.2064730-3-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NyBTYWx0ZWRfX3szyG+tVvdgD
 UgNu8++b5SlciQoL54RSkdge17yVlSnR95n8r4p2lZuyWIOQ85QlWGcpXFxY7TZzU8fk13KzRIX
 w1UuqaIP7hq+67t+Xde+E/P8qpkNZb6oRZwkM0YMPMjNNlF45amHkihZpvwH7DaeywkNoUjYhol
 4iaqwmU9d2N0QKBVpK+DNstQ+SUfL/3TTPOFl8oxfiIP8adHG0IbyU+ov8COAQvMc83eSEFzRDL
 uLzIL8OZMzIhOzN/Mo/BjjmmsaFj7q72mWofhur7wICut1dO9/1rkOzp71bbvMZiC8YfRMZ1YJX
 wvejHQ/T70dJ6CPCo1YJKC9uyxsg94bmwlc4l252qOTH77ax2YL6/76MSpdN6rS1sSzxObRG3uJ
 jJCavikXY2NW8aYfAvsYfCGeDGoQefDXuo8LyGltHSnhFAew2BVy3DSu0H2roTlJAmFB5gxQpJb
 YSo6l3n11eqysdgvtHg==
X-Proofpoint-GUID: eEVG9gWEs0Dxnvci1DaeF99SvCbtl04O
X-Proofpoint-ORIG-GUID: eEVG9gWEs0Dxnvci1DaeF99SvCbtl04O
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0d880a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=028NdSF9W1XUqDdDnWcA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200097

On Wed, May 20, 2026 at 03:07:33PM +0530, Akash Kumar wrote:
> Enable USB0 dual-role mode on monza SOM using the Cypress CYPD6129 UCSI
> controller.
> 
> Switch the controller node to I2C12, configure the required pinctrl and
> interrupt settings, and wire the USB2/USB3 endpoints for the USB-C
> connector.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  .../arm64/boot/dts/qcom/monaco-monza-som.dtsi | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
> index 9b5ed55939b8..8e3af6018dfc 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
> @@ -194,6 +194,52 @@ &iris {
>  	status = "okay";
>  };
>  
> +&i2c12 {
> +	pinctrl-0 = <&qup_i2c12_data_clk>, <&usb0_intr_state>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	typec@8 {
> +		compatible = "cypress,cypd6129";

Missing fallback compat.

> +		reg = <0x08>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = < 3 IRQ_TYPE_LEVEL_LOW>;
> +

-- 
With best wishes
Dmitry
