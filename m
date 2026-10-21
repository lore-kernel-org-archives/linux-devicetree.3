Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591674;
	b=l/YX7ahXcykTgzeSMST8Rm3e4tVNKYTxyHepd2foI92vHcbPVW8xbeyb3qtt7CRq0zAe
	 B7Dmexq7IaNmIFqYBP4BwWcBp/QIAGOZzV1/Bi9H8CnCgPwePMvBdAdtBASjooIlWSSQ6
	 yAAXpknP9aHxyMKzlRraMYOFqBGyF5x4hTqWCa4ATcWtm2SiomGQVxHJKQXIWbLpESv2H
	 oOjP+l9uziUcgpB17elvOolH6ScwLUvSYmZI7Ob/v3RqM5CUGHYOYh7CRRxoLgLZRFMtE
	 WfuFSvNAYyu8U9d8pcJPniBHUE+ZiB/IghgYBYIEp3TExTFt4ctYnnaHwSCCDtrlsiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7eSvqShp/yz9VzClej405uB9Oat4UGxkK/6AP//FH+E=;
	b=VIAOjIE5t2o5x3wikhxCfAn5V/kSvZFzwx2h9AmLP0ChsYIYyLpL98j58+vq4cbKk5AR
	 p5RGphp8hpi6P7cWHBFuL6M++2Ickuie16rVRMqGH7cOg6Wj7yw+1a88bMBIsgpAKWWkq
	 J+vnCEl/TqGSX8FTOx2Ap0PyQtJW8M9RjV41x+EXgbB1KwnHjDaUSiDFbRkeLBAUPA85u
	 bfwIOxVrNtClkO0Aujxuv2fLbR6J5g7b5FknEwbOi++GHB+wpxnpcXGBxyLmpzb9Yzd40
	 A4ya82s/tFW6JQ3E77CSwafRyRf/tIQhLkPxsbI3gJ5DeHl4TUA52B6xQsmtAMtQVkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJ+S6J1h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XTM/7x07";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A77606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A77606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJ+S6J1h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XTM/7x07
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDN1Yo402428
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7eSvqShp/yz9VzClej405uB9Oat4UGxkK/6AP//FH+E=; b=JJ+S6J1hBjjE1k8D
	9PIiLcB08/81RGUIepCqC1EimYOLpRX/THQSTUYyJR2gU760cjwXeYxqUKvI4fvt
	eq/YrDBtYkWhRhBrvw4UmFRdkekPGvmkEvQ2SINM9RBSra0xAvxuh3w7s2Pl39bq
	Ykfh/GIyfLvvPnoFcxNq3/3GhdVe6Z3b2QmrHmMAV3ih9c0w9Ea8A992IiuTPNj0
	VCO4/BbRlMArJodXmBef/TjiyK0nVf1ziQIGwHvj6mAemfdTxOJLpLMVy5EERe2F
	+LhAbP4ol/2N4NVR22zIjNaNkyRriFKjzaQLiDQPy9+mmsEYHkRlCo29cYdSUEtM
	+F8EgQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vr6fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:07:52 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c97957d83bso28694e0c.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591670; x=1793196470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7eSvqShp/yz9VzClej405uB9Oat4UGxkK/6AP//FH+E=;
        b=XTM/7x07i5O7YXRh/glNLFgYvG+aZs3/73kMcVTrNfSxlrkiRGc66chPjoSD/ZnTx/
         S/eTefiKoF5IpwwsgTSEblvr+/zkxHkW8r8RX+QtUfEgY82BDdrQ8WMnaHJSkRtA/ZhL
         4B0hxfUmQpl4jw9GXqAE6griexZJ3jhXF4nONxT8bzfc0yGjlIeY8fBlFUZK8NNz2Kej
         DlURNKD+dTEp14hsZNRVL/whjw60Ha8CfbP+UaXsPvZJHFuXWZ6puUHFIGsKT4AZzWdQ
         uKiAf9WUkCJy3NifBDHneptBwgu3ZQpA5RTWSmx+TDFQ4rYk5ntrx8HmalH8lIsevYM4
         VrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591670; x=1793196470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eSvqShp/yz9VzClej405uB9Oat4UGxkK/6AP//FH+E=;
        b=EsDT0slCkO/iPvXwqga0+CyBH8SGAzb7aIOQiKbU9sNLwTGRh2NZnXMrhaYOiOoDQR
         7PH19ET/cyQ9hDRnteQFSIUJfEbJA2pCnqWVDkbK+5g4GGQVlU92bGOwtvgUhAULaoFv
         UPku7oC411pWIhGH2WtGs6ww3bh1CoGjJwL4J0poG59D6rchZrBv/n+LjDVw6svBYboO
         JCtbU7lk1379gg7eElpy5KgoyFvcLSvJWmJdSOzlmR0iZgPdLdFyVREJKawAgvjIaKOI
         BMkEVvrUCHjwYmoZp7MSbejNTS/uqboUeeU/f3nH76uHdCJ8rtta46SX/sG5V2HH69Jr
         jU+w==
