Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F0449E5D5
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141562; cv=none; b=nPojplrZ67z8HLFBt68P//X9Z8fV+li1+IuyOL355Z5iMORf10JjRc6CXFsAbttR2Nj5dDw/NuD1mqGYvQG+MslHnvr9TVMYIq7r0r418IeZKJ+TEvbfuL2zi9flAOIa3l90uZ8gB2NZ37KjUeggBL+hetS9KfleepcCBSQgTK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141562; c=relaxed/simple;
	bh=tSipPj5v+toT6eiLFHZfg2ay5LiIR2f7cdFg1XG63rQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfrrB9pBtlVRL+kH9n4KKkZpHSn3jhQKO86foe/yduCpYbGygOB306obPHSHobg/9QiS87yrRdYSLLs53eqo4hhU4+YoYGmhYNBjAg4rI4OPrJRPS805yQJNLCUVk16hsI9INjJJGl0np7UDOkJ00HUKpqnHL4dqBejFY89fZOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wd3F/Da6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGvwmlK+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wd3F/Da6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGvwmlK+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm2x7442902
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FMETwDp/3YlyYwhOs1PhYLsbVwlSu+GFV+6efISo44w=; b=Wd3F/Da6OWHvXlJs
	5MGUI8D4JBwW1f0djoIFga8S2//zfxRJ9VJp7d2UUsFiyojhZXncLnxKw+VzKLg3
	/mC04DOfa3dgnSN/ATVUe71pxrk9tk/ndiE+9OwvftI0QiSmvD4MD1UIatdcm9od
	ovNC7kaK6CX4zMTSbtTvi8kVtFFSjp8R51lRvvKxWyHBlM6Jcu0YTZjKbwBjMUOp
	t/tPPXb7c4lMp8j7YWF2UQ6HeIRJiEftgejKs/B+RzuiY59o77ErqTKhr3BfyahC
	nKrsfLdXLQe3x1JfE3uspr/sfVBfnzb+CTiY4HAQNrgGDBMmAm2VtdUqlbLAi/iH
	YW8k5Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg2pk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:45:59 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c82f9e26ebso35876e0c.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141559; x=1789746359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMETwDp/3YlyYwhOs1PhYLsbVwlSu+GFV+6efISo44w=;
        b=WGvwmlK+MmnODzkLv499bwOthe6QuYGjIFCAqU7NUT5lag+1Xod++rqGZ9FvFoR9y4
         LEmNGpN47/P17pvnq2tKB4zqD8fmuIvedQqzzTuvmPE4MV6j8Hh2qbVY+72d2qPlsEqW
         3JnrboFb/LDRRxt/9cWYTWhYWk7G2+W94vIbBpFumVpJokFXng8OcEufz2omOhdDQAWf
         L+GpUklTAqfZtEilUJqhdmGYeWxhGXv7lUUsnA3RsW355syxsXsKcMZa1c37y5H9zW+G
         QClW+hE4AYQq6bRIZDrEeWr/sZ/M5p//ilnKw/5dN3ZpYzSTyR0IDpWbw/qHNA/IFy7U
         e5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141559; x=1789746359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMETwDp/3YlyYwhOs1PhYLsbVwlSu+GFV+6efISo44w=;
        b=boNHizI9RIHeQ6F/x/FR7yKnoMFDgSDrLxsVrOAHBeAYiLj8sSFFhqE/5rcIQt+4fK
         oqv/Jbuoq741rBX0tykzj4pU66OzNjdqjAu2MWXUGz7SUXHFvh2eOrhHP8wTstjpqiGi
         SjK/gF1qP0YBdCyg/P2+SSIwHhj+DrVWGHCGW7NZ00OERHNvbXGEzijGCu/yF27sQR8a
         qwFB3iEnIR5uOedBX+863i71SrUPANWHAUWMDHF5l0YGtYvWJfdIrKmdp0dUV60Ccew8
         QslwB0RpLIcPMbtAgYDns47dsxMocrNdu567tmKyT9PMxQb2aca2Ho/BHClGev0T9qDg
         rbcg==
