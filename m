Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA64C372ED6
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072971; cv=none; b=ERM2skm+sWuaa7htMLbi+pjhu9vbCYvgU8syyWC6qhmLVzAZf98PPBkVUMlp/EP6S/sOSfdsnSUPm5JcT6o/riRX/VZO/fB0lpLp+rnSjgsW1Y50FmBHV37MVD9xSWELihl4AldWUBLLjBSisrYXu9dBU6iX7K3o0K6VHWC8pOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072971; c=relaxed/simple;
	bh=PL9zmVN8BWp3nl5/LHjxhY8CnaUHqSBGA85pMRKT9tE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m5YPCjQt1+6L8PETuOTkfBRSLswcR7JXlVf/PmUegJ/4Wrui1IC2zxfqqw+S53mI8DIw0H9AsWJSPTVRxYR9mOHFrcBiS9fiJNgWU45DeZItT5Q0COojQLROyU+U6SPc+U0FVSExEg87Jnoy9ToqYic6TDvN9OB+CJLDWuINUQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RSXfOBAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QN5tTD3Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RSXfOBAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QN5tTD3Y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A45TmG388089
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uSzPiF48skHxSUy0gtWGpK
	Uh+MzE6AD343iEXs64/m4=; b=RSXfOBAY27M70ccj4Z3FsgdGsksoUGEqStojOE
	2OV5EbVMtJQ6s8xKj53yPFYVldxGD3oeF+G4o19LAbJ2yeRkCN7C2WBIgoJLB5Sq
	Xcz7SUBM0fgxu2vPDCLQRvMyo8DoENDbEonP5EhvUaf3wZp8UllA2jstBF06Ia80
	vbSI5yGeX6oTzyLdSOJGdpIDmt28wj4gcN9UCnlm1L0FNgaUQS9/vznE+KEW6BaK
	/K4kAerA4fcdov6Wk4SJx83V0gEahCR3Z0wXpAwm7JH8TT9QhaSghHKiduT2FC2D
	pU32EaHRYxjGGEPURZZXm0pn1C34u92BTLIKuhWXudD+U2WA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd8eby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:29:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-307625ee07fso6880046eec.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 23:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781072968; x=1781677768; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSzPiF48skHxSUy0gtWGpKUh+MzE6AD343iEXs64/m4=;
        b=QN5tTD3YgL/wOauL2ZTAGBOr8J0AwROjDGGf13CjB48iMyorP+/I6LokyMNsV4MUqe
         pEjDE15wy82HRLShulMMESHTxmYw7Ulvr6PJEjtc37iAaa6vgLyW6UlaRNq25qLIYvd8
         4tS0zIVmFSDSwY2BGwMgJB6Xnxpyp3u4ZeDGpETiei25QxrOHXV7XFdsAMLaIJL7Z2v8
         8zUQPxvLw9oWxbiYoaFlGojR+RKx0u97BRYkR++1jvXBXmeMQeBjgNcl32tKh8YYJIYI
         DHCGpbW22fv+TSj9Hho5V8HkvmZfqi88HhAaCQ2tyB0eeGwKW1EguYh6/y601WcFLHNy
         y+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781072968; x=1781677768;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSzPiF48skHxSUy0gtWGpKUh+MzE6AD343iEXs64/m4=;
        b=KIpm7X/y0ZWDZeR0ZeABG8qpGTH9lOs2sbjoeHSmbTWBj+4AQlP6vOe6Xbwy3rlmid
         IODzNuRKS6klNc+0zAoU1vN6lWjtrUkyMDU8S69gK/T5q6rKWnWUlSDD4Fc3XW1ryDiQ
         RULeSXWLkn8qImiL70/7C91IwX9SOkiHSUOgi93Ks9e3hEcfSXfpGwDNMF2fuurCbcak
         3sbDRx55uxvMmUrOPqp5H15FU9RBVWu7KMatgj8preSMATJtwxoWmEck3/tIB1uklOJD
         pYT9g+PiJAEvdJJeLaRybzNjv7RTJRXzBba/iWdlX3hPPZJqllO+GMHl92OqzXOM0UAV
         IpAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9IyniZqOxrxSHWjsibK/4gedN8UisBNqiYHhSHP4F+n5R1yNe7pbUP+2+Uh3IFWY4I6S7slcqdddnK@vger.kernel.org
X-Gm-Message-State: AOJu0YxBbK9eBDBI7aozpxjl/QKJY3J88pLUUbmICmrPby5ixHO5Iyq4
	7bX7Lh3woc65kY/1/fHCrmTLqWgwt/O137YohpyBabXWHwol/HoSPpDuOVBSLBIfSWFpTUim3tl
	xcVuAl9qJM+ifFWWxdfSYzean0YnrQ/kWuTsqjSqYn8pXmI64QZJHZ5Txpc+09bgm
