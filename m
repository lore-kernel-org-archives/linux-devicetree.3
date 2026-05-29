Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBFF3A0B36
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040137; cv=none; b=UswPpTU1xJoFLZAI7Q93pucPiYAzK7LQ+wvN2YW0EXf9C5+d9zQfQeaRQuD3KF11C+v4JLzPB37PXexXgouZzz9ZFQ7BS8NR5rLDpL3DLo8BtqumQ7MPOkJleouOovtoKs+iFJxGehGa+a/2VoPcG57bx1p6EplKy5kihOYCphA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040137; c=relaxed/simple;
	bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ac7AFBkCFTZEq3ggDHM9N+1VKg2MO3vTbGhZjKryNg7LAPgfEWQ5u8xGA0mczlbZltcERW0Fo0HPmloMf3VDhrKDiAu1J4g1Iwsara7MvHtSfGvIrrxN20OMqt1XFr6NjYh5vOvrsQWFwvOEwu7iMj8CTrEJdPhJ9t91Q7azmcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfp+gznA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5e3r++B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfp+gznA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5e3r++B"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T0A5ll1495603
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=; b=hfp+gznAP6RJlgCe
	e/xQsOvkTc45d0eNDDRZqY2i1SPZmp2kUOMTxBC0r7lKfm1mN7IRlk49a5mBs7yV
	xn5EJYhZYWML9ZyGbFWJIKa9ds2h4UNJqu9bBPlA+8WLilo+OODuoWmpaU/CMdyo
	cEYsJTURB32c0bcjS0sVNjlM7/fer4NB0kareVCU78eO+53iJLw6wDOfz4EC35eL
	Ic3dEe3uJ02d70BpBh1axPfl+v6perVRTN/na7QgvfSzEFm+9V49B7lelPIFMSmp
	VuCkzapdc2147tJhpYh2GrSoa7VcfkYJ6aFg1fC5PcUH2coKiYJZC7AiA1crPn7/
	d9DlCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef0159ete-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:35:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba718173d1so100948245ad.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 00:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780040135; x=1780644935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=i5e3r++BktcuI4xPpJfidV36tnjFcKvo6sg0VCHQYi2aQ6Bx2XNiHMapLhdXqSqS3x
         Jzq7O1AZzuGPITMth4Nrn6U1rsov2SpRwxYcBow18VfjDiBVt3pdtn6dRP3jedkXhg6e
         TZ7cVpYO4I44l6Md+0T039pFHR/F310DnQwqlt0Od+Xg3S4hsY8WwG1UI5aCC+PvR+PQ
         5ZQ3a2ieoIvfzftSlFBe/KElzoLFihbw8u2AnP4hOZvG2TUuc2hKw2nwvKnvbqGXfpJX
         iinQ0mciIbJT9mXNl6s8SS08S7QjcnFQOVbopzJlKbIf6nMV3c5K9YrBBHkSrrsCe6Iz
         j1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040135; x=1780644935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=WiYZxyUwz9Md15yImAWhNJF6g22A9lnnVVpzG0DXuCli8fDlPh3G71GFiZPP+YHg/G
         nKu/xYv/mlURgvlSNEytkN5vyjwmLJ+WBvHeIsSgH10qrko0jcmWEqQlcJTgWOnnB6gu
         byzeoFoNJI6U1gH/3uzl4N154Xv7al0c8k0PdXSICcggw2mDVkH+nJmiyx18sugZjdci
         Xm/9yrjMO4796Of+r9anJhMFa8rY9fzHXf4fhS8Bz2CWaGDKpURWH9kknJyRp6alSFYb
         Uah8QeL6TQejxtBQdnXLZ3KDeinUVZA6sl7QztboZfcHBR4fNLt+Grgi9YD1r9oJFMdW
         GDPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dGtbl4Ki0oXiHcnt5hQqu+ReN39nL0adYBUEdgW0ABZRf/uq9OXZ5DPnnwkYjC3SsOqo6rpomcEYa@vger.kernel.org
