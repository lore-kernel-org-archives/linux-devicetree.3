Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB8A33DEFC
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 23:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775344198; cv=none; b=ODqaW8sFJoK0PAvljIsKsFvqcrw8rtC3JUIDi+mmJ4oFKUr6BoBFCyhhIT66DNrUWGUG5vSi+T0FJvKQWlZ/OC5IEuWebd/ZEKktDEytmbtnqNIcpIEkrX3jzMytdr0xqWVMSSAdAg8VVWV8GBdSMq+S8P1nNMxzrYNiLonif3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775344198; c=relaxed/simple;
	bh=yINCXZPezpQRjRXbC2fID+SBYn3Q4fpgJBxMZhHsppU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nyf/pQqM6Yb+3+I7yAYD4y1bGbuAYZpVS/iG/nBFvRikz63i3CMmdGRLXmtDTTri990vYuPA9xEQHNgQJDhcqXSwEU5c4DRhag8mRPrs/tOi1fa6VxEoyaAjug1aFrXMbCooKaUokRAco8Hk3rXZle5nk5UE1m0IcKhhlFPyUzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FNdjwAqv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2X9wq6G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FNdjwAqv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e2X9wq6G"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634BoDBK497886
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 23:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r/VeTwFFRyvu6ZUF2V1QEPhF
	MDfPfnRtBJNKVU2xZmQ=; b=FNdjwAqvN9I+adb7YdHR5/mir4KjVHccFxSJllN+
	te7rSsBDRy98rz44MRj9RjjuW2soTnrAtJtJalAHKGfD6UJsxryCmVObc8Qi6QFo
	t8zh6E0NXjwxHVG8MumDWJldL7Ka9RK+0ITWCjyMv/een+Y8nPlBJPACVP5TYTBF
	V8lxkFZAUDOBKj/3F7GbPLsr2geNBYukINUwHy6fAMrKMmHfdl+/fmNg0tiJzAfP
	TjR1aWVA994e0MYuqAix5IyjG3lR5wSdzJ2DrL2BJRpdkupbC4wo1GEAc3NA7+b0
	MfGIDbfx7zYFLyqQF6CiojfodmOXrLJNtfFzmjk/9T+Vzg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqshjgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 23:09:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4987c698so75970601cf.0
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 16:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775344195; x=1775948995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r/VeTwFFRyvu6ZUF2V1QEPhFMDfPfnRtBJNKVU2xZmQ=;
        b=e2X9wq6Gm6T0HD6qqgIWyC130/aA1fSgXduWT16N7EfsbdzOGtfshIo2ouHKBBw2/L
         auo/fDtYJgWk6NSCVhItUFuhb3yrcb1LMpV5VpMcEbeblj8vRPYqF9aPHcL7xtbjxQIW
         dUTdelL/6p1skBl2IqQliGRAQu9PeWIhmJIC7al622cLdxRzf3pQZ1+CRIAqlnHUp99x
         0Qy3oFh+sZqJ3JAAL9i+DttomveXfX1Q7Y7FQZ1pRkHWHLdAXaZQ8L7K6CW5REyWG3wt
         OAsE69fXYWu82i5qC5TAJNHJomTq0hhhRgYo6Pyh0tAGq38S9VP8D5pj70F7GeRZAq7J
         uptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775344195; x=1775948995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/VeTwFFRyvu6ZUF2V1QEPhFMDfPfnRtBJNKVU2xZmQ=;
        b=OEXgPgrv3grnto/G/OYzzUsNz4YxuXNciXVDKf4KaRuMAIm9hzOp0CKSswFARD7/0b
         wLP2Ah/qL2jcvNx6uG0xNIlzPdshYuCgRUabEvByBsmVjOG8ivnETCuvW5fba+OUyEuG
         F+3lzE1NZPz5DfrSQVza6kO/5+NWAgbh39F7dgpn8J19Umb0NLbGT+xYJTOtDHQQJB5F
         8hauAVMt8RNnPqF5YaHbzPnErUFoB/Z9ZO0KJS6PQ0lpk9zue9xeWO1Ie2GG1shLSgq8
         Abu/AbYg5QI6keaeqrDHpbCWi58wJmu2ugU2pABIjgaJVASAVkxJcKKj3zM+J0xqBjst
         JUNg==
