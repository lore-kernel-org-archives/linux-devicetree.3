Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0AB3D9545
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937867; cv=none; b=a3C5JNn3BlAZaJrznbP0GtNb7SZVvvp0xotjjvOnQs5PLGMx4QkdmYH5YYSAx8cuMM3EC1l8SDAeNMBiI91FH41wz+yUpz0Z+XyflQPgEAFr25zr9DlKI2CWjDsk09Sunenjbtb2XGCEqT5L93pjAQv2RT8JQycA3LKzm1x0UTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937867; c=relaxed/simple;
	bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VmVaiLkITShAJsMThBXAjwBq5GaTxCV4NT9TCBE3pxcjk7K3vvE+Ei3do6GEkHAN1eHsnquw9gQNyULkgID5IWqXDaBxiq4DBmmaPjF/MaE7Ye4KQDtRtD3nW4GcdL0YU3Y3/pakbUBsfHEN2kl49xze0lm/t7kQA9znK6sDNsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMpGsHrh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqpZ14J5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMpGsHrh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqpZ14J5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D98pNj793104
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=; b=IMpGsHrhYU/Bjnnu
	l7TBLCS8mzX1iFVdNCGSirLcuEa2sBRnnJiyJMVVx0cyI6DCKXxEXVRqbv8U9y1r
	BkD3SJDiofeFjooEq2r7FbDLmd5dBgMlCd6XjfqK2zNF4BQ+U7Hq1eeWUNyBDBSZ
	N1flU2U+Vc9bfmiAFLqY08b7CxUNEArKHuyRBpL/6Jvnq3ZhJWEWdHRDXItEDDEt
	tTzLqWd83sF9HrBp/EcCn2Za8oHIQxiiXQ/CYADflk9bdQje0vw0kX9l3pcjZ0w9
	DYDzij3oULzlpQUgCcAs3b7f+WFE5Zcb0NMmWilsYaspvkXFj+DUyLG6jgi+6MRX
	ZlWI8w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qr7vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:17:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8895156101so1792448a12.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783937865; x=1784542665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=eqpZ14J5WvAvUkyW/B6rldlEtgAUQVGxGAhrD3pnW1FoLcMqJn1T5KR7DvQf0oI+od
         pm+p1OhfD4G0Hpmmn2bsZmDIV9VxlDouJ+vi/Hi9Rm7+lNIF8F5SnTJL3tJ1zla0/ERM
         2rmpC0rSmyP6EZHLImBGedwHfB71zkl0kOTHtldp7s0Z5WLqk5ZSCewL8b/AfFhot7TK
         AkMLNLeNUizgfSCniNmGF1Zl+9AxvOsZ3EwLWWLMnedAn4IRQyrtoYFmAj0MaUsJjkkE
         dDaiwVCSXVRbsQOdrdJ4sDsxxTcKRCc/9tzKvkKW1muTLr5Ar2EcDzcS359szQQziFxe
         sSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783937865; x=1784542665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=H2XYFOSsHuw2+KG8f/0h8M0BUgcP50J81QxNDJt7nHf5socJhgs6SXw3KOA+Os33EV
         oNhMpCt0ghGkCaiHserf1EIKGfgXYNWKFag0KXtBJZ7xRNHnIlRqx4HcHWrUwgSQFecN
         N/nxBy03JQ+5R313UX44EK6jLQcCZIZQWbLXBjgd/KTM8fJ2WCAzRphk7X7Eq29mOXmU
         d5TWfjhWozNbcAav0kesYInEfxOZQZkvZWYJY17jNoyQtBQC8DeDpvAMVcopNahg5rde
         726HfYd6lE9h3/kQhKD8f8/RlO6W5DwwuHRUzbzAFwmLUGtg/D/Nb+X3gxVsz7NpppMz
         0nGw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1ThrEXuqFrW2E5SNN/qmFC+P3OGED7golRxzvUdqfSa98Bq5yuv3KdE0MoA5WamFR6GEmhh2d+QVO@vger.kernel.org
X-Gm-Message-State: AOJu0YxB7n0uEJh+FYGSqV2oakUp0L2zag4XSGXrKp1+9kruUdgNBIxr
	FsCxVhcmR/LQZo1TSBnQRgKnwrTyxzE5v+D2WtrWZ9qCGMlNJGUxnm3eW5V75JB/mxAECJbhKd0
	wTbmxptV9DaT832T1jBxLDWwNbZWMSqQw842ukowl9u629SvxOl+Epi1m2EZ5zkIH
