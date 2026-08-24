Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5E3394E91
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556881; cv=none; b=o6bBLdP4yqWq080H1NpFcgzjfCTnRXOiBvVdgnSbf5bdyX0Vy4DEzfNTU+jdlQVYQzvShvId9VOYYzXnBBHGYM07hew5Ygj1U+Yvd8Rk5LyxcImGqyszUsqb5DiDynEzYUeqLsJ2+4yTfvlcXMygcnC47IrzAzKnBVYGmvGyN3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556881; c=relaxed/simple;
	bh=fVw0SSHsMEiKeyQ4qfhJeyUSMovRYzqu4Hi6JndnW/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c6ZfZNysmJYwL7MMznHze4wZzWsG/RxBXOXCrjGWQl92wx0qohx7J0GgN+97X4+Qo/2tEylCCfkMphJ2fv7qEHo9cbXpR6to29s1L6Bc0zCbxh6q/yxRg04gpm/mW0H5/Fd8fVP/9nh/Kitf/Z/eDoStxuR2BqSCNk8BZpop/Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Td9kS31K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gyGccLOF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Td9kS31K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gyGccLOF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R3eM2041328
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	id9aBbeEjT3dXN0EHxiuQDmKmD2lWlMPUfgX2k07GYk=; b=Td9kS31KkFUZ8VDG
	ILvYYMBSX8hW5Y7Z/YrBo6EZxsMefkhjnIHuoGiMu5ROAuz6bPaSsNmuiQSFM/W/
	VRTb1X0dsH+z6TStZutHV4pRRYEXQ8HuK/UOd+EMhk2HwYbRh4QBeX29BI/wKh8g
	gTbq1SUxqcTMQLvU11TvzBMY3LP7e11NDE/j77RBPgmi5VcWaMHqQ6SdQgZlek4X
	aISd/hoFol6zS3nFiMpsAD+lwflJ+bsTotuDihEZEMmegvmC7V8nYY1wERwzWZKT
	kAy+vii70XLSKH2h/vXXleXFCxtcbZ2JY+LpwsC/gsecyCPGMdbOY02X6wEC1e4l
	5MMXCA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7heux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:34:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51cab6f7517so3746691cf.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787556878; x=1788161678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=id9aBbeEjT3dXN0EHxiuQDmKmD2lWlMPUfgX2k07GYk=;
        b=gyGccLOFZBk17o6zfOUCx6o6k8Hqv1NrC3nx+Nnjnwe/hmNlV3vU9AEbreWx8I+L/X
         T2etqthBWhNOjE+c5i+Vgzinm2UtAuIwPLt7W/mrQ5DKMZk383sBaolPEO5efIJ0/JYK
         MqYAY8r261ojh6i4OhM419WZIbIL/3D5tO2d3Trare9QDqIxvIuxKamsWU7OpZcQ2fVF
         Lq01P9q1iNEqCUWevuOcO30vZq60W7UYL9veI3aQ3nk+OJx5q7MY+HlYHOxqLCoYIHLF
         cBoevyjAJLsDUiJsy8O83geBBpbITSTi0URI0YYBVdg/3wvX8pITIppDbyeabB9CUPYq
         of2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556878; x=1788161678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=id9aBbeEjT3dXN0EHxiuQDmKmD2lWlMPUfgX2k07GYk=;
        b=ZJnDMhvW9SalEHD/Q8h577dFIb8YI4ROyLmhKxWPpAvfNvA20KZAooiGYxiqcu6t8t
         J/pRSEEG44vCGX/9XDn9iMWlCHYuTVqEFDMhHeUAp8ohsa5YPwZpCeUUF6Z8SiSUZEUO
         IeWF7JJ4ATVVoZfSjT12JDUb7Syj5ZCfB69nCj8AdMuOAabaHPy2yNxAmClltKTHNlbz
         2MU4DnEcUEP+9ven/agm14rYLc8+ne/Ckjt4ArGnyBjSgKEPcrIRx6jH8xjcOOMch9kL
         GFjdICq/CP/UIcKXc0H9deOLf4KGAoDV9eiKeGLJdt1A4VBeoaOOAN40KQjjDVmW7VIZ
         fHEg==
