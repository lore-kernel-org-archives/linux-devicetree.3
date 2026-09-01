Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1D83806DD
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272046; cv=none; b=tg1aTtIKuMF1rZpEmSzTrmO5zRpba017rEiHESryrq4iSsvOyTtLIfDpwEBBUo4uGBmRVBdGCQakq+XrOOefMrPzWXo2IFDrO57sOIM9tahD7UGOgceEdhvSGyQefGtMTYHbN9KYMpIpOh+b21/cDDNsG2L+dOmlm53WJED6Va8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272046; c=relaxed/simple;
	bh=AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TRuyCYswCLGbhg8BGeCie0rOxsEqpXG46N8jJvb9pbdd2j6QHCO+lhZh/aTEIcJfKF4HVA1QdYy2G6JIYr8We1CQu7FZ8dY6JjB78NFGEzyOuqQNOJrc6Q715IHi6M+R06F3PqjxktGbsxWBgE2Xu/e7TAzhsKsOUNJJpA9Z8uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIkhN0Dw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ov/BLwL6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIkhN0Dw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ov/BLwL6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8ce83913696
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 14:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=; b=JIkhN0DwXxaGjOpK
	JlyvsTB+Y03yhK6pbIUAVyTVsTwTf5gci/euI+xpKunGRomDhwMLaqJXcZdKgDFW
	W4eqNHwpBkEtEt97tTtwvbBLq+PGqzhSy2GvoVvHgvuLSxe8GxBJ8kYSclE08D+f
	bW4jwSDvNN8TFVmr3xkll5gtDqnJFrJaKP2V+Bb0O68jzrUz00vt+axWoKM2DW9A
	biAHZhgFlOwFHiBirERwdnXKDE4mbmg8brs5jL1kro2O/L2UFy8KbicfXzathsOs
	3Vw3fpjhplHqc1jKTGaTMYxVa8okLRZjlFPE+UZAoJiUmx35f/bMy4iNqejUa2dm
	030/rg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu1yam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 14:14:03 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so148404e0c.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788272042; x=1788876842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=;
        b=Ov/BLwL6hc7GiDQ+PiwTilz/Vpqt/dV6z9/ozGIxJ+iPmNxVMrzkw3IU1U0wMB6Y+g
         hSMtr7ZNuulovQKcMGLjdhh2U87K1Y1x3xaMFSUvcgOrGKNIjNjQGTyS6zcriirqXKm+
         O1Ct7iVkb+6tks+LjwA2Vo/AhMXCulE2iWqo6UaavtloIrfBxOJvP67jy4ZjLvmktbbR
         Ae/FXDVq1AQID22Emd2uxiPUvzp6Jv7z+gUd5RQ/uDwNKl9s6dvOUEbkrd13SHt0x+u1
         JFCVbM9CgZU0Ybs1NYGFYsxAsUgXPF0Ty43BOSIfz/Tu0jvISBNKmStT5zKFNhZwmuCY
         drWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272042; x=1788876842;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=;
        b=o7YxHRgTks7eGVrgkv5l+r1qTbmKf7orn4q4/E6s6GydTSt+yZdu2wG3tY66H+98JC
         1FMp7wUvzAhhboSiNO18ItRN8BRfsVxnycTPOrvpnWSXG62k+qMy+8037F0nyIYuZxGZ
         lL6mKa6B4/C9w/uVCqjkhx8fKa4tDGilUBXYte34ZNYqGr4BcxmjNC4/Z7jWT1T5LDMI
         w6Xn13vE/lT5qCJ0rlTnJ4z6A/HAJJyopwh9T65SQ0+nflMmwHLRJJ+/rwSEVeBBhxxA
         OJ0p3cXAfw2A0ruvGzWkjxBhJfZJ8qJnfo6I6KE8P5v73QBxdeyGyxo8yiearf5drAmc
         ws2g==
