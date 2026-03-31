Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D9E3C9EDF
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774955803; cv=none; b=b9U59cHqHp1+TPj0z9s0QtrGVhf0eb9shbpWabXCjNnzjxv17bjtGttSXyuPx88V8CfFke8H8rYiH76ZjvZtCzbsM2/q1xj5iDpNc7tC08FewrBxOmYz6DaHaqeHtuX9YX9CCSorXFVJLCaui8/gQ/6pXRlOatt4Jh+rnqxrXGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774955803; c=relaxed/simple;
	bh=iT/Ia1aYo+U8Tv4pRevo8HCju7ee26D0HiSTbvl7/gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrqCTecpVLjG3MWkincRhTTobywQBsPcADuQDBO60wAymujXGJnqoWsp2YvA6z+tv6K4HcasUaEv5seGlcHvdF1wWtRJ5KQCPpiCV2Q6GB+fKdpVN3XldmUFW0zyQlvMo8teQf+ol7nfkzzZvvi7mGykdU/2FJM3Uidk5Y8CCnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMYBo6Cc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiixO7Fj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMYBo6Cc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PiixO7Fj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6xvEL2164274
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0dlTRBAoNWK7Ojv4RhajNx9W
	Ei2mlwlpkgjLYygi7GA=; b=YMYBo6CcqqbJVtf00O3PQ8d59l0KjtnuMCBWxBgZ
	VgnklkMwWMCgv/YV+M6dSycKznTJYUGAk9imeXkKN18+vXFgrGs3hNRkEu7j1g/A
	vN2wusxuE1N1wwDCjvht2HNZ8ygoaGmqV/9UHeFWVJa8/jxg9LYkR+JVBJbns/QI
	aOgF6WiwbSjXfmWa3YlAjthAGFMoG9ydJtW7fEL8IG1ELozi3a679ebGzDKQdxNC
	E6yhfv0JVey+adx1ZU0vewdAqIDZ0EBV33T623M7b5NLrUgBL4e9A6I8lMwhqrxy
	62iUjV0m4rXEUqPxGiulN9jT6YKZt1wOZIBlOxXashTALQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ga1319-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 11:16:40 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-127876be621so3487190c88.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 04:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774955800; x=1775560600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0dlTRBAoNWK7Ojv4RhajNx9WEi2mlwlpkgjLYygi7GA=;
        b=PiixO7FjQRQSy0qZHMnVpj8KEDROKYs37CgwkEut6DGBM6RWAijCRNL+dsTVCdLHBC
         ZFJsInye+Gv/Zl4cxsk3EnNBhtXoLGv4dxgNRshDzGfR7cpZOs8c7XOrWitIA4N5jz0v
         d2KieyXJeIBveCeLE8ZyiF3CJAluP29aj0zdBg/R7QCMZrSWdhtRTGT3bLsw2fxSdJPA
         jCj6ai9EWD5fCubn0IHZDx2hCaiaK4MS3xsFP05iwwZz8RUJ+ObuHdmEn4ocRFK5q4ML
         nS8MpCQPZN8GU/tSvT3E7mwHkgYQOa7IHsXoiTigj7OELcWFVkXzHc/nXFnAe6g5WSXd
         S9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774955800; x=1775560600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dlTRBAoNWK7Ojv4RhajNx9WEi2mlwlpkgjLYygi7GA=;
        b=Zcaa/yAe0chm/a30+dN0rWdM1D9eV6QVOZScatQ1iFELWihS/ZJGhq2DfIWGCGLQZf
         3gCPxkNSDw9SDeG5ZfUL+MlOfh6Lm8hzK88xL70zmUu7PJOYZvd5bi2T3TN3Js/m3N23
         OlWb54kUSGWpRksqVp9HWAYNe09urizdgz7cV1LzluPaSJ/7QErdC2hYIuuKL6g6jFIs
         VOUTVozqH/UrwDXSayMPkR/OFMewwOneKi030hcGTcXhsssd/ca6Yd6FAV8vYAdNUcr8
         vknyQxk2vIbn+JflzKZZPjnhd6Nh1wgoem9Emelux7uBigvfngzF9IzEqtaacxzYdJh4
         NCnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqOn8u5DdG0YTcj9/TexUL9GpwpUwR8nWcXIMaZ9s83VlgTHF7oRUr42iRpyN+u0bFreRDrnZWjwvn@vger.kernel.org
