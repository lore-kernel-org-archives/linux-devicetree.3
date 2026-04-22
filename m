Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8E13C13FD
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776854609; cv=none; b=WYrDSRKctn0bFRllwLU5+ar/aK3DX8GRAET/47D4N4pbhvxsqrJReu7VACM+zW9+NY2kPAZ+WgnLMYVO7n7jVugc/Dq99Ta6iaiooTzR1F7lR0a+ZN21oXRGnVJNeEBK4lInwx1q2x4cOzw9dYC5cQSCxt3dRZKeWqT2qvRmpHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776854609; c=relaxed/simple;
	bh=8wklWtiVxDYxVgHNwWNekFxzc3gACA/rQ1gC+kqtsGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENPWWBorQihHI7Nhx94oQ0NDlfZURfSmcBO+rCTQn2mzH2OPsAhGkEsEZKlELfz+HjRBQtKgox0mVG5DMD8e64tY1LPAlmCzPbWTHm9Vjf9o0Z1pGNhp5lpqhnQk2R8v1R6ccaKlu78Y2R/3wDjuuPkRREwEHPMZGV6QdN5El7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSeTiXaF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3RA2oL7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSeTiXaF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3RA2oL7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5MkWi2209084
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hRrn8ywoRO5vBFN6sqKv8Laa
	itGx6MT0mFCNEXlt+jI=; b=NSeTiXaFjL6ID3nAveNpaMhkDwnZkDa8X1eLz/82
	DnNvJ7DeZUaZNNmsZJHTpB/uZg5fMufu8+QRpq5jRj4qD39yjBaXFpwDh+Jz1Dst
	o9dLwVZz0hfyPC+Ssg8vOKNvQBRrqeCIadZLg/egiJBcMRJxDwVj+PW9+n4wCvmT
	yIF1hmoMPylK1d4TBdqSXlXPphLDeZrrSajdyD+2EqFcieAdH3OyGcFpe6DDJbwk
	A5zWVAQEQ2N7qMmLIi2u1fbodofFsqLGbfgvbg+GUV/E5tyJ8nw7ab/8+M36vaA8
	rkVLAFQ4Olr57xfUQ4epZ9O6phmwjGArfKKozWOUQA08Fw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengay8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:43:27 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c726f4019so6637019c88.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 03:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776854606; x=1777459406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hRrn8ywoRO5vBFN6sqKv8LaaitGx6MT0mFCNEXlt+jI=;
        b=M3RA2oL7kPxIRqJhmsgGkEdR4xwic83CG7jSUDYOuPAknyWtFbEZ/RaK+0RYto3Ptc
         5xmSvnuSHUMhZaKWvHQe0KRj6+WUwrORW+dvtZt5KYev1DiVsllq1yFZhq8JY81QlsGn
         nRsELaQvRd8vqWsSJ8UCPiwyKv0QzJwiXcBhZ8+pwY4quQ+X7xBFdo1q0JDvXpztBFzl
         KTfYmeKO+DZGyfU60XrrZy/I19FU7EL8ZDNzKiAVLThSgvc4EO8BbSkztDrkSpecdbsc
         XoTVqYXUkXFPxdTmQ4knLYzLA03ucTe5ZPlkS5y/F7exMKwEmbLkr4lLbJ3NN5Twfuc3
         cTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776854606; x=1777459406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRrn8ywoRO5vBFN6sqKv8LaaitGx6MT0mFCNEXlt+jI=;
        b=QEl5MT+c5O7AO7elAzPICDVhwqre2tctrFe0Wi6qzo/oS4lVgwPpxXxVIvokBrlXio
         k49K1GPHMySXBymCslHtaOONw6rpI+ObFkpRMyq/mpbhBzKsevOnLOpjnhwf12JpPQvl
         uwKtq7lrUKdMCYbppjKVHNUCLA3wdOK7vg3Wnb0GacVB9lgQilMRG6wqysHl0qeaKtrs
         9DwL4kLvtNdUjoePqPlRqOJkDdbtbnsMPCW+2Wj9Z/GXXIndyCoa66juTfHztME3HIVZ
         8uZ3xlTAeMEE+z6sep5t4h4JpUGKz816Tf5NG23GFNNz9l6b+ddZJK1zDXMwerlde548
         f+HQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OmwDTmOGhnwNAzWTMdKfwdN2qQz0U6WrGovi4/CpD3fdiG+rV8CsU9WkTNNwkx/a7vi0+HjaCA5hi@vger.kernel.org
