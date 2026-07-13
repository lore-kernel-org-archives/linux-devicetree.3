Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8889F28A72F
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958884; cv=none; b=Ng4Cx1LtxzBmiZYWSj4KHqqiTBI3gOYjqjfFB79hDneN00BSgz914RLv/HkfYUikWmJfSrLG3SKBp8dUtWjHLS310SelK+i4IjX7rW9KAU89A9nMlucwVmKcVR1DZg3YM9WYtRaSIJodpDomiWTAcVnAYVZwuScRC7I74FdEoBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958884; c=relaxed/simple;
	bh=fDDi3VGBsM1RSmL/j03lndLu5j1CRsFIOb9plDRnauA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tOmW0j1NR7Zb00WTy+PEE1ijT+oYl0N6/Sdx5z18+iG0Dyggrc9amkpC/yQd47hIzXmJHydJUWzf4iB7MHNR/aJUV/FQ19yuJTFnzTg0l6dvPL4Q+09BB2yHkSZOq1eO5oFRKXIHcqRWVJuLvkJOFP+v/baUq/0FvAaWna2XJjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OhbnVXqV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZQI5iSG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OhbnVXqV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZQI5iSG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8Ab61968331
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 16:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8NOPLnKoo6QrG2E7W9gceBtElHZ05++bescYD+aziY=; b=OhbnVXqVchFuZ3PY
	WBWAQnogNINzPNaJuhzejsKCSARX0WhewBSDCv5ZQt2FbUI3ZFwQG46gS3iDLvcZ
	fFzAKglbNmWpagSAjkQxW4Q1P+HYYvFDzlLvvfz9cyz/IiO8TgTWHCG1ujFvKt11
	/zMXEnoj8K/MOmf4JWRk8RwJNZnr0vRWBR0Itg7tcvQDIIph7kmPiAuCS30Q0D0l
	Ig2s+Dqgdy0rGAVhdaXlWfKXUodMgEIJzGC5fx8BXREhIhOU1LL2N+TKjSyl4pkO
	fsE6jcEJHCURDeJ1/T+sfj6566BQYTD0cXzfKQyzG46nwjWQUvc51Y6Y1aKmS1zO
	s5ilyA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3behx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 16:08:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38c7e26ecabso40706a91.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783958881; x=1784563681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R8NOPLnKoo6QrG2E7W9gceBtElHZ05++bescYD+aziY=;
        b=CZQI5iSG6D/Y2iNIdgDAXwqSDdroDbtJ1iN/RJYtTvhksVG9sq6KnU2HnvBJa04IAr
         qk76Lf+0f/2guIX6+wyd3a5m0H9rK/jcZpOEGQiy3i7EM5mCoH5Nj92vNy/KxVqx8fH7
         almmsuovT0IW0ucyko99/w92P7+UnViP2VRuK6IJZYKhPN59dUw3iOfmU+1MlDzfnDKD
         gDvo2lP+jmfPU6O6rv8jl/nv61b3xQkCfqBhJRIrauhuGI31wQVsMZjCyXNNsyh0WSD6
         Ep9vTA/baPePVRjVFPAdtJmiNbN25MBckQ8DSQjJYm3kpyjWQB+6CA6yElNPxbS9w7D1
         isfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958881; x=1784563681;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R8NOPLnKoo6QrG2E7W9gceBtElHZ05++bescYD+aziY=;
        b=WyJQjcMeYB1Vd2cqT7I1RIBf7/GzfNXsCVSHKHXGeM9/axHrsPpiFbl+mNhXyG4Rlv
         z0TOm6xRxOlFt+c3PuQS90eXRnt59yGOul+ssGzuAdczDZ2K3oRFaognqDLOGZgNZZLG
         bXY4I7LYhSttvE9SHROcvtcIZGqXMETUv+OdZRZtB9odgCKglU4cUVvKTVt1o8GcCLGm
         +hBvyfdpYgOegKI0s8gQAd2rNokR8Y21fJF8+69uteGGQWhm/rg8o2X/B8jPFG/d1FgQ
         7dhewR38TeJ6ezNgjqp7TnEaM9gTh5NY4DgwpNe/dEw9VoeaWzhJyDHsYtll66WCsz9+
         wQvA==
X-Forwarded-Encrypted: i=1; AHgh+Rrs/R5HOHj5b2FraOvngANMZtzYzaFlEOXq7CnOnedgM1SCuWucTV0bz+fUh0we9cEvF52bo5msgAXa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz45pGa/8LG0Xv7f0CJerztEYi8myof2pc2oRyfLpKFwM8QFvxW
	fVkINPNBr8eGYF3YsXfN89U2AmbPG1HGxbRpNxTbPVDyUPxBcB4SfvsNpD7PzhBak++2CPENUNT
	u+8Yg95OTr5o2BrS+L5s+FQ5azsqC2oTn1Tgmflmp2Lwtzu3p1Y6WR6AiuH/nkH2p
X-Gm-Gg: AfdE7cmCxSMLFzCPr7Iig57b+rR4EzWfUMpAkdr9S/nl4T7xMaFfyODKgCA2DBd4JAv
	A3tb1vU3AOXMGnFrrmvMmTvl2TdoERKUcpAW0ATbJXZNfmsGMXA+qgfMtOyEjJS2dtrv3N+q3Go
	1E09cnagByR1pMpJZ/u0JvuiTGWqh91Q1MtO1X1B8f7xXSRyKIOP3bJF0I6HGoXy8RcjqykixMZ
	IOqf6pMpEDV6PC8jrpsDpXZPDJeBqB+KDDfG/pPRmNW3B4+D7bbbqGAhcLAVLAcrrXgu4EzS+J4
	DA2uibEVOoPUuJtedvrXy4dW1dazM9FrLRxX0c6428amin5v977qmo8LoE8P9JrtY2XqDkRXbuJ
	KKCT9sg31UmlIteG4Hko8OmhvlYWzIuEQ8Rk8tQ==
