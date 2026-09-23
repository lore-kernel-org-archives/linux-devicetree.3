Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B2A47798A
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157881; cv=none; b=j+ReZSIPxc0zy4VfZiPlogQfXcKkC7DFbJ5j+gLKiEy1sCm55LMaP5jKfEWGZm0WS3LYI88NcC3+09LN7FH9XNtUCCkYgQ4VNdveo5oQrFe2k4ayZCD7AmBXg8dBcBSJwtoF/FjeQQga3tZb9NU9sSoQpR3BkokwpvjQvQ0PMFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157881; c=relaxed/simple;
	bh=FcAC2kL5ib53ysCba7eguY2e0KmUYIG4Q4SdHWnMupc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJImjjX1OZhTywzrYPGZsuVoZuutU96aEbXRgRNHJtzqSLpPWkMEIavg5CamZOubesPfMpSA6qgh/IQ9c/DMuSO6r4rmAqkPiIEXl4C2YjXA6ws6fs5+84r+kf0YIuDUr/HAe7OCkAbNDIYtQkWdJPBF3eriVS7y0TQV3WanMf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSPNKGEi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BP5uNvXM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSPNKGEi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BP5uNvXM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2oSv3087405
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KIcAJjWyVPWk87cq5e+oRvWxXeEjdLFGt91qD/yNc5w=; b=YSPNKGEiQizfoukY
	R2LU2Ai+RmE3DNItr0XCdVGKUL3jv6CXJKcn+1Qk6OY3BM/MXdTBBiRfJTWIEXUO
	xayVR1qrISBnzNlANEMqG164nCrAnLFL/ebbdnAbiTJuWOPE/UzWQDO4sucIlOZn
	/XN6QhQcvMwW0jZEP1+IS/SkYrOEZ4ZiA/WFSF/LuPwrjo3JKp4Lemto9kbFpd41
	Vm5CN8Njq0BhcbS8tW+GaVWQzeLxycQ5n7qtM7tfJCAU0rVDrffQ3HPoqsxth85X
	kxGRE40s9UHSwXMgu7q7ZqbI+v9cJpUEGjX36Q3PzMs35RC8aj0HGX54SJgONMzr
	eFNhmQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm87qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:04:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530e0def61aso2197041cf.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790157876; x=1790762676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIcAJjWyVPWk87cq5e+oRvWxXeEjdLFGt91qD/yNc5w=;
        b=BP5uNvXMYpEKSD3oNHgNlBBMcpP2ChCh5lVHh++f5cVeLWNTS8nY8mlKcEod7cbxfd
         qi4TownxJQjWIGNavfGg8a+mqJg1NMmhKVESP9EuhWZTwWu46EWcJBiDzju4PsPpntbH
         /GwyzsvTzFbkcAsdZNuqfOZJ/2uxxlMRO4rVFWm0pa0bTzvSPRkFlFQVf+rYsOXnx2Z4
         AVDveQmi8ttixAcv8O4cewXJd8UVuYWBQtppOQPvkkFPjFDI+VPMH1i3jK1/ov4zKrjP
         v5KLwZlfSIlEsrKFRqtBB51IOfXuDwTaQRXc0eG5/8k9mhOQEwL4ArFCUttCLCRcRa3B
         oasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790157876; x=1790762676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIcAJjWyVPWk87cq5e+oRvWxXeEjdLFGt91qD/yNc5w=;
        b=ckytjo5l6mXSwied9dZ8IaLQ8dEJZoXOKoyr36gk9UHszsOGd3e1BprR7NwNBMWaWD
         C/Tje6j9Y/LTfbT++Qhi+JF72vJcR+OnaaL9vX4ctMAeAycSkFtHHRvkPg/kYba+whGL
         9gDHnoTLDNEzuDIv6qd4WO9n3A5tgHzg7aoZfOoJsHIeLcpB+pzd/tM54QFR3zHObC9S
         9zwNcth2H8XBJY40Lnj+XkKW0Jg8LfWVRn84bUWn9OyRfgv6r438638TJKJGLb+hkmIZ
         fqoaOIcZZ4FXoiidC5I/1G4GMWOxPqQbKMad3GkFZq24AV1dTT62XPqbyr1n/Q6vDvco
         ZYOw==
X-Forwarded-Encrypted: i=1; AKwUvBzOB/WT4qKmnZZ8htH3ZvY4xMV1Fg9ulZWsK0WV+Hrbumh9hjJfz0Yu4AsdURapvpYZmLYIaZvUqXZ9@vger.kernel.org
X-Gm-Message-State: AFuF++naN7gCo87RvZFaTb6mH+IGXp5GXfCunr+8QOCfMdGbIDmNrxDO
	pHF6T4W+wuqTMwLcbFdzc3h7axxX4E7GYeFWGhFF8vk8RmuqfWjvtv90P5hAch2IwnNQYjKeihv
	mUAV6sv6jSYfEd9W1TACeK6G3qsCw3274NqMx58+8aaWNrMZogWaiBKcuE/Hb0qdJ
