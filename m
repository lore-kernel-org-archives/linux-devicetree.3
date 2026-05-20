Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A90368941
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294308; cv=none; b=h0hP/fUNxgimymAvDBsZQLGf0DeWGe9WPDdBhi5NJeVvigH0S/GL8N0QWJQ2HqUimqAZAwAkMKqb4dqA7kB8uDTF8SqXycK7JJBDbQJf9AUWyoUvaO7mtCn50an/O1o+8+gYoAY2uHwWjseoAj5FyO2yTjWRgVru+oVQgcOZXmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294308; c=relaxed/simple;
	bh=CVfGvTButC9Xiy2MykpKcvZx8KtJVMgg/X1XnxS23UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+7dNEdP2rkdtYwEKms7KhFEwyoEmTLMXgPMeMy74NqtPSwAdeahoXnnOwSGvZ3O9NHqfZkca7eFjCiHHagEgIOysuXhsNJ0HaFTf2mRZTn9/dqOL7Rq3Y+cVA1nbaDHpn6N/dj3/d+ytnehZ5krE5srU+ZYW7k0LGZA28+d7Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kd+6S3P6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9SjFSbk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kd+6S3P6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9SjFSbk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KFMOh44115217
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xz0sUxJ3nHFrIUac9Z0r1axi
	lM92v/+rr+m+cn2RqQM=; b=Kd+6S3P6Id4kRCRjyBWKjDxXK4/fl/gAqjpDGMgu
	kThkDREySxttwciAZ7gbrl9xWlBWVehbd5MdA7n7DTN4diZka2lxIkZqWjK3JuZE
	IfO7ZFgnIEHQja57LFK8EEMWYlDk8k/YdGYhTI4azO4+BS3aSjzHu1y3Z5IwE9Rt
	uaGV417TQpIuM+4MKjo021IjPtyUaHSGD1kOfsSFiwkZwiamZyck0IIwTlZ2MRBj
	eeNzt+8C/itRFnksQsXGgvptSXySA92mj03JgsgtVJoNwwNI7jGWYT3OAurOA6QR
	IVFGddLFW9WS5cHElsfkuAHO1Q3tmtRbF3cys58NjX8+iA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0hr82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:25:05 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-57536338b89so3976637e0c.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294305; x=1779899105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz0sUxJ3nHFrIUac9Z0r1axilM92v/+rr+m+cn2RqQM=;
        b=W9SjFSbkk03c9HUTai7UTDtAtHFmKbKNyrNqm6SbjwkYknsn9yhyADm9E3hmkaacQt
         yFSMyqteBlo9Go6Q/2SxrZokILjp9OI/EdsZ88iH8FALY0abS3qcuArIKr9szzy23B5y
         FZOZ6d2J/1Aq1lEKcO+fZ7SWOc2pf6TlSILcRVGnfbRtMJ8oVeyqVGo+5hCHtVbaLVRb
         Kp2oaBNzvQV68C+DruIRYYCIOFJGK+0ZAhCiMTZ2LeiVvZD2AeqdI57mhEuGuTN5/pVs
         csbEqknjDr3ljPzF17Br+/ORaTbZADlIAiAezbxG6ROIxPYrtFlM5cAgnPITnIx1BRqN
         gAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294305; x=1779899105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xz0sUxJ3nHFrIUac9Z0r1axilM92v/+rr+m+cn2RqQM=;
        b=YNmVeEXn7AT7nMydSTNeaPff4xJeU800CCbLTsHiCt0B3O0esUTcUnWHvqldHHLEse
         ZOWsAqoMIewv+Ros9fXVzRyrk8TehBW2cQiADYQMkZkeJqmJwHJlBWsX0R3K0B5tcm0F
         JAr4yLlecqEqMXGwfAklESH3GbPQj8exrpii9QbFlrhRlu9uaOU2tTorYiPLd37bRZWl
         u9ZiXPpngU1Cr4ajoQS4jdrBFmSggE4UaHOEWDwOLchmy1JJsQz2Hc5r1va+KUw6RA0X
         H3j+VArIiLLn6wbdgLhHtj9G8TFZhKxLWEebcjHIe6dVwiprwfkCbg2W9QzQ7rwUszX1
         I+uQ==
X-Forwarded-Encrypted: i=1; AFNElJ+r4bO0IXmyAWvW0Z/Weigi4mK6NMwPCHerpGhlUjoT5J9ZrC6p/mjceVoFIa3otnemWxNkcW0b1PzA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/h2RkyiuEXPRcPO6ipK+svaC7TvAoQp+K7LtqR9QPUxVqkY3
	/RtXzjgqfSEdgb4G/8/Xt8Tqq7mOQelLcxORExsM2O8Bf2hL7tYDK3qL9x8BUuBUS785/aQXpdQ
	6Ol1IS6k4ExdKVr143y0gNWucJ9pumo+Otp/aDfiMlTePeFUESRm6NAvW1/phkVM6
