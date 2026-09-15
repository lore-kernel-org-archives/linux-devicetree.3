Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A93E3BED7A
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479684; cv=none; b=TE3hJWooDozyEK5JLvkd0EcmXVSrtinghABpCF5KdvpZFb5DELs151lI0cl5f3VdBXT9NY/7D9efrXVOjVqSMPLjO51jtsbSTvFDTEmAXZhLyZupgEgPcTN312+nvBTBC2Cf5eiH2KoCAKS/FHdNrLIdbWPFGwWjsiCw8G7XOaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479684; c=relaxed/simple;
	bh=anLvhaP8qxf0U+DKfnxqiPwSUSauJqWFgMwcq/4F6jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLV54PLRYLkLwCL1eUPiALsH5G4HYEDqba1aUb+2LSIpuFd51zxsBa4bYkLUQ0hPa+dcvmaWhV6zA13QEEQyOWlM4bjZw2XMt0kcyTnlPRT0ljUd0eMiFI/90vOt7VXypcBTxTMERNVJCD+ZWB1tq03bWEn8LPP+eIBv4hZzjbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YC/yFeUW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfiatNEE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YC/yFeUW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfiatNEE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FCxt7B3862662
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a9Ma2vHXggOVE6yEStb2WHtpUhRSkVE4YG7P0qkunmU=; b=YC/yFeUWbUk/TQZU
	/oZYDsbQHFGbZhbRXb0F6pRvynNxaCk1uZOlStF7LF1WlfqBewv9giMR/oA5YL8X
	utnLaOERlRjEwIaOLTOwceQVbZL/2B204PB7r0lMqm3SsnyIPgGhCTbFpBjHDaYb
	V7RPMgdmQnksh92eWK0CL+YPIdgRzMorgf43/9J2EXQalXRT462lRrVWMV+XRmDU
	TGw9uVD7lm4GKnBpyIUuWrLGndS68OQBjsD9CirRCy7e3hXt7l4+S7jH4/VV/CEy
	Hu5rqcRJ4c1/E5vm7s2UrW2bNl7aeTHMZIHSSdPToVR1L/eTF74vLO8Q4eYm0c0H
	G2DlLQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc1ab3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:41:22 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82f879767so5478458e0c.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789479682; x=1790084482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9Ma2vHXggOVE6yEStb2WHtpUhRSkVE4YG7P0qkunmU=;
        b=VfiatNEEkccTyu9K9C/2ws2svXtShdvMEvLtFKBXfJmVe/k8Uq/0YBhXwSlH4ICUSM
         TedlXo0iTQhaayayxyDDKFTqlm+ZGwPytUYUUmFE4tieln6wK/0tXD5aI1g7Cwei6wN8
         oREzbaFzwG53ikczsJmaxVufhJYdlqNpoqXhRZ1cT+lGasWuFiwH6HxYjcONqdbhiPwN
         ImaWy2NriF0rSA/zp+MOG3cdWxuWZXL5NLpi7oFdl4AVGjd1soCst5Av0uDSA4qg4Yp0
         oMYvebhphoDFBey6cAjwD0Xr3YbUq6CvZD/1x81B3Xw2Wrt6xfKm/GbElgLezosoqG7D
         8uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479682; x=1790084482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9Ma2vHXggOVE6yEStb2WHtpUhRSkVE4YG7P0qkunmU=;
        b=te6K2sMCOT76qXXDfUKLpVJOqFCdupAfooZvgzr783VqPLOgOSiZBTchIkxVdw6pEr
         h7J5Og7KDfbGn/6nIf41zxpY80GoENNWk49Pna7MnkcxcE+Ncm+kXor/Mduhu4auWOOG
         iyoIHbYtdWJX7G7ff4HWWAMGbMR/DBd9y2kZVd3xCw6fBwUg4FMthauDYkV8ft7ZArMi
         sddagWI0DYaIlaX7tc1ZBWnYg27E/V8Pyj0MJ+D9MLfd4XHxlGN3yGB/2MruqQR21t8C
         BRm7cFS3//0b2lrMYRPNa+495Vj3HZRJHRO1/RUvPfBqZJIASTPygte6RkEORGDm7989
         0Z0A==
X-Forwarded-Encrypted: i=1; AKwUvByFZAEauqXw7HKEcrI6XGO5/xBwW5yhR6bSkY6HhQWpdJQvZfBN+7d2U4H8UcWTonUWvDbQbbgnoiE+@vger.kernel.org
X-Gm-Message-State: AFuF++kR2d9ZLPRIYP52pi7NESomEUzUhbt5NYyE3c57XeTl45mrieVE
	0eN0pifIKsFpfstmd77mpX2m43vM5M4lV69loYLA8zOQyfcx1KmqKfYVYZFq2O9K85n8clXSn/L
	61LJ6i7jOc/W6xl0taBewwB0mbdZJeUsgHkqL1C2QWvqNYAXVgb7cK1LwkG5a6WTA
