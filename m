Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FD33D3492
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886469; cv=none; b=TkociIJk11jiJ6iOPBzOli5lfPcFou9T9aKjRgQiRO7zS877X2ZtA5Z+8vcIh8TAGcRIMtwlf3iFCR0sIPR41XRnu4s9QfGY2FDGxbRjjsTcHlO2gsCtmrjN4tAgF+jnoRRbnrITONyYbFL6TUD6NCoDnWFgtHtBglJ3LX/Afr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886469; c=relaxed/simple;
	bh=HDR9Lb1twM5YBUBpeOyAY7TBRw+6zlrqUpHT7xMWPeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMevMr68EZWKUfuFFmbGGuhp6Rt2NXZhBh6IfJIaqyJvk925XQaotf/JAnWgeevH9y3GwdxFdvlrOjLb+URQ3kBKAk78Tv3Juq99fMxfANEM7cdWxyUQ7qAPAFUDJ2aZHA8CTVJhNRGGi0Tw1BcMdcZP5f3c0gv7LrXooVjnKoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYrOUy3D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=epYQGqKQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYrOUy3D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="epYQGqKQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8NZ1N3907376
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzMSUN4MtsJQfcIEV4XC8uK1MlOC1kFO25lFfA858j0=; b=OYrOUy3DHgJy3496
	CX5zlHuVXIuL0QhmFlwsVv3Ye9GCp95CJILsQhGe21c8vkOjxniG+eoQ7OLn9I09
	RBET2XhiFmRbnercyQtoDA8z1ElUncW4bfv3bUm3Viy77MByKBb3O6J1SzvXsZv4
	qQuKKQiVfKMUqOEXmlA8d4tO96CwRsCqP/inAPO1LdoaKeahYSyXbiAELtX/35u9
	BPN9Ih8nUIjPIFGp2wMq1ieVD4z19OueNv+4I7/eyMBKIjISgqi94Vi+HUkOSTsZ
	E475rxhu3bPEYfTKc1Juz6p8iKKCESThCeZflMX5acpAhzfu8Dh0fEioi+rHpWbR
	Zxl+Yg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqu00p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:14:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb1091fffso19467285a.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886466; x=1792491266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RzMSUN4MtsJQfcIEV4XC8uK1MlOC1kFO25lFfA858j0=;
        b=epYQGqKQD+RKHjd+162wdbW+NT1hYg7TNS35pQbvF/GcRDb6aOQbG6rh92JtFp+BDD
         X/1u76nW66wpEC00bmLLBvvwS7zOLrfHJpEvvNhhZ32aN0XRTrehrvs75r1AkhQCBB1e
         zapL43t211WGZq7jkBuE0oRqm15xsbuj9nmNE9HNnwbQZ1YCqzy7Sapof4Up0b0nj12m
         kupmtVlyCwCdATQ2ZUP/VaYQ/uisOt5mqgyti7oeAKjRZMcF62obM4qbssU/JnvqvEtE
         m9otp1LCQQ5wM5OMNQYkOuwz28FxsOCZYLStwdG6eKDIdXlElg8nv8c0x0rmvQmanU/T
         J58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886466; x=1792491266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzMSUN4MtsJQfcIEV4XC8uK1MlOC1kFO25lFfA858j0=;
        b=ch2ycp7dypEjNWnQE5GlNoMcDeAUSG/Nr21y4p2mPYd75a1syW4/9cWBdfut8EkAy5
         JgeVLFbB3LKs36kSaTCX39Y1WeiAnrDwTeaqw1oBJ7iyVh+6Pz8nJSknsFo0CCFPxQjq
         vkZ6n4YbAkiQuZPsxr9JYu9E2w4ga9H1WOCc5f92p65MQOrUztSyXZth0I9BqKakcjUO
         U0jMpStXvkJH1BsQWI0+t01UAFCu8VIOLYqpDsnNyraqWasgSPD6W+HXaORpIUJI7oYA
         +HPjLffmV/wBhB69iwXPWBTZsIf9D2aHjl4Tk0xqrSR65vb2QJiF+sPP0+/t6GeJSOP7
         xsDA==
X-Forwarded-Encrypted: i=1; AKwUvBzPm5QCwll9txBBp9Ysj3e+eJSb2wwH7gOnxe+tL6fjdTc9DrORhEgLTpGDcicgRQXaA1K62e9tmeDP@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1ZzBqHEcFUWCkMJ6xbQ5dv4Sa41uFNp3yt68hxau5FhMwn9QA
	T1vr2n2qAmrXzhOhOxKcayZTQUmI5hG+P52WOPwPfEgWNMOcqKdB4cxzjDOXBPk+qF31Ng5G25a
	L4PUflpCPHJvLxoX3edcHqPoqWvA8s3xca3LbOzPcBXC+ZvWEsDqOpMDcHW6j8pTb
