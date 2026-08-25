Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD21D481661;
	Tue, 25 Aug 2026 13:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664840; cv=none; b=Urac8Tw7qeJxgR7hTz8rjy6SUbLT/vw9NcbLSM0HdqItoQn1MmwBED9VcRB0J2WjkmE1pclPrXdXsSl60LzX+qOL8gl/ab7IERZj8ZdQBMZQ87QlOeS+jGNJ39F3ddQChdxbKGArWKckF83+TuN5c6RvBVJrjgdwhv2fTG81syI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664840; c=relaxed/simple;
	bh=8Rna7W/i0+88buyxmkq34BNTXqBH+bkj0Ib3mkOC5v4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dl056ZiG6IyOyYbFeAlaZpHxckkZeS9kk6GtDyqFxI4TP9TJFl8dXN7VQd+oPSLIA4qtBfBRnTWzBLKP/atusdhut+pVwa6dFdXy8AzuvkewtXKpKLPQSFmUrZlnGvfnCP69wtC2upVHEhO8ec6jlerbkFCPxRJ+s37c+1VJwp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGAMj4T/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGAMj4T/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAvDZc577690;
	Tue, 25 Aug 2026 13:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhPyV8gGGFXVD/I84JpgbJwa6O6/PNRsd00kztaNLbg=; b=NGAMj4T/H2zNvacm
	bFHji/KDYNE0xGZM/OylY/jjc9sqAh2vHmKqtnSV7OfSOS+J0heP53oKJ49lepS8
	3sINuKkyY2nG2u510AeTSlaz4MWfEA+k90Ab9UuPN0Ft0REOHASBrG+/QvAyQEBj
	AS9A0El8fbRMRw3MRDv03LU158Me0S7c3baywjOkqWACpkfqnaMCMugH4kZ+tXqy
	hQNZhpiDpJCeZNrM5EYM+fIhYlWbxQaXMNMWySFZaqMHRWzBHSymym2/YsedOkOM
	NSclmS/FQ3/o1tO9vJTimCgh3vXNtsuGqfLTdKhNOVLrP2PudhefbEdnE2fYnXgy
	hIajlg==
Received: from apblrppmta01.qualcomm.com ([103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93pvj28f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 13:33:55 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67PDXeuE032068;
	Tue, 25 Aug 2026 13:33:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g74ujryq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 13:33:42 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67PDXgla032083;
	Tue, 25 Aug 2026 13:33:42 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 67PDXgJt032082
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 13:33:42 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 26381638; Tue, 25 Aug 2026 19:03:41 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Karthik S <karthik.s@oss.qualcomm.com>
Subject: [PATCH v1 2/2] arm64: dts: qcom: kodiak-el2: add LPASS AML IOMMU SIDs for eNPU audio offload
Date: Tue, 25 Aug 2026 19:03:33 +0530
Message-Id: <20260825133333.376591-3-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825133333.376591-1-karthik.s@oss.qualcomm.com>
References: <20260825133333.376591-1-karthik.s@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDExNSBTYWx0ZWRfXwW9crGfDsSys
 ysYbbtUmIMwGjlSTCNKi9VJZCC+VT06OJJuus/5zfB08D2V4dBhosTbN7Nsi11tOYflnfP7r5ee
 SeZKrFvlVXNvnD1jMnQai4E7p27xZI4=
X-Proofpoint-GUID: y3d1PvkwqnCxyWaaaoS62NdfoF3kxTDK
X-Proofpoint-ORIG-GUID: y3d1PvkwqnCxyWaaaoS62NdfoF3kxTDK
X-Authority-Analysis: v=2.4 cv=Ru716imK c=1 sm=1 tr=0 ts=6a8d99c3 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=iV7JjYXfhmOnt3pwDb8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDExNSBTYWx0ZWRfX7TiVVn+HAQkg
 WyEZ0x2klKi30DB1rlbKGzxt/eVxcd2qHdG6SyJmnf1W/O3ABVtUICVpVR0/Qd+lGMNMBm4Tnup
 2T6G7z8LFbD1O72vwJ51hkC8NVeTvkvF+PR6N6UzcK7RYqZvdz6veP9Luojam5Lj6fTzZ2Ivmta
 /aUprAgCg18d0fuZVp3+wR61yHAvPko5KBKeLkTKGxnymz9/SCSDiMKj1uzMRJKzeVNvW3c7FV6
 +YEq2yTQBVgr9rtFRho5CzNjcYSbCocrlymXiN0yFfBy7sSemmCpuDdmF4P9XNhNHYGS2zqnzhQ
 6gXIHO2eC2npZtnLZ5tffcx8P6cv5PARSLGFI5Z0QRj14GaEWuar+5Z0KIYcW3h8ZIYWjUCuv+H
 OMtSrlO2IPGTFoTiFn80ljuoTNIH2lVX4cFq8Af+c2Jxa8cDziXWM6aNVHJib68uN5O7ENfoFEn
 b1FdDyesjxBknfUrJtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250115

Add the three LPASS AML stream IDs to remoteproc_adsp in the
kodiak EL2 overlay so that the q6apm-audio-mem-cma child driver
can obtain an IOMMU domain via iommu_get_domain_for_dev(dev).

Without these SIDs the CMA device has no IOMMU domain (has_iommu=0)
and IOCTL_MAP_HYP_ASSIGN falls through to the SCM path, which fails
on RB3Gen2 because Gunyah owns the SMMU.

SID assignments:
  0x1860 / mask 0x9 — ML Activation + Weights + Write streams
  0x1862 / mask 0x1 — ML Config + Bias streams
  0x1864 / mask 0x0 — ML Normalized Data stream

Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak-el2.dtso | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
index 8daf7f02fd75..d050857cab31 100644
--- a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
@@ -13,7 +13,10 @@ &gpu_zap_shader {
 };
 
 &remoteproc_adsp {
-	iommus = <&apps_smmu 0x1800 0x0>;
+	iommus = <&apps_smmu 0x1800 0x0>,
+		 <&apps_smmu 0x1860 0x9>,
+		 <&apps_smmu 0x1862 0x1>,
+		 <&apps_smmu 0x1864 0x0>;
 };
 
 &remoteproc_cdsp {
-- 
2.34.1

