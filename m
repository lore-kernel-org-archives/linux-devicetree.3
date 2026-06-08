Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2472772D
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 03:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780889109; cv=none; b=Gw0dfNu4cJp+qZKGAehmVz3nXWVdqWGHVDk2Ti8aatLKpIZV6JP8R0YKAwZ3kjUmSAHgC7IvOGkFqLnd7QubOJm1w0VdJHbqz3igg1N+rArX/aaRHA9CRM7cE5rU9UlQaZFrOmVOxWaokcS92JSWUINsLVWvT1f7LvrFflaXGiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780889109; c=relaxed/simple;
	bh=cIP8qGyldrzLbyY26AN8T0kjp4+Kch7+F/Z/IvDPgec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4dJIdB4OE9vw4U+IpNN8nOmCG6FH5H8zn2IuKDd6eZlhDEMQ336kGVvFsPqxDpxCGgKBZifNo6F99m9SGLiSPzVSE+HPozGAhr7xhjpDClFyoMyAKopUJ/ItoIFYvFOq10pk7empCNDaoRr0ZA0H16vskt9oXWsxdWckxp7Br4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mON+fA88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UxPvFmhE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mON+fA88";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UxPvFmhE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GB0b2005601
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 03:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S1Gtj67mxN2Td3MIMGJweGLI
	UloxP09bVvVNW3Kq2TY=; b=mON+fA88bwSrkByqbj95Gimpq3a7v08MrKyoXHpN
	P3ZJyHld1BTUnxGwndVx+jMq6BfeQMlBq+J/MlxfgN7dpAwwmJzV/xGQl0+Lb1Gl
	dklXBNlqMC+fXYOOFU/+QHQNhgKsC3xaUbJSJP8UwScx0pOkuw9LKcNH991HxTyI
	k1xoFCl6DtJVk1/jPHaxPpa6NGyal8FUkTvwTeqdYTFN6BzDtwiljJVR8Id+aQVx
	RSre5egCcv6OIRjJc3etw4XqSD25AxBjm2M0aswrGoOARUOeZLxbnM/6RcaY4W3d
	APbGad6ypzMPnYOQBsj7eWwv1DvIEImBRmwnpkkZWymfOQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w5p9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:25:05 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963d7c11611so1574522241.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 20:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780889105; x=1781493905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S1Gtj67mxN2Td3MIMGJweGLIUloxP09bVvVNW3Kq2TY=;
        b=UxPvFmhEWaLrLY/HAO5TMvjdd/Wk8ajdwfBm0077IUH+RI2PYiWey2cQnGvlp3BTm/
         wix7rqcETDuszMLu6R8gxZE1mSbM0PldaVj+T0Fxp6L9X2RclKtAn/+AgKxcNBtJ0yBM
         kEjH1DdZvULziNh2eiMzg3bJgd88DT58pP7SHJIeCd+CF6aIGP4zBxoJjGqeN9gOFQE4
         KBz1tGlLGZkAjWSASljK0vIvaQQuXJ2rplUypOehhyNGaxtT7uTp1UfLg5CY2W48q7QQ
         jq9CQa1Ze5zGUgnFjOAQXoPjcqHJ96G+mtBE6wSLyijpai0yn6G0T+Ye5QLqZNpKQsZb
         HgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780889105; x=1781493905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1Gtj67mxN2Td3MIMGJweGLIUloxP09bVvVNW3Kq2TY=;
        b=brSEUg9DnUOhOvYUM8VdRF1kH/eXbLh82/wBkGbBdedHFevC7lo29NmoY8b9AT07EH
         /vAP2F5Ut4Sg/TwuyoS2hllJBEugKn7E1BwVKRhMVLueOISPhpSVNMKfiAqYDmDu5ATX
         V+U7YeGRGzXJiH4+rCEgMOKIp1gyi0a38f7nHej3NPS/z11VB2lEXXrVm8o7r9QONuUM
         /JW86Urs9R4Rd2yi5IvIyxHJ3gOs+omBWv6K7+jCdYO0YoeKsDxV16E2FcwUAYYMmpIm
         rQ8tdlj1icMvfOrnB//sTaJH/1XawRABlQxpjPeRk8SY58jVjmFidS4EPa7olu3PsvXu
         Hyyg==
X-Forwarded-Encrypted: i=1; AFNElJ8SeH+YEoU5mTJodckslX9qesPkECt1vEJ8/vupLN99RGxhlxigRHkuXi5UKzZ/HTnQhHSPku8Kf7Xs@vger.kernel.org
X-Gm-Message-State: AOJu0YwaVF/IMIL1arS9xucp1Gbvixu9QUAE89dtRb/2N1c6wS2KV7f3
	mXIbwXo3YElJtcPlg4wYyqe2SYGMZdPWz1ivR1Duk+MooTH52IBnPkq1CYpl/om52pRY7QLz1aP
	KwPmZ4axmA+bgJ35cwDIyN8nMwQsfRQI/bj2BrrugIjEgqoMZjMuhRHsZkj2pDub2
