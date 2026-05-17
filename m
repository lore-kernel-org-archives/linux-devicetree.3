Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930EA2E4257
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042453; cv=none; b=bjc4kCGc90lb3D9aHPUoU5Hz9z4xG+lhJy14CHr3XqiGewSu2yCbd6z7PEXbbxTrcu1mkum4NMU65L+wFrPt5qlMZHMsNW8fRG/sPBpWSvadLa3gdowql0rdK5zyruRVc/jFphpHeeiXyaVh6GG7H7XSquhfHAleZTa8gDLM9bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042453; c=relaxed/simple;
	bh=2ZDNlYVmlLZdSWfLY/UOa8sd5nzN+jLOhR5L1W/oMSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Coe4l5Z6oy7hVLbuD3vAY1s+ZuAVGWc+mkEVn5rdDC6hZz1gcVVdtxOQiX3Rfy61wVG8QVV4rC2qiS2YQ3cQKalbP5MZHU4xb8CsAPo3WXl5m85Cfmp1qGnK6EO/OU536yByh9fPbBTpkNtUVTGeZ52tq2He9dmYSCrZo6WOSHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Te4+IUwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cb9OKLrj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Te4+IUwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cb9OKLrj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H5x7mZ3269475
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tvhDypip181MgNE/FhA+175W
	lWlikDmbimHRzVl1gi8=; b=Te4+IUwNEZ8mjptcl5doMThT/IZ5OfCftPbljn7o
	WyLt8v+uHRJurmB0v1L9RjfXA+7bmCpp/lFNsrNm/Jk5PnDIqcuOKzkAuR422K1f
	qV51fLJ3YIajYBuIgSlrQE4wxkuDXP9i3ZcRiIPndJntNTMhVJ0kOyIxd4iWaKQK
	Zd2rAtLieoTC7KbycK+T12v+P9OC8di+OwDGexoWC5YXAuNSeeAXeIVCXRzfc17I
	xVL8QEqTHJA9hPL2SxKJxiWWxuqfv8qwnaJTNGHQGH7daiAXUO2B7lKscgfTxpm/
	nHyfPALNChkGQg2T/uZmZNUHzPBrdDrM63d8dRcp0O5i/A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g3be9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 18:27:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-515224a8aa0so77765481cf.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 11:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779042451; x=1779647251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tvhDypip181MgNE/FhA+175WlWlikDmbimHRzVl1gi8=;
        b=cb9OKLrj0jUcA5FOgo3zN9q7qXWoimALo2XuoRDaykVS5rk+MDMDebx9tH63d8k9lQ
         KlGAn9WxpuEOvNsoFRPYxLMf0KBSyRgupCuQG7Du4fWGZyf/zTQph4liqjRReKD/TNJ9
         ynw0rkKN7Yyo+yuv8tYbYuuLJCkK0eLQ0pKAk7CRLDKWM2J4+SUoJjr0BsTLuKZ19/X7
         Plohge0LfXZv6fGTBu07fDr1j2ofWJ6QJkfcdoYnDJUdO/luGIUJSNndXcWwzecUjOsj
         TbitKUJtnnVD8v6qP+J7H09QFqz9nIh0xuMGINV3beYHpBMXcU8oFCPdSnG1KbLAL5sX
         sRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779042451; x=1779647251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvhDypip181MgNE/FhA+175WlWlikDmbimHRzVl1gi8=;
        b=RaM1m85uAu6QWyxub/9NRhuDvDC7+kjgjfL5sQxhhelJStGYMLo7MgZEA9BSBUGZ7g
         1LNftaLJ1BoxxRutkZAALoFRYwfPJfEFFHW5u6Uw1/Oj7ZLha8vYwkD+U5qDkPCpliBM
         eSsRZJXgVW5fAAkKUA7SI564U2x22eZYxl+IkllLf3OMDBq0quRVygQOGKXSfHkooko8
         dM9wYG+fB2QuiXu3QBewo/4LYEWXn0ZryyHnuAesH8lz9gNzBko90Vd7z0MSsZheZHhx
         Y6qwaLpPGBPWoYQQFRdhIQmv/1tcgKoObaoMx9/5CHsTefXuSbGD/CgsHMGRdhTh2NWH
         eDvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/H6ZdMtaHckqG2KlR1dL8IqcXAYRp4sfiALnmzJNPFq9v1p5pAU/KR3GnQaoX+4546ADQ92W9SPgTk@vger.kernel.org
