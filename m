Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099C5430CD6
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330809; cv=none; b=QRccS2iSR0+WqFXBmgqEnklGZP9bPonMfXdyPhHmNKOQ89DQi/ij5vMk5DKQ22dcQ645iuW2hYil7vEDjvizDiYPBb47MInsdNDVVySu/751K3fuwOgCLGnyj0Wu8B94Bd/jgngM5JdWeZCRwWeecVIy5fgn0pFtJKCAJ/5BSTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330809; c=relaxed/simple;
	bh=xM4SQprlceSTwiHBTsSB07sLKhOpKiDutWA+2XMj2yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BhchkJ7+UyG7qvNPHc6z3oMiYWGvQBtOzRoFcHGxzFtOttLx8B0TvcrEsb9XvrGqs1RSaWiEKF9X7sUbMpzwjWuxpsLt0rwNyfsIOmjws+5xAcx96qdGTawkK/fGaWyGdV15FvwD3hlx2+2cST1uPolXcdIKN2kO5X94W8GBm5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6nMAEAb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gC/sIio1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6nMAEAb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gC/sIio1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693s8t107427
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xb4mdSrhLOY+4qm7Lfo4wVFtobEu7uX/Mq8l+gW9Ydk=; b=E6nMAEAbqGKJD8BG
	YhhiOoZD/zBpRbRdvccqqt2qL081zDaaaAJ3sJzSs6kOtQA9Dqqm84+KW+7M69Wl
	SyU8V3nmEXVsC5yBzgimSZiUQ7oqcPQXxwPlF4qrLpGNtxoeYtT/wcFSnV7Wou55
	BZQWbWjnzeMUqJSb8Ia6i38tdm9woGNAMYnUtuNGVSGQnbG/r1b1hha74vZi33P6
	t53D9ReOcZ3Y2sT2Yj6jwbcdVrjiWaxNNMpgoU2sbf1xkZTO1O4FOltdhg9GwMu2
	YJBHfQCSNB7wCYblixlHZHBeagmGqA85hZ2WK7S34eOuiwwuCkr5/vHrEECKFgau
	Y9k+KQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891ur7jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:40:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e61b38eddso513253385a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330802; x=1783935602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb4mdSrhLOY+4qm7Lfo4wVFtobEu7uX/Mq8l+gW9Ydk=;
        b=gC/sIio1pCycxDnS2ONDvMFVLUGUdSOqS8pDGsan+Ew9osZ/eu4e6ndSO4+rodMPtO
         nETK3c7TfkJ0h9Ef5DBGqJ6UX+ZPF/282dh+P5gXhkVrYAbKJ5KbN5WtXtlD8yn0rXFm
         wuaR2JXBs2ThC8iE9hGRgg4BpLcZ9FAOit13spAzk87xTKbfmoV9iWhPaHpxd6rH5bM2
         Hd0hnGMQTgw9BJXnpuGSjv3OtmVzjWTlyFo7uTT/f03yE0N1rBruIgYPMwnvuLxOZpmZ
         55o7TfhAelyaglGJnGLhY/Ot/CKFlhjGCMYGF2lORtAOp+H7bzQpPGR7TK3wXf3AFje3
         gnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330802; x=1783935602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xb4mdSrhLOY+4qm7Lfo4wVFtobEu7uX/Mq8l+gW9Ydk=;
        b=L8sRvyOLtWLCUEHBjGihMvuHxRmLDJ9oLWv2tSY1yCJNOuUE9QBg6rw/Vagov6KBjK
         lzfd+AbEQ3/4fN9F1M0ZP7rLsVMzIv7+yiJOoPXnXpU0chxJZFOjM7vEhnuBEjG+wFe0
         6OXb9fsx/kelxgkcVKPrc2WfI2EHDOehs6diBqg8IWjY9Vv6eu22hNUnCyRnB43OyPpy
         PohOX3YP2bMYtxMmEgvOriBCUB0nkqkunNrUIEgNoCy3oYg3g5gmp2paVPhZ13Gu5V+q
         JcTsPgH9jDNLSz3kPUWJpfT6SOd7DVdUciJGjD1QQ2XElcUZ3Du8dLOKMmAEOtcV1CxK
         nAhg==
