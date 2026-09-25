Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1E149CF39
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340917; cv=none; b=Y5lCPaMAeNgGuQo0dewd/Vl9AsMqKwZpr71YGVBFcz7yy+4poePyljH97gWOqmCWaC89RrtEhgY5hqvxPMie0qliYuriTojnHE3fOQ5A+hWXrsOnTFmTIn/L5x61XbWqb9wHyPIQDBN2rRcW0xCtfTSxYexYBbX8oiHyDzstPI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340917; c=relaxed/simple;
	bh=hzENYz/UqfOSop+isXFbN19wcN2RSXEA/Jd9F6x3uPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSeoePUf16dd+TjB/wN4eZ2BxVKknRMpnCYsmdvGAknNFhpPrABvEIbacpbiLat9/1mKIXxZTpvkc8Ru3VxqEDW41CKgQbd235DxccEQOdp3MDOwe/xXme1tp/8lWvncf2ZEljlUeymGCDMZhUdtdOvxrjWST8yw96wsOcP0Nbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYbhxFda; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D11LTpXU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYbhxFda";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D11LTpXU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YpiF208828
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EaqTjsuyaFdV0Hwl06FqGOg3GeCVfMcjUqvq07conHM=; b=lYbhxFdaRzaMuWV3
	89pwf4dVTojsJNLr+OLGSUFhgScSt44/yNhsVK8NI2LaYvdPj/g7DTE+XBw1pnoX
	q0Kzz59JON+czU2yCISEdcn/8RDKJwPmSqokKqx2YaB+iAVPsfSifnOo/AfqiEI1
	YDTbZiRbwuAa5QdsbymzuK7xqgl7225hbcKsKyGOpwOxblDQCpA2if87qSb1OLOf
	YSTN7rIFgB4ve+7wEE9GjDNGWo7CNhoV0NfXlNqx40f7QptQs3KdCgkK9pfekacf
	SFc2yijSJ1O/ItAAa9ZVDgH6V4Or43dncDC8SRuj6lUHESyC9xiZBq/waFKbqa/5
	vOaPJQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898uhj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:55:14 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-77969cb40dcso12572137.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 05:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790340913; x=1790945713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EaqTjsuyaFdV0Hwl06FqGOg3GeCVfMcjUqvq07conHM=;
        b=D11LTpXUw5oKAfA+mPZ9/z1m7eWLjyV9KiqHOI0T08ToQxT5NlMdbFCnwJb4YI7XBJ
         u5MuY5AFkJ57m0oQC/tdJ7IMX7o78/wrNuu4QN097zh3XKmJeXgXOpH1x1TsH04lEaab
         M4goLQ+W2Ix+BIoJscF++x7jwo1aeUYeSRzGOzZAnuYARJyQ09rLHIST/aLGbNUdPQA5
         OdURFgrWfqmVFHdXztOG2PpLyw104T2epVXbPod4aK/SwiTTKo0pyTygoUuqvb/tladT
         zwlj4IVv+l9RE2IK96qn1GlU09a4NnPwFtrwmshY9Fd4R6V0YWLJ/uNFx0WKlAzJ6cks
         3ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340913; x=1790945713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaqTjsuyaFdV0Hwl06FqGOg3GeCVfMcjUqvq07conHM=;
        b=Dr9poC8rpGFpKFR0DXpHZcRYG6wAcwnvFE2Fm++HN5yFi9Ye0Xu9TkKo0xcjWTWJpO
         GdA608ys4v1spqgsW6s3IObPYkgAfj+r8q/e99nKRNH+QwI6YCgcpMWfCJY8mRb9V2j7
         ifBgdDJvaWFJ7b6m3svoGnMVQ+i94wtCDQXDdMRpip7Diw/dq4YcBRNhqJHBCVK0JEXQ
         LQugpQYpZQhvaO/ZVYIh6SPOPmOfafb92S3cf3LD6eFBvyOGgwO+Fsum8OG9w7jeA6Kq
         rM+4rFzzU8GWwDy4tf2188fy7q3w3gK88hrmNw3UzeyN3xT//HSyajjdfvT1c7oIkRJc
         Ydbw==
