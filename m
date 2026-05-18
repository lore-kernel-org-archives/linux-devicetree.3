Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AB2378825
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779117593; cv=none; b=OhKeCQVcMEDDZhSEFdtUkLn4i6rjOi15F8G/+Nl0AXLlu2FAhVFlKhPycwTloefh56BcHu1i4FWoS8CyIzCbviOqSzyvNeAS4F6Y/L6o8k3+jUjhkX+7y+edrjwvjR2WvmXsug0xhVGF3pL9E0LscMTn+0EmZC9FBukwTw7uCK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779117593; c=relaxed/simple;
	bh=gsMvSkDHih/DpAaIuXXZEcZYD6pPNphdGJGyi6G5Q0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLp3EogFA5LiRjrtNvDU44f6POS2NLMGyVapmIjLfyQrI8vQgzTGTjKaJbkaUrNI8Ltcm0rYa2tMU9m1uzTRPAJJq7vy9D+pvxEVDJhseI4dq45shTbUAE5AtKVM1/0OMktI9FUfNFxJ6YZQ8z1JFHc9jUFHK+BbRmDrQrd7rWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZE9Z7ZkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UPlXxVgc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZE9Z7ZkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UPlXxVgc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IAWMb42685242
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MAoae7wwX91CbhGp0sKlfhoc
	wtNDrl8kr6qv9MhQNYo=; b=ZE9Z7ZkTfMC+OCZlDDx4CumTgzAtrJ1dy84rCaTQ
	C/gilhsE2lIFmFb2vFQ/O3qiaH07vw3OV294IuSXqkiqrBTl3okevIMKsXVrTSzT
	FzT7HMKfVn0yCZCEBO+CgPUQCJMYAGPfKg5ezIr1P9doaMSMYQcKbiPFN8zrbT7Y
	5/ufjvvipiw0/UV2gWPvwIINZXf4uJyBP89RIfUYzV/+jOEFXTc5P6OoOmmOOkZb
	X7sGKG70trDvjUgqDTYrhftlQ80o6RtRF3S9MqdzUYqCBO2HT7ZjyK4T83IdVAih
	OZ8u6nUgiYkyCQS3OBXDDLnN2T0z75bTI+EQC2RlZiaqRw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vrbtdwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:19:51 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-696906dddbbso2544024eaf.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779117591; x=1779722391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MAoae7wwX91CbhGp0sKlfhocwtNDrl8kr6qv9MhQNYo=;
        b=UPlXxVgcJY/6NUKKfCLYyQ6hSajq+9QqM6d/Sm6DPIeVmJyaTw6VvTCvOetD49MD+G
         SihMKlRISuWVsdO/WJl5MsutHO1y3BmUsTJNNy0u1jQHokwxUZepM3pbXScZm/rnp1W5
         m0BOTYKyxV74JPHbTzKSmhl7C6qSpQHISXr6FHlQ1YX7FOvxCMsjtkiup8Etul3FgiYs
         pNugl8tuQLCWJWxG/90314w1jLvGD+uWW9+sOzvl7/foyaDN2uJq59hKPV7VbjnE6E8d
         /xnyXGGC+dLnl6Hfxspcyp0T6ghaJop+VWP6FDsaownfqWoNpymTyIvpt0jVGKUDwOWd
         UJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779117591; x=1779722391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAoae7wwX91CbhGp0sKlfhocwtNDrl8kr6qv9MhQNYo=;
        b=YnVSpNg/sjOiPbQhB0xk1nzlPnSxf1WB8n1dqtzxIllEZSGhMDR69UiPedJOPKPYyw
         cZQIDRVJlttcZe4gGS6/T11r3xs4rfXlCQvsrMfknNj7w9nvk/6ds3cvYrqncTCGHgZ1
         6SJInk5EA1WYnLDBo+urEY8yTzn6dVRgX4WWUvl6Nl8VVmAa38l6YS75irJukJL6KpWt
         oWjtgKl2xJ7AMsbM6adFFaVqAAKU3w5LbX1WEzzZS7ZXpzCsHRrtlstPoQVYSCEzchBB
         CQyM/i+p9kGsdxBXqtf0REP1zk1atRe26Vcc5YU8w3HD1t7N4zWm84mre1YrjJPzidZ4
         9aEw==
X-Forwarded-Encrypted: i=1; AFNElJ/7prWzd8S9Gd+ahBgIU1/6IKgbYxVSXJZLs/71R32lR7//enF96EtTumJ1YRlygIExL1coSfedNAqC@vger.kernel.org
X-Gm-Message-State: AOJu0YyNbu+/+HPgAhgZOiBXo6g7kdNtAHPpgxU23dSN7lUAUl7PGVr7
	mkoj+Kuz1YfV/YAKLL0I2vETkYq0TzHP391Yze6z5kfvKh0B8Cry1skyKdvC1yDSg+56Z/SwR0O
	thu8QVSwTnwtC0u+IQljO7gEz3Aby7tU3CHTBv7JLi/xpyR8sNGVu/OGE1Eav0Bua
