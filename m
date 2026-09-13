Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51D438B125
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 22:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339885; cv=none; b=AvQvOVwTEykTnJdPD39OG8Bkll72yOPpo+YLKFRcpkMZTYrp8r6IWj9mB1+ZBFCgRjh0KAd/PH6LzoYtKRrrTo0VCAtHzL7xbrlPFySpIUaHYV7Yi0nfDtInmyWxVyR/oD9R6aFd1M7PfokrwFavGKJq5Xf+OjR9tPxqGFXeJwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339885; c=relaxed/simple;
	bh=xPoaboMMdHnZFam4HfRn3NpLX7dSPbRXi6l5ULEulr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iz2GfInI9dHNjyo3Wcg4yYTioYs6K7FRsuTi9h7ADxLpHdJ4lG0uUbQUbWl4Udge7WsfekgMCrJbjrqWP5Ipyo7OkNeyb5jAeEHu6vNR09Rhd3LxT4+77ST4yL5TrzQn8EzG401rPS44x5YJ/LK1dKyiaQ4Zbw7LMamN69BVEos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSN3ULp/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1Sc1wSn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSN3ULp/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1Sc1wSn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxMWp1926167
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 22:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btDF+i2KLcySKsRDG04ke9EX
	GqLGBKkYRlkEl3KSsbc=; b=cSN3ULp/jmbD+RpqhvAi7G4b8xI5NHqzdYnUZhQk
	pqRdi8OFg4yp6abdziJVVvNQxLPekTUoi2qzD+Hf6CUBJY52mICx0i+Ild//Ou35
	cv3WwDThVV+NN299SEV0hpMYpHSNwQ+6XYCpWNzK4diPVU90zzLYiejU8LUXjatK
	ocOuYsNom8HvdaXAbadzhrtybdJLnz2OcOF3OP2UVbplsG85bTwkdndc1wOrUOsi
	22pcbkOiL3fe+wZJUqic9K/G/UBZx7yiNiVjQhvqDoPqLjxph6Z24wMWk4g2d559
	0vUESeSvhT7fybc3nCMhBJN4uPKQrfSJ3Ye7FY765JOdIg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018m5c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 22:51:23 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78a686d205cso2256007137.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 15:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789339882; x=1789944682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btDF+i2KLcySKsRDG04ke9EXGqLGBKkYRlkEl3KSsbc=;
        b=P1Sc1wSnPDl35ZSV1Lue9vuK8UguS/EA/s7MQl5tDnjJz8vDAdNjfuVFtuBcLymMeq
         +Nu1hafQukMJ27ENnkRJzWQVQc1q5oJPcAhzIDoNIHTq/trgiDtgGn+a2wqcENYq4ZVz
         W2YnlKfmrtsjYWnUTru8Oz0aiV964K4drlZ3mRd1aFCqmiLGbCr6sgbRtz/7PevOW70F
         Nxutw5bjf4L7Z0nN32laPVLHHeB3bBMqfGZGuLmA2HWCjPlWRKun3P+e3hLVGm2uIzkI
         uGCRnTRr0Fr0FDKwlvn93dNHy/YkDOv6Oslfx45aCMoEx5QJJK6yTTzQdNR7jgf2wLDE
         BUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339882; x=1789944682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btDF+i2KLcySKsRDG04ke9EXGqLGBKkYRlkEl3KSsbc=;
        b=H7k7akNJ3+zz1AYNNOluMXYMaLA+FGzyRDnBTR/p8LHPHEd/JgWfszpYL1Vi43X5zF
         X+F/AQ/a4h6aKrXS3xtuvSVo5LnRyStqDXYL01yTmP0PEDZFLg4HVOe77VUM/fiEFqQn
         81YdPjh8w2VFTHVnjryXZM64ho6aQE9gLbC69Ybwi8xyoPQRPsS7I1kgbJhAydIUnEd9
         3i8nOcEd7J04fSnNr5g4ATlB9kZ9upfljQ5/3nK5P52cHqMmTCPLzMGvW92QIO+mJdKf
         I4h+DUXO2WLJpQbGJJ+BVbONBu2ZXr3KYTIJswS/i5jTdPjIygIgS9226wrOL4tsz3MP
         sn2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuo6HEneqW56BOfE3GaGzslAhntQL546SLQ4CjeYzR4s/SkEhnL5FKHP36xXkGSs3Q4wCUB5ddiF1E@vger.kernel.org
X-Gm-Message-State: AFuF++nLbRIWr934z4HjYqtsiLfQAEoGnEn+22KW1AtDW4x6RHIYgykH
	FDVvk7aWDVqsxqcbLqkkffpoYw/WcuNtPHTbqYmEf0eVQR43OKSuITL/vqyTpTW9dysqEMa0vHv
	HyiEQgyCfsuXSJeHzdQqcA15pW3vIzGim4XvSVUnzAMx8790WQMcXp3korp3beWSm
