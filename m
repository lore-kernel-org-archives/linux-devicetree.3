Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2821D5476C6
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082147; cv=none; b=rUjJXOgmGlpaF6rnrmqDCY3/b+SjDw3aPqbSwgJD6vg7WmpkuDNu2PVytf83C793E1prRMMTHWIQ35KVhrLa7zHLrv0KIQsv9ubJfJ9moPDPH3fO8KZ9wT7QNm2HSism3LJWz/KE/WMkdEGWgKd0B+Iz8PqKWmQYIRg1Afi5Y5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082147; c=relaxed/simple;
	bh=LLUNgr+JTLVIsA7tRQ7tzGf4PiaoeK1+F2kHwWJ+SUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/JrqamYfSslKn6FTuakMuVZbGSUDZGVQiIVQjNAVEA3+/tSLg/YipNK5xFUNinTz9zCzpXVwmPfPcz4UDuK3NVQVdTI5a7lDz22+1BR1Pwj5Cmw2WlXLi3fQ4R/svaJmxo1QDqGE5lIChk1j43awqyaxxgfSrQW0ocSEQBICZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cq+N7rmM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGiwZLoI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cq+N7rmM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGiwZLoI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPh7H134475
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vMPZw4XRMMmJIbHmlyrL3fJr
	7/HG4Z5DoMUR3Yhy7x8=; b=cq+N7rmMhHSRdt792B97zQ4tvO6DSCzyCokGEWgP
	0l7nkIikD8mjnvCxj0XfM+sExJ7pauZdmeyr5WuEzEgstdeVyM5IQYkK/9jAqLHy
	t2AgS6URL3HMRrhXZ2ojUbN+pSVIDMmTiRXcP9MdDucV8QlgaL7xGIMTKLCiXSng
	1j6BY1HkLDQFRe0E22et/Koh70oEHiOcgW1caZrJhgsQ6PTFXa1ohFHBnRtRox9i
	Pj9CKtXGkjuhWudQcS/NPYIm/ycI9VoJ4k9mbcgBVQPgKEX2xTRZyYFU60l6fBpv
	o5JmEsuAEwKiszx7RRbOQRqWqH5QhM612JzYXUaAfbg+Sw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkja204-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 13:02:25 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c8323b8464so4850431e0c.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 06:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790082144; x=1790686944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vMPZw4XRMMmJIbHmlyrL3fJr7/HG4Z5DoMUR3Yhy7x8=;
        b=kGiwZLoIRX+To0lpURpuWHb0AWvuWMqdpfEBWRQH0RRBRAmzfAvsyHQqRpObX5s5or
         zPYNo8ptyXDRBFMiWuxLkEkQCUlTDUEalAI1kzex7WwQhci985pf0EJQlIM2D880lTwz
         P3yapmJ6oXehhkdKdc5vSs3zL7AJtuTKaUgogAGZuojg2tXHTsgA45eXQ/BghzaMxYyF
         PQGJWuC1+F82OmQEtQRQ+eqvrQ8g9X88GJZ1Mu3Vs6f53wsR1O3ptXsRVyo9bHco3bZA
         3JsCj1oPFMRGEdaNE1WzsnuZQCsi8/r/uOP4f3wkgwc4Gqv6I/1DDaTo2QXx3iogBpSc
         LNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082144; x=1790686944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMPZw4XRMMmJIbHmlyrL3fJr7/HG4Z5DoMUR3Yhy7x8=;
        b=wz9Yv9PT7L29myfqhEQsBFFSnZC5OX8Y7HI8srcAMsrcKcihooIFDTHRQ+pL9mkUM0
         m9hmHCKp++3wOEwrpspyiSt7p6bd9dZMsgJRUvbvu7PwPPYvTOWDJznNBxEgwdSHHf8U
         jghW/wwx9rlwgZ2r5WeBKtMBp5nJN2NgqMhbCAkiWG4CXRhxHCmmm+9MIf88Cr2R0CdA
         AtD67WbSTyFgXmBz4Mq3lVB9aMN3xmuLu6OCN+72rZqY0oQm81jnVJBF9uO9yXfTVBES
         c0KhWlzMhKV5QIRr958NymXhWurSZ+tnqqq1gRvevv0DWvblCQEjw+CBij16WO8o7Pz1
         i88Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8fKV0EPN7s1QKh8EwqWHgMOMjdiA47csik9gakWK3U4SddtiIud5ND19U/AwpPkX//MF8T6nfbkDX@vger.kernel.org
X-Gm-Message-State: AFuF++kYetSp/aLcf/3NX0O/HwAxFNZKfs3J6QYTBmzrW2kZnlune6k1
	FjllKBxVXGOtHi8Fk/li4bvlO1iTeamOG+yx6RAsxn+IGfAHe5tGSMkhsgnoOTI2KbE0gLanzZX
	mGVIOiv+3w/sNSTISLNjy1dC7mF9OzUn66aYZlGKTn+qMv5+2U070qdyuLaitmyTN
