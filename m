Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E2335FF6E
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 06:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779863240; cv=none; b=uVK/d4I0UGCGF7ZnSMrp/gib82nnuoWHUUra7pH0edIc5hBC4Wxk3GoN5u/lkFYoTwUY0QTOTeU+Y1tp2MTYiQ7b4cr3317OWeFyOxfQf5Rmgoevj3+gIKWH7LerPAtj7PUehVFABRlJhqvaJIqoip8z17ZHw6Q+6RwhoLCtAWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779863240; c=relaxed/simple;
	bh=QoEPMVUFCrdTu3dFrKxpXDhK5QkrCJveBp9Jo0KUu1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vv6xc5RarOeAdeujFZYCisbuYJeczNPbT+PSdlJr2Ot2cff7sZiL9wh6cKcumEiqaZU+1ScHLw0nuGehbYn6ARaXYQlB0ip+DxUr1aWJ5d7PB4gT8XApbhbpaqsSLKhNrqoob2C74DRE4sgQjZfoJCvky3y/qAaAXBTLXh0Ljoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pT7WAYQ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kd2IkJBd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pT7WAYQ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kd2IkJBd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R2XCWN033908
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 06:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6dU205cHGcCVdQJGGLYo2nsq0Ll/crMV3YgonLyTuLc=; b=pT7WAYQ0k+Ya74gS
	wFgwiF7hDNQUI4g2K0FWNMQkPKDfwZJsQdibBtZNS7NO81jYBBbwaj8pp3c/9YuX
	P/jBZaUjzUOIh6DM48jygjINQJtHWRPz6WRHs1DAGEh4F0gwqZWeFyW8loBZZDi/
	w4egqnTG41fDndrD1wMwQuX7GYcJUNwf8Aoiv8e+TN15HZN4OHTRTrNquhfg1s5K
	zOcGXdmN8CFqdMA5BDKrd4+svzCm1VW4DnNHME9/5oDOkfRx0YmaF53myoLoZgAC
	4cxYAsB7PZyC3f+6YGIoLEXsJHk1ADDJveyR32sLEGt7eBIkGkbQ4NoK3fLF+lim
	H4GPPw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edcnnu99g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 06:27:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9fc5bdfaeso29203215ad.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 23:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779863230; x=1780468030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dU205cHGcCVdQJGGLYo2nsq0Ll/crMV3YgonLyTuLc=;
        b=Kd2IkJBdoQt1fIMk+MHoEF4Dsr02nrMnDlnbf6QmmRV9NwNnOvLDiyGUUvzV0ayJNV
         1/xLqS0Z8qA0G2riV1oE30iSfeqZGJNeImGG3DoX6iG7Gk0QBDgzU7W+m+BA0UKoJgxf
         D6m5OA42bZPMEVVghOdH2Eh1ZVUULH6Ok+MLSGawYaGbTpEREhsaUUZY+mLElz2EPjrt
         GoUhlPbmmosvNVrLKC07GvA5eM++NMvMjmYQIWY8bS8Zuknc57brcqsHsqvDd3ln1udq
         5vP2Bxvc27IE52v8YCczPq7MZROLFML609ukxYcLT++zHXnCn1SSYEmdCWrr/TmgdiSv
         ltgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779863230; x=1780468030;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6dU205cHGcCVdQJGGLYo2nsq0Ll/crMV3YgonLyTuLc=;
        b=ng2+O0sFZUd9qugQZolPFPu1BSl0rL+hOMV5s2ye0CLGmYu3kf7nhWnSnuYZsgOTvC
         ETQdHftxC26NqhU6XhU+XlLyi9Q0i+HP6aJToP2us75p3eYamBTOJyOYyn9UyUYHk9JJ
         AFY0wSScZ9YNOE5cuJ/3HghrHfZEN1LOsCsdeHDxjGf8XwZwsbnSwLgN8FatO+FBSnaF
         18jUq8tNpGg4jVT+uJx64CX0GFMd6/KLTT1CzFy73OgMq53Lj3JtfJc7fW8J3TiQ9qqX
         YcFaMaNObG8A0tDOAkUhMRL4YYdQ1NKX7GUh4aDU0vAnjDWY8JOpqZ3ONJUW8rgmHfbS
         FLRA==
X-Forwarded-Encrypted: i=1; AFNElJ+jzp76eaFythG/M23nW49TpA1mTST63j27t3Z+aEfmVbGD39L8kk4V8b6+twpXUqUKscNIHTWcVoEO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo6zscTnHMPY8waqa9GJO8STZ4p2Wiv/cmhZzyni3Tj2Jh5ShF
	10FijjTBldisRHhEAqAXgRkswqBxt4t0rFD304/QuIY7qvsaRlDeHiIyUyUwVXtgAU+YUvKMbbq
	ehg3g9VhwiWgLsbdKT5wOzfTg+0gnGMlZFieaY1d+68YS5PncT7gvA0RxRQodCGzZ
