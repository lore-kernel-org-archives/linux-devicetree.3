Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A3C4A5C50
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447690; cv=none; b=kGo9wzyLaUhKuyvhrMy6ckZao2zqBm2ueA3i5IKZRshN2TlDNXotGkWieMwHWcvbAxXpNo7dMjLRGasXhGtVtveT7CP6q/UH6wWsetzAYhQXR6yLgupPIacUaKrVPPrULhoAZh130OT/NzWWs7udyQ8gUJ4dovGZZJl7foUqoFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447690; c=relaxed/simple;
	bh=rxR8MQA4hEt2JQIcclBKv/p9XrCLjv/c8S8prUWY1fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yz0eX0vwxd09+0QF5twp/J6hh5gQa77hszImPCu7HhMtF8qneCFngoSQr6omNwMiNOUCbTdM94UznOdBnBg607T/fSbT5gRV+sizbWE+zzF8sIYfyWCQ43bZJT4S9kf4qMZB2VvCbZ1rj314m35mkG5at2DmcC83EhooteBevvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U627fj95; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EY1DXcY7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U627fj95";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EY1DXcY7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAN8H1314593
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 15:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4U04Gmj8MHmOKgzajdN/vYqN
	FcXfl6+LBbOXXMjsXhg=; b=U627fj959Kh6nJQKhcOV4OQjhCyTFkqGwcMCDz7V
	u6RIVKNgeEXL8dBP5tYHele1OiO9Add94ybQaeNtPMhpNYAMA7SeE2/YIP2wLXtE
	C5YErqpa2crw/qtPuvL55NTCdRHKrjv1llRu6JjMSkldmcHrVx9JZbQ4ufIuUBJs
	tUAiIpwiAMO9NaYhNichZ36IWvyiOO8gcRJ1+PfZuVHCCtCMA+EckHKhXD152ys4
	YhxqF5c16fwgY5il2knM8OCvPXaY8xC5ZFSUg98zoZN38uUZP5LwBcmSsCaxasQh
	WOFeIxmJILlqpCnP+fHc0HlHRYeXz6HgLXxWmgheajeScA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdncwkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 15:01:28 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e7890eceso489369137.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788447688; x=1789052488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4U04Gmj8MHmOKgzajdN/vYqNFcXfl6+LBbOXXMjsXhg=;
        b=EY1DXcY7cv+IJOzIB5HEGLwaqkjt94P/hcivtBY8l0/qgv4EPXfdfPMeAfnbS0KglL
         mbGGL7GOfKQnYpvIbXA0WOOFUmcGNQm96WptPldjMdAWvgpY2OOc01keuDeRhYRcrJR6
         6YS/DiAhltjSDjJ0JgDogCInsw1ra+cWfVFrMTmnHbbpJN8qZeD1fFpkRtVhN0VimiGG
         LHEdem0ejNqoWOk6KUb9kcJyTWRIq6nB2wvlY6XZCbJTbTXLdpFdSThGg7NLSotkyHKn
         NCNfB48ClkOAI0Gd/IV62FmbmDf58nm96DSuJC2N72+xgcazSAP/PFWJJsXfAsSyNAo3
         /X2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447688; x=1789052488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4U04Gmj8MHmOKgzajdN/vYqNFcXfl6+LBbOXXMjsXhg=;
        b=e4Iv65kP1s8sdgfZ8ccSdhTe56UX3CNOlB+VePoi7kU+zrF2UcfsG5aknadBGHQZkS
         i6UCyDptsHiXqsjqL+I7+uBtR0gp3DjMxkVeeXOyo9/YXlLOGj62FeOgPSSI7BW/IfoD
         zgQ5OClcM7L29+oGB511xjCr7EpUp/O118eTOwYVRPKDRMzzGQHJ2RddxVWnwxbTWgMC
         fFIFRcgm1DBgYqYoWzxUZ5dX8gP9AFmRbaM57wI9rAMUh2bRV1OA3PdiRihtHxi/JFEm
         02i1V+TwuvbQ1G119wEmSlnHrKpWzpKyNjEVg5GAtA/owTXq5wWA4+1ps16iduKU7kbr
         Gnew==