X-Gm-Message-State: AOJu0Yym9cRDP0dzyHN9V90YUR9M0+7JBqrBtvIjB2KBVBFXiIaVkHO7
	nCy2PqY4Z3ruKUPiBdcHgAgvLCzR1rrcnNb2/alJ9f06rY4GUwxND7CXkOSR+bfMAOw4BpjW06j
	nhKz4j5zT3looKHod5AF1VhroI0k07uYSLqYTzpBFbBcNqZDPANCthGqH6gr3eE45
X-Gm-Gg: Acq92OGGleoq8cMdWmXuSWynvG4jtClHMEnS46+SZbUEghesEX+DBQISLZQBkSIBOya
	rWsf2pjJQCMxjo3viFVfIBvM33orm0EigVlSOR6+eAgs0LnFSX9Gqui/GaVuTZ6m4twBtvw4QXD
	Khjk6R+KlrR8MYiwnBukwMWbTRpHgIj1Z9AEcvxFtGoIOj7Feuf1jSEQxyco4Y0kS70VFDICYDJ
	OgEFKTOoOtKfrtQMFygkdiQxHl6MtJnBeocFynjq1CHLZ+mda6ZKiaMqNNNtbL4VabYQ8fZ+5GL
	gJdfvWQI0ICbsTRUJNnbHb5l/Svb/gUR0ngglXxfmJh0N/yAr/BwsFnXCFOUry2N/FIiI6tPha2
	6nYq7hLBKWkJpU3D1gEVSWTc2txe3EJtnkaBIsPFLvZuerW2tSDXoPXmE9x4rwID+HHAeAt7Ey0
	9reoG2sZvQa6zTd4wXdyNK6mkrPGOt+SAivA28M00RIPudxA==
X-Received: by 2002:ac8:7d0c:0:b0:514:5d88:8296 with SMTP id d75a77b69052e-5165a20a2b1mr164230381cf.52.1779042450913;
        Sun, 17 May 2026 11:27:30 -0700 (PDT)
X-Received: by 2002:ac8:7d0c:0:b0:514:5d88:8296 with SMTP id d75a77b69052e-5165a20a2b1mr164230081cf.52.1779042450453;
        Sun, 17 May 2026 11:27:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164ccd7dsm2854539e87.67.2026.05.17.11.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:27:29 -0700 (PDT)
Date: Sun, 17 May 2026 21:27:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konstantin Shabanov <mail@etehtsea.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] firmware: qcom: scm: Allow QSEECOM on Honor
 Magicbook Art 14
Message-ID: <ajh47mdxlgk2dmedqa2a25yk7dgpesjxi43yaw6taukpcikzsp@c4423vzm5v6f>
References: <20260515172926.16597-1-mail@etehtsea.me>
 <20260515172926.16597-5-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515172926.16597-5-mail@etehtsea.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5OCBTYWx0ZWRfX8CXXAG5NU9UP
 mzbysngHvm7YAMRRTpa6wGEVRhuKOlqZJk7C1P30Zj5ZNwk+OibuYCjND1OzmvXu6xNzhCGMiRz
 CggVh87cdpB83ICFFS35QFAi3MTp7E5mcg3Jx38qWE3mq+rE6ASqrtRRvvR12m8sOvk4ap3eclZ
 cdnHZ88yCOkAkmhgiwb4SdbdhNCYPcNAzLJaaTwhiTayal+WXwcXWGpws9cSDwyLVBZSQVDET+H
 EGo7VSYejaZcNy+8/5uMq/7ghexIEVBXR57xOxk009Ww/Yom0DCJ7KN9zIkR8yB+7qlZG50qs5D
 Gdg1waP3FG6IjeUz8zIUe2v0lupsO+U/O9WrkjAJsbap5OhV2xR95dZKk65zJDKO5tn/2y0Asoq
 T12N+8sBlN4rUOO/DMzB6OaVf6PtwY1afOM7ozfDdJ7tPXxiF+yT8JF5rQf6y42wUveovr96MVC
 C+Xzl4whe3oilWc6RnA==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0a0893 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UEEIgp7Q3dRGVmyLxMsA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: IfYpxClcgM-XOabnQgN9yzOFD20GXsLz
X-Proofpoint-ORIG-GUID: IfYpxClcgM-XOabnQgN9yzOFD20GXsLz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170198

On Sat, May 16, 2026 at 12:29:26AM +0700, Konstantin Shabanov wrote:
> Allow particular machine accessing eg. efivars.
> 
> Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
