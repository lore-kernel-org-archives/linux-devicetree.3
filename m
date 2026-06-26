Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F57E3783A0
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486517; cv=none; b=PwSbSsLdfOZwrINkbmkdawzbGlrh2oeBwqH+KayqoI4YDJID9A4xTgvqnoqOlQnet9rm1rU7KzU/YZo/B1f7UJHLNXEteAqOLJxvmLqebeb26ozDbwKZtxf/fhsaT/+fgBWvrNLkGdOfDIymUhl2cMW+iSE+BCDyAoKNcJ7EFlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486517; c=relaxed/simple;
	bh=Ti9wZcdPmQ1luO/G6ZLLTNu7JKd8+Ea2ubScJ03pS1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UaGadbV1gS6K/QfSgHsO8RsGQttoTbF9lD7wzbi5CpYZUBlNiSUrclxjjhYBiLU4/3uTWmqlERufI/4/k/HRlfO3S3Z6tfBhMI+FtYKSTm9AyuXCZxoa4k63HssxyBK80QUBFs5U+Rq7W7AvyorwogpgrB2k4EIjllG7LMYgjS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hVigOysL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1lGs2K8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hVigOysL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A1lGs2K8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QF3hDq1198130
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8WCBLywKVM6L78fgzdW46De6pJpcR7Z/ugCxGfOaJvs=; b=hVigOysLV6oqACZ/
	sEvTFB1/oUfeOu8mEJm1e/ouH1jRKNQuy18jMAUomHzIQ+W7Rvfv0Vs/82bRZGD/
	cB8iI9cST+uJVt33bVUq9DFanM0mshWuq0FOBhS9e6+00kstSJRzsKQGYd3LZLyp
	3Ngy87Tf5VaVj+LmWWUi0VjDmKBNVxgb/7NyZFQrbuD7VtqJPg8BpmTdUtOxknyb
	MZtt2ZOJLoPQvRl0YBmL1XBoPx09NN0E7pZhV9Nr3nGSGMV9jfr2LOlh/XbP6d6o
	lnkxn8gLn0BaQuSDQSgVMWN6qA27uESdLRgk/r9R1UJbgz3RG/nr2l7aUEdcX8BX
	U3LNgA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1t0qrfrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:08:33 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-734f236d7c2so46532137.0
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782486512; x=1783091312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8WCBLywKVM6L78fgzdW46De6pJpcR7Z/ugCxGfOaJvs=;
        b=A1lGs2K8Z3iE03nc8Ep9esUGttWFgHDUEutQDrrzOAFiPFRlnJrHSj5XKyLYJdWu92
         tapXEPA1dA9Xyn8gPvgmqX+cHk70A/TwcLfPm3k315rzPHqpLogGwazyRsRckviIjSte
         OCwyFe31qbrhC6CLgqKITWaQYiOgZ97rniNX7WnFh8Xfk32c8f+cNS21EXEWfmLIlA5b
         A/bSan89WNm6+siGCXkHk0gXLy7EcvGqEOBKCjgVWbUXTYuNDOG46yN5cyVA/lLLKUbq
         A3jGvb9lV33OvKdkF8/AHQMuycSeNR+TRnvXZhRaVkuzpjbPVegdBujz/3ZuPhYLsL6b
         rJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782486512; x=1783091312;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8WCBLywKVM6L78fgzdW46De6pJpcR7Z/ugCxGfOaJvs=;
        b=CXgv9gz8eu59RUBHNRBX9iwY6kDTTb4SzfxU0pgqug5vQZhbaHwyRnZRgWDSUWwbdP
         d3/VsLoKnLBBOVn61F6RtrSWfjKKvXJcMeKOuORB0EM94SIKw/fhseq2wDxXV8SpzuYE
         fplz0eoZNlIwEVbmE2l+vmbcbOA0jZSJGbuP2CU7folpnk1TeynjO1eL8klPAHRSZo2s
         S1FBvVuZA13JJz+rMkWighFV6yBw0CRTp+BdZuDKwpom6Xj8zQN/Ovt74QayIdmKAM3+
         /qwHXGN87GaR0tBB23NKIqUz61W64FH+uS4EZHbtzPYs2uHYlWkDK2B+ppHJAryIsLPw
         e3yA==
X-Gm-Message-State: AOJu0YwlSjbMh6yhYc8HfLFzg4sBJwo10lBvNxbhyBhjAAgsXXXnYStB
	wgXqCaKTF9n2j+Arm0FjtX/dWHDD9odf8dXiBNuW219lIidJG6kGlkq8xBo+Ti/UeYxq5RYYkzv
	eyRY9JcXygIuK9D1GGwBfBFRlh5J6W2SYBQCF0xBsOw8QyeCqlnQfjva4bXsi9xNkLOIPFzdL
