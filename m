Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40103371CF9
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782687038; cv=none; b=F67GkiwrCHhY8QFqPxoefs2tZNzIbu4zI/ljMmYIKJL+kGdMKv+wjT6o4266rOXm6TyL45lIN/wxemylCOhGtpPa5G9kXBVqPGnwzUJ9gpCjnRtdPyjRIlvhXuBrZjTBGqOXtObd1Ilx8VoYx3rvGIiK6aN6XOpEXd1THYChcFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782687038; c=relaxed/simple;
	bh=Jur/ubW0ogvxkz0KX+X5lU+2n2LljLpFE8n2inLrwdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJzJEqxQSsjUAgkpRbprhGbflySBBct9EkQ7R1wVZBtaM/MrVn9pVa73foxknNpazwWf+UMCP7Z7K9q5W9MqgZ/n+gfsiFBhFXMvlWY0Qjz17E+vOBgQVQOX6CppDjoqaIcGdmuqZMTTlNBOXMSuiPLGE2fMnvMMNE/JVOOn368=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfyvBxRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OgbMYe2E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfyvBxRy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OgbMYe2E"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SM8svi936981
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j+vRFFpc+G0V53boa1pioH5l
	DzLNJAkcW+8BSOZcbSo=; b=AfyvBxRyo223qh0kt1HewpkBVIixQE6iJJrQUJza
	vsmwNGZOG5cYLbBgLndEco7RgaWs0/yUywvC5ebhj6yxuVqK/vIze/f0WziDgmyj
	Uexv0Ml2PkT35spCildFcWgRVwnp8m2PlwPMeJ3X7E7SnVPDduJMqvGJPX4lmy5Y
	8nexKvYyJXWUK22nvWwwt+NJcmHxL0CsdZ2SlWlj/NPro+lH3ogUSH01IWDj9B4i
	PDjSjeFltWdBN8jG2+xCIiNusLf1frOEgM5tLGKsXZoZCb+mMs1byPLLZr3fpyEJ
	fuPmbfafA0PyipaSZ4vDSOfjFoiEI3H6JoGnMP3sQ1FD7A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf3kpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:50:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f946461so73326085a.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 15:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782687035; x=1783291835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j+vRFFpc+G0V53boa1pioH5lDzLNJAkcW+8BSOZcbSo=;
        b=OgbMYe2EoMAUwrwF0tiOUUeiq6bgoHOC0LzO6vktDZ5w3Xjjbe6eLbUAOJ63qNK1ns
         nKzljRnw4b+BRIFpOPT4JuT5SuiWGeEYaCJMH0KrUkklQgcNhnt6O5JJgU9yGb8TEqdG
         23/vS1mzKJv/qdD9s4wKEPzES/l4TXAjPeQMrbrOeyDEBgWGEgqpI+M8NON4MTGKU3Ea
         2NloUVZUIlACnD3ImAxywFQloWnCtGydQmy60isUNXbZQ/wPENvhAGKGBsoNC7JyqnM1
         nneoUzybHKevR8k2gmji59BS0e0PkGK846cFch0fd44gnT+jUj5IWjtKW2+JJWg6GCUe
         bYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687035; x=1783291835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+vRFFpc+G0V53boa1pioH5lDzLNJAkcW+8BSOZcbSo=;
        b=NEaooHoY+jFJeSIn6WCE5mx5Jbn2nrFzipVxFBhOybA57RXqBJvzVSD4EFjKN8Ggmr
         npjYIE07iW3KopFnMu/7APyStujVGBdRaF8jGPD8vsIMMfzr/cL/odbAEhC45X3cSi4f
         SXVCRjoeGO1XTbAReKOzwOqD+ZCt4j5WcP2m44lgRjSrbvf00o5BuF7ned9XsVeN1/Ju
         I9YCODKMC/pDUOksuws5g4yLCjULaCZiM454s2y0bc1ex3MXqEbPCnBezkad4DJc9nuA
         DMezmJQ5jV4pEBvTeOZg6Uu0emjaOG3alVSesVZAg94i+PFlHXrtLfr5ov9kPu6kuV9F
         g0qw==
X-Forwarded-Encrypted: i=1; AFNElJ+JmuQiLIaT7wS4NNGyBZg9JQvsiP/Uw6aeBKidYeJJFaUEIK9YT7TXMNfLDQO0x4vrmDAX9HopsuB0@vger.kernel.org
X-Gm-Message-State: AOJu0YzykYw/BY3pgy9jKufFlydDUxqgqbP8cd/P/hNTdHOiVgV5QRi1
	BqYqMfiSvRECD+e2Yrgt1DHOllpMPP+ByvUqdxHi5t8LCwt9cqdVjoWTgCdw/9+diK1PZPi+Wy1
	SHHYiTEpKJK8s6+0Hks2eU7dZ1pprdp73VUx2VUS0I4u2ECLqQQAaGlIsGvlW9wWZ