X-Forwarded-Encrypted: i=1; AKwUvBzBkavEz7UPfzLukNuwK2/jwojaf5DfgvHT2NmRq7klYO1QnzywR2mWPhoBh1EoC7yO1CNS5T0zvHvP@vger.kernel.org
X-Gm-Message-State: AFuF++lrGqNHHQs49fFs4TsWCfi31FegVptVmD3XVt4laXsi0YDFI7QX
	oAB2/46Mx/1RjJ/+0BGcTpTVIHHAvW0wwIyWs0jCYJobF4peNWpPMTQRMqlY5rlr5oJa+vqlDLl
	VW/ooAjT6SlEejV6lbqlEIMnaRMWP9CZReugAHULhX0Ao9nxoyZaMAETZoiTuZfnv
X-Gm-Gg: AYBFou2E6jXHwYlGec2W+uynsJTdFy1DNOAwZkqVzl5pgqMKRg+LVVzjRq2FAMAJzod
	jQt46sjhoZB0VhPhJY70nONXEutz3inNU+RX7ins7TErDEX/Ffr/tIYJDns+zWtpF1cyIPBkmFW
	0AQSict20U98R0N/oM4IexyhcWw1Y8im1S8YKiT7XkQAMSl2mjwJEPRUP8yk00quN4a1xVcJ/iM
	H+Q+dgTVughOUS2G+yc9F3aD7R8/LvEa41r85oK2uaOsAvp3Cw75URdBhX8TECBPSQyKZCdXknL
	HscUc5XA0INb8qp5ARHGtrmLEwyVcYsbC7kyfSzqoNCcznc80QM4SDfMCyey6P2eOuMaigzqrN/
	5Q7j3nH8=
X-Received: by 2002:a05:6122:6d08:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c845d9f78cmr2224887e0c.0.1789141558805;
        Fri, 11 Sep 2026 08:45:58 -0700 (PDT)
X-Received: by 2002:a05:6122:6d08:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c845d9f78cmr2224838e0c.0.1789141558370;
        Fri, 11 Sep 2026 08:45:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047b678sm723077e87.78.2026.09.11.08.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:45:57 -0700 (PDT)
Message-ID: <ff5806a8-ed97-4023-849e-6cbd9b88efdd@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:45:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] drm/msm: Properly handle msm_ioremap() without
 name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-5-87bdb9f1987f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-5-87bdb9f1987f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9CzYGODES5ZQ096gXTYkn4YOVtwWjtmd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOSBTYWx0ZWRfXxDbBE7vbQL5i
 t2MP+hYZc3TSqBkr5z1nZnQyDCV2ZuAaWkDFSuIX5WaSPaFVbew1ll7uXGYgxCnFjPcZOynDfx0
 zo8J6n/Lc5aNFxqK9v2vdhOCwwvZ6EU=
X-Proofpoint-GUID: 9CzYGODES5ZQ096gXTYkn4YOVtwWjtmd
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa42237 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pPDQwCEtd_d-j3aiaSMA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOSBTYWx0ZWRfXwnPNyq9U0K16
 mm7GiPoPgDlaTOy9EU0lKXoCxx6mYy+zocWVkc0jGzTNFrIq2sqG3hnxTzpr79i030T9w+tU6r4
 DPshU8RGuKawNjM44ZtrsCVgdHWyRDpnBdpZZ44MTDOIHuUu7iiFa6bIONgYEwAHG1NrC0H/uib
 5cr+aKPoXAeGON2mQYigi+NWvZg4kFxSD4Ga10grvcSw7Xgg+pptY1hmb5c4UHFvepacadrN55H
 nf/7TqCM6LeXb6r06xUfk30IUOPQJc7rdqtklxO3gD48AdlTay9yCG/iKbIe/grlJ0Ndb4FRAKL
 AYSKCiAX5LEQVUFGWmdlJVWBpHhS7yJ2TA40RMcDseAIakYv4eUm/OOpOgig4zCBlHmR/LdNbtb
 +qTsfzjYStUY1Cgo2MUxzW3b3Hnq9XiinHfoD95PXcG0y50a18KU8vrRy9cgQa7q0EMwWj1/LqV
 1cJ66Ud1YfjpyWdnVKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110219

On 9/11/26 12:29 PM, Krzysztof Kozlowski wrote:
> msm_ioremap() accepts being called without name of the region to map and
> in such case maps by index 0.  However error paths still use the name in
> error message.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