X-Received: by 2002:a17:90b:1dcf:b0:38e:673:5d18 with SMTP id 98e67ed59e1d1-38e06735ef7mr2557214a91.36.1783958880879;
        Mon, 13 Jul 2026 09:08:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1dcf:b0:38e:673:5d18 with SMTP id 98e67ed59e1d1-38e06735ef7mr2557164a91.36.1783958880280;
        Mon, 13 Jul 2026 09:08:00 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm56974789eec.6.2026.07.13.09.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:07:59 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v10 0/2] arm64: dts: qcom: kodiak: EL2 overlay for qcm6490-idp / qcs6490-rb3gen2
Date: Mon, 13 Jul 2026 21:37:52 +0530
Message-ID: <20260713160754.1250988-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
References: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE2OCBTYWx0ZWRfX/aRreK3rorpQ
 AbgumoDJTFO82hjfww4sBZ4n9Wvs0z2LhwBOxpSRQPQ7DpRt3xQeIWApyykHUzpPvxhXVN09nzA
 TSX0p39Nid4igCcFfnY8J0Kl+tSmbHEYJW5VojhVx18iqo+6fMucmaGZf2S3LUZPoLvt/Ewlbs1
 9qD8aYkShHKuh2K/+s//ALh/BkkSEPZd3Fc3wDdMSA/ojXZvKmR0EZdUxDZR+pu9J5kNBH1t1en
 WW45ZnX6deDEj0rTJBlwTN9OJlp3wYmNMdvXPgSnYlu2jSVvixG66ugEg2Vv6/Xa/j9Bh8TXjVd
 bQzBwRFKCGjvMCSc6u7q/s/FGVRs3h4lye6p8kNLQDzpPQVPx9EqJ+SCMzxbL8jL88CqelqMPf+
 +021ZNpnDt5J9w40xh+GVqwqg81RoUDNyfC+8ZJHVaWmrPpmQGXRuD/5XQ1FdQzZzBjP5wgJLY6
 49LK9fZdSZKgCZK1SgA==
X-Proofpoint-ORIG-GUID: Nmds39V5CmjoXuIVzOmbg1J7PpcZaMUp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE2OCBTYWx0ZWRfX6Gjyms5Q3Hhe
 /VYIkIZe72zN2Wp/+8IoenHKVecn/pRpGsaC50+X6EP7A/LHExC3DTudRoc5belmzWC4FYyIw+Q
 nW+ngK+eCnklgfpTEG0RrzPzi6CmAFQ=
X-Proofpoint-GUID: Nmds39V5CmjoXuIVzOmbg1J7PpcZaMUp
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a550d61 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n0mgBXbVGTAyQq78KrMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130168

All existing Kodiak board variants run the Gunyah hypervisor, which
means Linux can only boot at EL1 on those devices. It is possible to
boot Linux at EL2 on the qcm6490-idp and qcs6490-rb3gen2 variants;
this series adds the DT overlay that describes the IOMMU streams and
other kernel-owned resources needed in that mode.

Patch 1 is a small independent cleanup of the two board .dts files:
keep the wlan_ce_mem reserved region (its /delete-node/ was erroneous)
and drop the redundant wifi memory-region override that duplicates
kodiak.dtsi. Patch 2 adds the kodiak-el2.dtso overlay and wires up
the -el2.dtb variants in the Makefile.

Changes in v10: https://lore.kernel.org/lkml/20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com/
 - Split the wlan_ce_mem retention and the redundant memory-region
   removal in qcm6490-idp.dts / qcs6490-rb3gen2.dts into its own patch. [Dmitry]
 - Drop status = "okay"; from &wifi in the overlay so platforms
   without wifi enabled in the base .dts are unaffected. [Dmitry]

Changes in v9: https://lore.kernel.org/lkml/20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com/
 - Instead of adding wlan_ce_mem back in the EL2 overlay, stop
   deleting it in qcm6490-idp.dts / qcs6490-rb3gen2.dts so it is
   present for both EL1 and EL2. [Miaoqing]

Changes in v8: https://lore.kernel.org/lkml/20260522115936.201208-2-sumit.garg@kernel.org/
 - Added a wpss copy engine memory similar to chrome for Wifi to work.
 - WPSS does not have firmware Stream, so that was removed.
 - Added wifi streams similar to chrome for wifi to work.
 - Removed this patch from Generic Pas patch series, can be followed
   separately.
 - Moved Sumit as co-author as part of modification done to the patch
   in the past.
 - Added some more kodiak's board variants in the makefile.

Changes in v1-v7:
 - mpss was disabled and will be enabled once the dependencies patches
   get merged.

Mukesh Ojha (2):
  arm64: dts: qcom: qcm6490-idp/qcs6490-rb3gen2: Keep wlan_ce_mem and
    drop redundant wifi memory-region
  arm64: dts: qcom: kodiak: Add EL2 overlay

 arch/arm64/boot/dts/qcom/Makefile            | 12 ++++++
 arch/arm64/boot/dts/qcom/kodiak-el2.dtso     | 39 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     |  2 -
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts |  2 -
 4 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/kodiak-el2.dtso

--
2.53.0

