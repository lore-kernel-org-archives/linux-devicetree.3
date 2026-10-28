Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199159;
	b=5mNh7To3+M8ko14cx5lfRsq9WzPgfnXidzQBMeUhRmrD4rpRr57QbrjZJS7qMGW55A63
	 9fXOAmzHgSIwFy1HFjDvx4CyGu2PSRlEVgMCbCrV1MJny9zeNRCQdr7pfxFvJizuDS7xa
	 K6XJdDRvtVVffTQWT9jdi2pRnctcxGj1gVmydN+tiDP3RGG6iFEdrrGNCa0XNBSOMOxb2
	 IBN0LNSVTptMclu1nIyIE/+TNiZNcLgoTiSCmOeM1O/od57OsNPXQks03iW1n4A5QCvpE
	 DGju3B+rkM6/iDeLs25SrPcncIece/OZN+nqim/MA3G0YkwPKTSZFSJ3tF/HZyrWD0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199159;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MXocowpL+rI7Z95Ap+ST7tABMAuylPLkGjTudZ5eSL4=;
	b=VEIEHrcl5hRIkkd78SozCwop4ggALSbPASWgTbvJ7Vpp/GQ6vCmw3JCnitorGfAf0QKf
	 0FOju+gCE1EkM/FfJnHbhyXYd6yUoTrUQVpOXAvpGy72tSlrorW+4CpIH3PaQGqjrx6xI
	 bqp5aN6kqDefSjX+kSR90nKw02KDuFMeTvoF6L1yCMVurB/gXzF8gpY5dYJenSdJTqYe2
	 JRQRU1WfwA2+XHsGm5YzsQuiuIac7nyCuo67DoMW92jED6qjTI5pb8Q/PZz+AjlCirxP/
	 kdQHKihflEZ3XpOmgen1uyl8jXFZJXEvjhOB649Jxa1MfHAj0M+d/L3Q8EUrK7kgGcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FCttlUdf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CEKZgUCn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54A9606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A54A9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FCttlUdf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CEKZgUCn
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe5Zd1053342
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXocowpL+rI7Z95Ap+ST7tABMAuylPLkGjTudZ5eSL4=; b=FCttlUdfFxPMKEgN
	fso/1YYi+kpRfncMw0Ru51+XqAYw5WA+vmk7jWl0H4lWSiDEx9gPwhYyGkzo/VBR
	je5eBbD2efYYLgCkp+RUfuDE0zBjKuq14I6BSeWEmqRq3C/FBhgl8LCl6ekyfac/
	comCXGmbe5th7frZoNV1AuZ4RvuVN2RUX3/cWiRyta2qNlFZgGD4pcDSkcWebvNt
	tdT2sDoxeA81C+sysW0cWBpEXDJlxqvhsuHBUYR6v/VnEcHxuyQfdJU2P9SxDU1h
	Gx/fb9nDrqnQxb80U+U8Khxp5UqrWuaCfcC59d7t+LzzNQEZwLnmw7LY/EPvP93x
	oknTQw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw9y9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:52:37 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c97957d83bso91225e0c.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793199157; x=1793803957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXocowpL+rI7Z95Ap+ST7tABMAuylPLkGjTudZ5eSL4=;
        b=CEKZgUCnMtpoKoKJnr1475ttjleaHNAvaXxpqmy/A0fgmr5srpPVATQ9CpkCPcW2EV
         udZyqryiqq3ptq7fI4p1ZGQuCmi1eJxe4x4EfssIIj14ST6nPZYrlLZ4xEpCwxJldCCw
         oOy1a9QFD4ubLuzytg6BIzyVA8HhpvVyEVaf/OjfYlKmpUuayDNAiBbERhZGOIogmRR5
         4a2azLpFsMK1m8GRdfll4cTQD4nWTxKZfYq2K6KAACimunMNSIwBC1Ive26tuV5B73os
         5gg59SX3jCTMJX76H3Mj5ONnBVIfPSYbtTyzNNxYR9A6EuhRMgB7JaSmFQ67vQShBdba
         qtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199157; x=1793803957;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXocowpL+rI7Z95Ap+ST7tABMAuylPLkGjTudZ5eSL4=;
        b=pwa06vSJr646XKN9NLynKscP7wJ1jKqqyOceYiXV0Vgm+TvoRJ7meQ/3Mg/gSfxozd
         C8+o7iLcz9k1w5eegFBf1z9qyQ+avf1g4BHjbuZJOK8EJK2SlvKj1bmGSULADgIDuDaG
         a+gIEBG38qP2CZcFn9k2BVV5iGjoWxzJwXFZ55dMuEjvaL3I3jWmBPyB9F2A3K/TdUBq
         TXJ1TqmHKdiThMH7ALqx2610sBpp4vVwCQX30FzdmPNHq3aO7Jbprbg0JSBTfO7kAyZL
         GhZK91rciv88jr4Nj3x9mlgUM/fe/+Loe7gI3L4OjGjW6kNU3mz0jwT/ESpchDsLgVJI
         fAzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsWwRaT4Ogdi3HOD5cJUuXeDPPQzruKKvggLrBi8XPqTXO+GM+IFtHcRKST3BQr6i3NYCHC5dhdSRU@vger.kernel.org
