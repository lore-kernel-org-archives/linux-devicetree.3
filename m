Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA26C2517A5
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 02:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788747973; cv=none; b=qRN0Siei37v6l+LUkqs0/XuC0osFsxnsh5FbNTvLVHswSTEI1mnoG0Rkmcv0AHjL8QlF40e/ZpD9SpmiXl1D+qiOqMlxilvtAzUOFaTtvyY/xD8Ceg5DXxBx5SuDityxGJusqS8oKeZU5Qyb0xvJSbBsgkvr8b347M3++jgIfvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788747973; c=relaxed/simple;
	bh=SqngItBzZRRemQ7Z7f4iOSqEU5Kl028KrDmgh47NvwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llG8Ye+ZGk568UBAwNXl0YgCjCd2y28p04X2LGPEY9I45JaXABQbadNS9o8tuKubD9veS8JYSV5DcjiNxdRuxjjYjJ6FtDqypzNs3b5k5VGmbFg3aRq5OdCzwrBecDvyKYR4uYm3xmy8DGz7RFdbvzax83gIn60zLKC6DJ8aiVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YcdFf4wH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWmZ4YW+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YcdFf4wH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWmZ4YW+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6872O4aU2925854
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 02:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n0jUTNNzExuLuTq0dCzLcka2
	2DJ7rjiceOe/URuM9WY=; b=YcdFf4wHGK9LHBWgjYX3BMyydcOUxhu32MqWOv22
	iOKFSgTSTQCWH3YTlOduJREptzNaFQAO6+x7KF16tVBEFORC7+qU9X5DLtbTqjW3
	bJ3XeqHrYqBOSs+qj2tQr3/n5BwhRAPZCYMgXpYw/2MPPgxVoIAxdjWwpeq5aOls
	+Dym7x9+W1ndeo7PN41gqnjR8QESG5pgrO7CBuFHbwvriTdbJdfZ5skC62F3yfuq
	1tjJHPXnqN/zUCGFLmTpPUnujJCUSkqn88ZLzgJRgD07AnJLhtsXUvDXYj+qVVBJ
	097VYMPrgBX2aMBCkOi6QGhX8CWc2nOcdZ+aLQeZT9Ovsw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggb5vchnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 02:26:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39af92138f9so4715889a91.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 19:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788747969; x=1789352769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n0jUTNNzExuLuTq0dCzLcka22DJ7rjiceOe/URuM9WY=;
        b=LWmZ4YW+dk9N+W4bXfw5Z2T1BXynw+3VGL0TUpATro/orLAR5GjKmXss5VE3cdVF0H
         ccOt+IG2f+XbWuqbnMeBQNii/f3lg9ULjB6Hh/GXiPpATcX6QU8G4E2XMWqYhDZY/+V+
         x98ClFu0mA3j+QNb7fai66qAnzSSEK7VtypAS/AfBibloBgWnuF60PInkYxoUL5pvgRy
         cGycNL/BQ3J3gbkhDdIiH+04mjQi80ICEs35SvrMYFUS5cQKRHwbVXletcqrCK24mmJi
         rFxJjX9Umg/PPS5QZPcPBGbsIVfunS+850/+i6GF4MXHjlSbe2BEtvbVlcRhDyKcSMmh
         V0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788747969; x=1789352769;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n0jUTNNzExuLuTq0dCzLcka22DJ7rjiceOe/URuM9WY=;
        b=hM3Gx6DynCUNgDX9CPPFaZxDtGtQeRLe0v0K20aUK6xETXnFxpwmATmqSEd8dVgwyt
         2Bpfw4P/MhojElKKHUklJ0byCLrc9FD8/q7Om44OCpqojaHvHdHZgkD5kqG8MUls09pP
         GBEuJqSyMIe7n5doYo6sGQJZkA9ZatxJxq7jThn48EdWKRINNy1ECBbt2zRRVoBSTlWH
         CnvNAES1DSU+OdblwRy1WmlZ7MvJKkN5ayDc/rapu8qpygjYQvBeHPzEf7ePitJ8wK1N
         pa1oFusdBj+6hUdsIRhvQ8hN3fqbnVoH1/XgQCYPKUyJaiv/PtWsEb2uzVf/qr8t7Thd
         +Nww==
X-Forwarded-Encrypted: i=1; AKwUvBzpMAd9J5gW0wqEIvbF2mdn/mUXDZAdM0S2nsVl809l/6DtrcAUVhdeKYDwWyxpDILsVfeXEfB9pK9V@vger.kernel.org
X-Gm-Message-State: AFuF++l1J7qCS5H+ltxv5BhUBeYTANes76Gruhz/V+cO15TW9Wmstc5X
	ltCTIwwmiJqdJFc4djZwKgiq6AKnEFGoETe5maZsRscdq0f7o1xIh7VZ1TE3M8RNFLPoab5VWM9
	gQqLludr4peUOM1O7GvXEAU5sw8Zl0wJxMGPjdrrdmSNlnTeaba7ZVOA37Gdffz9J
