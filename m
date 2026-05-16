Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7811E3E4C83
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778945124; cv=none; b=mu+MRwx/MQ0b50ERutzGsMX4M+vHzaqOBEcgGsq8j0Fh2SMmZGDQ2WJ2nalRWywKTp+i8OsA0vhWXC1klpKC9fdJjtFhAQplX2nMwtUeh/AYA1tJOXNlOAtJYOATEgN2IaiAxFu0f33S7BsfIuWtugTLWOzWy9EJVCKckbl+NRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778945124; c=relaxed/simple;
	bh=K4P/jy7iPs6uOmmZQWIuzenlByOnePT0fEzz+cIf5E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PLx24nF40Rzkbx5J8SGPMindDLCCVx3pejPN1G4wsgKW9m5pM5MeR5uxwsCxISy/cekK3zL/JlvczP7boWqDHVMgDROCHc7S5PiE3F1v4HWl7G82i/05AZTZI9IiZTySI73bDQxYF+prydbIce6581eyUI9JuBYrOQGBE5qwsmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Usf4EMwG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q8SCMMcy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Usf4EMwG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q8SCMMcy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3er9L777183
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 15:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRYRE7MmsWLhtA5XL0Zaq4CcIUGaTOA18JqmZtzcf4k=; b=Usf4EMwG7057hmYI
	Ph/izuCPLTMwNIksn7gwAZvjdDO6U9ppAk8udBtX2D3bdWeqgOFZM+KMwW5UabN/
	n6UxX3D7ottD6Q0UD5y4nlVFtqr6Uz/HFO0cV0nJsiVUJ0oOB2QcgG3OMcNwEygO
	YlUKhGi+jmU0hi9MORN+z5woL61t2rHbwiOw5Wsvt4//8YaRtRl2dOtFEcnR0NFG
	sZURjIjXm944en4Nc+nbYEsHdeofJFWtFLejuf06BhXAdKcTiTXYRaPmbX+uPBKL
	8Mj8KBq34NKYNhq7kioiFWA5Ki0nHgErJh0CIq+8/cELphFhp991kXIjhhunku0i
	8mmYKw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvys5u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 15:25:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso29696341cf.0
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778945122; x=1779549922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRYRE7MmsWLhtA5XL0Zaq4CcIUGaTOA18JqmZtzcf4k=;
        b=Q8SCMMcypNVSNcxOkMH/xXP2duvP325x32mkWDIAsHodDnTOUuIhvSbK9gNpHbe8pa
         AQJJthKO0ob+ye9QB6fMjBGDOlbNtsMU46HHQ+p51Ngfz4R1KhNk3ykkv0VGQCmTkBEO
         297HXQISdg6wmTYgmzgKNZaz7xDc/d3vAs/gY3PNvWM0AjU79zMfegNAKu5xiqsGLOKZ
         QgbGkhcAsNn6luZB735TISZUj38O8b3HbL2lyhXe1s4Mh4v6j+jQKUsfawdYzULt+y/5
         rwaqI0aIv6TuXzlR3K3LyHF/W6QXrsltu966kZOC4VFVmLd2gtmDXlYpnjyyTWT5iPSr
         35VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778945122; x=1779549922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LRYRE7MmsWLhtA5XL0Zaq4CcIUGaTOA18JqmZtzcf4k=;
        b=aXMC2WYS7udHdP3xKAF+hqEYLvJlvo1x+zFfYPa8YImIFwFUUkhMEzzXb8WuyTIC/G
         C44LvMelOuYT22vK4Sy7J0YnIokvjtgIUJ9nrB34FtOV21FdteQBcBIxuL7EsfQBr4Wi
         lisiriuMws7Qi+pUqNm4DYL3wKQ7op2o5E+4vqSBcrPxkrxL5yuCyqXKAa4/ZBCDrMoN
         NhXaR+efhQNRkF9mkiEZkATjwCZtGhGOo+Bxidyoq6gUzluUxFBup14U09xZsc2/kaIa
         z7hAzK2tEn/KnPikU16UESbHMGHFSvj66M6anfaLCWFo4u9mScxkMlK4CwMf+kVYwWF5
         DTdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QJmqooCZkXkmkCO5zYGNeb838hJzhOSdySsuPY6YUDrmlBGab4/E+RaaulvDHrb75i0wf8dFdZvNJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwyM+XNdB79i43zDm4620LZLINzYUvyEAjNMreoa3MNj9otn+c1
	mIRdjcdmOTAnss4RTqU8tZw67NOmI80hkX2ohDDG9i3hTfGOIeutUhx32WOtott63QEWj5F5xAQ
	rXfzSs7n/xwHE1X9QOcUcx5gyFbAU4popgwLX5r5aRI9gokP5w7Ix1KxucqEKhkw7
