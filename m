Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4ED3D1CA8
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388762; cv=none; b=Hpb+g/w3m8Mr74cMosTP2qXUavnDKLyewepoPNi4v1uZiN/JvRqHly9suUP3/9hXy9eUjWIOPKYg9m1WwUikiZsdSBJo193gaXBOyE0j9VlXTj8gPYXPA+L66cdIniOQR/roWtgR2Ag+bVJumo9LmrBCuf3FFeyEufDFG1R8qPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388762; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i+VrRs5Hk+315dOn3iWsFt51T+TKG7r8xcXplq9DZgmBtDsym72c4eHF2blRjFMeaOxukjmBe14uLe+DWiFmGk9BPvhCDTj1cTPjrbEwg1dGVKoKokKXss1vEwCmo1a1VJ4OS6waS/bZQeF1eHnc99ou3hhER9EzPZ9bSasgmeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QW+Lix1s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5200tiI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QW+Lix1s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5200tiI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm65E3793269
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=QW+Lix1stPbjEzJW
	qAh5sSunO2KEbqlWPSDJxOj208n2I9GWRqNPh9cji0t3gzzfv+sSUJHwfp2lqomc
	8HqMx6+6ujRwqMVibpTSdTKd+ghInjW3rJVcECmbfMafitrSRgan2PSudFQg+DKu
	DS3z2kfVLJt4Qgx2UOeNEMdXGoRIPjHWELv1PTjkVLr41rt1c/UtoFxLVYYjBWS6
	CmapG46xIbErD8qZyh6zKKNf0maYL3mIMOXT9YfLGbvOLp3qq2YAFogs5pH1Pg7k
	o2oKqfMmQtIONnvcaynfFwAQNOhzAeIsLLMfhRbSv+8NPko05tTdi7fwTE79i9zl
	PkKlzQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg13ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:26:00 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so152839e0c.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388759; x=1789993559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=W5200tiILAj8DY8Crvk3ja2z5Ap2dA/Hkwp4k3gE96DTVRyDn4U2DcTlfqNgPVLhXt
         AlLfEIXyqcf31tVQTNwUogg3V1Dv2GZbSidy55U2kj9WaQbO7BMQxnGhGW3UpfM2a2Zb
         n2LrB8glpRUI3Tk41AUKtOQRIqAortaTL1msiBQxy6Se7z8JqlCMlg885SjdfY5xrWDX
         lgdxI7caqLjgtWmF+Q0ZO3jfSVWQY2TCoCVcNhWXBxauMTt3oJIVhWRDBuOKWNu4m/rk
         kn+9laCku0W/jpnWZvpB01BlnNUYg2nCkeKQmcRd4QQRmXGA4BHio9jaUyGVXRsLvWW4
         VVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388759; x=1789993559;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=UKLF/JDxodf3on+ZXATVknHxAr2MCIZ+SSoajACaQYLkRkt1TElMnSTFgNYX7PaCb2
         WGU/q1r303Iwd01xJtLrGSgrNrdE+oOKckFp2QST+NjGo5xbRwBkOa4MR4ctdGCO5ORA
         v3h6jVXqDXexOBPR+OdDsmoEwCacXkxEP8Eff+I2X+0p8xgldvoB8h7eTKaS48Mp5EI7
         izrKaPHgfuotIm1THCAqw6x18qyKvWSAQwOBVkw3FgGnVW6VFcVdMvC+HRqK4LpZx+jP
         TCOIwQWV8Z78VmaD8S/kgABlKCC8AFRGd93VdjtB5NnUk5h24B5B9JqlKneDFRxVgePx
         xg0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwGqQsCuA1Ckbr+/BzZOtZ2A9NtxFc0p5u420cbksAW4HXjBkFY57QunZufQsvjYtf4aT5pd9Cvhgjs@vger.kernel.org