X-Gm-Gg: AYBFou0zei7kUw8da3t+dfzPvh3N587qbWlFKePzEBZJ8QC2JRE91v/rM0ZAt1v0M44
	Bxet7ZWOVrrSOXBFeORnFjNC4d2Il4W7mLoBskzivPS5NosIF40Jt1nD4FoMXo4EwK15ZF4p9aB
	DQJwpIjXby47wlT7PnUpCr+A0auF8XF616kJg3Gg2Xs4+aO6YIn16C+ZklKotKFRJontBFSQLqR
	C/7yDX2eyC7RMWaQhUNxRm6ANcirlrBICgKSp9sPmFZoA+sk7JzLldUlxKMOAeC0V7AjfRcQDoA
	MlpTFHwaS0OFazRn7Qt4tTgeIbsLTJwowRx0uCCG2jC5UQhuRzwBX24DUjqMwZ0OTiHRTjmKZEw
	XrJ3jOB7YIPop6l1KRQlgL3BQhgIdU1wCP2eWlHdWB7Y2u1cuvCNoiiDz7k0AW9BLvLErtji45x
	V8bHUYOTSn/4Yj
X-Received: by 2002:a05:6122:54d:b0:5c9:c60e:3a47 with SMTP id 71dfb90a1353d-5c9c60e3d80mr5853059e0c.19.1790082142479;
        Tue, 22 Sep 2026 06:02:22 -0700 (PDT)
X-Received: by 2002:a05:6122:54d:b0:5c9:c60e:3a47 with SMTP id 71dfb90a1353d-5c9c60e3d80mr5852752e0c.19.1790082138994;
        Tue, 22 Sep 2026 06:02:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46d670fsm479365e87.40.2026.09.22.06.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:02:17 -0700 (PDT)
Date: Tue, 22 Sep 2026 16:02:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 4/9] media: iris: Add power sequence for glymur
Message-ID: <f5ynb3fixzn2fy4f4cjvalw7n2jbbrejd63t4p4455gktwa6yx@erkmcd6x7vu6>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-glymur-v11-4-e0c8bc914742@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-glymur-v11-4-e0c8bc914742@oss.qualcomm.com>
X-Proofpoint-GUID: LtFft7mtGe2mkDCxZh6f9BRfdPrIGGD9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4OSBTYWx0ZWRfXxh8PqynZIaBZ
 wipdmjXjE/E47a4xVjDn6Mq7wgAhLkfKpBcFQdE7NBNCXNBd0vBe5EQmPv1rbLzYlaf1BwzNQ1e
 aDLIdHHGJMIp9E89o0F7dPEYXNVn/UZ0iRFK6EvmGRt3QuwtcdQ2KsJH7+o9lIlMwl/hwfgc34F
 m0kN7fDbekdnvenQSkb1kvA1piIlnGOzD7pPQ2+sqCXte+9vNOJ6xwnFlQ48Vj07+sEyEpt6WLH
 z6pb39bb1BRIATVUgG6G+tTq1559ntQ19rHWGPlwCeA/uDZvvGFOtoKAazEM67oWEPzdxFJVXvG
 wDhGKIcFNJ/cISICNJaNfIRJ41oUbsLzEiG36rze9kZaSril/CsOQF/7Dc4n0qTpaz2qeWicSTc
 49tsXbMc9gVyBpTQmeYA+F6OvoaGT/aTRtdagydype+YjgnU5HaPafUzgdZc9LD1zh+RVFo3ugl
 +zybGlhjLnHPD16pY8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4OSBTYWx0ZWRfX3/C8yTPBNGva
 zP1jGkBSub2p04Iosb6mZ1ZHtDfSlQrwn6O7MgOLtrtAoDo9x4CVF74i/KufVXKInRRNHTb6WfE
 ysyAyYvRbflqY+1YoGbj3lFXP75M2jo=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab27c61 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=7ng__jp-IBtt9HV_xosA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: LtFft7mtGe2mkDCxZh6f9BRfdPrIGGD9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220189

On Thu, Sep 17, 2026 at 10:30:23AM +0530, Vishnu Reddy wrote:
> Glymur platform has two video codec cores: vcodec0 and vcodec1.
> Both cores share a common clock source (video_cc_mvs0_clk_src) and the
> same power rails. The clock dividers between the source and the branch
> clocks are fixed. So when both cores are running, the source clock always
> runs at the highest frequency requested by either core.
> Since both cores share the same power rails, the power corner cannot be
> voted independently. Scaling one core's power corner up or down would
> directly affect the other, leading to under or over-voting.
> For these reasons, both cores should voted the clock and power rail must
> be based on the workload of both cores.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 127 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |  12 ++
>  3 files changed, 135 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
