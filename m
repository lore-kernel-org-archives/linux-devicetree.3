Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D4930E858
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448140; cv=none; b=MDcFzyv+PYP6xTlB0RNNBxO2xdqPLEnjanPZIMptYqxPfwylUuc9+JdM7XnYZCmDHybcyzTyYeaxi9N7Afc6LuFPleiksElkS0Cgofs4eyO9fJzl+sOLZ7Sx8YhaMyMwJKmdHr+g36kKfDM/6kuDkRAqdDh/qnC7WdraPNwDOAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448140; c=relaxed/simple;
	bh=H5J+uIt5XWnJEJtNpEus5E08zRoIkT6wiB+KmpwCzas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+UDaQmanEbncQP9N3SXoxbiRrQK7y18oecWd96VRbTbT1fmBXK4nKACsunYnihDylf32tpZieDryyzTppJ7YARBnA/CX8ARN9NJU0cNnkStFA3uQRB9RPokPKkX4Iu1C0eWSaeIZgnw4Eh0/Mjsj2eXprXL4yjehK40ac+RC68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YlPvGr1B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwmklVQ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YlPvGr1B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwmklVQ3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT9iR4194013
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 18:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gkhz1M8h+cJh8NJ8jPMjLwZY
	S3DnJ04E/4zdfvZaM8E=; b=YlPvGr1B34WYLy1LKoSakq1wAV7K8otS/bk6GnfY
	OU6WiHxIPnD2MYtyN0PoLKoInqA3H95pJjjPcgB6rb1fGYVdRBVZM4D5IqMFk4hY
	jIcKnAN/JYvrArEVsrX3z/N/yLh4yKKJlSHINX+xskg+zgQ5+aQ92IKpRMUGFDhz
	ToTtg50CokIlkz3ryxOsMcxplRIIPOx5f35DLdusJe4x2j6Q5A6Vapxn/JaReKcf
	3s7AjuzxUPz6LKT/zgMxuEhADDKEHuKc0TA77J09eRXNo4K7R8PqpYaQJ6sgUica
	/R3k4R2nETZswv8rBJJTKrSL47E5KJSI3639qOS4FdrMIA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9ab047-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 18:15:37 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963b099b539so1034023241.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 11:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783448137; x=1784052937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkhz1M8h+cJh8NJ8jPMjLwZYS3DnJ04E/4zdfvZaM8E=;
        b=OwmklVQ3SuGmyW+XpUWtfGwMy1l+TU2q8AtsZxLT+NzWharoWXnO057fhxkROJty7w
         iQAHMPGjvjOpdqjf8fGSiAFiMNf4CQ2LXN4RYKYaagxtwzKC/dLfV7h+/TvAylqjFgn7
         032tTUS9cOH1v+FY/fsWZ5qMMvhYYn4QSyqQcVvPPHvpdWw8LfDA0TK6KOBAkTcaHCH2
         wWsyjUm1rmFH91To9wzZxS9SuamDCC9X+saWlEAxHarsfVJGjT7p3TE7EduoyV94Xdhv
         MZD/E4we3SaqGs7LYlucdJTh2KmNpeI4c78E8GNiOY8Gr8VRaCrOb/qA9DbvBssrSW3j
         iBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783448137; x=1784052937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkhz1M8h+cJh8NJ8jPMjLwZYS3DnJ04E/4zdfvZaM8E=;
        b=e6mzp6UMBzSx+cCXWGYHFvpmkceoeaUUkOlDQzPuP5qKVgbabyVanlrcNclZ7gSo4E
         sxLKxuayNrK26CJdY30K/0ruwhkWOD8aioAdR7zASPuYsCrgLHfAPKDCYpekjlTguSKP
         0KONkyLRm6zuyZt5LVRewUMFIPOCmjb4Y6K0eNEqqy7wefPkeJy08mLT1T3lvFioRtDf
         Jc7sGjXxh+8kJey2EJNDOyj6lwnLs3Oo3hx7tXF47dEryDHwbnwOzbBZ4Q+/Vr6r+kDk
         A3Amv/9uvjoaSrkuOSoQ4dQizMw31jogLFU6adpR2OkLDhseD+m8nF7rmgL94p9A+5ts
         2d8A==
X-Forwarded-Encrypted: i=1; AHgh+RrHKWyrc/+gMh+X9rhAe98sdQeuRpBknxXdSNMx7w9YxVIFjjTyDKdwHuUSK4EnnU8c5YOs+CH2MWU0@vger.kernel.org
X-Gm-Message-State: AOJu0YydDsTutEQp9ZLujq7gXgf8kQizXt6gfEnchfyB3Vy7ZroSe4n7
	RaYKdc3kI3MhJTWxODUpb0WpZy2DaukPXYo/KJm4fG9cta4+YXH2MhImGf+0Np/rxtgPloq6z6g
	8AYS9J7MCPUERKl5lGHMM4yBwgeDjbvgTSmle5fNrKEKUHvYF6l01sDseeUQYgwIF
