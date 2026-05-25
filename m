Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD05D3E314D
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701648; cv=none; b=EIqoUazf4zbx2r+73iriHb15QtCAlcRZ6wLeWLh1uRRuX6sjee/kyM9l8aHXBQRy6wVLJXUT9LqB+TO6gnu9+VpC3INcDSBZKfYw7XwWgy1AIEIiFioYet8ELXeqrj+30EEz65rT1S04+loDycaiz6z3AkvV4LcN238oR/L2PKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701648; c=relaxed/simple;
	bh=XjaiCpeCYWyNVEErorwgmD4dKb39eRk0O83gVF2YfVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXbyae/v5GyY3Fc163io80m0721gSnKKySfSWTTuC02tob0IDHfb0RgwyUNBOw4lZqemKdeiJOLro3Sq7/s4ukIFQc3JEYHbDaajIyvDBDbzS5KzNGHcN3Eb0kC8ApEKlLi3OFN4EmTFz6eBVOxJFxzMY0NIKCuzFnZeDGGntiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T8bmYpAb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRbOlsnv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T8bmYpAb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRbOlsnv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7HYvS1779602
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FbNMQjBTSJaq94GvKwR19KG/
	gst5Dr26hUgZXOVVrh0=; b=T8bmYpAbIcntCDeLhgj8YsFoBnr5SMk+nbZpLmAR
	Pn3/VsbCihzuzOTQXVPgNqcJT5FUz9VXaSLcnouyPKZjYyAhz9PPkAB97rx5qp16
	vhH1p9FXAM8TTc7AO8Ytcyk53aNdyClqi/2FBUc/hc9tnsLjKYfBSG9RC7b44evu
	sM73KEeEWO9YofOejpU6Vt9EI3qJOoxlJ1315wTJ/552MFYnH9w2ql4wkt8WGr8X
	bRNMqhaTUy5aybtYzivoxND9axeLpHOD5s2RWrGDMQvJsnQylAdUozvFbh9GRRor
	BGWjVr6FQpKXZblIrCwbyPWiIJW3NrRUDqHpCnMhZ28mIg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0w8nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:34:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516d19f68acso73086651cf.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 02:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701645; x=1780306445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FbNMQjBTSJaq94GvKwR19KG/gst5Dr26hUgZXOVVrh0=;
        b=cRbOlsnv3jM+mNN6KCKzVjwGSyAbta8wwYkeTqsZU+O+KmysA6R5mY+FGikw4cdEMi
         7mcvcAjIFcfLlqGqkV9sjJEzalexeAtmKXHlJQrnIhv1O9onl7xEcJA9+lN5LixXp9U+
         vmaVqHKt753qtqBGG8X+/5o8YF/obpJK5jWKptpy8lYPLE4eCAOydfU0sn8GXZS9LJuN
         pYvfYnW8FnlXl4m19HE65VOVRjF8eTml+N5uXd5ZC41kMZ2/5Axg0tOJJkuyFmuGs8uE
         iKN1oV+i9kQcLhrqQOwcMVfFj/klUQ1WJYqv91l9L8latS/zE1ZYnG6PmsijmlXQM4FL
         FwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701645; x=1780306445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbNMQjBTSJaq94GvKwR19KG/gst5Dr26hUgZXOVVrh0=;
        b=hTfipiagDPDyYOVN9R3haMqbbi9WSbiiuUVwIKBVAM1uvqi90aUDmSAPpHjxElT6v0
         FUGJsrUmWbsJaXFr4rjowrpROh9JRxg7wpjYiItubhOozl0RaMcYKfX+1GNl9KaT5Sdd
         +b9UdtF1ivphMkHjwx474eXXN6U8IyKNu2M6eZRfbQ5ooyhHJnNI/esfaKcV2w2dv5OK
         jjJdgLAQdSLlUxeaOcKuHJ4WWsvBljDAdAR15NPwilDZVr3PAVgRp6N/SP80nNsfDUn9
         ta7C0jvrUia1PdQqoA8qPG9ASa5s/Wqnc1LewvX97BYdRO57FCKU1SxI2Va+OXhrQJ4z
         a4yg==
X-Forwarded-Encrypted: i=1; AFNElJ/THaPgrStq1HNTOvodvNZTKwiyjmi3n5yv+bHRgYOYrFl2Sq4MqK6GFUL2RI48pP1RMnO5sMQVwsln@vger.kernel.org
X-Gm-Message-State: AOJu0YyHTlwMpwLeWV+ooavPf5k8Am+16UVIzlI0sTUKFEnUPOiYNUsO
	19vdE0hJR2Fp5frNJg29EkZdPRauzBbFZ1kN438PQW1DnGUCANLThdeOWZH6esnc3Lpurhdlm0x
	pVJftRKofqztygATNhgVpUhVyXd9uTINQ1Kz0bmDmqRTKvM2McUoxscu0aDOlzUJg
X-Gm-Gg: Acq92OEQoaIAxZgBByCte4FMYZy9EJtHlWnPbQD2ntveEZyt+u7tmipGanJPHEh9/e0
	1YS2z6TFBgY7l6PQCR3nGBlFsDZ6Lx51Tk1Qq4YQiGxY2I+z7Bek1HPNGBE9+J8TLJUIaD8fcOm
	4vRmryMMTdQrR6ciSruIPj8q/GMXZ7yqxbwD93und/7Fxht3G+LViI1MN0J6p1Du74z/WniKK3p
	SSorPu2wPWO3f4Fgj1TouKDH8cYt650BfBRYzchO9a5rwleEoZUGUhhXo2NsZ4WhiwV/uwswd8M
	omNW+B/SgSLWrRwaRmtM6uL/7zw5OHALqVfcWtk5hmEI9cVX5P15uXHXQq0e01rfhJ3cI407jLe
	kaQBsu9h/LlQSAUrB5K46fDadRSZ3pAPhlvRMTlHZCGzDMbP3XBcHBMbxRmYmQm5TJ4t0/lSVjh
	i8yCN6JxZOkXi1IyHl3/MHEi89nkKW3Oubo+M=
