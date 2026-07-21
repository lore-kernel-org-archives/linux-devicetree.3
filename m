Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE0C43C06B
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669807; cv=none; b=TYgHcTLHaOkE3AWKZhBeeCIez0ICFw3hj02G3Ieof0iiMkc0/qFQCSxOYo8crWZ2dqyaSvLtCqanD6UWgepqy3vAh5m3aHRvHXOeOqJJl1rfKODSwnAgK0b1IuJa2G6X9gOZZHCtd4EuFrmAjrwVKLipIuheX2yKG2a4/td87mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669807; c=relaxed/simple;
	bh=MbWqe6bXdTaNhcRMp8/P8P0e4PGmzjyTB3oXCskCo3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0tzrfr9xl5Axquf67PmZTzKUHzPdiUBCUs+Yf9bynrxTpMiNy/Bng/p6NVJ1mnDdDtC9GSLPKMbhfHWqsFAVZNvVZg/ENtwru798M+DyU1+eXKUIccx6gmeMe1gHwK8r3/DG/JZKpFjZFfn2kQzgmRXw26DTwEkyqhwmhiEgwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KiUhRAkQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUoMIq1B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KiUhRAkQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUoMIq1B"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKmEdO2952774
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kdUfC3m+cF4huKdjq9M3++q9
	hJ+h/hEoqjpBu0Ou9HM=; b=KiUhRAkQ6RqNiK9Q5u3mohRllIL1XG7ATvBtV2Qi
	KLI3Q8iGekUtgRkgYknhXNTsRKin5LnesKo4xJMOyggysG1jR2vfOCV8DXv2uRbB
	1LLetQ2XQpLyNG8oNbEeEniBmb65EsQr6PwOCkXd/5NXVq1l6GRD92PKbKb+ga2A
	z8IxPYf2vBVjExb7WRw41xrF8eIqXWhk7lkHGsSLz68I1b3dvtSKSfCpAwqapO7h
	9rwLZTm4HGn4vH+i3oN1dUIjB/uwiW9B7XpoAuFVrbUoyI3kkDnd1wH62o8LrijS
	ylxIyXVqLifV3c8uviW2bWj9Kfdx1zpRwA02Wtr4EXhuDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d901b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:36:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d30035dso150386681cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784669803; x=1785274603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdUfC3m+cF4huKdjq9M3++q9hJ+h/hEoqjpBu0Ou9HM=;
        b=DUoMIq1BwmGVt9e+6EbkaWrxsy6KmaHP+dTk8mzj2S3qKwx+25MEQLvIz0VW5sEloM
         Eakses4ArCuVwGIyO5Emy2AYsIu4RvDorI3TA/kMSHeMFnAKyIA0iei1atdN9gi/fomf
         wqcviITDes6n0Q2yH3NciKBCkboVa66N3Ci2ddu+YGHy6cqy7QHFB1+hbKkUh8O1BngN
         iAFxRSqhseydVveRING6+UCKiy4+ioablNztPJacpUC07Th3BIszmq4OBn4iAZ5Ql4dy
         YkMMqIa25GHs/5Dz9rZ5JhNZM0q37bNVg24g9MnyIj0n/eHdOfHAqie8aen9ff9+euHg
         ETZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669803; x=1785274603;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdUfC3m+cF4huKdjq9M3++q9hJ+h/hEoqjpBu0Ou9HM=;
        b=mdIjneBwelYyE/9MHd24Ud2jprjmHnhxfF4qQGcPSqEQIAso0wFTkZdO6juaoICoR5
         NOHgoF+xN07AHhpLQXM+eZYy4lClSXnKiM5KXS3GHa9Fwj2yzWP89AsyOTM8Lc3IDzqp
         YgPbmUyYUxr2GTOrTXUiTbWMFpq7BtEv9btH1GByeeju0W46opIfne8GcE/oU6fOUQXo
         jnbG/bV0tZdmsSqyGyI+xV2Rb/L2mh0YXwnJxBlCesHOXN26GibXDRgEWzYcNbMv0qHv
         KzgCZXzt+Kj5/0CMQEnDQx7n0M1+mIXzeeEB4n324RrjuKKaenKxCnvGsLSHBKknBibQ
         i2Rg==
X-Forwarded-Encrypted: i=1; AHgh+RosnQGVKcqVhyv4OZ1KAaf/UkBNkqDNs5mEuaML6Px4EX+MgCZhtEQHkLKX5k8RGZg7mHR41QUJUe0W@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8JvDHlQyLgw/D1ap8see7qDnfefUk1se3eQDlJ79Ge3WaEXX4
	Usq8cV/T9f1EUK5TxNZP7+rOSxYBF1Yx6L3Ir35lgxkXaYMlXCsr9n6FOLRSFZF66u+6FLUjAfw
	LhcFb4A0fhnRmhg6oDvYie6kvmZpnUee5+c2dx/YWhFwS3eNH/DrN87SkRMRK6Ll+
