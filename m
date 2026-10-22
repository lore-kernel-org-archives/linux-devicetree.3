Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659954;
	b=sUCHLAtr3bmsKdD8iyGFBFCYd+7Zb791jcsqpDnYruOCeKP6eit+Mg1m8F9oiU9nhK0n
	 vBc9HJusTy5Am32stsXRglaBEPJA/OqLNq10E5Gah9pLrjXtuu7GqAXHkd77NUltJzZ2x
	 3bFZPVyWemWLK0IpcoYc//yKeb1dL/Sdh49VuEOj1JF7dH6xjkWl0MpzN58tAv6BndRix
	 1NNNOE8esKw+9imbzwcLNfQVc74lt/WQvmdBryXEMaf4FsgB3SJQUG9A203fSupvQuhvq
	 zrMEt+E1gVP6ePmSeMMSdlHn6ZzeBEHb/VYGMd34iRX2bTGGYflCtYr0j8n9YfBWIRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=974NUlzB6Uq3BGLWRZQayoTrMdo4vO0+DzseNpw9CgM=;
	b=22j9LVJ8Avmho3nJsrOhusJzl0ewNRa9vXu0drFqSgXj8I5ALzTdre7O2oM+zhS2RrxU
	 aXbk1m3nkp3LCCQy/IogRnKvtDPGkgUjCv5da7HsZQH3FdogOoBkAInLzAiCMzEeYLlvt
	 gE0ie2nAwkMavY+x+BFCijNOUnFg9Zyh3IWanaCJBbqfhVREHc7gJtXlPOm+FxwnORg5N
	 2rVI0fg+0JFqN7/lOaAFcEzD17RRUo74Wx7X6sePgzsytI2jf5jrF8Kz+7cWje4vroCLA
	 ldMiL45nlDYTbx/AeiiEsR504sduQX+ywLDbaiI/qZaD3DDYP8rvXmyTsSGSf2RQY+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=liVqCkre;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H2d4Ur0H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B62606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87B62606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=liVqCkre;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H2d4Ur0H
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M705IP4110621
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	974NUlzB6Uq3BGLWRZQayoTrMdo4vO0+DzseNpw9CgM=; b=liVqCkreZmk/rJxZ
	bvPqMCoh2XwrtRWPRKpDCbxgPz1oHtOvIFzl9Kx3RVMLTIFPlLaXTFOYr2eDG9NJ
	dNHcWMR5Hv3ti6aBvJc9IUqP64tEZTkPMZ1xtMysbOC8JRL40ZmiecCe3Lg0kgXo
	uX7NWPGVrxTPTym82ehyZsgVurN+zMCsEtsK1sCyDtIhsT2sUGjLCw6qYll1lOme
	h+KbouQO6D9U1NtBzEFgfrtfntTNbtvMCgW4zo+PKumPmJR9xDQNtAUgJ1L6n3sG
	PXQ5ZHE/OFB5agtBUTOMGxw8yeB7KNbBZ1spYfBB4ZEzoXy6NVvf9Op3tGCQStLZ
	4sZqjw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahmjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:05:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179ef12a03so6400716d6.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659953; x=1793264753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=974NUlzB6Uq3BGLWRZQayoTrMdo4vO0+DzseNpw9CgM=;
        b=H2d4Ur0HLY/OpwYtUQF7x67o0xPAj8uMqnIdFSbMLXHU5lSfDS+ATwZF+sLEZyvhUx
         NcouU7CdlJtarFxKXdN8PHdTq+ZJchFhogyhn4Y8batvYuCMyltgUTYVeuj5rg/WE8i5
         7U4soUHVIget/zS05qYG/tRaxY2+ekrZQHEqtt13d81Pzvarlw9NDnECg36aLvPXkbe/
         2yowN3zWwH0VeQayH46mz8pb1WAIV9rJKkB7lhIBkCn43YK1ppAuLZVTWy+lPO8lt7mq
         KlEdoyi0IOMY5lI2mZEboqGIFkrjtDhlPZqbuPAqWq8HO+r6SUHeQ+TW0C/kBdpSBy2E
         /11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659953; x=1793264753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=974NUlzB6Uq3BGLWRZQayoTrMdo4vO0+DzseNpw9CgM=;
        b=ApM8uiJ7GJSQ7lykQqt2V4wINXXZPyfkuhIuu+1znGgzzIxrWLtJMyrSVZ5BzImfyK
         RTZG8yTQTZlrkXpZZZ74+/uln84eDC/ARXmepb/GUEoC9NdeXsH7/7X33UE8f8HiraoC
         x2CxvERwMLznWr3kuS/MXoA57tcOMRtF0pohQRJLoYtmiEmEtHyUGvK6eIltDl1bVmTJ
         dVQ6f9gPI/M/hMXE1Zl9VqJgCdVl01cPBrw6OfeWN8+bchQ5AIeYrp0T1VHUKfvzOdVN
         s4wUdOekMGctyzYFwgt+bv/qs5nARuXcGS9c0As+63yWp9oIctYKP565pnjjGwOlndHW
         SCpw==
