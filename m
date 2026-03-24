Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5A334DB4F
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774314867; cv=none; b=C5VAbqPpdvCmRcPfTw+TUZauWAWmUIkBHx4vYsTV4/zabcDjsRXYTcqRm2KBES6FjBEPSYsgz49vX66e8iyL13VGyoVj6csv64eF8yo4+kZuWrcURHCjAkb0m7kygA6UdyLrMopI9/j7oQLhkqyHTgZcCRwV2tnzvWfmhmUJMjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774314867; c=relaxed/simple;
	bh=E60p/XLd2wt1Qs3M3BNdbNcsj8EJqIagz23teRTinqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYlq3jdstEnaKz+2HF81UwNf3lRmHRACegtZjmj9x7U0f9pUoA1Gl3DwGgE3RkY2Yt19hsBwt8QAbfziYiU0nfICAK2Vh8bxY5VolElWbX93Ohap5wqsO4wElDcixj5DJNrNDmMsmtUg3cRrRV3WJ/IFlhevhadRd0AVJJx/aaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2ud3huv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ModrWPIQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P2ud3huv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ModrWPIQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqcH73634327
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6w7JDMSPr0QCxoch13oi+DSq
	lMSpjj7+yOc3GsWWRgY=; b=P2ud3huvSl7GVvh4IGrwiygacSBSXOC1i36ZuHe+
	4LX0wKauIG0I4wrQDcZEONo17wm66pIK/JkzmnUZyj7O6s8UASqZmGi/TNxZK0Dk
	MLCiCKCIN/hHko9VqBsBFiC7ZJwboFOHBNPcSPMfdXsxP1b3h9iIoI+mLCpR+Fea
	yTEBlzekNrI69zrHviObpPe/CzqNuXZxfwUuH/MHTRPbQ8ozIibeHBC/i0w10Q2r
	xtU8o2qo4JvN96R+GeEqwElNz5vkzF5NAxNVl92WLH+0oHvAIUkTlkSc0G+T0ctE
	+Jsjmw9uN66JtFqUbbKKU+lthFTVt62BuS0eJV6JuA8acA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4jqc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:14:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094ba09affso47786151cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774314863; x=1774919663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6w7JDMSPr0QCxoch13oi+DSqlMSpjj7+yOc3GsWWRgY=;
        b=ModrWPIQ+POY3QQisF01jDCReI1iTBXHxtEk1DF9ZRH1J8Uaudne9STKYRV+8fmrGM
         u8o/3Nxsc+09o/mmmaleAUDSMY5RjXfOFQ08Fe7RGd9ktSu00ypOlCKImQpfqRKkt5Cq
         rY1tiG0vqCuxlZFE32LeyIVHMPQourUXnOIMxd+TTD9lGR1lV6FjWTB5Oqssn4q7A7eu
         SaTk03zCTs1afofoqrAbwGz/U7T6vIglD7dVw2TtALFYQ/fnEE/kyBDKHbxJzpub3mKN
         5MzAHIYjRkZPIVZZAN+BmDRSlf13CmTga6czeiTvD11OCNUsJov0lJ+1iM1kx8nyQlZN
         IWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774314863; x=1774919663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6w7JDMSPr0QCxoch13oi+DSqlMSpjj7+yOc3GsWWRgY=;
        b=VFM56LACEhOFAGOypvDRxM91mwqnxz4D1UCS4TK1PUjI3PYF34QporHSuviHcwbFoP
         g1TXOSPHG8Tk9hoeSdia/UyRN48Ihe+lGbu88nQ+nUT5MAhRHpnV+MeV2Letrj3ibLHV
         rBIsy4vKtVFKOP9zuyxXgiPsFmAG/wp1FKMN8IFBzs9zsFXFq9oy+0sPKulDOhLNydfj
         nHlE4ruQypYKDrg5jL8MxsFsxApXozH4RcnBpnh3vbYJjxKNWahSGu9lKqUHB7UY5jU+
         7kEGy4t1UYDow+iJ8NR+eXDr/CwZufq5Xdzu9LNrrdVeGtSgy6+FxA0zi8wLVfQ0g11b
         IbnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmuj9WF/0/EVydv1c/TbbThyrHAew8HbdKB11FglGMX610IXYWJaz+luaSFzqN0pVAYLRtCDiz6bkH@vger.kernel.org
X-Gm-Message-State: AOJu0YwHCWjMwWxO8w4Vpsm/VFN1ZGurN06DkuZ0jANHt1FPW3yPlUhq
	ZDlV6PyM27Szs1EzSqZonVZPT1zHKix6kAxAElD7ZqoiFOyc54fYAEooQzu+2bFtx8qiyOLjK4D
	/v7ZT+PSRcjMx0LiJlwjMuP8Xq8ql+capj8j+aUU+uE0hr+E3Ii+DXgV056R/JNqT
