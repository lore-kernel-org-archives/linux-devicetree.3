Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617897;
	b=jxdw/Js1l9Z0h2tbzhK0/FVPnHHfYY0NgQFt5+47qKjsjibMAz4sjRKymSGp3Q9TDjii
	 hFCtNhRkUGPOC7/d+f8mOV8LODiL3Qi2w0ks0iRcjV+zvDm/PCceYkxD80eyUMoyalU1d
	 8Ln4z9K4iViyHI+DhpyWfJw7Ka+yaPh0i+hPQwgp8xnqbjf79edp19VXHgfKSaZkSm+BG
	 +gkwzinqMl7VfB0gdk4ioa1w0QMfmirOwEgbt1u8Fv7ABpKsOEKAo90N+KzsfX0B8rq+y
	 pfWZZPscDzgjIqlMeIaLbai84RWMBumTLcGfc3zifoKADNsq+P/MadgMvGI9BwjUXvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XLIl6X1z8YQm2K5vGZ/P+IEtPgFQw1b2JuxAYXpLPHo=;
	b=1DRn+PGLQA+28sAdpzdsUlgQl3so2Zeh5RlsyPMkC/soqBwo2cJBPBWiGdkB6vAnnCFX
	 JwX9rbbMQAjpKSDvMv0iJgKPh/Vgtd66YL3yVFpKI5iT//D637LO57mXeFas9ERYwXqZL
	 CQs/NuFwTrS3X7n1le2+jlptQ20eU+o06awnH9nl96oa9t8zmgYkJs4XbsPiPFgNbBAxa
	 Dz6JUPqHnTnjUpY9ZG0+dFvkkRY/pERFO3mtbXCD4wYoPpnbHT8btYGdUkoBpn4Y/rmET
	 v893kmwIKVf2iwiHk1MFbVbXGKQ030XCvKwnyrVjZSDbAYYSs7sQDL77yogRCysp2og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lW4mUyFm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MaMNKK/K";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9990A606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9990A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lW4mUyFm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MaMNKK/K
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B4KJc2616160
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 11:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XLIl6X1z8YQm2K5vGZ/P+IEtPgFQw1b2JuxAYXpLPHo=; b=lW4mUyFmDfpDprXL
	1+yZwBOBnNiGFaDsQksfEh/D2SeBY6pv0/9J+i73ZRF8rm3tDDWxxE0irRtbn7Cx
	E2asNEbg5amG184AArFfyzZLsozgi5khO8fM1W51uXSn4HV2NbyOvLgCXX2fm5p3
	FYXrhWHvX0OoZQTfqNhBnkgs13GEdDeaX+/5mAqAaPgGmYpwrRqPBQRWnUvkqEdG
	7fjqKboqI4KKIlquJtOJFaW7cB48rEkyP8p7HvipPm2K5ilavU7HACcd0rPbsu0b
	ECEyGMt4xOqWRISjTAOROzgnh0QtwJzWf1RB8PqFB//q5kknqF1+wjtCRoObn3BS
	uaILDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavg0ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:11:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so49778185a.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 03:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617895; x=1794222695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLIl6X1z8YQm2K5vGZ/P+IEtPgFQw1b2JuxAYXpLPHo=;
        b=MaMNKK/KEfcAlYrf8JJs0ePuf6ZvlU9FS+gWy3hUmPVXahHZz42S1HXipqbMQxong/
         g4lTCnBWZVxAaYsC+qhmBP1Dv8whZpJ1K7eRJDuu+U2ctk7UIZZDvp5odWhyFZYQZraT
         qvzu7Uygk04V2nlAF8vGjBT06JsA0Wtu4KBowCB6e1sgGvNBflh3uxYL3PEcp8KBcBlz
         dU4P4A+z4ub2vUGmb+YssgmrHDhMNikwAoUaV4EKohZRk5fvhbDgX4A2fSac0OJfRshZ
         1cD5fJzDNQ2MS/4dB42F+4EplWd0dQn9F4Mi3sDQyFWsz0Vicxh0rtSV93979/oSc3W8
         XklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617895; x=1794222695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLIl6X1z8YQm2K5vGZ/P+IEtPgFQw1b2JuxAYXpLPHo=;
        b=U0/U9UvPEvsSrzaM1BoC7YGxOe8l3AGlKdkTgiicyiqOhhMbDMghGMmfXY63mmwgBq
         7aHbhsTW4+ySsA32vCvfPmJ/uvaw5iMaO2+wfcmrSJCQMfhW0Jaws+ueP2yaNwRPDb20
         BuFeRB3JXa2ZcC0uqroxBKKLlz7DqM0tyFg2qfV0VTaOd+e7t78gcLWDs/HCxmqN0tqC
         LEYw0OJ52/fazpNy6YT4OKmqbzD/1+7zr8Vyf7R6hggIE+7RTF+u8xCz82KFcnvnUTWZ
         dTjK4tPyHzK5r+5aU7yLxyrOOtXDAD9Jch1kFYceTpiUHEDiMEsy/+RdNIdLNYh3nC7N
         miXw==
