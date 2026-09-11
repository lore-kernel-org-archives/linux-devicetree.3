Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826EE3176EE
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136344; cv=none; b=n5qEYniyDKRjBk1aW65zhUuuqwAzm/33Nnw8XA59snIdMN3x3HirtcGXL3T+BFs+Wq0Af3kl52qI9cyRRcpbJtNpMDj1vCRYmk3VFx6lCeTcl1prqB2gABKoHv2xHIt/mYpKa5p0euTxl2Ae+77LAM945Epj/M9A9YKBBNP2VA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136344; c=relaxed/simple;
	bh=+kkiiRjZHe3xphxiX+wbUyacK+O5ScS5yTKiei0y5Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aMu9nyzXbayNU+qIpRQHARvUiav54WA9VH5RAL0ilt7g0a488dr/rftCXVk8ERklRek5SumtdL8zS2A22QhyDJnupQ+cpe3xnyaKFc0uzoxPIKZYHPCLpYtoyiDw2jJf6WnooMOmcS4pJ/gmckpY6kCnzwHroSW5oPCygKqfgrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kiPiu4L6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4gZFpYf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kiPiu4L6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4gZFpYf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCikod3687082
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 14:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ti8Y3CyAOeHmbg13Vfb4Ss8PRlQ/795r/aSAHXb4/A4=; b=kiPiu4L6rMH1sJmJ
	YkLYyXbMNXiTRmOLGv9/1dyKO6a6QqbdNUsJfVUdRnlz9kRm0Z5S+f8MBb31XzZl
	eTut3pl/Ja220Di2b06ysIvsUEHs583BM4/NrBZHbTb19tLGtB1FZNMYJkcViqeA
	b5zw2D9CBAW6rw8hMgmAf/WonJ+C4hVy8b+pNgMglpvULHMKLAy/N+PdViwpobxl
	gFP5Xsp3UH+c/tA5UiIyXH5tKUXo9vDRzjKLqgK99/9M616l7+K8I9AwoiiseFFS
	zGavU6Nr8YNGc6UKDTTti4QTATeYqm7S1no5pPxfgjaVewwpRsTaSh5oY41LMfd/
	fzi+QQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbh30m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 14:19:02 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78a1ec363beso31097137.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136341; x=1789741141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ti8Y3CyAOeHmbg13Vfb4Ss8PRlQ/795r/aSAHXb4/A4=;
        b=E4gZFpYfRjR9vb/wopY0PaCv6nO6je6j+GCUtMvJ8Gkc2NTD3xE1LxSW/gaYqv4bqu
         Oxm0xD0MbLfzhWodg+yIfu3ZNaq3hht7paBNtRgGsWHBf/0eOIiv59XqsmWoYjA6rPNi
         dpnGoLXnxAuzfiQ/hFq8Fwbc+Nkg2nuD9Ipm2kOwkSFgffHpSrbkXaXFZoWYD1C1KPG4
         RbnO8XCLCPkOXnJtFi2t3eEL+i4BvolYJBs0+TNT0gvY/T1OkCihzmmRh9KDwHtM6UEx
         OlxZCWyVhWQ5pU87evxTYRY7VqN/59lOfZJxxjsfKDUJFCDhihKdZSF6CNMJ9PMeiCZ3
         JSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136341; x=1789741141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ti8Y3CyAOeHmbg13Vfb4Ss8PRlQ/795r/aSAHXb4/A4=;
        b=g5/bcQ7s+ET0/0KaMr+0BwDlURjAv13GMQBSkgdhJeQEaEUk4EunCxiK+omwUCRMq7
         J9WttgV/ST94ask5tmBONt0RQKL6yMOFHHMdIa/ZgTRXJdp/z2xd81Guib0OeVo5+EBM
         UTvXsuO2DgpeA78VKMNumcZsp/aYE8Ea3dVBvCQfKc/4sUNblfI+55hbu/1pcQzeb8fJ
         XW/ZscHVyI/CIu9MtEHSsRvjI9DbdLov597qP1EqHPuiNUzuNzXu4bRl6HntMOJ3FMvl
         T9TumPIkdJh41vq+ieJu1X93xJKehTIKxKg35DGaWAPyvjubXISnYWvF19AM6lkTf28+
         bGsA==
X-Forwarded-Encrypted: i=1; AKwUvBwHhAARSKhC5hZTc/3VquH7OFZcN2h8UiGlx25KPxNdtMpPpCjvX4OvoPfQ5/fsicT+qcZZuS9fcwgI@vger.kernel.org
X-Gm-Message-State: AFuF++m/o0v2R+rKT2IymfavWvoKGmMo0kh/bLNqn25ltbH4u94jCKhh
	bymnZthTeKv06Y2wgDu0lwrcbl3yfDcdIdEK236ztMHB24UyspDDhMrt9qSnF14yhmiAcRS7Lko
	vMWNcsuuNmEW+DFNWCwBrP8xL67swWsPVoXLhVdre2vi9KlY8G0XWRyrc71+N4lBG
