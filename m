Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCB1349CC0
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 22:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782945037; cv=none; b=LeNyaTmd5MQ4QgB403IJ0hpx0lP/RDqHjCCh794557tl4J0E0Nq001uEhcywlac0P1hS5Ej3X+SNxvCF08aVyM64SMkJUra2c0Bt9lbmN9tuYXnXC/LyJ2oX6XJasmzFYK1bVn8LNxrD7i2XfW7itaMtqsjnWV1SsubQLSZ3RcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782945037; c=relaxed/simple;
	bh=BatHVsoIz5Bb4R2VzzgLNRFahxG5VaPstv4ozAB8ids=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2Cin0HX+J/XgO/Hu06+eP/hc/vCZRn4dMQ7Dyz/BNkn4/NSZj/FE61yO1FxZkFdcRpfYI5yEa+uA2CCDzslT2DxC5dgH++gNYxaMa1v7rTgGmqiO2sYPjvqgfRv4wG85DA6HyFJZKUiPh/fE4YwoBl1YggqhdXU9JSVkcsRn2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgAuYkQd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krOidsnZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgAuYkQd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krOidsnZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661LhOJk2488755
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 22:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oSade3cQuxhHGzrqmP0e10mU
	4F/ywazI9nk73rEtvd8=; b=XgAuYkQdSv+Rl1NPx7o6ur9YTG8bEnRO+2JsU6Yd
	WiZJ9XKR7lQ9O2fpAyplSZM6npnogUbW7yqAKoLx+vosoQssfsMPcUeso1hCIdm2
	Esa7RD0bgcBKKBs1+s2OOAlzv7HfsGHDZAC5iXeGPrSDaXrWbESJjv96VkLB5295
	ieEcE4TzrOsYSvxy96HeRyfSBQN5ImaWgudPP0iD8mQQb+Q1/PPEXlLV6Db5QU7J
	Zz0u79Afml7RcTunhyAq0GgKNyVsSxKeX3T/I3nYDTEDTmgr7jVgpDU/i6OwACyg
	ljxAXr2/lUcugAyIy0dpkXewzfv0U08xSQgvnZ6i7e6QCA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gps9tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 22:30:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91931144870so144953685a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 15:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782945034; x=1783549834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oSade3cQuxhHGzrqmP0e10mU4F/ywazI9nk73rEtvd8=;
        b=krOidsnZGVaUiZMX1Bl3no2kPMnDS1Xw8CgNgTOCJY7tt0LdLyTltdQILmRfyceO9I
         5GexPV05DUwyqjUwmyBxfvYn+l/QabbdxSu25HIgX8/FdtxVm9cwo1ZxEokSBWo2BvWI
         bfSBlPhRRgInkt+tbqkr+leB/EW4pXYtUtXoXqthovvmj7S0tF62N2S2SZR0hCad4qJ9
         mz019a0LKET4BTLqoJPl2slr9R0id1cPKF33oKh5OixbCDKNd11lpqnIZ+IyR6MWBnRB
         gghMQK/kowq5uUzdib1dA7ZRxlkwxI1QK3DQ8f9ejRdSQ8vGNxjylb2SgzmD77rIEPtq
         AWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782945034; x=1783549834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSade3cQuxhHGzrqmP0e10mU4F/ywazI9nk73rEtvd8=;
        b=eBhmKazV5ZsBj348QI4o2G1q408B+7NMVSh1xZH62T7Th0w5uK8OqqV4XyHNLY2sv4
         LoWB6vBWgBFcAmr8wIgon6zevqS0ygj6Zlc4MZhlcw6zr3OIxK1KQtoE8OZD1IT5Rr18
         be2Sqnba58iurq0zM6JBFMCoL/IMnOy/6Tod+hYkTE8QfERPH4Ypf8ZogejKVApOcGAl
         Bz97LSeLHqZ1OAlC9uGAPxwvDTOUDdwa5D3G5FmJRc5tkid8igFud9PtyG6x8XEDMr8P
         Geou+mEGSC/6P9ibbpEJtUWrPGE0AWzLKXU30fUchFtKIDvdUIUtr2eWgSNfGAI/fQbc
         +eZg==
X-Forwarded-Encrypted: i=1; AFNElJ+cV65Vn010j9NWTF3GWI6PXj9wrOF2IN/Gc8GfBg8M9vkff/aOo4/eo6E9MANT5XxG/M7TyOqMk1hg@vger.kernel.org
X-Gm-Message-State: AOJu0YyPdovWOpMzi/tE0GKDdzYYgnkMJVMpxrf+IG3Uj/iX4lIQwKUV
	plL1GUmb+u4+eUjl0x8RIGS3vd7i4kabjjZrWu6SEA+YaHjCN9WbQAjoKmHDTTnxDPPrnmB+7MO
	StY38ZC0M3p0wBJu5mVkEpNWFKACkbzt5Wh+jI6uoAqxsBOqNCPL4kCtXiMfdCOlo
