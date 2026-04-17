Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B21338592
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776413965; cv=none; b=PwU/YuFGT4q9XDkF4sMmZvtW5ZgP0mhnd7pO8JI7sjcKyGmDJup/O5JkK0sB0KTjCImQAdN4d22UBD9yg8gpwOq3bJV784YNfBq8Hpt0O5dHmIFSv7beQuxbhKY/GvSxzgwTTmjTsxwCw96f8Bwv/475SVk9le1XcV7UbKFNavs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776413965; c=relaxed/simple;
	bh=HsR1pD1cZejjpSMOdjKfntIeiU3V/CQ7BcAr3GWo2zM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dAUg8O2ID8wrIQraBuc17E786C2spW5tOPKJ0KLtS3aFdd2xun62+izLBpfG6AZZ2i9yOe/HrXf8S5cQhBPye6q4P5VYCK3oH2H3FRy7abs/9vh14fa6idITbBfKy/X7wReiXdKF6J+Hi5dwGL6xDeA5GPwZk0fsJpTnGhnvZrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAaAU97+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMenLeLq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAaAU97+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMenLeLq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H79S3A3942109
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEXx3SSRARXgD/Ye1EzxIF1scAs6C4XDpVH/7JetmD8=; b=VAaAU97+o8+VxS93
	PbHUwjDR0nZgpaOC/6uY0xywdR/k2fMF6K/i2UdDrE0E9Qp2/XQ9Xx/ui2XdD1jo
	2ckR1q2l9710YTpzSF1jJH5aKEvnfJ/W86O1gmfeJxbp4vq/MNM3FuHm3+G0jIzZ
	6i27p6p9xH6nI4kzYTruVOEIAf25RdM0Lwq9/owEW1xtJ7e7lC6z1d+pyWxFLmg5
	DUoBemphwkitgtuMuR1ijAG5B05LZRW+igjh/1/gq+UYD28RR3D5tGu+/QlX647F
	7AxScQwXeWO1ObxD0Vp/FTzF9SJV0Fgd1yQouyN23RuYzUnOr3TJuBwT+1jSWhFm
	3M4Mdg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg7rrbn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:19:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50db373cf13so792841cf.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 01:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776413963; x=1777018763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tEXx3SSRARXgD/Ye1EzxIF1scAs6C4XDpVH/7JetmD8=;
        b=TMenLeLqwv7kPrv3QbBVtNxCdvm5DiZEakHwmBDbnAV2OkMBXY1GFlgOYSakHEgSn2
         TW55oMhRGvtprqz9p8X1Oy0xZVzx/K6QCtDLNWplywmVq27oc3iUc37JOnF8G8o3h8QF
         V2q9+v205chWoqO0g2csiAZtdOI9Ojdky/YMznoo4WRISI8X75Vl3LeQhwh/sFuVtKlw
         7udlV5JCMFZWQWosKML9EDZzGs4b/4kbWWbLBOJWkAiSSpWiHcKNrExEuXNqkgKN2UKG
         j+x8rv3HlmUKX7OI+K+6qzp0+R84qx6pjDsg+WDCf8zC+FudiSWCpiIo7jlxTlgf9dek
         DLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776413963; x=1777018763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEXx3SSRARXgD/Ye1EzxIF1scAs6C4XDpVH/7JetmD8=;
        b=dUGnYWZlb0+R+naVyxPRRKqOSgyxrhhy/0kkgRE+ofFzntqUi1ULvCLuww+5LJW7VC
         a6KsFW4WfhvuSbm12NUAXWuFqv4ROp4GyeY12AE1szo4YaeMtdIsj2huTiPX9nHdgCiq
         W9MRr2qH7PtCp5YxMLXiH7qeZytTvuRO5tWPJS0saSlQT/rUV/SnM4WaVl7qW5HSql6D
         dRNEx4IjCog+5DnI6/LmJ/Q5NMUw8D5jWJt+0HTC+WL20IdvwPGLUrw1QHhSUtS7burl
         7rPL8swUbR4V5SKlvhP+BzIVcziEcw5jFCyxgFU9IcxRf2GBrb6pUDkcWNeXd70LufaD
         yp7Q==