X-Gm-Gg: AfdE7cnbZ3myHh+dvHYNxjsxFACg29WJwkE7dzfqSF/xxyHv5I57wMB7m/q3Ua0uzt0
	rLC8MCCrRIm/Z2dUAQUVCOhcwsyQdh+SqfV8LMCTQNE8HCRVcIaL4pygmy9sDZr0ZNJVxXtYsj/
	/D69LFrEdf9WL4GtJG1i7p+NNTJlaQ5UpBqxVjuVANi7blyi/lIk1mHau+REBYLLbxJ3lXH2boR
	EfnfxhMRPOsGyFfEKRuQmHmTBXDc4dKXKuHTHsN6x8ggqdB0lY5JBn5XGl8Q1eBapyTdkx6KOlC
	ePifOeOGDlm5RDQFf6VgRh74xD5hSLPJBn/YWYRLoPc5dxCBbK8aMyxTGKPmNZrFd0UtNaRpy8R
	CGdJb8bJrpIuNl0wkfj/nYT1F+cQXNQFwfiLUoUhFpvSTXDnz750ld4wiJR6aUv9FTJbHBt1LsZ
	16cYVpGi9cgFk6dkr2LLipzuk3
X-Received: by 2002:a67:f70d:0:b0:6c8:c356:16c9 with SMTP id ada2fe7eead31-744c24bd531mr1899670137.20.1783448137322;
        Tue, 07 Jul 2026 11:15:37 -0700 (PDT)
X-Received: by 2002:a67:f70d:0:b0:6c8:c356:16c9 with SMTP id ada2fe7eead31-744c24bd531mr1899532137.20.1783448132115;
        Tue, 07 Jul 2026 11:15:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f908sm3841895e87.8.2026.07.07.11.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:15:30 -0700 (PDT)
Date: Tue, 7 Jul 2026 21:15:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@oss.qualcomm.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add overlay
 for Waveshare WM8960 Audio HAT
Message-ID: <zfmtqi3k3miv3ncgla5x3gjktj5j25zkyqqxmyq5i44ynzfnhb@7mruev4sw5vm>
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: nqh0ap1cF3vMC2KLFweklXzV_GivHwfD
X-Proofpoint-ORIG-GUID: nqh0ap1cF3vMC2KLFweklXzV_GivHwfD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfX7N6SZCjDvRbh
 CKe6SOH/aI+dbMFpSeEdk48O1/Ip0/t46x7uA4yMLMyShYuy+y9UYOPoaCP3xkKqDnVD1jrtppN
 dem7GJbYQYDzysPuAlXc1NK28NWCffI=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d4249 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=A81ZHLluCYw3_DbNGG8A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfX5ovKz0yA9yPr
 JwwYFLmhbXAKtyQFhDuBrcBFG2YMtVKiiC3bMJKs6ePXFZC9Q5VAU29BJoQHW0wLdmqFSRDRVl6
 cdOAM5i4k93148Pf65Npbcqy11XgRRbw6g5L9CJdpbh3nkcCN4ojsmGwuo7KOuxySjH+oiHznab
 Y9a3hpHku7rW3iA7VgMR6cobqSyLpJYVnHRwGIy1ADnCXtmTCmbtaCT8FktfsPB9wKmAGwjwQ/Q
 Rp/vUUKGvJtd2jQP4aj/P2/oSvualkz65n83vrIjQOXkRZIZtyv8nEtiblQSvh5VlJQ7yTJm+E0
 dYH5qUEA3zJaACr1V27cyIljlR9LwrT06EXlSmmNKOs4rofGkR2wvIaQueOb8oyaVilZJU1+JVO
 yAC9xGAlv7nH3zm7DRNJYkIZ++1/a2mIQTdJiw+w5BBYcuSfb3/SLfHkK5Azx/MlWgiPHmIg/oz
 MYMEV/IDZHsdKd6j0qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070179

On Tue, Jul 07, 2026 at 05:37:03PM +0100, Srinivas Kandagatla wrote:
> Add a DT overlay for the Waveshare WM8960 Audio HAT connected to the
> 40-pin JHAT connector. The overlay adds the WM8960 fixed MCLK clock,
> the WM8960 codec on I2C0, and the corresponding I2S1 playback and
> capture DAI links to the sound card.

The contents of the overlay is more or less visible from the patch.
Please provide some useful documentation, e.g. how to test the codec.
Does one need extra UCM file for it?

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  ...uino-monza-waveshare-wm8960-audio-hat.dtso | 100 ++++++++++++++++++
>  2 files changed, 104 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso


-- 
With best wishes
Dmitry
