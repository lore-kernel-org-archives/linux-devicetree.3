Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277E944E642
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921287; cv=none; b=baTeyxh6W6jfvB9DFIURLKu4z0HQn9IsFWGtG3IrJVgdlGcri8WdD0QWiko9JGNfvOZ3LpjFUO1+xoBEX3mBtaWIpwhGh4WJLwvTW0sedUvp4n6utsMOI+Gjd6ifY4jzSw1/8yTrs5g7MeLrt9lq4NyIeTODKTZp4Tu331e1QTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921287; c=relaxed/simple;
	bh=UGd/T2FrleTRqGiLpOH+4948HacsLmthJt0JiZmtzv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bkn+A2oGBCbEenI3sS05rau+oA1oXqn+drkR3tXTH2yxi1zHyrhRo1nb42Plom3FuO4CFSvK+LmTLhKKaO0YGNVtaQ9pY2Tj5coM1oeciJOGL4CBPPju9LhwFrGhoGflstzCztpaVLI6jvnvre8ThvJOpNDBVuv/5tqwNljYBLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9kD4x10; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+JrMDpU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9kD4x10";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+JrMDpU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7Rn42061302
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ze746DXqJ6GPP7P0a7JhNyqYBqbIzQ3jQpEe1C3z7Dk=; b=L9kD4x10LdJHF2UW
	3E6whvneoGHzEc0R17XPxebUe77aqtruYipDrkFvShFj55ndWMhVdgAcZUGyGP/S
	T5lp0TBsBhkPTaaymeasVHtezoFjnGAj/fYTNrWOYJGdhyCVK9r72jakLecaMIMh
	OHYMqTRNEQRp0xPNf/8yT6/XB3Ri3bQDirbr+zXFc7Y589ggKDoZygz7LiJeu/Jw
	IW54vUwxQymqck0vwQKCr+NOFC5FCKl09Q+e0kUGuy5uwQl6x+Jmj+Q4tGWLj1od
	AHe45YiEOmelQGEfgc/JDFlT5F3cuuAdferXfLMyR3kQ8Hlzy4h0Het9DPwvdaKF
	oiD1/Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mu9r8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:47:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f75c1219so19009475ad.3
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 05:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787921279; x=1788526079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ze746DXqJ6GPP7P0a7JhNyqYBqbIzQ3jQpEe1C3z7Dk=;
        b=E+JrMDpUbCELGsvBgYwCm5D5BwWN/o4v0+qNiMVpzr7QgNdTAyER9JJ1K5hHn9zV+5
         C3g/fV7ao/rsVudRTUsYkwbLq4FtPRiWH+7quoJgkiaocvj1o9oywbw0hoV+uRbpFrwZ
         TdfeDLjU6HwJh6vvVPwi3iUKqT9GvvXu+AUU0UldIkn2ALOcMUE4mUfXu+McRDzTzklK
         IS414qobbYZg1eAtk9vGrYTDSgu/14NsU44/eSKhHtwIvnyA+y8bo541tgAcMe3AeTNy
         deOx5xa4CNzgu7DeZrcet9JMiIATrN4ZyxD5wq+cOYMqagbK+xlME0EqJ8obhvGspv5M
         rn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921279; x=1788526079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ze746DXqJ6GPP7P0a7JhNyqYBqbIzQ3jQpEe1C3z7Dk=;
        b=nuqTH7Q0DpJxmH92NceeazgjjrAbbyjtPDistaQCEoy160C+tDLT7JdYDz9qGIWIHG
         kjpQEuSUj6S4u21z0OsCpq2FWxTeTKeDzgy00/8oZsYveFCloW4ztvx1l11aKJ4ZC+NX
         zpWItg1ZTPTvxb4vmpF9XVfJLVsjnjcSYaDO+ittGL0B+Sdbg4CwiIpa4WQY9iqha8Zz
         3kz/8g/LdOyTIRukQJP3ilFJ/1g7JCEGPQqfUTN2IrRft5Swijs8aiRFjiyRgcoH3GbW
         lOsG/7rii3sam1noq0IeGnh0PRxhMVLMNYpbOAUzM5GLliLRGxmezafgvqLKX7mz031J
         kZGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMpjOhuiIX8KYwevMmz2FPU98SY8FWCTFo0Y2dvhg6rSDDlu2MfU2ql03GSRftCYtwXPPV71awc5me@vger.kernel.org
X-Gm-Message-State: AFuF++nCyt2p82Ixw8WJ+d7JE+8RcBls6WGF5WnzNK3nv0mrNcHPWfMm
	nvRThHXAQPLr+MtdG91+cmlgkv6xfd2HrDIbJDQp1sccV3TQA5guBKHeiD0ml7M8ddQoxyZkPNR
	iVoBdyBl+vL5X4yQUhT8o1hifnQojT91Dp1OUHGypvwCet0CbM2A4ieDwVWgDbFo5
X-Gm-Gg: AR+sD10Kq8lMvS4vNwiRBuW2z2bIG5oZ4A9IpY/O41gHN1R9Rh/yfFpE6fKealcHa9W
	gwur+RdqmmJRqh7Ye7LcL7yXzVfMJ1mkwQIIHfA2LLY/ZLNNAcnZDvrD8Ift2jV5/4DKBzg/TYe
	nI7NgtJWJPEKTPd6uCIVdNvHpmSNbBKqxBI6zC8Lp5PFFbWNIP5fXC3xlXZ46Z7s9qdiaZ6zFNU
	YK1wnRec2Ou/wX5CtolQrONgju0Y/gDRMyj0uGCdP6vmjOhMDITHSh3BDx9Sz/0IfpoSo3fOFCb
	OJxczsx8cW8gRNizxgWjS/BvcB0X2judIVyXOF6P3wd4NgVePuQf0qB0qLXm4qEKk0O4aT+wG2l
	2qCkfpCiqF4lvpXDNFzw0E+qFnW/oG0k=
X-Received: by 2002:a17:903:15cf:b0:2cf:ccc2:6088 with SMTP id d9443c01a7336-2d74dc21be0mr146436295ad.4.1787921278871;
        Fri, 28 Aug 2026 05:47:58 -0700 (PDT)
X-Received: by 2002:a17:903:15cf:b0:2cf:ccc2:6088 with SMTP id d9443c01a7336-2d74dc21be0mr146435205ad.4.1787921278424;
        Fri, 28 Aug 2026 05:47:58 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594ff481sm5034905ad.8.2026.08.28.05.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 05:47:57 -0700 (PDT)
Message-ID: <53a855e1-5d5e-46bf-86e9-d605c57312f8@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 18:17:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] arm64: dts: qcom: Disable Inline Crypto Engine by
 default accross all SoCs
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a91837f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xEcPEQtGZCqhUTYalYwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: -nsUNXEeU2BHq7ufjj8wxhiS2gy7jXt3
X-Proofpoint-GUID: -nsUNXEeU2BHq7ufjj8wxhiS2gy7jXt3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExMCBTYWx0ZWRfX2yP8Mz6I7gA5
 3qm4ZGuSLO15PGlU9MdTDzXuffbL7LS6KNFJDZsXhRCqzhTlY8p3ZDwvXoR8nPIsDiMWaV3yRhg
 qv1vJDZZJ0XyR2Niq2Lfddb231GsBh0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExMCBTYWx0ZWRfXxg5bGvhdHNzm
 geFW4uGC38wCOJQljIypATGU01jYix2MGYXTWqomGJC+iCv3mBLtyCSCtft7CcCv0VzQSp7ex+b
 J2PwPlmdLO0/8EudZEmPAiejZ+ImwOxSwjE7H9hR3RzkPmBKjSQYoGgar8npSsNNMis/DIQfw2o
 3fxDFGTotB0npjjFkBI5Qh/cRoDotTvkCZ0Cl/K9R/OxAmzHeBCNEmO89ZHzWBLIppQoCVjN6Qq
 QxoKeeQOUYixDSYxjpsEle3jzAXHu/vDLUGd0J2pAAlZruPZC0OgGRNk4ILOdZmp8FGxf/CUr0b
 Z8h4gNFHs/TUT23SvVPZ9xQyBQffPLcQlb6rXBV6W/i2tDUKoV3L7E/VLbRLQa//ef4g5sEeap0
 Jt7Z/eb3zp1yedxntGM6R3crN7kThmi23WNEJOJYNCnlBvozJr+oj3BxAFvgQXPvB4X4t+b87xz
 vvzTmiJ6JeIJG5HWBbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280110



On 28-08-2026 18:07, Abel Vesa wrote:
> Since UFS_PHY_GDSC was attached to the Inline Crypto Engine and the driver
> does not currently do runtime PM, the GDSC remains enabled while the
> device is idle, even on boards where there are no consumers.
> 
> I'm working on getting runtime PM enabled in the ICE driver, but the
> node should not be enabled on such boards anyways.
> 
> So disable the Inline Crypto Engine by default in the SoC DTSI and enable
> it only in board DTS files that use it.
> 
> Do this accross the board, for all SoCs that have dedicated ICE DT node.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Kindly check discussion happenend before on adding such implementation.

https://lore.kernel.org/all/56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com/

The idea is to enable ice as default and independent of storage media
and enable runtime PM enabled.

-- 
Regards
Kuldeep