X-Gm-Gg: AYBFou1zEaw+DoaMRFTTi6Rc+dyDj2bQ0GOFE2BjlVr6XbONiWXUDRgpM4OIhh1qIIp
	JV1QF2x78Qc8yASXnOp8ETC9DEOBF9H44V2mJknmIWa/tfW6eRqQsQrrW9QjRiogDeyP0BSAd9p
	E48BTIPjy2ZMFKm2EMQd4BFmPKCSVM+Zpzf8yqxVahda6/wBB7zoemEZF5bBFg5SwW9WejGg+6W
	9DZySPhq2LM6rzDOZOz4DBYA8G1cnRfYRePmPEblwZkC9EK6eWA28RWKG0FuocT2v1UC1ulsvIi
	Bqb4dS1GVd2dlKuP3UiWQ0paESXjppDykVB0R5T8/Ha/I4XZ4IUxfr7wLa4NNZE1kfU2kqsJgzy
	BPETZb2lrMAG071Wv1PY0FieEnGs=
X-Received: by 2002:a05:6122:da2:b0:5c9:7a56:10ed with SMTP id 71dfb90a1353d-5c993b59a15mr1424265e0c.8.1789479681818;
        Tue, 15 Sep 2026 06:41:21 -0700 (PDT)
X-Received: by 2002:a05:6122:da2:b0:5c9:7a56:10ed with SMTP id 71dfb90a1353d-5c993b59a15mr1424146e0c.8.1789479681335;
        Tue, 15 Sep 2026 06:41:21 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm36821121f8f.7.2026.09.15.06.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:41:20 -0700 (PDT)
Message-ID: <9c09c1f5-cffc-421a-96df-753b294d63cd@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:41:19 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen
 7 (Mahua)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, abel.vesa@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-2-srinivas.kandagatla@oss.qualcomm.com>
 <20260915-nimble-wakeful-stingray-5beaed@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260915-nimble-wakeful-stingray-5beaed@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cboNBdDl3PLav3WkKz-89VDXWKvkiyaQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5OCBTYWx0ZWRfX2AN+D4pTyM8F
 5Fvy3vrz30pDfSo7yww0Ed1x5LZfkVrleR5YTqPGRwq/T/jl5kD4K3Ts2uoEgEFFl5cg6qmv0D8
 qsekEM5ZR56wC2mbc/xirn6DJujQgHc=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa94b02 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=YQ8b7Xp_7Ef0BCHzhWkA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5OCBTYWx0ZWRfXyQsBeaLuIDSc
 sGihmllQc7I/2dXDutGyoLXRyHosT1jM/ZYnG+zHlLOVlaDEmYYngg1lVTOIQ/smeY5cZJhYux/
 0pA/aXISvfUAsLXQm9oa9aHrtfK2JM9KzuWErXM33En2PsNvW5IyO+WU0pFnuCV550zbnZkuvLS
 UQ2L3Cquu46+Edv4dVLruv6xuwrMcI/IsG3YzBxEGRb9SoDmxXF6e/fwzx6TZFaNchEgscbxxkO
 Dh6EffTXAEeGnSTQyKKKMR+mzN4jh3vTpjGNhpWeJaBVF0IxafxAOLtgwMdFzT39suIAnayk/Ip
 c+NENuuKaxB+oU0iJY2KBSkf7ZdJKqtinYlovv4kuGnnWzi+bRjXemdm2m8E40vBoLobEk5+gSc
 yZfktUlWpDVLUhRCLPeQBKSzULN9MToeG6tZkGHJeGyRf195rswHrvra4cwCNwDG/B6Fijeqc7a
 cmaKDcAhJcgdS9eT3Fg==
X-Proofpoint-GUID: cboNBdDl3PLav3WkKz-89VDXWKvkiyaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150198

On 9/15/26 11:47 AM, Krzysztof Kozlowski wrote:
> On Sun, Sep 13, 2026 at 09:18:32PM +0100, Srinivas Kandagatla wrote:
>> Add lenovo,thinkpad-t14s-gen7 as a board compatible under qcom,mahua.
>> The T14s Gen 7 uses the Mahua SoC (a 12-core variant of Glymur with
>> cluster2 / cpu12-cpu17 fused off) rather than Glymur proper, matching
>> what the platform's ACPI MADT dump reports (12 enabled + 6 disabled
>> processors).
> 
> There is variant with X2E and X2P processors, and on top of that touch
> and non-touch display. The first will be differentiated by SoC
> compatible but don't you need compatibles for the last part - display?

I only have the LCD variant in front of me
We could follow the Gen 6 T14s pattern (which already has the LCD/OLED
split upstream) and two variant SoCs for v2:
how about something like this?

  - items:
      - enum:
          - lenovo,thinkpad-t14s-gen7-lcd
          - lenovo,thinkpad-t14s-gen7-oled
      - const: lenovo,thinkpad-t14s-gen7
      - const: qcom,mahua
      - const: qcom,<X2P SOCNAME>


--srini

> 
> Best regards,
> Krzysztof
> 