X-Gm-Gg: AYBFou2qjHcj0oaR1vPeilmTHoQ2bY9v4HBPmA9Ud3Ap31mHK0cDIoQL0/nthwxE4Z7
	bVRuPIoODKVXV9kjdn5XdhESo9N00vmlNPT0ScAZ/E/yRz6REYeui3O/FL9n7J8M+Xg77EXlwiD
	cZqdcjzL6M4V3FiASposvbPsbaPS+lHl/kyL4htQZulFlL77VWD+dLzDKIpv0c0uW6Dj4uZZwgP
	ZTIKMrKkpMvNXYDTAjxgi5t9Naze1pqERr24zu6iyjzZfbbQ5ofwlc/GqiDdnBmM2//t75ob0R7
	AysQhO9dsSGC30ZEm4oSKvs4bPZoZVx2OgB/dUg3rXQvBiPtx9gX3oS+ptT00QPM4EqWK1oIJ+E
	GsafbU7HTzKf4XyD/Aw0UJA==
X-Received: by 2002:a05:6214:8624:b0:912:3334:f40e with SMTP id 6a1803df08f44-9140c50a449mr27443076d6.3.1790157876176;
        Wed, 23 Sep 2026 03:04:36 -0700 (PDT)
X-Received: by 2002:a05:6214:8624:b0:912:3334:f40e with SMTP id 6a1803df08f44-9140c50a449mr27442796d6.3.1790157875672;
        Wed, 23 Sep 2026 03:04:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae33fd11sm84954966b.7.2026.09.23.03.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:04:34 -0700 (PDT)
Message-ID: <8c9777c5-f323-406d-a996-17bd1a5b8946@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:04:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded
 Controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
 <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
 <uv52rxc6llmlas45mejbeeriryiozh3v2f2itbvfzo4f2sgazm@ly37763jkftd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <uv52rxc6llmlas45mejbeeriryiozh3v2f2itbvfzo4f2sgazm@ly37763jkftd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfXyR1EWzkvud2c
 vbqV51YxOEkWrqfMUPTkyKBnliolqUank9KgiVSOt+LEnDMFFlwTexbvqF/wrKo1sm3cnX1q3ZL
 90WwctEC1tPckTergdebcED7lyOUwoA=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3a435 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SILNe5Qj54eFSe9Pf8QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: vz-_Ov87lK7ITcRo0fTM7BHFkZPwVNUR
X-Proofpoint-ORIG-GUID: vz-_Ov87lK7ITcRo0fTM7BHFkZPwVNUR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfXwq45HKzOHme8
 g4k1ksaXTWH4irli/wYkLSuk1e3qtGjjgjqV0dvIhqJ1cANF1rA1Wbz4433kyuXXFwhCL93seND
 OcLA21kHQaivuSmNl1vAsUBXM/DA0FBfrU7yBHwGdDrWof2Qf5/7nK83d23YhXo3z4hVJW0A3IR
 BLExybYCNLEpPQmzkhkHAZg3at0kcqL31YbG/LflIXR7SFVfUNl6HUvTwEZGGKSSAL39n2HYVPy
 iOFrigQb2CLmndiNdvLigzjpYo3CTgNZ31ziRKRsZZfmIBA5N4pj2We/4z0PQG9Nj+4ItHDOkaB
 LkQOtsFKH+sYJpbLArAq6SvcyU4no0QcX9lobOZVipuzHGx2dKE4bTsPMWPVnKAP/HAM8OloOV4
 Nm2b/ii138kK9Vydk54pm60bljOzXKLz0YbQ3icAnnYyrjhP7gIlkGTCm1x04wkMk6gGLtmBnBa
 DBkaJ7U4R6EwcIl0eqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230040

On 9/22/26 10:31 PM, Abel Vesa wrote:
> On 26-09-22 11:33:38, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Glymur-based Zenbook A16 features an Embedded Controller running
>> custom ASUS firmware (which is loosely based on the reference Qualcomm
>> Hamoa EC one with a lot of modifications). It provides keyboard
>> backlight control, additional temperature sensor readouts, fan speed
>> monitoring and a number of miscellaneous functions.
>>
>> Describe it.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
>> index 40433dc2d6cf..d3356fcd25f0 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
>> @@ -670,8 +670,19 @@ &i2c9 {
>>  
>>  	status = "okay";
>>  
>> -	/* EC subdevice @ 0x5b */
> 
> So what is on this address then ?

The driver spawns a secondary i2c device there to service some
of the EC communication

Konrad
