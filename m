Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88355175A7B
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776822368; cv=none; b=a91IYQTG/P+ZqJKeFm3TPzMeBV8r2FNUHa221/ei/l3NyIqZNb5yUWSUgkB9sZShG8gRVRqY37+lbEjdLenMMOtoGUrAM4Hajvag/z3+4vKfwx4GJMTBqf/qaVdTkvVWvdmmpEmbh4oEwtYzCHBxUmeJtCkPWD21UsNaw8M+UFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776822368; c=relaxed/simple;
	bh=J4wTpoeaO9WLgzP8Jpje86KjuxOS1HQB4mEYRLZ+P/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgUGnBgl5cClgOIRYSFoGbxMMIXuxcAK3CvB/uZ49euWnFGg3gMlUBsmPjubKGEtOcoV4qlfWykAnGqUE9TbuAhEsJPibbjoeAAYWM3RSSltEprYDc4ENbjhkBf7BNMOh3KbFNp2IG1qxi7PKFPBuj3emAYwk/qJET+JMFCdHuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QtwuHiCF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8fuKRy0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QtwuHiCF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S8fuKRy0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZmCc3377498
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d6qcSACXlaQj5b1ggVkdYa0D
	KEGMgEtnXT9U+NqrGGo=; b=QtwuHiCFZuUERNAn1f54hVH34luiWnKIkv+1Xwoe
	zzLEiV9z5bww8oPa2bneh88dqsZ1XdLTVfcWKoXs5aYDLQou0Ll1U+G2HK3K3ZD1
	GUoddhDQLvIKoFsxd8W6W2nLc/HMReIsQSkkc8WadJFTaBB9QDtKAbw1gQWt72yq
	ROF6kj8wDGJ09Esfb/rCYzutUz7sh415P5MBLLnUvCqwE5Z5ON8d7ARnBiR6hJDm
	p0oR8JoK2ecq/FHElgc2X1YtuVFgDxX0/UzHp/zQEE7PdYilWwN/UEFFkxDWJFpb
	sKGXarwpsVtlk1ChsTMI24bzJMjVfvteOOoXnWQu02lxRQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng167j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 01:46:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a16036c90eso125529736d6.2
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 18:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776822364; x=1777427164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d6qcSACXlaQj5b1ggVkdYa0DKEGMgEtnXT9U+NqrGGo=;
        b=S8fuKRy0fwvf6z9T9x0aZm9Z4QwpVH/fzjIcClf4BI7WvKcp21bKv1DAOO1uzPVC8D
         IVh3Vf9gsVHs95SgdpcN0jLfHnvbym73fbFodnCINa/VBG43R7AE4Dt/fowIHI01At+4
         5MjYIHyO/ngXOB/Grz1342pe+UqvWfC1nkyd7yL3tebhBjBuMdpcsQPxKThvy9OwfTFb
         ztZbwamQZZXRife8W9gbni9CEcWlkL7LGBePOE3pLje5gRjSW08CfWTdzP8yPR83wVAe
         kkNTmEzLXvXmlZoX6dj/YuKUdVhsWnzpEFdaOtL5mnaxcePIGQfvE3ui5xFwktR2BDeQ
         So4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776822364; x=1777427164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6qcSACXlaQj5b1ggVkdYa0DKEGMgEtnXT9U+NqrGGo=;
        b=asXvpNa63CjeUyybJw5oqoAlMdz1HCJEUeQ0HCVEBs1VAKK9Iq683l92EwqVpEaEa3
         c/w6AKXXQtLVHqBLCCemMZc9shixy4ybi4LZ+B3/e0xmL3jsggPNbIJjdr0TW4Dw9BL4
         U3a5h6KFZMQIhSsycpFkqIhAmHr160slIZd+0EFCc3zLyM3Yq3X2BEzEJtE8PXm0KdrS
         TOmMpnyz10tMW182F7caP/ePHni9lnmNlD1l+j27TDvVc6Ez9RfyfIADdSBZJN6k397u
         JwL4ADfmwyAjXmFimFumI7wOjK91f0xkD9ypej8bXVgNKJzsAIRXmTP1XVni1Hj4NWGg
         0HCw==
X-Forwarded-Encrypted: i=1; AFNElJ8UQTmmMamKgWDWDd/N9PHjAxwcLAePufGEwM1ZMRIpu/t0BJQhXyveYDcQM0qFnV1IkYjb8sevXvmi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5cTTKXyE3aRw/qEaXjhgH/fiCCFccX0x+48vP9ugOLkT9nTI+
	LiF1cryVkB0bB+eGcw5tT71S/h8j8OZW7pE6vlDupcYYl7KBd/fqaepK4JWqmFMqEIvqNRvWtpH
	ARX3WwILZ21Lzh6/Itjhn8jv9UJlJtQb7NMh4Wbz7o35/PTu1YDoiW1NW9lIbjDi0
