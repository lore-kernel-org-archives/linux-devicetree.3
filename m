Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1699C3EFFA6
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895657; cv=none; b=RiYsy+UAzl1WC3t0cDAS7LH3hYcq5B48zJkj58RtszLVK4W+Mx+dHsLQYJMIkTe+PBBbISQRrjVtIMGUTbbEwtOrZmbIB+jI25EOLSvXDgthVa02/qg/waJ62EFzm1m0KGsQY39To6aDP/p83lWEImsldCRCbTEi1diQDMDeClQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895657; c=relaxed/simple;
	bh=oprQ9XVDp3+mPNvAdK17kUzNXc8oPG3pFxUJUPdh4Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rck3NAAgEBpL2TrGKdfDm4nmu2FczWMun9RzljjfhCOOUg4vOA1O/jXHAoxKos+JYC07eOxK5cR1XO/IeDFAtPeUBvI90ZSzVFjlFDFKNmSnJknIjY2349k7Q/c3cgeMul2qKq4Hpv4R030t4JHhZvqK9SPTRXGZX2Y3t40krFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6sxk5++; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hO707cL/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6sxk5++";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hO707cL/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618G8Gf508346
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 08:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KoQsjVH1ilFu2iiwEa1yweVh
	3IKCGAoAPFTfsbbLkiA=; b=Y6sxk5++5awHgFmeNItSimgCoczNqftVQaEvYal3
	WRajB6HR1c2sdRNS4aX211SzcpF4PKra/7f+EkO3V6GIgt2FVPW30Z9d6SDzinCM
	xrkm8x+V+E18PUAI1YFJthlhMNQ1dd9s+UvzIVgWsj0LXVehckXmFM7cvFTNU9D5
	0RcdPARf8bJrmk7co1rrHIgzvmin4jwouNLGMOCL9tD+bL1fwK5vG0C55KA5hVxf
	6B/MM0Tx/Y6knYOuSqtiDhGEyzjSiY62DOWK65763Rbw6A0xfnwcx9jIYvLJmcwl
	hdPMZTklVgE3iHrCmFbu2i+jZZj3aaAotpix3SyuudcJEA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j913exx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:47:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e97889ac8aso5490896d6.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782895654; x=1783500454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KoQsjVH1ilFu2iiwEa1yweVh3IKCGAoAPFTfsbbLkiA=;
        b=hO707cL/DHCnjzU1PEtvnWUFMKQINVE501vnMJeSZsJDVtMRkF3kx9IZcBzOkrByfe
         K5I0HBXA+oJHKs20tRIBjaUrRtR9XLd6I6T30gXmhnyJRvV5gUjRji4yUbeiL2/3n6A9
         +LriJkspnlkyfBjCcxNrOGct/1a1bheNBTG5R3NMLCHQqMq9MidtYysIaosWaM2FMyMv
         SVJtBJyzBM3b7TRPXW0OkODHtgCol3jTOKZUwziKZO0FCl5hOLKRoNgqu7G0sOINg1nx
         QFlPSsenPmh8f3hxV+8KgGQubMC5UErSHDH50fOYj/h0s8TmGEluHlCw4GO3BiJjAMaV
         nh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895654; x=1783500454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KoQsjVH1ilFu2iiwEa1yweVh3IKCGAoAPFTfsbbLkiA=;
        b=pCOl0a60+kQR9/JCpycfNaGz9P97KinMueQMd40Q2mtD0CI8PEW+3Rymshg3F/Vxrq
         rPIR1m6jkzHQky29OP8HoxwLe1Ys96d0H/a6+PCWh6w2H0ajCFhPjJ8TgZjuK5/+jgun
         lVhNtUTULK5DZQT6MJ2J3WuskSFhxOc5WE+ktdsZTDtXWqiEuSyYhqzaGecbTwsjq0Dp
         SO2K5Gw2PEPaCrHLMSQVWwVt0qIPbTiOEMJYjahy9dz4Q4n1ZY18PvKnahSCA9G0d+jJ
         LyJNxAYtYjR+Xt0HJBBViovO33tZst35xiiBdpPf6puGdcRro5IM1p7QO74bFWlD6ab2
         iu2Q==
X-Forwarded-Encrypted: i=1; AHgh+RoviQfN5uornk2JUf95WfJ/zgzmeX5f8KCIv8KtSMRSbRPoANm2l1uT1bOHYNYNV1lxxnKea3cNVQP1@vger.kernel.org
X-Gm-Message-State: AOJu0YyMAXfgey8M3z0T0yE4ZFwomJMFlKhz2Bnj2Rw49Ujf+VUflxZe
	YA8St1rF20YywZyBoD5xgM8iuubHBDb9L8so5CbsgrGwgWZZGnpl9FT7W/xc18rSt9qP/a48M//
	10E94yvSCuWP42nCby0MjgAuOxyzxtD/cMbUdR5+YJTl+1ilK0GlBMMReuyv3ezq9
