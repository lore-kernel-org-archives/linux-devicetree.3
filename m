Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B26A481A87
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468041; cv=none; b=AysEVYI+xXDvvenhPj4Zp5qgLGjuJvXgTjsQ8oo26TVh0xd4QZqBF1L7m9Kt2ZlrQIHFLskgKr/QLmqHJU6iUrX1C11TF+IE6Znzuzv6gJaXm5quu/fHlfVSe/AKX+Q8jybeEQresVDMQ5Hk/8V/2neiVQCNYOP5VYcnHqZhOF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468041; c=relaxed/simple;
	bh=ckBmQCsGl4i0H5swMQltGNEvLAQ4QNaTpkBEqzAPUS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eoqJs9vOxPKKZGEX2SKlLTq8YEFily4RshXt7L3MoaqNqwVogkSLYd9VOkrm38t1rQC3GczgjnY1WuG41IjN7nvrcgfSWDKUKklTo71obx7Wgz5Xyt/IkvZ+CAPuzP2pM5yWOP+OXjA92DTK18nHF/HhnpmAIocxJkYQ6xkCgPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIwOYd+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dgr8ZzV9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIwOYd+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dgr8ZzV9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hI1X2833340
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4B5u4XhHsQDHFwAeN8RPYZsJq7AgzxHPXAAIftTImPI=; b=bIwOYd+JYKFSCYrP
	nCi/eAq75tXkFs1ZYz/8MAhCy2Nx5mfuB+SFhJqYWAdqO5Ki8XFzECuVfSnWzAuL
	4thiNLSTzeKsrQH8W8M7dEv7sk3jh/6jCBbsThaG7649O4nEo4YKTFQMFhfbymVa
	5/Ra+rKB114Ves5BkmJ3Yct/+R9zfzlYATVK366v4VWegslqrg2Cxj3wA/GeutJ+
	ZWlEWlB1EpGpqgJqPR2SIE7wQw3G1l8luRBwF010kkya2wbCAhYUVOKD4FWDU7b6
	TfjVDwIpn5KdQCHsae/OHIlHaGMvkewseomzIlAx7Aykto9YgL2jjaR+TswQDBU6
	VQ6W7A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyd9bfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:27:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1de6d5c3so448343285a.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789468038; x=1790072838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4B5u4XhHsQDHFwAeN8RPYZsJq7AgzxHPXAAIftTImPI=;
        b=Dgr8ZzV9IetsU7R6a0WNXXHJDLFPNuXUf56hqinufKd7Fj4bQVaUqhkxKqaKeeDwm8
         D7s7zM36Md/1AicCh5XM8rMd/9T5Te7bEaZ+Alyt+q78jXxzoB7acYu3mbdHsS7C2afO
         ru5P9Cv83lFl/6rSk5ARQhX53sUt7XUURFPgKHuwcu81g4hyp0aOgmS5ynw4h3fKRSTq
         zE7VGBu6crmGGIioOfhQj0fYuhb/737VEBgxke+fDqzpxfvtrPt1eokvCsB3GyfJKKwo
         E2p5iT7VY2KjNqP42umKhYHIKBp3CAsWGHZbJZ0BVwWwSd974eVZaS4hOFiElzqcoc+g
         900A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468038; x=1790072838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4B5u4XhHsQDHFwAeN8RPYZsJq7AgzxHPXAAIftTImPI=;
        b=GZe4Rl0Wytc4I52uLBd6YzqVT00SlzAEs9HwX/Nb3lW41qYT1VtxJj+y+c0Qcv+7df
         bdegzeNhjAikVP2A98YB8Uhsh2AbLGhtXELzW+zJGcWS6DMZBtj9wUhO7FnoUmPHCtjB
         7v71i1y6WjhPgUv9vGseyp5/m9gVIYiGXkTj+E5wVHW5q0UPOwAhlRk/V19QR10wEmeD
         p4ZGZh+8RL0XtLahrv7gEs4Kd9PxLP3TF3DU9DCDMvx/PZsc0VGkH7w6Y4IUyIuAybq8
         CH9FLpLN4/JXnOTIZdWtvVFQ0Mwnbpa62gp0jI93OFCSXvopjCxwPqk+b3C0O/lqtp4k
         VjcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlYeGyAEcg7Eel2qYaSE6GtSHFlRHjTN4szw3vPrThXTWHovdvH66PkifiBgBEU6Cv5u1uv/LmRcCj@vger.kernel.org
