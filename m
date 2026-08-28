Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D17463B80
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924505; cv=none; b=r826eOyl4yG4fO9vmkISsIiRXJNt3Oy7ONdqrVJhCwqb9GSjJ6/GaMN5oVM5lgOyH60C/OEO7p0VTtBrm6bUd6yPwWNt1+pi8cHGGExmzkQdCjWDEDYzGpw6fmDV0zqGIc51mtZzfvn9hTN6Nn15cWrU3U0I5teQCIRNRXM3Qrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924505; c=relaxed/simple;
	bh=Tb3pJwHKGH06SZSLA9DSDf2HFo5zXpd3gB1lmiQQeaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0nVM79qK7ic1XSnw6x3eq31AKvs5dfdozvJvbTFOSRoM3Pf9VrRWpFvrXS8nzRoBIxL9EerWEykcmKsmu+BU74u9axoS7107WAbYClLEX7spX1vrh4cNw1DMPrdlvDT69rJpsiqjido/U4ibMQ0Koq2qV7ZUbg2UgAeaTLxXXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QU5jOah0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSy8kC3w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QU5jOah0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSy8kC3w"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDSAs32604461
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Av2GI0kKVGDvUdYvVPRtWjATg8du110aFsEraqsTjQc=; b=QU5jOah0tIbDRAh9
	uKMO7sI2LGk/1nA6KVynwGLUfLa89QdMeivfuF5PAOLNEUU7m2QBcRD+a9vPeKKz
	PIoC3D0Qp2iRBvAk367XPFf2D/YgbkjOtntPv4OuKeMNvO2CSDV+D7Nk94wURLdj
	owAzcgLxB7hrK28/LwFB3U6TndPnrbLOXFCQB47yXPbJxbr8xmKvz8yQ02VKYMVi
	xVtfh4Ww2H1TApkZlTdZsiezi+GV0eBgYFNl2u8JX/J96kB+bp6WNrAs9OIVJxLO
	tmdRm3iQXokwsntg9kfBr82NQQgrHRQwG51jxe6UiyiUvwupzTHxu/R8b0cF8ez7
	qzv+CQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h017b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:41:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso24006285a.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787924502; x=1788529302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Av2GI0kKVGDvUdYvVPRtWjATg8du110aFsEraqsTjQc=;
        b=gSy8kC3wdFqqrAT4hVE+gu9rlUPISFtn5r1mqLsSpfpv6K4e17uLglE82ot7PWoU/K
         E+Wvcs9kcNxpTZS9EIkUsyXp1ByGSXdpr1mDwvcg0TyOGtjxVwXg/zdkCBEXoKfwLtBq
         OFRg9zg538znw26nxQ0+OdP6mG5E7WfOEw4L9lFQSEJ+yFNxetnI3WyFzHKSzj9eibWl
         ba6e6bRgDO0aOJek9fXi7OB1K1Ag5VYKErfTkdwowXLXeVGV6BctXdTf5dz0LpAk4PBJ
         UAUYaS84L0Q+eXGGqMZMQZUdUrmqP6aOZd6xluqYxHYZALc34Xf+0hB9Mm5OBvUbVm1N
         /6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924502; x=1788529302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Av2GI0kKVGDvUdYvVPRtWjATg8du110aFsEraqsTjQc=;
        b=eKd2OpPtOh9sKrkoSzvyWG18dPonUtm5KQjwE8VbK1xgmjcexgYjLSOVFYwYTMDy0h
         dv3t7UHwIugUBfx+m54Q7NxLTertmWgcbUbOlB4Ftl1kKN8DHiRaLu+6e5GJqq+FYo4S
         p89TE6hpqGjr4losZcJNHnz1QYav8alx8qY2oo4WRFHYvLvTQ8LHGYkcQCpqSua8wJHx
         oIhaueGbqjcRLgz5KBKg6powg0nV3mWXMi+Yqfbm38Tt8r3olfZN75wTy5gBE8elpcz0
         LfD+roPiMOpjzCAFLEDRHfVIg9fa++ltsAny269VdGGFvia39DoUFj3s6ZH4NbIkHSr0
         88hg==