X-Gm-Message-State: AOJu0YxUd2OjnMsdA3ULZtdbDHE0PGcSdR4Dt+ZPWxwOfQdbzlkwticm
	JdHsolH2+Y/XBNywAB6xhBfHqi/o98bknod1UkLBa6wQSsf1lIQc/DbUiHz4R8lCZmIZ/Rwh+hM
	seNPhGmT3v/hwzGWTJXsZMte0TcZAX0RdA/yh+kZ7ci5qRAAfG/iA+hkLIYvzQ/2R
X-Gm-Gg: AeBDievIAHHrgWbZ8J3CfU5MbKBBeB4Q0rmW0EL4biKsOjeKjJ8BzzEjeaWujBUckag
	ScfFM6+rslffjUPPt/e6++c7Cm4+TKmrp+giqcESOuunAdlI8ttaTTvvPLNzEPlf8cqP9BzQiJk
	46CjFMZ4BFvYRsVaKDsv7EKi7zXxmY4SkoplkWEwQEMuG5ZJj+yRHIK3D1uHhgW/VheMfX6Q+Xz
	ewq1cpAk48C/HUJCZsolSN3ry8AwSu3H/nCgGzZgPimEYkisZK0cX19ekRLOFs+WljOA1XpcpdN
	I1eRp65hmWOaxu6Cl3StJ65Pv32Yv1XqGAdDIBSL3VUNTjVaRdVCTHNvRdvuDN4dY7fQvAEFIJa
	I6hDNoolcV/vb5QDGOMbK09mKmKStgWHL7AjzoVq989RlckPGnzfPhKnn3CkiMiVnbrimcXTic3
	V1CbZnjA/KnHhpQQ==
X-Received: by 2002:a05:622a:2488:b0:50d:5af1:65bb with SMTP id d75a77b69052e-50e36c4b4c3mr17653711cf.5.1776413963173;
        Fri, 17 Apr 2026 01:19:23 -0700 (PDT)
X-Received: by 2002:a05:622a:2488:b0:50d:5af1:65bb with SMTP id d75a77b69052e-50e36c4b4c3mr17653551cf.5.1776413962814;
        Fri, 17 Apr 2026 01:19:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cd8205sm31905066b.24.2026.04.17.01.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 01:19:21 -0700 (PDT)
Message-ID: <c862e4b3-3168-4b75-a002-ede2961dc002@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 10:19:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: eliza: Sort nodes by unit
 address
To: Alexander Koskovich <akoskovich@pm.me>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260416-eliza-imem-v2-0-fb7a71123451@pm.me>
 <20260416-eliza-imem-v2-1-fb7a71123451@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-eliza-imem-v2-1-fb7a71123451@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iHN6G8Ii_kVFPWjDGIFnk4YpOgUIl_WV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA4MiBTYWx0ZWRfX7ILannf5Jd2D
 9xkvSlVrXgUR4T783siaqe3V0fmaHQC4ZuEDW801CO+bReCebJxnro+yw4okFjFOHsUXpmu2Ssu
 d8HBowuwWRUcwu9iTK/QZOM5ntIgvl0sThKEN0h6iLON0m4zPIkHM5kbwBPReRLkGRLegxssCzg
 e7a7Mp3nlVvep70f3D6QPAbYQUi9AiPGQJ3L4svGJGHA1nYsQS5wgVNuhgoQUgMGLgafbCd44jC
 8ElqsTSnOjfWqlK4baPPuKyAa7DTQFEZCTyWMgaI5izdUMdR/lZcnnzPthxrwckoft0SlSgNP2C
 MIs2HXR2y69N12aZqF0MRBvWfh+k1h4jhbaa7lgvZs8HE7+4KzlhCOV72nrv75j+JyMkLsseb3A
 /obMpnedzigCoSmtCCC322e3TCWVKnntAAIuORYrBCgKtwpim4eWWhmsie8iJLNx82GrB0CNjce
 r4PAqliBwD9Fmd9xrjw==
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=69e1ed0c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=O7T_dzNiMBTscPX1knoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: iHN6G8Ii_kVFPWjDGIFnk4YpOgUIl_WV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170082

On 4/16/26 11:39 AM, Alexander Koskovich wrote:
> Qualcomm DTS uses sorting of MMIO nodes by the unit address, so move
> few nodes in Eliza DTSI to fix that.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
