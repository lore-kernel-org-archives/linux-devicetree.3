Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799043C3C03
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234800; cv=none; b=nTLwbOA0uFxfHDsAX5YRYW3/v17OsZ0wxXelXliZTqv+xHbGx0XRwi93HhH973ycQ1DmHZmvJpCUwNBB2hLwjTKK+i9duHekhFNXKydK5M1iv/QAiUfRO/Nza3aN1zA+M458qGdfkgRx7Gi3dDxc673Gz8mWZ/As/KxRywUH56s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234800; c=relaxed/simple;
	bh=brD+0nXOgI/6kDlva7x0XLfgCi6MCA7+v7u5G6WMJBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcB61ZGYVygOP5E9yw6xz/oBmfudoj2/Ar2HH4B6Y1ixiiePF7Y6jy1LzRsPfyFcv0gHRcQGARWMRmHZxfgAYA0XGlBeOqlDNSfCWs+KsugfjJcWFqtTa2MlJAMGgoQ8gTBob/w7GiT2xxA6MkmFJFI4wvmYmyMrSrGTou92DA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blP0cPq0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bbfv/53t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blP0cPq0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bbfv/53t"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489KE0G2771025
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 10:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+w04sk/QqE6sVNwCM1HTs1GC
	GouwNYCMOitwb5SBeb8=; b=blP0cPq090n5aMnsWDcZF2Zea+YTzBHOYqRaugp/
	aBR2PkS6M9wrHSCcQnVwb7ghq75cpZqGLnwjo6jCBhp7QMeOqmlVmt1tDJukrbeQ
	MnH5+UYgN3zDlzpxGHZGoR3M8cwq1/NRnC1a58Hz2+Cw9rA9Jp7iJrg7fY1/YMYQ
	F8i/5s9DxZRwlsJcCbupARkdnNMvMKlo7o9ww89Giv86HWg3AKTkAguLjqCoDeYO
	D9zA1XZkmtLuO2cwYwpTEi8WqXTR6+0DjG69XdxVB3JdHQjxjdUVYM40vZZNVUjb
	mjyj9bwW8Z3yaOpsI+80xCWh4SN/kMOz+YHoYUf6Rlo95g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5k5qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 10:06:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c81ed67fcbcso932037a12.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778234792; x=1778839592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+w04sk/QqE6sVNwCM1HTs1GCGouwNYCMOitwb5SBeb8=;
        b=Bbfv/53tDNSsLLdadyW8ucPkKEq9FciwR/2AV6IsZAlQggd7jSsalVh4DtdEs14IFU
         zRZGiyj+Ol/omrLlVxANvm6YqOCmrtR5kZUSX/D8Q1gna7QRNJ3Z7jl4O0FgO8BS6q8f
         eUa1uhlpZRkqJb3yaYe5+/PTfDZNtCMoNumJGujrG/+rglhOzzmIfsDaH3S2o3FVRIKy
         iWJEg9d+ShPjtlXK7/JF8uSp1Ddk5FA7aujQTuSqJl5sOjLHnZYeChc2WWY+3zS0IgL/
         dROyCZdosaI5NC86ZjM0vDnetuVQxt9pvc9uxfExgbdxuh5F42MGvDcUSKhDOlmMKQiz
         F7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234792; x=1778839592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+w04sk/QqE6sVNwCM1HTs1GCGouwNYCMOitwb5SBeb8=;
        b=SLmlbNGbq8cEcAwfo9123sMAVVij20xp/hAo2Bo3BLclBHVHPot0HzdpYpvNoMwysS
         8WUzk5Pome+OUD73phW0LYWoOz2HTYEn0pvNQT9sqnTPteQMU7Gk08xiqDgFxRsWG76q
         pm005qgFBVq5A6GrwS4zDObv/hCaEEUaBiP7KDwR6thwyD0H87y3MnKVHdri5Vc48rjE
         n3HGKjC6D1e/a1GkygUdEHRqhuwppwLeIWgsIRxNy7tMTRudxcJ/yilOqcjeBG86WNO0
         fesRUhy1e+vjvSKauugoljlMlGehaBsMBs4iqC0nS+/Ea5JTLeCXXt4pzlZ2uL2vsCjg
         XOGg==
X-Forwarded-Encrypted: i=1; AFNElJ/DNAa8ipXxkqaAZtqChuHVFqNe1IjK/b6AepD9V0Inz1ozMGWxoXhKbeJSqXrgQvPvhWkRdigXkr0M@vger.kernel.org
X-Gm-Message-State: AOJu0YwSF4g/tqHPtul9eHNRmr2CIgivIx9IOOiD+rmNkViSNLP4AirL
	BewR18V7/h+FbiUqKdczrXy4CLQ7fn3gH9JHCZdbEJrsKyPO7MJSwG7J4KOkpZsdT+V20ELgeqb
	XT5PVUycF4EmuWwJbWA8zqYxY98jQMgC5Z7b84u5dhjhPzKEGm3U3CJAgILGxWkzP
