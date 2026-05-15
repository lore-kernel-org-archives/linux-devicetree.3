Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905D2466B6A
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842236; cv=none; b=obx1gtqI6fqnS+HVZTfoqicV1hy0QrxDgGVFVb2aDfl3SKhy4iaWGAnR5gTbS9UBA//44ZU2F3Wtgt/aX91fPV8epp4RTcSOuBZsgXg0Nx7KgJVqBL22l8PYJ+ESeQSQNGF8+aiSmFUs/qdQ7J7iaN3C4GjHY5AYWcayLZ4lLfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842236; c=relaxed/simple;
	bh=PZqP6N0GHv01oCxxyEcHwIdGM764yAd9JmJx6LzXnC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpUH/lDWRhuB1DWP74CTpvKWgrJtl4htBEVwfIE1IiZ3AXxe+XTO5lTHUuOYNjZDB6GNNOM62C0rZB5HAbs7jTrQexmb4AXwRUSZeEYXskrDdNe/bko+EyINq9RdRYFUKMrXhmDiFI1plMiT433r6s0iHOn7DF5G4JegINUM52A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPyz0r+n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0awAifb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SPyz0r+n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0awAifb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F51wKb4008229
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MMeHdJGAoPxBJnSt0nIPV+8E
	rlI4Sfx8ecRBUEHWylI=; b=SPyz0r+nW3IiKDnpPdTPa4bXtTwetQg1r3hIQNGG
	Ayi0oryNOL35dgw+QU9YvoOA8tDGQ1k5QaTWpej2Bj2+foN3zpxsa4OJFoqHM7HY
	OMouaIglQKjbGLFjhFhV8+G3zRCvOwLdD5aVpGU+CmhizdFZ9naqG2XaO7lJSM/q
	Q1CA5Hdxl1igVo+sc28F9rFVK4imWsUT/bvq3hky07ooy3xiHgS9VfgF8Jqm+q3m
	jg29RNplMCo5TmC4AAM8brCQ43M2GyrEusprV/kPp0XQkOt1YsfqMhB+xJoLMuLG
	daQ1dgDz74wZH+qE5P/6sO5Kl4Wh03m0UeVKD6s/WHMQDQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stx3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:50:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365faf6006dso10513641a91.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842233; x=1779447033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MMeHdJGAoPxBJnSt0nIPV+8ErlI4Sfx8ecRBUEHWylI=;
        b=K0awAifbalpEDdwpjOZT/a2udhQHqidVYB91NET9h7MRlsdvf4Fn+aq5zpAsGzNi8p
         J3DiueZSYykJnMbGxXLaJdNyvoZ5rhC8W69DGvqPwJoneZRo5OP9lf1Hv5whufEJYBmJ
         LyK+31rnLsnTs5FLWl6TrMIxcc/CyiziEUVMxHlyldWrCheu5zfWo+qIkOblJC2GhsIL
         qZqtQqpQB47iwS4sqUjnbt+t/ooe/yCL6oUMyrkenGj3Pju2atbtSe4LyncuY5EJ/YbE
         YHA7h25gUJDgS5YejOfTEeIB4k8sQWQU9LC8khDWYRJM6y9ICKovdX/hHaVFQoSILbWQ
         zEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842233; x=1779447033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMeHdJGAoPxBJnSt0nIPV+8ErlI4Sfx8ecRBUEHWylI=;
        b=JKwOGlGrr2aakYUz22b8J79jHwTIR9FaBmNj1dFipKVpqbmVF398j9geW8bijT1/OS
         uhxrg265assmjI6aPSeuDpaIBlLJXfDXxcZuYs+61u/fOEB4XxLLAaMl2Nv5E5lnha7Z
         uMLpMu79DF1du9sFRBQ4HnEOrxmRow8cGVNowYBl7hTqhokZSwtzOldajDqTZMhCZrvY
         mCbcfh6ERxgZSaUUFvMyMVoBPrlB8ZrnJIxfH4m23q2bOTRQ4GX2WWnqMKfrq+44CUsq
         qzR2CN3YKh03zLGxglLKYunUjnb8stvDXbnIsIpifzN3s4LpAGcqDRk+hxdqO2dkYPMu
         SSlw==
X-Forwarded-Encrypted: i=1; AFNElJ+aM9oVBWAzPl+0+NjZ1yeSb3kAkRNlEAZbZGKVrdRMNMAfxBcoRDgVHKaRmQEakWG8cg/rQNrByqi+@vger.kernel.org
X-Gm-Message-State: AOJu0YxOiDnVqDqS29fqwiQlmZjgbt3kT7PgEtO/Eb/O5JexYUDDAjbx
	pLVDVFf+aozofbPd03M/k/9TA+vF2QrnZuIAf0Bxp7Z7IFgzzkkvqIVrUq+bKg58AZoHNhtKD5s
	RFi/pJQDjTgVU30Pnla3p7MeK9quCcQ0MQM+tsBRkXo1MsmDwcj9PVtOhAV83A0A1
