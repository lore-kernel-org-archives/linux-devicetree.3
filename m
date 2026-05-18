Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2F236493E
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112683; cv=none; b=vC5BBnRgFcG3cJN88h3I5+Ir+cvirxv/ft3TYNubsM5YgHfT008s9TqYXK/wnvRh6qFUqlrEL4ysxgNONy+TPz5E/uEYE2BGALQL8Xf1Q5BSgS2aJI1FT48C1pNc8QCL7u8+AEMkxLPVZsYo3kDsRAyH6knUbLiK0l/OKgwpOMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112683; c=relaxed/simple;
	bh=yfQr6oLUayQBBCZxtM7GuIaWrTQbBf8KpYeQggUmKhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVOv83N1hucUoShDZrR3Gwi3Za/oReZdsQLyRvwn20f3E6KOZ9C+AbiXlm8PYwRx4Go4EGFk9Ea0cwk/D06tvOHAbERNd8X10ipNAX6OP9V3+vlHqw2rsUTkEIEnCEQMzXhDhQRhU7SlPLBuQWEdAqHKEfXAKwtPvJXwQKrdhdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBt/rLnO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZS45/0Mj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBt/rLnO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZS45/0Mj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAGg6n2685076
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tLXYm7cmK5lZVfqyqbHK14WV
	psNYg+y7RQD2MbOLis0=; b=gBt/rLnOEPVJ29Bonn9jZD/MFBmF8jPA2RGRpnIY
	0eT2sa55wpiniX0ZWKOR0ltWCK66MMfGy2drT7ImMyjL1tu1+zYqOU9i/lOeUyCt
	qqyLtZYt6pxhxbP2W2ypKVHrweJyKNgEFiwBOIn6QVks32L0wyjCtiT33eNm1vTY
	zHSX6O1Rm0gLZCWk2k0NT7dRWxYM6cpnf8Np3pL3Z2v+tFn/U6rOA203B6Avpwb5
	pG5+wuaraUuvLn4tAegWM596kCJ8DCTv2V0qS1Mbbgc0xLfX5M6lDZEiLm3DRP7a
	iKvK3X3CZhE0fJG7dBs1aT0HmB+yWvvMMVtbLf2CNlxi0g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vrbt2s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:58:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-515224a8aa0so29915441cf.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 06:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779112680; x=1779717480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tLXYm7cmK5lZVfqyqbHK14WVpsNYg+y7RQD2MbOLis0=;
        b=ZS45/0MjlUjwDnaQQXA8uvuyJ8ABjVwK3MrjYSrXuJEOn7K6RGaF9PKSNrR3a8Kpbj
         giMKXVzbucINC8kt69iQ4uv/o37wq4+3CogoQwDHm076e6yy+wOK+0lNOONyfMZObiyg
         VzpalCzlv8JUua0kSydr87h3hUYQbADFWEtvt0gn8J+Gh0uLf3Da3GLj0K8N9qaRT89u
         FzfyroJyIVbSaHt7nHjcnHF9GCmji2LFFK14gb+vLma3EgTOemPTN4WsK+qqVnX0Tr7I
         HqdbYBfmnhttqoTzNxwa6Ta7qCxxL+hoEmvuHfglOgcvly2BcGSwMAZy5kW2wm+JXx/t
         JYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112680; x=1779717480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLXYm7cmK5lZVfqyqbHK14WVpsNYg+y7RQD2MbOLis0=;
        b=Pm4MvjfQYAfA3grx29UThCKIc+7AAHzHAY3b1h8CF94r2uEYCxMWV9WgOyaqEEbudr
         4xn37eghtkxUVnNCm7QNBpVYoBC3SLCaTB+OGQzLi653SOkmRvUKZOiozOxJJ8TpGwB0
         4ZmhbvMJmT3eYqJE7xIjraDYaYyPB1X5aMRd2f4NUP4dTl3PpVw6Uob4FvPqGp4DTZ7h
         tw0Bg76rytYZEeWbsfN0vPravcu7dFoRwpvxuI2OaVk/LoSdSws+MlBWyVHfeq02F1Gy
         qi5BGcNWQkU+VMFAUUaqceb6m8Px0PdV6DSVJikq3FeeTjfYGpi1t2HzlrSAQfceGWtV
         DHaA==
X-Forwarded-Encrypted: i=1; AFNElJ+ldIpXPhIA64TrTqhFLqZyhNc4ECFjbWEDac6FAJwRMG2CeeE6iraWNgUsLwKAt+Q9X9I2uu3c4rnS@vger.kernel.org
X-Gm-Message-State: AOJu0YxUa4dkVcO/SYuI+q8E0DGO+VwnsTqoMiWCL0j2rrP9+TeSc2tk
	22G+Hztvu2Z834pEBLZsrbn9K45i2qePxQO4/uiZxaMJcQsnOwQv+2KWZr2bS0b1uyl2iEQ08fj
	JTzhDhIhnnlCxdMKaZ2r2HlYUEX3tzcqjWAP4bQOJn9HoERRtWTYhpbxXJHkbOs0q
