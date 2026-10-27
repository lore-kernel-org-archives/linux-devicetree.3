Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100446;
	b=b24L+b1gxhUxsXrtc3wRcwWWXw9SZhrrr5Nha4dOtoDdIIAzJXpaHem9sAB96OZzcdjv
	 YRJ29VEuneQnwrWdZDG5SaNE07fqgepdwlKXrshQmxbnPpjMQFyJ0UKAcJYp+GPh3rWoh
	 25uqAr5OFzW20LoVapGRP+J8U9dLvVyQjjcTDUoNEmtyW5SeJxbydH9SL/jSNrkJT7ATG
	 NOAzC/Hdt0N+DUw49Ofdptl90wKLabo9AS7sKb1eTk+xesLGLsxaI/ymUN4/ObfU8Qvcb
	 AeUc5d1Frk1zaB0QnTC1cY84SN+zk9VJMBhV4y2x89ru6SZwWc/VbmhAELS+kXJQr+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100446;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gnBYF/brT+54VvThiXNBFMsUkIWFN5n/zR+vlh1db8Y=;
	b=i2jS0JPyEzNZBs8LofJUcxIgL2nHTwQycbV8308WoMr4uNN3aoBWYXM2O7kJMzUMLRiy
	 ue6a+UNW2cMl6iFm9eWRjOw0zc2xH5M/nexldRyGoW2oggfdvsJcggK9qVxrtG4WP75AM
	 9nervAhQe2v9x4yxfLMpFiMI+TLsFPeQvXmhT5XsTXFKbn2SWPpqlxXxmr7aAfiYDriuu
	 t3ovo+LufZvEeObAQMZplPkcnoSZsutDjdovGpBBT2p4pVXOze24ZWlraDJXTRKXD+zaS
	 ckrLDADFCritBBdrBt4nYhAw54hq3F2xSOdGJUcbhXhh0uoRayCRQ+CmvkP2Tyl6bdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HQUiwcNl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tsi00V0i;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351FC606A31F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 351FC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HQUiwcNl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tsi00V0i
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeDB51936098
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnBYF/brT+54VvThiXNBFMsUkIWFN5n/zR+vlh1db8Y=; b=HQUiwcNlg3brz6ri
	CV15WQafTLx7qjzv19G0UAoz/qk2r/MrDavXXCnMxcAaO6l9GH68gIhEPU8Ariy4
	Kfm0SlIfx7UmWB0O1wT6NKRj6qeS6tjn7jplPrNtWU1sLINM0qZSuJD1SuUhcD+n
	qNSiiMEUqB7cwNBlIm9dV0tcS+aLWuyY/FCCH1gbwHL8L1HNhXT8YNSjRzFBMsdt
	Ve/QXtL7pEHxwP24JQnSi46obVFXcJV40d8N396wQakDynE1mlpe2gn9uIbsyy6w
	gqHlsNBvBdTNZaILenXEc3tkoDvmdCisPh+wboCxl44jWxWPLDIdr9gZ0etZZR5y
	H3YCfw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtk2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:27:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-943fffbc5dbso3381085a.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100444; x=1793705244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnBYF/brT+54VvThiXNBFMsUkIWFN5n/zR+vlh1db8Y=;
        b=Tsi00V0inv16cHYyKsAxpXLniTD6HzgR3hWjUxk2/qPQXdln1BFzsygGArWN9DfM6x
         +3yI0sau2mlWbkhSLgcHmK2t8gHaqldcCe4kBHZGpZ23BondUZ/Kdz1L3CW9ZNKMTLVe
         YTmRXeiocUVFYKIDYdLbl9CNslnoeOsYGdXoPbAcEz/9Anoym8yrtD4eGz94yNguPb3P
         7l7gVwTCcy3D1YXTnlSnDkhTn/5lh3d/xnVVbOhp7SYEWAO5vcSbUd+tZWlvyO2GM+NK
         WmbXNJ8Q37b7+5bjbHZaUUkIvMOomoNetUTGALnIBMWtyNTfSiEG+FCYhfWrNqf32hLo
         XqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100444; x=1793705244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnBYF/brT+54VvThiXNBFMsUkIWFN5n/zR+vlh1db8Y=;
        b=UJL91hyCDiIK5LLOzItDnITq6MFiQrm6z72mR62XmgilL3uEjiVC6BiYs+9N1mc7ZX
         tG3nYXgJTI+qlbwlBTw7Dt1MEG68ddBpqjDrC+YDPwRNKZMGgwuXv7wmOv/RNVT+v2m2
         86ROsGn5HVz7AB/geOo7+VRuLMnHX73Od51Xb115R97w0sFWuMR4Eko87ipqwLioNV+J
         q0Wl1l94inzsqWUr2eRbFSvz9eWsxvNr9yZubVM/HneeMbGXU3jdV8Hww96uPWc3m+o4
         LHAuqa9K8T3RiBv3qKGI46agciLf6ujZTolnD2HU+seBMXTE/B9CtdQp/ob9xYWslRr/
         gmbg==