X-Gm-Gg: Acq92OHew1doTFMIr0TMbuLn0QDWTg2ZO1lfMQlXVPZax+9QVurtARTOIHmH2VK2tbL
	bI7ZESfG2J3pKL4hUHLF6npMFtpQm3ARmp5XTxJmecqSonZwuQ7b+RcAfeSwsDuloKytrhspHmj
	rOMkis89YzedRSF1sXZCYxtHQyCt0kxC9xsYtVRZulIVhGYo6dOHTU/Pfv5VX2clGsnrBrWijGi
	CJtOVvmuwXJZzWQi/3hy7pDmL5ipuya0cwnpYhvtQJFc7HbtjneVw8E1Okw8vwthFM7B84GbdFL
	4NKyImLqV2bBSEmEZX60f779NNgahDtXcWIQ6I81w9xp6jG181yWja7NshznVuJfZLUb1El6cJe
	TqOeyDcxRM4e/oPrtxNGFRN48bHeGb8MDpZ9tYhECMGXkOP4N6w0EJU5LiV/8m7KS5rWLG2vdrw
	2u9P0DzUdLWPMhVrrC3YzzZdj9qpYPudGIHrOyQCxewZfA3atV7kc=
X-Received: by 2002:a17:90b:48cd:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-36951b82818mr3581244a91.16.1778842232692;
        Fri, 15 May 2026 03:50:32 -0700 (PDT)
X-Received: by 2002:a17:90b:48cd:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-36951b82818mr3581228a91.16.1778842232204;
        Fri, 15 May 2026 03:50:32 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a0e93e0sm576682a91.10.2026.05.15.03.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:50:31 -0700 (PDT)
Date: Fri, 15 May 2026 16:20:25 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Message-ID: <agb6cSAul9aLbnh9@hu-varada-blr.qualcomm.com>
References: <20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com>
 <20260514-pci-phy-v1-1-482429192746@oss.qualcomm.com>
 <20260515-optimistic-hedgehog-of-penetration-b34227@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-optimistic-hedgehog-of-penetration-b34227@quoll>
X-Proofpoint-ORIG-GUID: LXzlDwYkAqZG4zA5tt4HN3LgSY0UoFsA
X-Proofpoint-GUID: LXzlDwYkAqZG4zA5tt4HN3LgSY0UoFsA
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a06fa79 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CmgulrJ2bCN2atHQ318A:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX681mZdEbaA4q
 i78USYJq9SrVoNeK5i8opNIkcnhnnEopdePfCBWAHEcsYDF4vUt6OoHrbdaG3Nti93Vcv3LXE2R
 eBj9bQp/SkmzAv+5otkJub6EfwwNXUrSF3O/RfBqsREDZwl536ucrik3ifU9CN7vgFyliErZcvr
 yqs3oj75Pc/GlPFVU9+x57a6Zbruy8WHPwGeCkxjLUStdxdsyf2C215Oue9HWHl6TcqLP3JTpLd
 xhR2AkJ50QuR3WKdjAS2neE6jq35yne8kjidIzzE1qUgtl9mTMrBnL7JFbmZ2qYrCL+JAe9mQ18
 +5ZTDe4Uhg/jS53DQalHDndHclT3mBot4AZWLnNFEQnYGrVvgNMpT3G5uWovx4RwF22gSbAElM2
 oCRug3ZAjYJpVfFBmgyR/yd1RTx8Scqa4DSMHXBLpPeDiWISC5rdXUXp7Q3QemP5Woh8e2eHkff
 QBHlh//TCqdmLnx1iWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109

On Fri, May 15, 2026 at 12:47:00PM +0200, Krzysztof Kozlowski wrote:
> On Thu, May 14, 2026 at 09:28:28AM +0530, Varadarajan Narayanan wrote:
> > Document the PCIe phy on the ipq5210 platform using the ipq9574 bindings
> > as a fallback, since the PCIe phy on the ipq5210 is similar to ipq9574.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> > index f60804687412..1ac31439c20a 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> > @@ -17,6 +17,7 @@ properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> > +          - qcom,ipq5210-qmp-gen3x1-pcie-phy
>
> 5210-qmp-gen3x1 here
>
> >            - qcom,ipq6018-qmp-pcie-phy
> >            - qcom,ipq8074-qmp-gen3-pcie-phy
> >            - qcom,ipq8074-qmp-pcie-phy
> > @@ -24,10 +25,12 @@ properties:
> >            - qcom,ipq9574-qmp-gen3x2-pcie-phy
> >        - items:
> >            - enum:
> > +              - qcom,ipq5210-qmp-gen3x1-pcie-phy
>
> and here?
>
> >                - qcom,ipq5424-qmp-gen3x1-pcie-phy
> >            - const: qcom,ipq9574-qmp-gen3x1-pcie-phy
>
> So it is or it is not compatible with 9574?

Sorry. It is compatible with 9574. Will fix this and post a new version.

Thanks
Varada
