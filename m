Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E532D739B
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 16:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776530776; cv=none; b=d+XgjhZw1lz5t6vcx1hbxma/uqVi7MkMVhonFRrDj2K2QFguJEwTrXNLsIXi1RTq4O5TUnXU9+yWagB6PYB78UubaVui44/ZjGfTTTRR/NwxVs5FLSTUFOf5tLfUswsn80nsv0DOQVi2W9qHi/v7OF9rXxaYaEkQW8W4ioAy2jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776530776; c=relaxed/simple;
	bh=Wp5uo1kEWsoAlDaB84RI1CZfMuh7FTkZNljPadpndCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=my1RtgSeoxTZ2Dw46fwy3F0RkKXMlPQsZsfefh2bz0tQkg4R2PfIoTwZORzTnJvle1zzWRRubM3kxdoOdhd51mIW4mZjXtGMC0tYMwOtUlbKWku+nxciIZwGk/Op3m8pIGGofNP50v1KyHdPDZzNO51o5GBKsM0wajGFeUVgWh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMXNrOQB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSJaPWR9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lMXNrOQB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSJaPWR9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4ULEs509694
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 16:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AemAHZIONmX9Bx4hX6o5KMIh
	YVIU89hnctinbw54IEg=; b=lMXNrOQBbXNP5YWXpnI1rhoOIHnhDXKWzmvN5xcg
	fJUwXTY9lNj2l78wpeMHLHglBiWkwF1uaMJUjbVbEkhqWUrS8kItPV9vRwe1d1Oz
	08IS9x3N4FuvrV+YilWYQ2tw16vVo/eurdYF2FQAbTwRIJIMO4c4BTRLwohpRFGG
	0uX0K/vIXF/7sKZnsCF6LNYmnSEkq6+S/Qx5iCVM22370AFTWHcypdJE9hrSelyI
	/OzeMlf8a6zvPZyqMySHK7oVLNSd6gbSodPqAcXJhExXOliA2vl4obXJ7dRS8Ieq
	ikCPd7U4BvtNea9NZGC0y+ktA4VmVq+nBbk5Ux70K9zTNQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b714fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 16:46:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d984c74a8so39765861cf.1
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 09:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776530773; x=1777135573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AemAHZIONmX9Bx4hX6o5KMIhYVIU89hnctinbw54IEg=;
        b=FSJaPWR919mymUASTA5baUc9HNWaLL2lU89VDOUxMCPBFVEq0g9K+xiLy2sfMpKwT+
         dkDzEA5CGT+13D6UYii8Z+k6xh4LtR10Lb5i7/H5/f7Q9cl48nIJo8ChxdIyReyZIvmU
         WDMO72KTv5sLtqg6ejtZEn8EbtBygMAnydp3vL+XHI1c7LNnTA8wKvMqzhUZ7U9ozSsd
         QNOmzN6+baHeomOatIkWH1nBC6odetApZZTYdOBe7Kk8FC2bDqmwNk79lQF9WDtb6NoQ
         cO8S+Tl/AFn5V8JZWhAOjd9W8pZuQHqOaIM9pFI4iJ3w4yIqFUJelJIHzLf/vXx5hAxG
         5O5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776530773; x=1777135573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AemAHZIONmX9Bx4hX6o5KMIhYVIU89hnctinbw54IEg=;
        b=XksOQNGKgkR4v9HM7WwjUneFlxvrmgNBaSxlquy2NrbgfEffjU6k8PKRei1YNw2SMg
         vJ5kPjMcc0RkxpfhNZDguR2A4NIWPpYdodFFxDEdeqLU3XwZ+Lc7S2RX+6ovEdGmACJq
         F91Wl6G+YuS+Z0eo1qOiShReNFaxU6pOOSTCrtmPTKi+dODcNUxx9IC/DfWAdV6YYMC3
         aDWXl1KdM3Gm1WS6ScmBapaRfOIVbEFfZVc44gSvb0Qpd9xGGyyeq9FM7kL+MXBzIhQF
         bUI1+2XdCPYL+b6X6krSu1i3ahH0uB4KCBAHy1kJcTvId3QZTdRH8FrmqFRFiX7rcEV4
         2vJw==