X-Gm-Gg: AYBFou3+bdokSZnB0q71koW2iIbx1RJeq/LM6wm+lAg+ffMVtx0We+xKBvdJUTUsnA3
	9ZjhwQB/iZgtJUZLgc40g8tLizCcdR79Ps2/8WwqgHVGQSlS0VJwLRLxqOciNOpRccS+V2b9XsG
	2rL502ZmcqzhIRMJhO+8UE2gHy9xgNGVl9cnxkLH3nrLuuoWr4IBhpNvFk8KLVz/7NXCX5N9/kE
	XFUvWe+ziK4g7Ab1paP4XFqGLO6hKo5MeIGMimm4mlFBRv9Kia+RRu2jm5/MGry561AyTKXYs0t
	Va4Kzien6Xz/XmbR5Nh2gbchuhvJYq5unHxrg/V7vK8sQkWSH1xtC48Fr/SzN3JXBFtC5NKlAP9
	pEXuviBtOnIoHDmhJfDIOxQ==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr2285715585a.5.1791886465785;
        Tue, 13 Oct 2026 03:14:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr2285712085a.5.1791886465258;
        Tue, 13 Oct 2026 03:14:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac924dsm580202266b.70.2026.10.13.03.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:14:24 -0700 (PDT)
Message-ID: <a936a22a-0abe-48df-86f6-a67fbc20b465@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:14:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: Add PWM
 backlight
To: ferreira@se-rg.io, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20261003-medion-sprchrgd-14-backlight-v1-1-e47da56acfa2@se-rg.io>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003-medion-sprchrgd-14-backlight-v1-1-e47da56acfa2@se-rg.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfXxEnChv6c2KE+
 8qSz9AeaOaXeU0zSWQpey0sepZy+s7hyaqt82TwCkcuy55DEbUeEaz7pfK8HhFQ0eeMAgVhfoJ/
 2t+DFoPSaPyqSuFZdKg+VlIEwP4dAvweZOI6LyLaW4cK+I3CVrdbncA60XONFpILlOOuDS71ZG3
 wWQ9Pf+NabUdalLjaZuQxu+HDRFjtHdfDGmIh2IitxJiwSTFnpKUD+/B9H+qSvgMaCRkUAtkydN
 g5SvKrIgbEwO+En1ONtovH8hzThnkFDvng67E0Wuclro7bdCtiWXyYyoTKwhqSpDRMRWV8uAMx5
 hF0lkbm5AAJN0t0dNewI+miGoW1Jupi21hPMBSYzJxq+DTQe1RZDUSdywvfv0KmyOZPipu1QCq2
 YfMsCNQEpghqv0FKGMM8/OQjBZVS8DizyVcrwzaC92w7LpM2YYyA/2Wi1Gl2QMCA+wv7O3Jni3P
 vtPSHJk06VO48h8fnMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX9ZwfaEUp6DX/
 xYs1hqwA6zLHijNKgDBuIjvflF198gyKIuCxSy7tWs39R4lsC58W8zFgeTg/xXk0vEKfEkPx4Uw
 TN5G4zKLiNsUZtIoRns9VZCC9HrxEpw=
X-Proofpoint-ORIG-GUID: PxcnBOY42LhscZVqdjVbEGoYzBIOJp_T
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace0483 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=dk3OJlvReTGvn84GIeMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: PxcnBOY42LhscZVqdjVbEGoYzBIOJp_T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

On 10/3/26 2:00 PM, Sérgio Ferreira via B4 Relay wrote:
> From: Sérgio Ferreira <ferreira@se-rg.io>
> 
> The eDP panel (CSOT MNE007ZA3-2, IPS LCD) cannot have its brightness
> set over eDP AUX. With no backlight phandle on the panel, panel-edp
> falls back to the DP AUX backlight, which registers dp_aux_backlight
> with a maximum brightness of 0, so brightness control has no effect.

[...]

> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pm8550_pwm 3 500000>;
> +		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&edp_bl_pwm>;

Let's also add a pin state config for the enable GPIO (read back from
firmware is fine - I assume it'll be func=normal/power-source=1/
input-disable/output-enable)

Konrad
