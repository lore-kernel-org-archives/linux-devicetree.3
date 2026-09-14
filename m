Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759743D9DD6
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383678; cv=none; b=uGfOcnfoo3OW9P/plKL+kqqTk5BUIUrfjBUljef3pBWHhd1KJDXkLvr89QFMNSBjn5/r2yc6YU2Nq4nNlJ9B7+6ElKtpmznZi7aPdaIZDBhdc8yblDTkJ5Y9c57D+nskzqC5RHfEX00DbSFjuH5zRy4/M569+iV9dY4yD672CXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383678; c=relaxed/simple;
	bh=ZJyzsVWVEEqFSNNRHg2APKF6gHo90SoKotCklyECCZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYLCol8ra1PyZdf77DsNGDEnn6ZHJ+hBxAltJkmSn0HNp7DW4KE1xtoH/fHBoi+oQ9TWjXKMoqn3ui6TdJBhXzlxUdp24iq0m08cGyItf4VOGsJ6Bjqc/27c8MmM22VLmBo74T58kfBCds2sIP51RusFTVb4fgur4OWRyy0pkX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBhnZ+uc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhxVrG+E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PBhnZ+uc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dhxVrG+E"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8en530991
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+vhUPZZEjRiN8BjyG36ouPdEZwO19AqQrn6cJAQeYY=; b=PBhnZ+ucqsmLJ0qM
	dmfo6L5Sn3v7yK1ZtRPfKszNftHbvX31lKuq1iArXQwxPTzLNXb+27nZkqz13mXj
	Fm+G91NSulQm4IuywQIogOdp3f8Wpaic800pGaeB9THR8qAhEr//3Rya3rGWDakq
	hHbhNrwhBTctAaNoRivSuzZDHA9Qk9RShR4AAvVnn1FMEHrDyrV0BaPi23mL6Xcc
	hTkqmp2Fz7+CmkcPmdHta2gTX8h9lcNiGoZ4Rps4X29NGwZ3AxIrT5NNCPpDqH80
	/Nsbbc86Z7pPsUG8F7lxVsoUcZBgyufiwaXzqdWU62QJBphiRl4JawepVPSXv5/5
	Cl9BiA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hst419-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:01:12 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-982ac4fd449so15121241.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383672; x=1789988472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O+vhUPZZEjRiN8BjyG36ouPdEZwO19AqQrn6cJAQeYY=;
        b=dhxVrG+EocW/KUVv1jqFY1BDJMzeGME2D+HKC0dcphc6F8/n5I1+aZT/HY1b211MqC
         18PxRQeG9ftGL68FpZdqQ4hsEMn9XoTlZc4i8R4WWVlFZCECkrihSE/+YbdnAKvXg7S0
         9I4WlW6l8fFScExFG8OZI6tvQkU5namXTHjKtsCVPIaTCRUwdI/7oFoD+zpOUqSN51Kf
         ce/d0Ug+5YD+hyTlnEONTf1utkyhFimwiRh8Z5wveS+jxc/RPgihYDcf+VWp1SUEj3qF
         kt3fEi58csXJs9LP7Y5xmvWCI7nhcUXlzOv8awdYfTfQnx272REKEDEwMchalhFUTROD
         52Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383672; x=1789988472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+vhUPZZEjRiN8BjyG36ouPdEZwO19AqQrn6cJAQeYY=;
        b=U+NKrxJWnV5SFSoleoEss+Q7XfF/XLrh6/iBZKT177gDMaJYq9rpWyLGM+Y2wlps/I
         8dLQdDrHftcADk2X+E/yJvc4feIPtBJoyY40xza7LVB9QFxKMq68gf8ZbGzDZj48+/WK
         LL3YbYTWxJy6OHY0dAvqlJ6vQ4KHcigH3KJ/bwlsGCLO5xZS6XXV9PaqXfCXDHV3TUET
         UyIJNdRqWCR45pCdkx2CyaFO7q6pkqWjTCoF3xGYoBF3kQEXh+99CP+6gUsRGxaG/RYV
         dAfB3kzrjcALMY+SIcNYn5ZHNxBYaCk8ECi2b+nxgVcgRXzFda2wr2r8Lni/5JBbV3dF
         e+PA==
