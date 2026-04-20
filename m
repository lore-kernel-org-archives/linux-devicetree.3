Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00D339EF2E
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688158; cv=none; b=hZOyFmASLL24L5TOYXzZ2WMBVoZ06GCsMKYViA1GJHIysH1JMcsExtfI2rlMG3edIzbxkioPAA4O+J3dK1WvFl2Eb2zfmOm+drr2Js44CUxq4kASfymhYX/SNjyLIHMayolsJUFWxP+KWuTNm21R542CihykuPI/KMFjAVD4Y6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688158; c=relaxed/simple;
	bh=4MD2WCa9YarWk/OTtFoQpBtFRJ+mxkr3etRBw7sypR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+DKh2zFsSO6IELSd07CEh0H/BjHgSLmGezr+YNZPKgbV7DsPx4bgnQkt0Wm1NczoXMT15bkDsWhX1tshAXf4rc0PvI6FNwVHuUYLN26Q1Mthg6LakBWVFyVtdQVbPydLgF+Jbyf2NcFdsWr1anTZUBaw0xAZUYvshsenfTPgYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7uroDSx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DX0q2VQ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7uroDSx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DX0q2VQ2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K9mQVS3925597
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 12:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mR0GUK7t3Ru3y64U9QLMTeW5
	Sy0+yr82K1og4T8WzAg=; b=E7uroDSxboe6uZDn8dG7i4TWT3x9TdS32pUFZnMw
	dMb+CPuUXkzE88xKgq4Iw2mXn91FDa+aSLukxa6fdufBgdmK+m1YrHfOZC73t+W7
	DMYcMvAM/1CcT9rgpcJjGNOer8Qs/ZGk850Qsj84yC611vtvbDEboJvPo0MKQ8nB
	sB/1As46dXk5pkknmIAYTyaWl9Kg3Ii+oC5kxYKGxd2E9VlBM/0aMProcFsCg9g2
	z8MP7Bf+EZwaNFxazdfIcAn8kW2SIwlmWAko0IWkLbdyJ5s/W3xUOBVBwuZemEMI
	LcVdyLNLf1Bk7VXQHC4O4zvs9kprXDzRMs4f1fgzVddnmA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhu9rg4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 12:29:16 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-953e00e8ea7so918108241.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 05:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688155; x=1777292955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mR0GUK7t3Ru3y64U9QLMTeW5Sy0+yr82K1og4T8WzAg=;
        b=DX0q2VQ2zNvkUz++61Q2tZz16OIjUeKKuyWOYhstNRSIv7MwuB1HBhiC97is+SaMs2
         wciEEw/wooZXfCTuZ8q6WjCawKYRWRRgNI/m10o4k12YgkvI/peRg7VkV9Mnsrvlgzbt
         rOVoByBA3Q8u80x3/71JHWU+OAo5qH8a5gfUODJQ45FtS81hK17G+f9cDIgoMvhjwtAm
         klCunOtkj+v6Y8k3qcGIxCueXb69G+0fe8fjrNxMFd7TNbir5k98nDu39UYSJu1qu1xv
         snjk1RJdxRO2m7NO56CFimRDIXLDwpO7cPkIqX7NCz/gPfWBmZXtnlqxFzSkserE2nkI
         en3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688155; x=1777292955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mR0GUK7t3Ru3y64U9QLMTeW5Sy0+yr82K1og4T8WzAg=;
        b=ipGooHvbasor3qTRyQuBfEhUP6ug4cNj2hslrRIA1gLyXonMcrI5uN67rlLFnDMkYA
         vhVbyusy+Ot0hus5CAb3ND8MtCK4ad7kWXcKSUjDPJI/AJBPA2qmY2uiP31pSxyowJKd
         duj1jRvkckGiMOpXDEccmVYzXMEX0X6BTu/U1Up8hsgepahKOYQsvTm7JwHuT0NEz/Op
         /jCMvlj69U6bAEqtsD+G/TuLXkcyITrHKm2JrFkiGLziOSfFfWxjJr759/9c26hzv2M9
         zxluFtghZ6nVWseVSfWnlHC52qEcsZ3GyF+rw4Zg26jHKMHibwjM/rsDv1DL2o8uLmqU
         idaA==
