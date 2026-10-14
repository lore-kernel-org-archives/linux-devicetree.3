Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070AF54280D
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987464; cv=none; b=QAxdEcSxnL6yYfBtEFg2Z8/7dEwDPf/rg2xTF5TzvhtrUHFFdhCiphGxhzTByXIreEgetj5uE8yeUyEOObjfbkmG9dyNPKWyi/TFGQ8IywnRiiNViwVeUaQiGtGfkAlY2R2847wBCP7qYdxnU+8vKeeN5wyRgagLfTiDCApMMX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987464; c=relaxed/simple;
	bh=mduGJu+RGnhlm5vJbzOcVpHGjFHq8q+1YTzaexNaa8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzuRCfmyoZpWeTlBodL1LAw3tM0fXZcdFfl89glKqxqfzp6saDHPkhuuyNdqo9h/VDvG/EeBFpNoJeIIA1oQm8wVnbfc1g2EVIOpMVT1M6hmujjyhzBnRa68xNlS53ZJoyG+9xpGlOflW0IQWyYwOwNzOve1Q5FjfWuhJrKSs6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5jHKLiP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJUE0AS8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5jHKLiP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dJUE0AS8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EDPiZ83017736
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mhxN6zCpb47Rc0mlziPtloK7
	GA4TQmP2+HsXBPO93LE=; b=L5jHKLiPUzWtbvAi2aJJCGwrcdUuohdkcu+eStQs
	qpBPUShHeeu+X0HDAMG7Q0pFPpZTcXZaGTr79Cx6KDs8Y30f3EYabmFMnbsg/hYx
	B7fWSkHsnbr4MMaHcKcBS6Eo7u31nfaeJXMsxyHId3rXGdOzOMUJLKZmAGes0pOR
	v3lMtazPN+mb0ubowLNa8p/j1Ym+hty+9abCFc8Ocw/nwO0XprkaZE/yyCySDTGO
	g7l9ecdxgfxLoUVnO+P6wJvey9lcpi0DnFrgUxxoU+GoBjpFS3yP/xdU2k2QLNkE
	bLhM9ZQGPRnydWjcZGm4IsXqPMjZRrTnJ/aIIMxySgnOkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b4qfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:17:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so208781785a.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987461; x=1792592261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mhxN6zCpb47Rc0mlziPtloK7GA4TQmP2+HsXBPO93LE=;
        b=dJUE0AS8bAWLw52phsOLAyCp0jJI6SWHGwsZa5dpWXShY3yRsiNTtVPIM8XRaeObUu
         F6Yvcd1szF7H4pWZkkpuGv1cL5eD6qApCZNs3ydbQ2ijC9fTziJzXTbry5tewDbM2PhW
         kMD/xg2/5ZrA3b4lKHGqNNZ0kTRcH/L3oWTt0L6LVpFlpZT8xHKfNWlH870tBMuEUbtW
         BiLABm2iVlcTRMtXROmh7P3Sulxt3GQf5ci/bdaspuRcm8C0IKqtFwQHYkA7EIiGnTep
         eMVjRCW6ZtUg3dKWjzU/xi6dtEsmxOAhxPXV4vNQQidyo1uKQ5UD7kBFCRdWMW+icAH3
         pXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987461; x=1792592261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhxN6zCpb47Rc0mlziPtloK7GA4TQmP2+HsXBPO93LE=;
        b=1Lx5P+4CU9Bwj4bciTiPgEXEwyE3BWKWgI9qSAIaDPFmuXuUpNcXJ8tqTItMG8vCz0
         4nrpuXPoRqWN1ReTEd+quEhyJI7v4+dz/+/mW2+y9Bs+y3xHTMuufQmmKOZ0b4k8kFvb
         rVltf0by7JhBREXM0bGawrIKpy5fgwecLspN92AMre47AacyIB2JZf2IN9gwSgYBp40z
         gShpeMQ1aS5GL+FPiQ9iCoh8xEV3EdCgPIQ+eHOk6jGJoihxxe4aGyu2a9xpwbMJEkgO
         mMLNGFHH5hq5+GzaGpWTKLwJpNsmCGWRnXwuiR61H0gkynW0Mljdp0o5a3YgDe2BxXxz
         ImNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzs9HsYnK4i91yGnk9K7EAp4djMxv7FNRl+yvkrB5XDZhOPaPFBSZT1Cxt8DpJBp6KbinZjrwq+GdbQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIDeb/zDsJukLI/AAtOjPl4mfasW/sQMNdH33NreJN1XwQ+KCfg
	4JJFttavwHGETZk8RI4pU+gVEYgChgDJmgdTC9C5jjQR/KDDtIyTfPCegyC/KG0DYdyDiLmCQeW
	1YhOn7pB6Psaz8g4jHIFPyz16+QO7hx9DGDBFB5vQlyTL7zJD48FnN0W/Hp2i6Zs/
