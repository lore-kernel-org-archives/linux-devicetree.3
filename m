Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8B33A873B
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561150; cv=none; b=nmv7XnU6PGzh1SIG5ziBuvLlDWLgzxB5nqW/kTgJJPPAmoZ1tUyQhLpuB5I1sER3y1VDX08NQPbeznFzO4InqWjhFMYZ9B/oaQuvTKhh+pV+SAVzmdhWIwnSsz+dts0EhI7tTj0JvQ8G3NYjutYQEvFfYriD2eMJXxckHFQJO7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561150; c=relaxed/simple;
	bh=7VxopGj6OKf6wwgAmmK5nD4wXUdypyAd6t9vKyDOmIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpNQ1VI/vneQ+8+WmXMxHhfbjYFBRt2g5dH6f3wpaEnT1wCdmje2q4y369wOudqAzpYy1lGwpa4DqPhrIQT2WxV/8o6he3aobKPJRrWluW4ndI5IAL1pgELy8kESHTsJc8xu2Vq1oq0IwQ0WPab9OiSQQtfv/MZRY+K0rQ/5Xkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RH9N8BYx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lo2R2Jze; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RH9N8BYx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lo2R2Jze"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376hNYa2580434
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 11:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuA3/x1S6HYosIQcTCsqEgUi5XC8HNDAlPK2rNrD76I=; b=RH9N8BYxu/OoCdN5
	Zv7pjQeDLhWnl/+EWNBao3OErZ3jFXLuYAjY4WcpFECccorCchM2bNXs/mtxdz1s
	gK+on9zu3KOT15yfuDJ8Qn+napdG1BfhPPYoRzj0lNUIBkXZfwtMg83tf6AucTik
	YY+y2Db2Yn0zKOFj/8/y6ytdvOAes027AIFUCo+ddWSrce72uY4gnYa0v6URLo/j
	EAIxRiEp0aZS33P8OWDwEo8Ft01PeWYiy6ioI9ga8zUxQMb2LuNEVV2kAo8wDApb
	oQKvzEN3wF6zDPyh/KaAm3Sqyw7O+kA4pfO/DqoeBieyhXAixP9P49F5T5j0Emyt
	zkq44g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf2fya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 11:25:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d59968444aso59933585a.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561147; x=1776165947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JuA3/x1S6HYosIQcTCsqEgUi5XC8HNDAlPK2rNrD76I=;
        b=Lo2R2Jzed99tRTHFEuZE9Hsx4AHzhhjaFQwgExe58hSDKxr9lMTGwgx7XiWrgjxLmW
         iExByl+wpS0qbJe233+yGQbHUWL6w8HhikMTXiAOFy/O20wUpnsN8a+AkPOi2bcsyt7W
         rwF9AShZZ6pmGM80ZFsjJwNucqilArNqj5q8eXhLeO1GJ1WDzyYyjNmwhYtfuaa3tqOO
         gwY3+orbdj0y7p1NvxBKGEbKGO9F9JEYbLaB0qRIS1oHCwSMsmkPzjA2WTHlX0nedolB
         aTPIL/BBr//twsuHxeqM62UhR+jD6QpFPn15Pa8F0PBvOf+VmcdybeJIB5LFnJIuEJnH
         4n9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561147; x=1776165947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuA3/x1S6HYosIQcTCsqEgUi5XC8HNDAlPK2rNrD76I=;
        b=ZrlUihHjyR1SZjTRZajUJbkJsg6Q7Q3GQr6IjsrrJstFR+awKS7iwJCL2PhGeIx4MB
         Q9rKBt2ovJAj1VHKVU9FMgFhRLgDXE5hffj9lXwBC9F8GQ3GPfPjCXJKCvRXD8jDlXhk
         gZBaXi8HAfKyzPaTjiuKmp+9cRyE7QwXCFc1OIi1c43vhsMDf+lc7BQyaY6wwJAZegG5
         2mPT3ESXzUeT8f7yj0SJizJ0sHAksqE3FqFixUOQvLIno+Nx05lXs28iKEvrB3QoH2FA
         2Ue4sZ2oAJTmm7G/i0e1agJFY8c2WSVCKIgMEa7da0oR1OWvXipFuiqVH9ItiePrEkna
         WtxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNJFZuqp6n7qNIhK4ZpiGzT3+15cYvbxl60ae3VFKOH9N68HNhgacaLsq3F0qu8h5+1kLNoDO/cyji@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/crtG24/a5aR9o78Xg94Bt7KgOCHZrbjuL0hbcGwT0CU5Qyji
	yxko4R9OkXv6WDC3OQX5GDGAHqRz6pMBd83jch4duCoCf/kYHNYFxXGgTdMqhFCnI5RfnhMxZt0
	mez8c7viHVyIcp28jh/d4XSasP6UX2gbq1TM2/66ye17h8DDo73yagACQQLzyDRdh
