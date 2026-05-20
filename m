Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11893C9429
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271550; cv=none; b=Tl0WjKQLoOxtlBGTejJy9IEQrNTX1X6DGVQU9gXtBV1iYGCHgxj20Qb3lTHdlpYOy6OuVOcf+Hrx1i0vBNiO8IdKIn0X2LosOGeeOO8QCZanaY8o8/QDogb9oM2c+8j0gP1qTRR4LnkkgkIjg2Ev/FNd4tpfnBfqEnzoUgR3dPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271550; c=relaxed/simple;
	bh=VMTZENOrCLYp0Bz1nixlYFju9N7YUldpyjOQTvu8ayQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogyBuB8ejnVWWAvCRjfMmcx9lKJNu/k61ZcAt8hK7MR0fRCI5DQKkQauCRnnWc4Jgpsim+BIbGVffzeU3HbuRbSECWFqU7EkWluzokAhZAEoDoeDulo/QKllYtGIraDzkmEWb4R+aIYI5oFQyJOOhycmDgbZpK9dWFy/kKqzAJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fjz0zf3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ax3S1otw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fjz0zf3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ax3S1otw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nOkA446356
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yOZnM2TLEozp0nupSz30z7yN
	x5I2A+9YCb12BxX6BEw=; b=fjz0zf3Z6YhftuKuZZ39Ik3yiYncWSB0F50FMKXI
	M4d8TxBB19B/Tw47D6Kb3digeHLxA3FIGphnahoagJfExSt4rMZfMxwX5teUwFZB
	bhBgwx/UtyiTXIuqb3CMM2Wi7kJjJr9FHrMy3k8Mq+duE8yvn9EGhhxlaU5Qslxi
	jiESd6STht4p0lFEsURR9YnNjRuP16yqWY6KepShXAiHgqdAWOFbmWx9qEchmRO5
	pbtoVC1gjExkwG+8s45hsDB8yaQdAdywYjXUOqTy/yjDyT2ggwWwYCgP+Cg2TYim
	RLPpGVdPT/PkIXBZuMW+kyNdjlgAPbvSefmuMnpfysQGCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrg21d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:05:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516879bf1a7so122281581cf.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 03:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271546; x=1779876346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yOZnM2TLEozp0nupSz30z7yNx5I2A+9YCb12BxX6BEw=;
        b=Ax3S1otwyyxwfB0U2IS5lzPzRqjWLEzB9HpN7CnWGMSfXZGkz+s1amFAFqGuu/TXw2
         11mTl4BHRLZVk5P32eiTiLim/zeso6O9SE0yPywlM/qScVzSTm91exF/pC+QFuX0YTbc
         RgFB1zy/PlpPQIlzgF2Nl3NjmTF3KiJa61YvcTBTOq+G3zyelIdWgxO+iLrbwqquy4+H
         nfHN29esibYxcXHrBHV4GQsNA1Mk2iN43bslFXUllCF+G/fY5mjI1FShfNsg1qCYzXqi
         Ev6Stv7DtovMHaZcVtynR6tZBhPvjBdoNIYBbBxkofgNGFzLoxFxaTqs/x0DXXWSbvIo
         1+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271546; x=1779876346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOZnM2TLEozp0nupSz30z7yNx5I2A+9YCb12BxX6BEw=;
        b=qpXdi7vTKiQdspX8QTQTJypwVK0ViQOgiK4sTm/i34cbQKQDo79th2Vvlkdnk428QY
         3lAmVaUtuFHBLrBObakRI1i4YAAylLjOt3duQiq3Q/AFQQbhwATh2XbeC4h5E+cprdSQ
         Bvhph2/c85E0Uj/8bu5L+TCPmX/2SENEksN5ikt2UGIzfvamtG3Wg2yfzRb4MbabMq4s
         1jjD2VusaJx6Pry594rINoVfGWDr2jEiat3tsd72f9x45PBwsv/F3n61TIbI5Z/MDiZM
         OdLb97WMbjqIF//KSGGh0AQf0uiodmz+G1mZ8TaZMxSR8U0RwN8vOUUnKbEW8QxWJQo7
         Qj6w==
X-Forwarded-Encrypted: i=1; AFNElJ+Cx+/OuWamzF8TWQ27fph+7QEhdOu4iysAfQmYR4IyubuAOW8jXUclFnUgoiUtVIRbDP+dlQAyypVg@vger.kernel.org
X-Gm-Message-State: AOJu0YwNs3iL2vqWIcPZuMxsmgKEqMtHItNYh+jfu7LhLAPH9O47+Rbo
	Z1Y/IgjY+XQfxqS4H9HcAu9C+5ZVGYP30JAMScCQhEYIqk/WGEO+VSWH5R82KS+H3mmK63UMHGt
	JabHeyLkROSvmReWNw98zCHnL4kZDDeONCTEY3SrNvFKJ5Z+Ue/l1LoPt+aTlfwY/
X-Gm-Gg: Acq92OHeYyxCq4z+eSCJXIvbrmnTnZ9X2qTQqukX/lkaSqRTxv7mFNi3aVj5ElZce5i
	v1VwYh5smt9uEZbGabTOBEOhsC23I/i2BDBVD0sXk278/SBPYqgpMgJJn3vCXNhy0e4KmS0W33I
	5O7srThVsvkcWluBNCFEK6wUE+7ZcOTe23ixvKGwab3RY2BDaUjIr2TZInPQLP7QY/OlqYudTTb
	vSLPxvG9un9+NoQt7c4wRsqGkMXnObt76NIcxCgiVunNjXyDbACsjBCe6Hj3P2T4haCRHNUWxW/
	/+egCkvAMtyg9vak1+jqZ7rAfp76mO12p1Gl2CjO3C/XWqZmTkmAHpnbCG3Ly53pbwXhUVFsfl4
	qqG+LH0Mwrhg4aMmN7oXXziMsfUS6+l7QOGsi/nOFczpvmAQKwffgJ3dDnMrkecccYHKJMNzN4U
	3jwJBPE4h0HRgGgHm9qXjSp4JLUkCRI6Ic/lw=
X-Received: by 2002:a05:622a:15d4:b0:50f:f030:920d with SMTP id d75a77b69052e-516418bb45cmr325601381cf.30.1779271546139;
        Wed, 20 May 2026 03:05:46 -0700 (PDT)
X-Received: by 2002:a05:622a:15d4:b0:50f:f030:920d with SMTP id d75a77b69052e-516418bb45cmr325600911cf.30.1779271545658;
        Wed, 20 May 2026 03:05:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882822ccsm27253581fa.8.2026.05.20.03.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:05:44 -0700 (PDT)
Date: Wed, 20 May 2026 13:05:42 +0300
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
Message-ID: <4flawqagu67adw4j2tyntn5xdfvqs5qswsdrwwangqpmp5scmr@wzebs4slgea6>
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
X-Proofpoint-GUID: S1uXvwjM38JaJqcaspO-hWrVau1_ZR3U
X-Proofpoint-ORIG-GUID: S1uXvwjM38JaJqcaspO-hWrVau1_ZR3U
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0d877a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=028NdSF9W1XUqDdDnWcA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NiBTYWx0ZWRfX7NgGNI/C2y9B
 bexqEeHc28xgBEEyHBjUVPECGFda9f4c5AeinFrOxpncTsGcd0mAqbKvuWsh668pzI1TTd2bguR
 1S5dcyiCEMtILksyWsM8qH8taETk12Q5vOYQf/Tdkb6l+yOmuREb+6KGned7ksV6aXN1mBkcXiP
 Dl4ivOMDRSLSa9zbls/yYs6j2DvrOCIi9AIWse8HqESchGhzbZo9Wu19Z0KR/s5yMv9/ZfOuLWX
 r8SfDzQMdRgyf/5/RKoGAXu5OlxPaPi/RbeUgKNawWsb5iH5epR7dgj5sIhF8d94faCOW2s2RgP
 Qv5ChVW8ccTcLp+UkuKyHCydJkdMMGAshxIE5TvfzrImkG3YmQftVjSN0UIc4wd1wOhxOLlRyv8
 78BPUspg3pPhnVlWJe5S9L7pvDFHrkaSpqLiiN2RmEtS+JnzQbY48mYpU9wB59kE1nUNz1LOGXy
 DMUvfULS2HMzONnLqyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200096

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

Wrong place.

> +	pinctrl-0 = <&qup_i2c12_data_clk>, <&usb0_intr_state>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	typec@8 {
> +		compatible = "cypress,cypd6129";
> +		reg = <0x08>;
> +		interrupt-parent = <&tlmm>;

Is interrupt-parent required?

> +		interrupts = < 3 IRQ_TYPE_LEVEL_LOW>;

Extra whitespace

> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		status = "okay";
> +

-- 
With best wishes
Dmitry
