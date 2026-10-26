Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019450;
	b=eVDXFnTrgqG4J70O3uu+YV7RN0LG1iE+Px3AcJEQdSh82vEh7TvawA4lTGmHtckxev/G
	 9EKxsxaAOBZK5J+8KT4NM/DbNmIKgB45Rn79x6nt9OztGZxuWgQL+kCYy3Gct91/9uBWg
	 T3qovHO6aA4NUxFZMUw68/5usm9jbP9UbzHIvsrzMlQ7qGYnw1IZ8n8AGA2CWcPlIRhl0
	 J2EGcnI6RpH+gdqN5ZBcaBvbaCmhDBDw3fv4YE3uZpPFsglrN0RCqLypYFW5GnjnwXLXu
	 tminOtXRP76XWU6gfzV7WEqVGN0XzQKjzZqUlaQNdkbjm5rMlGJmihDJ3vi6xo5p8pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JJlwZv7Mylo4VPK4tdb9i0GZw90Uvr+DmjdGxjCMtLk=;
	b=DrnnVxhNBc0T9qGaU1R/Y91Vx3RjG0/pWbDgQ63x5+DIp977JEpSqE659zJBg2j0MmqX
	 c+/tRQ3KjxJTZUOXrwUS5MuBoiAtNxPpt+6KM9zf/DTxcVrQiGtk3TyATdimuiDy2cP7Q
	 +f3rrMR1AgpBrGmcP+uI6EjDdTEHpwfKbflM88tLn8jB4b/E2LcbW9N5gMI/spX9V/E4r
	 Kzz9/zzdT61AHNtxUTerR6U8yRDn39qE5FlyiFJGVHwlyMI7fUqyEnmR/MZ8ngpnVS6D2
	 XFCIt+Mbhw+6LDfFEZP0A/DGEzx2gZ4DWyfY+fLG0/U8jZ4i2Kd6wm00Bln7cyWKCUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TbziUNIG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkfXNezO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF76606A323
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF76606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TbziUNIG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkfXNezO
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMZD2541984
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JJlwZv7Mylo4VPK4tdb9i0GZw90Uvr+DmjdGxjCMtLk=; b=TbziUNIGgiHvLESB
	ZPmHiiqdkTrLmmrIuf9C5GfcZFcnqXlW0MYtifFIntpmAk9D16anYzdRG3Sp5gPY
	+4INz5pMfmWmcVHc5w2JUCmEZiQxNNPX0yG8aFTrb0E1VAEIqy9B8EtvgIIG5/VU
	bjjfMP59ruXvDvQvHL+VCIvwjwcaSPKZE/O6tTXSir+tjKsgedBhUXf/Sc8BGB/q
	NkjtxVwCGEaypanIvL58FCIapgR+IQmgHTebSUIqEpJ7Q33Rnu/F3qaP0rcsbDgf
	3mMbFAklXJQGo04WMian3TiQkndbjYH4C7zU1c8zFV4AJ68a+pGLvWwtA3xDxSkB
	SsO7sg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdagu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:57:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso46007585a.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793019447; x=1793624247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJlwZv7Mylo4VPK4tdb9i0GZw90Uvr+DmjdGxjCMtLk=;
        b=DkfXNezOeronfwK9PBsKPy0ioyXt87OnhP22qHrdAZIFM9xVFySgQRXFG8Sa2UofKh
         b2zMDssqSU/Cnw+7Qh0wmVi07mqfmaVsBSCh5p98/PBhJMTnu6M7CPL8idGv6qj4GglQ
         88I8n4yvUP8UO22ngLlUGmtX0jskcH+nEayhovmFo7jkJdvUwJBnXYwbbcAkT03CiA63
         HNgMx5r143Xz5IKnL8ltN7bS9IKq36ZHEd6dFTa8P6e6rnTrPfs0gu4vThStDPvjYoZb
         G4ugvh0WzXUBdnS7zS1+uWH5XIruTS29XQZSq5DGLxArOJPLzl9BgDfuBF2feBaKgU6/
         auEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019447; x=1793624247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJlwZv7Mylo4VPK4tdb9i0GZw90Uvr+DmjdGxjCMtLk=;
        b=x8mYaHiTar3nBS86/tKIXxzbWVhmh1hxh7Fg/iRqlqTWm+gpAeRrqoo59KrPwpANmP
         3t0WmHAalQg5rE7qU8gCfQq+3gVkVlV8Saxa2da/B3T8PZMWV+d6QIFfenteePF5+ShC
         ogtL5t1fo3kYBROcYSOpqagUcNcRrShrfOAlumxmMck7lYutO1xlaKl0kM/d+XrNucvp
         XBnPzx+o5FkJUS1RH5Bzyo8deQsafN2E8ow+nxjL2VlbaASkdFXs/Z7jxs3FkMu1Yafa
         gS6INgiqKKZ7hG0/CaTmrAwSmI2vKlITfREqqhMs3nb2Xaim/WCciG6rS/LJYy5B4zsW
         RHiA==
