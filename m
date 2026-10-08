Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A849E3AAF6C
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449812; cv=none; b=X22+5y0JdzHafxKc/cb81KHddAghoOy1vuSNrBMuHm2/ueI6Hto62i4iH+ZFiFJy+s1DW+3X7x2PcdnOr+RV/auwWYZI1qftev6M9SgD2sXqm7D3IZFmuDSfblGq3pPF4bseED5+JRpqQX19T7+NlDHX5aG3LdL9pe87XU7j1Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449812; c=relaxed/simple;
	bh=irt+5R/TCuvvfWpeW9TWIubOZ/2FdIwVIvhQgVb8jCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gnsrf5uS21DaZvKUJxEjTauvmv6KyCDlxPpnrFUxEkHd4mFldbGTPpwMswSzSWbxSOuRZ7/pqM7pX7rRYhyCHBgseKnoMpt5QRP49hgBaQ+L/cU4zmtsxPrErAejbOzM+CXZT17jEPbHq7/76yNUP5bajUVpW/EX9w5gjkUDXk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mADA7tRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krb5XSC2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mADA7tRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krb5XSC2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KNj71845890
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 08:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IqML+hxzRewZJjV2LhniPwlMMPrxKKH/Yvp
	PRZcedDY=; b=mADA7tRJRgAjTtX8Q3qW3Y0iLJNUA8huvWEhRfc1mfrdXsQkHD5
	xF3AY1+HvtKFgjFPytsfy/rH4xgph1aPSwhksW38vy8QH71pu7NOL3Ca7JcqLk2d
	5Z62M1DyBhO/GWv4O37i7+/ZnA/KKXqDi5ibs2cAhGZkTxFMwNb5OsCWMbODgshq
	e9xZdw1L6PCQXrtCasZ1HMmyGnCI0FKrIz1ej8xu/9OnbsMuUtG9EBrkEyneU3Bo
	bKIpaKNvXSUw/Dna8mw9boiQm4penYW+XaX7zEPnqAg7Pl7MIV7kKpD0G8g+DgVo
	0oo9aLst8PmgHSS021V6GrR+GMLgm3yonBA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3j4cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 08:56:50 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-151ba226e1bso7156724c88.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791449810; x=1792054610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IqML+hxzRewZJjV2LhniPwlMMPrxKKH/YvpPRZcedDY=;
        b=krb5XSC2ZPONIt/EapT+XFnUjYgJR+e6RZLGN6XoQtNy2KSCnWhbS1Cg4jTTT6aua9
         NFgqZG5sV2HqlZUtnweqklh/H1fMaVKjmlChnk+eb/dDizCWXfXsrIOiU4UjgFwp7zAx
         qcJJOgEie0kRY25aLzVh6sNz2iYqrIzZaN60IWMx+WV4TMkRyC11AgNStSJQyu1Bed1k
         V0euXWgRqq1nQO4z4zly9KbV7uaVtcacVg9TZ8GeQg7ztWd5EyW6UIj/h8Rp3DVKsYQ0
         4pQLaWQSfM7cuajrWfIeOTJAAf5iz6Ve7KxqBNYQxkFwkp7ZKnbKMKlzXHkZofyUkbe6
         D7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449810; x=1792054610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IqML+hxzRewZJjV2LhniPwlMMPrxKKH/YvpPRZcedDY=;
        b=JMcvCuSkGf7kKpJdCrEeiHmIsb5Bt5r1DG061IOkMiw5jLerFZIfHHw01ZxFzkz5xd
         TdLlWe4nzep8Q2cZQHIjJPQYgHSBBJ8xd57UsdODi5yrzBVTzGI1BHdbH5TrNMb87B4R
         W6bDqpWilbo1fhOyZhbg+XnzfuNz4hhtSmSFiPIN5UknRbepewmn8T0rKT0Z1tyGbbRh
         b3YVfKDM7wcLstNzwbE1SrP1gDVst05WGECnfPOCl+dYX5Raq+C36WR0ajtv289Sv0YY
         MFRBA7fa2WcXa11qqCKGf3z83ZJybYrUtu0k42RMBrOWtjcjHP1ONGlENU7PMQp970s3
         hJYg==
X-Forwarded-Encrypted: i=1; AKwUvBy/UHjxwHzo2tipjGULe0X5W0q6v+o9La0FrekX8W1f7cJD6cYD8mEGt/dIln/ybAd6W0EtoHuV3xvQ@vger.kernel.org
X-Gm-Message-State: AFuF++mYebvPHglJJNArnk5RcsD8C5vRQE2GV0F1kXVpL7FP8Eeb+Tz8
	ZYg7OANuKGOm/fwTDY9aWZsQqIQCQzmJ9qInldJ0DSlGYjPEmiAGzDltt4Ke2+yPO4AjPJEk6N3
	Q3/8/ZOuE5AYN91OjczgHrnglKpvQrWG4MXKxRO2U+yYPRRSjNiuWedXWPthgADgq