X-Gm-Message-State: AOJu0YxSVHLRyv6ZxcAFDcaZRhN12j4i4huY+tjVvXl2qxkYBGLQtL5y
	dtUZ8Es6kGQnhN4mx2GoK/DPYo1WLgAoHVycq/1P2BOFYAH9UwLVG7OYo+pVLdMzHJAaOQQJu7G
	GkX5/3LVWtTckzBkIxWWxCe4E+dey/MJzOizgHDZ8Gfb055QELE8yk0/swGZQxBP1
X-Gm-Gg: AeBDies3I1/wF/C5iZYS1NOONN25pV4ciMEZYz5ErtvEvYAhVshYwx8Col1eFYhq9EW
	8fPiLyJexfqslXF3lpbLyKNTCX+Ytd7yGhpd0zync2Kfh9NYT7b560TCR05K4O9W7QWw8L0jDT3
	Yr1oHh3j3wR2FYyHyhGl8JNpT9rk8mGjnGnpHy1h7Xr2dWyz3qWdDxcKRWdGei6deRRt0Hp2sOi
	+VwERk6o6EhMkMADm8TysWM6urBmDPufcoND93s2cIkjss/yeoXekYfibZy+cg3tVAXN7PeF8TJ
	RwwSWwKStYiJIevXTZxHLugnyK23KoKHdfkP6alQNRefON7DcNSMam2XL4h7xbWF2ZB662UFRn8
	fXkDMmJOw/9dtII2NBimtQWWgPYqyzRxnMYDSU7306nW8b+XUIRzkSBQVo8SdsMmp7Nv/uDXGb+
	4=
X-Received: by 2002:a05:7022:4395:b0:128:d24a:a5ba with SMTP id a92af1059eb24-12c73f90c45mr11089494c88.20.1776854605999;
        Wed, 22 Apr 2026 03:43:25 -0700 (PDT)
X-Received: by 2002:a05:7022:4395:b0:128:d24a:a5ba with SMTP id a92af1059eb24-12c73f90c45mr11089471c88.20.1776854605409;
        Wed, 22 Apr 2026 03:43:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbaab165bsm2589231c88.6.2026.04.22.03.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 03:43:24 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:43:18 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: qcom: Document Nord CPUCP
 mailbox controller
Message-ID: <aeimRgvAORJGer8d@QCOM-aGQu4IUr3Y>
References: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
 <20260420034932.1247344-2-shengchao.guo@oss.qualcomm.com>
 <20260421-free-meticulous-beetle-bb3fcd@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-free-meticulous-beetle-bb3fcd@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwMiBTYWx0ZWRfXz3nbOqKDtp75
 BzAaPdAF4BIaiVCdqKKs8lKOoRmDrHhCO7Rl+cn+o1V9w/tLOJ7N4RYcF6Ima1Bq716+ca8dsZx
 J49On/Rbcp8QW7sq6OnXmf49K8Gq25hapAOJ++dYOG/4IvOBZDqXQD6tldMhhoxdDW1OXM0mURl
 L62BBUvZCOz8qWNusQizBgN+FIKkeDyxHe+Hreu9gPiy8jm4WrwOXyWxH2eJNqtW7ruS5WhcC7y
 +GlE+k8kFCVlsslCah63NFVlqVmj+PoMmlkqn5NTyBKvi4hHSFeh71nsKcJKZHh2MbvxtEePBMv
 kswwgkff4doM6VGOk/u4Nt0cDhreONGoe180YC4fw0aSljTdsopOVRWhNkJjaqHDlohUJdGsz2O
 gzaoFanl9Z42JdYq4Co0fCzHA4AaLn+N/20c4WjJ59viIh1K5sSY6o+fbwLoupHiyymh7+oYSN3
 PBBjA/VvIKzpR/+9DIQ==
X-Proofpoint-ORIG-GUID: nsr2Z3CZlKeqHVasDYPJQiwvGlokpe9m
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e8a64f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Uy6chZUXMGaN_UA6pYUA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: nsr2Z3CZlKeqHVasDYPJQiwvGlokpe9m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220102

On Tue, Apr 21, 2026 at 12:30:11PM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 20, 2026 at 11:49:31AM +0800, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Document CPUSS Control Processor (CPUCP) mailbox controller for Qualcomm
> > Nord SoC.  It has 16 IPC channels, compared to 3 on X1E80100 CPUCP.
> 
> And more channels does not make it incompatible (see writing bindings or
> DTS101 slides). Please provide explanation why devices are not
> compatible.

I will list it as compatible with X1E80100 CPUCP.

Thank you for the comment!

Shawn
