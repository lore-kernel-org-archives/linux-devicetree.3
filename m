Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DF53A7F7C
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790746063; cv=none; b=ha55CgX3gNiwESH27/HFuvoHPxiBEf1yDEGnH6fr8dMd3liCycCecZFtYxZsxDHqCK2Br2SxYYLFV4XuJjpAyYfSuit0cRO9Qj/R6mm4kFJJpGOl9p2gAwqmijtO6lrMmaX5Ew51mScJ5q8MJWtnBgVBC3kxME0AA5NSNb5vX/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790746063; c=relaxed/simple;
	bh=xfDGpQNGJre9u7xiddz0LBjMkLCm7TSvQ548tiK6mr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiIurWI/W84lo0/mK9YwsvY7usUOgXW8Vawvi7IG0L2taqnBOOd+sOxWYRHG4B50F8M0LQFvzv16SoMaWF0Za3NhHi7Urij6GZ1qNMB1PYGnSMqN+f+msuCLnRxJvsIRJtF90jaYuc/7m0+zcoVV6bwiveKUO3vuufIUqBJ8Gwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lv9kgHdE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjdjGzf+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lv9kgHdE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SjdjGzf+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U1AcX91264294
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9peh67OgvZH3C1vmA/mVc2eb
	alFa6I/ZD9JE1WMeqWA=; b=lv9kgHdELLTnFWB/RCoXHZ+ckoLtE4Gvnd89SOKl
	DOHMU804gJu5pbnNHSd5hUkrpT71dbEJMosIBHuiH+8pOjLSPDLTbpUzRwo5f4Eg
	+Kz0cpYOX8xHiANU4q+qeHk6el/q88mGigLokisJS8DJV0s1KJ2jx7pPrVPag+NR
	Gc4pBaSl6A9mdQEcBolGD13eFJKL5RQZGqLx6kCxQnsTcCT+kEYEdN5EYJUP3KOr
	4HwvjpL0NxAsW85tNIuzWzgjcs+AqRdAyoyNU7JDyFwyIO9YkzX9ucDRBCTML+4I
	WD5ZMhIQ36OrQIqwpEF22wMy7+oNIr2u26RdcFvgYGK+rw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhegyy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:27:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so9798704eec.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790746060; x=1791350860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9peh67OgvZH3C1vmA/mVc2ebalFa6I/ZD9JE1WMeqWA=;
        b=SjdjGzf+IOzMV6hD92icPqhCpK2HaRagWltGkgjnIihCa+NxkD4iMdy39Hj1bmGTO9
         8F/M7inrXT5RqvORrEwdzJfz4Qyp4PTAwteInkFrgc0TCygdianH+8CFMF7TbBXj6Oyx
         e9dismeE5rXdRZhOZr1rVUL6j/EfrfmWUVub435SMuGZbgfisAxSycasu9d3xA1v5tlE
         0ifu+DWWQj2pFuUy0evyU9wzhf6OtYKWdX7GhGB3qQBwRfHsP5NwT4XRCh6OTCf9p2Yo
         BIK8l3kkJ/8Zbwymxt9iMEe7o7/0Own1NrdoKRnZpbcQjkJlwSJsW68nDC78SgJ8SSF3
         +igA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790746060; x=1791350860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9peh67OgvZH3C1vmA/mVc2ebalFa6I/ZD9JE1WMeqWA=;
        b=00NVf2wYeGy7Q1ifwdeysdJhAzVV25D+ASxd7g4sUfsrofOTXR0JeNXcY5dHlBrMWG
         +v2r3fHQjyd8tduhzaN7Sk49YteSysJr5GRmIBbHT4udUChWeyukMZ7vYceqS32/dgBb
         d01+8+XZCWd2NdpZtTNl+hwF2rKJ6YOsjdmSwRsw4sC/dI0SaVeGuT85P43yfpBk3N72
         WnhxAF1WgZTGoBLOe8NDcjsb5/zddW+/igBJ1mCcY8IkmcCP87dLzY+xtX3bx8ChUF+E
         mai+o+8PEAlcv/9qlVqB3edCbRDb+3DxsTnDQzlhqsJQvXCB0TZKLPAqayPkEdnmlfpw
         sn1Q==
X-Forwarded-Encrypted: i=1; AKwUvBywj7eIUTzbxLrpV23RUlcp1UZ7sdXs7lCRV8KKWNAvTm3aP3Vv7K1FbFfukVWoWABl3QrE+jF9M+/f@vger.kernel.org
X-Gm-Message-State: AFq9FYJgEDl+PV4hL/UbA60H9pRhmXpakIPHJ52nsL9IdMA96vTwmnJm
	R7Eo9I9glCy+ZgM6RvoRiUooWzkVKLHlLuwp/SP+tHMbsSo1WquNSxmagbTQebak7+S066/w9eN
	M6wTN2lbMb9M0yzUqvMNTPTR0+ZOEkSOn+AwQX6SSIeqtv5aIvfGVDw7oOHMAlR6I
