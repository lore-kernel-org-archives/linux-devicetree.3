Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBD336B904
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971660; cv=none; b=aI4CptOlMLCjvaemYEfilu6fSnZBlyZbz6MYEhSNYxJQfbubh4rBwKd+MuigwUzndNptI+9jFneul/BbhDEtt0NNnwvtjq62kCcS9R+JY0vnYIty7fAA/KV0IzZ4FEIeGDOLJyQ44lk05jM8I9gSqbuoo23+yoaA9ihc27UDI8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971660; c=relaxed/simple;
	bh=DDCwiFdOEWDOjIDRAPl2mASn4s5v4PeO1HLREQ1I3Ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RiWUKdaELSSCNCLnyiAqXOmiehUekfEa+GpJzfD2eGlndoCf+Nccp+4pu0UdFwj6p/eZIbGCapG1qP9qJJ/VtmIGiQ8kYvBVl0ftU1MUquoo7u5URK40x3/6KVvHasDsZzWnjt+cI4+Mdmfi/CWWz9aiHy+3QyYYonFYO6QQVYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKHleN61; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cqrc/WZ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKHleN61";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cqrc/WZ9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZVm2635398
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ejQe0vnSRpmx6O/pHsipBYjRZrUQ8hgkfIYBLU2Tn0g=; b=AKHleN61R0XMHr+A
	YHOVYbonYMvS0O6VQQJlwEeBId9nVtuq87ti1dPuAKd0uycg55iT69AK+guterpt
	zpijdCgi+HlpnaIKJBfvmCekVmnJsVqvZr9JVgQrXKaGYb96GHGleGltuP33n9rb
	hz+LMJnWJJ9WhIx9khWD+teGxTgmIOq/LrUsXsxMEiFX6j1CC3VCIX/I5krG+G1z
	sX1p2pxbVEL4R5GGQeuxd/Cmin7Ke8kYU9louZP02rnf9nihBfXVy6+1HE2l5DyZ
	7GrAr7YygdEGTjWJvzdNevgGwvOHTpUNi++xxyJloUlHxwhBRxqhuHIpuIMwjWK0
	7SLw0g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxw1kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:20:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc52c77089bso3981989a12.3
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 23:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971657; x=1790576457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejQe0vnSRpmx6O/pHsipBYjRZrUQ8hgkfIYBLU2Tn0g=;
        b=Cqrc/WZ9efRFf3UJVXZteFWfrHlwMm5lSnLBWW6xaeAfXXGa5Kcw70Yb38qXvziG6o
         EJDRdiXk7X3y4xiW2dY94KfNCuPnhFDuSjk7sJl0ZD4+IUBROQzgNceGapQej5WaZLFa
         9GQ/PmSMdmyVk3bXtFygsySLnaeoYocnIw7OrI8VrMV027zuIgC5L39OgPHC72aDHsWd
         +4mxEOXLQoGw1dqAwNaYvFrit5ok+LsxuGUbkmxw0wzrFjYTBPDgSX3b2tXQcPMyAij6
         152haA0wdmVRoR5nqYflwg8kvuv5GtsPonOE+0oIFZZqkln5V0mBq1QJpHnmqs15sngS
         LE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971657; x=1790576457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejQe0vnSRpmx6O/pHsipBYjRZrUQ8hgkfIYBLU2Tn0g=;
        b=Oeoal30ZoVPSWe0nUXdJVEMK+6n3RcVui8dtWGXCC+ZMmPulgAjFemFaCh37tJo6Jf
         6KBViKuiQlmoSHvxPeK/qznwMsVSfZuZDWiTMar2EfOAYDk/fP6veJVfqUobgwObjDI3
         BET8khNHK9qfsGqMIENgsNXmKboYna/xG1+2G1aTidL29aKuCt1poKJY7TG3w/ztCjRZ
         HNNLuDZuCsGydjUPV1OECEyJ4PF6Wi91LUDQB/NFv8Hd7dsPWcsbfIQm6QdGdaO1uYOl
         dbkuUz+cTB7CDFqj0OtC7Ov0ZKJcVx1G+008FUY8SExWQd1F5JP2sFgtbsTJCsZqpSuv
         OidA==
X-Forwarded-Encrypted: i=1; AKwUvBxawv0B77DkqBWFxJ1j1X36T3Xbmqj6I3eMydnEAa/n27p7hlwny1RRXBM7zaedXeHXFvWm3i1SLhPv@vger.kernel.org
X-Gm-Message-State: AFuF++nCpNodC+D0tXyvit4eO/pBk6+qrg+CphpS+rTtwDopseym0mEB
	UcqZ5Ie8Z3n84Dv8cOiF2RLc4HUroPDoUv6Uzi39EDcJODQXRY0VVVxp1NfBxj0b5LM62jYN/u2
	phvwXHZxKdXsDsiW3jBRa8gBLjlktmRD9GtAdU3/8Co33DfLit7sIakKRvLeAJl+j