X-Gm-Gg: AfdE7cm79dETYkGUrbkqY1GbcN/C4XqVvL+OIxiuxfa32m0eNb4o1cu6hkpCC2h5mq9
	PiEOoma2qDIVh1bAh8E6uznZEsSXk3WolZ+2KsbuOhCd0qDOo6gUjXS8zzH7bMgACk+R/B2+q0v
	YY3rQcMPOajMfF2ty3d8uSgz/G3wF3/6wYITROi8+ok5zmP+7H/GlF1+H3mAR+vgRlBseOEskMO
	oI7gX7TmGXdjWELZKUXdRsU0Bs0wUgrImvkkntKX38bscBwXhzUDqevm6ZWNPk/dBknYAVO/rhl
	rWyCwcX1ogiM0oxWWXThDpOn1wf2KfPtujbT9hTSdedKLOiuppmw7MGoAUK1tXf+X3E3f70LY2q
	b4ebvA/AsbbX9vbt3FUcjFyOM2KZc+Jz2KZfKFAKCNbKg7K7ffZRchDIDHir/4fpfCaBEaiF3pM
	LSKenJL//PYmy/Ag8l+1iVl/d5
X-Received: by 2002:a05:620a:6883:b0:916:1a02:1965 with SMTP id af79cd13be357-92e784f1da5mr499405885a.50.1782945034416;
        Wed, 01 Jul 2026 15:30:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6883:b0:916:1a02:1965 with SMTP id af79cd13be357-92e784f1da5mr499399385a.50.1782945033926;
        Wed, 01 Jul 2026 15:30:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89e56d0sm273132e87.79.2026.07.01.15.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 15:30:32 -0700 (PDT)
Date: Thu, 2 Jul 2026 01:30:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
        sibi.sankar@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v10 3/3] arm64: dts: qcom: glymur-crd: add Audio sound
 card node
Message-ID: <hyasmkyrzp7zpifgcux3ud7yk65gkm2g43lp4qk5vw64ee47my@noebqpjhb2s6>
References: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260701163115.3701298-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701163115.3701298-4-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDI0MSBTYWx0ZWRfX9O/FQMu0KFwB
 7ZLrKM3X6XyNzVoNTuuIAmWMJ9+3UimpnSvlts/nVTLOftgjWg7CJv0VGEkyPDTy+fn9TGw+qG2
 FCeyswLweN2eOszqCT1svBARdVYsASg=
X-Proofpoint-GUID: ax41L9F-VvfTDmN3mQUVCv_Q7ZY1duEe
X-Proofpoint-ORIG-GUID: ax41L9F-VvfTDmN3mQUVCv_Q7ZY1duEe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDI0MSBTYWx0ZWRfX7XMLn+lWmbtu
 g87FSovxJzhsPzBsSZK+NpK0mHbFHHMszosRzrGDPb0u/8oyMUdD2dXdcKxFXeRGIya3I4fD0oE
 L2DYq6Vb6rnCHvWKThyWHZdmMYtJeQtVfs+OBDXU2qHw4RkEc8JBr03OWUoLmnwvy9DxkGfRXTA
 qUyBhmb69B+9qOHNyzYtbEFb6genudTQ14GVDe/5snKfb8ZGIJ9EXhSBf2DnyiYjpjUwrUefNhF
 YHwS3tdMDn9x4ipB1acgfVsOWzYom8HoBgFyUuaWz3W3k+XvUkXpimTQvQYx7Mi/Y2nqluzV66t
 C8JNmHQkNjcgvbI5VhIyEOREAiYug0rqT7Eg9BLow3wM5lV1AHt5TNeKcTtExcGr1yWZaAkGrXi
 g+H7HU7l4KAUbcSLhCcn3m2f7yaVWUO5k2S35jWrSpkTsOVJs93rWKNSN23d+jbuJ6UAiuQ0fab
 cic//ogfjM3KLw4jotw==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a45950b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Pwg7NeMGc8aFi0NltBcA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010241

On Wed, Jul 01, 2026 at 05:31:15PM +0100, Srinivas Kandagatla wrote:
> Add the sound card of Glymur-crd board with the routing for speakers.
> 
> Add device nodes for the sound support with WSA884x smart speakers
> and playback via speakers and recording via DMIC microphones.
> 
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

If you are sending it, your SoB should be the last one.

Other than that, LGTM.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 111 +++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 

-- 
With best wishes
Dmitry
