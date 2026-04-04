Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6050C34405C
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 19:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775332228; cv=none; b=o6WWIlqrw9WXA25Yn9tRXtURRmnQYFEizeggrXTLjnYJnjQDexTs4zfRRSMszbqym61d0IK/wkEJLENxJ0k5f6teYb8hFAXc3mY8oT/QvNwW3zriZpXU0FSVyih4QFmzmO0uS7/Fs9EvxNlXLBeCE35CHO7PjqcknNPPBYnNGpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775332228; c=relaxed/simple;
	bh=oEvka2cCVwjdZ/2SaYmzaRYlycgatkm70cRMMQnqeAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTqMnDqzjYhkrs3aa9F7GiPjv/SSALThTqwuNTFzKZnEfvEaLp0banhdk9lMjt/eOLssE/IJv1zgWFe0WZs6a4pbzzhlFsFTWiV8DAk7zU11j677+8mw7g9zJjTL0VZYGtcjsFmRNzv8iM2ybphYXGEFvGkOmSZ9OsL4hXC3TvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=koNXpQTE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3q0heMI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="koNXpQTE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3q0heMI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6342qqYG2199939
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 19:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nkW0O6lMxvTRUMJ8i6D03xKS
	5AckAl4ZfZ5ree7Mv5g=; b=koNXpQTE9zQSNzQZxGeMrvxvVxXKhSXSGHFdrTLJ
	dlcmH92/U57oK6Atht8mImYfR//83hGsLUjSekmPn+en4f/bqkhNdVAw7zcHxXjB
	e2j64B0qJrGpptHVseYLgOn59RrjeKE5fys8bRTa4Pt28xbnIpg1uJbtJUIILh/Z
	3MujT9A4MMbIdMdu3m5wzVmcz1Nmr9Cl2naIj1Q3QjWWFgXsuy/nG+UmfB1jm7t1
	PdlPdMdTkSn/JH1XAhQZJfFEisiOLQcrpucn+T+zH5y5hVlMAWw2cUlzoqHQkQKQ
	/g/C3gxqlmspBVLaLRUqzkFV7VHW4ZrRI6O1Nin9/FZw8w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7u9e3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 19:50:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4b81c632so65546371cf.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775332225; x=1775937025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nkW0O6lMxvTRUMJ8i6D03xKS5AckAl4ZfZ5ree7Mv5g=;
        b=N3q0heMIh7ezYYJc6wnwbfFRTJTaruzDazVqW2xNVJGI1secD3mcUu78OlDML6oKc4
         Cn4SrXgUJ+lIOhUhQOALyzu1PaAyJ4gidxqxJPpNxEWyLFF2g5RjZY7iy7aEskHWAgvX
         9hY5NOxE2w1Tlgv1BAecQbKpjo0nT0xacPY+AUg9g05r1WUzoBB08Bzqkwf53r6g7WOv
         usvu0/WAbS6n9HF1fRZWUGE2tIK4cDlAlYjeehFA/dw94Z9OkyTYjtCo/4FiVYWx/QPZ
         8VhSIyNhrd05n4LiJyVGcUwIxClnqmhVDBUHwBPn66u8a7yhadBjAiiOQCp2FqDFOZj8
         N4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775332225; x=1775937025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkW0O6lMxvTRUMJ8i6D03xKS5AckAl4ZfZ5ree7Mv5g=;
        b=sqrQOP6uI4FbTM3cGh8FRprIJ8zzgR3IMZD0hIEbfr5wdHFE0/yF72eqTkirqJ+2xt
         rV/L92V+SUWQN4RtlStakhnhFqe+cn93GCoPpwpUd4i4I02Zhq47mdyH6/RTDkSrSrSQ
         hDOB+VQ5rN2JDUBuKzxJk1dz808KiBAwZpKCziCuRMX3jEv9X6FLU7FTbCGIccT7Fu3W
         tdkBw+MvsQ4Me17zWWLhi34n62+bg/AZOOP3w7e5kk7UBpfvZzd2pFIICtpJA+12NLym
         xwnKbGpzH1YQ/3fDG9FeLQw8PNYuUY5H9w8QLu1dIFo1ubYwDvOxQGQIj7Q9SgrbRdgY
         TcjA==