X-Gm-Gg: AfdE7cms+4/ZpTvWBaTH/Q4/TeCuA9JgYI03ZtGEJFuI6APIvgoMQB+B9K6BYR88k2l
	H9ecT0GMdnxRcTHJo6Kcsda2Z8tPyaUjhS0/Am9dUf7g+8/h1LjNKN9ggw6gOnaeWVGT90BzWDI
	k1jVOTV/OcN7NMsVp2T526DfTrcn5Hmda9eNh3u5V/ryxZsku3Z1qI8oJVqqPVKbnlX9aW//Zmb
	qtDRrJszCtiyGJOUsgKCX30xjAr1l4jqIhh4LXB19gzdMHhyOsZrcj/v9CxdkzLieGosqCp/JLY
	p2gP2jN9lJDrHThEjSEEAxe9Z5BLZjTBxhCej9Fe1voIMRs90lUyb8GFp+PDol+r1LatZ8fZ2eq
	uj2nCkoRSIaymIEXYtI92IrOcJPq33AgWB7jHElQMBDSFGx9RQjnEA77hjhk4FadxLsEkRK9bsr
	FXyZy2nk4Ua/LdE9BmUnkOMf4A
X-Received: by 2002:a05:620a:4153:b0:90c:be8b:3676 with SMTP id af79cd13be357-92b3ee65133mr1273571885a.56.1782687035218;
        Sun, 28 Jun 2026 15:50:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:90c:be8b:3676 with SMTP id af79cd13be357-92b3ee65133mr1273569285a.56.1782687034719;
        Sun, 28 Jun 2026 15:50:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a8b6sm5337343e87.39.2026.06.28.15.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:50:32 -0700 (PDT)
Date: Mon, 29 Jun 2026 01:50:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>
Subject: Re: [PATCH v3 5/8] arm64: dts: qcom: shikra: Add A704 GPU support
Message-ID: <n3ttyffbsve56cba4x4texugczjkogkv534rjvw643sbqjgcee@iktjvgiqzffy>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-5-9b28a3b167e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-shikra-gpu-v3-5-9b28a3b167e1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDIwNiBTYWx0ZWRfX0BTp4t4FM/g6
 kkGRTtzIDDICidUvTgcnPVRmMnH3DjUIgSD5CRbhT36ycyIGIOlMANzuG3tP3o4rLOZ4XUWXUs4
 nr0rX1ZPyc+dXIjThxJGakC2zAnJZEI=
X-Proofpoint-GUID: GSWQvBg3FEUEVbDFw1zA2NQ6hvLLKkgV
X-Proofpoint-ORIG-GUID: GSWQvBg3FEUEVbDFw1zA2NQ6hvLLKkgV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDIwNiBTYWx0ZWRfXw8BQu2Qs8SY5
 6wtOlu4K4rVBPyzbTGCjnHBNpUlhD+GbOu16gKI+XbMqcJ8/acGqHem4f4PpdM/M8KDH5f3MPNM
 ZAHvTGvcwDbpYiGQw9ABGsD9CAISrUfubpY2wc/zCV3ftIdbfsViILgQ1oBqX0oH9ewXVQS7EPC
 C+yBN9rtPbPbejgFlIgb+W7uyLN81djqhWQ7/hhzYgwqEyAVv35InNDGVb3NzBo5nVazN25G2b8
 UyEotkJcH1EK9gam1x/WXawUV7khqWIxnDyo8zi2dThPUxprPugACu/GzLfBy9oBytMJjN0jCY6
 60HH/hwceXnvYmhZalkkz5dk1NMkfGhJXMZJTpZpa//p9a+CZR+JtnlkpGwzNKU0Rc8dU8tppEr
 lsU5EfkF3MoGsHmzFhPpVCMyXfGhll9TXi/d+P7jnwgtsUS+bESS+oe7W9Gyg8JScKDOPu0UY/6
 PZM9SM+qCoOKBiJFliQ==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a41a53c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280206

On Sun, Jun 28, 2026 at 11:53:58PM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Add the A704 GPU and GMU wrapper nodes with register maps, clocks,
> interconnects, IOMMU, OPP table and the zap-shader region.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 98 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