X-Gm-Gg: AeBDievosFvkycQ0vhHT/E8aChU3OEwuZK0i+f9ERULT9QmIo9Mb16PAXZz71RG43Zv
	BlNdmzqbfaQ+dm5+dF2TUONLxTDXIhf0jD5YtMCCdlZLB/oS1cg8Ftgd4awOkdEYu27qMLbAdu2
	Xqv32Go/1Dra1RiH9oQh2x9os+DeAfxQdAbqoVBmidhIin8ZcH87xDzqZlntxqFcz51jRWXP+lY
	iZhiZknXyVJLN45GrWljaYqGJA7q+J2ZkLbmrun9VXbKRuZXtAhz0fhDWhl3sU++hrH3pg3tMcW
	9imOlwqeFjuyFaQoBjkgx6cnADrfVs3tSe+CQYGVGu5k+e4rcL+ItPeCW5NTSmt69q+EwkZ1OZm
	NE6+dDu9LlnNb2+z27sk+G3u+nR0aKXC+F5AMKJxOamFTu5uo/xV2B+WEBQk77+l+WzAqinPEUd
	zeGtoOTpxIxU2+kWuCpH8v9oe7iYm2MMCiNctxSv7hE8OLOA==
X-Received: by 2002:a05:622a:59c9:b0:50f:b790:96ae with SMTP id d75a77b69052e-50fb790a502mr69541751cf.22.1776822363767;
        Tue, 21 Apr 2026 18:46:03 -0700 (PDT)
X-Received: by 2002:a05:622a:59c9:b0:50f:b790:96ae with SMTP id d75a77b69052e-50fb790a502mr69541231cf.22.1776822363300;
        Tue, 21 Apr 2026 18:46:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc333sm4131426e87.24.2026.04.21.18.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:46:02 -0700 (PDT)
Date: Wed, 22 Apr 2026 04:45:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: contact@alex-min.fr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH 5/8] extcon: qcom-spmi-misc: Add PM8921 compatible
Message-ID: <g7gbtckydu2avjg2on2vx7iez6btgywfid4wxki7cvzovs5m5i@x6uo3ghjysp6>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-5-bcb0857724de@alex-min.fr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-mainline-send-v1-sending-v1-5-bcb0857724de@alex-min.fr>
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e8285c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=yfR4zB2R5DhERghfh4QA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: VqV-kB_IiOMd-a9QnskfkTEUYxw9X_XQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAxNSBTYWx0ZWRfX4gDXM/DQmiir
 xgkNpIQZawpbGTGqoW4RBsvgArZbpz7kBWdonocV5vQ9rC5zCgcV8R42YR9ah4BUb+qjIzL7W4B
 VUa3J0LQwptGmyLd2uLf6PhJ+d7HX49eSE94bn3UNjPlo8mRx9UkNCjpW5yRHWyUT8mtgi5DpNi
 qKmv8I58HayTJw/P8bg2obg867lPD3te1qjf2V9HRqVDCdw0GtHshXzO+9MXc+hCmji8sW6B27z
 JgPqeCNC9DtTTvNizLxPPFLhg4w95QlLIpm64H/+0mg/ygRnJMKhtJf7PfGtwtc59BdfqfYwR+8
 z58BJzPPLOL7FovEr5gulmxNqzfZQiYxOhL5ZE5r2A8b6v1HNNBrfsK56n6QFGwe4fCtvx6REhI
 03fT9SKKtq/TPzHl2nS+Lu8pNigbJxBb2+6A05gJKrq3dhipJ4NMxOrM9CWfN+EcIfeWNVTffiF
 wPEgHJnA8yHnNoxvfnQ==
X-Proofpoint-ORIG-GUID: VqV-kB_IiOMd-a9QnskfkTEUYxw9X_XQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220015

On Tue, Apr 21, 2026 at 11:45:11AM +0200, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> PM8921 exposes USB ID state through the same interrupt-based logic as
> PM8941, so it can use the existing Qualcomm PMIC misc extcon driver.
> 
> Add the PM8921 compatible so APQ8064 boards can describe USB ID
> detection through the PM8921 interrupt controller.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  drivers/extcon/extcon-qcom-spmi-misc.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
