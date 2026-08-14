Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D785A330B09
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 04:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786682743; cv=none; b=SG+HkinAGrzARDiwQIpZqlUaHXUM83EjMUGZLp36MFOb/aXMxuJyTPzxjIDZxIupVCZAJc2b3mjitQUY3RyuaLVkclS2j7SizjRl2gKXUVWfQ87OH9DyIuZ6jTImzYDl/oFqaayphRMwGeYGBoVq8xIIF1NvQDhlYQkeozqy0LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786682743; c=relaxed/simple;
	bh=bYS0sQ1Frvx2hWz87/J9nPom1FnHDZ11IvZI5oNAqms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kw0TVult8zE3IjblWb8Xt+oEzDNaXC9xZDi6n7VbpyJ0+5zgMaBBLXOaz0qyE3SH37YUzK4tfzUcPjkIOx0UOaAMeHFhKMfg1z2HqenNxSroI1Bs1XOR2wf+ZX1FsLVsnt6cSpHVayqLxvKEy0X/YLiFHHX9e/3+IeXG1T83t5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHlU0hUT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BIDXlWiH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHlU0hUT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BIDXlWiH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4Qkfh308311
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 04:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kmj37gDYLFmtuqipO2FnJ3qf
	8t2h85UqZ/NaV5wPTQA=; b=eHlU0hUTunVcOxqua6c0vcWDLZCDyEOwTthoz17G
	sgmjCukTdje+2BK1FdA2Lf2Jd6Xepb4o4765r1KeUA3trlidQL0XmgKcO11xkeCq
	U7pPFKn7cFoQfV2AomSTlD7IK7CT7DbIIrZ3KyDzw9a7nroADUCMZfvHb8bWbqPR
	EMhYzSaamt6PoSi1MTz7DDvqxDSAdIKW5C3Gml+zu1YeGoB1CtO3KtBHfhy5n6DR
	2pA8Eyi3B7p2E5yv91hGEyxlwEuXu5DFN9spdZOn/ghByrbpSJej1kZgWzOOHnb+
	JgZw2RnvCpXCgZDp2pv0rYTRaLm+sRFfA1PKz9FXNDK5bw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2f2an7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 04:45:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc0eee75dso179275a91.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 21:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786682740; x=1787287540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kmj37gDYLFmtuqipO2FnJ3qf8t2h85UqZ/NaV5wPTQA=;
        b=BIDXlWiHt+4g8Ba/UJLdxY4ugySfn0qgZVZYlr/45VPAscmbI8Llgf8oSl9bYiset/
         M7n9T1vUEate4zpQPukvrsvw1bs129FbM2RKC44pTtp8EMLI1eCL3i73mTqQo2k9A/iS
         W8wuut2PgnUWjuQ42yNaq665zyeVejbuVvl9yGXU7S21+PHeKrvulukDqEQC8QAnvklX
         wNCA8lzGa0JouZdrTU1CFv7qv3U+GookiwGVqVVZEVLvRoB2nUoa8zNrjk/+1UiNkD1H
         6PqBlxF07Pql6rR0eRSgHmtdQWTf3I9uHtuVp1KUMmBTYtESTCdNTf61D7SbEwxWwMp6
         kkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786682740; x=1787287540;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmj37gDYLFmtuqipO2FnJ3qf8t2h85UqZ/NaV5wPTQA=;
        b=Z0/gkZeNygQx1mrdYO7Bayhm1qm68UpL8TyHyFlnvh2EOcu4Q2+9RGoEr3levS7ckq
         epB+gIuWtYzKZ0KbzVRfsvHmun5tD/VzILQf0xtIl4WuTIrxVjb7FHm8oCH2vjQY2GD1
         L/oHEHAnrOOAYx8td/ynhRUDPYkujCnrZGlHD8ii1ZasoGITG13oBczFGj4+DMJaRT5J
         /VfK4PPShUvT4fNYhmCxsGqRm/iBRluj73wODzADllsD7Y/ZUbrsKMzTAO+qjH+3Edw7
         NkaZzWVCw4nZJDdxpb7R1cQKCkmIiUcp4mK8tlxlC2akwWcDwCQMSpT4PBSylLH2Ai/m
         j7rQ==
X-Forwarded-Encrypted: i=1; AHgh+RraVY58K6/H3C7wGMAXMlqH8aVeQINQsNOT/kO+UAb0qKyCHFQTF9JqtDQldJOMmI4mwZYFMtEy7a4i@vger.kernel.org
X-Gm-Message-State: AOJu0YzH12WeDR1fBYNL6mQvNDY2vDhLuKzkdrH2SewsFVpafeDr7tN/
	bUQ5Bx26EsoiIIy8+1fhsEOHfacE35sVTOSJgFGuHx4mtm65/K2DR2DJ1Ixg2mzvoufDPSU27NE
	jCy6DZPIw4WETptZq4NDNRpIa75BPW8MoJ0PDmvud/L5fRSTXKwxE2gOfFSVzY22i