X-Gm-Gg: Acq92OEvJYyvA6/ugOa+SbQNFsx66MPCM/HGbsesTTdS60AtHB52lvm/zvdPYV8jbCb
	ODjFGbAS7CUrM2LPtTdOXot/SkuPkL9lc0DWzkcSd0JYBg8qtXOQW7v6XZFjDedagSQ2u7UCz/w
	5SXQ7n6F6Ne3T4DaMaBXPbAdW0bYxkRNeQPdE8N7oBCotZoyhkoDhijS8OzeSbE2T1p3YQDdUPW
	O8Hqq3vVyCL1Np0Nxm+SRLb0nW92okLQzLlNzkV4jxnXUM6cSzqdDgTEL8QPb1+W9dc2irBvzye
	PiRjH07NOqGtJgyJBDanTuKjrkhxdO1/XzSAzN4IXbeY/Qsxn1fRirsrL9yqmhTUzoRbgygoQe+
	T+GPVNB4bEEJLsU2v1+5tsUrz02Zb5IrHrmkIHRT7GuUKfgD//ZixMYDNfaBiWgy7vQWAZlt59g
	kYCdxUvc2tXAL17va9hGrbTWU3DWPjJza3rSWFsqKsG2Tctg==
X-Received: by 2002:a05:6102:5cc7:b0:631:ea6b:23dc with SMTP id ada2fe7eead31-6ff0294a36dmr6193975137.2.1780889105035;
        Sun, 07 Jun 2026 20:25:05 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc7:b0:631:ea6b:23dc with SMTP id ada2fe7eead31-6ff0294a36dmr6193969137.2.1780889104627;
        Sun, 07 Jun 2026 20:25:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b04esm3574585e87.40.2026.06.07.20.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:25:02 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:24:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: andersson@kernel.org, broonie@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, drake@endlessm.com,
        katsuhiro@katsuster.net, konradybcio@kernel.org, krzk+dt@kernel.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        matteomartelli3@gmail.com, mohammad.rafi.shaik@oss.qualcomm.com,
        perex@perex.cz, robh@kernel.org, rosh@debian.org, srini@kernel.org,
        tiwai@suse.com, zhoubinbin@loongson.cn
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: qcom,sm8250: Add QCS6490 RubikPi3
 sound card
Message-ID: <kdebpjrt3japoyilb5hx6o4k6ne4yqovaiso4i2jslbdviu567@7mffm3yjadba>
References: <6svyrusik3lljjvoo7c27b6agr6ipivjxzeyyo6z5va2qaiatg@g4l3vcrns6hj>
 <20260608023555.3379028-1-hongyang.zhao@thundersoft.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608023555.3379028-1-hongyang.zhao@thundersoft.com>
X-Proofpoint-ORIG-GUID: LLsK8aUJtdjtONtkZevthbgNle7nmfb3
X-Proofpoint-GUID: LLsK8aUJtdjtONtkZevthbgNle7nmfb3
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a263611 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=Wdb1h0LgAAAA:8
 a=EAk7pkoZnyjZY0a2vHsA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyOCBTYWx0ZWRfX2n9/nJbapecu
 hK9sHcNj93j7v7HT9IDmNWSOFKAC50IhQR+THqJYeZFZ1wCqdBD8ikLOl8rTDEiWbpe+PquCS9P
 WvF0skCMnDZs9MQXo2gF/heh9uY6MNdTJDApfds3Eg7T6cbRZ+W30CElrsX/eVGjoivGGQ+BhGp
 aQgqcpj53Pe0eDUlbZBQ1303SaMSVal87SsaxFt0LHOTX8RVY0+jrVN5pZhSKPqxs+jOGDE07vm
 UnH7SPc4xmqFwnV0d4EfA8zk2i6Ifu3TpNItP4vk03mt1SzvO84bjMoDmnKkmpuprtX2yUnge9r
 Fu2aBbUnXXdc8vadO1p9Ij+Kj2lhm6jnwij/GnjyeylBrXERE+Uc9I+m9r59wtd9t5W0VUBqfFF
 uei78DuwlSIhwGNHZeuAad10o5Qm4feEaPg1D8MDZb9+5BVMuAkVbcISbdg2vwhu95G+0r2oY/p
 0NyE99+WzrzM0Y1B9XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080028

On Mon, Jun 08, 2026 at 10:35:54AM +0800, Hongyang Zhao wrote:
> > On Sun, Jun 07, 2026 at 02:58:18AM +0800, Hongyang Zhao wrote:
> > > Add the thundercomm,qcs6490-rubikpi3-sndcard compatible for the QCS6490
> > > Thundercomm RubikPi3 sound card.
> > > 
> > > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > > ---
> > >  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > > index 15f38622b98b..d95e072fab25 100644
> > > --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > > @@ -48,6 +48,7 @@ properties:
> > >            - qcom,sm8250-sndcard
> > >            - qcom,sm8450-sndcard
> > >            - qcom,x1e80100-sndcard
> > > +          - thundercomm,qcs6490-rubikpi3-sndcard
> > 
> > Would it be better to follow the newer pattern and define one compat for
> > all Kodiak platforms? Or would it be possible to use any other QCM6490 /
> > QCS6490 card as a compat fallback?
> > 
> 
> Thanks for your review. I think my commit message did not explain the
> reason clearly enough.
> 
> The RubikPi3 compatible is intended to select board-specific machine
> driver data from the sc8280xp OF match table (added in patch 4/5 of
> this series). RubikPi3 needs different configuration from the existing
> QCM6490/QCS6490 sound cards, including the ES8316 MI2S codec clocking
> and headset jack setup, so using an existing compatible as a fallback
> would select the wrong machine data.

Yes, it should be explained in the commit message.

> 
> > >  
> > >    audio-routing:
> > >      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > > 
> > > -- 
> > > 2.43.0
> 
> --
> Thanks,
> Hongyang

-- 
With best wishes
Dmitry