X-Forwarded-Encrypted: i=1; AKwUvBzaHot76gpssEfVGlGMEyLQCWAp3178xqExycEo4lcUzsHtt7VPZ+bTgHRdOjFVB8vDRqHyp7Wce8fK@vger.kernel.org
X-Gm-Message-State: AFuF++neAuQ6SEfPT/oU7bOagSB6w1rUmAzVHGxkoikoU3NVet/UWaee
	6MLtf/uxArmvf54I+04/btSmmdB5StzEZKQyoZEHsK3KapZTZULmgLrMyXfBgKj3uDrcEMA+xfs
	RA0pBoKkVUCgskJaZjhSRf6Ti/NOvsPf6vCe2seTpp2Q6VCG+6Td3C68WnXCe9TIaq5ahJT+o
X-Gm-Gg: AYBFou2lMXtCN5F7Uw81CfpfJawxkzsGFmuNMeXK6zSuDgb8Te7m4cHejqRYgGbrSTY
	cMQmyRyb0whyRJqUFyzwEKXUmASh1Pkjvt3auh1hNDdVTTDRP/8zhQzo5d9kkmUuOrmq2gIKlUd
	kbX4MYzcSDQ1AFwYIkBfebOW3zMKlJHm+btO07qJZD60CZ2rGQ5XFnq90At6sxv7AGsqb+Ii3Vi
	0FRae8hzmgQNiaZ5lsPh6fkAcTKV1OlW4NiQV5uvp6IaNJVxbdCD7/pIX5iG37TQzEUCx3E5c/9
	OIgeRLAS2UrJVVS0St29qRCBtMD7uJfVtAY7kVnYA7y1mAFA8dE9Cehq3syRKJ7V5281/oPxXvh
	9ODtB1hE4kcuUxsOLWw6oyw==
X-Received: by 2002:a05:6123:420a:20b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c9818b534emr247945e0c.0.1789383671698;
        Mon, 14 Sep 2026 04:01:11 -0700 (PDT)
X-Received: by 2002:a05:6123:420a:20b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5c9818b534emr247910e0c.0.1789383671322;
        Mon, 14 Sep 2026 04:01:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58314fasm3968386a12.3.2026.09.14.04.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:01:10 -0700 (PDT)
Message-ID: <cd69cd0b-99c9-4f79-8704-ee84a6a14dce@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:01:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/34] arm64: dts: qcom: msm8998: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-21-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-21-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXyPYiaFUExMc2
 M54C/mtWT8NzxHc2LKpZ8uO0VIGOFvpr0uo2wDk3Zy01K9rCb3kp/CmXirnXKYZmub8L7LZEYYo
 I/0meCfQG713jzCHl49mUmJnfyMvuHQ6tKCDM0S+0XD9DtkkgEcKDi5pzRltvh79tSgBfIcBopY
 g698aqP2H0peRkIEp9gtw7gAnoKm5d0KMUToWud0HU6Jhf1SYaLwxwfWeMpn80jWH3IhrxtcL4k
 FzHfZlKy1ISuKdsVzlH5GGzS6T6t5UmMhpaWVKqo4LxwkGz8etN2xRajvQK7nDwkXwP3WlMMmHU
 oRm41hFgdAVVK/fdszAhaAQvQZyEQG1CjJoxbv+WPRQ2VC2mV4eMuJpcXLzY5BjBLCqjTFZehGd
 0UVhjjYlGt7cZBkFqsMzryKdvL0a00ozD1RYy2+EhYfhfr8RhAA/nWQuJCKvlCOkki6jh/N7IPb
 6R71IXTMOppIgzyp7lQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7d3f8 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: fRA_RAIG7Q8WXHKellp8WFy3c8NWOxBU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXxPQpfn4DvS1l
 brPcMI2itKiXyTe6rOdt6suvUcp9fMEr1bF3mSfvcgqaLjf3Hc7513zilJWnlNmOZycNiMZ0z2D
 +NwHvKP7PGKFUFgNo3N+5SfDsoTdQF0=
X-Proofpoint-ORIG-GUID: fRA_RAIG7Q8WXHKellp8WFy3c8NWOxBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst GPIO property are per root port
> and belong in the root port node (pcie@0), not in the RC controller
> node. Move phys, phy-names, and perst-gpios from the controller to
> pcie0_port0, adding a label to this node to allow board-level
> overrides, and renaming perst-gpios to reset-gpios to match the
> binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