X-Gm-Gg: Acq92OEeY2AgcUXb20q/xtWPOfKJxp0eZR5umrhPhOUFX6eLkpbG09SsOoKefFNJT2I
	1xhd8V5cBCdCLYzV+onT5Llek6l5h0IEhglcqiNDGG2NL8yGh4XYZgz4Q7Dq1B+rjwTIlLx/Cbw
	fuypmm3Z+2HObfO7mpOKXMjIvOQcxWgIcnJufex1ew95rFsw20tkZEXHtdwdSQKHGGKzU8SPoPI
	E24u/0wsB6gpg/Wsr5KQkG3/GoPtP0eLIry4NXu2FlzzAlJ62z3JtWTuASBZQe+PpvrSdNCIAYX
	nMf0w4ieoKB6ZzBVkiytKZB8TejJqoKYuGzvqmwz8b5t7crmhjrCIBULDfZn+fzNhenhkZSIg54
	TIyqGsfBCYAny9nKDfVUpq7mnv1nmsj0UoozqI35CaW6NWACUdDBUfY97xfb3NL4S5aprv/SaU9
	nuIN89Cd77+RtWkkHD27A82/HNzpQ3v5B1fYs=
X-Received: by 2002:a05:6820:4c01:b0:69b:4cbb:a1f with SMTP id 006d021491bc7-69c9437a913mr9473815eaf.38.1779117590617;
        Mon, 18 May 2026 08:19:50 -0700 (PDT)
X-Received: by 2002:a05:6820:4c01:b0:69b:4cbb:a1f with SMTP id 006d021491bc7-69c9437a913mr9473777eaf.38.1779117590134;
        Mon, 18 May 2026 08:19:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91a6a1906sm3388384e87.79.2026.05.18.08.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:19:48 -0700 (PDT)
Date: Mon, 18 May 2026 18:19:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
Subject: Re: [PATCH 2/5] phy: core: Define TBT phy_mode
Message-ID: <ej2mvzftnm67lrptxktuinzw4au36xpwvbqiivlxmdnvkmvmsj@hmzvlb7lbfvm>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-2-71d827c49dca@oss.qualcomm.com>
 <5kwr2cbi3swgvjrzyqxa36rk2jnjlivgsw242shd3s4zbbdv5u@x3qvxkt2xm6x>
 <0880f634-ea56-4c0e-822d-aa7c056fdcc3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0880f634-ea56-4c0e-822d-aa7c056fdcc3@oss.qualcomm.com>
X-Proofpoint-GUID: xXOx_PTGvwjw0aius3xTbBdtfTzvVGk0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE1MCBTYWx0ZWRfXyEw29eWrHI2j
 WbozZxP0Y+BQ96d2tbdleGPGEKXUUTjnmCqkre7i+h1tOs+ypOfP++S605e01C9kI4ehSSW1zaB
 jvOPCq+6Fx7y+mppIPTNQFSHUM89DOKw64Q8KuOXQshLDbXoitjnFKZVTeVzQutBnlRyJr01FKZ
 Ax/ehvM2ZGv+NAM9Y0BQAQ9yohPbe2KQ+b+QzBv1yX4lPtPiMyVWp2fVg1cD07vPSR+7Vpo2ol/
 HnQJnkNXql+Tq6PWeP41taqATvxcK3rqU7UYH9ZlUrcfn/yMnzsMs4MywbMYb1bQtI4LCZkjxqt
 vQfORIzQ6vUL+NLjPrH/ORs43PKhQQRb49LUzxsa/y34j1yWow+5u4wuy1vXBP6n8ZEmXeE9Jsg
 Tl8An0q8TqXt63165u7VdoklhNr4bV4VqU9JahpKllY7fmpiXqkxNB5+Y07K86mjLZ+RnqGFoiR
 80uV9fTq73jI8XXx4/A==
X-Authority-Analysis: v=2.4 cv=KZ3idwYD c=1 sm=1 tr=0 ts=6a0b2e17 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=xxU2PZ4KthE6Ad2txm0A:9 a=CjuIK1q_8ugA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: xXOx_PTGvwjw0aius3xTbBdtfTzvVGk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180150

On Mon, May 18, 2026 at 02:29:26PM +0200, Konrad Dybcio wrote:
> On 5/18/26 2:25 PM, Dmitry Baryshkov wrote:
> > On Mon, May 18, 2026 at 12:29:49PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> There exist OS-accessible USB4 and Thunderbolt PHYs that need specific
> >> configuration. Define a new phy_mode for them.
> >>
> >> Currently, USB4 and TBT3 are defined as submodes, because they're quite
> >> distinct, most visibly in the electrical/analog aspects (slightly
> >> different frequencies, timings, etc.). This results in a need to make
> >> the PHY aware of the actual mode needed (at least in the Qualcomm
> >> implementation, but I believe that'll be a general need).
> >>
> >> Newer versions of TBT are basically supersets of USB4 with higher
> >> host-side requirements, so these are not defined. This can always be
> >> changed as necessary.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  include/linux/phy/phy-tbt.h | 14 ++++++++++++++
> >>  include/linux/phy/phy.h     |  2 ++
> >>  2 files changed, 16 insertions(+)
> >>
> >> diff --git a/include/linux/phy/phy-tbt.h b/include/linux/phy/phy-tbt.h
> >> new file mode 100644
> >> index 000000000000..5f48059814e1
> >> --- /dev/null
> >> +++ b/include/linux/phy/phy-tbt.h
> >> @@ -0,0 +1,14 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +
> >> +#ifndef __PHY_TBT_H_
> >> +#define __PHY_TBT_H_
> >> +
> >> +enum tbt_phy_submode {
> >> +	PHY_SUBMODE_TBT3,
> >> +	PHY_SUBMODE_USB4,
> > 
> > Do we need TBT2 as a separate submode?
> 
> I would like to avoid extending that unless there's a user for it

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
