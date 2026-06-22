Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7804A35AC10
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120227; cv=none; b=n6h20U9IHIZwLimywy3ZMdIhs8wnwt4aWKxrmMl79cbfsUnfzdo9TJClvHI/YddcNHqtUr5KYuAeIbYQkDA+Vitn+kCKRiVYXTqUnkhewQa42de3CWQz092SjKojk6z3wPRzbRrHKtbg58+nysmXJnkFd25wAOL1fnVtW6+4DFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120227; c=relaxed/simple;
	bh=c8VS4nGyTnFP4AdAXFYPPQiqy6T5UfeU1oAjQ6t7VYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aEuA9onfYLctAFZ08ICKxlo5CRCWYYuoYmtEGXVzxx6JtEvuy6fPBgSGIOYz697JQFRYfQroX/UgKMvk7rQUqmXa8LJYTHoX0u1U2rRhmkIamuurA+JYrVQ712PXhj0OwicRR//cPueXk6FDe51an9+VRWwxEuFvDmRZRnb70z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HXegT6xG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuJPJbOq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HXegT6xG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cuJPJbOq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M6GhC7095292
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6taM6ef1bN+QxPt42w/CWNu41IyMWuyWfriKooZFKWA=; b=HXegT6xGcVB6E7hC
	Gp2CaioZvp3GSkV2kFdGr5VUXmdhLIodZY++ds5Ben5cetNtF8oCyUs9au6vfjz7
	8Addq2k7B79f+bVrjR4dt4DCZNM7ICCVmpfMuRjZBrqiM87XVZJJfjOq9lCARKLc
	u/CfevFZu/WjDj94UtadCxcZSnP2C+oROMOG6e8QWEYnQOlTxAVRv+6fllNCkCH4
	DJ/6Y3VYk4tEBe012D82r0MeJnOb1f7xAu6tJ3ikQcnthdXbgeUsr3sD/lXK1puY
	F7X4/Wzqadmrdw9vHBKsyd3yCDoH91ne+Xz7iG3EKht9lYesziAhfOvEuVuEn4Ga
	1bT3fQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1rtw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 09:23:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ddb0711609so24465776d6.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 02:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782120225; x=1782725025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6taM6ef1bN+QxPt42w/CWNu41IyMWuyWfriKooZFKWA=;
        b=cuJPJbOqqqc3kp+7l9/1M4N9olzKQe1F+2nC8OS8d2zguxO6EFXLvz2IJyzSXCd8Z9
         ernbPxAPCk1Pbr40H+zA4c8Bs8rEqm8uLSIs374P4HHEtcrSuxBsE01O1963/UFj70nP
         Ms5QIkw6wA45AhC6z4lNXbzp1KEtBH/V8q+7NBCogDkDSDU7zawjjR/E9SJzHQI9RRLS
         f3f5jhpUvC2xrE1EwurrI8/q7X9RCCcIeyyBJsexMKg8B1h2b9sDA/c4Pr93id+T663s
         DuFiUGacTGLdnkuNHZPXGc5SvM5hArE74Omim4IMKif259LnwUymRyMA6BJs6JyDBtrY
         4N/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782120225; x=1782725025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6taM6ef1bN+QxPt42w/CWNu41IyMWuyWfriKooZFKWA=;
        b=PTHC/Txo+MAXUT+jHi8f66EBGVoLu/wDABFbkcN8n3Yc6+wroULxqUVjnk/nUsQo1y
         W3RL45Pc3JJKHB3J/1Xjc3qA10ZM+CN9q3eHhEF/MbBFCtOEc3IRgDA+p1tTrSLiomGU
         AGE3xuz753u5Qq23K4/rCZU07p5/72eXO/tPR80HLpVYL+74W3hM8WUSLTjQLwtP5IZr
         We5Z41nk7aJp0zZJWkX8Sp/S+v3wO2yfIVpg1h94iXWNDUCRt+dSRUPDHUcymi0kLsXY
         fKa6aDXsPhvYS0uHcdpXePv0ADg14eUZ2zfjgpCFkSadIqYrp8eIgU8XG4LqsOMAa6BV
         cbvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vP1utZIbTBgxzF55eX9aoklX2Wf/6FN1fzYI3kccZ4Dd+M+eHxv5R6tnBu2kaaZsKQKqkNfEGN+B6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgv4ViIDeFAqjXpr5WVEPehG0fTuJuyg15bAkj6ItNHUsxNA1N
	NXV0YFTR+MXNhNCodx2/1rJNXfn9N4z2t77jIsVLEhXy7lngFnbP6VQ/C8OXq6/BsRDETkUrqWs
	+cjFJXOrGVhx3C86uNKXVSUd9A/lM/8WTOr5XHfohn7u2BM3TR7bUy3JtVgdT5wmH
