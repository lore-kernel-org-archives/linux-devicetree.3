Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8844A390CA5
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270093; cv=none; b=qbRSUpm1Tyn5bTu8imFKnvCH6RbBd33c8GV4SfXhtHu406JoXVP5e27Grx+aRWZFoiNJemt4uKiC6XUvjkqN1UkybRQ42YNb4fAL5P5dhgUcGN27hPPEdB7YR8IcRoTilS+6ksg8PPqqK4Eu7KZZczqVQG94W3mx5TBWDHqItmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270093; c=relaxed/simple;
	bh=uu+2PjXiWRj4acvW8VZCOTEzlkSvx1D4AuTsVFzuP7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q4MdtfAm41RkVNRpLLupHPZ7go/aZQPCBIvc3DoGdCnCR3q6SNiHQ0ZSVgSN3B3RW0D3L+lrp/2jBAn14/bYAHFwj6YHdystPuB3iHlGJJTq+Wlq+O+C5MlkRqbALzSWtF1DnS8YSJh1NWhC9tOkjRumuMyIW82+jYfmxZBwTos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvQ6jWY6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FODtchwi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvQ6jWY6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FODtchwi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N9iVDg3990188
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NFB8iZan+a9WC+GZEmQHuw
	wOaIi7wgcITcVT5BHpS/M=; b=lvQ6jWY6adzII01ydC5hYAiAFl+N11wPJvV9zD
	MUWO2KmTWrKGSHetT8CwvgqhMD/txtJfciFROW3DWIqnY3jleFnj/xI9ndRNqFbV
	PNwu0MgN2X11Az0zrGPU2m7Nc7IkEsF4oo+z3uWFyikNs8cjW0yXjNg8x9HRPELk
	ycyIWm4U1f89PeJ4ahOUmZRC1u05s9OXEvzeYmmnqtHkmFIgkm/9CboQ93V6Hvx0
	DuCgU1db7UbY1KKDFZolagUGxFLu8K4Ncc1TEJEAlZhOOSYOSSUspz5xMNPk72nn
	wg3sxKEXXfKtmRqDkU/UzUzVmzIdh6Upnf/ct+Q3MAM5SfDQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghd93d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:48:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3594620fe97so30511506a91.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270091; x=1774874891; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFB8iZan+a9WC+GZEmQHuwwOaIi7wgcITcVT5BHpS/M=;
        b=FODtchwi3R7mklox5QEpXoxcsnNk0CZxAq0uRLR2XWGUFC4EvwVrH4dgKNvt8l1m07
         nudhawkuXmJeQ/FzrbGAg124HMkhUgtjRmY6kZKP9qyD/gjTiuZPXdVYpRlkTbk2DFCj
         uMv/MSFQUbbYZHN+p+ezPENf1E8SOYBTlphgHAqt6D5IK33pjsoZ4aqBc92Fd4Nuxl6L
         8o8nwrufrl0+ziVyJt2Rr7yX47cCbkOxBeync5xw1KijMZMdQ+Ot9Zgv5X/ime/I9Xoi
         2cwdZ95d2xO77VGe/kGlFFo/Y1ai3FjBUd5QbC9p72yq9RCpchCdqkzw3dVDsk7giXYx
         Pzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270091; x=1774874891;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFB8iZan+a9WC+GZEmQHuwwOaIi7wgcITcVT5BHpS/M=;
        b=DnXO2coGQvtIXO2WjBPg4WsrRJp0gM+koLcWaTjHu3/gLsGH4oWmp4ZcI+RIaSB9pI
         8AgVTkOeC9pUvDdQi91sZ8ZUjdHuTPS4H/UzHclIoUZGvCCo2mGun+JsFj5+0C0aNPLP
         S2zUSrV0FCbwz2IWnhHfbUfFxJDihUv18hptdjhirTNAjUeVAKCNrzy0ptdqA/PIePHx
         OLfy6zHOBxMhSGZONfx8kqFCE28VF+X3r+oiB7sRyBsujK3oLARS0Xl+hdoz8QmHwHo/
         ZK237sIDlilEppThztqugZkY50pCLrfDwpsZtQVTeduEMhU28MqDOtXzUGMFYCmwaKfg
         ewtw==