X-Gm-Gg: AfdE7cnbvMjE0H6i5XgeWyxJzVdDNv/0+rgJcQ55K6tqh02CCSm5Z9r+babi0ZG9oXf
	Ov2N3RyYCWkdrzVYvDSsHM3jOQSXclKFlm2PrUw4FDrBnkJMi/f1Rc0FFJTGeH4RpOVheYrFVW8
	M7/P/+0q3By04IXXvg6SC53g+7dUwF80tp/V3m+CE97X/GswXaWHfKR/KHaAKhC/E+vZVRcuJsK
	XQr6cULZRmf30w1l98mB2L2pDg9YLno7D7TM3LwF8O5KhUavEfPq9x8GcbEN/ouGrIW1Ewwdtkq
	8ppEKkASCwdjrsDDK/9wC2rcnVMUf0tzEoD2kgnsGqJn21BKjOC/FuToLWY1NehiYeMmwAaGErJ
	yjxYS7PomFmMtYfHONatNODPjAcQfYYNgYc4/yfjKXkuzQv2nL3Uvse5m9ePvpIJAbP1PVlcqLG
	fSEw7eaGErqA==
X-Received: by 2002:a17:902:d2c8:b0:2c9:feea:4e4c with SMTP id d9443c01a7336-2ce9eace276mr84813495ad.15.1783937865336;
        Mon, 13 Jul 2026 03:17:45 -0700 (PDT)
X-Received: by 2002:a17:902:d2c8:b0:2c9:feea:4e4c with SMTP id d9443c01a7336-2ce9eace276mr84813245ad.15.1783937864904;
        Mon, 13 Jul 2026 03:17:44 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm98257925ad.39.2026.07.13.03.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:17:44 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 18:17:27 +0800
Subject: [PATCH v9 2/2] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-enable_iris_on_purwa-v9-2-633d7b87f0c9@oss.qualcomm.com>
References: <20260713-enable_iris_on_purwa-v9-0-633d7b87f0c9@oss.qualcomm.com>
In-Reply-To: <20260713-enable_iris_on_purwa-v9-0-633d7b87f0c9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783937849; l=1004;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
 b=dyX9On16Ld4tkiOAnHRplOwY2mAj27jfz661dBMxoW6xrBgHyAo/pJbiT2//GW5yXVpdAaDy7
 gw1ElsB08MQDuSkenjq3GwxjH7J4IE2FlcLvWFVfLbnP1pXrwjt6Eyu
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwNiBTYWx0ZWRfX3tm6bO2yiicu
 lggloAy5utLxWT9WMEq19NdvVlpr1UiR6DPQUkmI1vZUM+NPvdBr7zgq7FfoUp7DfW8ghSm3tM6
 CkrnDTk3UIWTMNEP4UV4TPm4XOZT6n9rLxr1ntAdJGYNLEYmb2G4bNbMsjCi0RCbdD7Qp3Uy6rR
 I/7h6HIr8FkxOvkz6ee7gzn8/zrurrLjsyXOXYSwuqQmDg6gYhMA8eOcxMjxp3ZRDaK55X++Kj5
 9eifnhRAkw0VW5VEjhH+Zd81VvXaqp+ghiI+M7VLYGCGvbYDx+FJd7/HmDn0DLdtFY0xSP0bs6w
 S/Evbqe9sI/9sTl2Bex6nCI82AZ5gEn3OJTLwsrWzWOysV37EHkboI6qGA+sR9czybyyCctz9t7
 WVoZeTBvb0hvktsNx1PadF1Agma67zYT93lanpCn2v3/zpaQuZLmSYdsGKmOfm2Lu+s+Jujrdw/
 zGkHpwq8fzTWJTdn2sg==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54bb49 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=REEBHDwWlCTOHul6J5gA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: FqovBPhuKaSPsjASiIMyRuWHGG-8b6Fl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwNiBTYWx0ZWRfX7s+bi1ErrbFp
 py6y4zNYMtWO7FoTic9rG2+r/ul2or31oPpnMYPYLvCw5+HLmR0bfbfD1oOssUCJcodrTZ0xM/Q
 TulaablSzGz555cQZ65OCtVFuqynshw=
X-Proofpoint-ORIG-GUID: FqovBPhuKaSPsjASiIMyRuWHGG-8b6Fl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130106

Enable video nodes on the purwa-iot-som board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 394e65518ac5037e5c7c50583acefc0dbc8ebb47..ff8621f8750584636ad781467f9c35ace2354e4c 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -389,6 +389,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";

-- 
2.43.0