X-Gm-Gg: AeBDiet4Pz1GSDouqJ95kC+3o5awqax2+gtNRIEGMU1oBVdpCiF8WDrGadFYpeBjXH6
	BIIn4cyqxvUkoVvxO5WfmyS/uywRGgJWLC7JDgmg7LWFMQ7kA0sX/5BskLPunMa+YIztpu7bP7n
	NLrumpHOQY1dPDP0zvGbr8BIhSTL4LQ4kEhqY7kZAnQtqlzmw4c4RnmBiElbKn4B+rPXNLqfGB4
	xHYxl3SStt7VDUiujWjnKj4/HAQsrz9Y9zD2wx3q6TQDl5PmvbMoDcQaAbx83Mppc0INwBqba1f
	1nOsDMH7Pk01PLErHSJWAhI1cDm/M3jOdPsIszqYvgizNRu7CkRA2XlNpn5FjBKOaTcA2hJyOH/
	cdhKyy8KzXhTGysmnevueBrBomf5H4TFzPHgfG/i8bqTkS/PNvlf81ggW
X-Received: by 2002:a05:6a20:431b:b0:39f:df57:ee7b with SMTP id adf61e73a8af0-3aab136e1efmr2355259637.21.1778234791579;
        Fri, 08 May 2026 03:06:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:431b:b0:39f:df57:ee7b with SMTP id adf61e73a8af0-3aab136e1efmr2355221637.21.1778234791114;
        Fri, 08 May 2026 03:06:31 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267726df6sm1353954a12.28.2026.05.08.03.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:06:30 -0700 (PDT)
Date: Fri, 8 May 2026 15:36:24 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: Re: [PATCH V1] dt-bindings: mmc: sdhci-msm: Document the Shikra
 compatible
Message-ID: <af21oCp0/OHl5lHi@hu-mchunara-hyd.qualcomm.com>
References: <20260504071334.1061325-1-monish.chunara@oss.qualcomm.com>
 <20260506-arrogant-warthog-of-holiness-84ceea@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506-arrogant-warthog-of-holiness-84ceea@quoll>
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdb5a8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8CEDOdzbXjoYQ81OkigA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: EZXBDSKYtDRnqO_6Ypg5_MNPKC9e7vIF
X-Proofpoint-ORIG-GUID: EZXBDSKYtDRnqO_6Ypg5_MNPKC9e7vIF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwNCBTYWx0ZWRfXx1KEIIFYjdXh
 V1OzL2BmlGDUM0JdDRSv+MZZK2sQA7sAjXvcliedsu3cTcpL7zNae1Q+EM55cY9RE6Idj0UUusp
 xqz+/19jLxz0yBVreTRXxcnANJZCU+cV3ZI4icX5717Y0SwMqek/UFvaOJ624orVPkXKUmQjbxr
 5vIHgMgc0xVFhllYvl9SWH9T2GyAPAWp4PYdF/fNhsfoDHARTfQb4JhyNFbitlbXT5GQEif168T
 igzlJGxP/htpnkYvuAlaQywAw/H4Go12Rl5EfVVeY07nrYXufk3gZ1rEbZzkRTFxgRJlKs3wriy
 et6sYK3DXU3YkZAVzpxrPdszsNcGm2pZXSqoqNCHKl8piQPnKpognCfI/kBe1U9RdBKnRv6JDso
 7E3liaBF1SwWce1FuZes5bMeD1umk+PpDGUq+pUzQitZgWwxXqR1X0i3cPRCNy2dAdoGmBTjRHD
 VFOJiZnRBuIf4luU0Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080104

On Wed, May 06, 2026 at 10:23:07AM +0200, Krzysztof Kozlowski wrote:
> On Mon, May 04, 2026 at 12:43:34PM +0530, Monish Chunara wrote:
> > Add the MSM SDHCI compatible name to support both eMMC and SD card for
> > Shikra, which uses 'shikra' as the fallback SoC.
> 
> How shikra can use shikra fallback?
> 
> > 
> > The SDHCI controller on Shikra is based on MSM SDHCI v5 IP. Hence,
> > document the compatible with "qcom,sdhci-msm-v5" as the fallback.
> 
> And here you repeat or state something contradictory. So shikra or
> sdhci-msm-v5?
> 
> This should be just one paragraph where you state the device and its
> compatibility with any other devices or interfaces.

Will update commit text in next series with better clarity on the change.

> 
> Best regards,
> Krzysztof
> 
