Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD133A873B
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561170; cv=none; b=D3YW/WY57aT+/QI/XNCcbIbfQQMz37p9J8AWlI8qMQ2wo2/bRmh64jSeSDPmedQnZEha34UPO0C/t34B6p04CYHYKaS+Tu/nXTRMhs2IolRncS6BDNzBDoNckEU3ZxSibeyOclBb8ynTWDc8sUd6sC2Pi6KyZXrDTa//PSx74oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561170; c=relaxed/simple;
	bh=uJpcUXZ8ngfDc651XDihmek7Ivq6mNlCdauDUPw7X/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9mMusC2TKue3rVVHY6rZT+w+o1Jj6OZwAy3n4wMj9idRzD5Qmya5/1bToWYw91aMl+jJy1e00FWfpAkq887jJxyp8FCBis4sp8Muyx4eU43onkcuLjHEyxDRVGAttIZLs4ebwzRlnoPfj1EoG/ZabVHOHezu3nBpcMCu4Um41o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qk9SYJLP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3tWMBiy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qk9SYJLP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3tWMBiy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376GhNO4008692
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 11:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4aXd8HT5b40tGbD461q6/FXJuEZ6/7PBRmqsBkcdEEY=; b=Qk9SYJLPmcSiobdx
	DDdpEomgeGQBmOYkdDskTWYut20jMe+eqh/qNYcj+pTIC5UneXAFr0sPG7HCzJRS
	fwRTUueOrhZDTq/96dNT0cUYQfYtI1qCnyeKPysuuj7qH/Znyy/J6KiuZk3pvSD/
	B0iwKlvIHB+tQWGKJFBxAn8TUJ/8RMWT5v7Bm7F84xyS4p86AMbIdol7WNPQ1SEN
	QqCzEKA6nb3lcPlo/JcgYxKIYtQmIo5cg+7WYd5sc8d6q8zqFnSOV4xnSJh3e5Ce
	2ammEG1tXFAd9wKJqTR+n6yxnnGVduTRaDR6QhDsjtLu1+yXPyRa+PXQsdust7nx
	M9Mx5A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrkte8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 11:26:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5073ed1ec6fso18171051cf.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 04:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561167; x=1776165967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4aXd8HT5b40tGbD461q6/FXJuEZ6/7PBRmqsBkcdEEY=;
        b=g3tWMBiych7PWlu0TpBtvGN1vJdez1NvP+mZupX6DnNkJl/RPY+Rn5Q5HFzJVhI087
         IA3yg2A+fGBPiZyE9MrKuZJ85if5TTawB1CjPpQLD+eZWb73wYUFoCu6yATPe1vNV4lH
         B3usD3hXc4JwQhJl0p+ZsdrzlX5lhLyraB4WK3Nj3nslDxpQwTzc2t1oCnZwyrY1pygM
         zANLbJpvJBre8BYaMZlbngFANebe9toHPFpr3vKX0rHVpX4FkVO18IZrbEUP74CDzGsf
         MJ0nGeRHS9RHwW8XAhJcckZMubkdT1gTSqm/eza1443qiPq/ZgL/arvW3CstSea9LRwE
         Np+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561167; x=1776165967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aXd8HT5b40tGbD461q6/FXJuEZ6/7PBRmqsBkcdEEY=;
        b=JJLdtFS/d4pkOz/XzVpEr43dOplgsIkX6kdziJ1zZQ46yVGr1XQpe4xt5xvWd2+LgD
         /rgN1Jo6qN3fJnmGAsMUKBWXJK/5CtQxbyzy3ufHaFzWcsIIR8XkiZzsRWaQNVl9aEwS
         bNqKHTFdq29aUZtxZPBM+bNiuU6sA96Sv2ErcKFe9rZVmJJr3icw4iMpxJz5N5v8RevO
         tsaipqNv57+UcovcQZ94SnR23EIVQ0d/x6BHkPTcoxPlaX1TBZQgxswfacz3H6B/j4A7
         GcccgXsOcSiErkkRZrFE9dAMAhMQ3ooAyBSuqV+140wDBG+nzQMmv7rozP+Z5i3fZ5vm
         Fj9g==
