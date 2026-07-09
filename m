Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D615401A13
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587148; cv=none; b=GMeKez0xcZFhI1tb0BkWusv4e1xpdkvGdUbs1LhKoiBF9yOBnqqkG7NVoWrPUMrhF5npdNfZ6AwWSz+uUSeM2zJi+ACjcxq8W2SWhBfRYNp8plJKTP2LBuYgFlXs5OhlTAezrRHI0mRXvHMEZ7L1QHBn939/VIY9HVrohjwsFOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587148; c=relaxed/simple;
	bh=Ggf6gG2tQt871VFfdM6zsLoc9sXjGV1cYiDiBXb14ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nX75joKfvMP4P5n4nqRKEJX6bP1m3JID7LkpyFRlg0YETXF5ykkZ+kde6woOFZcdGopArt/AUGkSjXtTvrqd4WMbVTkMG9XVD5VUqmqUY+GumJ8tkl+mpQgC9hwPPmtCMbNo7p+/sC5VLdRxr6CWPQ5X1J8/1jfiUE0sGZEGK+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekL/tUvM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKxtnu4l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekL/tUvM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKxtnu4l"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669602cq929553
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/eg0ufxySEh
	mH1BBdl6dlSLKBXD3YOmq78145ChoiRU=; b=ekL/tUvMegmhQqrgFxW5a6+pTab
	bcd2wHlHWlsI7AktLWoRsXPxoNg/YtaRq2n9zpifXQQ8oeDFLcOF2UULQLA4FrVs
	gCQeULVzEjil14PNQ0CAgwe6nL3olNykpTxyrRmbBo6DbJJx2UjyesuZszelApD3
	oQnaJPqLSWmzKbEPZ/OMdfHaW/u4xyLQjx+bpMDURCDG9juPZiRdhOLv8UJ/AiNZ
	DONQ8/DDj919IrnnGSk3d7zvRZPqq0KC9s7K+0lC9iPbdTvhMb8mtAoqZtqub9Nf
	jTckUKzvsw6h+9Nx0Spu5QupYAjMRUwgtOyqRRVNw9OJEdA0gSSKH2ActoQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418h4tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:52:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so1740412a12.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587146; x=1784191946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eg0ufxySEhmH1BBdl6dlSLKBXD3YOmq78145ChoiRU=;
        b=VKxtnu4lNGulkeFiCWy0s+5pqXIgydwt88rV3VUTQfAjRF9opa4P+ngfPMHvttlpNE
         levY+8VoOnyTQLK9wo4EZoZGsXTOl8RhFs3nLC8/Sfl9PJ1tDkLGaPWikKqgbCvf1PiM
         co6OpNh6iMvNAvCs08ZonGTMorNpkoMVbvSV0IBRzl9zSzg9uwWuyfLb9K+xZzOK8291
         W/KIebhNCSmBZ6mN0kxJ6rBbuzSWspwnfRb10MVZV8JRzC5u2rqHjQZRWxEI4FbOxEkh
         IaDuEGTsvI2c+36pG0p/YJnR7K97WKRf+X1t+0D2DZ+wZhKJj345VMOj3pc4h3hFzP4h
         bOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587146; x=1784191946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eg0ufxySEhmH1BBdl6dlSLKBXD3YOmq78145ChoiRU=;
        b=LL7mFZxw22lsvIwa2287QXum0NG1IAw/DUza8BGNZSPC3XRunge5Ub99FcE7ML1aGc
         qro6+/XxOvLDOCT+PYyuLTfHCmhsS/mm59u82psX4VO86YgwHc4Y4DEJeecpe3V1Gmgg
         eT4ZWlMwN2Su0CY5tm+e2W8qEol1Crbze7tNMYiGXjG+jqTeQZZvMne+QqCoo7y8zzbI
         FV7NTthV3YHkm/cnBfu4wI/Vlyd9ZfX6aXUC1lVHORcqXHuricBURcNFr3vqSkgq8ylg
         VoviB0NQcL/Ku1TY36L2Xp58MLkLZYJrjMUR5V4j3sCZY2t1Pqhwb8JmyyxtlYDxXzL8
         oT7A==
