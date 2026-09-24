Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E010381E8B
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230231; cv=none; b=H+22RvmcGSZhlNh2Ort3sFY+M5fXDxOnZ+N/JUI6gGbSBT3/2RWG6HGSVWUoZQiavxDKZHbN54AIVSoPNfNw1Zp95L9kve0LflsOljtlAOo0E4KWK9fXJNzW4+p32BdD9K+onUHr+qjG9nOkqThGR8bf5mDQli2+UOz0odlS9uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230231; c=relaxed/simple;
	bh=r93Jb+RRci5KjslpMwSwutEV/c/USqhXg7qpdeh+1sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S86jm902ecbFyi1De+YvyxzdSHM8IXbVxoxaY+ydqikqLHyPSV7IQpX/ws/QZiDlL4Q479me1hVNK5chlYgTyu9MaXBviyYOmRTy3tlLicgFfOT452xJLEPTNfNHw0erEvBSf6Yq+IjzEY05WKpcWdM3mDjy7Vi4WHyBUV43Ge8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzZhDI07; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5AEHQoj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzZhDI07";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5AEHQoj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eANk567589
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=; b=bzZhDI07zkIv0RJk
	KFVzL7qcXzsEHyoICLuGCy6ORCMhcccHjwrImh79sAxUta0mG1V0Baf5bSt6OVio
	xu03OP8xXgcbyP4zR1d543hyMai8mWFPR8T6stRKMBqSNfLUgJDnzXKY0of+/gvo
	dkORfrsKDIOLRdo7PpmxUL6AbwgapK5DR1VnbuTasG05P3lOxhHlc41xUYlRoCIR
	u2d/QiabYzSgxffonDOtwpqaMTSCkHbqiZ/PSGy6FXYtTbb3mMH9oYGiBllYZWgA
	SIqz7epK7FroP3Yt8Ct240LIgKtkWJWfAmeXqx/UCP3lv3ncVIeDPrMqYqAgi5MP
	Ug4u1A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh8c73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:10:29 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1416f32fe11so2379250c88.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 23:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790230229; x=1790835029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=i5AEHQoj5ko+Mt7xdLw2r92QEmf3hep5HnP6z6ERY/p6c7+1E5oNM3hw4BArgG/Dgc
         zplNCg8tfOzivjRdnF/Dksf/wQf4GKfKLKjst2YHSaKVh3ft9v+mTO0gCQTpGiOxN69M
         HmBPrtxp/vCKoBSiAeoMOAD1CfQz5fJ1Dw82z5oaeEXxJhcqro+bJmm59Pyv1R+Vaa3N
         ELru/bgdLQFwS+mJMiH2k458NPgwevFsHDeTttlX0BVLG6BmbftIygaKqAnX4MKn+znA
         QSh3npYTTDd5m55e7Pc6Ij3YJzIRMrHtKp7zTgVdD7ktSKu6oDqR7tM8fbj1ObuO1NrY
         PnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230229; x=1790835029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=quhrrqmiCzlx95C0s5bQcH+n+STyCzgNvsYjGMv0iQeFxOt379hroY32/3UwHPzfdE
         H/tL3EPrrnU/BeNa15jrfnCHqUxekNXs8PdOrvnogJHCdT/PWXVHhT/rcjRfocQmjPS3
         YDRTlIvh8O9mPYAnMhB1Py7hVB9bf8S+JjaOvyBZaCCBoOzSARnr47DqEAjguwUhrrdA
         l6F/BD/FqQ0s0ZDQeM/cuysil86xt64WzH5IlRYdD/iplduv+ZmCpdnFMqmb/3M5Awq+
         wyT9HQAPyH+8BoRPQm1aSbAnNKRK4N1jX22tMBmCn6NVgWBQpsjbH0Puy0nBBtGONC26
         1dnA==
X-Forwarded-Encrypted: i=1; AKwUvBzZyFGQ6wuUP4VaDuLvu7toY/5TMjyRLaeFPQulgvZznzGUYGrAOY5qX02Qzyg5W1Vq/1mZ3iGguvAL@vger.kernel.org
X-Gm-Message-State: AFuF++k0FJre2qXLSDmlBoBYH8wMMppi21dmzZ9kizAEWOg5ssQNjt67
	ERlVJ7MgNKlPPtlz7Yno13H1nk9GRVwLzfqEQtDSxRVzktoXXpehxWUnD2kkptfF2Qv80uJfuy6
	isxMd2Ch4geDnPiMGf3RnongRR+aHXX2l8NeuibS5B1oXcTvRc6LuZxALUBeLrzrC