X-Forwarded-Encrypted: i=1; AFNElJ/2OE7cVgMnxe9ZiBXHbkMN4++Y3pxgX4fq+MezbinPbfbcmKwyLSaXUtvXd9Rboe6xzoRZM1yh7ECo@vger.kernel.org
X-Gm-Message-State: AOJu0YyAp/QTIN5fYAzqQiRtBtnFKdRZ1LS62nGp1+OarRNl5BznzY6P
	AS+aoIU4oi3w3Kqmb9WyYiJIwojOa4LDJZjgy/XqZxu63jxN455fpTHED4Nou57cKM+yjBj0tP4
	L1BYz9vPylwuHxMdWcVFZ3PALflyqJjlPu36xNU/xjlv+0JIyPd7oWiAab/Fx+qi+
X-Gm-Gg: AeBDiet09i6UM+xK9UbBKZxAsBtx5cgyvGdH+RNAid30Dt97ORXL75dJazQQMRmgVUd
	LOax5nrVtOI+PMcJ1fVAnfhQq7NqrFsomsZyDM9guYmr33iLuSwKhxxbrFx8u876enW4BrVB5Ad
	EZqAQ6Kpbz8zp8P0t3P2bcFOxZ2mh8733IPpdkByNXl5PORRFojWoOIIbIJvqKeiolIeJ7w5K/y
	7jbKy2T/gHRscnlJuuLdy91x1EgdrrqMcHSnTq3ZOD0uu7Njquku7OcydivKe9xaYniDWDkTfjJ
	PSSprBnovXfgH0GsaoVFcnoz+VxLNP4AJnvhcam77KpLQPrarQjtxcmn260B6D63kc6M6EgrcsN
	6Jq5lZmd5cdI4JgTb5LoZM9qB5Ujd/2zMp6JkOXaQNZYn2Ei3X7rKltsdhWP1VEOL0acJiP5CSV
	v3iAWRC6D/vrbwoN5msyUCpjn4M1aNZ9UGAbJVbWdZSef9JQ==
X-Received: by 2002:a05:622a:418a:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-50e36c15da2mr110952901cf.29.1776530773235;
        Sat, 18 Apr 2026 09:46:13 -0700 (PDT)
X-Received: by 2002:a05:622a:418a:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-50e36c15da2mr110952601cf.29.1776530772833;
        Sat, 18 Apr 2026 09:46:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm1448060e87.82.2026.04.18.09.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:46:11 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:46:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 07/10] ARM: dts: qcom: msm8960: add SMEM & hwmutex
Message-ID: <2gydufud7lykeselo7yca3n5jydtbzephhjcpm4ek5i6vj74h7@b45lfcheohsb>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-msm8960-wifi-v1-7-007fda9d6134@smankusors.com>
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e3b555 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6Xm4nHdHo4a8rT5D54oA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE2NyBTYWx0ZWRfX7IsKXUVLgsUX
 wZm1tROtGt9+SjBfyIIPsydN41NXczX4NxvGEDPqga7ZvyAxv29e21tf28AC2q1rxDILrVqYEEW
 0VHcdPGthkUP8h9On6eVwp1+jwPPC8+Vmx7AVYuZqUI8faRsQCk3yq1qMhTLnagnIBdrGQHralw
 3OT5a4JRElDMM0xMEomuFzlpo1Don3obq9MF8u+OBPn3K4UIMfp3kpJd6ioSyZxSVXV7R33JZV/
 lvwz6miNldwtA6ML9Y9NBw5eeD0mzvrppN4FxcVCh1fWWrBsjdzcCl6fi0XU86KbKm4owAB1/FS
 SDyN77yfbfv3n0yO8o4U4deAm0O8SxPZLEzDcBz5519jqvZX3jOEcvxhRdgVQCjWv3OFYuoxpkH
 Pc7XJnYU4k0RK4yoP/XjB5uYwOCTRqlhvOpIVGUiwvYVE1CgI7P64/HTM0OaSaXL5z7OZc5SK4p
 k6JNd3Z1HfnEITaX4xw==
X-Proofpoint-GUID: 4_YsvN0RPxw8tI7oBj5vRfHxWjbuo_xg
X-Proofpoint-ORIG-GUID: 4_YsvN0RPxw8tI7oBj5vRfHxWjbuo_xg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180167

On Tue, Apr 14, 2026 at 01:55:34AM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Enable shared memory communication and add the SFPB mutex for MSM8960.
> These provide the foundation for inter-processor communication with the
> Riva (BT + Wi-Fi) subsystem.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
