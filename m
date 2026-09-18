Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2956497385
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726140; cv=none; b=J2iOMI3D3Us7UyPElNOIznmklqWjwgVR2KeqP7+06p62ksA8KegEh3zEEsUBj977MPSqJQUwE09P+alQGxPBKkFao1up5VsFX/DiuL1i8PeRxm/QuzJibxZNQSB33+0PfIb1Y6LXQx7aIoQhxKHFSvo0qbyTpcPuUEJ6LRbSK7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726140; c=relaxed/simple;
	bh=ZiS873j/oX4o0aNS8BJNpSSXLtLM/p/xUhBTa/EQMmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oYzETKis2f2qhSwPlKxH/Q3TLKZRCTqa4l5OXhqEZ0WcPHelLkhGtrhHxrCcTugK/C2XY8stVD2Elmm8/1kkvpS+pS0v8SeryFo/w0/Lf+385sP+Rc2GoC2sQZGPCMpelDGAE1He61XsKLKL1wqtsI7VocRxPSyu86miyiNjJVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=By7OpPZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOmSHNl6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="By7OpPZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOmSHNl6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9daMT385306
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQNBrq3TGaVn7wbkyIZv4RT34n+BbDeNfTBJBIwEyMw=; b=By7OpPZpVeP/Ps/P
	RWJ/EeQrJh0bKODkyv6SirZp4yBXO3vegwDBncqCzY6rG8wocre3Mc2whgUWFZJP
	GeIaW4B6DaWDy4BmgtEp5dO1cBDYsRoqjekRyxQYW2OPzp1f3yqOz32OpN/bMQd3
	BE7ta8+CCV/lZWr9U0f6nd36BD94C9qJ5H6oppBwGXHz+1y7MMwF+LD3Qfin6D4i
	m5XOkvCotPfC0Zt3sfC/zGnfgaqCgIwIbNGU8zcyyoG2DQjSCIst66wGAE2g903Q
	5l/3NiTG/JHGKG6GGYB+OzMTBd78tkxhVHA6goNTw61WHMfuPjeb7KfmgFoq21zw
	y9dMdg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrscvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:08:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938fd633df7so14857985a.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726137; x=1790330937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQNBrq3TGaVn7wbkyIZv4RT34n+BbDeNfTBJBIwEyMw=;
        b=NOmSHNl6ZK54KZ2VeETR0Z52EQGHM3RUGwrknWqPFzicqFLHXayuiFZGCf4NjOQIat
         l7xLvQYOIP5MAJREMxsWJeVqegRN54+UlcXeLjxgZ8DtlFw4FErML1heu61+UjmnxyPR
         N92WpopPrpgBPlZK6NcfrCDaRoOtRDEDdAlnB8JX8u1IyYpw0FjlfwIEy+UC+QV37jy8
         xYAlkZ3Jzj5shdvPcMq+bNcK5WqFzCyCADiKJMyj6hDPNrbHgWXob9NPBUQVFLGvZaHM
         cRbIM94YD2KhnkVw9Y5uf0o67ohszLVhS+UUagGA5f9VL6YfHq0tVoTsNPTD0pdYPVGB
         wDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726137; x=1790330937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQNBrq3TGaVn7wbkyIZv4RT34n+BbDeNfTBJBIwEyMw=;
        b=zj3lSiycFyqg2J14D1La+tkFfS9HwXomxBkVRH6enN2g3GdXmQplx4K6oN+bFKSeDK
         ZR2ULk6cIkDvCBBZU8K2+g6pd2W7L6nty46BY6zXHkG98ykMO5AR8f5GJlUrehbwexms
         SYmpnTK2EaAl3uh75KU8kMk1WZS9LsFLoPpwid82QfLMAt9DuwKFIB0e9se3AsCqymQO
         penAPtwOQdPISjAkK9er1JS5bVX4VcMLUm61OufUJeDCZH+zIIVBvVho5RY7oGACJ8mQ
         NAk1TJm9S/RtHIp29QDXp1dhCarXxsH0abepJJwyNmXYqd1Mk1WWhnmOxftomAQX6DNh
         qVSg==