X-Forwarded-Encrypted: i=1; AKwUvBwn1e6dA959xooJrnn6bqOIS4V4P3UxZwu1FjYaF9fHerPlHOsgRTc8yaY+MZ9BhU76N98daLgKOGC4@vger.kernel.org
X-Gm-Message-State: AFuF++nZnQuw2gEMO0T4TRLn/OrzbgqtvbxLOoPrB8slOk4ztZkQbmCg
	8pOE2bWvYkhambwenkm9SE6DmWNsfruJhBsM4v+zXsaF0dEQgx75FZb+sgUuVEYknGcCjfcD/a7
	utuB3oHH6CE85NFSFlT2/nAMC8n427Lx+cDQfUS/CrbKN+7Ou0f5XVOFTD6/II5y5
X-Gm-Gg: AYBFou37o2RwScANHPUXrS2aRp/mpKRcRs8lJQUCuZ/xJ7HJeQtdqvgxXQAvL9n1mfd
	EEnB/WAyNZs18LWwVgioq43q10etgH1qVeL+4c8RXmbgXyqq43dUu4w3MkxM0sl5rWqdHKcPipL
	waKIwrUA33d8jGbAm3unnumjIXXKpZpbLTNuhuGRWTYYcTcbC6Dld528h/pPr1Iv2ydnfsri//l
	60JKsEQNkBCHibCm3vK70PNX651tTCC2FzumNwOAYtV6nnFsLWOjULWgWvtTqFJBgqdvvXO9j9W
	NZw4nIROGmgOR+qPhJgnkvKPttpIwwG8QMbq5HOE0UZITQhjA5gycIr/PcUoe7E7+1gJ/+7MUVL
	D5Qq59Tm5HO9XGw==
X-Received: by 2002:a05:6102:3fa1:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-78a1f23df59mr3868106137.7.1788447687290;
        Thu, 03 Sep 2026 08:01:27 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa1:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-78a1f23df59mr3868060137.7.1788447686604;
        Thu, 03 Sep 2026 08:01:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d9c6sm79144745e9.11.2026.09.03.08.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:01:25 -0700 (PDT)
Date: Thu, 3 Sep 2026 18:01:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sm6125: Fix QUSB2 compatible
Message-ID: <isf7ngdhk2iffcs2oallgrpdjfoiaen2htjneu3f7zms2a3agm@zz2nz33w27lk>
References: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
 <20260903-topic-8996_61x5_qusb2phy-v2-5-4c3f980a4560@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-topic-8996_61x5_qusb2phy-v2-5-4c3f980a4560@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a998bc8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LZHrLB2tbJw_R4RbR5EA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfXwcmpdt02hdbE
 p0cNcz5SGwY/JdX9o/YZ9JOk4lsZTkCiGpZekoseiJb7wJwtcEidSZOMDwy8YIw2dJihy+SxN2P
 yb3TY0rLTaHj3jSvxVqAxWbauLCa02k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfXy2f6zjFvnFb+
 xwlu6RiBRYkpuA1RpoxZzCvDOL9IX4MQJP92XTv3LNO6SoCGtvtI57+9KiRp0F3FX0sO/NTVq8i
 2Zq/zgiJzxw+cKY9PEbueYn+xDoJjxaLE/qrg+lBNLviw2deUY7oQwa4QWQAtz4OXOCFh+tQTpM
 qQQBxy0R9cf0Qa0w3FYvJuiiUo4G3xPbzw9gWD0j9xJsFUhVKZv1tRs6nDCDSS/FaFFWXhPgzuK
 0N9TpTt38XdryzTUL5D8mlvJVGB+qjl4SG5sr2faAPHb/EA+r74k0r2FdbM6cv58cQKJjEJfxvn
 LKrsB8g2BZOUsjIqnCBHNsaK2qRChuyeG3ed1dA8XfzvsP5DtOLVgs98ckx/t4VVEQZ5vf08nFD
 ymtMW4T/7oeChpnrhu69aOtPKz0KdCgkCpH6cXjlqv3d8NOZHd8UiPMwBjf+46PB7k59g+mTfjD
 XxZ4mpgRuvNccZ4pwSQ==
X-Proofpoint-GUID: FkDJxMTQSGcL0c_Fvnjd61vStGjViQPy
X-Proofpoint-ORIG-GUID: FkDJxMTQSGcL0c_Fvnjd61vStGjViQPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030130

On 26-09-03 16:25:32, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There are a couple issues with the current description:
> 
> 1) The msm8996 compatible is wholly reused, without a SM6125-specific
>    primary compatible
> 2) MSM8996 has a different power setup (VDD powered through a RPMPD
>    power-domain vs a regulator)
> 3) MSM8996 uses a different init sequence
> 
> As part of fixing all of them, use a SM6125-specific compatible with a
> SM6115 fallback.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