X-Forwarded-Encrypted: i=1; AKwUvByX6Qh0IQ/hwa8Bb6Y3YzK8e2ryia9Wb3hoGWJ1pQmf7Xl1QtFYcf6UPXVcnL5BSbLAGnwa3rnEcHKP@vger.kernel.org
X-Gm-Message-State: AFq9FYLUH42tcC8Tsl8kd9RMwaFzz8vOSQCkS4dhu7YIWtOPJ8ILBpKU
	+m+Pfl04tBfIGNc2zghUWT49BHXM6W4TuZQX857i320YAb4rF9ClWNpoReO5uf4fBpInpuqjbkN
	THG1OfT5WMhkrG4AL/tHnoa/C3UWEhJJGEKY6uaRYY+NS2VAG15nGqF1b120H5q8L
X-Gm-Gg: AYBFou3y+bc1UkpMiT9ZMhAxFm5H2xghzPSCh1DKeZURFLc+OFbNKOaqCi/BQuME/9F
	/TQ7gu9hod8CkOOQ3JmiLlPanKXwnz5JsAlCFzf5I4HX78bVn7LuvtWw6bXUjrH3dOzGpF2BzmY
	MyJXHoJDBd6t4+7HXLvE+jfZkVI1E71CsGd31PA/B1KqoAOzSAllbBC/vSPGbH3L1zxRuGJNfWn
	+E4ICfwLieKnZqsLxHkOy72i/7sMdeBFY/hxwPNY57PDcQDcG5LaB6xg5QFdSbV0qBWcy88OPWb
	nJKGdYZfWqG4mxCd58lqAk/6AM5sMoyPvC23oNd9N3USvdKumHedOJkVG88aM9i7q8bR5ZUnpYh
	4UB2xfzkOEBchaqHzokN+rQ==
X-Received: by 2002:a05:620a:8703:10b0:93a:14c:329c with SMTP id af79cd13be357-940ef7c179dmr1033547085a.1.1793019447122;
        Mon, 26 Oct 2026 05:57:27 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:10b0:93a:14c:329c with SMTP id af79cd13be357-940ef7c179dmr1033542285a.1.1793019446570;
        Mon, 26 Oct 2026 05:57:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd6573dfsm316345866b.52.2026.10.26.05.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:57:24 -0700 (PDT)
Message-ID: <a272a425-0d1e-4409-bffe-19b77c0f2fc0@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:57:21 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm6115: Add missing MDSS AHB clock
To: Michael McAllister <me@michaelmcallister.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1792852079.git.me@michaelmcallister.org>
 <7f99fda6f99d6053db240f2f1ba4d7b71da72261.1792852079.git.me@michaelmcallister.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7f99fda6f99d6053db240f2f1ba4d7b71da72261.1792852079.git.me@michaelmcallister.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: INU4oxYXeH7VpHMFO34Y372UaI5blKBC
X-Proofpoint-GUID: INU4oxYXeH7VpHMFO34Y372UaI5blKBC
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf4e39 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=JwJ85b4fAAAA:8 a=EUspDBNiAAAA:8 a=FTenTJsohk8IYGkfYDAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfX7yECmod18RRU
 8SbBW4j+pV4qMBgxlGrdmAK1xnm5qV7CQ/F+AheJxqMqTMTMYbT7625APXRHNDX/0Vv9bJ+s+yj
 WQki5Hbu9Xr5Ph43wCBUk+g+03sW+XY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfX46xOvZgpJQ99
 BlNw7oftAgSMZq6lDliT0H633DdUfQB1W80uwJDb9TKMMvwjDFIFr10oE4QveOqU3wIjbHbkQX3
 L/xwlHL/ZnY2DvUDrezMp49PGz3WBdv7V1zLZQbI/RAjnqLYHms1Rt2QH5OSq1n3U6a4YTE7LKI
 tMDYwvMCkZFn4a8IoOJRokgPihIU4obC/dtR687ETVqa6MNp9dFbC/qq0ewSn3Xhubd1P4owEd6
 X0N9cquNAYcUeeIPGDcXflROpQMlFG+Xjti7AqJ7lFtEr7WdxbwEwxuRTpeCghGU6jO3YWeazGn
 sPe/YemMR2qsPBISi+A7yRJKHgN9pEaEnLwIqzahSaQs+bZtpwLQw/QUZbtR8rjFMBo5ZG4HRhv
 fwikrLxnxJwm4qEYEuL+8/jSA8zFnrdQCQyatqbw30yu5EFGa9rG61R0X/BbUj3YMSlDetyr6XS
 NlTBZ3nibELUKGFJTiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260051

On 10/24/26 4:27 PM, Michael McAllister wrote:
> The MDSS node is missing DISP_CC_MDSS_AHB_CLK. Although the DPU child
> already requests this clock, MDSS resumes before the child enables it.
> The MDSS hardware-version register can then read as zero, causing
> msm_mdss_enable() to skip UBWC configuration.
> 
> On the Motorola Moto G10 (SM4250), this results in garbled compressed
> scanout after display power cycling. Adding the clock restores the
> UBWC configuration and makes compressed and linear scanout agree.
> 
> Include the DISPCC AHB clock in the MDSS clock list so that its existing
> bulk clock handling enables it before accessing the MDSS registers.
> 
> Fixes: 705e50427d81 ("arm64: dts: qcom: sm6115: Add mdss/dpu node")
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