X-Forwarded-Encrypted: i=1; AKwUvByMUdOZ4vsvZw2EopQm3jCIMUVpAshQ7CyChM4XmHb+M8FF3mrFMc33cqVIgzE9x783kS8wo1A8MRvu@vger.kernel.org
X-Gm-Message-State: AFuF++nl1C+8/xS5wRQfZvwiY7n53WApkl062Hs+lfVcQauh2pFfqTW0
	fpLLJc4jzLhmHw7R8HYnFoe/wGRpczK9coVH0cHrAVqmiwZpQxsNe7max2hcRufJxf/pGoAaiM6
	vkZ1b7zvGlIDM7niK+fM+M53wPBwVjbt1W2+/aOmVaqooDn8fGRUdcBLm/xKi21RV
X-Gm-Gg: AYBFou1Zg+eh9yZTeCZXDQchlrHJ8j4TvCnuJPkAewJEjDdMJ95PTN55UBo/QKET3Jd
	XCfgqI10KwkKIxiXFhf/b66HPcGO5/DjYYe1J9FjFsjNPtww+72CGhGWhndTM+ms8ftyDygJkWb
	LIHzel2Mfzd3yOs1rlc0DYrDGNBAebpDDRAEtWYyoDkq97UuG539y6Aafghgr5oLG0vaF5HRbe1
	oNzuCNpPxkUExFUkaocPa2J/Sq+DGIATrRYVlxhJkQnGcYD6uoM0fxiK2u5Y566ogUDg+KVrfj+
	u+rzq4Zmb31SeyH8fJWZYwfaQ2tNFe+tyZuTXa+IvgQjoMf/2R/55gY3Fh8CRb8e4WtwgWnYQLY
	wNsIaBpy0U7SJ6XC8EQnqTg==
X-Received: by 2002:a05:6102:5cca:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-7b07268e85emr792789137.0.1790340913053;
        Fri, 25 Sep 2026 05:55:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5cca:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-7b07268e85emr792774137.0.1790340912582;
        Fri, 25 Sep 2026 05:55:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7800418sm111442166b.51.2026.09.25.05.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:55:11 -0700 (PDT)
Message-ID: <6b0ef83d-395f-4761-8c2c-67851a8fcc4b@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:55:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: nord: Add the USB controller
 nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
 <20260922-nord-usb-dwc-dts-v2-1-ba2b39f1a843@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-1-ba2b39f1a843@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfX8YdGsm7VIVo4
 kM0d2vkvS9w8m/86KAL5C4Gqk1sa7FOVf3IyC9gc5I09XL4+FmeWZ6COGsJsGjfonfrq2bEO7b2
 IKN3vX2Y5Y9NzOucERt5DT+hK8LaQ0+zg52OnTtev0ahmX6gFUYU6R+1eIpMTT9ViZi3425Vvab
 wqg8ZHKwRRg/4pCWPXVx3YXlcabG9wmY6c5h8BIwkYaoL/ik+EvUJYB5Pznd5EJEwBQ6ggMCZ5R
 VFHIvMwX9Rc58+ISPxkIoR6+mMEINfefP/i+yO+y3gp+lGz7c8E9CfvGYjEFXPQM6zEfR6cqAjT
 OXRP6YyQaDRnX7ESkdqqMsrbrAv2Su8IeI7k0KsJ5NPeqZtJRX+59zHN7I+p2jNPv1Hd0sqVZe+
 P6lqEjYQSYa8/zrDAOredLEAEciHMtctKs26J1Ub5K7ka7yJNr1+qojxdBrw7ZbGu3uTeiRY4h6
 ibKh9pZ2xP/cvclS/HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfX9fioao5lDTki
 KoJ2zfYM9Vgdhl6T8NvAGl5gXdZybp9zQZtigxGmoEWPY10XY90jP2V97y//JjE+DOONK/DVcjc
 Sw/pYoKG8zLVyMqHZOQZ3yokpwn3+oo=
X-Proofpoint-GUID: hBqwNHjxnmdnPzsh_BhmOt-sVTQwKELx
X-Proofpoint-ORIG-GUID: hBqwNHjxnmdnPzsh_BhmOt-sVTQwKELx
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab66f32 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tsQs-Y88EExeHG6vkYsA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250051

On 9/22/26 5:01 PM, Bartosz Golaszewski wrote:
> Add the base nodes for the three DWC3 USB controllers. These carry only
> the SoC-invariant properties and are disabled by default. The extension
> for the embedded Nord variant and relevant board files will add the
> platform resources and enable them.
> 
> USB_2 has no SuperSpeed PHY and no 'ss_phy_irq' on this SoC, so it is
> capped to high-speed and told to use UTMI as its pipe clock.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