X-Gm-Gg: AYBFou3YHIJdZaV/ilJTaFyxoX/i0ICRbGKfElkMOTkWajQo0PoE7BL6blfLxNdb9NN
	xKM7m8N/XdgYcEFUPjvM17VO4lHmUh7iRj3614R85qgySVAGKIGWUO6mMA4nVfxDWRZSZKSR0R5
	hV183SCHEo0oLQHfdxHSs0/VIBkTdgy7Z78M0jCWVe3cGL5UvKZ/g3PLW++4zAxZTtxWif/MSMi
	lnoiIYsRVdQEVKQRe0HZPZTBNgzh5Tj0+ahDjuU45nIKXsFmejUaJnG5F51FkffoQT/vf3vHf/k
	cD3kavgFnWuRBnNHmizXFo6kl/mqW55kEWDNFcPYWhVtbqBodgcf5UBBE8RveApO/ONbAG3XeCb
	rtGC5woLFZ9Heo4rclQMFtMk+ADaQFItx0Kv+Wqp2YQ1J+smQ6xYTfk4eYVSj4zL6NKh9EJzejv
	TP6j2x5U2qDGYs
X-Received: by 2002:a67:e08a:0:b0:792:94bd:9be7 with SMTP id ada2fe7eead31-792a675d7e0mr11888878137.2.1789339882106;
        Sun, 13 Sep 2026 15:51:22 -0700 (PDT)
X-Received: by 2002:a67:e08a:0:b0:792:94bd:9be7 with SMTP id ada2fe7eead31-792a675d7e0mr11888827137.2.1789339881698;
        Sun, 13 Sep 2026 15:51:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047d1d1sm2086254e87.80.2026.09.13.15.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:51:19 -0700 (PDT)
Date: Mon, 14 Sep 2026 01:51:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/2] dt-bindings: display/msm: Use consistent indentation
 in the example
Message-ID: <acryik4zjxxt76ldqk46a3wymgettocilimua4tlm7wl3tvfo7@yrh36odg6fju>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260913123331.100293-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913123331.100293-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa728eb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6MNK4Np0iOagQr2kdRsA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMyNyBTYWx0ZWRfX/0lhcwtvr4Ya
 9YkoECBkKCgXQzT99dzvh1KyWZpTKcRiirpck917MjGVAbsImAIqjuqW7shuAM0S2A6Gggvj4Dq
 GTJsi5AAMttAKyXy8yT3EQNDT+Q4CwU=
X-Proofpoint-GUID: 1upg_Ob2nXRVEwWxI02_eK08VKPKdDlL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMyNyBTYWx0ZWRfX4NhvOuC65keY
 WnjnnrOjT45vd3w4oX4Sy+q4q0Wjbr0BODwOkq3PwqGLlP4BdrmxK5ie+QYhEcBEeYfedT+Um/x
 zCzom1yqExx7+YFEfLQpdqEbgITcIIDCF4BvrV30DYPkr/NWnOibCnevUuSkzxfctLXp2OZOHhe
 nK7gU0YsSLJ6X0jxOQ/qi7nphaSlQlMvgJLtWjsjaFq7ql0TJiNq9lEYMxFbaI03gTu0NUGrNAi
 RasiBJbK8ZUSyrClQuzpCgxrjyzKUbV7lI/Yy/ZA8qPhP3rumhbcO5o9beaaVgj9hbwrj/N2X4U
 d3ql3cpP2BAoaHHjaWMaEVtXlpHx3Kr2hrSzAQTDTVqYv+ew5MAArjYDfpGoqs8znOjUKGrh+Pk
 n7nudFpIqvmwKSTw6u5tvIqe/1fydu7BvMFUPPyphwBDDrc5BQqXd4EpF0JcKh5lzqyHVXzc4Uz
 QClodAiQhzRzrSQvUJw==
X-Proofpoint-ORIG-GUID: 1upg_Ob2nXRVEwWxI02_eK08VKPKdDlL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130327

On Sun, Sep 13, 2026 at 02:33:33PM +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../display/msm/qcom,qcs8300-mdss.yaml        |  6 +-
>  .../display/msm/qcom,sar2130p-mdss.yaml       |  4 +-
>  .../bindings/display/msm/qcom,sm6150-dpu.yaml | 14 ++---
>  .../display/msm/qcom,sm8350-mdss.yaml         |  2 +-
>  .../display/msm/qcom,x1e80100-mdss.yaml       | 60 +++++++++----------
>  5 files changed, 43 insertions(+), 43 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