X-Gm-Gg: AfdE7cmXe1jHetr+ydcjrisP+a36Pun5EBoAVMnUGT84AWhtZhLOdwRtY6bhZx0YhgE
	49ZTaSfcWubcg03OeIYC+SvhU7N/yajKjft9YgwCcB2qw73NUS0YcQVcMEdy61XkwPoMVFx2vo2
	C/xbyuOjajPIOba4wa+SuAO8VmQT5X/p+qSjzpg9pc2I28Jf21RENZ/+Ue8SLL3SDqJau2ORRsN
	+zA216pK/VMQ+aWuuhQRNYc2h55VnTRsWCfLHwQ/v/1FLf8rGUo7cz8S+N7gg5LI1x+jpH5hJEo
	o5DLs3dDig2XpW0uWGo5aHrJFzhWBch0Wix7/jCiZCjHhe+wmF+QSrbSayu7AribKuhvqVL15VA
	MH9abB/IWkk1bu4fGpO2mICZoS5W0gfGKWpM=
X-Received: by 2002:a05:6102:424c:b0:631:267d:157b with SMTP id ada2fe7eead31-734366c92a8mr1199065137.5.1782486512430;
        Fri, 26 Jun 2026 08:08:32 -0700 (PDT)
X-Received: by 2002:a05:6102:424c:b0:631:267d:157b with SMTP id ada2fe7eead31-734366c92a8mr1199052137.5.1782486511997;
        Fri, 26 Jun 2026 08:08:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b182a84sm52287371fa.32.2026.06.26.08.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 08:08:30 -0700 (PDT)
Message-ID: <bf7f9caf-8ab1-4420-be4a-b2949c17088e@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 17:08:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: Add IMDT QCS8550 SoM
To: William Bright <william.bright@imd-tec.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
 <20260610-imdt-qcs8550-sbc-rfc-v4-3-358e71d606bc@imd-tec.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-imdt-qcs8550-sbc-rfc-v4-3-358e71d606bc@imd-tec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEyNCBTYWx0ZWRfXxDxOggcu8uIH
 NXR6B7J0YskcZyXZgP0WzFbLMkWtJZRC9Z5HCAL4FPwInuHFrLkFW84BYSqHREUv/jEidEqmTpL
 LjM287QgOaDrfByq6jw3R6QpwMHNM3c=
X-Proofpoint-GUID: 67uWNfogY2kHnCDBG21eMDs28X-K2gNZ
X-Authority-Analysis: v=2.4 cv=StqgLvO0 c=1 sm=1 tr=0 ts=6a3e95f1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gNcS5RXMAAAA:8 a=qfocr26bbEtc0TLUibIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=VeqYHxXNbGx7SVBbL1V1:22
X-Proofpoint-ORIG-GUID: 67uWNfogY2kHnCDBG21eMDs28X-K2gNZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEyNCBTYWx0ZWRfXyJ4YN+tNjPfb
 1Xh2m2J7vZA6sb/enp+DnX66BskOYEUkH24L6P0XmBab4bLD04kf8Lw1MZPLxyS3rLg3lYkQcke
 Rq3bUuoUM7NlU/+9JuDkIL70THL6XXSbtWCW/S1mOwmUfYmvML+BvBObs/WzI4ckKIHryjRt6ki
 awa8sN1lx9k3jKdoimQighaJS9AhGh0rs3vxAoJdPysfPfW+UWW+BJwb74ZJRHB0PRAePPqsN0A
 ibwy7TBL66whkHKtr0hrK3RmX4hlZmIuXNcb5QngFW+qjTJP013eOF3yg7y4az/p8FX5UeVY+JK
 pX5gxG+SOM+5s6HcoeRkhSYEtGk45KmOcYHstGE3YHUULE4okNt6LRq2k3rMwhprq+wp86J/t0L
 bOgakmJvIbOKAPF4sQeAS8ZKyLD8ITdvBRh28ghA25b6JIjFohRnXcVOtls7K6WN5uxOGJv3ccx
 jaZlUvwSEgJCOOfGgKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260124

On 6/10/26 10:57 AM, William Bright wrote:
> The IMDT QCS8550 SoM is a System-on-Module from IMD Technologies Ltd
> built around the Qualcomm QCS8550 SoC. It is intended to be soldered
> onto a carrier board that supplies VPH_PWR and exposes the off-module
> peripherals.
> 
> Add qcs8550-imdt-som.dtsi describing the SoM's PMICs (PM8550, PM8550VE,
> PM8550VS, PMK8550) and the apps_rsc PMIC outputs. Compared to other
> SM8550/QCS8550 boards, this SoM excludes the PM8550B charger PMIC.
> 
> Assisted-by: Claude:claude-opus-4.7
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---

[...]

> +&pm8550vs_d_gpios {
> +	status = "okay";
> +};

This is already enabled by default

Konrad