X-Gm-Gg: AfdE7cn6zEsMcXmbwzxleEJbb2B9SDX/u6pUVAyQOJorTOhpUyBrdFJHEMaYgGX0AC/
	BLhCM2yJnuEPNbrwbbc1+yk4OUgWbdoZ3CFBPISNAHt4A6AISCkkp5GDHIoDClmOZobe/dv+3qy
	LADZewIcPXxj4KDGBJw0mgUYu4CQt9v8B9z8DH07Mja0rsKblxTQH/AtrbA2GUWWw3JBk83XEPM
	CsxCytYANn2B+F1Hrd9vxQzinskHQwZdNXKDnp/+uA4MVH0ugq4oTq+Q4O+wuNakFFKgEVDC1Zb
	pxJtJVNpTHUpKBLrOLONZLyTXB9EPuHRYQSA500mM5iBBkzCGJJf7VvyY0p5ClBDdHJmAQpxA93
	ZUlRarv7tc7NYwRmZXGRWUylKEtu1fQ3pcYY=
X-Received: by 2002:a05:620a:3711:b0:920:798b:e290 with SMTP id af79cd13be357-9208e49a532mr1311759585a.7.1782120224757;
        Mon, 22 Jun 2026 02:23:44 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:920:798b:e290 with SMTP id af79cd13be357-9208e49a532mr1311757585a.7.1782120224342;
        Mon, 22 Jun 2026 02:23:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e4a14d4sm325245366b.7.2026.06.22.02.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 02:23:43 -0700 (PDT)
Message-ID: <66245d8f-7c04-4db0-95a2-e5a43f236a79@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 11:23:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
 <20260620-glymur-send-v1-2-fc4a2cfd107c@oss.qualcomm.com>
 <erlfxo4gcvuaakuggrgroniiwofdrocgtje32idibknj7kb42g@pdh7fo4x6ief>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <erlfxo4gcvuaakuggrgroniiwofdrocgtje32idibknj7kb42g@pdh7fo4x6ief>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HYXigV9MCzfchzvOVL7BClBsplVcd5mM
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a38ff21 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hurwLpg0IFdDxU2MNX8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5MiBTYWx0ZWRfX8NNNGTx9YrtQ
 0FOVGv78XbeBMZ0Tdp5Ip9LaelCNjR+nF7+yW4ePHG+FwzQQN4rtdcO7D7mlg+DJ0DCrgleIvZe
 EH0Xr2JajEtdbP6FXYNznCf7XCfYAUM=
X-Proofpoint-ORIG-GUID: HYXigV9MCzfchzvOVL7BClBsplVcd5mM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5MiBTYWx0ZWRfX6tHoRGAkloDH
 G53THzyHg2qmdIpnbj294etYPs7iW8vp999DKwpEwI6n1IjeKZGJf+sLdqyAD5I5ja6LU4XpT4Q
 tZo7kVB8W3S8t31UVwVd7TRcyNOBRdZ+0/iAjo9RAi1/v9Qt0OctFeGOtvy+upmia4CoBWT2JQm
 m5spUxY32kbkjRJ9ortdpaPu22V5reDeg+kcCMX93y6QrnTQlNPuKb7hv3CLwiZIu46aqHRJ/7A
 L3C93xDJU78XOPw/NYjPBRxaxf6aGlJpTCYn9xnR7Yl2KSmuK5r+ON1qU6Vx91tWRPs5EIuy5+l
 bQBVhpsPq8UOuIPHtgVy2SE2diTTsRacbqxf/I/YoeSa1CI05lMU8/KmsYxrZZ41KSJjTyk5qxk
 WqhCZjmXTlb3az+kmhoEkPAX/nd5UcOv60rt97gxeC2TFGLYEzPbB6LMW8dGMmq/d4dQwTbLadC
 Kteio7sdpFT2vxiCSPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220092

On 6/22/26 10:18 AM, Abel Vesa wrote:
> On 26-06-20 21:50:42, Jason Pettit wrote:
>> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
>> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
>> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.
>>
>> Enabled by this device tree:
>>
>>   - internal eDP panel (samsung,atna33xc20)
>>   - 2x USB Type-C with DisplayPort alt-mode and USB
>>   - chassis HDMI output
>>   - chassis USB-A host port (usb_mp multiport controller)
>>   - internal eUSB2 host with the Elan fingerprint reader
>>   - NVMe SSD on PCIe5
>>   - Wi-Fi and Bluetooth
>>   - HID-over-I2C keyboard, touchpad, touchscreen; lid switch
>>   - Adreno GPU and GMU (Freedreno GL on Mesa)
>>   - audio playback and capture
>>
>> The HDMI jack is driven by a power-only DisplayPort-to-HDMI LSPCON on
>> the usb_2 combo-PHY DP lanes rather than being a third USB-C port; HPD
>> is on gpio126. The LSPCON is on an I/O sub-board with no I2C/AUX control
>> path, so it is modelled with the generic simple-bridge "parade,ps185hdm"
>> compatible used by the in-tree x1e80100 HDMI-bridge boards (the exact
>> bridge part is unconfirmed) and it needs CONFIG_DRM_SIMPLE_BRIDGE.
>>
>> The &gpu/&gmu enable, the audio nodes and &remoteproc_soccp opt into
>> glymur.dtsi SoC nodes that are still in-flight; those series are
>> declared as prerequisites in the cover letter.
>>
>> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
>> Assisted-by: Claude:claude-opus-4-8
>> ---

[...]

>> +&usb_0_hsphy {
>> +	vdd-supply = <&vreg_l3f_e0_0p91>;
>> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> 
> No redriver ?

Right, this must be bound to one of smb2370_[jkl]_e2_eusb2_repeater,
most likely in the natural order (0->j, 1->k)

Konrad
