Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0226E33A6EB
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774314837; cv=none; b=fLlAgEd0dPHjMjnFV5dH5/dSvq9GDFiZWgzV1XbI9Ix26qRVqwD2T6ei/DH/6Z7QFDQG4LyNy9K7BRYfCvrGMY+aDQw+NdNP2wmqeKKtXg/IpDoJGHBy9Tb238Gce5XgG1AWZbijHJV2ScH1NDJn+CUGkTuSD8A9DwKLqPTj+/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774314837; c=relaxed/simple;
	bh=fHBdR+UE+SqAeDunNxY5XUVaVPXniLE/Mn7Oc3StuUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrjVS0hR76lxIdjjNBhh8TG7Q0W8tzroCz/Hit3bmUQ6FqNHU6K8rCeMamp0oW2u1WuNR6Z7HomZ6EOllzlvGmr1FFzjGKDT5HXsRkMGrXTrwR4+D4liDrgQ27fmhgKF4SbXa/KTfP76FOJcfsESkoEmD5dN0Far2Ny/BUTz9s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dD5vZSHw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OojGhfKI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dD5vZSHw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OojGhfKI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NIZ5Ft1909464
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m2KnfQEO2iJY1J/AYOXfs2/U
	YZ1s7RaP/PvcrKZiD+Y=; b=dD5vZSHwAz4FuHZNM27yj/qhvMygWJOYM8pFhUvN
	msvhG/8815rFLmPZzIs+MBARuc+QAwXIqc/qApRLfreB+Y6yBAK8sMnljsVQyiDo
	kYXuWq88I2y5BRX2wqdvTNXxyhSFxW4dx6ZumcRb0ov33TGzVN4NO8O20VhDNcjS
	ngZZCbX7tCzyrHR0lJxLmp+gLfDCmAx9E77077I5eLvvN4eKKnVAz/GCtm3AF4W5
	J5jVMxMtbazufUq8TXmlwryYeikSq4owJHAJECjutsNwfu165I1i6tRrHJZiltBB
	wT8Wlpwpn50J6zU7zA4cUxV8SnrIdXrFAlbmCf9qsV36wg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awys3fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:13:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4076dc16so184348161cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774314834; x=1774919634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m2KnfQEO2iJY1J/AYOXfs2/UYZ1s7RaP/PvcrKZiD+Y=;
        b=OojGhfKI9CJlE3SaQm5z35w2anLUDDyOkkvSEmElcjH5AOfEvrimLySV4Gw4ouPKIE
         gb3LToN83x3Ze2LOaaBibiT/k1fy7vIZ6V+v1VMG2IKiA+tUD+4dI4OZUiYOP60gigY2
         S3z8Q6ajt9oagI6Hve0Ol/t08RRtQXnLTkgiYXb8eSSQnLox85W11V3eDyKYJh9VSSgT
         wFS2c+q7k1U6PY5YVRqrUmPxH6us+oSxRbc0epIjCzKurOoO6eVYw9K3mKfbOMvTQm0N
         ghZDqwR8kuvj61gV1p0qNHOzfLEPFdpqO4RWcaGsKCLV7Ze111d6vHyMleANtYKe7qh+
         nNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774314834; x=1774919634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2KnfQEO2iJY1J/AYOXfs2/UYZ1s7RaP/PvcrKZiD+Y=;
        b=jhUJqB2OuiYDRPmxEGC0YRu7POGj4ceqE/sUmATgvfeeZfdclD39rs8qrwntmkLe92
         u7NFn2ftBha/ogu/2IsHXpINeEH0ByOcMv7tL6fWLp6IfHlFDpuFJ7A2CmfKVnQPT+0v
         llJC7ea/Nt2ZgoisvAREvRtSiI45PD2p+i1vw4+uaUr24U/+UnllahQDtypxfi1pvlqQ
         S66BdSZVrVkxAg8cYyR3VL4qwvooL46WcJg7qlgjVBoJHC046DkiyYnnMkdXA4NFM59z
         GqetUtuHwHH51FRszFpcUGOJqoV1N82A6BTEETJxCxRgdQY9iUfeaXh/sVb9fzTO9G+F
         407w==
X-Forwarded-Encrypted: i=1; AJvYcCUL86orQ866L9bq9r06YF37Ex5snIrakSxu/8uCbsc+RtTKjyqT/AUUdV7H8mf9+ipddNCDlXq/QXxR@vger.kernel.org
X-Gm-Message-State: AOJu0YwlEPZccrQ5Hwn4WKFfrgI/Cfuuhpg1YgOrnfxLqPp45RVwcFKH
	rACTaM2vmNLagrhzs0Skjicj4+oiGMXFv1ndxNddapXduRQ8kHi7XIXUNRxS+ONf2ZYVtIpsi4o
	yH+slVrcNezeHmLuc+LZ9EXkcgFpGXydPgrt7LbdvauKyCisFITZmz9J1NkLuRUbk