X-Gm-Message-State: AFq9FYJjX4c73KqueJ20tXVIKtaWVDSwlNWDc4Krru0FQUbuxxtXeDRw
	g8NjXN8swDEQlwc2xmiWzw2SLa837fSwLi+L3LUfE5cALy9BrQ8J9NpptaiHHuupmWhak15njvi
	IZY/RkY23ZTaHcYHVXqqNRVaUq61VW7W/qU879kJT94ZeQRNFuYM/EPSCOulk1+yg
X-Gm-Gg: AYBFou0qgRzke6tErjbb8xJ8eVfQHUlzjoAg+Tlui1ddodSRP5048WuGi+CxhdJ0me7
	VPzymt3U9wNrCFWWt/QsrUnjTvG8ZuXaWmK1KuNKwhrZfY0sdDRZKtoeYYj2gC/ZHtR9XIzQNC/
	0VagLCOwNLfc9w4uqQjR8L1MNZWCRp1MYQ74CkZyY8k9r2SDsmwWDBmChBW2JOutADADmmxXiLb
	xPWV03haozUsxi3me954TRNi/02hacuP5evSyk17TkqWxNW4GWE9t3hM9PuTZTzNcQjSSUk+gbd
	ZIV6Godkr3ZjPoZIeXsULKpH99+6qzUt02jT6r2QLC9MkKIgDwyfh1RupduwJXnx1Zpt5n+hVnG
	A7mK1JMFUk3wkb2gjAp7kyXDc53cvs3wJFrst1bMs8A8XoULWor2QKebF23emEGvtbz/u98o=
X-Received: by 2002:a05:6122:650b:b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec4c8fef9bmr1270568e0c.0.1793199157057;
        Wed, 28 Oct 2026 07:52:37 -0700 (PDT)
X-Received: by 2002:a05:6122:650b:b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec4c8fef9bmr1270544e0c.0.1793199156609;
        Wed, 28 Oct 2026 07:52:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993e89sm31881071fa.9.2026.10.28.07.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:52:35 -0700 (PDT)
Message-ID: <fe2c319b-223a-4178-8ac9-33a3a5fc099f@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:52:32 +0100
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
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add refgen supplies for PCIe PHY
 on Glymur and Mahua boards
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
 <20261013-phy_refgen_1012-v3-3-f28305289499@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013-phy_refgen_1012-v3-3-f28305289499@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zrR-tWVkYnrOwMpT5l8CKgbtYt_tXIyK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfX+ovT0+k6EIue
 1k6UNIjdsJ5dq8JaiHprYL2ofLJW4fh0J5eBA7uO1/TIpuiP6MLI/pnv6sbzuRmm7gHBqPo8SEh
 rym5ov4OjgSJ8QronmOZ+KLigR9HOhw=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae20c35 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1jgiRTNCPZbMTgtKrOUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: zrR-tWVkYnrOwMpT5l8CKgbtYt_tXIyK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OSBTYWx0ZWRfX8GhqzpAV4SSX
 QwsDv9N5ZbWEtXmOoF3nOQET5borJNVmfVvfu8tUAFwU03PrQ4rqMbhu14MHN8v3r1Vt3BSUuId
 PDND74vd+1vuc0JC4Ko2+h35TOEqvotK2r1k7pIMbiq3qAQFQNCipZrCTYt6JFYrPasIjGmSldk
 BcJF6dzOii482mfXcM+qkLk48SCLOJTl5Wg+GWCvqd8QfD+qHs1s+F3zdwJWKG/WseyYnzUyqoL
 VO7KXAwu9WS/v3urDiRmn5bu/2rnZ0F40XVF3Zd1ksOK1z4mOenjk65dplHBrWkh6uiJVLikfNS
 yI5VUj+3Va3Kw5JL86gF/AEAj0r6OHLmhHEjEAueTPmPRPR2Cn5ibW4WOO7uw0Wd633h18eU+zP
 OySpVme+Hj0ED0fOwSPTih65amYxNCwqO8lYVqCvo8BkV8HGil/G86ooqVWf3mHT+FvjveRWGUO
 ik6lu3oFgr4x1Di0uJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280059

On 10/13/26 12:16 PM, Qiang Yu wrote:
> The PCIe PHYs on Glymur and Mahua require a reference voltage provided by
> REFGEN, which in turn is powered by two LDOs.
> 
> Since there is no devicetree node for REFGEN, add the vdda-refgen0p9 and
> vdda-refgen1p2 supplies for each PCIe PHY node.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