X-Forwarded-Encrypted: i=1; AKwUvByp9hXO4jpJ8+QzYBhMvhtb1weGLR2PLUEPLLI+4vw3h7FrhhqmsrEMnR0PPOefX+qLe9YAD/ThLKKe@vger.kernel.org
X-Gm-Message-State: AFq9FYLEkXU2lKvqoQ1PUK+44d7UgtNLEN3116b+oq7R1nKWd51z5bP5
	fFbRGT5NGzO3YhFC25H/C3ajSWNNOQ/z52oe/mPNl3QameZ+tZIaBuoTjlSJ+5kXk+mj/+94kek
	2Blu38fIpzfWuSf5b4vJvcCZoTscTvc0baz8XKJenuhVJ+LpsRz2RZUz92AzHXGnT
X-Gm-Gg: AYBFou3o6GxuoiYwXOBpf4MPKeZtonQ+qc3Rc3QpYBh02AgV8NymazzVhndmLL9oWeo
	2zqKRANq1UAhzsswX0W9wD81ZE9J8TbU+qJhXWoX9SqBqodsWZXEeFbx9ORdLTlYtqfNr9jtJ2s
	SBypg9xb2grPmr/2ybEqiZHvxSQcj8D+qsUkj4t+eoQ0gdE2Sv3sVpsOyjaSwHdT87nOBoJWtM3
	zfdUKq7Tugecwct3uuIbTguccboxLr+CTHiC4yQD8ELScu0x40cCr6n2U714EuzW9ucILDGMxvI
	XRVJgGlEVSAmSoUhBPD3AaB8sRWiWpL2ShiQ9vefXkDtz0qYTbiB4oVilpIiKIzxwLy6l5ABtL+
	Z5Y3qrsBQLdU9l1Dtg5Dagw==
X-Received: by 2002:a05:6102:1626:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc92623e94mr698638137.3.1792591669708;
        Wed, 21 Oct 2026 07:07:49 -0700 (PDT)
X-Received: by 2002:a05:6102:1626:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc92623e94mr698606137.3.1792591669237;
        Wed, 21 Oct 2026 07:07:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5625cesm6971266b.39.2026.10.21.07.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:07:47 -0700 (PDT)
Message-ID: <ab7c536f-f57e-4560-8d1f-6ecbf2aa4b07@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:07:45 +0200
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
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
To: Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20261015-shikra-work-v5-0-5e075222b60a@oss.qualcomm.com>
 <20261015-shikra-work-v5-1-5e075222b60a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-shikra-work-v5-1-5e075222b60a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lwpgDYNv8rA-2Xlgx9H0-Q_g68BVPsE0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX3x500Q1nzH5F
 TbfLUcJl0OcDJPvNbicY7ugBRqzgJWH2IPjV5kdzxCEgg/mgxMpROMvbDVQ8tLBJKzNSKX/kTSw
 7GTCZEcVuNu7yWLq2y43zrJvuKOSw+0=
X-Proofpoint-GUID: lwpgDYNv8rA-2Xlgx9H0-Q_g68BVPsE0
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8c738 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=evxpD-9nWyVjaAOWT8gA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX/0D8+2Z4mfXw
 ZETVxbd+IfMQsV1ysn+0l4toPNtZz0WOhhHzYOflmuT3I4w7uSxD0bQyqMO1Tk8toS53EGWu3k+
 Ruejuiu1WEE5nnhdpoFDcRr1/ZpxSzuq52N29+QRJAsj2BA08Sa3C1l20z7/N+d/B8zhl6LFOFR
 PL6gSjOLeI52DPTqzMRO2YhcX9Bl64yyBKHd1gCdLGuXc9p92O/Yxr7MOeseTQct2fDvYUr2iCr
 QBsoemANooLjsbSAuflyiWZHW5/dn/vNk/8ti0YQPjyDUlRpI9qv58JG5tsJJ0ojMGyLgsYLER4
 azUTWqg6kNQZoyVw6j8OQpJO7vrpWimzlbFcWreGSHr3sQXr/RqplZODGh5xx1U4oJrAU8ebtNz
 rRHiJfyU2LK+fI4VIx37tllap7AiZBlm/jZNkArNeerRxnMWKXBZLPQIlwqxAHI6zshFdsCn3Ja
 JVuc6Ilzzt7PjrdCUuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210056

On 10/15/26 11:15 AM, Mohit Dsor wrote:
> Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
> EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.
> 
> The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
> a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
> rail. Reset is on GPIO76 and interrupt on GPIO85.
> 
> The bridge receives DSI output from MDSS and drives an HDMI-A
> connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.
> 
> Regulator and pinctrl labels use generic board-level names
> (vreg_disp_3p3, bridge_irq_pin, bridge_rst_pin) to decouple them
> from the bridge chip.
> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