X-Forwarded-Encrypted: i=1; AHgh+RrE/gEFAZaFcZM/b+oonPyOdleuOz5oZgcZUodoIEqaBNNz717Grgt7QfuRdXpXaQm98OzxKZyxakNg@vger.kernel.org
X-Gm-Message-State: AOJu0YwLfr57H7D34IKoX5MP+rz2O425ZZXhiPECiw1l8uFNZYhBHZot
	w8BhyT1mmXt+9QBkVPc+hdCDT2EvoLZUKhU90gjLfHOOGpEuo1LrOP44isQQJZ+SZG3x8UlyaE6
	66TvoIQ280yRXUn9LGzgAUNcjm+oGr9W6dOfxZnwWPgvbUS/UMXU8SB4JPy54Gxaz
X-Gm-Gg: AfdE7cnronzC7ZtAcghKw4N+JnMGpVjMqNXPmEEdqK8xWmDPEMGd4dNMNDmXCWunvRL
	mSw4D0Gw2Wpwszlq1ag7vr3GF8BtQaohIdLbVtFgGDnqcSRrH8BQfoDDEGfc7Os/bzgMSXrlbGI
	1b2HUleYVinJ5Ec4sTFaRcDQiAhJOdCBD22LOsXriPslx0E6YzkEagTut4mvRIIBTaU4B2Q355X
	TtyLn8qqAU2nAAaxNh4V1VYa6RuMpgtKYVHPIBnpGDq+3027TjVM0xCgs30j5ENAqnOI9A3HZ58
	2H/T/wgA2G0flGPwB78nshYVlYfJ/BD8ByLv3XQutfwJZ4NDeYidIfs3icW2Z6Mg/2nVAI/IpgA
	s1ndP1wFVvkSF/sAt7PJFj1nepvkUehgyM70=
X-Received: by 2002:a05:620a:3710:b0:92e:541e:632b with SMTP id af79cd13be357-92e9a3621f2mr1245841485a.2.1783330802083;
        Mon, 06 Jul 2026 02:40:02 -0700 (PDT)