X-Gm-Message-State: AOJu0YyRf/RHdUS9llZWKCeKgFOuhh09cOMmKSugxC+4RmScGq/6YgsH
	hfFRKT3yOh5ybxIsSzdEGvP/AnmhwSw6Sz81IgyXO2lVGrHm9+sAJ/KyBM+JWmleVJdRpP5pqEX
	20xE1CmwF16f+V6xwZC4l8xRzwkC6hEhKPhH9AMJl3X2+rOxU44IvxK9t1WxSGxiT
X-Gm-Gg: ATEYQzx6CtK+NTVbNJX9HejfRaxfWaNYHRnM+NOSzVta/OhJemC2NSDRlfbC+kn6GlN
	Fb8nAKWTBFTEOBgWNNxYnO19NQjIXJrburUi5TdmXovhD2CrYaLeJjKe64exRZ+HLJuB+y2bo0n
	VK4BJrxP1qAzWEBJxLb7u/t6mK49N22UtjkHRjsglCE7odT9MBDRFCS9WnR3I+Tt/5ugvPTzyZi
	Hio6jNkDgfZboUIBdPIGUIrwpbsEjZXWw7WqQV/fioBkg05WL+H+ZYD3bZoTEbV9yc4Mr4LQWbg
	BisQqfHiBEpmz9fsIuICNmxgKAUueJLfKw8iGyXunaTQpDtrzLCSxe3wkqG8nEitP6qQkaHiLD7
	PiUSVJ4OHrl4BTHj4kaUNbgwOzL5T+a+DaNiTB2ibbtEf1gX5DyFW2IrNrANIWh1M
X-Received: by 2002:a05:7022:1284:b0:123:3c24:b15 with SMTP id a92af1059eb24-12bddf0c8aemr1398798c88.19.1774955800139;
        Tue, 31 Mar 2026 04:16:40 -0700 (PDT)
X-Received: by 2002:a05:7022:1284:b0:123:3c24:b15 with SMTP id a92af1059eb24-12bddf0c8aemr1398776c88.19.1774955799527;
        Tue, 31 Mar 2026 04:16:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97cad88sm10692781c88.1.2026.03.31.04.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:16:39 -0700 (PDT)
Date: Tue, 31 Mar 2026 19:16:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom: Drop types for
 firmware-name
Message-ID: <acutEQ0064cLMa6B@QCOM-aGQu4IUr3Y>
References: <20260309123357.1911586-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309123357.1911586-1-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KJpXzVFo c=1 sm=1 tr=0 ts=69cbad18 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NAI6pjMkAQNTJgJUrYgA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: etaZlKKmL775cIytNErGuttT60jKcjpl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwOCBTYWx0ZWRfX0OGs/6aX97+K
 whP0/hsZ5iTXc0cP6TLAhuCv1ekJCjFzS9jSaBBfVwavKuioveeVjrgWlmoPfd0zP3i3YxjCyAV
 pu4+TEmfOslzzFmpEEmVtqyODr6n2gBPyUZoNyYsMCTgIy/+YtVCQHYhdGzLsOQLaeIfwahYKJJ
 LMIoeu5KnZvlKbqSRAw26sI5qVOMXzR/7OmVSz/iUzZEPIcEK+SQQty7QOxqP3kcf06/eqJa5QG
 Zjx5393vzz+eKgjKNB31RzkDtCXcZAvueT/cSMu5/8rhJmid3s0+jANKgTCTWgz/UJYztBbWZBz
 nTxymfFO8r8citjdsGdyXRvcv+1Wuh8HuZeJqxIgOPyngkInTxy0nU0zBplCgcagSuBSCEuCBJu
 fpN1nFbsmRI5Ejh8H/xF+Us5NWhQ50GchZzMMwa8gYoXonQTWH4z0mJDGcrFzH+ZymC2mmEhMDS
 Vtfbo7x8h5RF17WR+Bg==
X-Proofpoint-ORIG-GUID: etaZlKKmL775cIytNErGuttT60jKcjpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310108

On Mon, Mar 09, 2026 at 08:33:57PM +0800, Shawn Guo wrote:
> The type of firmware-name is already defined by core schemas.  Drop it
> from individual bindings that have either a redundant definition or
> an override as string type.  For the later cases, constrain the number
> of expected firmware names to 1.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes in v2:
> - Add constraint of maxItems 1 for string type removal (Thanks to Krzysztof!)
> - Link to v1: https://lore.kernel.org/all/20260306140306.1328719-1-shengchao.guo@oss.qualcomm.com/

Hi Bjorn,

Did you get a chance to look at it, or is there anything I should do
on my end?

Shawn