X-Gm-Gg: ATEYQzyuIfPwdxcnlWp5oP1IrMYtlpoUGJj1PRBTS2ofcYY4x+eMGNoIPm7RfhOGWNp
	J+Y9GEf2Bz17sE8ve6TjV+oLDpaXIO0gOc8BWpB0Xs1hUne/I15AEt+9D/n0xp5pYbBeMI1pmvv
	1FI+QmEMg3g6BnO0ONX59aevjRFYKSCj5dVhkIXwg1+gTrUuJAAflBu0AE6oI8TXIKUragi8KkR
	8792/MWZj+DaxUAeoGu2a4homZVVqfvCGcwVW8cLx6IkwhhpfqGrsZO4TZ4O3E53gn8dBVSpUqV
	WnRxc4bL30GhDRL9oGvEH/BH+R9LvbmmKxAIW5m40gHmY6D0jmucLNOUdVR1ojWGBq7FCGmvaoP
	KiJSNKAhCfZ+9VSFaUVKBD3NzRGDM/VrYQEg9NMflTfoiZb//V6QtGCJ2Bn/Mfr+tm/+nfeiRon
	g9smvOK/IuhEB7SGfKSD49AYeZ2dndQChfyso=
X-Received: by 2002:a05:622a:4c0b:b0:4ed:b2da:966f with SMTP id d75a77b69052e-50b3747c69dmr206683231cf.31.1774314863427;
        Mon, 23 Mar 2026 18:14:23 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0b:b0:4ed:b2da:966f with SMTP id d75a77b69052e-50b3747c69dmr206682871cf.31.1774314862968;
        Mon, 23 Mar 2026 18:14:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207449sm2873618e87.44.2026.03.23.18.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 18:14:20 -0700 (PDT)
Date: Tue, 24 Mar 2026 03:14:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] arm64: dts: qcom: kaanapali-qrd: Add PMIC support
Message-ID: <szcplkgjtom73al5aqjdv6xf3ggc4sr6vw5xykygp2xbfwa232@qlv6otc5zb5r>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-3-70bc40ea4428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-knp-pmic-dt-v1-3-70bc40ea4428@oss.qualcomm.com>
X-Proofpoint-GUID: fYrcEzllmiNl_TQAW1KhdmFpkdj1DtTw
X-Proofpoint-ORIG-GUID: fYrcEzllmiNl_TQAW1KhdmFpkdj1DtTw
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c1e570 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qr5xLvqgsvf9f8GRTAsA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwOCBTYWx0ZWRfX/7BhIeBTZhUY
 hmBiOCplN3CNcU933ZlP0OGheAfy2inyMa957h0/f5rAmakscanD9lIQqF0DaygixCq3pbNUdfU
 cy0NVDbr4VLuJoLjH66c9YMhlGSVYPfkC+hpfayvvIAJ2PjEM8pSunsYNOwLuZ9494FGGqLjAD0
 64C3NYRokWE1VOihWgiBvHQawyx0bW4rKKJPjUpQoUshgO9hShVYmE7fCk49OrY1GPxZww2uTTM
 7o6pBHVc8EhVg7rmNBJWdkw++Aa09h0rDSevxnI2ZDprKoCjo4GnjVP6uNWhANTeItPP/Q+PJJo
 fc+zj0pHwZoi38t6inGJqHVkiqBfDsUKsHQwZmTBTLYavGazC6/Q5eD/sefLe6MK0YwQ+0OqnJW
 g2g/nzVvbqQvuesF7RlY7GhgMOFl3U98JmHIaJT+oryHhGvCilHOdQRy955W2Pguv8fPMfcTHc3
 l3TC3BWElvPb5sz2CXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240008

On Sun, Mar 22, 2026 at 11:19:43PM -0700, Jingyi Wang wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Include PMIC files used on Kaanapali QRD boards. Add configurations for
> keys (volume up and volume down), RGB LEDs and flash LEDs.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 92 ++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> index 32034eed03eb..da0e8f9091c3 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> @@ -5,9 +5,21 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "kaanapali.dtsi"
>  
> +#include "pm8010-kaanapali.dtsi"     /* SPMI1: SID-12/13   */
> +#include "pmd8028-kaanapali.dtsi"    /* SPMI1: SID-4       */
> +#include "pmh0101.dtsi"              /* SPMI0: SID-1       */
> +#include "pmh0104-kaanapali.dtsi"    /* SPMI1: SID-9       */
> +#include "pmh0110-kaanapali.dtsi"    /* SPMI0: SID-3/5/6/8 */
> +#include "pmih0108-kaanapali.dtsi"   /* SPMI1: SID-7       */
> +#include "pmk8850.dtsi"              /* SPMI0: SID-0       */
> +#include "pmr735d-kaanapali.dtsi"    /* SPMI1: SID-10      */
> +
>  / {
>  	model = "Qualcomm Technologies, Inc. Kaanapali QRD";
>  	compatible = "qcom,kaanapali-qrd", "qcom,kaanapali";
> @@ -52,6 +64,22 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
>  			clock-div = <2>;
>  		};
>  	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_vol_up_default>;
> +		pinctrl-names = "default";
> +
> +		key-volume-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};

Again, this is not related to PMICs.

>  };
>  
>  &apps_rsc {

-- 
With best wishes
Dmitry