X-Forwarded-Encrypted: i=1; AJvYcCUXjvW5PkcIiSLgH2RYMOnTHvTaeOS3tjaHBV22A1hPFaLUeqBnRyRFP2WuFWvaoOusxn+ue3TkhtXb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj9WTTMy6EEA5F5MFpe1iZysMqhtInKfXsTuKwDEv14ADcdupF
	R/nF1jwDJvcVsHMXelb6Oh/cE/uRTdOjDUAUL1Ei9CQhKCIo7ijizkAUfk6Opcar/Aisl0LGXo4
	ZSKBhFVoOtdXwuk0OQ7B+rQE9s5xQ/w6wvvC5Gh0E+hoTKsaLvil+tP39RspM/IOo
X-Gm-Gg: AeBDies6HRE7Db3XAXq5qrM00Zg18+8OFMmO50GRrqKrFPVbzWgbcmh4Fvxt3KQfD2z
	SGTQ90/PB0jm01TV7n2cFTOHASXyHmlvKC8ebMcPl296TU+yJBWgOj0k5HQy0Mj5Tin9qgLS4hl
	I2Oh//uGZP0hhZhVMx1SxrKDR9HCsutHYer4tZdc/SLIlah+nl/yr9tQskX2KS62PUFo5FJX9kW
	YLk5eqIqLktqA3E7SY7CGNQ3wlME1Zt0qZzAbTK5jUAxv48briR1TVnM+b3FnfpKs3wffVT0H2G
	sH+OvJvRC732konS3VuapQcanTwwzQJHU8E8bgTwer70YQ4nccnbTFvCmK3XmTg3eR+fKuXTsw3
	WIVbXIf0Nl1pwZ1ViJYBQ2h/ioAx0HWK8HQX3UiV9JJpkhq/xJ1ajFqkEQQ169LXF2opPIHfUy4
	0LlaPH0xB4foNW2ifp2h32EOAkA4X3j45Md3s=
X-Received: by 2002:a05:622a:7:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50d4faa4f03mr151112321cf.14.1775344195029;
        Sat, 04 Apr 2026 16:09:55 -0700 (PDT)
X-Received: by 2002:a05:622a:7:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50d4faa4f03mr151111861cf.14.1775344194624;
        Sat, 04 Apr 2026 16:09:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc60e1sm2321657e87.51.2026.04.04.16.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 16:09:53 -0700 (PDT)
Date: Sun, 5 Apr 2026 02:09:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8650: Correct and complete DP
 address spaces
Message-ID: <3a5fgah7dpyc2jvcsccnhfwl3oakrd2mkyxrpa2rpg63ew27rm@3xuaz3t2n3am>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
 <20260402-dts-qcom-display-regs-v1-5-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-dts-qcom-display-regs-v1-5-daa54ab448a3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d19a43 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=EqZgH2Tm9vfPv3d_J88A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ww3j5r6o2_UMuA_sjMJDYTSZAJLdDYI5
X-Proofpoint-GUID: ww3j5r6o2_UMuA_sjMJDYTSZAJLdDYI5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIyMCBTYWx0ZWRfX5lVfpVYA3zUF
 4ddAYWlVEe1acgr3dmT+E/ZkO1PleimX7DxnrCOhGmxF1Uf7tol4tmzy8rT5xb83mhZIUydqLQN
 ywELzyGTgawbIJz2+W9sHeiYj5hV++K5u8B9Ikx697/R0UPJbMp95wfCQF2TtdwYxD3XCPKQRgT
 KXk+dDaRHat2JKKMsYNbBT0AGj1z1aLFzO20M3KkZcgWhHyNOL0pMXiDBqERTrpkWxVRuk7Ji/+
 v3AfeVpcEP6FOLeigW/xtuDwHkq0xnPN+J70bjPCOCfDRtG6q+kcUwqh8BCi71rZy7/gCKz8UJE
 ecHQmdnO9CgR663enMWIhS8E+aFiA84jhGq4op24+NQMhfjVwDC2I3JVcJ/z1OUEHSqJU1Qu3Th
 n6B4IearNgVofFwyzJgfJzWeD2zoVIq5OzDdOZt3Q8sN0ft10J60iQS2IkmQODvgVI1QQIOpHSZ
 n4hdTlmVwzC8OGPC0sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040220

On Thu, Apr 02, 2026 at 01:45:16PM +0200, Krzysztof Kozlowski wrote:
> DisplayPort block on Qualcomm SM8650 has few too short address space
> ranges and misses four more spaces.  Complete the hardware description,
> which in the future might be important for full feature support.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> dtbs_check success depends on the binding change (first commit).
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