X-Received: by 2002:a05:622a:18a4:b0:50d:db76:55cd with SMTP id d75a77b69052e-516d43d9c7cmr188562731cf.52.1779701644990;
        Mon, 25 May 2026 02:34:04 -0700 (PDT)
X-Received: by 2002:a05:622a:18a4:b0:50d:db76:55cd with SMTP id d75a77b69052e-516d43d9c7cmr188562301cf.52.1779701644479;
        Mon, 25 May 2026 02:34:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2d61fsm21227531fa.33.2026.05.25.02.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:34:03 -0700 (PDT)
Date: Mon, 25 May 2026 12:34:01 +0300
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
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH 16/16] arm64: dts: qcom: shikra: enable WiFi on EVK boards
Message-ID: <qhm4zgn3yiahv6dfucisu7uwcxddty4fvl3wwx6gk2zm5ggzlr@n3nqcpkkwxps>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-16-f51a9838dbaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-shikra-dt-m1-v1-16-f51a9838dbaa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: aeITuBBviGzW6TKSzWL_SD8nbEXlfS6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NyBTYWx0ZWRfX4fa6cINHeB84
 MQ8UOt/+8wceMzm+M4x99NkI24QQaBRJNXgKujKusp2SYLLE1z2Pxirz1bxeBo92g/mhNlSOmQb
 T8AJ1IVp7Y4kpLVi6RZET30H4bE4KlZIuGWOpAJ9/XhE/nKGxJL8mFHODOP98kHi5gQEADzp6nL
 v1xD5PmYHNs8MX1xSW4P5M/3YUsxq+soU567tgWGSdZ52n3Z9vECyXf74HoWdb9rCzMTSCORWI1
 JXquO0d6rSFOX5Tw+o6tr1L+4addjiLxNoptTjIxmzQSy82VMAG1/0jUSJQxmjiHm6FzltgJFUm
 JJIqduRe0+E4HLG3GVresGMo0b1fU+kq8bre4oPLF5EIsoTrhmICt3neB5Bo6Low64xFqDGFn4z
 JW+F6zd7DErjUZNlI6D7KcZxxba9pagKDNDVPO9rHUf0omWlsQfz5VGOQzuy9ch9GGrtlwitiKU
 WQgPm+6RDNeFhLXWalw==
X-Proofpoint-GUID: aeITuBBviGzW6TKSzWL_SD8nbEXlfS6u
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a14178e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=FEDGRNkftAy9gYbYj1YA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250097

On Mon, May 25, 2026 at 01:19:20AM +0530, Komal Bajaj wrote:
> From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> 
> Enable WiFi support on Shikra CQS, CQM and IQS EVK variants.
> 
> Provide board-specific WiFi configuration, including power supply
> connections and calibration variant selection. The WiFi node is
> enabled on each EVK according to the corresponding PMIC and board
> design.
> 
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 11 +++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 11 +++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++

It makes me wonder... You've added DSPs in three patches, one per board,
but BT and WiFi go together. Where is the logiic?

>  3 files changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 259032bd20af..15208e1abff6 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -69,3 +69,14 @@ bluetooth {
>  		vddch0-supply = <&pm4125_l22>;
>  	};
>  };
> +
> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
> +	vdd-1.8-xo-supply = <&pm4125_l13>;
> +	vdd-1.3-rfa-supply = <&pm4125_l10>;
> +	vdd-3.3-ch0-supply = <&pm4125_l22>;

Squash with the BT changes. Use the PMU-based bindings. Don't forget the
swctrl GPIO.

> +	qcom,calibration-variant = "Shikra_EVK";

Was this submitted to ath10k-firmware?

> +	firmware-name = "cq2390";
> +
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index 142cc8da53ce..51267c1a86b3 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -69,3 +69,14 @@ bluetooth {
>  		vddch0-supply = <&pm4125_l22>;
>  	};
>  };
> +
> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
> +	vdd-1.8-xo-supply = <&pm4125_l13>;
> +	vdd-1.3-rfa-supply = <&pm4125_l10>;
> +	vdd-3.3-ch0-supply = <&pm4125_l22>;
> +	qcom,calibration-variant = "Shikra_EVK";
> +	firmware-name = "cq2390";
> +
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> index 9bf52030bcc5..f4e93cfb77e3 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -30,6 +30,14 @@ vreg_bt_3p3_dummy: regulator-bt-3p3-dummy {
>  		regulator-max-microvolt = <3300000>;
>  		regulator-always-on;
>  	};
> +
> +	vreg_wlan_3p3_dummy: regulator-wlan-3p3-dummy {
> +		compatible = "regulator-fixed";
> +		regulator-name = "wlan_3p3_dummy";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;

Why is it dummy? Is there no regulator on the board?

> +	};
>  };
>  
>  &remoteproc_cdsp {
> @@ -77,3 +85,14 @@ bluetooth {
>  		vddch0-supply = <&vreg_bt_3p3_dummy>;
>  	};
>  };
> +
> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&pm8150_s4>;
> +	vdd-1.8-xo-supply = <&pm8150_l12>;
> +	vdd-1.3-rfa-supply = <&pm8150_l8>;
> +	vdd-3.3-ch0-supply = <&vreg_wlan_3p3_dummy>;
> +	qcom,calibration-variant = "Shikra_EVK";
> +	firmware-name = "cq2390";
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