X-Gm-Gg: ATEYQzyueXjcFKC0ZAQuhnUOqp4F98ZB/9WSp4kph1Qst5KhOL4VUxR3Sc4zWRZath7
	5rueighMZ3kZqc6NA3CHkh4nZ9XD7gidCqteCH3kd+6hJ0wPNxgUa1YLLSkU5xaEugifYNkHyx5
	r3q4Y248PphVOJ12PkfVT5EvDiizHIOFYBHZeaTDav1hpf7OiMaCMPRQ4gqM2pbj5qNOKR5TCaL
	rqlP8727Xtd+GWPMkjjhA+UNhEe8GJ7DHLDu/ObUB4V+KCbphCccu+PlYGMl+VHHdNJkZfwFg3h
	FHXuBxG6qyS1qVLBxfbNA3ARo//xB6n/ewwmPgoNgBqZq8Ithu/Kr212KwyO+sJuOlzZpcdQYEp
	qmlMswZzipmpCFx2a5bfbCfGY8XAKsJcImHvtTsXilicTlg9bd19AMHp0lG5SbjC1GeFamh47Py
	GenD18Jqd8h+knUOCxTyRFPZW0oKTs9D+Rr5M=
X-Received: by 2002:ac8:7f54:0:b0:509:4e1e:1b9a with SMTP id d75a77b69052e-50b37586c7cmr210322161cf.54.1774314834331;
        Mon, 23 Mar 2026 18:13:54 -0700 (PDT)
X-Received: by 2002:ac8:7f54:0:b0:509:4e1e:1b9a with SMTP id d75a77b69052e-50b37586c7cmr210321871cf.54.1774314833907;
        Mon, 23 Mar 2026 18:13:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851a113csm2847459e87.23.2026.03.23.18.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 18:13:51 -0700 (PDT)
Date: Tue, 24 Mar 2026 03:13:48 +0200
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
Subject: Re: [PATCH 2/6] arm64: dts: qcom: kaanapali-mtp: Add PMIC support
Message-ID: <yz2lrc26oi2nm3hcr6x3fcst33xy63dqb6fild5l22tropffkw@og76e5s6futn>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-2-70bc40ea4428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-knp-pmic-dt-v1-2-70bc40ea4428@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwOCBTYWx0ZWRfX9Pnx2o9ZUQxI
 7uVH1uzOVSGHnNQD0QyusFAsBA3FJ4QrYWIS3vebXxaFkvM0CgiNjmFymPnNta3H/OVeWtVIvnM
 L1JOoqYbz5sr1s+rKCfrVPPXwdvvqMMrrsOrWpsTbmD6ha6jl+NMATm7ZfsAnWLE8VWwWLfBHM+
 x51BG2I69/nTDIOd5fEgPDEduXtGP20Ze82yPrvFU46o1sABLQsX6F0G53j9gcSIJQJg4nd4tej
 c5dpCZ/DkOEAVi/PkyKMO5iaVXt4hoYtYKditXDNA4tw6BA2Tpw1QEzd2fQpivNo6hx3SPEiC/J
 z/F9p81a/8ntEhI0W5T1CHW68GTB2nzr9TSfe2CCvEQqk6TUULeU+aoK+SWjMNQGQMjPfs0iVKj
 kV+DgdLH9xvhPywQdb3E2FZEDAU2hmXKlqMjARmJTpDtBi3J+8z/Nms7mzTxqmINg76y9nuBiYi
 YqEL7yp7aGFn5yVROVA==
X-Proofpoint-ORIG-GUID: Tt7L6Y9ohV8F6dHM4JXgblB2E6Yy19fe
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c1e553 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=FA8JeGbtPlQKOq0JJCYA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Tt7L6Y9ohV8F6dHM4JXgblB2E6Yy19fe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240008

On Sun, Mar 22, 2026 at 11:19:42PM -0700, Jingyi Wang wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Include PMIC files used on Kaanapali MTP boards. Add configurations for
> keys (volume up and volume down), RGB LEDs and flash LEDs.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 92 ++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index bc57935c042c..5054c5933687 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
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
>  	model = "Qualcomm Technologies, Inc. Kaanapali MTP";
>  	compatible = "qcom,kaanapali-mtp", "qcom,kaanapali";
> @@ -53,6 +65,22 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
>  		};
>  	};
>  
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
> +

This is not related to PMICs (and doesn't use PMIC gpios).

>  	sound {
>  		compatible = "qcom,kaanapali-sndcard", "qcom,sm8450-sndcard";
>  		model = "Kaanapali-MTP";

-- 
With best wishes
Dmitry
