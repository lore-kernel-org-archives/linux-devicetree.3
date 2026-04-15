Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89E23AE706
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 07:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239607; cv=none; b=ot6Q0Hcyh+ECxj7R41OdkiPcoA6YLZi6rqEMLL83IOQqrNl81LrWYY1eOps8gKiRdM4VJC8EP02tBFxaJWw00+QceTw5qH87LUYD9Vd6l7J9UmI7KsRaI3ZuKt0WAbvLmZy9OeLh3jWDyspVPHObsg+hsKi4oW+g+QXI3HXDCv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239607; c=relaxed/simple;
	bh=8zRTfEF4CehqwyJagoIWUHsJDEYqApSqkqfkf1mtDno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tk+DhqMHF//2MORXFjSJ4vQ8vYejlgwzcP+UZOwpMgaklWams/GgJVF1xr4xRGv2pzPdnmsdiCVAdQ/XQ2tEccSRkrISAR7JQ+czZdoE4YcdmasV7lBoY3+r4c2bKFmj597ixmJwGWI8WTG2/q6pMthufPQGOAA5C1iCm4nKyS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WbP23mwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMwN96ZM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbP23mwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMwN96ZM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4QUNd3759638
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 07:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nv29IfPcbVh38YsQRgaCkmMWuzwgC9dZJtGbM5/40Fc=; b=WbP23mwNcAaoitKC
	ht1X2v6EqhD5UEijOK0ixD/HVCM/DepewSwqctfOeGYv38qiODD7upslaT6qzXxt
	UBe0gKUu8tZnHqOe3FhtOg+EWibyd/IRu5X1D/2d0JUVyUscti0hvSgAvEOIRm2C
	1HzdNFJPInKaSZFyiPqK6vVCZGE+RkrYtd656TMfiOe7sAZ2JplHTYk6oSwrDmEi
	972HQlKbWVeOMRk/DiSgIV7G2hrQBbbvux39jyT2P7rAw7FAnqgJwhEsC+fmq0tu
	k+ow0mbGi+WWlrT6PLTH/zUbHcox3FZPYIT1NntJc7d6gJbXphvrxeZ0klChF6pf
	otByIA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtg0a7rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 07:53:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da31af14cso120290221cf.1
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 00:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776239604; x=1776844404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nv29IfPcbVh38YsQRgaCkmMWuzwgC9dZJtGbM5/40Fc=;
        b=WMwN96ZMuXthHyy2O15WKQWSJmJEFtd5bMNd1nejRfLeTdrtLKHBXDfTLSggbEh35H
         xoCcH+AGZrQfvR9zPkLlCmz+F1jBjbqKsyHX2nT12qNZrCGFUJW7xCPrZOOSq9OZx25y
         4d0/3SO1/bskU+BXj8O9fMTvOdzph+/iGJNc97aHllmj3u7mO+sz3jXyKR8ON/rXjrdX
         0qFMvqzwi1gNm4f+oeQUr3urJzEdCccOpc3yGA3ij16i5yF86D/ILGjadGLWKBWhoDaa
         SmgLFsZD+4/CGiJvqxVN5nydj5e7TfxY+m5qpBrIRw24YNMJxWzHjS2YNZRs1bBKsgdc
         Vvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776239604; x=1776844404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nv29IfPcbVh38YsQRgaCkmMWuzwgC9dZJtGbM5/40Fc=;
        b=dSp2FaN3D9huh+q99KzMQQ0WcbbBAIqpY/GrVe1szdHP2GZCZv9hRtVn2zw7uE1z/z
         itstaaqmd00bIAUhvdiwg8mcc0b3OkchHYObjvV0L3mgUVkzt/yGTUlNzNkuQ7WESQJr
         +krdnRqujRa4Jg3ot4Z0BQD0GnZ5Dc1WQNZKCsHIHZOxQAytqGRldIF+jZ4ZxbpSgwiw
         YJr4nFWWG7zgeA2a7OTb3t23nAPwObsW2kH1D0fIZ8ubYsFR31W/sWptD99/2Aoh92FD
         RGyOP7ofcOlJrw5IIviNLehhnotzJ7IYRYDRVPa0aA5OYuJMCRhS5n/HUy2BculD6jo9
         +qnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+T1rirbPv+2lF+ezsMF02/4NQQ1sv0XYSUsZ+mrLw9TP8uLlEh2DnFMFTy/Ox1oEVggF2th0c0cffq@vger.kernel.org
X-Gm-Message-State: AOJu0YyL28KMQGCyiIh+wjlODkPKqsWCvLAgV7fQFyWBCWX/v0yvQbkY
	0DXWntEKhsR6UKJq4S65RP4dz4Wh2E3S4Q6wrpHRd2oa+FqkVjpuGJvFb1Rs+GtBlKL3iZtEZaN
	i2cCVdq2vFXPmj16PyKMZSClgCVLmBOMeKIrlNElg2hv3X7q5JdbCxCM0w9MvbI3B
X-Gm-Gg: AeBDievbNabnCRWpTJKVMv53cizXavvxNLAYNDww+u0H79t40ydDZ8xe66YdPS7X63Q
	e06H4iJa4sx+NZNHV4IC/ycR+WyPl1og/+azUaG7ZDThJ3eOzcUEgHKsMydB+kHmDmm2KZFSprD
	Iwledv0jBEQSksQZGTcHboklv/Gr64NuCtX+mT+AJnySILzXD1hQ2Ma3sOUZ8mSlORFFDkz2Bf3
	qe7BbfMGjfJufWs7TlkKLoz1TGbEGQhIeb1edh9K/iquJWzPDia8vLyNc4BlfiX/mo2IDTKGs5C
	f3dMugy5rY4ZUssPhz6fg+1bsxYWj5DlSxrABc4AqIUoQxfmgMH6d9zu5YAC8W+vexC3lnJsbX1
	4SWMJpBYlFnAkeuTdJDvsu38QHPOiBVa3zXw=
