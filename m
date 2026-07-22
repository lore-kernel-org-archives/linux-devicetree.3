Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4047FC8CE
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714761; cv=none; b=ILfnGKoTSJylgDYNH2s2lIbubj+vq9qNHlHMZXSMCzl8XQlMPbnrydnQ2RYCrKFTHlVAj0YPYXGd8pBzC+9Qo4DciS/RkaDvNw2+UYIEcUUOZ9xDT8K/oi33Ex3Txy4mIuhM0WcftYUWbrbmPKwivctvyY1KvGW6ftHBjCelMzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714761; c=relaxed/simple;
	bh=TvM8/Otac478JXV26Q4663S+m71LZ9oqVUnSWjse1Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIN+MeyxtN/ru4ZGSpMA5xTzH+dcvu6XWanNpfZgjmkfNcF5TEhwvGczPJYlNE4HevVmHnjrx5EYq3O88vMuFMz4FOZQX8Wu7vpEyJ21i+23/0l98+rCfyRflM9miJjJnNIr3Su9D9EPKJ/RhaUjqbSCh8eE8kagB+tIVyYzrJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NeYymHx5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KyyXSiKc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NeYymHx5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KyyXSiKc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x8291400250
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3y0SFK0V4UHyO/2Kx4oChwG3
	TM8bZ6zhVkNNhAztNpQ=; b=NeYymHx5387ttPLpaEA4iXFw+8BKDonR6Z6ZE07+
	agLO1S8sBmTEFnlk6GAL9kiBNCk7DfqQxEA7Lk/0Abm4RFkVBE2cf7K1+kf14pAq
	WZVe3XA+qewTdHvrLM3KZkpJQAJSq0GiQ4AuTg5Y69qQsK43+2r4aBGt9mRCegoI
	6NRm34tQoQa6qYfuJTD7kkDanOWvUG/F/ivmAMWqrotyrIEpddcPEqcU0X5+hWCh
	DXiLgcfPxKBRnzJv2g2cbhI2Sx6Z89GRQ1agkgKkuQ5URhdStlTvQpVrm1Yn1BQQ
	aCvbihoTw/57liAOOFBSzLOK8ceXIx/4/hWXza/w0VeMCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr8390yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:05:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c12e43b98so241014551cf.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784714757; x=1785319557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3y0SFK0V4UHyO/2Kx4oChwG3TM8bZ6zhVkNNhAztNpQ=;
        b=KyyXSiKcO6P//WEyWt1gVefkaP004gTHZq13PAyR3EmakEs45bmh7REil6KQIS/uVA
         YQdTuo4YJTNxCDSkD9ns7M65IGQ1QyveRjLSDYrIzQmIgaVkJQwwhZYgam323oRpD68u
         U3Uk90uqdWbZteLqI+DM3NG7bU/MVRYg7cNDHEyZCbhPZ5jqjeOcWvcHoQwPIIK0T/Sf
         YZB+3HQ3CluBj8dJd1kbrDVa+P81rEAxC6gG4wCxvRDJC74qVphkuOHCV92Hqr5Px+3X
         TLGJAlSBp7XSfAoD3sJnsje9pxYG8MSWlpjfEu4/80VaZCjzebgzvGo6J7EgJaE/FmmO
         J0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714757; x=1785319557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3y0SFK0V4UHyO/2Kx4oChwG3TM8bZ6zhVkNNhAztNpQ=;
        b=iKLN+/buWIEBYSr+fFlFuW/vsD2LpHZkl/wjP8fY8nb/iuxJ1fSPPQrpBzvL2mdjDo
         aFdB+2uebQ7+e8eT6lZPFFyiX4//P5J/0WujjDyoUSvrFU5IiDOjhUie0ETCnTjDSSQ1
         gZ2ay4DuAmN3VFTyUOYGrKBHs474oMOomdeVz6iA1ciNBVVOxgSQ9PS7XqL2HwpkGujF
         3PxYWEmAkK41qF9o0w/YEPZDlcVtaKcFsQfuNriDmw1+1JnJrPFWZTfllmP0twlhEL6f
         UU6GOfE+ckAwaWao1TNxqYhA+pCPVqknplPIrlpXepmWwXnSxPBV3AsPNepbDLcyWU8I
         SjEQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYDd6GbkhR9GrrRKETFYqG8ljojs1bHu1NSPhmRAsXjtxsLQOK7nlaDUEz/Uw8ALBkoV5efEhzxu0N@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ajO2AKlFQqhpo/QSSzdkdHQKCC6Y4u2KQCBG3YUsPAO3ALG5
	w3W7ZviuwkmXRi5X1r8MA8XXj9Hi93wbsGz4e46LN7L/CoO3La38aaM08UlukzvXEMOg+zDLk74
	QcKQtM0UGljq8uD9okImE7tslLQaOHMgUDh0b1JNcmTi2177GpsMvjducwRsvNj8qCVNVGgny
