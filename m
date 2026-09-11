Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB264908DA
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135176; cv=none; b=t+PXVfO4QEmFg6/b57nOoJv7/buB2EAxxO0+rYFfbAvf6p7x/VBepSiMptdpTEvJ62NAv1vJaLAmW6MCQuWqOvMU9VmFcfdv4jAibL1Rhiwxx9DkWjdqgmycdf5o+iADcLBxK6ZJFS+MpG9QnZ0orv/dnfzx1LVinAnNm57W5jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135176; c=relaxed/simple;
	bh=Cfk7Wf7OJL8eydsCbFx6AkcZQNkpsmWuq6yeNztYobg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGuv8E2HYhATezWFTW1FiUsr9pjzwfj1wcrE9ftP+M9FSa227C5Vr7AnDPKwH5LmcUB33h+1wYPPrJj37qg8uMk2Mt2ElB1amWKz1/1KZ4rkAY00gJOlPeCiWGU4cgBOKvBGR/F0w7vvKDvTBPRHjrFVXTQ1fHQzj6qdhijw+UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EaxGx1fC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JL2GMymU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EaxGx1fC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JL2GMymU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjE38171095
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LDeCS3eZuekduy4ndqVJ0IHC
	QIxJlJj9sTDSGZEJfYA=; b=EaxGx1fCfdvGuDn7PdQ9L9mqLg1PORnK0PQemO8K
	LPw+8kujUEY1LyQTh+sMHJCs9pj53r0H8gAiPir8PScafxsDdMrOYvoRfalUvuyh
	FJSwVLI2y2oNnCZAttJNWgmwk1/Dt5oYU80ZJ+iaiR/FapS619+dW9muhGmsiS5D
	7EBj2RGKFpxcesk8KB9y+Bke3rQ60w3Cok3jAaLbWdOqwU+VRVzS0cuxws02+b8k
	Yjvb2PKFAIzqV6Bi6Qf5PLKUPR+4l1HQBfsvYvzIbVFNGF1ou7NjPlEN3uW8yP9k
	85PFDKz6sjvNhxyEEGmvdqG4aTaWPPSMzx/++0O4sPTvyw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg27tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 13:59:32 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c7a31f3af5so318368e0c.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789135172; x=1789739972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LDeCS3eZuekduy4ndqVJ0IHCQIxJlJj9sTDSGZEJfYA=;
        b=JL2GMymU0zd3k5RbyHvv4MTVa0WFy2OQtrbmLiOQbTAfTixsswr1ybZMTcDgo3iz//
         IEDCvAhSKX47x66jXolYhmIE+cbRtffLNSNN0fj4GaIiQLL5WM8LaNY5KKSG6mDDH7ZJ
         XeUpjUOfKluWCxdTdrudnlINDZlSpdX9F/L5hrfBbrF4GZMH0B+YYNT4DifzmuiR3lqQ
         oc+voHsXheBum9i8Mrpg2aEwiqZSuePBWHcNvQWkfkwEEWteVgMxkblMWG2hakXbgzBU
         4VoyMtjbMXDPox9TVnzBwcz0dsMsla4D+uQwJ+20BlktNQXo6OEppxiEs0ttyD3VY1bw
         B1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135172; x=1789739972;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDeCS3eZuekduy4ndqVJ0IHCQIxJlJj9sTDSGZEJfYA=;
        b=VJiiWrbLrOpHRYslud6bmyd2/IxoGsRNPFbETKgDgBpgTejrhYdXnkI5Tkivs6MaHQ
         rS+VUfjL465lqEEOIuYlpUN8rgN4kdMEJ3MZJyYNklIxG3FZNlLHU/Kt9tkDH81c6YK6
         pC9UpOUTG/DmIgJR7/HzcBxxNOyidEKGyA/xH3T1fDnEVBvR2oF78PQbaa4+KypdMwiL
         nB4kQ8ccEL8ICKbwPYX/6ZQHNV2LclSdKIeD1hn1b7klW1HqGt/nXMC7fOGRcDjLqSvQ
         0sjhwqc0Pr7cI+JvQaG8A6RAg7696u42MtMtawl5SWRrlzTIXa/22wFrEmJoOPPwP3tN
         AhhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdjY/ig3jQttjqirwaQZ1ulM4KVH+7O1ZwdacJ4x3OtVxtVrcIH2sGOwkzeu3bt5b8A4st2oTHOhDV@vger.kernel.org
X-Gm-Message-State: AFuF++kCXgT4LW54vEen8vnKm9r6CeO0Lgg8SVR8HLP9WzYBsQWzxG8X
	oKwUdoT7JFEauj4ijOEmW6TF9JJt0izx7Jhi6V9U4hlGTRxrcDsPBt0HGZ00ArIdps8drXfcK86
	+WSVxL1lzmA9SutL7/nHlV7vkjnVLmUVGfTSItIdbXgdhH+58HZmIvspjsyF0vSwK