X-Gm-Gg: Acq92OEzDkdtyzgh7Fs6XgZ9KBDahKkvH6QfjJDZnKujjL+R9qMZ+A2zLW7+mfoqUjF
	oNf/ttsT49ntLDfcz7oSby7bcldoS/AtEZxJJWaM0IwzUivMS/19ZjA20uaey4c1J/9F4xxhvFw
	bY04YfbLb4mdrrcBCH4bsW5eHrWe3nC5TeBVSmU+IPpcbCUX78D/3oQamEI5ILSIUP6uAmQknMx
	2w3YW0cyaMlc4IlHyiHZro8gLjtsQapa/A7o1Fe41w2/5R6R3f7weISlSVIpWGquWnYfETB8hQj
	T/ZTbIIGTIkrnJZh6eeNVgzDDgAUWMl3NI0vzHdEvFsuRYelOr3BEk+gOFBjd4zjVPaO1rY73ve
	BIOn7D1zXzSdOXFP0E9H+IZt5EZGo9+oaeFfcb58avIsOpgolL3il87SW53XUcRjmh7S7p1IeFs
	2kP1CdBlwDP/h/ZqPBglCkiLqJTUOA/WXD46w=
X-Received: by 2002:ac8:5c92:0:b0:50f:783d:8cb1 with SMTP id d75a77b69052e-5165a29619bmr129086921cf.58.1778945121748;
        Sat, 16 May 2026 08:25:21 -0700 (PDT)
X-Received: by 2002:ac8:5c92:0:b0:50f:783d:8cb1 with SMTP id d75a77b69052e-5165a29619bmr129086171cf.58.1778945121210;
        Sat, 16 May 2026 08:25:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cd939sm2057972e87.70.2026.05.16.08.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:25:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/8] qcom: display / dts: Few corrections of address spaces.
Date: Sat, 16 May 2026 18:25:15 +0300
Message-ID: <177894506983.2448625.13587872132931108802.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDE1MiBTYWx0ZWRfX3msUo8BKIKxc
 6yrAh5yOemAqvLmBQpJe77kmgfa2GL4Vur80QYCicVrYoF2e4/0vvH5jcA0p2WTdpFeSXPJjDV4
 nzSiRdfAjHVEZyOaWY6zY4Hcnb+M4SNWa+RaqbAyYOa53EcPL1u2y2+Ppan+6uTs2ZsVW+rmnQd
 khc9Z3xmld70KwNES32QpnOvGbHW6DEPkaNIqmwuJ6H2I6rK4gjjwPZdUPlwnJMTBFNhgG8oe8/
 EX8sCISiyiaJhsrLXpbDuvXi5eEogAFa0HbAWZ/tdqHlr3SiBia9wnN6k3JzNRSFOIB60nTQWms
 gtZvIqBbt9oYN74rvqyoeHXBXkKnd6kF2GYv3MDizWkPv6iELTyJTZ2VnDngUKs43n4vAL50WIl
 FR3RAi0zs/Yz3bVvnIpA9Xa5OO65ml5kvqR9lLNNpjwYNzrgUkhyJce7MwhTnz6BDBUzwYxUEBL
 0w7qA5bsQepytbdU/lQ==
X-Proofpoint-ORIG-GUID: 8oInv4WdV-Or9ngGhFywrbtRrW4HzURf
X-Proofpoint-GUID: 8oInv4WdV-Or9ngGhFywrbtRrW4HzURf
X-Authority-Analysis: v=2.4 cv=X5Ni7mTe c=1 sm=1 tr=0 ts=6a088c62 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=n4T_STkPxQ6NuhZPjVgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160152

On Sun, 05 Apr 2026 16:33:56 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Patch #2: Add dai-common.yaml reference (Dmitry)
> - Correct subject
> - Rb tags
> - Re-order Eliza bindings patch
> - Link to v1: https://patch.msgid.link/20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com
> 
> [...]

Applied to msm-fixes, thanks!

[1/8] dt-bindings: display/msm: dp-controller: Correct SM8650 IO range
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cb6f19552b49
[2/8] dt-bindings: display/msm: dp-controller: Allow DAI on SM8650 and others
      https://gitlab.freedesktop.org/lumag/msm/-/commit/557226acef41
[3/8] dt-bindings: display/msm: sm8650: Correct VBIF range in example
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bef8a15a6ee2
[4/8] dt-bindings: display/msm: sm8750-mdss: Correct DPU and DP ranges in example
      https://gitlab.freedesktop.org/lumag/msm/-/commit/399f7748789c
[5/8] dt-bindings: display/msm: qcom,eliza-mdss: Correct DPU and DP ranges in example
      https://gitlab.freedesktop.org/lumag/msm/-/commit/795b19cbcf43

Best regards,
-- 
With best wishes
Dmitry