X-Gm-Gg: AYBFou0Bgj/eIKytbkmPsjU2H6SopY6ZbO6+dP7KU9tBjS3Emii5stjdljhJceRI1bl
	I1XrYdk0uoFJ5HAGW84ea9+14CsNUPvObMvZEyf3VOJGG5g3+x3oZWWdph+6phEConoBm3mBuYF
	8k8e4Bo97JG9qZ3XNPfP4HLBFHhWe8PxGlDtdP7W9PdxzUmsrXIvJPcvjjDjebLyxOeuLI9ko6A
	bskfEFOadiAswtnBz0+8f2EcCc0HABKrfBIjEKp4QJnkoF8r3U7gsf0+cfbLcD1goyJhuUStuzK
	HaWDwByz9/IljYG5PXMQ3b46DJ/pTTh8PCWXeVGimiPvn6PdrZttppKdjPnDm9YFCu85aPQ/rjA
	8/JEXQR/Eh/NcxK/42igGBQWu8EeiZHiiKejdLuK9zGGvDsA=
X-Received: by 2002:a17:90b:5745:b0:396:669c:b5f6 with SMTP id 98e67ed59e1d1-39b0803accdmr28515622a91.12.1788747969556;
        Sun, 06 Sep 2026 19:26:09 -0700 (PDT)
X-Received: by 2002:a17:90b:5745:b0:396:669c:b5f6 with SMTP id 98e67ed59e1d1-39b0803accdmr28515586a91.12.1788747969120;
        Sun, 06 Sep 2026 19:26:09 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm33810559c88.4.2026.09.06.19.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 19:26:08 -0700 (PDT)
Date: Sun, 6 Sep 2026 19:26:06 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: qcom: add Nord QMP PCIe PHY
 binding
Message-ID: <ap4gvmokukHV1RHT@hu-qianyu-lv.qualcomm.com>
References: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
 <20260828-nord-v2-1-18bf59d19d6f@oss.qualcomm.com>
 <aabdae7c-5294-4789-b123-4fcff8a733e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aabdae7c-5294-4789-b123-4fcff8a733e0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FA8eQu5P5qBbc9KIeVWG7lPRMKU0IN5i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDAyMSBTYWx0ZWRfX9GlC7f4ajb0N
 OPi1XMe2wUsYLKnaX0Rc4PrOBmSrMFd8Z77ty2ySXJajOFn+sukfq7Q0MGulKWu6ERQmKv11y7E
 cNMT5/o3Mylr+j5epgTIvI0xkRUWeBIpuq3IVXwLLfUHpxTS87+wW2hujsrsw1OJzrMlnTMcbT7
 flPwbk4dVPtKWcTloWrINE55eL8+FIIs2LPCzG3T0VxZ0LmNFxW7Hj0hcQDxkVE6f7LrxR/7+U1
 40Ncd/zhopWcvuq9WLuLH11JY4k58JzrJoNpk8N0RQxSZOQbYz/EJBGgxrakg779iQFxc9FYQj0
 hW5N3ttqP3SIeXayy429v1kqO44sTDAIucIycpmuiAKIvpVY9/jAPH5x9fcqaK1kjfQ55ZEZzWg
 +ObSUzyexyPVVGi/IYHQJ1bnmMEHpTxvoRvciBY+w7VEc9rutDf8pxhpNBcIzEqjlhpmRQW5IqK
 8efVZUhTWHPIfq1oI0Q==
X-Authority-Analysis: v=2.4 cv=UO3t2ify c=1 sm=1 tr=0 ts=6a9e20c2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=MuNgaGKqo7zVGC3JrMAA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: FA8eQu5P5qBbc9KIeVWG7lPRMKU0IN5i
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDAyMSBTYWx0ZWRfX1A/fIQMrovmJ
 AqOxNQfOSrfdeTAaCIwYvFn6gDwKMtIDdjnJ/XawyYcltnw62W4MGyuQi6M3zr6nmZcY7+4LLfL
 1SKparkyUivn6qDO4ryyrX8kVMNEGQA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070021

On Mon, Aug 31, 2026 at 09:54:40AM +0200, Konrad Dybcio wrote:
> On 8/28/26 10:43 AM, Krishna Chaitanya Chundru wrote:
> > Document the PCIe PHY found on the Qualcomm Nord platform.
> > 
> > Nord has a Gen5-capable QMP PCIe PHY that can operate in multiple
> > lane configurations using four PHY segments (A/B/C/D). The active
> > topology is selected by firmware through a TCSR configuration
> > register and may be configured as x16, x8+x8, x8+x4+x4, or
> > x8+x4+x2+x2.
> > 
> > The binding describes the register regions, clocks, resets, power
> > domains, regulators, PHY provider interface, clock provider interface,
> > and the qcom,link-mode property used by the driver to discover the
> > active lane configuration programmed by firmware.
> > 
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > ---
> >  .../phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml        | 276 +++++++++++++++++++++
> >  1 file changed, 276 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml
> > new file mode 100644
> > index 000000000000..37198f82c611
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml
> > @@ -0,0 +1,276 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Nord QMP Bifurcated PCIe PHY
> 
> Quadfurcated, perhaps? Is there a word in the spec that doesn't get too
> detailed about the number of effective slots that the PHY is divided into?
>

What about multiple link-mode PHY?

- Qiang Yu

> [...]
> 
> > +  vdda-phy-a-supply: true
> > +
> > +  vdda-phy-b-supply: true
> > +
> > +  vdda-phy-c-supply: true
> > +
> > +  vdda-phy-d-supply: true
> > +
> > +  vdda-pll-a-supply: true
> > +
> > +  vdda-pll-b-supply: true
> > +
> > +  vdda-pll-c-supply: true
> > +
> > +  vdda-pll-d-supply: true
> 
> I'm really surprised they aren't all connected to the same pair but oh well
> 
> Konrad
> 
