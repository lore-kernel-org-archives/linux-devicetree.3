Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B0945D92E
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 16:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403234; cv=none; b=PumzJ1TxcvgIvmTm7dJKodgVw/80mEclzA6bCVIh8jB07BX5NxQwtIRmgpA0H2D6ADcBuU07yVI94dPlBA8mmMJXchrAK7G7gIaXYDCX2u+6zfHWD0hldfd+HqLZfg54nksgJPkAPuF5uAngAVyaKqKtvmTETpIRFjMG21hwQLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403234; c=relaxed/simple;
	bh=qLxfmbhqyUjDBEHs7e6RQK8nLMqeZ43eOPVTIjzEBtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRYSpWXDnpTPxJeSipSqXUbWTKo1vvuAbL8bTI8hNwv3mIYodmG8C+m9q5GykUVymZ4Di+0Ll6Qlkql8WMvt3IdnY9+bXPOuyU0Rbne5kPeITUvdDy5g7fUXYj7U7ygvJUaOnfHAtC3qB1BqHENENr13k0hIs74TXOWTse/Ym/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOOo4VER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INchhdQ1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOOo4VER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INchhdQ1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0qSZ137763
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 16:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyTPgK92z//XO4ewrPGEMLjpligNbIo4paEWK12IK5g=; b=TOOo4VERQOQtZy5n
	/n8GhNyA3QJlNNbaRErJ/v4xKeWDT3KDvFUurEOKTSqo8bbCOBwVM+QifMR+GwHq
	dpDFCNhzFwVR4hq/j7vfsHwia7HrWzTtyaGEYfpmmbH5mE5pjDXOuDENlHSWfREk
	Tl8XIQnNd1SSIaaB96uOWvupMVPO7hMyWNi+edre5hHoDCGuRbKmtZPMQNaB91o4
	n2Q06MNvj7L37bGtfndisK2WvUDOKglExgLKG8SE2GcmBBV2G6Tuq8m0MKBNEO9Z
	CJI4o7iAmE4kpgPo+71ZwSWNH8/3ErvtqGhQPG5eijKzA/BcjGuBaK5qGwnClc5e
	1V2hLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq9jwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 16:27:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so689281385a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789403231; x=1790008031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hyTPgK92z//XO4ewrPGEMLjpligNbIo4paEWK12IK5g=;
        b=INchhdQ1L39JUnuDtGgPAaxYSFfi/kMpDjCukhzyEZbY4B1b3IzXFqQ0gbug1hUAOk
         3U7r9jA2XvoL4K+5klw6jdlBtC3dL7WANNHH2eVwK5z7exdUVVthLoCA2DknOZY+8R0h
         gG6YEn2xcT5uG0l66F7w5pbTQCDmG80kJOHWCwLo5ZIgn8iRffefxDH5KfaCRbqyJVko
         x7o+nbeFznPBZmO55yejm+iFgW7d4O+7tCSpIFhufPIQCzY0zQ/i4WxT3HgXCtkkNBMu
         lE7DaTSHgqjMTa339yStowouo5XiTG2e/dnfqm5gkjYZlNturh6fu5iwW6wbIHT7CXY2
         3Zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789403231; x=1790008031;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hyTPgK92z//XO4ewrPGEMLjpligNbIo4paEWK12IK5g=;
        b=huMPurLaEnhscERm3bultX4tNbgFSp/rmlfc71iTOIoklRiZ823q+wRqttc9wueBAY
         zNKRvgUPXwBJKjimBiS6jLp5MeJhhBV7JenNAkw9x2n2QkRzHB78HgfGfKIrVys0+mGR
         h5BRufEMB5lsj7HS0dg3ESIq0pxaTMjqKUmMy6inwiulHRbIulmg2L8NsJVj5Gx3i7RD
         hC5W+Ry8+vyRWXgO1+mMcM4BZv/6LsoqEnExrv+UhlgqT7ol+8IwuoVSVPiqh1NMEwC6
         TqPbzKmDZo3P6QZFSUrsOmrYFbtojOFrtjm32ezegUMs2LhI9+3Yw3kblMfJHVlkGZes
         kNSg==
X-Forwarded-Encrypted: i=1; AKwUvByXN4vYg2A/pKPlrYQlv+0NiIR2KsaAag5spbb+ztQnaMJ0n/dqKpJdA4IPpp77dzW41G33ObOznVcS@vger.kernel.org
X-Gm-Message-State: AFuF++nGuMcVtp2IFIpxenkLNRQ+VZG5vZps2DJsUT+lhdWYfUob6RHD
	aiu912VIJC/GXCIbZ+XI5Uq7SJKRuqmg2QkSZ3ZSJMoGqesCn0w0TsAQg4ZnxBPWWyTaCi9+8Ke
	4WCBU0OGGL2eqJBfpXmqLq45HRe5DRErG9R8NNfrFJbUus7pDRFxM1B/wUYCCV3xM