X-Gm-Gg: AYBFou0JWhaDd27/s7r3UOvMTYlujsF9pG+BFMzPInRTm/ulPciRLzIzg406zaQS5G6
	tbQUiia5w7aSEQbHNN/mOhNyjtrqtAjd/mAKCfaFKs8ixl8q0N5gC1esKoSru2zeWp1Fl9C9Psl
	5whh2JCIFyRTg2yAhia9EAYSpusc2lrusKcnohH9CLdiT68+OLaH4Yt1mXVybyoL95MvRfJIwbi
	AUPpdmkgk2bUriIOc+n2tifRUV47patLnstl9D9K2Sm7Dt0QYoEbyZRVYdtk63JhmXxb+31jn/I
	VUiG3NpUz12jdMIhJCBfLg5vA5KIg4p9TDeJBSx+0RfzVMFb+6LrCNUzF/XLXRYuooDLIpBfM1x
	bjQNnoZtcAg9y6/0YwJc+KVyPvBl1Y6syad2lCGipYck8pGmuGJBFzw4Sm9jgr69hN1cxC2UcQ6
	28iGA+WjLJTZWR
X-Received: by 2002:a05:620a:1d09:b0:93c:891b:90f1 with SMTP id af79cd13be357-93eb96619c3mr2384209785a.26.1791987461022;
        Wed, 14 Oct 2026 07:17:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93c:891b:90f1 with SMTP id af79cd13be357-93eb96619c3mr2384204985a.26.1791987460504;
        Wed, 14 Oct 2026 07:17:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d90ce5sm688706e87.59.2026.10.14.07.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:17:39 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:17:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 11/16] clk: qcom: gdsc: Make GDSC parenting optional
Message-ID: <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf8f06 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gF80273UUj5qe3Hr1MkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Day6ntrtRK73dKl8lch4HP2o5t7hJHXJ
X-Proofpoint-ORIG-GUID: Day6ntrtRK73dKl8lch4HP2o5t7hJHXJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX47sWv3ms9NrV
 PIL4TU0oOXCb36Uqxt7DiodSK+AZfFXyrAVL7f8U+XIJWfILUy6cFJhmzd23XphBUDXxFFFS8nL
 u8EftJkSpktxcYyQhrL0H8/jn1YcYPJIoRX4vIqG0zKgkcqNrcebexIrblboE6ohpE187IjE346
 St0J4ivjNZkRe4LiQFLLqyw8MQRbxrQyi7RTnmM4NsYoBzG9kBlWSh61eOZfMnhkvP15Y3rZp2M
 pggEYjhA6ib7eDeM1JoUJ3UsPEfx3BEe9sGvxrE8c98snuCesGP+kMZYErtbeEfymKZfZ2Wdth/
 9xKGSwaVbBhSTyY33aXRl3TvWMWPxp0OY032VYkZSslQxkAoSts5l2Ofhsr9Hd75FSGuCmGl0jx
 ptkeKo0uGMsQxmbHNYw6HCIgO/9T6wIDBUtV/SyJNn7fx850Lh73673Et4pTpiWNfy1xaAP6CR2
 i7xBCZfKAWY3Yx5Dr4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX3psyyzpiOmiQ
 lsodcsw3dWcco8NJspfrpzMdrBQpAz9BJnSJR9ICGvRnJ+pV4sZ0tGRiy+DIPIcc9KtI6RPZPYn
 +ZCKfL7Wsc5DdJfbJWpe1DxRUC91ma8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140056

On Wed, Oct 14, 2026 at 02:19:11PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Clock controller power-domain attachments currently become parents of all
> top-level GDSCs exported by that controller. This conflates resources
> needed to access or operate the controller with actual power-collapse
> hierarchy.
> 
> Allow callers of gdsc_register() to suppress parents inferred from the
> controller device and its attached domain list.

I think, each GDSC has a parent (in the hardware). If we don't represent
it in practice, we likely need to fix that.

> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gdsc.c | 13 +++++++++----
>  drivers/clk/qcom/gdsc.h |  1 +
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry
