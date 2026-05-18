Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E82A40587E
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107156; cv=none; b=EpTPT5n5zeCfbl/0/yqhXOw32eyYm3tP0d5WAzvVk0P0pxsmQSfts4Z/Ng553UKoD5SDO0njkVS9NtZ3p5AIpWpstJ/ysg7kHQx/Z82aJ+i0rWO94NAdztLmJZK2kpdInOgjZ7s14y4oScHzlxpJ4TsCHcrwMAsZ/R2rYYj/STQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107156; c=relaxed/simple;
	bh=/I/Lh9kABNEkYq/fKWm+AznCg9UkQBLj7n6ZS1EybHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3WbAilQ9zAwpKYUhzGD/Lgn5HRA58T/FyUE76+DP4NAES4lOS6ghB9gkHaftYbm0cW36LIIYlo68bra+AmybX6+azV4tTSddx7ljhfpT5RdQFH8e0sFaElW7ZUse9jii2kQvRmzbOcnZ0JgnPFQIQvnRor2/nZpwsdTdM4pC7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crmwrb3J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRlgtfJJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crmwrb3J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRlgtfJJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7fdnt2188872
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UZeGp5Bki4jeCnZ73ibXYmI/
	3gyap43fyhUtc6hPfvo=; b=crmwrb3JNam+zeq71i9jx5/Ex+pX7ay7/ThZERzT
	xsCRsBxZCQsflm87UUNIx/4MVVOwO9H2SW8z/XzHHmZRMJ7YoaDSfLJT1XJ+G4no
	2g247RLmqg9Ns/lJt/WTrzqbbTH/foFECuS+dMEUbmU8c6colGhm6oZ5qWJBGC2/
	OVc+CooArRsBpDrCrVvU3+6hxBpdYxZyePctCbbJy9fTI0fET72yD/oZoLrKlbRn
	+jk18jWPyZj0Wja14Kis5PJhapHKthbHbGzj6Z4LizXKDtM7+d0lflDu3iLMqcwn
	W34Hyqfw0/k75EhMCYdi5Kb5Dv4V49pY1igrExAdJ0kQPg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xkuh63r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:25:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516879bf1a7so41054421cf.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 05:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779107146; x=1779711946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UZeGp5Bki4jeCnZ73ibXYmI/3gyap43fyhUtc6hPfvo=;
        b=BRlgtfJJHiEwSJegg/Pr2TMNtfQUmr68Jf4JvqUoK8MCzpYdec+0ehGiU7507hQRIB
         vZVF+mjloX81pODigJJ3LBExdxXtK9H+v+7/R/OZnU798vtt8d95DQN3s289UUiCcc6V
         44dJJRQ8DydyGgr8kgtJgl2cow0ZE9mLJjb8hjMtwFa2yQQSVWOTbEWjmsFCq5FUyMH9
         Ou6Am+MC5NyMZFUsirEjyGS0g8u3zohpgwv3fEWYfrl/po1SuHLgogA0iZxzgTqpSfJ3
         DM/ciFgGI4gKhYEoeMnuBlQw6AVqMMO7iUAYvV3/ElJ3Is7gsiMB4OpuHCfVo++fCbse
         uPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779107146; x=1779711946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZeGp5Bki4jeCnZ73ibXYmI/3gyap43fyhUtc6hPfvo=;
        b=s07cPXa1TM0DlHwd/jla11REnVmyjbj7MaJJi3m29mzW9BJLOQ4K7QGOx0nl/xl49v
         az4bMBmB4xQBPKWFIOAcpOCBmt7vhVBiSSA1CuuRswvFfcSGd+Y35sfFAEwD9MIRSGn8
         gsTc+2pBMXE85ZBiqLoPvz8mbVypwHRgmGZzRsfdHx+Bc4dERzHRazZnsrIxM70eN5y2
         SQAGTox97mGTb8Z+SMcg9UDo/fLOT94mH1eGGbO6yIfZrt0ps2t+k5TcJX5I8sdOl1OI
         I1AwCGTvkyNNPfebgM6Kw1qhBYkiLbIAYaGHZJmOZME2mNRfEY9ZJ1QDEjQmPotO2E90
         e5vA==
X-Forwarded-Encrypted: i=1; AFNElJ8XbNqO+MeWf1RV3tv9OvRza9mu+lh1Nb8DY5WyG3df3ma+9X4Q2EvBgyr452iz62WKy2DayOziw9g9@vger.kernel.org
X-Gm-Message-State: AOJu0YyB77Jb0agp73tXlzATGPlwvW5Wz2RBwXvJ9VgMuDZGIq0W8a18
	hcGAKVsmEEMWqDy0lHnmJWYjzfmWtL/d8I6lyJT66vEqBDCoLjsrc7i0vl3+PY3zyCAsLM2qC9r
	0C1JJfY+K2R69YUNXAZJgDN2DPB817Z2uTSZVQoKemTogUa/ovxNjjA78Mb5WsF6Z
X-Gm-Gg: Acq92OFTkBMx/2A+QfXIAcftTyOM2PPfFI4uMjMhCMyxUzfbVclP4YkLKUc6iIqgVg6
	0h1h7j+ul2vELM+MswityhhX+WJzCFGTZAdOO42lC6bSOBttcQdCyl1V+1+ZM4FtDbuwWuOdpSm
	Wm9KdvDQOitD8u/BOIED/2WsoJh7fbSEZW4YMoiXcQpzErzCszi6GzvHZDeHO5+/tplkFd7+dd0
	LdaTPASNQnwf06a0XfemVTBKZq0lD0KKZajmuDEkhGnLSSLgcPkcgeQqbWp1l0f2M9w7GBobVoV
	PwvUdUbW9BS9rpXo87yy/Sm1LMnKkqI0v46KrNG3LPWHT3jJDciuUxUBDs/qnnxmqqB1Y8qmCHb
	Mae/8ogffRS2H2hSlfpPe5oTF6AxHf/jh0RRBJJD/hLOmBWtGOVixtljwYfi68+VdS5vo6E/clA
	azEokXZInPA5dZf0zSl9NbabTMk2Df3XtJAPQ=
X-Received: by 2002:ac8:5e4e:0:b0:50f:ba60:2dd4 with SMTP id d75a77b69052e-516419629f0mr229735891cf.40.1779107146206;
        Mon, 18 May 2026 05:25:46 -0700 (PDT)
X-Received: by 2002:ac8:5e4e:0:b0:50f:ba60:2dd4 with SMTP id d75a77b69052e-516419629f0mr229735671cf.40.1779107145732;
        Mon, 18 May 2026 05:25:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887b408bsm11481771fa.35.2026.05.18.05.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:25:44 -0700 (PDT)
Date: Mon, 18 May 2026 15:25:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] phy: core: Define TBT phy_mode
Message-ID: <5kwr2cbi3swgvjrzyqxa36rk2jnjlivgsw242shd3s4zbbdv5u@x3qvxkt2xm6x>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-2-71d827c49dca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-topic-usb4phy-v1-2-71d827c49dca@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEyMCBTYWx0ZWRfXwJqiBkq03sFR
 duLR/0oIxU5HQ/0EC4OadSCBJcsHV28E/AaEyWXZeS02cR+fovXBzL/CSTprgEGiSpFsGH4DcKU
 XQiNDjKvgVX8LfG7azDoPBI8qrTZpF70JV3IyfXjylxWmSjXb+KwJzV6yOJeF/LMtucB3OwPW4e
 +gra//UF1SK+UXHEdaGjkOnJbcH5+kxWORlMw8BbTOeTowSqhqHOvgnqvIR7zFS7fFfmnk1FXWI
 CWeZOlVkOY/DlnNaducV3wLLitAdxd8F8HZVyG72/GpdtL6UTBxgtmVVnhowOntd1Uyk1QY6J0o
 vWqR2cjuhSajsTKOy/XKLC+fVqYGB/TbgOkCQECjmHj7wqQ8CYPOus4vU2mXWV/jqBmHapICF3X
 8stN8OfPG31l7li/k+1B33oe6Hxv443NKxjjsn0wdkV06cTxyCnamabovEAsnti0zJEKPK2KiFp
 ZRDeQ2Wn2V/VDPu/caQ==
X-Proofpoint-GUID: Wt3dR0fPKwADezVNzTNAIgiBw4tBHnfc
X-Proofpoint-ORIG-GUID: Wt3dR0fPKwADezVNzTNAIgiBw4tBHnfc
X-Authority-Analysis: v=2.4 cv=FsY1OWrq c=1 sm=1 tr=0 ts=6a0b054a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=fNMWtLC6zdMFL8tt74cA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180120

On Mon, May 18, 2026 at 12:29:49PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There exist OS-accessible USB4 and Thunderbolt PHYs that need specific
> configuration. Define a new phy_mode for them.
> 
> Currently, USB4 and TBT3 are defined as submodes, because they're quite
> distinct, most visibly in the electrical/analog aspects (slightly
> different frequencies, timings, etc.). This results in a need to make
> the PHY aware of the actual mode needed (at least in the Qualcomm
> implementation, but I believe that'll be a general need).
> 
> Newer versions of TBT are basically supersets of USB4 with higher
> host-side requirements, so these are not defined. This can always be
> changed as necessary.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  include/linux/phy/phy-tbt.h | 14 ++++++++++++++
>  include/linux/phy/phy.h     |  2 ++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/include/linux/phy/phy-tbt.h b/include/linux/phy/phy-tbt.h
> new file mode 100644
> index 000000000000..5f48059814e1
> --- /dev/null
> +++ b/include/linux/phy/phy-tbt.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __PHY_TBT_H_
> +#define __PHY_TBT_H_
> +
> +enum tbt_phy_submode {
> +	PHY_SUBMODE_TBT3,
> +	PHY_SUBMODE_USB4,

Do we need TBT2 as a separate submode?

Other than that:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +};

-- 
With best wishes
Dmitry