X-Gm-Gg: AR+sD13JNeD1jBu9AtQ4e3xjpnCiG0jzz6KaScxCZo/U5DOVywV9bbw2ET17NDQF4Hi
	QgC7fny19E5LWvEZJ3k2n1pKCfoHvDc0JGs+BMkRnIqwiAP58Cj6fY9QNcoBuQDO3qogUN4H3w+
	EEL1HtH5kJGBX84Gtr0K0JZfCtqO5G+g+kr92+A9nomWzimZwrYKNEc/e8Dwf4MOs2Gt9GJm7UD
	b78Hy7776HyebPLBA8gLBlgXjHCvgt00CjmVrBU2iANvHrSeeSkHvPrWm/e6l1eq5T4s+ZR7Mxx
	n1yQqjYEZSpdkX5dcDB8liXAjjFXlrbnUYw38Y70m3HqGQ29Wud/+kQnemHoi0FnHyNKc7YPb7w
	hCWleyLo+m0YoQwI=
X-Received: by 2002:a05:622a:410:b0:51c:8fb:fa45 with SMTP id d75a77b69052e-5213e48affamr215859621cf.58.1784714756474;
        Wed, 22 Jul 2026 03:05:56 -0700 (PDT)
X-Received: by 2002:a05:622a:410:b0:51c:8fb:fa45 with SMTP id d75a77b69052e-5213e48affamr215859151cf.58.1784714755716;
        Wed, 22 Jul 2026 03:05:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956aae132csm38827275e9.0.2026.07.22.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:05:53 -0700 (PDT)
Date: Wed, 22 Jul 2026 13:05:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,milos-pas: Move
 Eliza ADSP to SM8550 schema
Message-ID: <pwcdmgmfz4e2miuzqx2mnvovk3gqy7fkfjskte5frwydhvfw6y@otf25vznjv3r>
References: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-0-e1e98ae15533@oss.qualcomm.com>
 <20260722-dts-qcom-eliza-fix-adsp-binding-v2-1-e1e98ae15533@oss.qualcomm.com>
 <20260722095149.0C9DD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722095149.0C9DD1F000E9@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: ZmO_W4HN1S5RgD87gJQCaZ3s-v1__Scy
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a609605 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x2fApNMNvfgBM2Ni8FsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ZmO_W4HN1S5RgD87gJQCaZ3s-v1__Scy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA5NiBTYWx0ZWRfX+UprbnDDH9uB
 YczrnbVpBAay6FaJLYUm3lcNwD7J1yhj5fxvO93AFF8hF3nXzrPMiHOkufZkwIyOwt7/ArQBfDP
 10tFzbxpM3TueUOoi6M3IQlOG4npuNsy57cXbdw/fj7huh0lUZ0ILiOa1hhaZaBF4VF08yaZudA
 SC9ABqy1wZx7nd7Y8SOSIXIbrFMpFQe8kOlXM6OWu7i5NREVRyqUgIDiSMnTm2TCPCm4WXI69wZ
 VdOYg/yg2aP4SCGNRKP7mGqsymqpMW0lLftntlFbutNUePWXHZVUq1IelPAP1Q0YYAKlK/Gpqtx
 m4ICor9WRF4UqH4VzWR9Uk7TkhISFA7iIa5UCVne9MRrMNrYOOVgtnvDpz0D54i02NFmVjRB2Vg
 wko3Eg89gmnon0hUQCnKFND99aD6Q+Cr1LdUm3QVviUL7DAGn7oHGjqw9PKqAiuxkBb9CusKPWQ
 Gr7N8ZQboQCFmpsGeig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA5NiBTYWx0ZWRfX/J70LwZKx/Eu
 oE9E4RSdPsJUiVpct0kCc4cASPBXFZ2aFmRoFiIkbUF8C/LEfviuAmlsXMDnb+bnp8FRrGBrFhf
 aRU2QnDpQWK/rvuPtLcawYNNyq3/oxc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220096

On 26-07-22 09:51:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Moving `qcom,eliza-adsp-pas` to an items list requiring a fallback breaks backward compatibility and schema validation for the existing in-tree device tree.
> --
> 
> --- Patch [1]: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,milos-pas: Move Eliza ADSP to SM8550 schema ---
> commit de0588624107f153559b1ce48e9d1f56b81467d0
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> dt-bindings: remoteproc: qcom,milos-pas: Move Eliza ADSP to SM8550 schema
> 
> The ADSP PAS found on Eliza SoC looks fully compatible with SM8750, which
> can fallback to SM8550 except for the extra interrupt ("shutdown-ack").
> So document its bindings in the SM8550 schema instead.
> 
> [ ... ]
> 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > index 2a4c527552e69..e6d81a38fd1c0 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > @@ -29,6 +29,7 @@ properties:
> >            - qcom,x1e80100-cdsp-pas
> >        - items:
> >            - enum:
> > +              - qcom,eliza-adsp-pas
> 
> [Severity: Medium]
> Will this break dtbs_check for existing device trees?
> 
> Looking at arch/arm64/boot/dts/qcom/eliza.dtsi, the compatible string is
> currently defined without the newly required fallback:
> 
> arch/arm64/boot/dts/qcom/eliza.dtsi:
> 		remoteproc_adsp: remoteproc@3000000 {
> 			compatible = "qcom,eliza-adsp-pas";
> 
> Since this schema change now strictly requires the items array to include
> the qcom,sm8550-adsp-pas fallback string, does this break backward
> compatibility and cause schema validation to fail for the existing in-tree
> device tree?

Nope. The only user of this compatible is the eliza.dtsi, which is
updated as part of this series to use fallback.
