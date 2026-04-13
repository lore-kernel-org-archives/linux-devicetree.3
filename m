Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874EB35AC32
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074241; cv=none; b=UCCf4YE+1bdEkZ24EV9Uy02scAIfFoB5ClaBXBOxEGgbKu2OJ8CijiqqAKhdrnBZkp4QCqDSOZpqILopToW6x9b0h9Zf9t9Bnd0fnPsvKC/W53UgUAJ/vqkjK0r7bg/GX2hKkO0cxWZmZKmdXCleevC4EfJsWFWug/U6f6I/4V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074241; c=relaxed/simple;
	bh=JIK9t/UaT2zuGSoM5C3ZscOwrjZcIDgMukjXlrPNlHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0JIzmI2E+D4PNz1C33DF1veMbWiV0NQRrWbQj6+tkovT41iA1nU2GmoqWSXGB7uMaOSwzgdg2jw3LtjcEpNLeMpQQG++616JAbuc+qrvC6V3b4UhSiyO/AAd2A/eyq5hml5DXcoqvtQF2qvRampMJApQq9/uxeuVTQ6n+t8NOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZvElgcEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AwG+ewSn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZvElgcEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AwG+ewSn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7R2c6117582
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IePX8ablR1DL6tpkqZbrnc9SY1kinjPFiiuTjNwkJAg=; b=ZvElgcEbcftowOIP
	gkJB3OqoKFELpTxRt+VZFpjxHJzGmo+fBUGA/sxn2rbxX3UKcNz8Z7OmqeCV6RLl
	eUQhv45XR3iqUMLs8g50MS1f+QVjH0kzQ4f7aBnJXGBGp/0YlCSbQKuMkGkoahex
	dl2z2EqG4X16NeqBQ9VIMhJh2parLr+viy4Dr+4QSTDngR2HJl0ubWSZI5MZm46o
	FB2ktZMbSgYQ6KO2qpKYVsSOQ+dlRmaXUoq3Zvme6eJK/+43ZzvzM3l6lOze7sH5
	pbbqHg3JdCVlZiU27TAJgqkcJ9c0cxq+3qDVA2lbquJsvNSW+qfXGizOdbWvzTq2
	43YjTg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkvu0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:57:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acaea1ff11so1069006d6.2
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 02:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776074239; x=1776679039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IePX8ablR1DL6tpkqZbrnc9SY1kinjPFiiuTjNwkJAg=;
        b=AwG+ewSnalbT2WUw9tps3Y+0LbtNdCpoJNSTclNrjk7XlMHWf7JOklpp6otTRKuJbF
         qjPJGiC/40+cmokiaFbSJ8Te/1k24Q3Am0gMKFB0mMsj+nGDD3PNPN1jYySMk2eo1Qp4
         5oR+F+wki+H64wTheNEEKzf/mECxi79MS5+ROMQ5yj6Eng/YNQY08m5Nl1NAFh87zkIx
         S+vWtL2UjOhon1aZbwatncPLnTndb4Zq3JfbQZScKn37xM2cSShznnUt39AL3/SwgxZ5
         /X1RS0RfZeRKomsyxEKEvzGhIdSWjZJR7QxyXs5hYkTbLGRdjmAjAuFtDydaBb0U+shC
         pxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074239; x=1776679039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IePX8ablR1DL6tpkqZbrnc9SY1kinjPFiiuTjNwkJAg=;
        b=EE0dTsEOwlPHw//0hrxm7yZHATPcrrC+qtFTjxt2V5JQoi+LwMI0/x/KVWe15jEnN9
         +k8qieQ9o6GsTz5HWUNnqzlNimEAN6sKXjxliSFDG4ZvL2e3cl2rZdzyiJMNP547U+Q6
         2d3evLmIYXrVeDdr6GoOK+ZDMy0yp7F8ZXI0oXwXZiruixke6ONqMxjI6yGXPj67wP20
         bhhZb8qdhMyjkUM4L6UaIboOL+MlFxf20XaxAoSvOM6BCWu9iE2SZNJtle2mSLz+n6wY
         ZLCEaJp5rblvaY9gPHwYrOIQdMKCwQBFVGvgp4a0yyVR0wpwoxMU+C/kYJxMbGOVFydu
         9H8A==