X-Gm-Gg: AYBFou0Kla16G4SW4OC1V/vPzuUmspWjmOVj5KTG47NQvnN4iRjwIH5qbTtrszny3dq
	rkP59x1nCSkjnmMVp0B/2coqGd6xmtUA8ZV/cKGn8ZW2CHX+t9JmDSGRBlehQWkcK8DrThgCcQB
	93QVC8yRci0a24Ug4B1uULQTNE1QwJwFHZhgU1PcZU9dV/vebTtMysS5U3vcAr5g1eapWjnJN+L
	+ztT87sAb8sIF+H0+cEFaHTYc+tvOePbhZATINM5lCQm1C1At6KWN/qw1zWWL+ITzzwTJ4YSfUQ
	lh3c3sG7UsgVW94p/sPlS9Ktw+aUx7qh6r21CkcGOg/8vB4tEuo0v30sH8eZIr7dLykSI/wZqZ9
	vITy4Xm9INMqgOiU=
X-Received: by 2002:a05:6122:3783:b0:5c8:44fa:7230 with SMTP id 71dfb90a1353d-5c845f4e527mr5860241e0c.2.1789135171545;
        Fri, 11 Sep 2026 06:59:31 -0700 (PDT)
X-Received: by 2002:a05:6122:3783:b0:5c8:44fa:7230 with SMTP id 71dfb90a1353d-5c845f4e527mr5860159e0c.2.1789135170931;
        Fri, 11 Sep 2026 06:59:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm5985011f8f.1.2026.09.11.06.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:59:30 -0700 (PDT)
Date: Fri, 11 Sep 2026 16:59:28 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Ociepka <greg@ferrisoft.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur-asus-zenbook-a16: Remove
 RTC-through-EFIvars
Message-ID: <2jtbekwtmzi5zot4fmxj5goaw6wznzgxymx6xubc6hk73yx3pq@7mk7agqbyv5l>
References: <20260911-topic-remove_uefivar_rtc_a16-v1-1-0967d8d4b3a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-topic-remove_uefivar_rtc_a16-v1-1-0967d8d4b3a6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6DuKBuZsVSsOeGTy45ZmE3XCesX8-Zhn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5NSBTYWx0ZWRfX6xZ1on/LUIkU
 XJFwgk+OANUV3m18fSrqpi5WuTLRDkBQKmIZiRPA78mF4WYBchxXMYGHyRiU/anZ/gkCM/nGw5U
 7HZBzBXCXJrxN0HEF0yM/YcnCCsIPFA=
X-Proofpoint-GUID: 6DuKBuZsVSsOeGTy45ZmE3XCesX8-Zhn
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa40944 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=a8UEx8NLAAAA:8 a=EUspDBNiAAAA:8 a=6ODT9UzxMjEpfHFhlBgA:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22 a=-yeuc7zBjbfZT8aiaP-D:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5NSBTYWx0ZWRfX7rIH1URxvWFG
 SbgDz7FRotsz78a60qsF7Qf5iT8L9AYZTATKmU220RxDroSbIVmDgd0s31rb0CkUZPbW/ux2NZG
 96AVygMH4nrYx7DymIcouSXVBgl2ThvQpeyXei5nuE/QGwTqZ+36z5cfTxngLT6BaItRKDXM1aK
 oANQ/Z2Pn803Ot8Sr52TaTlQPk44yGF84of2UXQ2RPTAmzW8oX63bNGqTtipFe0kaexCFPzG4e8
 T3ENFexgiS2NwO4pW2Iwmw5M085qDnJaXM7piw93jjVE1MjgZnHNH3XJPu7RAhLtGrY0Pe+XXwX
 MoksWgk/V/bjznL2qkIPbJLJ4uIgSq9nyh3IsPjo2Ids4ghAVoDk+/lAecrPTFUQ3ywyJpcNOKB
 9pHj87xXmnSGytk7LWNROEB2+NoStZpuRy2FH2XXKjngj2zbbBGFtezncz7dcwBdq3eQZsJ6uhh
 K25hJoE8Swty2R+aipA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110195

On 26-09-11 15:27:03, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This machine, unlike older Snapdragon laptops, doesn't feature an EFI
> variable to denote the system time. Remove the property that suggests
> it does.
> 
> Fixes: e8fbbca94db7 ("arm64: dts: qcom: glymur: Add Asus Zenbook A16 (UX3607OA)")
> Reported-by: Greg Ociepka <greg@ferrisoft.com>
> Closes: https://lore.kernel.org/linux-arm-msm/20260821181148.1642208-1-greg@ferrisoft.com/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
