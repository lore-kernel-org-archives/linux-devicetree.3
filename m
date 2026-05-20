Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08193E8C59
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284497; cv=none; b=Xj82GNsLzmvUD96DBTnz7VA/aBWpdFkfls/zYvdm5bQ479ZLl64wwl3J6ZdIP0SmuOsIMAWL4Fd6gUTwtPTxXiZa8SKieGUGHLbsChHlq/haFmNEw3KzHjFzt+ClNfCEKYheBmDDADuQeiKsbrExLFTUL/ZgIScW2mnI14j2cvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284497; c=relaxed/simple;
	bh=wEK2ABOen3tV8/HsKkDV4io4ZqYKyOwnkK33x92qIKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hx5qFgq/J2HNk3JVEdEY2TDOBDN8T156zgJqNDVmwianPtOiqpIKsXTi+e4LgNk/N2Nx+SI8cbZwzvhd9ABhBQIdq5+dqUMMxJC++bto+fDLX3smWEEUMWiB1+4aybQCc8XIVIC39+ONWSS1pL2hIAFJoXa6aDTlHih2RE++4bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyOcFmXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4x/xH9B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyOcFmXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4x/xH9B"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCGqIC1237954
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVfCWmu9NnLwt3W1x+6m7XcP0Pmlw7T2tdZJKqO170Y=; b=TyOcFmXuYAaJKYq7
	Nc33wRmi0pLyZeGFKkhtc+r9Zjjy3XQf0DrYorpagNjGGAzWsxIePB3LUq+PO4nn
	g3TlvTkK9SCQC9sR9Ul21euyJs6Q6WP2+zV7j7rZL0Melw/v8bVG5QMIWsG8jwh2
	RAKIRfcoEaRvvz4LXASoaEuHnHAIck2xbYDKg9bpNi9LP2wg6KGVoZ73+LMnudxI
	fcRlg7XWwIYBqdVG0xmHy5Hhtnbmzv3g4x6+wIL0wogc3lRgWl8kKuqk0CpTLRi9
	XL/M8BhPSZwkcqssXvY5qeiym1W66nhpPgjlvVUaoFKxDOdVdNG+I0ZmBZT8EI89
	LTzldg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sw1q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 13:41:35 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5756024c77eso11273502e0c.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 06:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779284494; x=1779889294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVfCWmu9NnLwt3W1x+6m7XcP0Pmlw7T2tdZJKqO170Y=;
        b=M4x/xH9BiyAxfSSoFVsm2LYHAKwX2/Tu/U/lRW7IWmF1vsAaNIEt+jWFjVuKtLA3EE
         r5tJNSOd9gwyQFtTH9K0W9x46k5yPUN2w4e9VP7wMKkRt8+yRwum/DqelUoWfRJU8QLq
         sXGqDE1uQvEmiPHeeMwqlggs2E9/13VlUmBV2dBSHLdsy/pmBLm4fXc9o7p2U7MG7Z5p
         LY9yNbkY+FLAntzOzSoaTyXSyUFC66ED1ysEyb7dT53JdMf426DcJmOiZo75YxYRccxr
         AQrYwkXzgrz1ITuOvYoK0vAIunR/dLD/kfkofJAVtfRKVv9o0qttYPUwwcEh1YourPHm
         eVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284494; x=1779889294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dVfCWmu9NnLwt3W1x+6m7XcP0Pmlw7T2tdZJKqO170Y=;
        b=Ce+t0ftAxvbEDl8OiKouhTKZeanO0Uinvc/rBjPGchZlr4UPzEEDJXO8dG33VrF6i9
         nbunUy3v19jSjaU7pj+bf9scMycMtaE/zatMs1tqO43NdHEeIFNbwkVzS11RUBgRwriS
         el5URgYXAxEgE47VOO8Np2tQlmF907KbVtEEVBLKUjyPIaWap0/31tpbLaFf8gJa3Ozn
         x7TV4t3UcmxGzYZ1i+KEs78HOcT87AeU/bRGGvtRUKbejeYSLwlXlhNm6zTAsv0gXgsF
         +S7Hz+kq1rE9TRr70Kjg99GQFs4RfqpM2X+y9vOWRSuoEygodd73orkiKS0smz4hHmBY
         KBTg==
X-Forwarded-Encrypted: i=1; AFNElJ/XkcDfX+MQlvgySqfjkIN3syICYwbx1r01idHRL+k5fSYFEjFu3e4fuAOrxGPrXN+pzLujghVfza/+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7XoAQut5a5qyV04TtDFvZukgwfRPMbze4hpu0YEEOR5WFkBqf
	vK2Kl6rJ4QSSvkZtBR1nJNM9jO9KapW48RQcdEeSJpOd2di5kr3648czy3EHxHEHpHnxzRd3whP
	w5JHqDzeGcexQqG3sTKhKWBvFN1c8SxD2olaTcmZB0NbiU4a/43xXVnXP1vssThdi
