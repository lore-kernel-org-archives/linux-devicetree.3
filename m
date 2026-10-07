Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0A243F8CB
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 17:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393227; cv=none; b=ltqK3jaABhxW2FqEXQYpTmhtFW7lT/6KXCw+y2XkVLVr6Zmbfql7NfqCC+XBpRzP5pjGHBhA70Xwb/J4voXlZg6sMmvHzbTG5uqMIo7kYEPNzF+O3LpTpCjD2vif0TDBu3bzWPNlmjzBWW55L9baYhkX0VXLbXz3z4T7vn/TzIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393227; c=relaxed/simple;
	bh=mQpcXGi6W0R5kfqzYup4R1patFpyBQf4cTe6pZfPMgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gb+zAf7QDh5bPjxsOaZB1Q7OjnF2qU9WHDOQrdEUO1lMG7dyL7gKkdOZEi/RW1RVjMTwr+/oEGC4VXsAjgRj5dNfp+WBg0LtW8ctyeabV3HbwtC52moWC1bJG0vbAP+a41SzjF2AF2tXTJvQuzuZd5YICEVKrkNAyKQvqVuIEwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOrWObpp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jyVMNgWM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOrWObpp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jyVMNgWM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtIGw3417590
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 17:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NsUl3Havz/JIP4I1LoQMq0DuwUH1IupZVrtJEHCx2ms=; b=JOrWObppZXZlsI+8
	MLs4qBFM4tBBqFfIPaBz9QiQJY1OgdQltS3+CdL0KrdEJughBvYd2//gwKWXrHnQ
	eyWwPVtRr6RAoz9EfrbSDgWHuQqEc61zmQQWb2w4d6qpZzhg5XoL6HbZGP662t+p
	+9gcMyKmlOC/68QVJYLz0gWIUplmLbdqpHqosfnZcJcUnBK2rle3l7eDQIzRBqOm
	OSgoU9nju7mG/ut0Owuk+z4yVCdZFTUb5vt9iRaNDeGDYQFkChtI5X9IPiV2y2k9
	LVCGUF9j5WyOWyTXdwcsgDG5zgCMfaJ8rMrT+cN7cIeHtbHwjhfAh4aiFeTFKwdt
	ZQ2YOg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u37td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 17:13:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e5dcd82b26so18882345ad.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 10:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791393225; x=1791998025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsUl3Havz/JIP4I1LoQMq0DuwUH1IupZVrtJEHCx2ms=;
        b=jyVMNgWMfmepbgwSTgJJBr/NcDM7qZo/psIMjshXn+LbI/xvk+5e7ypB+cwC6y37n8
         p2dsHgYwyEjI3rZoM6/PtglOp9APTeug347Gelr+3/YQX7zidBxJRHk7WS3Ey1Glffqn
         hdZ00PzzKTmSGqy08JnDJ04mF5CqgdfKmIY48rH8n8D+pVjg+BWGE1AThHjHbrkBG+wJ
         xB40Cpfqe+tsQxf+aIIhtJ8Ub0Z7ElRIoPa7EtDNqWCahpTGAMDnywgnbGNKCY2CYmHS
         9yTrbYQjvh9/3uunxp2bPQIlbC/n5D3rTEzvdu7w27tKNYzVSgbJCNtXNae9gKgM+zXt
         4K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791393225; x=1791998025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsUl3Havz/JIP4I1LoQMq0DuwUH1IupZVrtJEHCx2ms=;
        b=ByITnsBMxgMUnhWsAElxzNOOKT0/g2GbgJe8ZYl9VYhlIpjEe237nfBCaUE5CyScpX
         PA0R78fMZ1FjtRHZnEYVvK6EExAxhRo7pbs/dLxUiGciCEb5KbhenyZ0JJaJft+Fzofk
         3gYOJbXJGFzbu30G1I8rMBCILFVRPpyvb9Ff3DFStF1opSI/6NX6raw8I3LdrKu6bncO
         KGOx89SrbCSWAvvHq2xVfWxd3n/vGu0WcP0Gn0ZyvUJhETtFx1kZkyyYbHZzME5+vDyp
         1325xPF9+WtFIFwXdCngwLsCm1RY3VK0V3LvezVxcFStiHqMEsFsv0s0Jeu+tEjxseLL
         U1GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL6TN1isgK332CqTa+KKspyj7eeOoVkCk2vpPHBs2/12ucggONiA0okU2kV2dRP7svTmPZoJCjol1z@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3zzd7HwxngZRC7dqoVMtmC0ocHM1EQTW1EV1tuelRsfPJukgS
	vkXETxsnewkPuZH4OAnbQstzzBmEvCWpsargsN5AOu0GBswyVRi7niNQ0M+4bKo4jeeV5x3XMv/
	ikcCKJp5uMFeSf1+l+DQFr2VQF4QT8yTxdjd1B5BILmMJatfAYoQPpYeKo0qzoDSE