X-Forwarded-Encrypted: i=1; AKwUvBzRT8A/2XEl+L8oVd8M6HHGgZc2+xT/UYs3bvNfgHWCewtzgB4EYA3MaXGhaMgnd3lic5TY2iVE8HW2@vger.kernel.org
X-Gm-Message-State: AFq9FYJRb+Sfxue6XQYgXB9pzCH0MQNri0u3ZH0HjVnIJD+XZdSdrlzf
	IbwCQndRxF2JL2sZWOnF0yrbtPn68aftEYr2eaiYElJXxx//F0LceyIY2u2X58ezebUCj40DArf
	uJ5ocW7JejXN26sB5+VNSHdxMH4TIMnRQEcRM0lmC2D7hlriSr4X5aGLNCUDJzvJn
X-Gm-Gg: AYBFou1OpHmNm1uD2vRoTTuTS2lwHy856XvvYQKOFebWppPm5WGBbiPhFDFp9QMPG7G
	Tc0WmQD+K72XdlQA4auKBQqQxTgu0ujQoaEHdarDhf7iHaYzSlFQjd/PkPL6O0u8XqdLu4IAU46
	nvFnFYcuzjoL8SAdL6Th5dyFwi9CTxLSosGNi14E18TBAIfKDbCtV9GN1zX3CnyLVRnRd3mGOz4
	j0folHU2KNvRIqACzeNVNISY6gYvEBNkXEWzBV7tcdoweTuAdZUmxqXu4NKszQzvmzHsbbJkCzM
	JEMvQwE46vWNh3CVTAyRILv4oBUUYj0pxQGoNG6hZGqV3+b+meiNEHOu3NuAFUx5vgDduo0y4yy
	qlvVC1QMsjSHJO6PZ1v4a1k6nsIFNwHCWhwov6hTJ4D4v17I7Xo8DuJXNUGq90AgwFDN/JTc=
X-Received: by 2002:a05:620a:8795:b0:93c:61e0:81ff with SMTP id af79cd13be357-9442155a11fmr1437722185a.1.1793617894653;
        Mon, 02 Nov 2026 03:11:34 -0800 (PST)
X-Received: by 2002:a05:620a:8795:b0:93c:61e0:81ff with SMTP id af79cd13be357-9442155a11fmr1437719885a.1.1793617894020;
        Mon, 02 Nov 2026 03:11:34 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cd291a96csm140778066b.13.2026.11.02.03.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:11:33 -0800 (PST)
Message-ID: <a9670d6d-28d1-4fa1-8562-0a23dba74336@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:11:30 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
 <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
 <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
 <c3de7659-726c-4fbe-989e-148bcd13bc49@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c3de7659-726c-4fbe-989e-148bcd13bc49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfXydjx+uDx3DFw
 1dN1GJAP8D6KTqKjyqtxyHQn1aJXMmp61oLFtwcxFH/FP//mMhzrYnNslYfe+lJviXVuTYd8J+Y
 Gv5TlTkLizVMpCWQpKB/9kenSAtLAZ4woFPPsBxXnrKQkI2/7uaMBLm0oOjBEn/rVcpDHzWk7Xc
 XfQEURGPqDaocsut9GT+mzQv+oM3VuSiu8SE+FnscTyPu4pVClrF8OKOo+7IJx48Wfe4YJDC2Wo
 y0yVXa9xb9QnmY0OD4KUN8cfc4g1I5OhdLF0RrByuB985590DZCvR2ilCOC4G4GF80o0clgbLtQ
 pTazhIFknTIbVBZSkP99jPIhFRtLOnSmblc5/rnbXY4TkV6dPc3bVXi8ge3yjrsUDT7XmlMMoa9
 BJZYCBhv6aCaL+WEgWInxFF8qNVpzDDylXgES2azOOMqjo1080G9RDjYrFZAQod7lxtefLqYBeY
 RPSLtX+2QZg2BuiU2xQ==
X-Proofpoint-GUID: LI5kYGu5yaniEY5YKxFI6U6Mvi6ucgYX
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae86fe7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=58eKMYwWEGuKRL77_XsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfXwICfvyn1bdtY
 FaQrQ8ayEBAPABe+Qhvllu9UAuhvwLHi0rpW0esJHl/aamIKtvNZ9Im2sh45llniZ/1b21+kEnl
 vZXA9erCcNzvgO6Isa5mAMJB9oy5rVs=
X-Proofpoint-ORIG-GUID: LI5kYGu5yaniEY5YKxFI6U6Mvi6ucgYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020043

On 11/2/26 12:06 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> On 10/29/2026 2:38 PM, Anvesh Jain P wrote:

[...]

>>>> +&thermal_zones {
>>>> +    ec-back-cover {
>>>> +        polling-delay = <10000>;
>>>> +        thermal-sensors = <&ec 2>;
>>>> +
>>>> +        trips {
>>>> +            trip-point0 {
>>>> +                temperature = <90000>;
>>> This is *really* hot!
>>>
>>
>> The 90°C trip value was suggested by thermal team(Manaf Meethalavalappu
>> Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>). We are open to using a
>> lower value if this is too high for the keyboard and back-cover sensors.
> 
> These sensors are intended to be controlled primarily from userspace by the thermal governor in thermald, through the powercap sysfs interface [1]. We do not plan to add cooling bindings for these thermal zones.
> 
> Based on discussions with the tuning team, we agreed on a hot-trip threshold of 90°C for these sensors.
> 
> [1] https://github.com/intel/thermal_daemon/pull/614/commits/7f3dd62353e039957e52eeb40c67ec388d543ebe

If you never reach the userspace (e.g. because you're stuck in
initfs) or if the distro doesn't ship thermald, you risk physically
harming the user by explicitly allowing the (metal) back cover to
go to 90C.

Konrad