X-Forwarded-Encrypted: i=1; AJvYcCXuD2owRph8YE5QM4JQK/w6GWIb85kUWPOZJqNnpfx1cDhmYvs5rAfp1ApG/BcgDa10QEg7/AYJWsJ1@vger.kernel.org
X-Gm-Message-State: AOJu0YyShHEl+rzeYtfNftuU5i4M5AkABPOr8QBIdjSIS6M2PX046TbL
	/JIyj3Z21TvpLlu5gCyWe87vUkyMAZy2WC09YZzDAP+LKkmsy2Fi36S3mgLMqHbiiKznIcaBcxD
	ag/wN8hPkiSar80Pw0HC9O3OzHKUCUvf420LWx11cMr2PjTrjGbHvfWp6iUz2tIjc
X-Gm-Gg: ATEYQzyr39khQtor4/szZiPhidlkxHdC+N1KWrygWdoCGS64dOdflL2UVEHFBDMjVYo
	ty7ovEy0ohC+Ob+Efz5uWUX3myetGmCHTQfExgXnbup27ASiepLtKV9wPnV+mUy6LbQ1VJZASJ+
	CiDt9ofknJM5Pnm7CTCZf6LBbVFMQIkQVwvhzI8jGvCsWxIiWUsuQ7hsWhdu48G4ETKlUofUtTQ
	fxYeGFk/j3xWPQ1yo67s6nAiKKUmzd9zKff7vGLyZcx5r69Ho6gvoEmtm+T01hzvDB64uYQd/Po
	3P1WBhmCZHHach7PcwNTfPWaSjRalbXlLQodUHkrWG98t3peZ2WyngfOUDaAa2/HTwEUsqpBiFY
	KVE76eSmjdBKpJQ9PC66kF18UI0fdlHdf992lwRMekxHOggY=
X-Received: by 2002:a17:90b:1848:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35bd2bdbe0amr10163562a91.4.1774270091069;
        Mon, 23 Mar 2026 05:48:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1848:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35bd2bdbe0amr10163552a91.4.1774270090507;
        Mon, 23 Mar 2026 05:48:10 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd33919a0sm5372209a91.2.2026.03.23.05.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:48:10 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 18:17:53 +0530
Subject: [PATCH v2] arm64: dts: qcom: purwa-iot-evk: Enable UFS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-purwa-ufs-v2-1-58fb2c168786@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHg2wWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNj3YLSovJE3dK0Yl1Dk7RE05S05BRjsxQloPqCotS0zAqwWdGxtbU
 A0ReI4FsAAAA=
X-Change-ID: 20260323-purwa-ufs-14fa5dfcd36d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c1368b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hvrb7UO-hx07SeRrPXQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: S5k_XLj0MCJjbZaudzzjH7PyZwCMK3_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OSBTYWx0ZWRfX8lt4m4+cqTrl
 AJLhegYEM6RQK0jU+yVWO42BoAr4qI/hsmgbK4Nok9STFSxn5xclbrFxgUaIqnGhA8xHMaV2gUJ
 SJWqVLRyo0sCYEPuECulv1n7yl+n5S76VBkmw7gL25WddW3pvAUB4LNDn+e8nWeppUa5aFQy28E
 ES5tHnGxdvVdqCFZN4z6TVNWO4U6EZEsQq5kt6uM0k97Fdzt3WKJ1jqLgkJfx/uyyi8HLc9f3xf
 u/2nifZIfcNzcgAEqaU6UP2VBU0udoM/sxYq5M2cnCZaWxyi6nxHSBmvIBlapeaad6YVLQvX852
 9233u/+2GlgfpYORHwFRBkVVcdCclz9IYCux3R48DJVTCDuQr/WiZZzkTGGcudqQj+G4uw3NZMa
 6yTCPQU8pzMwNjQeDIz97xlagqp+4ZXx5w2gnb8685WWbPzxdAUGD0k4sTIrIysd66Jfh1vzxiB
 PSKlm9ShGOu4iE3XH4Q==
X-Proofpoint-GUID: S5k_XLj0MCJjbZaudzzjH7PyZwCMK3_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230099

Enable UFS for purwa-iot-evk board.

This patch depends on [PATCH V5 2/3] arm64: dts: qcom: hamoa: Add UFS
nodes for x1e80100 SoC
https://lore.kernel.org/all/20260211132926.3716716-3-pradeep.pragallapati@oss.qualcomm.com/

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
Changes in v2:
- Sorted the nodes alphabetically [Mani]
- Dropped cover letter for single patch series [Dmitry]
- Link to v1:
  https://lore.kernel.org/all/20260317071311.1696361-1-pradeep.pragallapati@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index fe539b1f4567..f26f8b648738 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -1497,6 +1497,24 @@ &uart21 {
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l2i_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
 &usb_1_ss0_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss0_hs_in>;
 };

---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260323-purwa-ufs-14fa5dfcd36d

Best regards,
-- 
Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