X-Forwarded-Encrypted: i=1; AKwUvBzqPqHYFQ0heQZxw2iFlTDoe0zLg7SA4tS0BJ4DY5BRRq+vKbO2FOMJs3lkHhQTvvCtbxSoxuAyrgZd@vger.kernel.org
X-Gm-Message-State: AFuF++nlV37eCbSY/FKbIzMDIwRrZit20gXETDvefH/OM8LGpUy+BkQk
	jb1oGpxUtLYHJFUG1mEOsgee7WSJT+E0vK7gixnYAcU5JMTcdE2npj80G3sEk592JnIogTSvxRf
	OIj1GGsGW3LOkGAtSnC6/IaroXMKRVM5jNWKPN2axURCsHFBiGqd6dM9OzfB4PTWK
X-Gm-Gg: AYBFou1O156nYY9aDkbUT72vmeh3s8qgzApzqB29y8SCwJorhNL4uabAg91RUSJSC3k
	qFadpTZt+xbM6CkyS2d8szh5/ncnFl4BKTEVcivFBWAeMSGMU5XVMQuXtujdNvFuq0agea1umkL
	i/QYcK/qVal0AwOf5ZWuyWwEGRItY3GATgcLj51PLSnweWnZp8p0+hCbqiCxWwVvb5nJMgGKMyM
	uMpFP8oB57XnkX/KAw8Qy6Svned8QK0DVQxfR3DnrXo9prFyhKHKogcwz6iSo5FmqKTbE2LXirx
	mRwwp5yrfC32ERe3nWGjlGrrzeTlzaNMA9BeSVmfTKXbx+eoRFD2flROwZ+kMaB0FsRnyTNBvtf
	OMHwg+g+KfklsUJqrM4e2oA==
X-Received: by 2002:a05:620a:7086:b0:939:c8b8:4639 with SMTP id af79cd13be357-93be0743055mr182388785a.4.1789726137245;
        Fri, 18 Sep 2026 03:08:57 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:939:c8b8:4639 with SMTP id af79cd13be357-93be0743055mr182384085a.4.1789726136760;
        Fri, 18 Sep 2026 03:08:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59762eb7sm610295a12.24.2026.09.18.03.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:08:55 -0700 (PDT)
Message-ID: <e7351e2f-fd9d-419a-b274-abdb842bde20@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:08:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: msm8996: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-13-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-13-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad0dba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX6As/7jwkC7dz
 J3aplnwRLoRiR9rxYRdb6eE/bmUvTz9/OxGpzWp0ssnFVfzZ7Kz1fBpzerKBu6FjCBzrSUF4239
 9SsWUnB2BEBYkwSLpwje0rzLRcLPlFELNihsAb0VfbozQmj/K182F13vPMMN4ayUKqpWzEkWYHn
 mm63cIpcvDktQq4qOO0zLVLOCyIVRlc0u0xshqDrpZ/jjRWz/bMwdjXycTmga4QnOrHImom3BAF
 gY1HrRFAGa4gJzYq+QjWwE/JnUgdcub0fYxEuN3iw5yyCzP5VkkBVytYP9ay4lFXxL65/kEcspo
 yRLlzoZvuIjBguuBG7/hJ2zz/IWUkiyHGkezPZ9vIV2gyx7ZkdE8tVfvnAnKKeAx17/lOI1px3r
 XELm10XDnLHLmFiEJFFC53tDZHm6EcIarJlFRUBtLDfSEqt76c2DQE/VnE/bn5viVugG+QgD8Rp
 xwMCPzypYvnn9QbdZ4A==
X-Proofpoint-GUID: Bmp-iWOXyyyJwbxxzTKASrSxUIRyqx4m
X-Proofpoint-ORIG-GUID: Bmp-iWOXyyyJwbxxzTKASrSxUIRyqx4m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX7GPNguw3IBjl
 MesUnNDYzluPj6AJHtI5X06mnUbeRnt0asJc0T5jHD1pLAU0e9IwrvudhACWw7XprGmsE6CEsOi
 hmqCLy5SPcgWemVz9nn9v8rKkZNhSrc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0, pcie1_port0, and pcie2_port0, adding labels to these
> nodes to allow board-level overrides. Move perst-gpios/wake-gpios
> from the controller overrides to the respective port nodes in the
> board files, renaming perst-gpios to reset-gpios to match the binding
> used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
