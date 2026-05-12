Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBAA3976A4
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 22:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778623461; cv=none; b=CCHoa+Y5lZ+LyPDDPqK/kUC6VZ6jJSm8cKPg45hHR0Cii0WBiA/tWtKLzdIAxHLdnkLYhF0IHKGVP8R2H9ExeowBrmmhRKt6gnt+tFAPUPag5K/l7LuTF8XJ+bi/JisGEbh2faKB8kG7Ff0+RldXEFI9Ayxm9wpKnm0tL4fT0JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778623461; c=relaxed/simple;
	bh=Wg133cLvrC9lkHoz02DJoErg2izbpbqlU3izh6vwTqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4Tj+ONhxLva7G7Gicgp4p4gREAbgAPQ1lf9tyt2lUtnZFA79YBDvHbtdbUOI6yyPcrm7pKuxY8SrgQ4odFkt4OazGn8ArEmXLL8YS6TSZkFn+OopIuJug5Z9T9ADnBhbqet/Y6rSfvvJ2uC9WJWnlobg46b1XLaFnpxyUlXZkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLMvcbWS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8OfasUE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLMvcbWS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8OfasUE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CLmniQ1751534
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 22:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NqS+CDNQVOX3mhlFDvH3E5VN
	dOpuCFOxzb4Y6GdldLg=; b=WLMvcbWSO7bSETtUn04lb48afvNVQEG72YRwCqRj
	fBQZqdhpIQzrH0lJ3WNH+TGHvDAxtNRVyK7ucH0Ii4vQ5oVKJG/vS0Y/6ixPKZdq
	KnceR6lW7d42PXRit73MXpJFEINRsxb8m3eJAyhvRd8Ahm1BdKVDOt30u4DG/ca4
	cw4YT3R3M+y69jwUePwwa0LO6/TIHPedcfk/lH/kTmG9kqRJDHYMs8TlQkGQC6KF
	WCHVEEYtUIPdDtUqWkUN1o3T3hAX0XaRBZsnpdphgehbcU6lumOO1v1nj8//+bpq
	llvNptYsp6P6KvQrunf+VVRxziEKMw0wzc0wTUoqHfIDWQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e45avhw83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 22:04:19 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6312aa1d7adso3982144137.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 15:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778623459; x=1779228259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NqS+CDNQVOX3mhlFDvH3E5VNdOpuCFOxzb4Y6GdldLg=;
        b=h8OfasUEUbrMyVLVsyUoi52SGkMpTxK5iiRligPGlhDZooVFM/9HGSQI/ycxZbjsdr
         fbTcYKMvgbMODYYzNIWY8BngHcH6xSgs93tRmGKIcEzB5GgkdI6VXpCqSAF1UXCLR5M8
         Z7Y9Q+4ekNSo2LY4/UyW7kmDv1XSyR+m5eRElUakYf26IPSVEhqpOvYP+KzAAY5RHXmc
         sFcVUfvWihKx53LNV/QCAIH2LuXEA5Zg1wHUOASCz+MKSGekOYqVQ1Xhld5MYwPP5sjj
         TnEQ60OLtqKzTmGjrCdVrQghjdHUB2X+Tpwp9Pam1M//lvYVuxp1SunpBVMo8mPi+/D9
         Ox0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778623459; x=1779228259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqS+CDNQVOX3mhlFDvH3E5VNdOpuCFOxzb4Y6GdldLg=;
        b=ZzJkIiHHKIWpVyh/IoGjSZghMGoggIqggdz8LfAnsblC17W3pYdbXMYa0s0DMbbYMV
         NPeRC3JrjtAz0cC7tYdiQElNfNGA0jSuV4jyVGvIgsUrD+SKwibBlfRIxgWyhbqAJSEs
         XwitKehds7OAg3eHxogq2jmi6RTojjv4rLz+jiRZqAk9zait1M7ky1g4YXwWC6SvHm9V
         QfjlcCgGoXABt1an5Y0+PpHwhwPPdkrhZsFsLOZx/QLm8LBcof9BfBDFORV1LSbdRWeW
         PpVSHsRqZWBuehI1NDcOpWRoeevRlaFkB9wPERNr1ROFnV1bodMZ4QLyYlKQX/ENrUem
         sT+A==
X-Forwarded-Encrypted: i=1; AFNElJ/IHPyQEe24ZjY4GP2C/HvZBPoCvszwg6pwiUaTxfnCXjDK9DJGXN2futTQa2gvDT/81uwXe2fBg2t1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9FIxgN57tKJhpA7ouib0Zzjf3YmNCois73qGEk4OFF43ufie/
	PxxivphfvjNPQ3k/+Q2J+OdbIX4coSqbhT04jpI6s4Mkk8tbn+U1jRMWMxuEriI8l7DAo4/DzLG
	SBawocIz/7zmGmCUzIvwZS/9Hbbw70T2Hwe7zhdEjHLsm0jo6avPIxAKsdrhFWKuB