X-Forwarded-Encrypted: i=1; AHgh+RotHYmD2TPK5K+PkZBbBHRALAJdjhYMzCW+xej41mRl2sGbsEAXECXxIcsFB4xW1U4Dk7L+PvGPuD0w@vger.kernel.org
X-Gm-Message-State: AFuF++ktHSxKhJUiB/2BJdi5uKty9ZjDFMobCoEE4HEW5dBtz0WZcHZ1
	hlMQJtr4x2ybdZOsPsRTnUKVw1O0YuKkX3LzvIRb43f7gpsmD1EyuU4Kkv5vf34we7sjrFmZSk0
	ILH8fG0qeV4LkhhHADI/EFNYXgrj0DesbJDdObwnBg7J//tL10ouplNc9JnB0ZVF5
X-Gm-Gg: AR+sD10hAiyh861z6o0QShfigr43d+UPIVuQrXXdgSvWp4cHf1Kk8SXu78ktLT58d3h
	zSYYntWHt63ZsHyR4Tsodm2qVCv3OTOBIt6DvjVCJxFeRCg99Ugwn7ITAIyPNXcThQZSEM9frja
	Sd/TdYVK6znBiWtM0v+1zuKkQU2tOv8hhHUQ/X5Iy6C4aOLrRdAkCLSneYodlQsAtvF7ZsaNx6K
	WJi8QbP4Yf+pQbUDF3LzmGACO+HtW2YOWG5JTk423Tyofi5O90FYCgdj0M0ykoVKUIyHiX9qKBP
	QKtFCwONX9SQvqL0xGxaVIh4wHDHIWTZaCtMbPbv0tb5QovKgS6y9i3FNkXwDzs88TJB9UybyRG
	9y5lye9qEih8v8Z3DLa+0U6o=
X-Received: by 2002:a05:620a:2950:b0:92e:601b:8d43 with SMTP id af79cd13be357-939137aa4f3mr479998185a.1.1787924502362;
        Fri, 28 Aug 2026 06:41:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2950:b0:92e:601b:8d43 with SMTP id af79cd13be357-939137aa4f3mr479992085a.1.1787924501825;
        Fri, 28 Aug 2026 06:41:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fa3ddsm81168766b.45.2026.08.28.06.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:41:41 -0700 (PDT)
Message-ID: <c27beaef-05aa-4963-bf6e-ff6df08c6110@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:41:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1h9AgnlPZp8tmb7rbszepm35aCddSmqR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX1O57U3vlb5pW
 Bbnpi9GcX3Ka3e2F4mFUDTmsnl3bHKiSew0bsrCfy0Uxdl+PQ0eBbNHilE3CJ/aNqWqhMmXqoLv
 KOeeDm0cRtLjkafqIJi2pCcAEmaZlHk=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a919017 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 1h9AgnlPZp8tmb7rbszepm35aCddSmqR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX/BRouqQaScM9
 KSEETSiwLbYgm1pHnaWPuzNe+ZlsU7raeqMdSJLVT5IAh9qLqrHrsifSwqpfVrO39I0bQG56+O7
 q31Q8OxgIDzYSytqO7jyR7jFqSJHKq2zQogKs+vkKTlFSwewP1bxRFwBVcUH8H87ZKLwNCafnhG
 yQmIDUiZm9ffSrUVy9+MhTW5nloE+u1OV3/1LjEY5ZbyIOx7N9XgaLHj0TfWT9vSQb2ExU715rs
 S+/zkOEuLdduk0+d73GjectO6YkxLuHPHBOz9vl+3k+cDXo/VrPTbP0X1OJIaRUXYGNzLpS/cRC
 zlpg7x+nwUF0LwMDjZ2jLgkcJvdFSqEzos6l/dTncNvwqTUErgJIO7nnF66lOiJHvR+4vIdYPWo
 /SK53fWY/V9tZoLFbpxCr3vNyvvpjpIeSDTV10+ET9hXpBsWFfuMnGbhYAnmJV4WCxzSZH/FlWS
 yclNNbwd+kTcBJ49wdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280118

On 8/9/26 2:29 PM, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in monaco.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 115°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
