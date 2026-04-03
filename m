Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8643D6CCF
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 19:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244825; cv=none; b=i0b5Bnfch3IKPzta4D8E7rBIbxmPMrk0SkbL6jrY/jLlHxoIbdgripBBoEirjhEdoHvlUCv58/Z1GCmqhjboqXGTz3QqL1yRzAvh0kOE9oBhcRe5Px456U/XGOU3IUmQ2GCi7t+EpKfgYODBp9/bs926Hw7EEwaRW7+59G5fDDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244825; c=relaxed/simple;
	bh=IYipVv7qJiP2BZHkGsUK0L4UYMsBOF1i0tnR9r1ULJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCH81QmAHe8pNLlZ31fAGffrHFrik8+dNhCAOjeXDbB4lR5i3RW3q3pQt3W+jyO64gcv3U/8Zcqd/qAbBQZIsxjDCLbWWRTxju4/hXAtcxHjeGgGwAjtLBsqFGTtJ095Ak2denoA5inGFpCxCmf0zo7OnTQpq5H5gcwoSaj9cy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGrO3P2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMPEYHoi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGrO3P2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMPEYHoi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633BBoDi1562125
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 19:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kZPUYs+b0mIU/ZhiroF9fq7z
	487yqQRqJHomPd4ooAg=; b=UGrO3P2r+r6lREb9nTHGY86LsAJi2v4vtUNIMr+P
	B83GBLnqnrEcPWhG8Xcjsxrs4u8qfhnziqy11jB7RZz+JnjhojA6HNaUriShUPi6
	pdpSnIF/NkXyzVRhNZ6YKCuFwT8fxy8JaUmUW3UUBjLvQdfdWY6OiS+wd1pmK/8H
	hhE98VOTkyPMSB2DZRdxQx5LX68pUOMOHAzL2YyOZmktBE7AGoog/hs2Ft+jsULi
	fGO2KxrAuhmJf4p45rvOA/Gm1zl6lHehaBfVK09D1mD3jDhexKB9erLJ2EpeMvN8
	iPFQxeB2Mdlmx1Dj7MwkxpFW63yzAaEgCq4q8dfoTZqQkw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um74h14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 19:33:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b52a2d70cso36643791cf.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244823; x=1775849623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZPUYs+b0mIU/ZhiroF9fq7z487yqQRqJHomPd4ooAg=;
        b=GMPEYHoiwl0XyGd9B47Ar7lB4lM8jLXKpR4tEo3USdcCJxiUpIZC/Vu0sGB5R7bQlv
         wranQwq9nw5CxHgFz1Pn3gdyCYr0ZcRq5J36srUIQ17TKXv13VIB+H/mgFRHf1yqJ+XV
         GPHhO9djAfUFA4TyplucupepKAQ6mdG7fMq+JTD7EJ1TM5lBzIJER2f9L54vOvGTttWb
         QyXdm7iHeC2gGOsxUsSPaNNcHCAV8YaLRxso9zCcD9lSz6Yy+KFwSJvON93gIWDCT9mH
         MqHnd8nqsUEC8FuAQI4i8J5QDSN8d/ohtjBhkmUswRoKf0V0Vjl5XyOVDi/pq9gsxetG
         dr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244823; x=1775849623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZPUYs+b0mIU/ZhiroF9fq7z487yqQRqJHomPd4ooAg=;
        b=mVpGPaHdyQI6mdFIvSr6ZVjuq1oX09Zl421S1kvK5C4iLYwHFE5yVw+y4w5a36mAYJ
         l8N3rTAwKc6TNUnOe0Xi5QrBTpKRf0pvZFwX3nSSHvIEm9KzUTx4so5y82gNk1CZudSm
         odgqwtcicCkxrVUt7f5TgZYiiEDylEcaWBfpBPpy+V0HFBf64S/R5d4ioobrGcFJXgHT
         l50wCaKe0lLeOcdErhypLPFW8Tjs9Fndf9TnY7U8JZIMuzJWCtXAazU2wvJp0vhAvlcp
         cVrhjma1rC4i5zSyC0bk9Ni7gCmWpBLRjQuj4wBj3d/XOP/SbsIDurVYFck/FGeI0LU9
         EJZg==