X-Gm-Gg: AYBFou0GeZwdJODzM2eRD5xAxm0oSTtHgGQiJT+QmEjzZ8DFYZbT3Er+CDvEpfbPSxX
	FxbuIZlPXHTdfeUxNHKYx+cY9aO9+wt+VacUQHZ8cxX37i9vhMZiLQ/5e8zPVIFqPHjUliWwRE3
	sVQ/NqbIe2m+g41VuKEcUKcCeL0NM9Fqkh8JSXIniiJuGlxwRMF9XJ9g3vuRUEtwZ7i8REC0RyZ
	YexEGNx/Op+Kc7iwABaE4gPsbgSNYyfiaKd644nvONhXfX50r+XCXJM+R1nABu6bWzjJPpRiNuP
	U9KtJa+X96yTErDMEaqCpeYID8iN15vMew7nI5U2K1aTOieQdow0zGmCmFmAId+oSVti3hrVUGm
	NievYNCtNKvRySiKEWhyXSgXKEw8n1Y8YgYEsSl+Bg5PG5gyXibtQaeibUBE=
X-Received: by 2002:a05:701b:4343:b0:14c:96a4:b631 with SMTP id a92af1059eb24-1620665f65amr4806793c88.30.1791449809477;
        Thu, 08 Oct 2026 01:56:49 -0700 (PDT)
X-Received: by 2002:a05:701b:4343:b0:14c:96a4:b631 with SMTP id a92af1059eb24-1620665f65amr4806763c88.30.1791449808895;
        Thu, 08 Oct 2026 01:56:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1616727976csm13487226c88.8.2026.10.08.01.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:56:48 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: nord: Wire UFS PHY symbol clocks to NEGCC
Date: Thu,  8 Oct 2026 16:56:40 +0800
Message-ID: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNSBTYWx0ZWRfXz0cV3/I9coyB
 xVJpwVaBKnppvAtngfDMw29C8PljQnUoeKVSv5RXBG3iv4dpwLrDjyHgs77z4VBwl6xLCSe67Ox
 pMinsOkvL1H59MFMbJLap4MOxtpJbHM=
X-Proofpoint-ORIG-GUID: uQqSdCoXaUyrnXizO007kAZddwwB5Z4E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNSBTYWx0ZWRfX2M2pkZ5zMf3i
 GH2SkLS5MU/tynlNfT3gnzMOSgVGYfn1VrI9hNa/OtwdH0wlDr3HrWRbZF5D4I6F+uRqisnTFjH
 OyQCop++Nm1lR7q9B/XMeTno7BovUAyMX18lpcVUsuIH8oGNor/xpB/xuPhWEeCxPlsJtUd87r5
 FwHQ94TDkb7zcdpt+/4+wwCHUivwOC5DsFOtaINyjieTjd2ME7Ii8ymFIvZdmHK+bvuW8mgSG+A
 85/hYaD1PFcgi4ToWzYnbqSAKJb6SOm1uLpjcmCXI5Ofl3OQVRx9wqVYqVucC7dQ0ApJDUzr0wI
 lhXDrcqW+tPaIrwjT6VH80ESnEMeksy9FCaMq7cQD1hJADMxVCpX/MTIjB5He5qwgBRwuhjJTp/
 RJQ2oLMaGwUwmEZMbYdfekIN0evZS1u+ilrVe4LuvLJxHpF43bFs9m30GF7vm3dFJ11hNX+Zoon
 +QCzBmrYmUiVtX3Yc0w==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac75ad2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Bo4Vr6iyb8KBBA8X5XQA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: uQqSdCoXaUyrnXizO007kAZddwwB5Z4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080035

Pass UFS PHY symbol clocks to NEGCC rather than leaving the NEGCC UFS
symbol muxes orphaned.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ab7d9bc3cfe..5cf90c77838e 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -799,9 +799,9 @@ negcc: clock-controller@8900000 {
 		reg = <0x0 0x08900000 0x0 0xf4200>;
 		clocks = <&bi_tcxo_div2>,
 			 <&sleep_clk>,
-			 <0>,
-			 <0>,
-			 <0>,
+			 <&ufs_mem_phy 0>,
+			 <&ufs_mem_phy 1>,
+			 <&ufs_mem_phy 2>,
 			 <0>,
 			 <0>;
 		#clock-cells = <1>;
-- 
2.43.0