X-Forwarded-Encrypted: i=1; AJvYcCVaPeLd23th97PVPcZai7N9exjeK6IigOtm+jddpN4/NhinRx7JVxesGT83RwLLx7GmoN3l7dpcZ4Oj@vger.kernel.org
X-Gm-Message-State: AOJu0YxHrA54g4zUfV5kjYmAbE5Prrsde3RdlbqeRb6aOJSAINyPLaNm
	20Mv/SmLSMNlj4NKq8GF6Q2D55ytR2SaSWTjpPydah5oU7FaYo/E6vKWsm2hTfSXBpSDmnnT3T1
	4ju5WH5mrtWV3D/ONQNtejiNs4ggHeh7AYB9XSVjQVldNdqBy2DUUhzV7+v8fZO44
X-Gm-Gg: AeBDieupqJC2rB5B6a4ozRo8S7o58kRo5+gZZ5u+HdP9wvkWkKiJ4gYVo5Hsh9HDTzf
	dhaT6eWR1SRAx6MehltwNys1+fi60oi4zKKTD4m9JBglJPlS853jd0A3/FEAXxYqL75db00CPI/
	JNZG/PiDu415G07mYLegRkSGZCSlZ0QuP5azf5JFn7DsOpexZEvIzAOGUdxCEu7sHEyhM6oDsO7
	yN2P5pZzdtqoLZ0sYKMSVPKhpSlyLn9xGE+5Ao8TE/MZhdUdV99puCuZ8gBObilk0l/nZG85pDy
	nFsZqohtyzDCcWceijka0HrnRF9VNHNGsWBCtAYpyAOu5qTngTW8lvPmm9Xkvpyey9R7sxkS0pP
	cXmSxPnbeLVSARHxTNhC9gxyhCK9zUg/VMi8ILPeJ76ad3fs65SWc9FvGKCO5cD+T6hWFtidz+s
	QONzgOnS6mfMqStX9+QYWAnQO7os1rLZIHTxw=
X-Received: by 2002:a05:622a:8359:b0:50b:4be1:7c95 with SMTP id d75a77b69052e-50d629d5696mr105025751cf.30.1775332225613;
        Sat, 04 Apr 2026 12:50:25 -0700 (PDT)
X-Received: by 2002:a05:622a:8359:b0:50b:4be1:7c95 with SMTP id d75a77b69052e-50d629d5696mr105025401cf.30.1775332225086;
        Sat, 04 Apr 2026 12:50:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd8491sm2286574e87.83.2026.04.04.12.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:50:22 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:50:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg
 warning
Message-ID: <lbk2h36ja5zdjkqdibgyz4eiszdicz6zlshtrtkjtkmhnacinc@pntbgwqmhfrv>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
 <20260404-dts-qcom-w-1-fixes-v1-4-b8a9e6806e0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-4-b8a9e6806e0a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4OSBTYWx0ZWRfX6x4dxw4HYUia
 CkmI21+rNxA046v9VbHaNhN9H3fzchjXWE3frK0QTLMxh3YL7kK5xPS5XBrUsoRQuT2pmuxoMIJ
 j4r00SbHMVEWSVXFBUpJartOnQ0+BBvPRH6EZ3akFv9XIsNPug2n3MAtx4Jjs10mLMJJLoROLwc
 tnF9/5u6WExSyUPa7KOBWUm7KSHd5GSKk4ByXeY1/Ah+M3OmK/SQePPQjmLHqCC2OGVj6tG57uc
 uLG3qbeA+OkBt9D6eR69RQAIbaHQf3FYcFXcVSvqlxVZbvN97YZrB+TkbKr104syz+rywr7fZzP
 jIXcZfQnhzYYGalVZRkVB3WhR/bawSnHCVibLZVBWM7cdbTI1edmTufFBRFbw5q38gb/ySWmQ34
 VnkTukz8cIhPdBB+wvoujFtpRWCJYxjm5xsj02oDNB3t4ZoopN+E8/xyBkyuX+Dzbb8h7WNsBzT
 fZgc+pjacE7MuNqLtCQ==
X-Proofpoint-GUID: JlkB3Cf3ANuJSaxGj86vLh3Jy-0Q1B5t
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d16b82 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=9meie53SDYsjhsWzb5oA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: JlkB3Cf3ANuJSaxGj86vLh3Jy-0Q1B5t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040189

On Sat, Apr 04, 2026 at 11:51:03AM +0200, Krzysztof Kozlowski wrote:
> Correct the unit address of phy node in Qualcomm SC8180x SoC DTSI to fix
> W=1 DTC warning:
> 
>   sc8180x.dtsi:2650.31-2695.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
> 
> Fixes: 35e3a9c1afce ("arm64: dts: qcom: sc8180x: switch USB+DP QMP PHYs to new bindings")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