X-Forwarded-Encrypted: i=1; AJvYcCWsJRKJYBGFCOVH8wX4BHvv7i3Ela6LrQYYMPouDWKeFGChftMYdVQxlEgtOfXotnZxzeGyijd/l3JC@vger.kernel.org
X-Gm-Message-State: AOJu0YxLFv32RRImFY/7y1Bw+uJCYnMMruAMNMNq/Ev2opWNFZ7Vk7ql
	w4jBZk7axshhJgnwNqeV65o2Lk0HvzLClltOvwW9mwxvaK0pjeChk70t2l+/YlEwlNBnUIyTk5q
	eUEY8eqxsQ7AFJ2KtRcn+PehL/G2J78j+fC4SnAoZFF2/4vzpa274dp9XOfXCJ/19
X-Gm-Gg: ATEYQzwt69XTa9YAGbYKCEwmeQp72+AbPuLL2nj7Gi/BNu2AGZ49kIKdSNQ7rUa6i+m
	s2jB+91hsgJEVfipNn/v+541bnAsrieH5wnZsArI2CRWHfBFp2VSh7Il8/KSAx4gB2QbVTGFijf
	/iT41A3X0j5RDpxlDAOlvaf8bviNGos2ReALjy3mIeg1seANOjtNTtGXzlOTtanppmOtRJFZcZc
	M/o9zrH/hBIC5DSIGsEDpzymE487hZMzpH3j+nyaPd6y1Qg+9YnQYP0ZbOMgsicGqM1MuKeS1We
	ifvGooCQrQqFulgCljSRs8RYZspGLmiVtdtHhZdtxRRAvTEyPXmEvnb9CwJZwH+7wUQP36zoPNX
	/TIlV83rjbHbxrGjXqNZOWNYEhYML3/vuOJEgVmugPADVPfXpsE3Rs59yQhSFW4fULgmT+g6Ev4
	i4Lwh5Q7SuQFj6CCVJ21fQMsTcf/kwUbdk++w=
X-Received: by 2002:ac8:7d94:0:b0:509:1766:2f4f with SMTP id d75a77b69052e-50d62b24652mr60694391cf.54.1775244822819;
        Fri, 03 Apr 2026 12:33:42 -0700 (PDT)
X-Received: by 2002:ac8:7d94:0:b0:509:1766:2f4f with SMTP id d75a77b69052e-50d62b24652mr60694071cf.54.1775244822363;
        Fri, 03 Apr 2026 12:33:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd37b3sm1627417e87.78.2026.04.03.12.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:33:41 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:33:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
Message-ID: <cwhd2tcs3asdxqcjspq6sqefx4srixgkje37hf4fylc24glqey@nkxctkq32hwn>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-6-393322b27c5f@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-6-393322b27c5f@fairphone.com>
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69d01617 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=NEyQqhXCQXLKNWlO9YcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: bcoDTnKqoVJmnSa0Nv1ux6p_HDKmWbFi
X-Proofpoint-ORIG-GUID: bcoDTnKqoVJmnSa0Nv1ux6p_HDKmWbFi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NCBTYWx0ZWRfX3EbMpeFvhoTh
 ahnyW3fr7k+d5519dCVGJcp4m09mQpLPaAOxzaRxX5+aGdDNDrN07nNn4myB2TPWaQnmp5LbZmz
 wS+sRwttzfUTZ56xgVR9grcrzlSQRBdhYFi1LfVruCNyT8M3zMnpuMl4en2D6cNwfrEcXp22ABv
 grwr3kZ6ARpM+SuK65G9fLuk6N0FesoG5UV88lzAxG19o3xHN2ig0h6KpgUwrtQTJdyif/xqFRR
 8c6uIKrhjR6HqjG3Kl2mDdl3IFgPZyAOPR3GF7pq8FXkcUk7Tey2GXzkuXbQIKV77K9hoON7aKB
 TUmVCqJPDOmWCEbtvCpuj+BYRXZvlNtQkLQeTQQFGGO+S+ZgzYDBPXJ4FsCZ5SYzWrpVBWh7vTh
 YlnDPocZhLeESsiLhHEIZOvoB9J4XhPuQxPMCF4sRRiRAMpc8GMbcXwQIrq7GMTi9bQL28bXId3
 hvdXEm6/lJN5S8k+vwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030174

On Fri, Apr 03, 2026 at 03:52:52PM +0200, Luca Weiss wrote:
> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
> parts.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> 'clocks' to the PMU node to make Bluetooth work.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
>  1 file changed, 174 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
