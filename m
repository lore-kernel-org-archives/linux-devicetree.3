Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F9223A561
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 19:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246286; cv=none; b=l1XJiRt9PPXwBGBlR9JqB2O5DkdfKl9NIgLYk86vZzid5n3Q2OVXLpQQyBrBnnbC2sPqwI7AQ4hK8VhIk3JjzjxBBjX1Ei3Cw6d9vrP8CFxjskTasPJhdeXnItvor2ZQdfB4oJOiLPaYTqM7dmR0j+e9vmgSCTV8nCwCfuhcSQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246286; c=relaxed/simple;
	bh=ne4fQSPT/paZXhvg6/03ae9eXNBdUymFwbR5vEGWkC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0tKBGkjA9CGQGHK/UVROmU93XNIx7fjJUmT0GALJrJrLUGHjVBwFpGXIzuVTkxiyGwHzWBy0ZIGxkLE/cHzrLgT7NTyuKP7MwA0UoOUjJCO9NzZ89S2Ne5ylui/VE6S2KpnMYNGtl4+0S5v6D+IHaVy+AP+nQmAxYcR7piyLqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOT6AuIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQFC4qZo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOT6AuIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QQFC4qZo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633COs8X823333
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 19:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zS4CaFvcO0wwdCdDWlSrrF2D
	SP+yryV8988QUupJBvk=; b=VOT6AuIfZMmf1pQW0PmAjCBny7p5vm2vhdNiGRWB
	bXE/LT7xEljmoGKaCnInduqOQ16gxR6WJj4ixTTNuL9d3a6k7bDK+6dnvkscDsGP
	I2BvVipFBMNZpvyheRaFLUqSU3ArwsEE05419+6Ep5ibDXtC962dm/DOYXtA8Vpi
	9wz6CbotesHg5840a8EKoxCrddJC5QMm6u61Ln91DQvxB+/qrhIXQT5Be5jH7PeN
	Av4/X6r6B05l/jhZOB62D5y6PvFhFvwSL5LQ6L9Xo3/HfTHdZLfDXeBZ+jXjiQ5G
	SzlDApzvzSYSQzHfgnZlKQ8QnsrIJd1Bg7JksOSkVpvNbA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da673ak94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 19:58:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d58bed44aso60326501cf.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 12:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775246284; x=1775851084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zS4CaFvcO0wwdCdDWlSrrF2DSP+yryV8988QUupJBvk=;
        b=QQFC4qZog31k/bCn3qE+j29bRo+h+jQs2I6+P2+K4RO/oO92iaLJYSAMIUUYOK4hJe
         xKJEGaPyBF0j6KdTt6nxJMhQBLmD6f2uq+XMczVCqLwLpxT0ntpiDk0n+mtCscNrSRuh
         1TvErycftsBX2gC68N7uRW7NIYSXoOMkFJnaUbGQerjc3opO3DUfiLdgWhypTUL5GW46
         s/SnqCWsuhupudUJueLrx6mSSb4DsbJSrixxepQ92gCs1bA+mDTIUEBvqj4XPdVx3rBW
         HAgCE0VNzMLJEBYEC/kmJM4Skr3PmHaNnhE4EolHWZV/fgMf8TzI5cDUAMxJRciPt13h
         Azrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775246284; x=1775851084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zS4CaFvcO0wwdCdDWlSrrF2DSP+yryV8988QUupJBvk=;
        b=pJt24Sio3TsiGNyAt3NTIitPQMRfU2s5kijgwX+99uLvZzM76XRPCj2FwC25S56qqe
         3ATi3F1bigH3rIR2j/jZJi74BFzdVnUutpmsOM2TqCyPZn/FAxxx5ejXzg5z4CPAsRDp
         V/cwMNp4CH4LR6yIQPW2AFFTsj8wsCdCEpiaczoo42bgnFlkNdGzbUEa6l7u5tcWHnjo
         vSkPwyGf25d+Os/FuJjh3n2vGRiOYQ+kanJGJBQ4g0qbxPUaMezNZuHZIG7+PY1GQCN9
         N1r7szLpOwaiIIaBvKZv5vVF1UDeAQ7onVjeAByCGfonCBeLx8JaRBsoWpFNuyiQPQ50
         XR9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXem78ZEzWOyFsqarQ823Kfy39xuzgbkU2/4Sawn6oe5jurjB/+5wDhJah1lqJBi6+QPnxdu3rZQdOB@vger.kernel.org
X-Gm-Message-State: AOJu0YySrfoXJgXU0S2alcFtajiAL+F0sjUQAWS4/HAu2b/XJe6/pszb
	LFIdJ++z87Ak9PSd2/KFGGZitC9sUkFd5jrELeDAaCAaCFATbKtt5aOgAJ2l0KM4srUIyHrd4xL
	JQ6CHiEtwJpqn5tM3bL7q2wkoFopofoB0NALbskfzjHI8Q7WYneq2lkY0+9in5aXx