X-Gm-Gg: Acq92OGX+i8eU24K8g6hrz9oyf/dYDrHYOf6OKEW/j5Kp4s3MsjngqJr/1UHTsZlZWa
	es1jxHRzjB/KqT+PDLUFqM2Iwgzg2rcG1P/8yZ653BAtqbbZSCZhZScAHUPgNcB5PMY30sWOR0w
	xoo6ONwTX9FrM+AXllIc/Uj6p15EEAryNX6MAfXsY+ImEovsSw3CdUaI49KRdc7ls1m/JeInmP2
	ulEt41nwl8FVWM6Rx7Wpt9Sh4ebCLNnmpu6KMf8fz9Ft/b8qMWG6Hg3u0tEYvHtbO06FRPbXiNJ
	8WrL6oTObWnMWsa8sS2laicmp/bYXCkpwiruWMrVVXRooNLpe+OxDY10UdBHCfW79OxIzXSdRRT
	SvKwSlA/VqdGzadp5rNFn3cetAJjgIudbCmrMfglMCWRRGbyJ7xBF5ruKBP6VA3IH4doWQ2Auj7
	YQyVj4UUoUTUKqRk743puohGCvKuq4RCrQ5iI=
X-Received: by 2002:a05:6122:6b89:10b0:583:5e28:17b1 with SMTP id 71dfb90a1353d-5835e281e1amr513017e0c.12.1779294305189;
        Wed, 20 May 2026 09:25:05 -0700 (PDT)
X-Received: by 2002:a05:6122:6b89:10b0:583:5e28:17b1 with SMTP id 71dfb90a1353d-5835e281e1amr512980e0c.12.1779294304646;
        Wed, 20 May 2026 09:25:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a7c2sm4988382e87.32.2026.05.20.09.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:25:03 -0700 (PDT)
Date: Wed, 20 May 2026 19:25:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 5/9] phy: qcom: qmp-pcie: Refactor pipe clk
 register and parse_dt helpers
Message-ID: <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8dI2F7_cRyOkcsmLACfmRbx4WUhNa0Ha
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1OSBTYWx0ZWRfXwzGHBAOipDmM
 L/95E3sh6gpnHosBTZnYT2usz/3sXLXEE+Wl7xs43fwNRC6XZCdb+/LTe0LjKSOCvywH7HTt4o2
 BqNBr78V/fkzr/FUxvBW5WZCN8p+Ky9tn26y3v+MJs7PVqK+geXrLlnHr35KzWLSNAvxaEeJcMQ
 VOWGFarb3HLipGh0JgA06BnOkhb7DmoM8qjKQOWi5IMh6BZ/DxnHj535wtsujBEk4hwI0w5aqDT
 /Tt0GK2kZe5wugz6tXZ7sEJTy9VcBGcCpiEEWEqFhzxnYCDLTQsyuKESuiDEESoNB1+Ekgh0LbO
 1VkqiQanZ4yz+v1kHqSQQfHbv/giJfshThjn2Qobk481L3clne7Hn/SZ0u9p+zEeWQveS2RlaAh
 TZ95UmnDHXTgv1s6ee/TYCKoROz4ep/z1lGzZImDMVMXk9El6FetWlmu/wgmmIWVW1jzOFRoSPX
 06CFr1eR+6wuPf7Jo5Q==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0de061 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=1wzcjCcx2gfPYyxUMXwA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 8dI2F7_cRyOkcsmLACfmRbx4WUhNa0Ha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200159

On Mon, May 18, 2026 at 10:47:16PM -0700, Qiang Yu wrote:
> Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
> under a single DT node, each requiring its own pipe clock registration and
> DT resource mapping. The current helpers are tightly coupled to a single
> qmp_pcie instance, which prevents reuse across sub-PHY instances.
> 
> Refactor __phy_pipe_clk_register() as a generic helper and reduce
> phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
> qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
> mapping and pipe-clock setup that will be shared between sub-PHY instances,
> with pipe clock names parameterised per instance.
> 
> This is a preparatory step before adding multi-PHY support. No functional
> change for existing platforms.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
>  1 file changed, 44 insertions(+), 32 deletions(-)

I'd suggest splitting the Glymur PHY to a separate driver. Otherwise we
end up having too many single-platform, single-device specifics which
don't apply to other platforms.

-- 
With best wishes
Dmitry