X-Gm-Message-State: AFuF++lBFUN6S26DUX4j6QWvvXh/fe8aHW/A9goNkHK0hHps6ktjE34t
	kSfNVkjXWIpERkYb608NCZRLFLZuq4ccUwABtz/Dfs+qs/U++c5B6fawijZ+hRjgw+YcyJ9Zlvr
	bUTRo57frgtkIy4ZoAosYq5Wu49rMsUG556B00EuuP/6MR8WifrH40xZGqdDlU97y
X-Gm-Gg: AYBFou25+HpQIJ/dNtbgM5U6S/gcSYWSH8Oq+L9Tf5NHjxWYdAgVT4/wkb6PKgYJhYX
	HA2mPjhQhBn0A+vzLNZoIbIi6Eh4QC2AAavByVxNzdUD8v5/QR28zSymBmh518MHAs6mazn+W8j
	o8zxGojbCQGdcIxGLks6X4bF3CQ7rlrmEgV3oHHtKSEQhgko5ocNDFtr4pmMAGxjc3DbpEu+DJp
	QpWX6AieQm2kVCG/+ijUa5duMyF+b7P5mmXIEooCRBSR9qTg99Wx4MWWwvZiy1n1hGFypU1WzWS
	Dfu7zWIu1md5A8GVhwIz0WUKwBU7fw6Q11kVV8sOzA57oO0X+jtkOY+59Hr9mKLcvLHyjuoEhj5
	16CRsrRAR9e0nOTpOJj4GlGxoFcKm6n5kJKVvCM/3az0YGTXA1afCFXOcREQ7oHk=
X-Received: by 2002:a05:620a:2955:b0:939:8bfc:471a with SMTP id af79cd13be357-93a29bb4ca4mr921802285a.49.1789468037819;
        Tue, 15 Sep 2026 03:27:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2955:b0:939:8bfc:471a with SMTP id af79cd13be357-93a29bb4ca4mr921797285a.49.1789468037445;
        Tue, 15 Sep 2026 03:27:17 -0700 (PDT)
Received: from [192.168.10.107] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6b6261sm71836915e9.14.2026.09.15.03.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 03:27:16 -0700 (PDT)
Message-ID: <0bef7837-9fd7-4401-b6cf-ba744f5beb58@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 12:27:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
        Casey Connolly <casey.connolly@linaro.org>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-2-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-2-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE1MCBTYWx0ZWRfXxEmSX0dBe9Uw
 qZ8g6bdNDaCa4VXCQVrx/sZI8NGJzi2dCGFyVkPXtM4PFNP+csxYhO5u5Fo06T0GFE/eoMWKCa1
 XRUokxUWbnn434hx/1WscEkSSTQrTe0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE1MCBTYWx0ZWRfX6s8bW43/KtJS
 Zx0WY4Lt1ZE+8/jmfWt44QiPpQBvszKmmLjNaQx8JXldqXTXmKncC7/sEo+VFn/CCyzL3P97fYk
 hTVQ61nuRdSgqN2kVDn+xwfVnpip2Bou3LSTSkkPZSJ3DWMMVUP+b8sY89tWRGDVMWF0cNtNNmX
 cnN9hwb/hHz6UBkZWpKAq1HeiLJf2yoQjKnVNyUyu58s5UK++dbUjsphXCzWnXvIjHaTNUkOs8N
 udELycghHnjeTaCkQb+vgNlSgSKqBDR0CvcrZHHbs7q1B54EcbEmB5NEsRuXnALGYhIsmxmXgTG
 y3dqqUDXlCQGMjQvl7g7ESjaavy7vmufmu8UmMK+RGMRg6uEgbBBW9RoVNCmJtgi/2uLHt0BAd6
 ntumCU6HyokRl7aKxPcK3NN/N5OMPnmnfaDOw/t8g2+icQ5/4jqNen5a6gg9wn3aW+BnGLaps0y
 6eJbJ+IqZ4PCAoyyRZg==
X-Proofpoint-ORIG-GUID: W_sX2-KqMCvWM9YGJdJ2pw_SME8LxNPq
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa91d86 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Zce52TE6RWQhZkoPOn4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: W_sX2-KqMCvWM9YGJdJ2pw_SME8LxNPq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150150



Le 09/08/2026 à 14:28, Gaurav Kohli a écrit :
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Add support for Qualcomm Messaging Interface (QMI) based Thermal Mitigation
> Device (TMD) cooling devices provided by remote subsystems.
> 
> On Qualcomm platforms where remote processors expose mitigation controls
> through the TMD QMI service, client drivers need support to discover the
> service, register cooling devices for available mitigation endpoints,
> and forward cooling state updates to remote subsystems.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Co-developed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Just to clarify I deeply reviewed this patch and made some changes to 
improve the code. That is the reason why there is a co-dev-b tag but not 
a r-b tag

[ ... ]
