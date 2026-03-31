Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C620441022
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 17:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979711; cv=none; b=GSZqvwrQjHaKAtxEnE7n3D2vqrPMgvtEYXKXbpWjafXbe1bjWvp8Zip6S8o+Q7oQk4vSxQJA24SNPvZQCusZO0UwZOZUTxiNpGCEhRux35TvCoRjiJ0yBvgH0UYSKMUetHK9x1McSQ+MvV9jceesE+vHT+52y/brWqayvPrW9ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979711; c=relaxed/simple;
	bh=ysBMc/d/bm8Vg/gCg26e+flxgxRWmXHAvsbtsXQGdDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9mZZS4I8a/MGSKxhf/cFumOTBfiVW0a1/zQki8rP+X1g54BHV6Q/1zFhVyx3y23ozv3qCfwArtax6//peAbHwpYan87E9AhjtcBIq89Ps7Fy57nB+hnjbI7EdMDjj0W9FIeA+MGaCPoREDBkEly+o1XIJVYvfclVPTUMBJyVzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1l8XbV6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FIwiG4RM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1l8XbV6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FIwiG4RM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGde1U453920
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 17:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kCX+3SO/R74+gTOVpzwntDTc
	bLEOU5Egzkn9WV1WEfs=; b=H1l8XbV6ur2Hu7XVturiGp2D64MbKfs+Iw5aaKam
	JBMORqcZ9gAZrfPEXThwsEhfeZuSNh0aAHzPXUrRtVlZCHxrlQWSIJ7Dwn+MwOk/
	Vgr51EpcG5Sx62znWo4il3vPtXFAZ8spIxUZc+e3qnXleJj4c3mwZxSfXmGHdbhN
	gzpPLsCzlVg9e+Bt+JnMYq9RjdKCYQRDrXKF76ET8CVnpbuFXp6VvV+uSbctwe8J
	E+aiCs0iv1/XQDSc3d0p0m+4sS25z7KDwTy2zqHFNrJ0V87e0y+UuptmJW3MIZf6
	BnMir5xOVy2163ZBrsXvi+kaGI3ZKUk8Wkym1JyqEhrGog==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsmke9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 17:55:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4076dc16so60986641cf.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774979702; x=1775584502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCX+3SO/R74+gTOVpzwntDTcbLEOU5Egzkn9WV1WEfs=;
        b=FIwiG4RM35wJNvEPRksbeF4aEkGCLuzJOWKgtX1N8GISb6myxGbTBzUP9ZXYRG7H3t
         BBxXbbo7ZUCPEEE3cIcCFeXdvA91x0B7GvbAFeb/t6wboilNwOvWIOxApOQhq0CDFM7p
         kiSA32UnVZgpscQvfB4S59EGTsoLD7MjoVIGpxNiFaG48mh3R9nrvCpDGlQc8LUpN8AA
         vABhZjorSBRFL8qaajDC1NUk/vJRJTsaZsA7NiDRRG1tB3nLWv3y394I0YT+BA1Q+hQ9
         RxsxhgurCUYc5k25XnDwSF3Ud/2+Sy+AxrZpAqViB3t/k0fDhx3jQeT/CGPrQ4FIi/x7
         D0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774979702; x=1775584502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCX+3SO/R74+gTOVpzwntDTcbLEOU5Egzkn9WV1WEfs=;
        b=HRy2rAGzQF/l3kgeK31Ek29UgaKq/gmE5TqfUjonGgvvBZeR3/7uC14IvtVKNgvZtM
         Bijwg9nQv5ZeeUFBX7ZJH3NeqOJKbsldreMACOZ7XCp4eS9jB7qcw9Md/kudclp7rWM9
         B7p63Jt3ds01DKoYh6haqX4R+XuN7rcMD+rxmReR6HSOz/k0z8k/8Kr8CAcVls6TznF9
         qrMNGc+8FecOUzZTMuzt3BySjOY8gyoTXvJ+D7QovVC2rPW3Ic0R1w2VxCr3Hk7qTFSg
         5d/VsNEdL2wkJf30xYmqqYuGbWlrxQaw5hzgHL2kUa7yHnSI+sD1tyeIANcpl//CJK4+
         S96Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTsGhcYJ4qpDH6WqP/had6Zyal1hcQUpZUzn0AACusdqzG1gBlffGLRhR1+nG047/aVXy8KgnY9K0H@vger.kernel.org
X-Gm-Message-State: AOJu0YwC7Bu4Ra6axks/nDQTbJxzV4DiJKmUdWVar0WQ81QeLsoOr9cW
	nRGlEm3j/9LZNoK7mhCcO5ULHMHvm98C8yszQPIuVwQxXEQXmmlRib43aeJ1bXmeN3+psu2QDSP
	rogu+6e8a1zKaWLUWca3DUktr5j480FJUJPvmaTPVjeKVHf5xYdhQqfTvmbw0M4p+
X-Gm-Gg: ATEYQzwu/pzb1tOL+zf/8ACaCl0srgbkB/4a04YKTWqOw+XOOV5HE/EldFSHwJuVk63
	RnlpAQPMO9VqDnbV8M3LkEY/dAwzmM17bbSA5JID5pBN01Le/ybItvg2eRdAmAPResXL2FgxtfD
	ZAtDRBg8QT3hvFQOaVbo2GkNHveS64HonG0yNh0vkYfqiwuVDUGOQorctAqAcyQpRK+D+HvkVCX
	//oFR/ed4QDm0dY2KBTihjw7ob0efJvQlgSIyoH/7bzhfdPFnoBJLzjuiFe4w40n8kREICWJJ2R
	FDPdh52CLBeVRJ/jQBvuSFZxWWJyrdzOe9oaJ+45mzdXzQtbvbrEtECOrcLIy/NF3+MgH+KOArP
	PUUv8mHRE/aavKohCt19E4An27kmw/69PTv4HpcxAVNn3nEjPVkyvWR/VDxuBrlSfP+cG0kKuM1
	M3vB+WP1+eej1/s/38s8E9p9dseHO7qaQlFt4=
X-Received: by 2002:ac8:5a0d:0:b0:509:1a36:6aca with SMTP id d75a77b69052e-50d3bbe437bmr7197781cf.17.1774979702508;
        Tue, 31 Mar 2026 10:55:02 -0700 (PDT)
X-Received: by 2002:ac8:5a0d:0:b0:509:1a36:6aca with SMTP id d75a77b69052e-50d3bbe437bmr7197371cf.17.1774979701935;
        Tue, 31 Mar 2026 10:55:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838b7ce7sm22341951fa.28.2026.03.31.10.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:55:00 -0700 (PDT)
Date: Tue, 31 Mar 2026 20:54:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Fix DSI1 phy reference clock
 rate
Message-ID: <o3xe7rfzwyendjd5yj3kquw6ayvxdo323bgw4fkhzsbjywceyw@5pifcduwqcq2>
References: <20260331165645.233965-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331165645.233965-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: uo4tX3S4OEWrPhVRYyCLjf-NFkYu-oN4
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cc0a77 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=m4qzsdtWhx_JNS0JMQoA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: uo4tX3S4OEWrPhVRYyCLjf-NFkYu-oN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3MSBTYWx0ZWRfX5PHNTq/8WL1z
 AhMBHoZYGAFhkA72v7Zhfa+wdhYSeunxSCad6o+AOdUW0RmvpljVfoJcIrzZJ/j/3a2Is8r8jCF
 dG+O8zw1Qnpyq1qnlQGy3N0pYU1QfUfgYcRmKgtbVbbo6Q3wd6tMF5JFv+f8coAxho9eC4lNY5k
 JE5yfWYi/ZH3k+b6famw3xj7HGN/IAfRYxf+B1jiTEnnbs3y3npPAfBAvCsRpkUesS9gEkBUVUR
 8JHAgmDWyqRUXcXlioQQ0wL/6Jsk9KMVskGKUxlaYA92sOTvDEo3waSJwzYfNwp6Vuumkoukmwp
 I2UMLzwgZeNMUy4rujTPjCSUAjLKw4HygGebGTwbBzvckssmZQttxXoU96WNnIQvYpOJMidhF7U
 FhRwdlFhNKACDFhFjGAbEyjsP+9UxxatBK4CXqLTxBOnU/9RklvY1OzF+fGSubt4yb+b52WNRAh
 mb2KkKP1qDn0WrLAZaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310171

On Tue, Mar 31, 2026 at 06:56:46PM +0200, Krzysztof Kozlowski wrote:
> The DSI PHY CXO clock input is the SoC CXO divided by two.  DSI0 already
> uses correct one, but DSI1 got copy-paste from SM8650.  Wrong clock
> parent will cause incorrect DSI1 PHY PLL frequencies to be used making
> the DSI panel non-working, although there is no upstream user of DSI1.
> 
> Fixes: 818ae2b389bc ("arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Fix for next branch.
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