X-Forwarded-Encrypted: i=1; AJvYcCUf0yMXCIHqAx8jUSSoFChosW2h+t9bYdsF/2KxZW7EHeHmA9aIREOsjRbMkD3voQEzO7rv7LrAyhIK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6S1PaZ7hqsj7ac+zBVBY8xZqNBHQhngAzA8Q/lwuMjNo2+fNu
	pI3kN+dFral72yNPhFngFD8+Qfas79wj7SIm3eOrNr5zD0iG2NEOfm6bWQyd6PiTeTJCieQ956S
	kzu68Y4LgiFL13x5n1nMQZ+h1PxvS764iAdrC7hNNyEPegG8VgiUPmgehEs1nrAzm
X-Gm-Gg: AeBDiet3C3MmPSYyTxW/fySrqB71gCMlUJV9MzHiLEQlT79WkIA1lTeN7kAwBvoGUvs
	h5agsJPi64V7xugP9ckK9xkXzWHKppG+9KdH7Npr1Me1ZnYTBGVafpIU5wXAoJZpkRDFYtE/LRh
	s3P+dNqksOgbM0wMwO2Pcri3n2GXFzQFf6t8xsxiYMtn+PPORfuG1uHmCACC7UECsW08ACn0Ee2
	93G8ZtbwcNSrhlJ0kcNHuDbHhxHFtuKISRphIsVUIJx6TvEPDAFJYAOU+PAHWyrkyYA5jHqbDw+
	Lkcj8YlfxUwZwDzF2c84nm6ycivSXqjIr4ePBHZ3Mc29UKqZfp4Z0AIkkuisM4CmkR6jfiM10wT
	narQVHExBtGeQpk3hreZNtVVE+TF/EMDrmipe1ZMy1S63SVt64C0quzNbLoBNDTWNmonZdOjYHX
	+mPZQ=
X-Received: by 2002:a05:6214:20ac:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-8a701aeb01fmr190561186d6.1.1775561167346;
        Tue, 07 Apr 2026 04:26:07 -0700 (PDT)
X-Received: by 2002:a05:6214:20ac:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-8a701aeb01fmr190560776d6.1.1775561166945;
        Tue, 07 Apr 2026 04:26:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c11sm558375166b.30.2026.04.07.04.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:26:06 -0700 (PDT)
Message-ID: <11b683e6-aca6-42d2-8993-b9aae39ae44b@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:26:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: lemans-evk-ifp-mezzanine: Enable
 mdss1 display Port
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com
References: <20260402095003.3758176-1-quic_mkuntuma@quicinc.com>
 <20260402095003.3758176-4-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402095003.3758176-4-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4e9cf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=fOsgxGAhkaL6H6YktGQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fQ_cb3JpQeDt9hvJ3qg9ew3NDL3NKc6p
X-Proofpoint-GUID: fQ_cb3JpQeDt9hvJ3qg9ew3NDL3NKc6p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNyBTYWx0ZWRfX2QM0GAS3fPF/
 FEHg4d2Lfuf6kXThgguVgR+129CPuYI4AgJzFsUYTWc4RU9VwEFuQpWyT7bvbxRgrPBOKq3al2h
 wJ5+1gJz0NV67CZKUONfhWErXOlOXepuYWugxSggsP++/7H08r0gIcBeYx2PkoVzGGSv9V/nV6a
 /mmQNZP1jxodapKGW8xLj06XlgipPomu02vNeMPO2j0mpTLkf/QCeTyCAIFZyCsKh4T9iub8Cfw
 TE9xHh04k5YKp3516ioLnUYMxnhl3FUSc2QvBtQBvTUlZL1VK3klkDNsL1m5EmnGgytRUPbH0hU
 QAZ+KJ+QviHo57Q2cfXsITziimUvwUDtjpQwOH5htGsN9dF5bpA+30kdhLdsysZpVY6nB0mHCjB
 FXH0LKxkqUeJCWs4jBqBtX/3GvbRFMK0P4ORi93VzawR2267xIFCoXJ0SMJzb8H8T7DgfxCocT2
 4Gf9HaLuI+D+6MrAvLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070107

On 4/2/26 11:50 AM, Mani Chandana Ballary Kuntumalla wrote:
> From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 
> Enable DP controllers, DPTX0 and DPTX1 alongside
> their corresponding PHYs of mdss1 which corresponds to eDP2
> and eDP3.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