X-Gm-Gg: AYBFou0mEWlXLsHcPqx0UrSkWk9/C6QYGMk+qgEsHZuiRgdtfDGhlQ85H6fUF5S7N2B
	RAuI8aRa19xz8cUQw9JbKM8zhe1eeKSasa5IcPo4Son/suFebE6wt1o5j8b6AE1Zb8LUIjf/YZR
	0e0q+ehZlC2/5ldszda0JbGWs7z4hsW43LMLN9O4rALB11TiDPOxTIGYV1f7zGFNAATUuv584tk
	fKFyCPswxkPEcwCIrAiSR8Ej7CXDGpLeBc4DTW7oqlCaw6bCkBoBMAKp82rK0S8PNGN1/Wuzk7f
	+hzJ/E3gPEBVfxV13zsoGNYOdmPBiBl/NWbVYKqFkMXzQc+67jiuzILsrycg5DaX7Fpn/qhqi5/
	CxXe/tIy/6AYgQlIX5aGo2QNj40WgnBk2lRPS5URIGkL8jbNASkR+ELysaLoINtSAJR67xmDMKA
	Rn5aSCOMoFi+1QbzP5DaQ0rVGZC4CEHIGDjg==
X-Received: by 2002:a05:6a21:1f87:b0:3dd:a196:5397 with SMTP id adf61e73a8af0-3dda196546fmr10578818637.57.1789971657029;
        Sun, 20 Sep 2026 23:20:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f87:b0:3dd:a196:5397 with SMTP id adf61e73a8af0-3dda196546fmr10578785637.57.1789971656651;
        Sun, 20 Sep 2026 23:20:56 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:20:56 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:43 +0530
Subject: [PATCH 10/11] clk: qcom: gcc-ipq5210: add UNIPHY XPCS reset
 entries
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-10-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6ab0ccc9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6Pt1XdrthJ013FYkzXMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX/jSQP2fBqJ8N
 LUsxP8qaSdl0qCzVDojLBKPiyPPaF8qWLoWC6lL7PfFj+OdkHUgznmDiJBVGD1Q78VH58zrh7mY
 2QMepAsQhRasoo1UooPQc5ZtTPZYkb8=
X-Proofpoint-GUID: od4jbRyYxgiglYTWA2LUvLtYVRPNxV9V
X-Proofpoint-ORIG-GUID: od4jbRyYxgiglYTWA2LUvLtYVRPNxV9V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX0y5euCTDSrwD
 SdMBOwoPv7Ozcq/W+rnhTE1eNh4ULIVve+xnldL24/CyX00hvCG1rYisaLMDMyhLdW4QPRL88N2
 D6jiqExd19dvkswbvT2lWPKtfDDj9UHwjcRvsasi+VwZWsxVgbngMxs16gMAUeFAnzTF36NT46n
 pvM1Ak3FHb3piAEus4XgPpKtjn8s/+7pBG9ZCO3JLYgisxkyE7dxlUpnbRSgbNQDl5B1V/u1FEB
 qbaRo9nerB2xumCM8lJhP2i0a+sPTsZB5+01CgBF4Hp+tJc+WSRAUYeYgxF1+1WO3ynR1/Nvy4+
 tTs/8FofILls1gFqOQFGWnr8/2aME5yWbsTWXLRT38DpAHMgCelCbIH1O8D1QrtMKSL1ORHOkvR
 ukZ7EvrPpCvjouxgb1XBenpXWEf/rCbl6yWtx5J7RjNSiR9MnERt5t5+WRGTFXLTHufKfXuF8o/
 M1lsSm50bA/llr5vMQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

Add reset entries for the UNIPHY0, UNIPHY1, and UNIPHY2 XPCS blocks.
These resets are required by the NSS block for proper operation.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5210.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq5210.c b/drivers/clk/qcom/gcc-ipq5210.c
index 76adfa8bf2ad..d15bcfff1759 100644
--- a/drivers/clk/qcom/gcc-ipq5210.c
+++ b/drivers/clk/qcom/gcc-ipq5210.c
@@ -2601,6 +2601,9 @@ static const struct qcom_reset_map gcc_ipq5210_resets[] = {
 	[GCC_USB3PHY_0_PHY_BCR] = { 0x2c070 },
 	[GCC_USB_BCR] = { 0x2c000 },
 	[GCC_QDSS_BCR] = { 0x2d000 },
+	[GCC_UNIPHY0_XPCS_ARES] = { 0x17050, 2 },
+	[GCC_UNIPHY1_XPCS_ARES] = { 0x17060, 2 },
+	[GCC_UNIPHY2_XPCS_ARES] = { 0x17070, 2 },
 };
 
 static const struct of_device_id gcc_ipq5210_match_table[] = {

-- 
2.34.1