X-Gm-Gg: AeBDietxlfX7MSQeJ8CUQuRqfasaaH4w3int5S5vfNaYDmLrsXRc/idAfVoGmEwuVcX
	pBnxclxvYPS4yozG8hXu9KxH3CMNsska/4icp0YKPOcvB/fz162JzKdFaZoWp0DBil0fMEVMwXI
	NwKujSsP5ZDa5fRr8sIZ/XNKnKlE+flTT4iDeeMaCpxZMPC+O5ajczKZ6No+WAzIA8PqD4Oa2bg
	koMvNVHQOpteylCCJQqUrNP9EQA6UQ32OoK67vR9qMmSVc2EgCtygZC1eadNKnFYyTQohl+bdiD
	Wq/BFDzf0/QXe3YiaFBHJ8IU0h3iHqPGZiV7C/kaMpTQJCE1Oy0Xfa64MMJ2V41hlS5ZFZ6J85W
	iJvu18fBlJXd07W8IBne84PvIuR+GbPvH/q8YeGg8+Kuwn4ieO8ypO6RVA45fsz94jtq+xXE8Ir
	dUIJI=
X-Received: by 2002:a05:620a:489b:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8d41b2e38bbmr1773618185a.5.1775561147583;
        Tue, 07 Apr 2026 04:25:47 -0700 (PDT)
X-Received: by 2002:a05:620a:489b:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8d41b2e38bbmr1773615985a.5.1775561147051;
        Tue, 07 Apr 2026 04:25:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a74e8sm4218517a12.16.2026.04.07.04.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:25:46 -0700 (PDT)
Message-ID: <fc1fce6f-b37e-4d69-9121-dcf8df9740f5@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:25:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: lemans-ride: Enable mdss1
 display Port
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com
References: <20260402095003.3758176-1-quic_mkuntuma@quicinc.com>
 <20260402095003.3758176-3-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402095003.3758176-3-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNyBTYWx0ZWRfX1pzoAbzGbPyV
 BypZbcqtw7YxD2jzdTIImO/KX5JukhGHU1EzZhKvZ/uNM1CYpX0+Kfw4+2PtvMTa0Y2EB/Q7MXs
 QeEX54ulZ3T8hygUz6HFU0/BmRdPtQkkXEgSABWWtqUlCFnZwG4JCsOdM+tB9YWBP9A7/lyPidB
 vXE4J+E6OTnVNFOCQ5L3NTBqFgr1ClfbmC5dFAU+sO3NppEoh1SX23HkJDG1MXAUNxm+vlmZG1S
 kGMkGT6oeSL4to8HNWdf+e8QvMqOZCKtlNl3mb8Wmlqh9VqyZn18bNNMVpI/luwDXBcr1idaU4r
 8e6t1iEUBb20GoJbamvLU/9jxKHSt+gofkBM1EhTU0ADLkypt7d73QNM2HB7Y0tAltzLYq2b9Zd
 Abis5eABwnxoXuNz4daKCQHcwn7RmeudL1cNEwat5IFJu3wh1fqyPwApMdtWf0bBJmQQXf35jAo
 b/to2DSv+6ewHF9gulA==
X-Proofpoint-ORIG-GUID: CG1G9MJJjFE6HO23BzijbUcjxt2wcamo
X-Proofpoint-GUID: CG1G9MJJjFE6HO23BzijbUcjxt2wcamo
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d4e9bc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XQLX8yjaJUNYVVxXu1AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070107

On 4/2/26 11:50 AM, Mani Chandana Ballary Kuntumalla wrote:
> This change enables DP controllers, DPTX0 and DPTX1 alongside
> their corresponding PHYs of mdss1 which corresponds to edp2
> and edp3.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