X-Forwarded-Encrypted: i=1; AHgh+Ro7AfY1/Gxm3CiLqWqtSXLztIrQ5Qg/QLOpz+Vf3bhdcFlyy/BTcSCCvDxnwc5shp6xwdwcDk+xKJKW@vger.kernel.org
X-Gm-Message-State: AFuF++mWJSCQkGHOBkDm6dnj/PPrT/7RcA6UpltGd2F7b5FdhoDBnxOX
	vH+LHF9IwgHLf+tzbEl38ICNzMM6N7exJDJz5WMY3KWEmScq9psNCoOCIKgdliYONt9jOEShaVm
	U4R0KTElKtJi24x0C1ZDqS0iLIffaZNQoaH8g5EacpzjZmXL2ZT0lFDIT2YREZTQD
X-Gm-Gg: AR+sD13xD596Bvm7RGeanq2b+vNMvLt4qda1ccEjYek3m51Cr67W75q6pcBXjEb1nmX
	pXbLAzGnOssZj1J/NVtQKUbcMfwZz35YzeuQeIxz6yu2Exh3Xl35bUmBt5dZcozBZ8UUej+qIKY
	has9coc8fHRQQZ+kF36aCOQOvB/izFxS24NPxPkEOnn2BDxubD/i2GHnj3DI32dmo/+gMf5xZfd
	RGXh3j8eljPgcWq1OTYlQd1B+zLCH+GVPshVHbHjuEx70+nXeWKhUZsV1MyoIwmLO3mb4YEjc1t
	1lVHS+iKriXfRN2JxSxzrXO2f0htsk7dY6L69XHI5TJLcZLDt3ir5+QkyywJc01/BFqVpTFikDq
	fOsoGayrig/5WzsAkKFycxg==
X-Received: by 2002:a05:6122:6b15:b0:5bf:73a5:3e05 with SMTP id 71dfb90a1353d-5c681477d5fmr4868046e0c.3.1788272042345;
        Tue, 01 Sep 2026 07:14:02 -0700 (PDT)
X-Received: by 2002:a05:6122:6b15:b0:5bf:73a5:3e05 with SMTP id 71dfb90a1353d-5c681477d5fmr4868034e0c.3.1788272041942;
        Tue, 01 Sep 2026 07:14:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee75a36sm601716666b.28.2026.09.01.07.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:14:01 -0700 (PDT)
Message-ID: <43a9b8e1-2793-4fcc-b378-6ce09198cf2f@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:13:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add parent
 supply for regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfXyVBeJ0sR4Y5W
 BRUfutAO/bLPs7jiw+t2MQzbG/vVrC6TyYPPotiqAh5LuHKoPx7hNyQnhzEPj4xOWQ43VmQh/vN
 QUF4vXR2g+S7/ll95MjXH7KIgkvrNuQJZ/kZYQu3vLITjthXh2Dx73jVIDuJOeSGlWOfdRyHwFF
 Va1tEcvTaSRIlO47IM2ubGd5mf6+bAJX6wXIyf8JVHfQ/WwAPWwVfPzF5XomW6n9MT+4m9PBn07
 pZ1GR2WIW3w5Q3ji1DzB9/WvvMsGWDcXk2SXba8c/isnIawhEbreuNBRoq9D8J9MeFr4bLlBbuL
 GfPvdCpMOrICD5tEePlSRyEhcDtAki1jXXxNzFINCWhP/pBHwguXfDqatf1SDsRUjh92i2oA88k
 UrGNZwc2N9oS4D7j+loTzlp+20XN1qlS2jYumRVFeUQyLg7vVmIJfVc6frNmhIBq192IDBTAYDS
 Gzh+mZ7VxkrhvEc7FSw==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96ddab cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9ibpQ1FT5vEG8fXDfu8A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX0Ejvt9uigvr7
 rga6g46M+rV7VlzP3zKkyuZJU7EzdF/13oeiEe2f0frYrNTp3cGqsH1kEmZg1PxmFkBOvuVnT1Z
 OiFDdprK2AGuorEJ9t6bveODxF4RkcU=
X-Proofpoint-ORIG-GUID: hRLO2Mpy-ZxwvZ-ZoaDUSBF8gcbyF7eF
X-Proofpoint-GUID: hRLO2Mpy-ZxwvZ-ZoaDUSBF8gcbyF7eF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010125

On 9/1/26 11:20 AM, Luca Weiss wrote:
> Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
> the parent regulators can be enabled when needed.

FYI the firmware is supposed to handle that unless the board design
has been changed without making changes to that fw..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