X-Gm-Gg: AYBFou2qr3TMjoFAqXrqjyTeSqdl3eCqkQe+p2C8IjstqaJl4LBXQNM0mE6QON7jIEM
	j217DURkeqFfurYk20idhlntbZonL2eCRKwvPrIRlNbRNUpUbQkAtO+XXjnk0/AZMKu4BFL870s
	iSE4hXrjT8Ahzi2JNpJYDuhWBB3NmmFrKGeflTfetj5DppkYQYdlMwwhGEV/J8gROIujCqVZUXt
	PW5AfLguUbvf53cYy7QSTXYi6d9eXPW/WsL7rceo9W+GMySAdjFRcyWSkUcXvRupYHkfvZQbZHG
	wDO8tgpegmfR3zqVx/DERIjhqL7ADHqfJfWHz+u1C+LstCsoXg2y5iKtpdJA+x3YnkwxDBP0JWr
	iXmjqpT2CfRCcCDCMM/tDD8/ReiBwVHiT
X-Received: by 2002:a17:90b:4b88:b0:3a0:d7e4:c4bd with SMTP id 98e67ed59e1d1-3a8a1cae841mr2585821a91.60.1791393224948;
        Wed, 07 Oct 2026 10:13:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4b88:b0:3a0:d7e4:c4bd with SMTP id 98e67ed59e1d1-3a8a1cae841mr2585791a91.60.1791393224375;
        Wed, 07 Oct 2026 10:13:44 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm303304a91.15.2026.10.07.10.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:13:43 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 22:43:20 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: glymur: add CDSP FastRPC extended
 context bank
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-extended-mapping-dts-v2-2-fa9e14900313@oss.qualcomm.com>
References: <20261007-extended-mapping-dts-v2-0-fa9e14900313@oss.qualcomm.com>
In-Reply-To: <20261007-extended-mapping-dts-v2-0-fa9e14900313@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791393209; l=4403;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=mQpcXGi6W0R5kfqzYup4R1patFpyBQf4cTe6pZfPMgE=;
 b=+JhFhwQLx1mNEQlzPmBQIq+Z3CRZFH6RI+qbaDoEJXXMFhAnxt8/w0xoA6vSk09qtsdP1zq2n
 6lLIw6z9kt1CweQTqxhQGJ97X6DdWGYU/CwfQrscyJ2xAftm9PvJGkU
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2NyBTYWx0ZWRfX92tD9dmFXrY8
 Ci7j2H04RjqJMCaZ+rDFm9t3SEyi2wCDlbnkYZqLA8eIyyyd/FTVbCcsOm7FZLjR34AM6yR+FOv
 oaG+0b+5H+V6xK16zv0Uzj4gumH/E+8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2NyBTYWx0ZWRfX6JwZvE33Lgau
 2AZMKBq2xDx6O+mGzJcncguFmw0qAeNwqrJeConF48VHOoJ5ZQCg0S2PW+k/xGEHC+RdwkELDIg
 MWBrGUgx3plcTiSfkkUrAFW//fmgvAQOZAKQZk/IR+BQhvxFnHHk4EzW/93FC4+QphI3QGwd/Kb
 WMqPuLXU9b5lppLuDutMvWkJ9gLEuqbc/a5GsWGHOf2AjyBzE1Ts+whK2HzHrs5f7fTXBnIFOrh
 9Sv5Ku+NqTqLYj6BJla30B/NZeBtQoCi4lMKRAouf7qXgAgRlqrfOmrb0LhwwbuuCaIB3qd29iM
 m5pXiSbkh5DiLNnL9w7qJJq+cFRg3Llq6XKEzOF10Zw4Gy9a/dZt8h55jtD/y70mOnk4StUA1x0
 2DfCrkj6MJeJ8mK3+j9ghpZzP2lIkEAZ5ShshspJoFbjLSS9q2SCEoAKiGB+Bd2nEOnQCNdCuUM
 bKotIlhgHWsLP/W8aOQ==