X-Received: by 2002:a05:622a:598a:b0:50d:aae1:7070 with SMTP id d75a77b69052e-50dd5c12803mr291845681cf.48.1776239603860;
        Wed, 15 Apr 2026 00:53:23 -0700 (PDT)
X-Received: by 2002:a05:622a:598a:b0:50d:aae1:7070 with SMTP id d75a77b69052e-50dd5c12803mr291845381cf.48.1776239603441;
        Wed, 15 Apr 2026 00:53:23 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0e7ef99sm19334975e9.8.2026.04.15.00.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 00:53:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 10:52:57 +0300
Subject: [PATCH 2/2] arm64: dts: qcom: glymur-crd: Drop forced host mode
 for USB SS0 and SS1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-2-409e1a257f1f@oss.qualcomm.com>
References: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-0-409e1a257f1f@oss.qualcomm.com>
In-Reply-To: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-0-409e1a257f1f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=898;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8zRTfEF4CehqwyJagoIWUHsJDEYqApSqkqfkf1mtDno=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp30Phb1ViBV1sV1AgElOG66Uq2HBjqTs9ATkoa
 eeMYnnRyN6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCad9D4QAKCRAbX0TJAJUV
 ViBiD/9yAxn2sfAtI28hQfMDydBXe6uPYBp3V3Ns8CgWlaKiBnRj2kMRfeTTzcgx/Z8u4fCgGes
 aNb4TOEz2u2RugeZL0OeJDr0MN7X/Uo/Nd45PKRC4+lxb+N55WcFBP0yFjwR5dfXldInvvcmksL
 p7efTtfw5gSFvAUjInvzf59zACRKn32k3ib7JVJUDg1t13tBTxxFXP7i4Yrgji5qtfhQHMb2lqQ
 nADdUSCcKPSHQJPJYZRjXFMG08TCrfmzJwFc/cfSbz8HBS4nvzvGv21sVid0AtJKwtQZypU5d5H
 lnJ627izVGRLdPczRxTK9Ydyl05/eCW6bBHh5YEoh5H2oySfjcWJDxAhw+9Lokz2Uiss3wNHiwA
 m2+F5PGrWvrROsic0asesgIlYk5tgRsIe17Wgi8iMAm1Hq2oxzysjeoNHJxfNZNm6lPd1RTmNCP
 f+74unhW7y06GpliFy9OIVqy0nslPCmadg5XQtbrDoL6XhAnm/KMdctN2Rxg01/sEfhX4xWZL73
 6k09oG/kZ9EwKh5KSpMYqOrg5ORJEtYeZUvuhjYVi/ntUXypPzSxmIMVBPSSi8fQSYLg7DYYCX7
 pEmB6W1iCwEYbxSjMGyioTHm7+Qrxo1F/I2u25bwImkofXCkR531SlkXviKgfs0L/xf5jSs1vIo
 S/SFJMsZZUSlflw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=AszeGu9P c=1 sm=1 tr=0 ts=69df43f4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ub0iOiB/G/eXZwGovfl9ow==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WUssqNGjtvDNWL2Wm2oA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: JeX_bTQA-zlu7TGRlCJHUCW2SgSPbKaJ
X-Proofpoint-ORIG-GUID: JeX_bTQA-zlu7TGRlCJHUCW2SgSPbKaJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA3MSBTYWx0ZWRfX5d7T26/PMcd1
 ubxcmEAFmddmQQzqrtGSsfOTGVEh6GwHpWLoGa0QVDeaBc1ORIJCj5Dj6hqD07qPlmnMmGj2eWK
 smYzmTMBuSREyfYyEHqrNIo4umlL/Jf5g7LrTUnHrKE/VMKtnPfQCxyxcyqw2zmqEAtHMi365R0
 znJUErsu74RUXIRBVkPCEM7xZKFHqJfbHWO2Pm0Rw9AMZXtTLHDuEPySdamEuLVJWP5rJrADqW0
 byu5hn2EgljwdFm7tDXh4TDR9p958isS8recNlXVvoiXBqZnq8hXa5iZJooy5zTl4M/srH5Y86e
 tUQxKR49//PQ2r1bUNSPRhKIc/YnLPgT9LFbYGmvou3Eg1KcHhINDSNORvC/yIHM1YscoTmPgcc
 6NV1eAokVHqyJB979kKNiFnCph4VB/kWnaNI3Gol9WcOIfNjUJ9M2GgMBk3x59LvepWQr3MNAxu
 8dVo/oisoNkI0zcUCrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150071

The two USB Type-C ports on Glymur CRD are dual-role capable.

Do not force their controllers into host mode. Drop the explicit
'dr_mode = "host"' properties so they can use their default OTG mode
instead.

Fixes: c8b63029455b ("arm64: dts: qcom: glymur-crd: Enable USB support")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 35aaf09e4e2b..c98dfb3941fa 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -322,8 +322,6 @@ reset-n-pins {
 };
 
 &usb_0 {
-	dr_mode = "host";
-
 	status = "okay";
 };
 
@@ -353,8 +351,6 @@ &usb_0_qmpphy_out {
 };
 
 &usb_1 {
-	dr_mode = "host";
-
 	status = "okay";
 };
 

-- 
2.48.1