X-Forwarded-Encrypted: i=1; AKwUvBwrznru83AgpGbyi2aAQLOl2gHgwktyLLA1giezcKxsi8OA4bvE0O0SRaEO179wZc/emxFzWHy5uNU9@vger.kernel.org
X-Gm-Message-State: AFq9FYJIK0YVGgr6sze6e+5oKQx8bDWBcUZIopV+uAw4Y5SelJhcrlTq
	qXxmOsiapTzGzsfGgsSU96Qp1VCXFnPRHfsNSnNAka7rCIMkiwDJYCEI9CjdeQASq7r3OISLGRZ
	u6CcSUzq1tZeyQqU0IqVezdgRkB3SzzkC8MuWj9gdV8Xn4h76qU3J97AAnDiwzvfo
X-Gm-Gg: AYBFou0qAyvuvu5cgMQCBpbidkXT0lal9w2OQIRpo1FikGnqM6UJA5YysZGuu3na7m4
	/lsI9uZVkcs4itURwtiwz+dWTY3L0PDalqjiZicjCgP2/XdVPUaTsUrLGyW7KsRAcj2mY+Dvwa4
	pEeeCF0lKFKSADD56GiBq3p3nUxGjD4JwAdG/Xv9EYeM5MBscp5p7vfuupiCvbnJ0xLxhWToNkV
	eOQp8F/TZUuGRbcHkkmUdo9iePSPlOrrfphuSt4UhLALV2sVg24rAkuZYioTU8zYym+xSP/70s+
	hFAWCKaMcbvJHj+pnbFtoKHH6RHlfcNR7vtUTH7syeTWLq/NBV/6UzNFllVEWEXSRscHF0UtKEm
	pRTjTaBgg2ghWjrC3PJlA1g==
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr988865985a.0.1792659952756;
        Thu, 22 Oct 2026 02:05:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr988863085a.0.1792659952237;
        Thu, 22 Oct 2026 02:05:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40316698esm1638748a12.33.2026.10.22.02.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:05:50 -0700 (PDT)
Message-ID: <741e2f4a-c49f-4a4a-a376-8e986a609bf8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:05:47 +0200
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
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: nord-ride-embedded: Enable USB
 ports
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
 <20261013-nord-usb-dwc-dts-v3-4-bcaaf3faae24@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013-nord-usb-dwc-dts-v3-4-bcaaf3faae24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX9uuG8SKaoqa2
 FeCoYYpJkcfPCfpGjhWbf45rBhkD9QINkYFYUeyFxjV5x7mu19IPcg1/bB0IF5Os1Z905FZ4DlE
 H2cKyd6DCTxDVH6rzqMWj73ZmC4wsrWbjKmutdyJIVts3VKglmSAHQ6LoV7PlwM/oxikrv8ZIJX
 UQ9hd0fVs6CziUSTDSkDDz3wnYPQPk29qJ1/X6zrthSDTaaeQFqQNjgCrbQMaTkA8p1+DxUtKtb
 Gyo316oMiORt+G7SZl1Q5zncg/pFBrV8ctmx58s1QDVhdckM5PbZUcEVYkpHem8l0plH+68pBP9
 X4dMkjfj7zVR+RD3n5lZqgt1AKlp7dEmDbUWQCPebwdd0FeOdpXecYIw0PldHiKlu7zgXdZZvuG
 l/h04urHdrzHXLFmcuvgIX7VuUGaYmbqEm0dIPiTVFvB50XQ9+4/hweiMLXT/dKM3XuB7M6KLKZ
 Z3xf/HytJUlEd51oMyA==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9d1f1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ix1rd1RWtsmLIZAbYf0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: RZ1eB51oXVjbvdpnTAKWg_c4EuuwCBW-
X-Proofpoint-GUID: RZ1eB51oXVjbvdpnTAKWg_c4EuuwCBW-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX7dlitCt+XMFf
 oJCM+9Eof0tiIGk6g36Bu3jP8Ip1xYElO1iy59xyFym36CYUHaZc36soA1JmoMhglRK5wTXlrks
 U2/00+SD//wji2x/nvg4a0D+46poSrU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 10/13/26 1:34 PM, Bartosz Golaszewski wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Wire up the board specific pieces for USB ports. Enable i2c9 and add the
> three NXP PTN3222 eUSB2 repeaters (one per USB port) with their 1.8 V
> supply and reset GPIOs on the PMIC GPIO expanders.
> 
> Add the onsemi FUSB15201 dual port Type-C controller at 0x50, with
> its interrupt and pinctrl state on pmau0102_i gpio8. Both controller
> ports are wired on this board, so describe two usb-c-connector
> children and cross-link their HS and SS endpoints to the dwc3 HS
> endpoint and the QMP combo PHY SS output of USB_0 and USB_1. Both
> controllers therefore run in OTG mode with usb-role-switch.
> 
> USB_2 has no Type-C connector, so it is configured as a fixed host
> port. Its VBUS is supplied by a fixed regulator gated by
> pmau0102_h gpio3, kept always-on since nothing switches it at
> runtime.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