X-Gm-Gg: Acq92OHsUzBCUzTKGuk+DIk+RFHhLLZjfxrD2Dagnn3Nkc+1MtKguc9Izuv3J6GNGvP
	fXdB2a+PfrwwhS9OjQGesG4GT3NRuU2iZ2g4UORuA/3+XEA45omHjQpTo4KLkxw7Iyaq5EKh/+E
	ZYt63RkJfK1DtefExtiCHc7VW7114ke8BDzDkMLpMNenQymre0KPpdV6U3ADMqh/hYjWWHklH9g
	qp/IO0ki8GDtuZEmyA4ySzBFs1U2VusR9zjdBDVzCvRanHw0Tt2iwQ8psw50M1uSBPU/91IgE+H
	63L1FFI+r4D5Hm5p4CzmG6q6UEeCcv67UZJbVnumJ+hf9pTTE/C46LncEZ59AWcmrSYrFQ0LqhF
	V8nt0proWAaV5HwnqJQafe4c8olq1X/bTKb7Rs5A4LxczkJVH/8G8588wvKw8Z3TlRWSPChgc/H
	EqnkoGNI2tmaNkD9yrDTC74VABPx/N90mYiRY=
X-Received: by 2002:a05:6102:568d:b0:631:44d9:2ca2 with SMTP id ada2fe7eead31-63a3ffa2650mr14672527137.30.1779284494167;
        Wed, 20 May 2026 06:41:34 -0700 (PDT)
X-Received: by 2002:a05:6102:568d:b0:631:44d9:2ca2 with SMTP id ada2fe7eead31-63a3ffa2650mr14672480137.30.1779284493670;
        Wed, 20 May 2026 06:41:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc3fcsm4997008e87.48.2026.05.20.06.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:41:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/9] MDSS / DPU bringup for Milos
Date: Wed, 20 May 2026 16:41:30 +0300
Message-ID: <177928444229.2567181.2193286518117779172.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gEQvG-srgUwvwQwjYrFNYMDfOr9N1vxb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMSBTYWx0ZWRfXyoszf52yeoE2
 9jHiH316C73eshCH8SF6gE8E+9LsOVXFxRkKxFh9PWhkZPqlRVs277Dnz7RNM7hSGm/0r7z70BY
 /yoMRdeRoSRBatQ1Vyi0GwNpAAPOXDXABVAPyYOwYjBpfxY7rxIan6c8ZL8XO7RACixwaoAj9D6
 goZaFZmJ6HqLiOruJTNOm/KRWTy6feloe7vdHsoUaZfkmGZDobWx1kLA0oekjiVm38qbDXoZ3KE
 7e4yDqU3MEcEeo7zrHupnkumpUAOzUix6MOLhHNv25WdrwVlOMTf6Vf7yr8B868q5Ub81wd7qIQ
 4OSd1E67wPQ9e6TRm1yPBx0PFSrA03D7eG+BKO7Uhlkh1pI52SeAoB5kt4e8fnP8i974Wh6XjDX
 3B5BLUC9++/LQXnWVNq11HTweF/WlygXPb6qo7PXFpGyuxTXj9Nr1o4qkmbj+M+i+x+vUPG2VD/
 IL+p1v+cHNkuvHtOw1w==
X-Proofpoint-ORIG-GUID: gEQvG-srgUwvwQwjYrFNYMDfOr9N1vxb
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0dba0f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8
 a=dydZwlHECne5IGhmaagA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200131

On Fri, 01 May 2026 09:14:42 +0200, Luca Weiss wrote:
> This series adds display support for the Milos SoC.
> 
> This is tested on the Fairphone (Gen. 6) using the SM7635 SoC (8bit DSC
> cmd mode), and the Nothing Phone (3a) has also been reported to work by
> Alexander Koskovich.
> 
> The panel driver for Fairphone (Gen. 6) and devicetree enablement will
> be sent later.
> 
> [...]

Applied to msm-next, thanks!

[1/9] dt-bindings: display: msm-dsi-phy-7nm: document the Milos DSI PHY
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a64e18774bc
[2/9] dt-bindings: display: msm-dsi-controller-main: document the Milos DSI Controller
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fd2ce4931c78
[3/9] dt-bindings: display: msm: document the Milos DPU
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5354032dc203
[4/9] dt-bindings: display: msm: document the Milos Mobile Display Subsystem
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f5d66543884f
[5/9] soc: qcom: ubwc: Add config for Milos
      (no commit info)
[6/9] drm/msm/dsi: add support for DSI-PHY on Milos
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bdb927095689
[7/9] drm/msm: mdss: Add Milos support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88210726c65e
[8/9] drm/msm/dpu: Add Milos support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a48fe7aa0a2d
[9/9] arm64: dts: qcom: milos: Add display (MDSS)
      (no commit info)

Best regards,
-- 
With best wishes
Dmitry