X-Gm-Gg: Acq92OHwdN6tijw5Mqmvx/qMidRIoqYrfQkFNHps7rPul+kDRXockwJ5oSVrhnSkNEl
	WWwU0bAA7qHgwK0ytPda5hinELJDML1AkAn3gBzEIi9rGJWWEyAKbQgYgknV09fAhJnMNnsNnrn
	LulzQjtFAjA5Ait/OrTDTak/1rFiTyALnCnNWIg8hFr7MuHydSChY+KSV3J9WmJB/3+RLnMaOSx
	59FgIx+3LFhXDaQhyLALEuc8v82jBer9twUxoPbhqVtSZTXdanJTDBXr9ZrG4CzQ4JdSJl7/n/K
	RsoIIsEGfNqrXhW4GHYE9xSFwsYly7114c1Zj15Vy6cjZ69xji/SQ6i/QN2dLPZ/n0kN7SlaaUI
	wjDBBbt56+OralVS9Jja7ZZxUvE2ALj60nUpfF4YmuePnmPV3X3vYyogfVsbUy6RpNcHJMP7QeU
	TLeudzMRxk
X-Received: by 2002:a05:7300:231a:b0:304:8366:9fb6 with SMTP id 5a478bee46e88-3077ae70f45mr15817130eec.2.1781072967723;
        Tue, 09 Jun 2026 23:29:27 -0700 (PDT)
X-Received: by 2002:a05:7300:231a:b0:304:8366:9fb6 with SMTP id 5a478bee46e88-3077ae70f45mr15817103eec.2.1781072967160;
        Tue, 09 Jun 2026 23:29:27 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcb98aasm23959540eec.12.2026.06.09.23.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:29:26 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 23:29:24 -0700
Subject: [PATCH] dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible
 for Qualcomm Maili SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-maili-spmi-binding-v1-1-80fc4b6bb80f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEMEKWoC/yXMQQqDMBBG4avIrB1IpYTqVcSFSUb7F00lY0she
 PfGdvkt3sukkiBKXZUpyRuKZyy41BX5+xhnYYRiakxjjTUtryMWsG4r2CEGxJmDEz9Z467tTai
 EW5IJn9+0H/7Wl3uI388THccX7Lg/5XYAAAA=
X-Change-ID: 20260609-maili-spmi-binding-dbecf60b498e
To: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781072966; l=1220;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=PL9zmVN8BWp3nl5/LHjxhY8CnaUHqSBGA85pMRKT9tE=;
 b=G8H9L9VJpB0S0A/Igoc5N8iIx8H24F9vRhJKlJYF/ozewAxm4adfbUjpflfNJxrj29kVQ24tN
 qVm+lENLFIFDIfQxf6W4DdQV9SVxS0ZpmseWKGz89smCo6LIr2CLyof
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a290448 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=w-QGtfMo4T9X6HggfYsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: uBKROhEhAQ3egA1wpsj-T7f8pgalf67v
X-Proofpoint-ORIG-GUID: uBKROhEhAQ3egA1wpsj-T7f8pgalf67v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX9Xk07Qb8HoWv
 sSi+YaiwaKeq2VOT+dsQn4DQf+SOUVzjZUfNsIC0G9ha3MR5fO0U036d4TZHdfzd+cuVAcjNCgz
 007Wd1d9nKpjpiyHB/jpEUQOLJqNBVrHDEbWC4GBrfnNnJ02xJ/FgXDvZT0mGIOIr8Uc3Rt6bN3
 U9B7Nx6Gnu7wVw/0x+TkNOxGImyMPIXqBhVTM70dsH5L4b6z4t50hbZ3U+PCG5HCsjiKNeDUx2x
 4NY+X7eU2mmObZWmyveIS4LxvWQVfCUs/IUH5+7ztR9+gj8SFuiQPTS/PiwRMkdhY/CHLMK+7XP
 ZxQbnflw5+FcSQShS/UFHr8X1r2ql8pCuthX2nWLEgYDUmTiuSeQ5MoeK3CQJ/Z08eY9Hg3271h
 PeyoXvqeN+ys+xs/YpCRLJbcEh0B3vp/9Nmx/sGAulxJg5KlSBxkW12DtQik/usXoT+rOThGWyv
 coIYbpR6DdJpcc7Zt6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059

The PMIC arbiter in the Qualcomm Maili SoC is version v8.5, which
is the same with Hawi and compatible with Glymur. Hence, add a string
for "qcom,maili-spmi-pmic-arb" as a compatible entry for
"qcom,glymur-spmi-pmic-arb".

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
index 1593a1183a36..44c864fd5fc7 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
@@ -27,6 +27,7 @@ properties:
           - enum:
               - qcom,hawi-spmi-pmic-arb
               - qcom,kaanapali-spmi-pmic-arb
+              - qcom,maili-spmi-pmic-arb
           - const: qcom,glymur-spmi-pmic-arb
       - enum:
           - qcom,glymur-spmi-pmic-arb

---
base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
change-id: 20260609-maili-spmi-binding-dbecf60b498e

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

