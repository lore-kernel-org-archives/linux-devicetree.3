Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251F04E1C9B
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980933; cv=none; b=sPiGFvU5Ogq/BsXW4Ungg5nqvdE+CpC5JwyRAKeeLUm5iHy+rSP2tGyNon1lHijWMiA81lKddHP26UaC86YzjoN+uZZxDJ77nso0xKj3y8cir9/F/VCUBv2+7lyMaNa0PwW6BahvjlUNQp8WhNuNfJEXG/Bpg8nnAe6eWZwjJfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980933; c=relaxed/simple;
	bh=cSxddKp4I0UCxp9ZyNQQ3VHE0rhz14xxQPIoVAC1g6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T8Px4QjFkfa/S0WqdMu6/AJh6Ze+n8gIE/e5cQAVcyor4EC+ml/M0MvwO2zV78MAI3hSJUf9NxXB0aqtsYCnUSbrSRfO4w+qkja7UCz4UT1nZhQgR/aro0BZh0zuRJPR9IesksNt2+F9aoQ++znl8m3x4jJU5Ve9cPwxooJUJdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hBp5+gY4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+V+VGp4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBp5+gY4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+V+VGp4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAR4KR466270
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSxddKp4I0UCxp9ZyNQQ3VHE0rhz14xxQPIoVAC1g6U=; b=hBp5+gY4ZSoNEJW2
	Ns0QHOcdMVFplW4A5yixPzmbT83GllJrMMhv1XYzDfDPxMwsIMpqvctjetopl7rg
	VTsyuhyeft8a120DfR9qYSNEvKxkDacKZnbcF8XELZ/Saf37AIWp41Q5SOnu8pzc
	/YSWf1MFEUMKq5nYOq1XW9qzPzFm7QgvMMVKz/4T/CkVj8Rt1W4n2hNW2jL7MUz/
	sF3+lS3IKgi+UXdn+D8FOU3U8vBwtz4+yOulOxXJrjb8nY4XQMbB0psGZy2EvPRA
	QOXdqPUdJL/EJTjP+arhDXnt1kKX55EYegrnW2MUIabMyHFS+hdkJu2oJkaeCSHP
	IIXDAA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80cre1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:28:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179d9bc964so13787876d6.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 05:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791980930; x=1792585730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSxddKp4I0UCxp9ZyNQQ3VHE0rhz14xxQPIoVAC1g6U=;
        b=d+V+VGp40l7PmkXrCeQdSp9jHHv4JdaK0nsSF4l0X8/nyQIkz/pVDSo8iFPv+OcMK1
         11lT/TjYPCkgAfO2mv1cxKDj0+04RCKvuBdB5yBNaG+ovWtbppH8dhr/w7y3reRifLkj
         u8uFa7kiO8OD/0gzwT89373Vr4/WKjTkVWEGIqdKlHNZGgTvVGmzT7rw7P1D5dPPGaI8
         kN6EtUyq2xCaLwYmyCt+FKZLZj7ZOMAo62S7Y+qxkkWgKanPdK+JUT1OP32OeApNO2SA
         7+oYw7x0yzroKFIqhYNhIPLEWK0b7XXmrktfFP26/JeTqnU4dk2GuETMyjrfIBitMS4t
         cCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980930; x=1792585730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSxddKp4I0UCxp9ZyNQQ3VHE0rhz14xxQPIoVAC1g6U=;
        b=tAlGiuZzUMMorPh4iEruJO7W/gXEear/tBKzaCjEsadwlximgng2J/iDQIEhhn5t1R
         601pow1g25BlZNioNwmN70pFna554H167SR8RPZhwJddrRfnDGLaMwXKluvip6o6CoPn
         2YSHL+dzMEZY/2AiOgT76kkeqJS7lGfa0Xujb10ih8qrE63rWZ7iYjL8U8TXPBzEn01v
         eszcoQgeOh/LyZshz1H8di1TsUa5Q4EqkjO/v9hJ1JwpExArDOOtc87w/pi1+KN8bc8n
         9Wiw7zv8vfwolRq+gxeyx8rUQs85nMsSCCLjcZEUM1c92GHMIWtoGCXIxzoqt5sj+pNT
         /PsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJRlLMeiyK6GQgdZeC1tNNl2i3cjajFdgVymNH/eHmu+ziPk3uk41lOWbXKiAAJy5zgQW4qZ6Xhd+V@vger.kernel.org