X-Forwarded-Encrypted: i=1; AFNElJ+raUsMcC2HfreVCg9han5fpLI2m7NjCYtTDNmyQVSGqcScNCbqZtASgDIKrvSPAv4iphnPBA58DgMw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi5aB2AgxFwL6035Y9YZcby7xdBF01QcGjHCmlwFCRgR0LcxF6
	Exqa7x/NVJl4BD6D2tDYG9rRqj4kMafmcPnO1Wh7AIsfyYP5QV/9x2kfRGljSImuxq1hzdlmldW
	CFDfRz/LBWiTjS3Xh6bBFAtVLsj0sEt/VpBhkm2xPdEmh5eSt6G5bDp9VZZeZXnIq
X-Gm-Gg: AeBDievBFFlfRvZvX3UMqFSwPtnjekS3yXlh1OKjlVUkw6xPiHDKa41VPFwmaZZ0RUI
	69F2SAo1uDLWMd0ahGAY9zdl6HAR5xqwYypbM4PwzP46M3F0TcMX2U+fTWAV5mI1K9FpxPMzBSz
	2Gl1dM8kzHQW83Qyzds5Ld9fZBGBnG6DiENlBcgPA6FQkGlHQeCNZBsyzrt3Ea9IZ/ZW6fMBZnH
	FCJ7EhEf0UYviBUlsKONvXtBvQz6gbNllfK0/H0xmX0Cr8LwQHyl5oyNnD46/K1fePDyUaEZPAK
	+cX4MYjZ+ZnFuoAC4bbGl89XF97B6KmkSi74EqKNPb6CMRr7AjkY3YrQhLsdQfO30WiiutLm6Fc
	IyaDwOhBfluCc1P1a1COjnsl04/qdwzSH5NvbaCn5vgZphGI4HeaU82bvvYFOWRbsiACI3ZV8cZ
	EsqgM=
X-Received: by 2002:a05:6214:c8b:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8ac8601ec4emr148565596d6.0.1776074238883;
        Mon, 13 Apr 2026 02:57:18 -0700 (PDT)
X-Received: by 2002:a05:6214:c8b:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8ac8601ec4emr148565476d6.0.1776074238392;
        Mon, 13 Apr 2026 02:57:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5824sm297114666b.38.2026.04.13.02.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:57:17 -0700 (PDT)
Message-ID: <2ce5e773-2b48-447d-bcb1-59649cd28dfb@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 11:57:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: cpus: Restore qcom,oryon-1-4
 compatible
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
 <20260413091625.607976-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413091625.607976-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dcbdff cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WBqP8z3UkF452L6cdnIA:9 a=QEXdDO2ut3YA:10
 a=UzISIztuOb4A:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5NSBTYWx0ZWRfX1VXYljTAmXvb
 94O9o7rENomm48WGWc21qqJTxQDRe5SEGctxV0AjrVCyfjP0hrRU996Pe8FpLFMFKiWHD+z+P6K
 cIBFbhnIQuIPNtarfYxMVfo+zZhrRHAnPpRkmsUihKB9msbaMbuiTIUIlg64sCNfag4xvmNeLbW
 1hYN353Oj1fS6KGB4nx08Cs56yupToHDz29+Whk0WVVwxoC0DBpUPLTHu+WncpYAlIs2AkmPWFS
 Ct4tFCz3pse/hZbpjz/gajoeaqU4aMunP7+UL+e9chE+JAOJdvrxoDE3vmYl5rKWfisFRMP+Fe5
 8Mp+0NgR4vLR9ghujWlUhGHETDcaThE7HE7hr25fYJhCBbAxt2+dIRozu/hSqVVhOiMXk9a8toC
 QQ0MSRoIEfp2LDjK85prDbOEX0sFvPIE2uIxgLyIw38uiL/uLDobH2LMooUOFYG9rPaYCmYDaVY
 wW6kV61wiIwk8svk/kQ==
X-Proofpoint-ORIG-GUID: FvXhzAD9TFhOmN_9YANgOLbXjcRbJHJ6
X-Proofpoint-GUID: FvXhzAD9TFhOmN_9YANgOLbXjcRbJHJ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130095

On 4/13/26 11:16 AM, Shawn Guo wrote:
> It seems that compatible qcom,oryon-1-4 was accidentally dropped during
> the conflict resolution in commit f6935ae6147b ("Merge branch 'for-next'
> of https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git").
> Restore it.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
