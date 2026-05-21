Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72DB34D90D
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353849; cv=none; b=nhvMWfAobsTHExIc98uZzG4MPkAv+XCEeNDDXFwbVuWJ0IcX2T8hvT2EM53tiWPAdKqTRpUTLec2hF1FaNCwZeU7KKA7dxdhfKBaSSDbyIMkixbpCt3VhVZfe+5Y69zLek0aC7pICNN9XhKb45J/uBZ/Z8BjW8cLEoXEMibJ0zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353849; c=relaxed/simple;
	bh=eaVvj1dPJSfSZ0x8CWyjinLutqp36HpNs5/aY/I5530=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hi4Wr6pt3gxWRzDU1Igvw29JKLue5gpCtXFF2pJbAdpZUn4XXaJPLCyTkidGpfPi0Z4h1AFQt79sTErk6Cjz3QVrTxmA9cyiWEG9Qcq8TBzXar0oe+PGDdgDHlKuHgQ6PWE+ZaRar6i+CDKhfCLUuYgJuQGXlqAnOfskwpDyBxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ptVDuDGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkSxANUB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ptVDuDGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VkSxANUB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6LpvU2158094
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8FjEMX7Xg61uERfYxrB9paEF59vrppq67TlyjKhGpss=; b=ptVDuDGbznTcuPWN
	0Dnwp89uTPhkRd8CDzvkQ/MosxKpjwf/aG279ydRDDs96TNTWfiVeJRuCYfaN29P
	uHquFiqHAGan+u6AgS08+cYCD/YZP574kjHaiJVMqggcLUI9csXnBceEABvfIqYU
	VEGtGa000E6NzUwtlabartw1ZlPBywwijO6RazC/TnppKpZHVfhH9FpkKs3hspkr
	xJLbJmI+9JsYMEV0/n0ImIRybUivlpP8Cv19KUko2P/oV4DPyYzhdRvPW1EaFkV+
	QVkjYR3TLPKW9+W5cko1C8MbQqloKix+ucmouuQlWY/iwjiaZB7LTnYOtP1tUipY
	pfsGCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma42br4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:57:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91345d517bdso123423585a.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353847; x=1779958647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8FjEMX7Xg61uERfYxrB9paEF59vrppq67TlyjKhGpss=;
        b=VkSxANUB96iDoq2JPKEqKjvLOMU8MAas7Iuz87j0KU7sjFlXEIfCmx/qei4Ouh+cCf
         AcLupLPsQb6fUVv//G5VgjVdow5msZafM2RQsL7uSlUP0ItgitmIZNNG70gGZNcRVbds
         vNEQSsEOiG8sLbxK11KTGws9jfUNk/ptj02uJIbrYSeOyFMXUE0onxc4agb1Vw/V0JS4
         bAqMypQVdNoB0spT12PVe1sD0K9QAXL5MWrK9agJKyv2KqYnYeUD7X9nJR6Gzxq7z9bp
         b41XdTeQsCmK/ZI1lhkNYXd0w0xv85kr2is5cSCZU5ErlftEyrLTYZMfBXFqX1Tu0MGB
         oTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353847; x=1779958647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FjEMX7Xg61uERfYxrB9paEF59vrppq67TlyjKhGpss=;
        b=Mk3tVah8JB+bnR41whovYOjFiqoz07JLjootdbK/xGGv2FwcINalPJluryFjVvNL+d
         nExzicvDoI4hGj4kORkeXlmZMte46IxoYNPOHWCxWqYwOG1fK49MkpQfaVnnhWpInknL
         spOAim64eFliOmC+9SPxnThyRHmJpIl9WjtACIzhEv8Vy1LaH6Z8EqH5d01jTTiBjpwb
         fQ0IlFsVcDXr5VI8HA6y1nivK7N3XPU0E5WDqfNlHdcYyYqpkQYRE74aylzKzEoBQVhc
         nW1VWYrqcm3ZzmseH4kt0x1EOdQFN6Vy5YVD1AUN08Vjfrh+v4Ed8/sQJ2pH9v5GdXBg
         wlWA==
