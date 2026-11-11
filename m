Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420275;
	b=e6w6U86duCpO5UoaU+rYQGqAfXIjXMVMsOYy1UfcxKaSMoOognl38+HG3gqy6N33us50
	 hN5PfUTXTdj0VmEULnBthO9FqsR8Ce3BEofdkwxoChkJzGMdVa5EnewlqnR2OSAkysibh
	 ODbD9/zvrj0zoTJZUAXOH0oiIcSWMQXArMK2TR/71+JUpyDdr+xwkp2+hdXQJJz2/bLxp
	 QTL2l6IjoReJtDW08raLCPjfxcN50syP9hVGbb6TMlgMJ4t3fWYsbI/0Iuz/cNcLlZtKd
	 5D2UUvW+YunnwUHj1HbVhqAWsBY9SSuGDppnANNOubfSKhFRT91AYVSAKQtY68uZtFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420275;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yMzNv0aTJrSt8UYD2LUVyq/F8tblmivrrCSb6+nO2Ts=;
	b=Gxq1tH5ij7BHzKmfs/k/6eATKZAulawgjd5flA9XZL3kqB+DkrcJPakKy9/k/ajnal//
	 sELOB1XQVBbG0VzuTvLWMPKDpNDY6m+IZUUHQu9gPLz/MlWZrZrn09Bg5eTLKhMLNuknO
	 RFbDcBp37nWXy/sjtF31UI89reZsgJcAFRtZr5ouLRPq+6k6MdXxmBmRkrKLVi6Ba+I1P
	 bxPvcx/h/25L1fVTUZ80qjAGdNhSiDM6Rj48pCK1zO24+vZKefHsBoFRPwYypBpwGwjzu
	 DTufI60xWHtiT+c5wDTM17URmo6W/1pQfywuFZY9mlq1xdmL9Lepuf8eKn0VbOZL6kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Tg/jxDjT";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BdGMCfxW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21951606A326
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21951606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tg/jxDjT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BdGMCfxW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtTpW2980857
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yMzNv0aTJrSt8UYD2LUVyq/F
	8tblmivrrCSb6+nO2Ts=; b=Tg/jxDjTx75J68MDIuAo5nCo7HnZ6v19JjFiBW4d
	1q5066SF72hwrQeUo1kEL+D/Vbg36y7iYcH8lEoIYlLioWpOu43iFDFpXKOo1OVW
	DKcYeCb1gtKuzqPcB/K2dgUbUlKhawt1ASywinxrRLQkFxMYQJkYhE8gaB22ftj4
	OITHIfoXK8kD4QNlPhZvIOSGn0CP6BpMh3Zddyzam+pzwDkgQzqkZzrKBUBvEYZs
	3UwpA8UpTMFsZTd06CqAWYu91z1j+YU25Nh4RkzmUUa89yGEkySRUBrpUWKU0kkF
	HlgQKxOaufXnYbur8AZ83pwDuk/C86D9lZh6nvA3e5+RZQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksmahaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:04:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so3250284e0c.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420273; x=1795025073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yMzNv0aTJrSt8UYD2LUVyq/F8tblmivrrCSb6+nO2Ts=;
        b=BdGMCfxW0qml5/UbPKV7+wMp8pM8vLh/0QBYyuK7eccEQzfzsnWDbqBqam0lMaGvTN
         dqcZn5BCpTsvrF4Y5SdZpKkD+u7WkiBYoLCx/v+elbfidtxob1vgOb2II/8pGKoD+nOL
         tdiRHi0MczRAYGylGuR8/qTc7inizX+d4E8YvcwcgN5k7+91ES4aD1kWKF5ygGjbGFmN
         f/VdvKsiNSoTiQGciuav6CfGy3Jvz+yJmVKepMMmKVlqfEWCKnWFe7VVBYdjzzOQC81b
         g/u/O9PgKE465ONkNizgYHduX+tJN6zfD4i2xHbKod7wXijkZnvPpe/yvEBHJxS0X2zX
         w5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420273; x=1795025073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMzNv0aTJrSt8UYD2LUVyq/F8tblmivrrCSb6+nO2Ts=;
        b=IvR18dREMHuLmj8vup/LmQF+VFCUy5OX8viRybUqVCz6pzojS+yg633ZHw2n2ei4pz
         s+mOB2N8m8fo2ey2VssMd/tsfT9aI5ERz+RDUgr7YGdDyA5EczlpYt7JuG2Pyx9bnZhD
         ONCO/jQHOJjZ3xCcYls41nQQTCXs9jZV7IEnCyCYYyJw4htNPo9Esm6J3J+6WFIlMCqY
         YD+WZXV83c06L5pUm1l6hOixrMXocaKvAZeVA35uY7jiavLx5r/9IqnNfggK72jbu53l
         nTg6a4b7Togl+wFMg4y17zgizBAcVWOM9bLseXALBn3zmTAYZm7v4gBTYe0fw9E6kctk
         GMug==
