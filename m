Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36545566C6B
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191053; cv=none; b=tDp3qZvybwCP+pYa8X2S9ZhmFWvrkOC23P7IHiQnAESV97MtMBwzz924VmQji0UKQTbtkxPd8O4wTatZBh/nl6Bm14Nl25Y24CyiQq1A5nTS8dq14ZSybDeQzEitseWw2WNSqVCtYowfwHJseXj8+XwQAP8NWy66RNGOoNZWBMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191053; c=relaxed/simple;
	bh=sVxADz0C25ROnrCrpEmG+TyV4MYDoUxBaj3hbFnOil4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7iJnCgVy2y1FKek0l5y7pGdTfECIpMqs3jOurlOpjrkPlVNijWqolJ9AiKc+Nt7HxvuqNq1RDFLpD6lC84o/CFci/i9NvfsJQek3XAZxZtYNh69dsm7MPzFdD/XjPhDB5/6ZgLPZ2XoWan1vHn4YVoWNLi6nKreKfPt0Jy2rSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7DY+/41; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BG38Zq/q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7DY+/41";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BG38Zq/q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTsrn2470361
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=huy1ZlkvjQUDRocv5BEJkQD+
	Ncn+4k51x/M19LB9SHU=; b=f7DY+/41EHQaYOhjcEMxAiuMDn6Pit45LdQZ8j18
	31CgKQRovpk0yhs6FeVNOsdroWcRfi9p3BE/GMQ3nSFztSO5g5zXwdIj52+mzdN9
	eSCsK0MHBdtbLZ7Obzd6MLoujCDQrwv4/JOJBmI6ydLG+k+jsb4waP5D/FV/lB2h
	/RcPJyKZSzSW2dEzaN0OB2Qcgk3dFCm3KwhDQT9N2PPKxj1rW8Lk+lE/0k4m3W5P
	KDv06xl4P0uq59U5aUGI5f3pEWMulkGkaOV+uMDll23OMoTBLoRM/RRVC+cQKg+R
	qtXh2ddg2Z1m1kDmOY3SmaOSO+cWJEsgX2es5L9Wbkij4Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv1kjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:17:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-32850005b6bso1543648eec.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790191048; x=1790795848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=huy1ZlkvjQUDRocv5BEJkQD+Ncn+4k51x/M19LB9SHU=;
        b=BG38Zq/q/HbrnT5KwrLyV97ru2yQMUEOjNH1DPsEROzt4jq9MSG5orfzn5PVfnAUA8
         0meuA18or61V4wKnq4REXIyv61SwHKA2URoUJY5rbS/V8qksa95FoaIlQZrq6awZBTBV
         6kN9AzzYmd3fqVY1XqLySF5IBACR16DEfg9nScvk+vOaPsL0nE3zWYOGrXlykr+udLFA
         ckScN19iCpxBxNmlUbV9MAmQ8mkqob4BkVKEZtIShKvVXU2iv5pUlDN/xl3u4b9KoxUC
         lK0e1AFIcBZ3DaiLbxL6yJ0K4eQDaatvcON8c5n+5lwPCETIrQcaZ9hmUga9uQZEIZOp
         xhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191048; x=1790795848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huy1ZlkvjQUDRocv5BEJkQD+Ncn+4k51x/M19LB9SHU=;
        b=z3N14C2uiyoF1ij+85uUUg0z+hNb/S9W2Pa8gsrpYQtNYvBmaaVmp+LWcTGxzw1vT+
         xLGOrtjaeoVy6TnSeFTFzL+sg+ATq5C1g/Tg5CNPqo6U2r0u+pf/481ic4vV/c7VjvRj
         qhmAdt4mIdN841c+xcwVkKT/20tGwQd27ZtcTyq3Y3CQrjQLX9n/u7+ioam/0C9Yhd1o
         9ALufPKAxbxfSWHePQ56YKLRQ7Y7abcfsD+DSYgI24F12CRc0vqsxNMUVKgMp97EA8at
         H4MZHRZ+SmfPULAcAfSjzsrqaXirf1x1GGxzS++B1W7cZIdpprT3mKpphyb8EJfb1X3s
         JHbQ==