X-Forwarded-Encrypted: i=1; AKwUvByyzJBc6A5wYynWcyfgYTA+WEpSFMmytDbPZ6VRovx8jAxsaVZQ81Whx3MOGkYLPfOqx9k6Hjungk6f@vger.kernel.org
X-Gm-Message-State: AFq9FYIaLXB/o1Mq0QvOAZIq2Mi+fsW2qJAqKungd2pRo8hMpm7/6GXK
	mrJ9kFE5UVKst4DM3Ff0sku6yC+PBLtUwP4SyFQmxH20pox88qph8f2e/kxALVHwPGYxQdSFopF
	lhCRB+a47Kqqpxr08IzvYe+29SZYTVf5g7oDsjkVIEhE7nNvQtG1eFvleW7GK0iV0
X-Gm-Gg: AYBFou3vWqNFpK9UT08Va0lm6aCBos1tLVg0co9A/qUnPW8BqCQTbvj1fNvHsv0d2Gs
	a7icMgaMORF2MIij3esdC0K7rczALGNUu1LW8G0DizOEpg2cHMOWj98XcdItUIC+8iBvqiHNwOo
	akVrsusr+1HT3aueFB9aH/VHSt4rBE6WGJJeXocjKO+arPJQubT0pGLreFzj7MJfdRKU0tEqTVA
	EA4Ffz/O+FAicLaW7/EYuPNJvt12iVE1FCzWXLyI2V0a935mVkEjxCopa9K06JDojUETbGm7cND
	/fep8C084iORn1RXAnYAvfbhB1nAgxqBmekyDB3alOTN036940g0Cw6NB6sd10QMf3AK6slMJoU
	xvNhjkrMZC4bGAJNBx3BmWA==
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1762507285a.6.1793100444266;
        Tue, 27 Oct 2026 04:27:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1762502685a.6.1793100443839;
        Tue, 27 Oct 2026 04:27:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459713f9sm4946374a12.16.2026.10.27.04.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:27:22 -0700 (PDT)
Message-ID: <7ce4f890-8850-4217-89e8-cbda80b2a5f6@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:27:19 +0100
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
Subject: Re: [PATCH v4 5/5] drm/msm/a6xx: Protect the 0x1c800-0x1e7ff GMU
 range on A620 and A650
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-adreno-a620-v4-0-b0095e028c76@brar.si>
 <20261027-adreno-a620-v4-5-b0095e028c76@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-adreno-a620-v4-5-b0095e028c76@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 85vZF7p1Bjc1J5nzYTq7OHjuKKbGY0D7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXxZM5ukCjf1cG
 x+NJxf/x+c7Yg9ZUOp3nT8EfmgFtCZZudiRQ8WdQ4b/GgAPDgdneKvy5oWZxptjM0/sodd6PAhg
 CnsuUY3VRwwL0l+AaJLwL8ZplFoZ78Q=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae08a9d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=Tm8wa4UmF2Ix6aBE:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-zc-H5WaXjtm9W6SF9YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 85vZF7p1Bjc1J5nzYTq7OHjuKKbGY0D7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXw8HuhRI4hgFh
 ehFQtWwD7ipgg6PAF3pla9a44v+meAHrDmLvF8PDdSpcs87J8hzf8qrAg3c9pTIyWzmd9LXjqhj
 DEvpR48GO2f9G6AyMt1QdjHjfFmPqqw6dLCqZLrl62SEli6dJmfCehjU7Q2ZCJA9vQUAxUCbsKn
 qXH7usQOS7BNGCTUfzrE7M80bkrXWOKA6XdpvmN5IAxv5weOobhPZudk7hWFxYSj2gVCHWK7/e1
 5ucZ6mmA13V+TttH4Gr3jzcBWGr3lI/J2jsyFfjf4fgeWXlYub8JtDCfTsaO1sMkGpI1EPJtdMG
 pxQhL/1ZIBHr1dTA9F8Ok0hHiWd06Lchwn0Z9yv1R5zWi9sGvLbz8nElYneqlEAyDvjk7oOCqub
 iVCFja4Qs4S49f/Jz4QBWbnE4glWNy1deJJvPZ13ZTdwmn7kM2shAbuxoyMp8o0DdvUyYhoPNMI
 Az+IFgimUmpY3A4ynzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 10/27/26 8:14 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> No protect entry covers the range from 0x1c800 to 0x1e7ff: the entry
> at 0x1a800 ends at 0x1c7ff and the next one starts at 0x1f400. The range
> holds GMU registers, among them GMU_NMI_CONTROL_STATUS (0x1cbf0),
> GMU_BOOT_SLUMBER_OPTION (0x1cbf8), the GX and MX vote indexes (0x1cbf9,
> 0x1cbfa), the DCVS option, setting and return registers (0x1cbfc to
> 0x1cbff) and GMU_CORE_FW_VERSION (0x1d3f8), see a6xx_gmu.xml.
> 
> Add the range as no read/write to the A650 protect list, which A620 and
> A650 share, so that these registers are reserved as well. This follows
> Konrad Dybcio's suggestion; the downstream kgsl protect table of the
> OnePlus Nord (a620_protected_regs) has no entry for this range, so there
> is no downstream reference for it.
> 
> The list is also used by A621, A623, A702 and A704, which I could not
> test. Tested on A620 only (OnePlus Nord, a 7.3 based tree): a Vulkan
> workload ran across GPU frequency changes without protect, fault or GMU
> errors. A write into the range being rejected was not tested.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