X-Forwarded-Encrypted: i=1; AHgh+RrkvrPbC4mbOjWR07cFstIzSXbkkthix8dDtzFev/Gp7l13TbjZg1HMmTtRG9iGT0tyiNm607oQGBA8@vger.kernel.org
X-Gm-Message-State: AFuF++nnx6bGFyyDcQk4l07wZK//tYXbiZ5YyE9B86De46fecWd7ZIft
	Htr/xoQn+uCEMvKN602ShsKmg/a2dw1C42lQh8DRupaQS44xV3K5eBjYOfFTBYmp6bqueqnNrE5
	FRGDX5zE/vuwhiY1iyI9Q65Z3NMc2h8/UyuBlRSa/+qgevwhjiS96AWGpHrk9PDmb
X-Gm-Gg: AR+sD12GPPT62u9Mhh+A75AbEfhJWtgyzu7NUrpLnGFrPFxXuqwYyGtYiKXl196mxHu
	m73Ac8p1kYnHiyB5P7RhtS4h/SCSX6D801mKYu156M1oINjtDjCGQZCcndZ5b1BiUP+U2T0P55H
	z+7b8euQwu/wCGTZfVKcW4kDxS/v/UXYmp45Ij5xlwMMoUwrVJpjspPRYfnjHi5krLiGROmsX2W
	t6CKl+Yum/o6pBKMlpS8yDjY9gXgn53QHDAFwR7Eiq5IqJV3eAk2wl9Gwg24RV4XDu8IDspsH4i
	999QM+rU2jFOrGQoNUTzDvM1p4RnmeZsL7LJtFQAJ16F8jZpe61g5U0Mh2WZApKvGEKYWXJDCHb
	DkB8epHm6vheaLVR9NpyfTOv0
X-Received: by 2002:a05:622a:1102:b0:528:3722:a372 with SMTP id d75a77b69052e-52df5a21c48mr178532651cf.4.1787556878101;
        Mon, 24 Aug 2026 00:34:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1102:b0:528:3722:a372 with SMTP id d75a77b69052e-52df5a21c48mr178532471cf.4.1787556877562;
        Mon, 24 Aug 2026 00:34:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a8fasm1238645866b.8.2026.08.24.00.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:34:36 -0700 (PDT)
Message-ID: <f527940e-a82b-4928-bb0b-efb3a70e9b8a@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 09:34:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 enable 4-lane DP altmode
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260823-blackrock-audio-v1-0-f319387fc6a6@oldschoolsolutions.biz>
 <20260823-blackrock-audio-v1-2-f319387fc6a6@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260823-blackrock-audio-v1-2-f319387fc6a6@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8bf40f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=ppAVgvi6q-cUoYIK1IIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NSBTYWx0ZWRfX+QUBIj8O3Bb9
 j5M5maUjZb7cXacRBNg0xMTpH1NRwfM7Y9L5Q0XZSrpHrCRkCI9SBojFhVhcpQRu8Y728vDpbjv
 /4mOAJ/aenlDsRC2VONgyRmfATD2tgI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NSBTYWx0ZWRfX4ZpdqAOVD4Lx
 J8bsxF6fabb+dgkYAPtj95gD5AXtooy+r/l51OJ0JE4Phrg9eW47kRmI7xOcKbB0l0Eytnawf5D
 nLBIb0YuasLjETfGQgbNLEC902iw/tQ47Q6XihlI7ULLS8Ao1OcF+qCw1+MZFuXZ0rZCHHxp/IE
 nwclCBIe+K64J+O6i8GMBxkLbWVM84jjw8GzeVk9md+hu1jwiOlsPD+UKRwIHUyG4GnND3NYQ+T
 Ry0m7uEWS0vIAZCtVg9ZmpLYJ7xeDZpZ3L4HAmwYDaOh7ExlQGvgzdwHG/QRKOEB6VHgHevq19w
 8W1k9+Np1NYwtQyggMXoLCUFGcF9RIQW1eMN0JHstBaQFSWYnP2ZF4TWiJDR+wM4QDg0VD3yDAM
 DviznMnB0Zv/PfzRhy3Q8CIxjqyRdLxEjH5cxsDQdJBmBfegKM/jIUOZ1SLf4pBW3hj5HqU6+4F
 faDXIBhb6JmFsz1MDJQ==
X-Proofpoint-ORIG-GUID: BlZCvAub8QfAt8bKYjOL8ObjtxDWyWOW
X-Proofpoint-GUID: BlZCvAub8QfAt8bKYjOL8ObjtxDWyWOW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240065

On 8/23/26 10:35 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Allow up to 4 lanes for the DisplayPort links on the USB-C ports and
> the mini-DP connector. Add the standard link-frequencies and move
> data-lanes to the out endpoints where required by the current bindings.
> 
> Also enable mode-switch on the QMP combo PHYs so that altmode events
> can reach them (same treatment as on the X13s).
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