X-Forwarded-Encrypted: i=1; AFNElJ9YjXHtaXMLTvK5sbaeKmae+zFxpsPGPrAwBWr33S9kZndX2oaWO3y4VsThVnWJKYTqHJp3kUCB2gxU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8XoEyqDWvkCQjiGZk7fnhrjlrQl8Rzfcfjp9ltNAGlHCOROKt
	pl+fqMS1xlHLK7OSCxINfFWW9/4Fmm61ZdRNUYonzxqu39NlanUq+PZNy+SR090OAr/I+9XWVJx
	33bgkuBq5ffOo12zonI0LiimgInhzKdnUrClPbHR5dbfkVCrg88OQ8gLnguAixeLj
X-Gm-Gg: AeBDiesLhFm3g1RyAiPDs6XfHdTrFohqcobGhvc1vHACuYL/Nex5is4wj+hxmpQEFQV
	3EmyGD2UyL4k63B8aRYAyH8j2ZW+f1fFV8UcJr1YP+p6a3Xvjs8mPxr9ohGLCqPrWIhCsAtJmM3
	iElptOl9qLRcn9vUbxRjq3fR4aIaPFaLSlN6yjfTjxhoLdsePEfu5WS+NndGKA1iNrjP5P/JPgS
	XKLlq2577R3yYQeoqoFoCfEXUBdQ9xWzFBSmtFlESVSRGHig3RqTVGlu/eDWanFvj3T3DPyI3Q9
	dECnwaJJ+XRaBln6IcIHM167jZFcufTNU3tSCWsBuxU/BSciByVgGvQAsNTkR3yYopTJ6m/mRWz
	6rDNn/QtvO50ZIQeRCulr4T+c6Cr9UwINnOLoWkwh9bwcEJ2q/DJP9rk1YbO0xiaOl79B85Ih1e
	durhAy23Poocs0HAUaHesu40+91PoMetw3evIMBqSQcBnmag==
X-Received: by 2002:a05:6102:c93:b0:602:a05c:e9c7 with SMTP id ada2fe7eead31-616f54a479cmr4283154137.7.1776688155176;
        Mon, 20 Apr 2026 05:29:15 -0700 (PDT)
X-Received: by 2002:a05:6102:c93:b0:602:a05c:e9c7 with SMTP id ada2fe7eead31-616f54a479cmr4283139137.7.1776688154657;
        Mon, 20 Apr 2026 05:29:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f652asm23137811fa.12.2026.04.20.05.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:29:13 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:29:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: talos: Add QSPI support
Message-ID: <ln66k6kv2jakmoi7nzvoven66ugd4xiagpazgpnxaw2u2ytdtm@42eikb6kyvs7>
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-4-7de325a29010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-spi-nor-v3-4-7de325a29010@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMiBTYWx0ZWRfX/lrC+5W1z0lm
 Bx/Gw6Wu2OuQgT68fZz46T01HP2lKTKnoaoS01+vKARLfKF9tE7TNAoLKGxPucvsHHgGrC8O2ZP
 DWlQztD3Ai/VB1xs2moLZcv+wAiD17dLucDPNclVocs0HBGQ2i1pMeDojgWyB4Ey89IwZzVHV42
 /RzKORn/N94MLyxCsYrc4vrHsatHDtkm41zsUpz73oTD5eB6HEIOr34zCcNeBeDf+Jn8DtlJWuH
 LDxgs+644yzzLr0hpaCIKEiwZhsekQwuPQErwI3RL2rrnE0v8vwCOzJPwEb9dkGV/EFJ4oPK3NW
 gE/qgJV+I1qmgmUqXdgcV+Yht360vAiUarxGmrCCoLAc05PgD6mpgu91GNvE17C8gUlZChrRJqf
 QCNMdFJ24kjl06keWz24JcYrQQq+amteRcT3inb9jlX2SFAezK1Uh7ck2gDoHLEmul7UNBF9TDT
 UmO6+otCU80BCV5rzNw==
X-Authority-Analysis: v=2.4 cv=IIoyzAvG c=1 sm=1 tr=0 ts=69e61c1c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Y_rFqcJ3G5YoWfvBDw4A:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: BnGitej5LIJPybKPbCRqDNBtMkjJDoYD
X-Proofpoint-ORIG-GUID: BnGitej5LIJPybKPbCRqDNBtMkjJDoYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200122

On Mon, Apr 20, 2026 at 11:42:51AM +0530, Viken Dadhaniya wrote:
> The Talos (QCS615) platform includes a QSPI controller used for accessing
> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
> the QSPI controller node to enable support for this hardware.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 

You got r-b's for v2. Looks like they got ignored...

-- 
With best wishes
Dmitry