X-Gm-Gg: AR+sD11Fxb32qBvOnRC542r4epbLWeVyvINkHrgAdtUUFgEELXQ4du58NDA+8ogatNd
	gxiwomoLEVDm2FAkzVIbfxrys4e/8ua5UMzjMIC7vCCDBx9vAUWN87AYrHXE6OwCmjnoch+YXcQ
	NnzI5FXYtXBi8WWZY77hMXmoez2d9FGqBIc8pFg1iA1k1FLhrMxFX9zR/DeeZa+/HrZdzmTjkD1
	gB4gjPVfHLNhzhaA7WhnY4YxEP3wqiubTr4wv+Zp+C2Kq0oS+AW+A2CvaQOAeL0I+HxI4LNJ8dB
	AzB4p5WB6WiX2GPs4VLGhS+yUmC4JinnZI3TRpYGdJ9VkpIk+TPZwqpTBoowhUC3jIJ7+jf2JWP
	2AA1RSmaCXkr/aKrIVhG0pNA7ESoJkb4bUzpMjrEU7rrHxUA5dHsUqN1g1JdOaIBzp8H+rsH3Wx
	xulrMEd4w+KKECHP/5nIhZ
X-Received: by 2002:a17:90b:448c:b0:38e:55ec:e436 with SMTP id 98e67ed59e1d1-3933b4f801dmr2340473a91.0.1786682740377;
        Thu, 13 Aug 2026 21:45:40 -0700 (PDT)
X-Received: by 2002:a17:90b:448c:b0:38e:55ec:e436 with SMTP id 98e67ed59e1d1-3933b4f801dmr2340438a91.0.1786682739812;
        Thu, 13 Aug 2026 21:45:39 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b79af0esm474831a91.4.2026.08.13.21.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 21:45:39 -0700 (PDT)
Date: Fri, 14 Aug 2026 10:15:31 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH v2 2/2] dt-bindings: display: simple: Add
 boe,dv215fhm-r01 compatible
Message-ID: <an6dazZ1WU6vL7Dz@hu-vishsain-blr.qualcomm.com>
References: <20260810-b4-lvds-panel-doc-v2-0-f2c2fe309989@oss.qualcomm.com>
 <20260810-b4-lvds-panel-doc-v2-2-f2c2fe309989@oss.qualcomm.com>
 <20260813-eager-international-limpet-743d6a@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-eager-international-limpet-743d6a@quoll>
X-Authority-Analysis: v=2.4 cv=FeMHAp+6 c=1 sm=1 tr=0 ts=6a7e9d75 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=cDQfHJCeRM-fe6_fTbIA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: xssO2zlRynH5RNI8jH7HYT0YPxV7rVIL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAzNCBTYWx0ZWRfX/BKAGx/sE6Lt
 azxe9YXoNJfmVPxhsQqs6/AB5kPKJMNlPWxFQq5HT1zVC9AVJkSECerY/2gwarZBwe4scUbFq4l
 ZDaNpk1P8j2EQyHFIFqsEtGaNxa3RfQOdVFVqJT9wuQMLgLsJH+lN84r1dcy2GPujZ+uEZYdJkr
 Y1gq5ijPvboheurxnz2c+Gi0pPCCIZF8SbUgHsT/PF03vu4DXhT7Pp4tIOMAMUquqCJ+pZBhJiE
 fl6SihSAd8N48tZZeoTOXyilTNS3fNP19ZP0fB2u3gIBvWDHZCFxqw4+EIPCS+Z5etL5TQHn/9W
 5rBbObP5H9orSkTHGWwhvXN7FO95bOOUBlXCOQCOaPRecfC5zSfzxGq2UWQ61B6YtYxFenYdRpS
 8/lCaobReDtBfDSugOVdxOiWBPAlAp2fZVAtdi8pn97GDjb77OrunACa3Qya2NVkhdxn4WG1B4A
 nTlL/n9iXlISupn/Kpw==
X-Proofpoint-ORIG-GUID: xssO2zlRynH5RNI8jH7HYT0YPxV7rVIL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAzNCBTYWx0ZWRfX4fK8qdtCc7KV
 zwVbVgmpe43FjKi/xrVz5bY7HZ5klRSt7qsaqtcB7hpcbQL+ludIJPjI4PsjKgQmsixL7E2dyRY
 xtKvDA60lrbMuBPqMbHSW6f2XmgG5ag=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140034

On Thu, Aug 13, 2026 at 10:23:23AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 10, 2026 at 08:27:30PM +0530, Vishnu Saini wrote:
> > Add BOE DV215FHM-R01 21.5" FHD (1920x1080) dual-channel LVDS panel
> > compatible string to the panel-simple-lvds-dual-ports binding.
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Please organize the patch documenting the compatible (DT bindings)
> before the patch using that compatible.
> See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Thanks, Krzysztof. I'll reorder the series in the next revision. 
> Best regards,
> Krzysztof
> 