X-Gm-Message-State: AFuF++ksCPNYZC4hV9kTQ5IeRy2XJcqaDI4my4fsYVRBh18dPObwrz23
	7rf2Sx8f/9PDGucqPq5XQLGTrGEhB44PhKLX0mfYxuAC/NKWgT8oQrPK2BTLTCy0QKD9CltZUkB
	MdHIVcape1D08KljluntjCQwCl1h3nh4osZuPK48zZM2BhRSeYy4v3B7RvBV7EK2B
X-Gm-Gg: AYBFou1OWdOilI1nkSGQ73XysL9Yks+O+6yf+xwUOol0usiDoUGXZoJJ2pz9R57LKfh
	/iF7+HxlnYIeefkmaHkxMdixqFKbts06Jg2QcnfLHnC0Gyk4OVzqPik18F2ki4/5rPSihh/p3xP
	nzOAwdsCpqcbNakRil/vy/MRzGNXo1GqfF1BC43IQiXs8l9ZPsJta5HgqCgWhYY1awLFNYrbEs8
	2iQesmqCmgyCBIHwUC4Vq7BhEe1O869NHvEEkmrXHzEmhSMlT907D3qHNy9pZJ161fiWF0A9sxv
	5WVbCuiHcl+LZAvIOrib2+KukJal738mcCBBEUsvWREX5t5/p3VEXGtFzttcJfwuSdQ7Z+HC2ez
	oWKw6L4wPUMDbQ6pJF0KaiA==
X-Received: by 2002:ac5:c002:0:10b0:5c9:6766:5353 with SMTP id 71dfb90a1353d-5c981d80eebmr335146e0c.3.1789388759542;
        Mon, 14 Sep 2026 05:25:59 -0700 (PDT)
X-Received: by 2002:ac5:c002:0:10b0:5c9:6766:5353 with SMTP id 71dfb90a1353d-5c981d80eebmr335134e0c.3.1789388758960;
        Mon, 14 Sep 2026 05:25:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04643f5sm2408744e87.43.2026.09.14.05.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:25:58 -0700 (PDT)
Message-ID: <773db386-55ec-411d-a4eb-cf57056c236c@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:25:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/31] arm64: dts: qcom: sm8450: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-16-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-16-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7e7d8 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: AST9OaE60irL0EsA9xU1kAz7wlqzD8O3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXxPG9HEtt9bpj
 ljvh3VqeY4PnweistZ7wc5ceK8UcZzcFtvztGZ+exZZOts8jxJTjY3J1pjRxGYv/zrvRBX6MCEW
 IxThvwuNveuudv4/RwopRpwjM2RmOzw=
X-Proofpoint-GUID: AST9OaE60irL0EsA9xU1kAz7wlqzD8O3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX2fgd2W0Yvsje
 Zv0ghH8zrZkce6hAZuf/DyvBG5wNlXoCSxCsCN2+MeQSI2GzEWXhMEiuIS5kPZT1MJ1DYDkZVn0
 sxWvodD5AZZiukDjA38p/ava2X0ooO+mwToxwBUy6DXZfurGZuQsf4aD9VSu3dn6t0AV8VglMDE
 YmO1Y5x1B5XLJYGAXk3x1eICIdP1G7V6gBXj0fFi/GmTtXo+/qYYEAFmhehJETyeaAHVv1ZFe/6
 p2O9I0nDxl/TWja3JwiwILXI64MVPWgWKpjIl+kR4tMZ9g35lTOeQCAcsqrbDBLE+U7s3WF26L1
 iGG64RjPbKngAWw3Hw8PaJl2n15c+RRsBuggfywmKGifFbAnXOcO9TBWUinjRSyxkg2qk54m7iD
 YU/0f7vVJCUVNBTi/YWGkCnxwW6h+8RT5lkB6W1Yy5tkCR5OkCmZhzCR92eSZGeHBgQCKHQOE79
 lJL6VVvm4OHdKQe/CdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
