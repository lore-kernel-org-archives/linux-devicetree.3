Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B544BD375
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983246; cv=none; b=Pe7U9bALywHcUiYuvS4EwSmAjk/CmlJpt9S+L6nVqam6BiuCbmk1N+xEGvLFhtGvRjO715cNkkdXtPLy1UUWHlaVp6qMfv17jJAGSwJ2pmLwbLe0XMPNpPCIqlP8gkrs7eliTWNn1l1PjUzuBjOb9N3o6BT574676WSzC85x6o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983246; c=relaxed/simple;
	bh=oYrFA4t31yCg674YIEYDO9F8U+mMumF/009INbF+nFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WAbMvGaVPz9of5zvwZGi8K3ZnzbUH70YJ2KNbZ28ef53fIHNmOaAA4ZYgsPAUgfJ47IgpXTQGbx3ug9vO4GGQ1f0l7US6dPpPXWuqupxPqSQgazWt9iBFxmJiWrzsNX0rpiA3SHO9KzIRlmGdEzw/++77dFsTxy/a0emAqZZyZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBzzOGDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CF9IIIGe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBzzOGDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CF9IIIGe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9sSDh2222100
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yFAm7tVViM03YaMVoiHFMLbigh11a6nI9bZ1zf2fwe0=; b=ZBzzOGDmABE+CyEF
	GDoxcNhX8BywaxXhsg328GCSXAbF3/E6MheZyHUbkhTuZO3HEW0d3KLGan9TUnFV
	4f6GNHAjaGB1BjIqHkJNmtlqm9JyNvxgXHt66TIgjvBMithL0FIGiAJczl+iqq+d
	QfHzfwNKVw9MP/RCkaEWDxD1Q4Kn4ry1rL2Dnxj1rc+EQ592yxxL7GKGg3eAjObB
	CknP5pUaRTS9MGbtO0g7zUsV3WpReQDNCwhwZQIyy99wotKK8m62caAnZbfeM5nX
	mtWYpjeTiWdtMVF7TRMgsbuGlPiXl8vABg8nu+gV5FQ2JPJLLDHFjf6McFdc9htM
	Pv1/AA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsbr76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:07:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934a8cd3a8bso59933885a.3
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983243; x=1792588043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yFAm7tVViM03YaMVoiHFMLbigh11a6nI9bZ1zf2fwe0=;
        b=CF9IIIGeyxfq6iaZJn3Tmke9RbJZkmrm/kWfAH7XVIa5WgN8YQerks+F4DR8DbScOR
         ZM5Erm+CzoN1hooG++A52z/zFR1jpXWaIIIz2qqMwLQf/eQYD2dJ5FVtRMnuZ87AZ/cn
         CdEW7ESJJfU9OK1PR7UoY84+693xeJbXnYMiCPwdUbpmw8FbkSzqyvnukvyrnbcD2NyO
         i3PUFyhOfKvmBhqNigBtBorclAd0Hg7UCY1Nvu0RAsKypGNo5UsUZeXtvuNgQ+Bc0vHF
         PVBIMzdWZJXuvRFYHGa55/SzldQi1dz0Y01GQosXJCc0FPsL2pOz7orhMAIJybLlggOV
         FIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983243; x=1792588043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFAm7tVViM03YaMVoiHFMLbigh11a6nI9bZ1zf2fwe0=;
        b=jMRhTWz/ln5pnpZBL80ddykrwZXmHD11srZpPLeBDBJ3w9jFvjleXVNGrVFUi0n6+I
         TK3yLbLVP0YkQm90wzUNMd577zhuRkPACPKIsA43BYVopzI2+I5tvNp2UTjqG61266Ck
         11ik4IM+tHSRHwd0TMqFPiBvVuPzImkp2g6Dn2fIXvVkv9vaB/6U1iUoieC6nsce9DcZ
         zQenO8lwi8bu/+7fFmUkUA3pIuH6/RpTBTLIgB7ed5nLJqeP5CJoM8L7u3qPSpcssmHW
         YArA8LfhElV+W3tLavY4e9YnJ3AcZNu2iq0lVGDidJW68vG5A/+RYDwHvh8tZF6mUzj1
         6V1w==