X-Forwarded-Encrypted: i=1; AL+hErHR1HkJaq9iNqhmSQd44kRbSXTPDPpctjuGqhL9KFzFm+882i1k+ga9qhl4U/ZQ0uxEMTtiCurcEX8V@vger.kernel.org
X-Gm-Message-State: APuU4Z9c80S8WpHCsvTik0AhR0NrVe35RfW6nWF7Jf5ink9eraZ3YBeR
	9xx6fMc8sJy0fCMGLZyoj1IdA3qXNdYW0TuieGjabFUo8XRt5vMqbD9UGar1IgHfIlFg+qEByJR
	YYXJQYMVVAvTAMeMscZmmci0xnf/G0kxouzAKS7Nu9TC1J0TzdW0wOb1BRxmsp2jI
X-Gm-Gg: AYBFou3yYLUrifXdcZfy94BahiQOS0PfjYFGQBBvfGb/lz/tNIS4epCveFsGGPhlukg
	iOhaFIf2sAR73QM0f9C4RhNcvLVrncb45o8xgn65kQ/rttMzeThp+E1LZCmVwdpqWkDyMCsKD6J
	md+nM7HPre3r7fYZjx/hVUIV+zCNV8+HWR4MW3cNnlnpanieHESTVHw9c2sWoBv0q7CFThEExBx
	fna21yrbc59f7bFjRQVec2KZskvWovzWhmqpghVFlKdcI3UetFIyNxvLVpSSka5e2SgIQqwy8UD
	jiix7U0Jqe0DUC77c6R6SWTjtzVHEy+sGn1Mfgo/IskAgrGEUFSzEqjjv40MrlBCFMhyYy+S0kQ
	Q03DCyadAkE5rLHKkJURQPw2A8NCDCnGHUSlvUaCp1eHMh+g15TwJCZ5JfoNlwVup9RqA042XVK
	U4kVZorgTj6Wn6+t9ulul/3ekClEtyOJDLVDtDLsacI9J4uh/pCNXtyvqaD55frQ==
X-Received: by 2002:a05:6122:3c44:b0:5c9:c60e:3a4a with SMTP id 71dfb90a1353d-5ee1c4ae46amr1391430e0c.22.1794420273248;
        Wed, 11 Nov 2026 10:04:33 -0800 (PST)
X-Received: by 2002:a05:6122:3c44:b0:5c9:c60e:3a4a with SMTP id 71dfb90a1353d-5ee1c4ae46amr1391338e0c.22.1794420272673;
        Wed, 11 Nov 2026 10:04:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157baa637sm1056344e87.33.2026.11.11.10.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:04:31 -0800 (PST)
Date: Wed, 11 Nov 2026 20:04:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,sa8775p-mdss: Remove
 bouncing Mahadevan
Message-ID: <2gfqgoiyvspgjj246a5go5ij5yrq6kvgw3vv2ttdbn2iobvbqs@bronlyxmhjqh>
References: <20261110130255.134252-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110130255.134252-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: 1QAgbBaRYeV2IhcEo9i_hQ5qhTBfK60j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX1kZnlnBrnaQZ
 s4dgOQFvvd5m6ozkbV+qwPvfWKQmLtgbcnw7De1Nwzl2xz3YtudsrJH/VRmTzEHT+zqEEX9/oRt
 U3QIB61C8Ose2HkD29DaNErO+8wZuU4SRC5D6sG7qacR5soSN/L/3muiZ7KQNffZtBiZkJ3ZjP3
 yRUX9+CK8yXqBqNZG7c2iCNqzCE3HCOmENpB4lpYn+uhkKiUYiuKZ087ye623nwX+6g7vU2ZUrZ
 3/Ltawy64vv33JSpm3Sq/0YseOs33RNmNcJQ6oe6srUqRg4z7MTOvN6pZDBd7IfRPapfhvZd6kZ
 1UfsbRdXBATy90pCnjhxDCWXDQD3Uyx9/Wv/l+scimCiNUzNLTrMY+brY+g/+DnkwMDADj5CD8a
 YIA9CUh6/AbPtxFCnT571cuiywcWArogupbD25tvlYiipBm9EXhPL/a03q1HZy/WrAoAqKj1dXP
 q/eAOy8B7jRZgNmISlQ==
X-Proofpoint-ORIG-GUID: 1QAgbBaRYeV2IhcEo9i_hQ5qhTBfK60j
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af4ae32 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=euJXWGPXM6RQpXQweeQA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX3PuG9ku6O63v
 F5vNLw1W08KQo+nckxcw/RHMPAGy7T7CSLPn7E7ubeCYUxskCMA0yKFRUxFMEAFMRKcVY5afCqS
 oQYhBTx0LnywkH2H3P193p5B4QZXWVg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110071

On Tue, Nov 10, 2026 at 02:02:56PM +0100, Krzysztof Kozlowski wrote:
> Emails to Mahadevan bounce permanently (error 550), so change the
> maintainer to DRM MSM maintainers (Dmitry Baryshkov and Rob Clark).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml     | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