X-Gm-Message-State: AOJu0YwWjoD2rKNbARmd61gjJVA/g45PBS5wHpRw4ldPMb7W+MH2XHn+
	AnuOn0AO/qvtxhPDHNRaLjs2VWwVgp4Wr+COW9KpKhB2dtnPCPiXBtdn6Y3l/1ZU+r42TpQs4aj
	FOa7cMsOIw9KmmK7KEAzLx8m9GhZ5L99w6DVLnMuaP0pG/Yw6G1D6hRK2/4b4NpBf
X-Gm-Gg: Acq92OFlNT3o67qjuijgVg1vyJJy0rHQUu0gS5qTvXWHqbwgCqp7BNV3YLpREvPYEhB
	JQD9hfQuSj0uHYQOze9NX0TMg/cFYjvkgXnIUnr0ucVkgi5t7upnQGCETpG9xjmFPIECxKEShfT
	Fe3gwsBCXNrtooPLXjRXuLxluZcLRMvtbgCgyKMZxhuG2KUTz2ONx3gDtGh0rHYEqQCzyk9Fl6K
	Ibr8+muVVH7G6hV8mG662ZYr7wQab8J6zfW2W7FD1+L9p+u0Gndchv1py9YCzfX/ZaxVIJSSDoX
	qtHhsUV/l2YWiwvHo5wa3HfDKhL2OgLJi/D3Rl6U6V7Y5WCPA7QgrFHvkK/f7cotsFhro3ggSJJ
	80ihq4AePPgJoRmxe6NRz8WYTXlh1zHtAcC+uXDWq+NX9f+4ZIEpa/2abmO4MbHpPp7lfLlsy6D
	rkKPDSdOYn+iPKXgC7aCDZ0GghJUxX+pk=
X-Received: by 2002:a17:903:8c5:b0:2bf:27d4:7262 with SMTP id d9443c01a7336-2bf27d4ac19mr7910935ad.41.1780040134655;
        Fri, 29 May 2026 00:35:34 -0700 (PDT)
X-Received: by 2002:a17:903:8c5:b0:2bf:27d4:7262 with SMTP id d9443c01a7336-2bf27d4ac19mr7910385ad.41.1780040134168;
        Fri, 29 May 2026 00:35:34 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm9767335ad.52.2026.05.29.00.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:35:33 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:35:02 +0800
Subject: [PATCH v8 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-enable_iris_on_purwa-v8-5-b1b9670459ab@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
In-Reply-To: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780040102; l=1004;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
 b=i1JRPmIsh0zF9aihyjTElfvWleK7DvuVCvSEgWXsztTwujxeeK6Y/jGwDoY3ujKKBKJrGVm99
 TxmvJr7oW4rCx2Ass6x2BPTuTrH68os2vwlUxl/cOcmFCOfULWwwUR8
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: xnKiLpYPFUsM0n2ufiYlTti1Ie8H6OE6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3MiBTYWx0ZWRfX5Dlc82//WkXE
 z46fAWSJSE5N5SUSH9PWOXkHyAzEXJpJtRG/VP5530Pl1ZPqm/zl3eCw/fl2ZueWMPrh4K1rEOi
 UqaFhgzQ+4nxh/7pLdil25kTmkXDx3dKfrE5V3viOuW0zDPNcxxg/wFYLFoTsvM3Ugz5JFLzLGX
 uaRUpnvplE4LZtnTm8Y6ymSfgcbDU6E4qI8lVt2g4BVU3LKy5CpZArIJ8Uu2TPgxx6SLRSTtqEj
 taf+pTrWvI8v9VZpMwdLnzwd8DxifbdYui2UNEPEeb0EQQJ8H2bo/QA1uWWdDAkr5is4KsyPJHV
 QFZY0pnQMhhtSSNO9sQY2QJcQOdQu9z0d3meRbfdYAb1gP9IoBg/NYR5bjc2YDQMAJEZ75wkV8e
 0ebVKUXODaZDL4FPmN2i2voswcQT5Ykk/nmEQWTSIZoVTyYVGoA4iTenqp7I7pwqzQsvbvUKyal
 7YH1VZlKJiT9MfjH4Zg==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a1941c7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=REEBHDwWlCTOHul6J5gA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: xnKiLpYPFUsM0n2ufiYlTti1Ie8H6OE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290072

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