X-Gm-Message-State: AFq9FYKA2+b9bFL/nmZNoq3bZEMG4WSYAmi4y0ZcgUaSn2jlEVfp+N6c
	QONG+k2oBub2ASjy0i0uvLcIk2JP9mLOtRQCO1AgPgFNVBgFIqmFi1AIi0DhmsD5oBiWbN24kkb
	jjskyuB/aTWDVcXbIQM98J/KvwoJP554js+lSdAyr3JprxnqnuQvPZVZBUYa+ZK/b
X-Gm-Gg: AYBFou3GaObpmJi7E5UfmCOhvbAINrQ2D8NuK6ZzyNibgFeaxJQ71D4uiSiMd0qLI6M
	UlEN4cGQriv04aqyQlkajrMBRvyU9TdlWWr3OxGv2zct3qkOh10gtF6O06gqcFOJxvuoswXYtGv
	naXfNxY8twiChhfdDXHcBF2vmdcO1vAggCriDjm8dJ26v1VNkw1Di5rsDIcR4NdFbAp61Z1NH3p
	q+RdgwfKg0DDcuT9iONO6enfGVBwctbQ/ThkJKffyi5yt4fUplFuUvlLz+vRTJV0Xz1CIGd3Yab
	tTAFt/y+jCTcG5XPof3VzhmFSRoX87Ap92z1z2ZQo5lPygXDUZyOQ5Y5Sn47juN1JxL/FiKU1Tz
	C3V37s6xTw2FCgm98gETsQw==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr2881091385a.4.1791980930238;
        Wed, 14 Oct 2026 05:28:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr2881084285a.4.1791980929180;
        Wed, 14 Oct 2026 05:28:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9767227sm694052766b.11.2026.10.14.05.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:28:48 -0700 (PDT)
Message-ID: <d77bac91-1018-49f4-8128-27a69f754aaf@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:28:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: shikra: enable WCN SW_CTRL
 wakeup
To: Linghui Wu <linghui.wu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261014121910.1509541-4-linghui.wu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014121910.1509541-4-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0OSBTYWx0ZWRfX/eD9QHVTZq42
 CrnNzNisLTfHXv9Ak29J8CxHF2bMUtGqWdxnx4NMAWmU8XA0LH0t8YbQWydz/IzlnP6FsOaX9kU
 IWYNdEAGe2KL1Wjje4DV5sOpphXlYFA=
X-Proofpoint-GUID: -SQppFmmGjBfSGScw7kFqdAN2OwiD3rG
X-Proofpoint-ORIG-GUID: -SQppFmmGjBfSGScw7kFqdAN2OwiD3rG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0OSBTYWx0ZWRfXxjjH9iEQKeQW
 2YJNxzh2pUuHzCmRdZ4xqwW/Mq9QqZGSoZn0VDALjk8fAwoFpHx/PE+MiLxpccl47XQP/wHoUwL
 qfHJTv/gh5mpD+W9fFhJChiTvXSdbuz/XO6RU6SHeiE00mzSbll5Sjp/uWyHjRGWFxrQy2ZrX9M
 ctMuw9O+EdLawkTt2/w5MOMctyH+26yAwM3h/R2wiYph8/b97fxi0tQfLnXaV8K0yg6ebcxiDB1
 yfJrKzJf73X4tHD5bsqGYCWsZGOdosLQkuyHpTTePXJ5oVzTI380MkG468PO36XA6coMglWuw0N
 rBUh//CzTj8+YKT7VPEPkUJ76iL0VTH4semtHJs0jU+WBx2xBwniYiYLZR7gFSlDarmtNJKwKbe
 BNr0V384M4YS+5hO/THHXj+YhdO7d+MXR0I5oXFkkVGgyFTDgBtj+RhYtmmK/Dd6JJro9SPlsTf
 hHKYaI5ZIX+EMzlPumA==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acf7582 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=swowMNEn3sr08J82c5oA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140049

On 10/14/26 2:19 PM, Linghui Wu wrote:
> Configure the WCN power sequencer SW_CTRL signal as a named wake IRQ and
> mark it as a wakeup source. The CQM SOM DTSI is shared by the CQM and CQS
> EVKs, while the IQS EVK uses the IQS SOM DTSI.

You already have a reference to that pin. You can do something like
gpiod_to_irq()

Konrad