X-Gm-Gg: AYBFou2qyQpRkm+hDD/LJBQWhrg8jUVcokDzanVE4xJxfeNqML1BENwyA2T/0R0iuQG
	HAZB7RQopznBgx4fOT8TXfJCWQKxWgxWBQTQZJrFfsPgH+HtqvF5ouwdSqND8ZwBRDuje9aiPhT
	hU4LnPzJNjZ1nDMSfnrKKuo9yiwbCoeueUp8ng1oGQvw2DJBJ3Z8rDcnPVSmajt5s/hwZao1qGN
	RpQNKzJ4nXC1zhyQlb7ZQ1eQ84dmnGuiOgrijEOSYZdZAPrmvOkti23xcIjzAXLKwwjzWkSrkY0
	aTtnIulr6dTaiSKb22I79HPx9Kojx0sUJ+ZoIojQfmmwtEbUCRnKYA8Z/xEDlM61w5+z973T4RX
	Ce4XOwQK9ZACd4s+/QPrIle7OFMVqeEQ8BRVU/185yIcm5WmRUcqLubUsjqnAp+mAF9VG2V/Efl
	UME1Z1yEThElxv8l227NJtU+Rr7dYj
X-Received: by 2002:a05:7022:ec84:b0:144:eb46:be0 with SMTP id a92af1059eb24-14503fd2d16mr1503734c88.13.1790230228503;
        Wed, 23 Sep 2026 23:10:28 -0700 (PDT)
X-Received: by 2002:a05:7022:ec84:b0:144:eb46:be0 with SMTP id a92af1059eb24-14503fd2d16mr1503643c88.13.1790230226604;
        Wed, 23 Sep 2026 23:10:26 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9895c1asm10197680c88.12.2026.09.23.23.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:10:26 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:40:03 +0530
Subject: [PATCH v3 2/5] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 IPQ9650 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-phy-v3-2-088e7be0cfaa@oss.qualcomm.com>
References: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
In-Reply-To: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4bed5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JwZr8aepJa0OdLIFGX0A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: J2bisQRAJuFUSWulVUoW9bpact_aZZ-W
X-Proofpoint-ORIG-GUID: J2bisQRAJuFUSWulVUoW9bpact_aZZ-W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX3hUlq2NuAY/x
 NybslvXT2zeORWIZ0R3yGKOpIUvnpPgmbVrN2LnUqjCRFGzs/3M8YNbAdXt/TWOTnHlYsziv8Dv
 bKNsQ7FC/e2n3UayY9dbcj0qp3GbQOs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX4F6LKrpIOcDe
 IYGjBqaiZB3E2IRtH01wVJ+02mrDqqFKhTkNuNNSDiL8vOpa5ZUIOqN2K8Wia2FwrREylgfJYD2
 av1GkOPFd7H/LI+LzcHknmgoKjOTJFDlQeDQLzMqXU8auCfz0t5Vogp1hwsfww9CgNriL9BMaNW
 z6RHotH+x5TLoNpwSiJttzyQipp27NrXcimJcixl7SY5NlPjRrM4FsKw131hEoNARqClKs5I3sw
 2GvPTjOvyjGomkbaUrZqOJAgprz6iqqSW3D7N9eLE6ufSDmKV7IJM4gK9YBHNcsYW1ZSMoEJKa9
 8DrhnrdDvHzjXSupuzYeBxSxZgzTzku+I6csWA20ZCHu//Ve5ywJBkyIJ6UG0w1cl2LVZI1oNv4
 mjJRLJ0W4ZahseYMcaSQ9YWH/6dYTAuqi+N9Aj61zUsBMAlHluLhwNSYdFr+BAcbRRCVi7hRdD+
 SZjXTXJZXQlmVgSnJJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240026

Add qcom,ipq9650-usb-hs-phy to the list of supported compatibles.
Unlike the existing SoCs, IPQ9650 does not share a generic
"qcom,usb-snps-hs-*nm-phy" fallback, since it requires its own
tuning/override sequence, so list it as a standalone entry.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..db00f5a99d80 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -15,6 +15,8 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - qcom,ipq9650-usb-hs-phy
       - items:
           - enum:
               - qcom,sa8775p-usb-hs-phy

-- 
2.34.1