X-Gm-Gg: AYBFou10Fiain3BLXzadYGLqN113F3ftEgMdEB+LhsVBZc4XbfKivPWYZT64TB6UrLX
	j5l6ub5Daa4RkTIAuEvKEAMEnArP4rVBXIHe+P71O/WbkCNYXTSz33VHg9wg1zeiiCxpucKkOkf
	mGuCiTffFgg0qV27/mJWZt2zj7i7wMYasam7Lt7cqf3R/uKGjCRCcbv7TIhA36wvpHWVSfWwGgG
	mzTH5/Jnvbd7IPeb05Riw1Bd7XBfc2m32weRFszYhxsGLAMjPEo37x11F+gZ6XmUvOJ+/akb+Fq
	Q8tIIKFWiAOhxRDwejph1U11PPdS40YlrlA3qzWlE7ecWvvKCbfYFZJWZBl5DhDgeYxxKjzb8Xg
	xIq0mmHWEPWOlzo2ttBx5NeNsNm8=
X-Received: by 2002:a05:620a:7018:b0:939:fe55:402a with SMTP id af79cd13be357-93a346fa60emr19926285a.31.1789403231185;
        Mon, 14 Sep 2026 09:27:11 -0700 (PDT)
X-Received: by 2002:a05:620a:7018:b0:939:fe55:402a with SMTP id af79cd13be357-93a346fa60emr19920385a.31.1789403230649;
        Mon, 14 Sep 2026 09:27:10 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d67de8asm4247995e9.12.2026.09.14.09.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:27:09 -0700 (PDT)
Message-ID: <f22c7346-d597-4e4f-b498-d8a46bee400b@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:27:08 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/panel-edp: add CSOT MNE007QB1-1 entry
To: Doug Anderson <dianders@chromium.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, sibi.sankar@oss.qualcomm.com
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-3-srinivas.kandagatla@oss.qualcomm.com>
 <biywo5isdeagqu323ozaleeakngl4sngps4v7ngwqo23ju2sw7@jn53hxxuccff>
 <CAD=FV=X-Te1fieogNaMuyFAa2q33RKUCVXAUFcce_r7csXAwVg@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <CAD=FV=X-Te1fieogNaMuyFAa2q33RKUCVXAUFcce_r7csXAwVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIzNSBTYWx0ZWRfXzeSaCp74xspH
 nuIlRv79k1lS9P3zP/IxemXM0R1UxFuGNZfGcK7Ltbvj7fQVjS0xP3ocfcJ0MBcmbkTkVPCjFBH
 /jJL8i4tFC3zqPmQpBgyn5H0WkHEy+cmLDwNDHuANwG9LjO66SGMkugjKAYwIaNSQ3ouuufP8b2
 rg7Fb5BlAafa/VVfR29dY34Mrch5J6tVmxN6aKyj48uDs2Equ4t0sBHCGX4n3joch1DQ/RBBlR9
 yeZtDQ7z/TqKw4yoFTeYQvBrd6jFxfHp+SS2MMaVChvzwIkl0yGz3ei8mlHS2m+J27zK2W4bX8e
 /ncJkwTQT1BmMvbSUmVTbRj//4jrVJdif0VbMJqcDn1VLCgH7r2L+IgZl0WbiudvT/B19bJQKsp
 duWm35yeZbXX6Q5qO8A/VNjKkdEbyuuYES0VYLJ2715p6QH9OBLG09Fcx5VaZW4zs5esnRPH2nj
 A+XI6+x9LlH6UBImgGQ==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa82060 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-qWaGmECaF3vQ689P4QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: FSfyFRaREOTMQYs7_fk5IrkWEsS9sBO5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIzNSBTYWx0ZWRfX4Vhi0Vvahaxr
 HPrIbzyeuj6EaMwcvEnK5Nnu1L1PW8XclEPLb0ugroNgvGVAp5JYnE3e3vqHYbaxM0fgPpuiNMD
 5j/CJkbzygV3lBJBXdM6EzpG1EJgZFE=
X-Proofpoint-GUID: FSfyFRaREOTMQYs7_fk5IrkWEsS9sBO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140235

On 9/14/26 4:13 PM, Doug Anderson wrote:
> Hi,
> 
> On Mon, Sep 14, 2026 at 12:34 AM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>>
>> On 26-09-13 21:18:33, Srinivas Kandagatla wrote:
>>> 14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
>>> Panel identifies as CSW 0x1465 over eDP AUX; uses conservative
>>> delay_200_500_e50 preset in line with sibling MNE007QB/QS panels.
>>>
>>> Assisted-by: Claude:claude-opus-4-7
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> I think Doug starting asking for EDID dump in the commit message.
> 
> Yup, please send a v2 with the EDID in the commit message. See all
> recent commits to this file for examples.
> 
> It also looks like you are adding the panel without having access to
> the datasheet. That's an OK thing to do if you truly can't get access
> to it, but I'll at least ask if you could get the datasheet to confirm
> the timings...
Unfortunately I do not have access to the datasheet. I will look for it,
but if i dont find it, I will send out the EDID dump in v2.

--srini

> 
> -Doug