X-Gm-Gg: AYBFou3jnWGU3u4TLYY93jVgArM5FV0TZYuSEAsY0FzsVz26S96yJ8p8/lK02O/A4ge
	2EV8tlkjq3M0q7UMRcQypQo7ooqTSY2UaKZ1iRGUJAKlgc9ZIzh3gshTjETWH/r4Y4Xa0eun/gt
	QHGnxKED3or+M9+21dW1q3gKWxkAK6z0Nv6sKHsf+J6azb5faOkokE5auixD775vhqPnbnum3EU
	q5LdQ/KxH7Xh77y9sB41I6Uf9+OowpZUaqZASKqtE+KaY4sS+Ba2/QClnINYm+rGCB40H/MjVhL
	xrP5PFw8L4DTlQ3fIGMDxYAVwHWCLvs0KZXVbFWMby3bBxiqvFK5IDFO1lIrcnsU8KqB+06F9hA
	qWKOaitPuKtWosdx/xsPtXT4VFlS/vkDvYYgIa6pa6jqqpCSXAkOy7qU1eyuFujnSOfSZ/Pbqrj
	22Ji+VRuZ4wR7S1/5fScu/EG+TjcMD
X-Received: by 2002:a05:693c:41da:10b0:33c:e61:e1e5 with SMTP id 5a478bee46e88-34cdc3c058emr601484eec.21.1790746059418;
        Tue, 29 Sep 2026 22:27:39 -0700 (PDT)
X-Received: by 2002:a05:693c:41da:10b0:33c:e61:e1e5 with SMTP id 5a478bee46e88-34cdc3c058emr601456eec.21.1790746058891;
        Tue, 29 Sep 2026 22:27:38 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf613f093sm1008341eec.29.2026.09.29.22.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:27:38 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:57:31 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Message-ID: <arydw47qwT7jHVsV@hu-varada-blr.qualcomm.com>
References: <20260924-ctrl-v2-1-fbedbe760375@oss.qualcomm.com>
 <20260928-gentle-lemming-of-ampleness-4b4c77@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-gentle-lemming-of-ampleness-4b4c77@quoll>
X-Proofpoint-GUID: YEctibxlekoY8IPFiTK14819idSkSJwZ
X-Proofpoint-ORIG-GUID: YEctibxlekoY8IPFiTK14819idSkSJwZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfXzKZm4S0x9kbv
 c8F3u9UdjO7078SbspIBWK0jxe71RU8wOXQAkukZljuZDztjC4kS97QEMTDJE2/jOrm8gP5uNQn
 8SWpS+HTbLJbMlf2+Yh2OQrSs0khK9GR7HnIlQ5zoLfcrqhHAy0/3Etb4DFr7iwS38527hqry7/
 udouGVxVJN26nEMRI2I806EgeQK3jODKy4n1bzT6CmuyGU61+YiWPhEsUKR/P+ONwdBh5OGt3iI
 +FLJv51uvdXYBWekTmTWfUNJR1XkGLDgFVz3vcsT4xumwYlhR4583lNU/FpQvjgy9lxcYrajYjs
 +5eI8hT4jPdBglEyd1rDz4TUZNPlQAJwGABVPNUnSu3yMR2DkIfM9LJ9CqaEcN9BzQv28fV3YWZ
 elZ89lgfItkBE9VwCd3q+Dmhj+ZhQCG9mau5pLsvRz1jJVyNg4tQoUr2WE7/nv1RAcd7H6c1+AA
 DFQpHo/nqwbp2n/8r9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfX1LQbmY7RYVG+
 /MVZ+ku1UqHWks0XBaWOjdahncvNE6tKj6843Iiy/oCFCXPXilhQOBnJV2S9P4GXwTFpIjvpK/6
 PXLdyHd5K8gJW/FBiZA2/BZvePJdvTU=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abc9dcc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=9ksu8lDKoU8JCIevmIgA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300021

On Mon, Sep 28, 2026 at 01:00:46PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Sep 24, 2026 at 01:19:05PM +0530, Varadarajan Narayanan wrote:
> > Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
> > on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.
> >
> > One controller is connected to a High-Speed PHY, while the other is
> > connected to both High-Speed and SuperSpeed PHYs.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> > Add bindings and dwc3-qcom glue driver changes for adding support to the
> > two USB controllers present in IPQ9650.
> > ---
> > Changes in v2:
> > - Rebase to top of tree
> > - Drop 'usb: dwc3: qcom: Allow the glue layer to pass ref_clk to the core'.
> >   This will be taken care of the by https://lore.kernel.org/linux-arm-msm/20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com/
> > - Add ipq9650 to existing clock constraints instead of new constraints
> > - Link to v1: https://lore.kernel.org/r/20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com
> > ---
> >  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > index 9f91c8711e02..a8fbf72c6375 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > @@ -36,6 +36,7 @@ properties:
> >            - qcom,ipq8064-dwc3
> >            - qcom,ipq8074-dwc3
> >            - qcom,ipq9574-dwc3
> > +          - qcom,ipq9650-dwc3
> >            - qcom,kaanapali-dwc3
> >            - qcom,maili-dwc3
> >            - qcom,milos-dwc3
> > @@ -210,6 +211,7 @@ allOf:
> >                - qcom,ipq5210-dwc3
> >                - qcom,ipq5424-dwc3
> >                - qcom,ipq9574-dwc3
> > +              - qcom,ipq9650-dwc3
>
> You had 6 clocks before, now only 5. Not explained in the changelog.

Sorry about not being explicit in the change log. The additional clock was
supposed to be passed to the dwc3 core layer for it to get the reference
clock rate. Have dropped that in favour of using [1].

Since '[PATCH 2/2] usb: dwc3: qcom: Allow the glue layer to pass ref_clk to
the core' (please see [2]) was dropped, don't need the additional clock.

Hence the change from 6 clocks to 5.

1 - https://lore.kernel.org/linux-arm-msm/20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com/

2 - https://lore.kernel.org/linux-arm-msm/20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com/

Thanks
Varada