X-Proofpoint-ORIG-GUID: yter5SvDyR1MIWGmNWj-FUGioW4ERVTF
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac67dc9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Eg_51P1V4iClgTwtoi0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: yter5SvDyR1MIWGmNWj-FUGioW4ERVTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070067

Wire up compute-cb@12 as the dedicated extended IOVA context bank by
adding iommu-ranges = <0x4 0x0 0xfc 0x0>, restricting allocations to
the [16 GiB, ~1 TiB) window. This allows large CDSP buffers to be
mapped beyond the standard 34-bit limit.

Bump #address-cells and #size-cells to <2> on the fastrpc and glink
ancestor nodes to accommodate 64-bit iommu-ranges values, and update
all compute-cb reg entries to the four-cell format accordingly.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..556867fbf197 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8462,6 +8462,8 @@ remoteproc_cdsp: remoteproc@32300000 {
 			qcom,qmp = <&aoss_qmp>;
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
+			#address-cells = <2>;
+			#size-cells = <2>;
 
 			status = "disabled";
 
@@ -8473,17 +8475,19 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 						IPCC_MPROC_SIGNAL_GLINK_QMP>;
 				qcom,remote-pid = <5>;
 				label = "cdsp";
+				#address-cells = <2>;
+				#size-cells = <2>;
 
 				fastrpc {
 					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
-					#address-cells = <1>;
-					#size-cells = <0>;
+					#address-cells = <2>;
+					#size-cells = <2>;
 
 					compute-cb@1 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
+						reg = <0x0 0x1 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2401 0x440>,
 							 <&apps_smmu 0x1961 0x0>,
@@ -8493,7 +8497,7 @@ compute-cb@1 {
 
 					compute-cb@2 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
+						reg = <0x0 0x2 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2402 0x440>,
 							 <&apps_smmu 0x1962 0x0>,
@@ -8503,7 +8507,7 @@ compute-cb@2 {
 
 					compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
+						reg = <0x0 0x3 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2403 0x440>,
 							 <&apps_smmu 0x1963 0x0>,
@@ -8513,7 +8517,7 @@ compute-cb@3 {
 
 					compute-cb@4 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
+						reg = <0x0 0x4 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2404 0x440>,
 							 <&apps_smmu 0x1964 0x0>,
@@ -8523,7 +8527,7 @@ compute-cb@4 {
 
 					compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <5>;
+						reg = <0x0 0x5 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2405 0x440>,
 							 <&apps_smmu 0x1965 0x0>,
@@ -8533,7 +8537,7 @@ compute-cb@5 {
 
 					compute-cb@6 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <6>;
+						reg = <0x0 0x6 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2406 0x440>,
 							 <&apps_smmu 0x1966 0x0>,
@@ -8543,7 +8547,7 @@ compute-cb@6 {
 
 					compute-cb@7 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <7>;
+						reg = <0x0 0x7 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2407 0x440>,
 							 <&apps_smmu 0x1967 0x0>,
@@ -8553,7 +8557,7 @@ compute-cb@7 {
 
 					compute-cb@8 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <8>;
+						reg = <0x0 0x8 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2408 0x440>,
 							 <&apps_smmu 0x1968 0x0>,
@@ -8565,7 +8569,7 @@ compute-cb@8 {
 
 					compute-cb@10 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
+						reg = <0x0 0xa 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x240c 0x440>,
 							 <&apps_smmu 0x196c 0x0>,
@@ -8575,7 +8579,7 @@ compute-cb@10 {
 
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <11>;
+						reg = <0x0 0xb 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x240d 0x440>,
 							 <&apps_smmu 0x196d 0x0>,
@@ -8585,11 +8589,12 @@ compute-cb@11 {
 
 					compute-cb@12 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
+						reg = <0x0 0xc 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x240e 0x440>,
 							 <&apps_smmu 0x196e 0x0>,
 							 <&apps_smmu 0x19ce 0x0>;
+						iommu-ranges = <0x4 0x0 0xfc 0x0>;
 						dma-coherent;
 					};
 				};

-- 
2.34.1