X-Gm-Gg: ATEYQzxssnHLwZ0IpG5fJ4kBSLGB2+oU52g0VD4uoe4T+UUDumLA2xHJMZQU6+tfZB+
	+5Fly4e+Iwl3T9eRoHH9B3nSNU4AiAl031kYGzcyZt5tPsDBYx5IG63WlgkEOOeyoZvfDHesJwc
	Nyua38raB5G2+CgA64chzMvBRwobJJ1P9Bo44asdACdl5nO0C3ApERtVZqfj016dPfTecJLunHH
	LbJqRzREtG7/QPhnnMvYAOZXkryrm+smr7OAIYtXBn8lLs7CaLp/4baNn7RGnIGBol87mDQHLwg
	RbNiMUXS4CXQ7pRQi/nZg+256FK2WsQrwaCnTYcoU1mpmTUk1Y6c/uoXiVYFibrKW4u38ubLDbQ
	kOk/T1553K0ckt8IDIdZChGlIOaB3ODbyOkHzATfSTr7bXllTG0C7Aqnae9B8oEADcqI0Riz1iC
	vW7K5UpZDXDzX9D55MMXp2LZ37sQdcv/U5v/A=
X-Received: by 2002:a05:622a:15:b0:509:1cf9:ea0e with SMTP id d75a77b69052e-50d62a80ddcmr68313981cf.41.1775246284149;
        Fri, 03 Apr 2026 12:58:04 -0700 (PDT)
X-Received: by 2002:a05:622a:15:b0:509:1cf9:ea0e with SMTP id d75a77b69052e-50d62a80ddcmr68313681cf.41.1775246283754;
        Fri, 03 Apr 2026 12:58:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fdff47sm14814641fa.13.2026.04.03.12.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:58:01 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:57:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: defconfig: enable the Qualcomm Nord TLMM
 driver
Message-ID: <wqleroawdmp56hiraefvc45snovzor26h5qdjcfxsr7w53nvnl@6snvw3qawzu2>
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
 <20260403-nord-tlmm-v1-3-4864f400c700@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-nord-tlmm-v1-3-4864f400c700@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=erjSD4pX c=1 sm=1 tr=0 ts=69d01bcd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=jCnpw5DhNY9zVd-FB4MA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: WjMcu0328W3allleHpn5NbsQtJM1TJE2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NyBTYWx0ZWRfX0Db8BZRFt3Od
 CmA3Mu444cV7v6AjISAl90qs3KSDDwB3CLk0wBPQ9AC51M8foW15nP4XHrW/EEUEUJwjQ4+4nUa
 xNUP3wzNde/opU03gHnUkDQgkbHOoFzq7eL4EOiqQm4b10wfhymU1T9RT7a6stabZHF0E6Ng/iE
 mftsU6RhjJLak0uoZDCtSPgv70/vLCN8Aa8qls265DjLGWyGQKDSEy7AwD9JugXVFDFKvtDDL6v
 YXUHnzd1nO8W+84blVdzN17iEpTvCx71KJr4txBKeJTzf9rajLRDwiM3oYcW23CYcy/FAgB7sKy
 t+VNpi9RMurG6GtmcfXBrwJDue8v8l/F5DjbYhz2V4sWYiiQg5XntuhU0rQDcCObMV2UB6C6hLu
 aFu/1leut7XCeXlwh4mQSwXRDDOE4iqMwqFNFS7mcw86IIChxmBpJilssoLnEjllTNittBxv0Gc
 zvWxn9TVGRxtJncr9/Q==
X-Proofpoint-GUID: WjMcu0328W3allleHpn5NbsQtJM1TJE2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030177

On Fri, Apr 03, 2026 at 03:27:57PM +0200, Bartosz Golaszewski wrote:
> This is required to boot linux on the Nord platforms from Qualcomm.

No, we don't enable configs for 'platforms'. Please specify, which
device needs it.

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 163b7f0314c90fc45eb6c4aa5e8faa549c60fdf7..31f8cd7cde6fcc8c8da8e69950dd4976ae04cfc4 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -675,6 +675,7 @@ CONFIG_PINCTRL_QDF2XXX=y
>  CONFIG_PINCTRL_QDU1000=y
>  CONFIG_PINCTRL_RP1=m
>  CONFIG_PINCTRL_SA8775P=y
> +CONFIG_PINCTRL_NORD=y
>  CONFIG_PINCTRL_SC7180=y
>  CONFIG_PINCTRL_SC7280=y
>  CONFIG_PINCTRL_SC8180X=y
> 
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry
