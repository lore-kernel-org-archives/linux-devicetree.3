Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22FC39891E
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715323; cv=none; b=VElMh1Fw4p6XBP830fIIOzhsKUQ5MnqkC3nsIyuisc/1acznxktu8MT6Bdzmf8sSdlvGw6w6wTZiFML59IOUzbgfghh/TqMfhcLo5nfmaoCjThudv4qT1DSjo2o+GY/tgccLlWIB9HSp2UFsxFHdb5qZfF8c3HeWBqeNH92YI0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715323; c=relaxed/simple;
	bh=HblyWdM57G6LtvJB9vyRpkt5hsqzVFrrLD0gb+bLj90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pBLeHdYj1iOCymj/oVOklYO/nBE1OoTgpcpV9KRNENImS/hWdjzflwcT+axhp3dPOjDOVI5pBCmbUd5VTFsmzejcB6KCxgX99mlyLGcRR8QQ3SgE6NU65PVKaGU2GOeGQdFbFtDsq3ENVhlJi0RrvMoSJYgLKRHiM/Khkfj+U9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knPPBjpO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNWG0lth; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knPPBjpO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNWG0lth"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NTUv1777366
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/FzBJm8LvBcNxbiI6ot1K6
	jgl9XRo/13LCyM4DPE3bo=; b=knPPBjpOSMyCvlgzzciHW9HQ21NxxVCCN15Bom
	NXWBVXUsma7OCXO3FLMeeQexCxZgqI/bwWL5ebDgN0nyR1kaRRFyc9esdDC5m1Ii
	1cSwd8w15tID1b2MWeMG/nkx2rVwr5EE4P/bRIMOhBg0+vK+IycQ1vlzODViT5mb
	mLuchUBv2emQmh3bR0qjF0tpXWEkt7uAMTGtoMZ7UAS/31uwPUjstkjcs/EOvei/
	3AIU78GsxmOfxa8GUl0aIC3M2djFld2DBS7ra63BkVPcYHqwNvmXRay8029tvo9Q
	DoGfztRsHeyvaK48lfbiY9fZG1Xw2EHnOQQeQ5KuMaRa4UAA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8n4cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:41:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845ea8fd3easo1803330b3a.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782715319; x=1783320119; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/FzBJm8LvBcNxbiI6ot1K6jgl9XRo/13LCyM4DPE3bo=;
        b=YNWG0lthngHV3cboLLLsqgRi8GQSokVs5SCISsYbnENcMZym8Z3esbn+AJlOqr0x+9
         whh+0d56YgK/JBhLdF3hZZ1d+V5z31j6omU06vALOPtDAna42iHM7bW1iZ4etr8PlNtw
         gVJZS4uPrYLBRsjbWV2yxBQTI/989A6VfxYqc4z/CFs0xBhBVWD8iJDph0p/2/Izc9ku
         rF7Zl9PK14BorYDrqu9SWr5FlqOw1znGRfeDpdahvd9KNlNxStclv0IrpiTQ4LdTsXiU
         GJu2/7VmQ63qZzDNvDhp3Vu2mp9xZS6oeE4vzD109qwy05CZolLj7vjkySEBfoVfXnJe
         p1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715319; x=1783320119;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FzBJm8LvBcNxbiI6ot1K6jgl9XRo/13LCyM4DPE3bo=;
        b=C34U5IgjtY5gVxaynbYiXh/fseEXNh2hMJzyWs7dOtvY9olZGc9g3gYlRbFP2gbOEv
         jH+yeN5M1QpeI+WgixMmli+RTJKfHAiiBWwsIj3M/DLWIBmc4fNn1dXWIVYsRDyogJJG
         0Py0OaA25C5WTSqxYddXaNd9nF2eevilDEqAew8uDT5A9k9sBmvneAQqH7wj2+kqb+1D
         QHPo+ZEI3m7Co4948is2sKeij2LfozDxQu8LIOOUr7upJxEBFus0MZ0sx5XLP1q50o3K
         KMchEUDLja7a2NLK0TC8xC5bqOG7/Ua/4dcOhhy3Tz1p/Nbs+0uRDNR+qACiu1pQ9kH3
         Vxbg==
X-Forwarded-Encrypted: i=1; AHgh+RqDYmma9LxpMxqWrSAjFbxYw+4z1QYKPho7DVTnU+bXEw11t/Tz9GYi+utzByIaiHc/U66BiD4fFnxZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx16ETIMI02KKLW/oViN7X+tsxtb1Yo9jTj+jCuTkRu9uN7JU2
	uz0rVaWkaoG9ntZRkjrJMOSn865WlwiqRQYZEJr4eFwNHvqtqJDy7sHlz99oGZldC0B6YeVnK0r
	k/LTt5v9Iu1nVRnVipCKWusleJ5ldoMcGskTr0TDOPbwx+IS+Wj2aDeFg0kQVDKdv
X-Gm-Gg: AfdE7cnOPTYAxfUWm4o14TW/wqKj+rb/y8Y9HTkbzoxYxProQt2Yi6VbN7hpFBZizDE
	jZo1DZ2L2h2oLfKiFFDvr4iMRPdTcbIs4sqwVXSr/qmLd0K4Ehd4ytyTjNEB+3fBjR7dGd0h3Tr
	yJxBe20dCSeMv66Ix8Dxa8OUku0jMGcmafIMy9Au9W9hNKoFpHr+qejyATshEq604ynewiuSxJv
	Hnz72PUSUTpupjrNQUjn5CsXLISQpm6OrhVDhV8wVemTRJ+g18EUay0f/zNOeohPUU32IqspRNw
	qH5Z6IR1s7fw5sVHa2fB9cpE/Du+4Ib727j65psxzRLFXSNFt6ujCDxJNVYDMfclAwhCVyTdjtR
	xnRS3npNKvybKz8ysp0fjEYgfqAV8blX5wSJlJ6nvRb0=
X-Received: by 2002:a05:6a00:340e:b0:845:c6c3:5e79 with SMTP id d2e1a72fcca58-845c6c365b2mr10788876b3a.40.1782715318641;
        Sun, 28 Jun 2026 23:41:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:340e:b0:845:c6c3:5e79 with SMTP id d2e1a72fcca58-845c6c365b2mr10788859b3a.40.1782715318205;
        Sun, 28 Jun 2026 23:41:58 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8477cf5a5acsm1862153b3a.13.2026.06.28.23.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:41:57 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:11:52 +0530
Subject: [PATCH RESEND] arm64: dts: qcom: hamoa: add audio PD remote heap
 region
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-hamoa-remoteheap-v1-1-aa868b7a6e65@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK8TQmoC/0WMsQ6CMBRFf4W82UdoA5U6OcjqoKNxeIFXaWIpt
 kBMCP9uo4PLTc5NzlkhcrAc4ZCtEHix0fohgdhl0PY0PBhtlxhkIVWhpMaenCcM7PzEPdOIRrP
 RnaiKqq0gaWNgY9/f5A0uzbU5n+CefhO8w6kPTP9gKepfkObOelwECiQta6XMvixJHX2M+WumZ
 +udy9PAtn0A3gyuRLMAAAA=
X-Change-ID: 20260629-hamoa-remoteheap-f9ef9d1505c5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715314; l=1504;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=HblyWdM57G6LtvJB9vyRpkt5hsqzVFrrLD0gb+bLj90=;
 b=MOtfWel6eCfehsBHXNMlczjiGxpV6oeYcbcl1WVeW/xCUSSSaFXkLa8a4edgR2/tv2T5gGV36
 glX2HD+NNmvAzyAGox6/SBsJN7gCEs7rM7LR7B0O79NSwlwBu6ZiRq+
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX8W456S00fWKd
 odPRcqi/dEE4xzH8JbbRhMscS7WEFofxwKY7lQ4oJ0Ff5Sm3RMpZ5Zpx0O/qWhG72CS0C9WqCDG
 5rMVpOSIu676Btx8CAFdv2ODEzJMdWc=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a4213b7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sbOAbGusH4yeja24kEkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: mtDZfge2EyFxyU4zd6CV0UqL1nfRm1-z
X-Proofpoint-ORIG-GUID: mtDZfge2EyFxyU4zd6CV0UqL1nfRm1-z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX3dXGuMq1c+3N
 Hj9fJzDwYiBZAwrr1CJc2iZlP5DBQvyQT4TqZBZtDeiW1jtY8j/MPKU+bmSz0toUcRprJu+VY4U
 PJvvDVWx1wk+OHMu6KosYea8iGH7708ZFGPuFVGhVVQ44aLPFNVo8cJnyqqcpms2SXrvgERBzmt
 pFV2RXnUzWuOo0CF1VtzQddHzWp8KP/wv3iOUGDuHpfvb2ttNgQvcj0Tl2zPD2d3vaauxJEknxc
 GdseCIl4kQGkT/r40JSkNBOB5PoFBlYi9F3eGuvY6qNY+aTi9BhxRcobUQiJnEGFSNI5G/GrI7y
 R/jfKNZNzZPOaEUn6n6Xx23vuOqW1iYh213u1dXLM6uTilhsXj4+LDF7PkuSjrM3Il+vqMC61r7
 M9kSDtg1Mq6RMkyWds7ehqigS5PT3FhegVWeP1IWXf2ZxQj/ft9grFwjT4hHu3k8SeF7kaW2yWl
 1ByDqINZKooazO5Js2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290055

Reference the reserved memory region for audio PD dynamic loading
and remote heap requirements. Add the required VMID list for memory
ownership transfers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..a0f42d27372a 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
 #include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -4371,6 +4372,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;

---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260629-hamoa-remoteheap-f9ef9d1505c5

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