X-Forwarded-Encrypted: i=1; AKwUvByTClsLmu/RuBmH/6Fn8CSA4gGiXfP5s+1NrXqA4JDZSodFNFXvAr8T0DWj0Hfy77U96H2+KlgpZjfI@vger.kernel.org
X-Gm-Message-State: AFuF++muyhQH4cdIdCl4s9hQBq5NVNYxE8n3BdgR6vA9EEmQTRfAEB6Q
	Wm1Ijy//JoGRIOeixTEh2OIUUHXkDYDLjHJwbnhJMT6OiI3K/BHPcyplinDZPKFfV63PkwTSA2p
	6m5YcB7bn7CyDo2XObSH8GOeTAL2KUvKz6FHNc9ZMO8wg3+pFzq8blEo6TqiKB0uF
X-Gm-Gg: AYBFou2DQpF8rFYEcA+t/UmzqEUNAxi2H9Md/PhKPjTfGnPJ7iP4d7L0Z0DhGzVGg1Y
	pnIdeFBt/kn2cNVNyjTxJ/Btfh5XlZMvx9E2st1fgAtB+UrKrow+1ex4F5g+WCruCSq5AzWypg9
	tufZCV/fFb3iUnYjIYaMzufrZZKycjULGSl0PyOoUnSgpodekQxJ21PtotvRnutuc8znWGkPLBf
	uYKADoip28ZNBiQV4dLq61QIrz8Q6TBaFteyvzcTFVRx1N7J0/X3qwmwcUlrG5Q0pCsoQYMcKIl
	E0oqEOQd9A0D2QzZLFEpzDxyYOZMveizS4EeLz+IycLUqWPrEmOsp16MgA3cYEV1RxqBP/Bs2BH
	BUxK9IgIBy/5aVJpUBGPqAzCEgYpjL7xK/Drp
X-Received: by 2002:a05:693c:638c:10b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-34004991ae1mr85201eec.10.1790191048267;
        Wed, 23 Sep 2026 12:17:28 -0700 (PDT)
X-Received: by 2002:a05:693c:638c:10b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-34004991ae1mr85175eec.10.1790191047522;
        Wed, 23 Sep 2026 12:17:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258204sm6486941eec.11.2026.09.23.12.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:17:27 -0700 (PDT)
Date: Thu, 24 Sep 2026 00:47:20 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Message-ID: <20260923191720.7phpf34zgr6jfzgj@hu-mojha-hyd.qualcomm.com>
References: <20260811160835.2968717-1-mojha@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811160835.2968717-1-mojha@qti.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3NiBTYWx0ZWRfX0L1s7CslL9pc
 /4s832acKixWuLnLEbDMjC2/laFVIxTE5xeHcap8crigtW6dnzYgaUZdKGf2KoVfFrQSUgEF3XG
 S0KdwpJq/T87dRA/2r54AtjhyZ56CPhNeV0OEVKmIHj8xaMwprak4eXn3akW5IfXgTbqXDCn2p5
 tfvwRG56AI71erVriMSjdl8kCoaTyzuLrmmiapMx4fNHXOmgtq8BiPfVKFQSCbPJsyjfTvS6qHm
 Rp37sPh3WY4detRcmA4zVtB/7abAONOm7I46StTfEPx/JLbAPK7LEoeN2uCudVxm5hLTDKjtCqX
 lbDBW/x6T962CfGQcDCBgm9LqVnHf8oSKrrtgg9+4Xl2PVa1wd7cyMZ6f14ir6ChYqIZntyPCqg
 n+gYCUpzzKHyitPM4S5i9SZ8OU3briWxdJ2ok40wwHvGYKGbdIqpsV2JTeuOTrjo6K8PGdioBXo
 A4MfYZAdYNf+G1pmZcw==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab425c9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IV0E7ZXFCpU55wPcHFgA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: R4jyBuVfsZ9trrQPB1e1C2F_rF9CkqD9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3NiBTYWx0ZWRfXyeiwlD0fnwsW
 g0KNPr6q/+FKD/oH9LtuFEkr2kOofZ0x+XEVzYHBkmXziXWNIvGwKbfAAm7bVd6aQ+LvUoYFaoR
 +ay06COldFvjWUJcDPB/Yz5ctGTo1Jk=
X-Proofpoint-ORIG-GUID: R4jyBuVfsZ9trrQPB1e1C2F_rF9CkqD9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230076

On Tue, Aug 11, 2026 at 09:38:35PM +0530, Mukesh Ojha wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Document the Synopsys DWC3 USB controller found on the Hawi platform.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Greg,

Is it possible to pick this up when you have a chance? I have a dependency
on this.

https://lore.kernel.org/lkml/20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com/

-- 
-Mukesh Ojha