X-Gm-Gg: AfdE7ckEXnlsm84XCDgHihL+tZ7aq9SmSx8ZXtW1vztE7th8xDw0YNfCP8GaqgXOAl7
	ctWbKSBrJgItrh0DkpJF1dOVLOsEWRjHjYikBy/KFWYoAbBq/ToAd9DRTKNqYFUE1v1khbJnJex
	sXH0WluF4tCcWL2jPinvLaTDlLaJnrvs6DSBilzxwp1KKu5hSILkRlKMn33KcXD8xRmEdjV9TZ6
	IQwhOSOcOSKoisoMeu2h8H+GDbwwn5BigGnAXEwCjs6egA+K/rSNhvAMJTzaosi7vsoRtQuNAE+
	MaEEiduluIkfcL8MDL9J/QjrkjTV9YZY3PCrMtiblyHeNn+qW2Oz9supQbSnC3nUG0XiVv6wkbk
	E/6tcCTrdSiA21SG4HwxmA4/06I79hc8niDLH5lB57ABHq44pDAvZfc2KwR/HOSoreoogvDeuzg
	+soyb6VSpmo6G5Sg==
X-Received: by 2002:a05:622a:991:b0:51c:640:231f with SMTP id d75a77b69052e-5213daa1d60mr208723381cf.45.1784669803431;
        Tue, 21 Jul 2026 14:36:43 -0700 (PDT)
X-Received: by 2002:a05:622a:991:b0:51c:640:231f with SMTP id d75a77b69052e-5213daa1d60mr208723121cf.45.1784669803016;
        Tue, 21 Jul 2026 14:36:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9f0e9sm133207e87.26.2026.07.21.14.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:36:40 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:36:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Message-ID: <kjfcyicif5sfshtvj2vvpdzrb7vsl5bfdoxjakxvzam6lv7rwo@3z7smt2ccof6>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
 <20260721-usb-shikra-dt-v4-v4-1-2e7a092d7f27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-usb-shikra-dt-v4-v4-1-2e7a092d7f27@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyMyBTYWx0ZWRfX907wNsrzTc8U
 tq/HWTSzwzl3RRJBjCF89V60mIW76OuOGpiTvG0WMUSvJidhkX4q7dMjeB5QjK3vgo/mI6xO2P4
 vcHRvDMjqTwOw03vLs5UwJXsP/nY9yM=
X-Authority-Analysis: v=2.4 cv=Ipsutr/g c=1 sm=1 tr=0 ts=6a5fe66c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=fBlaasEt7hYsZSY5PqQA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyMyBTYWx0ZWRfX8CKh3wj/Kkub
 vT2GLCJbwDQ79H+vbUbDBSMCG2joFp24ukvJ7ksXJkv8+EcVs/MSQfA3usCLZW5BLq/5wsYdKem
 pfK4U9tUMto4QgKd8X//VxLS8lBGhLj6o2DRLwtGQknM3Qf1UiB3GygrB8le/i4B8ZpZlxyzwY/
 QEa/WCAmLGDr5gmcHEK8GTqWALvy0fEb8upU+dBp3LQebXO5vVQnFP5HP3KrgSn31L52EgRjZQs
 QsyrutLMKaExgAWTfWB1IkFlpgTosiCcOrlmXjVA2Q75k+D0nloxi3JSeYBis68Oj15nyeuVKtl
 FtljXsXdAJ45Vb9eVF8PiumYZRXrVCMAV7A8EyAww5YURpeNedUTdy4PL6O/Y+zc9pAMdGSQ7uu
 7B4ROfjnah9q98JvSdYTmS+Z8Fab+kjj6n2z+u3FlPPLfHRcGUUmdNSBv7t3pmTQ9tAyex0PKRz
 zrfdHsC48MoX55lKdBw==
X-Proofpoint-GUID: wmsDbty2R08tIP3Om5O_u8pEPcMroqeF
X-Proofpoint-ORIG-GUID: wmsDbty2R08tIP3Om5O_u8pEPcMroqeF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210223

On Tue, Jul 21, 2026 at 03:23:45PM +0530, Krishna Kurapati wrote:
> Add support for both USB controllers and their respective phys on Shikra.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 221 +++++++++++++++++++++++++++++++++++
>  1 file changed, 221 insertions(+)
> 
> +
> +		usb_qmpphy: phy@1615000 {

Should be before usb_2_hsphy: phy@1617000.

> +			compatible = "qcom,shikra-qmp-usb3-dp-phy";
> +			reg = <0x0 0x01615000 0x0 0x2000>;
> +
> @@ -493,6 +573,11 @@ qusb2_hstx_trim_1: hstx-trim@25b {
>  				bits = <1 4>;
>  			};
>  
> +			qusb2_hstx_trim_2: hstx-trim@25a {

Before 25b

> +				reg = <0x25a 0x1>;
> +				bits = <4 4>;
> +			};
> +
>  			gpu_speed_bin: gpu-speed-bin@2006 {
>  				reg = <0x2006 0x2>;
>  				bits = <5 8>;
> @@ -640,6 +725,142 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
>  			};
>  		};
>  
> +		usb_2: usb@4c00000 {
> +			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
> +			reg = <0x0 0x04c00000 0x0 0xfc100>;

Here and in usb_1, missing interconnects.

> +

-- 
With best wishes
Dmitry