X-Gm-Gg: AfdE7cmtVBhtifFjJZrJk9Te/3DtuHNf4ErSeKINwGZmYnIPGK+BuCSpG+ysKi8oacJ
	Lw6JWmxOM6lAw6R84UjDPz0MKU/+pE94HhcNeJFs/hondl7PzXeRqvg8Q9z+HQeOmAr4D9/xYdQ
	4eV5SEgVCayIfQaW3woJf+KliUXFqDOOrXg2KoetotnX2VFZ7Z6f5mUf9QOixZxBtS+WC13i9XB
	eQXJne6IPmC/teJFCXmnmj9KoCaRDs1OY4e2zT7LwbJDVnUMhy5ZtzZqwLBDgbuUIzFykmUUZXp
	/Lk+Bp76mrDIVvLSZ1DVHsH91OJG6TcU/F1z5RABC6ATLamsZrS8SlL5kccJgTSmk5J6bDcLs5R
	dByOuEiqorAlMF7kBmIfvvaUqJVo/7VzLpZs5pL2RlNw467/4IWF7HRepekoroMU5WkfFSoL9Dg
	==
X-Received: by 2002:a05:6214:4004:b0:8ba:3fc9:88ca with SMTP id 6a1803df08f44-8f3c8d082e5mr7699726d6.39.1782895654319;
        Wed, 01 Jul 2026 01:47:34 -0700 (PDT)
X-Received: by 2002:a05:6214:4004:b0:8ba:3fc9:88ca with SMTP id 6a1803df08f44-8f3c8d082e5mr7699416d6.39.1782895653922;
        Wed, 01 Jul 2026 01:47:33 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f361da0c54sm16139736d6.44.2026.07.01.01.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:47:33 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:47:26 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document HAMOA-IOT-COME board
Message-ID: <akTUHrBNe6X4LYM5@YUANJIEY2.ap.qualcomm.com>
References: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
 <20260630071022.3256-2-yuanjie.yang@oss.qualcomm.com>
 <20260701-rigorous-analytic-mackerel-449703@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-rigorous-analytic-mackerel-449703@quoll>
X-Proofpoint-ORIG-GUID: aHlGbeqScwO_lFxvv-C0UdEEjgD51Xhy
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a44d427 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=CZ8AopsyOcsE_E3q8cMA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: aHlGbeqScwO_lFxvv-C0UdEEjgD51Xhy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4OSBTYWx0ZWRfX/gfYwyEsbIo3
 6i3riQXlcmc756oSWakkfG7GFzHpqOBtAiTw7w8VkYLpEgFjkTVGxBOACjPXrZmkOqz+ivoq/7q
 lv6sl/paKGngB7fC3kGN6RiChj4T0Mzi5w5933J3PHOtYTTWrtz9Pie0QxK4q330JTtj19kXHnd
 C/l11Z25VuJGzmta46TLqRkS5AQj+ML2narp5cR9OThRUv16H00ZzTiqw4/R52zgC5g1IQrjH10
 qSL/sBZ1hOEm/a0uo5Wj4I/0yPPu224nKFPhTgSPM0TZ9duP4SRBE9GMTS17PAzOwptF/YWXR2I
 nJ1FblliQ+w77ZZItPRWo1zF8yauHc/jWqs/smdN8bnnyAmbkDkgas35dwWPs96h3mKrVEMQnTw
 E/DHk+SippjhkdbjEzNGuGIIXJD89ULmemCiCBpxPwgqK4TW9uufSPo4EHgpc/c/ngtexwS97vC
 Fhx9tZDNy8MaNRabaAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4OSBTYWx0ZWRfXwDV0mFXBInea
 0cMqUk96RWVyLLXuJiS+GeGqTiy2KRFtob+ZKq3dKaUoJt0yoZOiANyDG6eoDAdZ/pWqCRD1CKd
 Pbv4VGU6eCCCsnETEHV0Tq6oZWXTJ/A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010089

On Wed, Jul 01, 2026 at 09:28:41AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jun 30, 2026 at 03:10:11PM +0800, Yuanjie Yang wrote:
> > Document the device tree binding for the HAMOA-IOT-COME board, which uses
> > the Qualcomm X1E80100 SoC.
> > 
> > The system consists of a SoM mounted on a carrier board. The HAMOA-IOT-COME
> > SoM integrates the core system, including a SiP that contains the SoC and
> 
> This is contradictory to the code. Your binding said you are using IOT
> SoM, not IoT COME SoM.

Hierarchy:

Hamoa ComE
 Carrier Board
     -> SoM
         -> SiP(This SiP hardware is effectively the same as the SoM on the Hamoa EVK)
             -> SoC

Hamoa evk
 Carrier Board
     -> SoM
         -> SoC


So I think I write a wrong dt binding about Hamoa ComE:
correct here:
I think the binding should be: 

1.
      - items:
          - enum:
              - qcom,hamoa-iot-come
          - const: qcom,hamoa-iot-come-som
          - const: qcom,hamoa-iot-come-sip
          - const: qcom,x1e80100

or
2.
      - items:
          - enum:
              - qcom,hamoa-iot-come
          - const: qcom,hamoa-iot-come-som
          - const: qcom,hamoa-iot-som
          - const: qcom,x1e80100


> > related components.
> > 
> > Hierarchy:
> > 
> >     Carrier Board
> >         -> SoM
> >             -> SiP
> >                 -> SoC
> 
> Drop. Compatibles define that.

Sure , will do.

> > 
> > The SiP on the HAMOA-IOT-COME SoM is equivalent to the HAMOA-IOT-EVK SoM.
> 
> I don't even know what does it mean. How two different hardware can be
> equivalent? Are they the same? Are you creating duplicated compatibles
> for same hardware?

This ComE SiP hardware is effectively the same as the SoM on the Hamoa EVK, 
It's just called differently on a different board. I should update my
commit msg show this.

> Best regards,
> Krzysztof
> 
Thanks,
Yuanjie