X-Forwarded-Encrypted: i=1; AFNElJ+Ib/t8LHnnhFtvBBLUax2jkwhGEiMH93ml+anVwtsjkAg7glSxHBQzSNTI0DUPqjyMNB+uCMHi7IRz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+LNKxlsUG4S6Y3GDQJVncu9iGq2yHIYv8VH1r8KIuuYalmbz8
	nvDhzlE/3fU16Qp09KmreL+zSsUQd13Hx/x8bwkI5R0vjdRV55qlJV7wUti4Cz5CiN+1YrUlNDK
	bDa2M/ZjZQrWjL4iLoHnEtSs9n0RybE6YpFJEWaQ0SzInI2Te3F9iQ0Xuhp3U8zWI
X-Gm-Gg: Acq92OEt0QnVxX/4nLWOSA2EqwcM2EOrlRJwWJWGoLFPZI0w/vRDxvRxkAI5YTTpp3G
	by6ilcNPzasuodCyMa7HsK0H/4cl/AKUn4LSa65f2q5fM4JfpPO29bToSqJOe3i4d0FP8U3hPed
	/K12Ow3JH9P3tRhMva2roSTbWZ4z7YCeKu8M5v3xbFCgDsDQ0KifjquN6kbn7tt1Qn7SjdWYcix
	xVB2DD+EXRMol59bchfwxABZS1DQnm8+TphIpVIa76UBzhItWVb44mEcjlUWlgHobPuHyf5g4wX
	WVhIsq4X7DEt8pcvMHFMr2StdDsbxgAlYJxV5dDR+dhsqkiM1QUP6BpeArN40IZHVWqNxUJqDcD
	3Lti1ExmubZoeUigYxO6SLiiGWWwLpyrpUPOfqT2inZP77HPGkKi3lMeVrEdRfaRYTPR4LgwV40
	ohzOE=
X-Received: by 2002:a05:620a:4456:b0:8ee:e440:fae2 with SMTP id af79cd13be357-914a2cee72dmr157594485a.5.1779353847107;
        Thu, 21 May 2026 01:57:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4456:b0:8ee:e440:fae2 with SMTP id af79cd13be357-914a2cee72dmr157592885a.5.1779353846676;
        Thu, 21 May 2026 01:57:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e8e5sm9082419a12.4.2026.05.21.01.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:57:25 -0700 (PDT)
Message-ID: <890213e2-8e9f-42c6-a59d-77ba2049e979@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:57:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sc8280xp-arcata: Switch to uefi
 rtc offset
To: jerome.debretagne@gmail.com, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, Johan Hovold <johan@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-10-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-10-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0ec8f8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S3QPRrZGCkirkA1mjOoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: g_CH6uJNl2gxrjT84-0NYJMpgThznHm6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NyBTYWx0ZWRfX3kgv02JuKDZy
 3/pVTjMxaqnZYllLQp13FH53jR4mUq8sWlBzDqONPOPWlqoMXw9sgn0pMMzOJteIGtMTeR3rM6N
 GQJwcZghNyp6WCaxkBoZwMWG46pDZ19kZAQ24PwzQIYmtj/Kg4p3HqxZIQsdSvTDKUvVsf20wnO
 hAQyGEs4ZRdm9Wg8E6UwvQOl2hyvqMQdWJslxXlUwu9YYJNSnAMR5+cwL/2tBYBlRF4qHKU17vz
 kphhjrm/GGNT7EhDmUQKQ8fG54Tv02In8Xy7EObH+S48DmskWDc8T1RAroeKqzWu09qVQs/R+rd
 tTqJN188pSB5Ovjz4khwRdCrYvgL+xbVUELigx4giT4/gHOVB2iNE+ha87YlhjLy8kCPwyPlWlH
 L6xd+liBYQSTZ+LncRPRZ9E/ykY15nLaZ8yMGioQnfk6dDlBpVipw/ILS4Eh6px8s3CvunOMdBe
 OJz4D3DnFH2ROj9cN1Q==
X-Proofpoint-ORIG-GUID: g_CH6uJNl2gxrjT84-0NYJMpgThznHm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210087

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Align with the reference implementation from the ThinkPad X13s:
> 
> Switch to using the Qualcomm specific UEFI variable that is used by the
> UEFI firmware (and Windows) to store the RTC offset.
> 
> Use the new 'qcom,uefi-rtc-info' property to indicate that the offset is
> stored in a UEFI variable so that the OS can determine whether to wait
> for it to become available.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