X-Forwarded-Encrypted: i=1; AHgh+RoJQLqPZJryCT/Lsoo8NQtrWSM7UDcEC7x9Q/N0FuPSX09kGFXiw8AfFcm5ZqpmtE5ZoviRrpEzj5Ne@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrgy1pZhO+Ge84W03qRC/6Um4tbDbSSfHzfe9mfLdViyqtPbaj
	uqe7qOJz0siRUuwHm/zyELUIhxLmFiHstqh8JTFkRH3chZsiPDvA2K3Ahw83nAdYONTfv+97UR0
	NxF1E4RSMqmr4BDDG8I4Xwkq556AXu1HFpEMtbYvysyV6Jy6cFuuUEmbXMK+NY7MK
X-Gm-Gg: AfdE7cl/qIRsVMHBwfCshK0G3vb1ciSGTk7z6BYS3HPJHShDJ/XqxtAtwkUzuPQpjkX
	kdW0txzzPnWysauOsqihi2waAcT3MoQoGiNbrlKlcKq72PWc/QI7Egy9H41e9Ynt5r0DgsMOcvi
	RcnImZXp4ox1nwPlG37AzfUdWHiMMNFMxaMUwJezb/2TUCXSMjeoQlVHukMwTm14fg3gp94LOBG
	pWQMbfcyecjxns6N/z3ymJESxTtEHqDkxR05KMjgkSA+kz3ES2WxxQvZlbG0QFMispkYYFrUmZO
	YB70HcRWWPHPS9UGBTehKyNz/7+vaowQTkKhHD0dhl2xWGRpBoCogTac+eqXAyFGA6f4f864FLt
	VojoMa6DKO0KH4Q4+r85EDbA20iMOwpwmCrkTDD2vF2HW5xRp7hAJN6G4+7BnQyVqBArhJfE=
X-Received: by 2002:a05:6a20:d499:b0:3c0:9c19:659b with SMTP id adf61e73a8af0-3c0bd1cbb60mr8351576637.67.1783587145864;
        Thu, 09 Jul 2026 01:52:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:d499:b0:3c0:9c19:659b with SMTP id adf61e73a8af0-3c0bd1cbb60mr8351531637.67.1783587145427;
        Thu, 09 Jul 2026 01:52:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b25204sm3460027a12.28.2026.07.09.01.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
Date: Thu,  9 Jul 2026 16:51:47 +0800
Message-ID: <20260709085149.4072181-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
References: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f614a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=L3lYWtOMLQTLw7epnDkA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfXxLmE3I5+bOTF
 1f9F1LpNFwj/Ow1hHt3UQc1wzTzpRHkZqbQ9dV0NrNvsVRVX5AxWveynXz7Uh4iItshS4eshxID
 Zp3xSg28Y3y2R/sdR5exrf7OSZD5BOtfcOThAHv6NNJHKtIcIIRJQwUkO9YvBW/N5XvxQAFcxOF
 lyBqhwH/q1ADsYFPsltBrvrYWYL0kf/b4zlQ3dU62ZWM4400ipNYOWkvtqyo77c6KDwPZX0uTLc
 TO/G31lvTYjV0oLYtCbYXhwl5HANGI7rkGtuDrWmpF/YgfvcssuBoAjhbs5kRQU1Y1yLMFjMfIS
 4cuFQbJuHBrqGK3daMkH2468f6rmXx2emjkGkgnzE7pP3YktUr1tREQfnDKdYYINELfSIzfM/Hm
 AVrYB3DNbqOGGpFCW02wKKD0E42ud/3G8jUj6gPOcBVxG7HG3MusTYDKIZfNJlC5x1tQDaZ6s+b
 cAsNQbKSNX/qDnHZQIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX6cBVcA5GNE7w
 9g70Qp1klZHYx43tOO+iRpt3WI7Lp3cGu8nKsDqF55pbKITy+c6/zLmZLopXbYCBbMqfgZxJh6I
 J1ftycGEBQzLO/3BXdOKt+lA4GBeKwg=
X-Proofpoint-GUID: eia084LgH0VDrNV3iKNuNp5FZni9ed_5
X-Proofpoint-ORIG-GUID: eia084LgH0VDrNV3iKNuNp5FZni9ed_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090083

Document Always-on Subsystem side channel on Qualcomm Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 8eaa04431d74..e778fa3a6c92 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,hawi-aoss-qmp
           - qcom,kaanapali-aoss-qmp
           - qcom,milos-aoss-qmp
+          - qcom,nord-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp
           - qcom,qdu1000-aoss-qmp
-- 
2.43.0