X-Forwarded-Encrypted: i=1; AKwUvBxIdYmPoycSLgOJD5FDNlfWN+SYXh6p2+/sZA7NCEvmXa2zRiFuOf+xdIk20IgYz9+2QRI5YQ346twf@vger.kernel.org
X-Gm-Message-State: AFq9FYI7W3UnC9+QgwqPQlWuVetTVL4Xu5FFQf3PJFdatp20LxuapcjV
	/DyaFjcCKbtEjtvlkIjGZOpJQ/HFS6KMGe9eM/AMYNdrr0ToekHfU3pbPTQEAz2DOfMZaVDQNH/
	zCWLonw3LbbUfDaN8dSWAMIelgoEBQeJPyWOrBPPfVEqIjP02ik+fGslHsqd1w4vW
X-Gm-Gg: AYBFou27ML2r+ph+4DrU0j8VrEi/UfEFyGhMpvZ3nut/Xtv6tc1zP1RBrLBeUmXNW26
	B0YtCB0wK4JFPTuI9yOTaHcwV/K96m4GzYB0x2r0CYEeaZAP73MNPhS+cWnuxdLjjnROfhQbwlW
	BUdAm8pv473GE9C31+lyYAx3yze57ZjA3+BhRdU0/CaaqKQdV8l0975vI0YNDWvVaaDKYyUH1XZ
	Yzm9HJZZUxDRR9/Va1adk0hOPtCsRCSjEnZGeoUQRTS4E4bKVJIWV4zbTdZx86h+2UreQ/+fE3+
	VMlRi/4mHGBreIyhF68pEMyAPBonpZaZWU7Jew+Dh4DcgXND7qvRh3qcUqxeujJhZIrao/eTGW4
	9kMUjNgjmWrIS4CWU1YgRTA==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr2616435685a.0.1791983241755;
        Wed, 14 Oct 2026 06:07:21 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr2616417185a.0.1791983239714;
        Wed, 14 Oct 2026 06:07:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d7cf18sm612736e87.33.2026.10.14.06.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:07:18 -0700 (PDT)
Message-ID: <7ff7a265-59ac-4ab3-af14-385fd02fc6ce@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:07:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-valve-deckard: Add initial
 support of camera sensors
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261002101748.2454305-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002101748.2454305-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX0v+G5sQPsgS8
 31C0k9fW8Dowg0554ih4rofvgFKiJ8bqFyazwH6txB0RU/6pcf2uhV3BmywZcbFLVE1tiGMMwt0
 jca7l/8x+0TxcENyuTPcS7FlcT2p6ETJqSZjovkDcz9FAK1QRwSbM4pJgKVfDmFPoaR3XUG1xvP
 TCdKsn6QcLvP7b0lHJW+Oq+UMiTs9DdQXdQWJ6skZaMpd59bFtcHGgLDIqkecOxFoLsSK4yMGB2
 pUIoWzCRljRTLSVMN4Oxs5znJKy8QZWzzPjWCFmAnGd2//e6qba8gV6UzzKsokIiQRDPqn4RxVJ
 eo7oSrkp4j3PxMuI53JhJRIJSgABulmy+Aylw96Hemf5LBqQUWgRA2NLCp0vCOh5yZdQgxg4P2m
 55bqlBU5o1Ocki1qH94vFaRmEv6kOJOQRJZXZ8SR+TP0/ri6gsLJ0fckeQ7xAR35riKEfXwhDaQ
 cwqGtOW8Hyhz1mJHXfw==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf7e8c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=F4o2vShMjHB1Vy3mdkMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX2m3OFJSZws/p
 nFhJeweqysbv8rPPZHhQeRSkB+gDl9o8umfCM1si4IP8QWrPXWrUnWqv2X73IEN8IZtS6hSomVg
 vs2tHuq253qvmuwMEyBU4NXrHK+SHxI=
X-Proofpoint-ORIG-GUID: -DtQZ9bQT4ywBE03LF-4mHHHjS_YKiIt
X-Proofpoint-GUID: -DtQZ9bQT4ywBE03LF-4mHHHjS_YKiIt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140052

On 10/2/26 12:17 PM, Vladimir Zapolskiy wrote:
> Add initial support of camera sensors on Valve "Steam Frame" device.
> 
> The change enables CAMSS and adds description of
> - a pair of OmniVision OV6211 monochrome eyetracking camera sensors,
> - a pair of OmniVision OG01A1B monochrome front camera sensors.
> 
> There is another pair of OmniVision OG0VE10 camera sensors found on
> the device, its description requires a combo mode feature support in
> the SM8650 CAMSS CSIPHY driver.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +	vreg_cam_front_left_1p2: regulator-cam-front-left-1p2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_front_left_1p2";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +
> +		gpio = <&tlmm 37 GPIO_ACTIVE_HIGH>;

GPT points out this and vreg_cam_front_right_1p2 poke the same
GPIO (but have different supplies - l2n vs l2m)

Konrad