X-Gm-Gg: Acq92OEgagCOnOvxaGwNWk9dC0MCi6xBGDfJ88R6J+YSB768/03nfUp3mMN2XGB10Ee
	VySrfZ3NTdmOY7rPAyYJPK4CQq72VDBZJEPQ6Ga6FJ1chiHC1E5/TH9f+Jbnpic1LxN2ysuuK6f
	atWW8BobzmFOlBJnXTweLwz2M+HVWXcJRrdGgAR7W4V8q4rTciAgbR0LwfDYM8wXF271y7APiZY
	B5ZWrHi3oBrtZyBBwdE7+wVqTZbYQO8bnQWe8MmhaLGyq4GIveiKXGmwSJNab/zv8UZNaMfdP6r
	mIHdFFQPUPuV8PvlBc6Z1s2WQVFCVoPPZoGp74UipJmulON7juyuDNwyaH39aACPkFzMzKZx76q
	DzduBt8B+gimj+fbPQklSOb361qOwkxqJXBL8bTz8sOgcujernE1D2wn55AnU67vaY9oDrCm+6f
	u9vlcy+dCABAHG+g7B/PMOEF8Gdd2+TZMWHt/x9LZvbXxcFQ==
X-Received: by 2002:ac8:5c95:0:b0:50e:d330:f62d with SMTP id d75a77b69052e-5165a22aee1mr219637901cf.56.1779112679979;
        Mon, 18 May 2026 06:57:59 -0700 (PDT)
X-Received: by 2002:ac8:5c95:0:b0:50e:d330:f62d with SMTP id d75a77b69052e-5165a22aee1mr219637331cf.56.1779112679498;
        Mon, 18 May 2026 06:57:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm3341803e87.18.2026.05.18.06.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:57:58 -0700 (PDT)
Date: Mon, 18 May 2026 16:57:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
Message-ID: <4nqlpu7qfptekyn77sd7sdn446stgn3v3lw2356bvizrnvjgnr@czqgivemigt5>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-topic-usb4phy-v1-3-71d827c49dca@oss.qualcomm.com>
X-Proofpoint-GUID: MN7feaMUpmFk_KNJFmkFRa5j8mpj5EUp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNyBTYWx0ZWRfX0qRZBLT+gzqF
 +C9uuQsDycwG8zmhKGYVsRrbjhjhZQavFeV5NT9gkCfTUa/buRmDHkzDvGHZ+llE+nkJB2skeRc
 /bh2WC5gSOSTjPMeQij10vNEGFCEgmdnfYCPNvROWLYxfSOL0WtB56P7YSe3XvZKDwMRZ1mMHjx
 96Dz7WrBqIyCEh9VROJwOb3iW2dOaIVDGEAGWg5uD4449I9xhkLb3Rhwvct3tgV7j62c/Bg9aXV
 0Le6CqOnvWXj4qkRVHZHbssW8T5LoJ5D3o95AydPx+zZ9s7mMc4UlegEw2LbuzIRqJSGHCzEAA+
 XMV/uDAGsXBgR5PMg+m1IyTpI3KqP1QujZaMifDEeJkIv84mV2J/IUq1jdO2TvxqMoEh/nwYpht
 eZ7ZpZrbUbpceOb+FJOn+37UknTgvBqdpeOLizXaWX3VuWduoZZffkb9TVv6mB8I/8s8hlgQCT/
 GFpVHj/mEAmuTf5QsFQ==
X-Authority-Analysis: v=2.4 cv=KZ3idwYD c=1 sm=1 tr=0 ts=6a0b1ae9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=4-prPhlKnIwNWIxOTkcA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: MN7feaMUpmFk_KNJFmkFRa5j8mpj5EUp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180137

On Mon, May 18, 2026 at 12:29:50PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
> a flavor called USB43DP, which as the name implies, features USB4, USB3
> and DP signal processing capabilities. In that architecture, USB3 and
> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
> The DP part is roughly the same as on the instances without USB4.
> 
> The USB4 and USB3/DP operation modes of the PHY are mutually exclusive.
> Only one USB protocol (and flavor of pipe clock) can be active at a
> given moment (not to be confused with USB3 not being able to be
> tunneled as USB4 packets - that of course remains possible).
> The DP PLL is still used for clocking tunneled DP links. It may be
> turned off to save power when no tunnels are active, but that's left as
> a TODO item for now.
> 
> Due to the nature of USB4, the Type-C handling happens entirely inside
> the Host Router, and as such the QMPPHY's mux_set() function is
> nullified for the period when USB4 PHY remains active. This is strictly
> necessary, as the Host Router driver is going to excercise manual
> control over the USB4 PHY's power state, which is needed by the suspend
> and resume flows. Failure to control that synchronously with other
> parts of the code results in a SoC crash by unlocked access.
> 
> Because of that, a new struct phy is spawned to expose the USB4 mode,
> along with a .set_mode callback to allow toggling between USB4 and TBT3
> submodes.
> 
> Thunderbolt 3, having a number of differences vs USB4, requires a
> couple specific overrides, pertaining to electrical characteristics,
> which are easily accommodated for.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 392 ++++++++++++++++++++++++------
>  1 file changed, 322 insertions(+), 70 deletions(-)
> 

Overall it looks good. The major question (after looking at TODOs), do
we need a separate submode for USB+DP / TBT+DP?


-- 
With best wishes
Dmitry