X-Gm-Gg: AYBFou3wh+8Q/1SxPF63p/NMT3uTxN0SSzdVasuH3V5CCQBUcrb2jRepT6v1EDDJupi
	bZUZo//1fPMfcGL78G2yRVQWE7mRyT322GKCVbuf6aaaLfoEXDpc0A03/5FGfqoiKLlb0To3Y++
	Xf3NkuCYUi0X6JkPF7C9BbTKBB1ZEebNcB9bbvST9n0xzHRWF9ohXMncJ5TR56QkO8dn683jjT5
	vvub2ylw+Ps4+y4EmjlJyfiEfLlaCfAt7wTqxF1JKfjoslAiBLhQC6w7mAd1d2yrXSw96XMHXLE
	COlAWp/7FzQ2/u6+FvtZHlRZNpWy4f0xxZzYhsu1Z2+SJkx149/FrT3D0q4eBFjTa5ih8qp3EnT
	Q+TjkCwNzNMOz1cho9gbVUQ==
X-Received: by 2002:a05:6122:6b06:b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c8462bee0emr1650000e0c.3.1789136341432;
        Fri, 11 Sep 2026 07:19:01 -0700 (PDT)
X-Received: by 2002:a05:6122:6b06:b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c8462bee0emr1649949e0c.3.1789136340908;
        Fri, 11 Sep 2026 07:19:00 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5964c7asm839147a12.30.2026.09.11.07.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:19:00 -0700 (PDT)
Message-ID: <0401ba5b-c308-4e54-9f6f-58005cd19a0e@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 16:18:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] arm64: dts: qcom: shikra: Enable audio on EVK
 boards
To: Mark Brown <broonie@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <feee7ac3-f5e5-4677-b44d-34be0c784110@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <feee7ac3-f5e5-4677-b44d-34be0c784110@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cOmhqbWYoXHhKW1m-d_I77xtqM7llKLK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX7RoYuRcS3hLy
 wu3hc6mnO2Utz7ww4lf8n6xwOs2aKEezgb4XjCcyYivWkZLlLITGMl0HOw8DC8vnAm7aXtaatJh
 ZzPB+9dpWMW68Sd1f4Z/FhnFLc2CNn9bXCdnjnIAPITtl68eQJwjSwz5YV+6rL5kRAjJK3+OeJG
 i5qdd6o82lmR283CKXH+R9WTaWb393OlvFhkr6SQt1YFJ0NCh/RCfI7Mq3SzGMeIyZOsHCRis0B
 5c/Fm+S6AQcEkURx/skWcpjkubr/Pw59DU9e5owvVwe8MhplFsC8n1X49fdtZOkFP0RwuibpPOd
 FOWn4C672W1pvQF1MhepTSQ8LErFg7mrojFbcdgl1J2hARG7aQMg+aEPRrv/HQLCe4r4QrUYFK3
 zLsussjLFRUjp4dfWYq92PLnBklcSu8ItHmzPRyJmt4cghCskowE6QM0/EiFuSLHvSU3hptISlJ
 bIpGQXfjRJQHcCqEurQ==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa40dd6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gfYPUWtuRM0ccBUoLM8A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX0z/hojNPrZDb
 zWAglOf6EBDwQPtkv8SZAp6bHtD2vcorEMOJDnnWPUR/xgwJiPejQnA5/6AA1nwbXWfLrPfvDL1
 TUSO7MismubQ5du0pvk45knTu1eyBr0=
X-Proofpoint-ORIG-GUID: cOmhqbWYoXHhKW1m-d_I77xtqM7llKLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110200

On 9/11/26 4:05 PM, Mark Brown wrote:
> On Fri, Sep 11, 2026 at 04:46:33AM +0530, Mohammad Rafi Shaik wrote:
>> This series enables the Shikra audio path on EVK targets by adding the QAIF
>> CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
>> board-level sound card wiring for CQM, CQS and IQS variants.
> 
>> base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
>> prerequisite-patch-id: a056f645f45682f1008b321f5e639505f22bb979
>> prerequisite-patch-id: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
>> prerequisite-patch-id: 32a1efe2e364ee15c466f496b1ff3128e5326c66
>> prerequisite-patch-id: 1ddc51582586120795d86a2ff9f0aef20c0e891e
>> prerequisite-patch-id: 1e68cced9250cf9fdfbb8cdc27ee8ec47ada4a87
>> prerequisite-patch-id: 99245529321cadedd30d9e38845b53dba3725de8
> 
> As I've said before could Qualcomm in general *please* stop sending me
> things that don't apply.

Adding to this concern,

prerequisite-patch-id: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43

happens to be "Add linux-next specific files for 20260626"..

while the base-commit is next-20260910

Konrad