X-Gm-Gg: Acq92OHIWpbZ8ZfE9iBDJMQImdGAfZdK9y2tyFgh4//AXcrdOL+EhpA/oKSoN5EyrcL
	2vwj9WSmzZFDdYqTsy+/KBfwOLPdijd3r7FyM8cJGEYa56nR6QXW66YAAY4XJo0yC6ptoS7ggiU
	Zn6HQ3ICGRCgoEWqT6O4OoRnq0K4PgW77qkIOQYSQD7aScvtAQQFuv7fVzIZ96BVeUI+vViM18K
	5JuobVdaFaVN/nRuApLqOa1EWtD6h/5pRPD9hS+M71ruHUx0ekXfZF0kZPlTW4ELZpLMHg4MaSE
	BOlon84v5u2U093I6GVJfQl7XRNZ2hXOsdod8Ioxy4Jy2ewOUi/+z0fdqZ0KDOduNcD1iMZT7l5
	p2MV4qM6z8J1lkUucY80zvmJCiwaajR2TOzyJBD8Je/+FoDIgSCXedcxTyiq/NB1Kio11eg/8yx
	hCuxG3GQlypOT+tJKOCiMYGOnEp+hcHbcr3wE=
X-Received: by 2002:a05:6102:424a:b0:631:4580:6a42 with SMTP id ada2fe7eead31-6377422fe76mr307922137.22.1778623458501;
        Tue, 12 May 2026 15:04:18 -0700 (PDT)
X-Received: by 2002:a05:6102:424a:b0:631:4580:6a42 with SMTP id ada2fe7eead31-6377422fe76mr307883137.22.1778623458013;
        Tue, 12 May 2026 15:04:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f625bd3bsm37023021fa.34.2026.05.12.15.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:04:15 -0700 (PDT)
Date: Wed, 13 May 2026 01:04:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Message-ID: <bi7m474cmmnbdfxd3kzdt4hywm7teu3jo2bzywk4x2tx24lh6b@xhdfnm4e3rfs>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
X-Proofpoint-GUID: F3PSecJuGz2GfdCEtM4HZtwbkckutf8x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIyNSBTYWx0ZWRfX+SWAQOQXuPeD
 dWZP4Zw8P6jCe4GWzJoIUaNuFwI1MGp/GD7SVPoR3igucC51cNCHyeqRosUGoM85D1x3ObmPzlP
 vyEpcpNsbRLsXFWZouz6sTO4kKLgbgCFu58fU3lTZ9vo5ny50ZHLgfgIC8Qpbt1NeKDilrPxRx0
 LzEZ4kRTh98kQ25Ty8okIXokqxOiY/5i0yvnCEBVC5hgGS+NhUmkLAfeFE46Cz514UGwWkMu+wV
 ULJyKMniUStbAeaCfXBXDJHHRDGPMMThO+AfSyefHNRS+Kvao3ZQeDhb5iblJjSyE6WMHWu7JD/
 B9mr2sHAOlxNvhoPvLehnvWrX6rrM5GR19H6/IRrk1mrpkvNho6cXFZXkatdMX7qeLh7IhM+Bbt
 KCySVXwj9FPAhnYILh7cGuqZvXHFHJQ7DBDJ8I0EUoxUCUAqLPwlk0WGMWB9SKsMosMIlufngrK
 /RFHrh9uU8W2G2CiBvg==
X-Authority-Analysis: v=2.4 cv=bOwm5v+Z c=1 sm=1 tr=0 ts=6a03a3e3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=erItJiyUAjbEpTEIgrAA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: F3PSecJuGz2GfdCEtM4HZtwbkckutf8x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120225

On Tue, May 12, 2026 at 03:26:49PM +0300, Abel Vesa wrote:
> The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> routed through an eUSB2 repeater provided by the PM7750BA PMIC.
> 
> Describe the port and repeater, and enable the USB controller and PHYs.
> 
> Also specify the ADSP firmware and enable the remoteproc.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 81 ++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_dp_qmpphy_out>;

No redrivers?

Other than that:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>




> +					};
> +				};
> +			};
> +		};
> +	};
> +
>  	vph_pwr: regulator-vph-pwr {
>  		compatible = "regulator-fixed";
>  

-- 
With best wishes
Dmitry