X-Gm-Gg: Acq92OEaaykpqoyLpERUJ9XMftu7U1zDpBSCkH6z1d3chFArIbY9RLwUH+rYu/gzb4i
	07cS72JA9h2JYqhdPgxCX8el2VeC1Rwl90taPOUztUXTVZ33vrVTi1lzSxHs4FukOQS/mgEfmf9
	4WNyehPIh5KbtfB0ybqPvpxr5KVALuZVY62lFdpMrmeRbWYhJrgZVuW7ZR/m+EFM9UxHekAfAYc
	O14+y2vXt80jRypQRljQa9m4Tjl/XBMMa5uv2V44GF2sX0dyhE+81LFVK54YM4jlJdnjnkU8a45
	kOJsB6FHHheUnT0+y4UMR+xX+Tmojzf5p4jw2LAPfKFNbs3nAaFVQfZLFqt5fRufnHZ6ZK8ufJn
	CAgG0lb8GHGWpGR4wqvSoPR31int2JCPhcUGMnlaHhNDbzDmNedY3PC9we+sZwUqA6uIZ5nSVx7
	IbYTQrm055wb4tEFvf
X-Received: by 2002:a17:903:3850:b0:2ba:7374:76e7 with SMTP id d9443c01a7336-2beb03312ffmr122769895ad.0.1779863230640;
        Tue, 26 May 2026 23:27:10 -0700 (PDT)
X-Received: by 2002:a17:903:3850:b0:2ba:7374:76e7 with SMTP id d9443c01a7336-2beb03312ffmr122769675ad.0.1779863230247;
        Tue, 26 May 2026 23:27:10 -0700 (PDT)
Received: from [10.133.33.246] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58dba7bsm138308185ad.66.2026.05.26.23.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 23:27:09 -0700 (PDT)
Message-ID: <d2098b36-c514-44e8-99b9-2213c4d52752@oss.qualcomm.com>
Date: Wed, 27 May 2026 14:27:01 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] phy: qcom: qmp-usbc: Add support for "phy" reset
 used on Shikra
To: Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
 <20260526184401.3959717-5-pratham.pratap@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <20260526184401.3959717-5-pratham.pratap@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HONw0_VoVG6N0cGKLSobgMz9I025wsGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA2MCBTYWx0ZWRfX9PrtKRF1oIXk
 X2W0pbJRBkBMXLH7kDLTQDNMYwmE2xup8i8gIPJ50B6FE4griJ0ukY8+Mc9GEopQR0yQX3O6vnD
 4PIJ4cfMq4WBPB/YOStxu9F7G5l90nvL+s7mAL7PHICz3+5cgJpOhmhNBY+ojYYLoUbBswY0eih
 5LCZ0vXQUi8HJtQmf+C4OaPwuTYa+CVg4VrDf/ttKT0aEINkQuTVopRmtZTreiYkV0D3FFulxq1
 SBn3/6KZU5IiwxOrotp/aWTYDH9wFoqPzIAVPtw9HrGmxzuxdbGxnKdOe3Aea+0OlOjJ1OKdvG3
 8wbBMVQQ8RitxZgKT1PsKLc1izj/mwUDxuFxqwS0kJqQ2jfkTO5bLbOD6gDRxj9CuJER0wqyLNO
 /ZbTwXxtdryQIwYiTzcjxcysozPsOHluQz0yp+tbLT/uKLQZ2QewnVB3M/TJjQj+EMjx4oXQz1c
 ugi8BQV+hZkhdAo+IdQ==
X-Authority-Analysis: v=2.4 cv=VPHtWdPX c=1 sm=1 tr=0 ts=6a168ebf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=BIqxoA4OLNVSwOVwhU0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: HONw0_VoVG6N0cGKLSobgMz9I025wsGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270060


On 5/27/2026 2:44 AM, Pratham Pratap wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>
> Shikra uses three resets (dp/ phy/ phy_phy). Add the extra "phy" reset
> needed for operation of QMP Phy on Shikra.
>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index c342479a3798..067e7f6e5642 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -513,7 +513,7 @@ static const char * const usb3phy_reset_l[] = {
>  };
>  
>  static const char * const usb3dpphy_reset_l[] = {
> -	"phy_phy", "dp_phy",
> +	"phy_phy", "dp_phy", "phy",
>  };
>  


usb3dpphy_reset_l is shared with qcs615_usb3dp_phy_cfg, but I didn't find any optional-reset handling in qmp_usbc_reset_init().
talos.dtsi only defines two resets for qcom,qcs615-qmp-usb3-dp-phy, so adding "phy" here unconditionally will break probe on QCS615. 
Please create a separate reset list for Shikra instead.


>  static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