X-Received: by 2002:a05:620a:3710:b0:92e:541e:632b with SMTP id af79cd13be357-92e9a3621f2mr1245838885a.2.1783330801755;
        Mon, 06 Jul 2026 02:40:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdb566csm259144095e9.7.2026.07.06.02.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:40:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:39:47 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: Correct whitespace around '='
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v2-4-90c781ae0417@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v2-0-90c781ae0417@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1953;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xM4SQprlceSTwiHBTsSB07sLKhOpKiDutWA+2XMj2yc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3fnZIMZlxEKWqrvE7zjv8fcTmDkwsRMiKwnx
 c/gIh3aOqSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt35wAKCRDBN2bmhouD
 1353EACaa7/rtB2F0fESQvgHDFFpso3uB+Gp8/K8FpnzHOwd8geEjINdC2/mJKIfaCdgzlV6njG
 PtcXOPUjSBxuY5gVtsWk8Ac/Qj2DRiblc9mm+Z6vXBgP9QfBBWg8hPnM14gLCtsGAAM9wAQiT9J
 tG18/h5f2KarCrLWN+wY++2qdoDveJoZL6j9rt7Ims5bulM57CJLG8lGj6cNMKlspg3FYLvCDxh
 naZRzlDeSy0Kca+qFMkFRLQrG54dRkEj+u7u065uiE8gx6BbnASzhHAtErM40Uw2XFctvTw0LKk
 hv2yF1L+B+Z6eZh3MCXE3c7Tq26BReIH6RgY86qDAODK6mIQ4v0NHp66DQck3W77ek6zFo52v0r
 vnCOD86acosu6h36DBTh9qdFjJN9g5iakSn9T9THbyJfE6H6j7T+v7nunvDr2vXNtj4ilaEiKrZ
 BluAhg9U7/0GHw92DDGRQRIawZUA+C28AW+e4BkQjgmIlwg5+9ubw3zSAERNNF1R9Y3V4x9JjOY
 e+duVlJwYB4UsPtMNO66DXncKq4tfm0NFgZlmtU99XxZR2N0d8TGZZTiXACv7svdC9A3rzFy29+
 YY6YDAu9mu0Obis3Izmgqax/daDDo+zMxIRr4b7XaSz0OH69DXOfkF1PGS5pnP/GvQWvFIszzOi
 gb6wiEi0BIcSk2w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 9X30Imk_o6NSo5pfp0TDj7SfHMW5zy45
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX7BTX9uxeXG7Y
 ZlsdOIbLG75lYZq3ZFPB5aNUtMAmZWk105sogWV7YKTbpNWSZcXqtPqvVBxY4QZMgfpVMtUul4z
 DfMFmXB4UdRGw65FrXJqmygrY9G6x54=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b77f2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uWOkq5aS2IRcaOVXy10A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX/4mvpPUSwWaG
 lrRBl69lKlqMQKMeETNrS6lULh6mt8ViQdcE2WbfG7GD9a0JVjH2XAgZHHEkAiPS+5peQV3L0em
 kpyjkmHpKpaIC3HJVyep93XMRUaDb/dQWIGr4U++sfe3EEiGfqTtSBJ4twElq47gfe6Ww6UTxBn
 5mtAlhHwZlEJH2ot72ycmLUrvEjbas1czOsYJ8n2DhLu2xVLb2P/nOfYAK59sAwo8N/38YTJKld
 gvKXjYJXAsY/pOh9jHYZNNjq2xh122Mrh+7oO1iNYjGuufoUBwi9hTYd9jiRYMaOKFVjeCZgauR
 6K10tjUAkxy2uVx8k/XUolN21JtkPDIfvR5jGhqyChFZygGLcbrJMPA6d2aPY/eZcBgDg1LYyQZ
 tqdBurD1brZuHAbDmJ8g8NpCkkpIgjJ3HuqLFZvTVDXpu1lxt2x4fkpcqxmtBHm776DveN0/ncW
 JKNs4NsOeqxBpMnUaHQ==
X-Proofpoint-ORIG-GUID: 9X30Imk_o6NSo5pfp0TDj7SfHMW5zy45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097

Coding convention asks that equal character '=' in property assignment
is preceded and followed by a space.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 20 ++++++++++----------
 arch/arm64/boot/dts/qcom/sm8750.dtsi             |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index ebdca0e2d2f3..0c90c886b2c3 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -449,16 +449,16 @@ vreg_l2c: ldo2 {
 	regulators-2 {
 		compatible = "qcom,pmr735b-rpmh-regulators";
 
-		vdd-l1-l2-supply= <&vreg_s3b>;
-		vdd-l3-supply= <&vreg_s3b>;
-		vdd-l4-supply= <&vreg_s1b>;
-		vdd-l5-supply= <&vreg_s2b>;
-		vdd-l6-supply= <&vreg_s2b>;
-		vdd-l7-l8-supply= <&vreg_s2b>;
-		vdd-l9-supply= <&vreg_s3b>;
-		vdd-l10-supply= <&vreg_s1b>;
-		vdd-l11-supply= <&vreg_s3b>;
-		vdd-l12-supply= <&vreg_s3b>;
+		vdd-l1-l2-supply = <&vreg_s3b>;
+		vdd-l3-supply = <&vreg_s3b>;
+		vdd-l4-supply = <&vreg_s1b>;
+		vdd-l5-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s2b>;
+		vdd-l7-l8-supply = <&vreg_s2b>;
+		vdd-l9-supply = <&vreg_s3b>;
+		vdd-l10-supply = <&vreg_s1b>;
+		vdd-l11-supply = <&vreg_s3b>;
+		vdd-l12-supply = <&vreg_s3b>;
 
 		qcom,pmic-id = "f";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 71a70d051283..d5f3ffff0600 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4938,7 +4938,7 @@ port@4 {
 					reg = <4>;
 
 					tpda_aoss_in4: endpoint {
-						remote-endpoint =<&tpdm_swao_out>;
+						remote-endpoint = <&tpdm_swao_out>;
 					};
 				};
 			};

-- 
2.53.0

