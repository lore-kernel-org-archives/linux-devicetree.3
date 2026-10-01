Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C31522EE3
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867511; cv=none; b=QhdgDsolwykJY5o97K8qdMcSD2lHzAN39bivU91lxkjGnbzBuOHtU+sj+w3B2+xXZk0dc3dzIBF95rdw/77DpB01xOwYOBifdD6tYgGLJ9DLWqdeOwSBE1hj0e+MpHWwhIyw3fbohY8CF3+FEYDS3jRIeIdfyY3a0JPVHNikiQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867511; c=relaxed/simple;
	bh=dI7m1FeXlnmKyQLMayaKeYb5fzOiFLgYrLOUxUlPMc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JxTByC/3OHDPn1R+xTWceROq1CANcoYL895Vi4/SMjyVv624CZJadgJFimDcssyUJOCbKL0TbfTI3awLBTLqOqSDhRqUEXdJigYed/zMXBPavWrNFPTm0YMsd9aOr4e/ryO8zsSByJ41tW5mTd20Tpmq4YPzhKA9H97FYNHBGCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NuVhbr0K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUfOwVId; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NuVhbr0K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUfOwVId"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Dk6tx1857027
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 15:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0II5TxQSaEC67w5rIgcCrT17yfasH81HdhycT2Z7zU=; b=NuVhbr0Kdua21k9z
	6QGMkOsYaD1asYqaf/oXRDZ/F1OpCMRGot84fQz3VcVSupcoxme1F2rCGpppIlxy
	+eKUahzE/hU0PQBc4Us5rrfW3Afb+t0Ngl/TqbQb5rNt983R3aPNnqkY+V38/28a
	u9+5SiEkKmy9hk6qET3YS/AHfz0fyk0vxuzMAj/ztHX16+hcIx5t520zNtWOgM2p
	E1ZPVeAfVaZmUhyO9tc/Pv25lTtfFjqjFnb7xP+c890cs30xF70nuOTwOwqW1HP4
	ccWgj49IXFXjKx13qHws58nO5kv1Qw8fuz6RQ88p4+V1l6Q8e0glrLw5zMz2Whnh
	xvnvKg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcvwag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 15:11:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34d62bb27a1so5384872eec.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867507; x=1791472307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0II5TxQSaEC67w5rIgcCrT17yfasH81HdhycT2Z7zU=;
        b=UUfOwVIde7dUH5B7Ft9Wmi7TGuwiNKa+95vW2qmHOxDgDuz08fwfJCqtiu7JC0iywG
         BOFv0FFKRBIu55wH5RRpjo3Wsju6i28QLe6wYu1iQ7yZa6707wDEzMCRcWkKt8CRrtMl
         jp6qVlYCbD/W8uFLchHJFgPd87BbqhkUAZBqdK6snP7zEaUukDTaBFHHqHZpYHi6Xrwg
         zRaU1OUWD8YgQkEI9Ucv40CjMBu6kjBhOiwmEbZ42ItJ4bwmHvIu1dSKQWR0ywrQAiG6
         +DSCufnH1bp8fVZHOqKj70WtM6y2Rxm6SjmKAGowMhJnzUnonpXBWKTxqZQjNZJj4HCK
         7Sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867507; x=1791472307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0II5TxQSaEC67w5rIgcCrT17yfasH81HdhycT2Z7zU=;
        b=Tf3PU5kfgaV3YfLZ+CeDj+gQ8zgH/6kiE8TVU9FIpILxQn0XUIO/32fEPVxWOiQCBe
         Z5x36fdwwTonzHlQ02gngXRsTSR8GelM2OtPdFur45ZNCeWA8VGVAYqxDb7rsOcYS6t3
         Hnkl0vPrruB5JCUprwNRcZYBdTaEDZnhDAqNM0+zWaAJvjgeeGZXq+4j5FzVK6IWA4sd
         DvmJxFmeGpfthLrE6u2p5vhZ+RcIyl1LoldRzk0DIiyAYznETCIAbU++6HbkJSc8rHDi
         GqLpAqdC+0b+POJxt5GMbEMI7aBpfTNXUbo+1FCT/Bb228R3kHgzneAD82mf1YBIv4pb
         dHIA==
X-Gm-Message-State: AFuF++nY+YlQi6vhPwZ12Ka3/QdeWGuBe34L5PZujmrWWB5AEaDOFQbt
	1H5OEKvA2EvCGNlGR6tqx2TdWdNTqhH2LxfMRh1Q3PEp/Sj9dW4vUruM9AJxwIxSTX4M87oVkV+
	h6MdJ+Tvf4bbuVd0H+C/3yogWTHh3+F1ctkmUAcbr14H4NrnbmYb0C+IJmx6VPTzA
X-Gm-Gg: AYBFou310p2h5zj+ZdRa8t3w/Lw2qtHzPFl9SDAfmSl8hM7j63zWTKqelcTkJpxHFm/
	s0lqfeNNu0IMdXelS1FIBXB3abMiF5uxZtSldZ5DMz6OwyY2EaNe5L1pSrSKhuORXqRf1IKe/QF
	ozu205iB1g+nBI1IJ9dqNA2LD1K/kBRygiFTxISlQF6WTAr+AeMaLP8PJQUzKL9vYJHpKKQqVvQ
	qKnE/e1jvYQCrZD18Ooq/7Kk4oaIYrq1cUihmgTO88BQDNKQr5iQ64vZVpVE9hSBzBfGCQibEyK
	kbpFd9KRp1CvDxi3pmNXWSW9lvsIENV4VoasLEQyk8gZDc4HNcOMHmkHnvKvJ12WaPFPBFECXkm
	W0NUEIQyOBosw5EbFS9ik4tkoLRz2wwCdaEh9i/dV2SaqM3LbMqT3l+XC991lXZy7fYODfJUDAr
	tacPl4gxD8Vk1DMy5Wxo3waoY5fRk/CXkjyw==
X-Received: by 2002:a05:7022:b884:b0:143:298f:33b8 with SMTP id a92af1059eb24-14d3378266dmr4533224c88.44.1790867507286;
        Thu, 01 Oct 2026 08:11:47 -0700 (PDT)
X-Received: by 2002:a05:7022:b884:b0:143:298f:33b8 with SMTP id a92af1059eb24-14d3378266dmr4533189c88.44.1790867506716;
        Thu, 01 Oct 2026 08:11:46 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm56159c88.3.2026.10.01.08.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:46 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:41:15 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: ipq5332: add support to get watchdog
 bootstatus from IMEM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-imem_restart_reason-v1-5-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
In-Reply-To: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXwhMb8kO/kD7u
 wwBfZ1vGpQhi7jueN5HlFaQUUVFrXNLHi5fZ1l6+oXAkuyHfIYfP5rQOHFt+tDNw7xA/buQm0Hj
 jqKvbFlGRKdaKki+PiyyBeQGm9qfHA7Sf6P1Pnw5Xuz6I13Pxh5WFHcmdRJz16sdiYiAb3pkpF0
 9a2jObqYlSqoUaDwxkqRSJQKTvR2nG3jc1/rz7yPBRvoiPDTmRO74WpI+FYZigcY2oN++c5dv2R
 iFGdXmSdMH7rEdqaC/6VeoroDv0mWAcwHqHxwc8NWIen9Fymz8Oke9cTaIZ2eP/Kn/xgHn6gAh0
 nMMFC9A5mozEBQKdspPVMJKWf7UAdlhSSwDMQfgcRdBz4x5K1dMB/6nOB8eT96xSeVQzDHC/c5W
 th9h/nFRhDctWWRtsXrDEG2Ibs65yKn+0b88FbTxq7xZ7CH4UhX/Bph/LTfiPBEpmhnWWfMPSbF
 mh2OPBhDx8XzWHiJrng==
X-Proofpoint-GUID: 2oIP8mvKJWkUXT7vmtF98jO_FMlISugF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX+6snH7egefY5
 bQBFCdcmLB22F84sclZbrNd9yNVRlG226Km2eEZ0PKumQYFFSd/hqTucLCWGD8V3Pfalj7BKfVH
 GrUosrJiCaJDmPaZ835I/CLz7Z5ivzE=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe7834 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 2oIP8mvKJWkUXT7vmtF98jO_FMlISugF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 3e10f45e182e..6a54a548b4f8 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -496,8 +496,16 @@ qpic_nand: spi@79b0000 {
 		sram@8600000 {
 			compatible = "qcom,ipq5332-imem", "mmio-sram";
 			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
 
 			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7b0 {
+				reg = <0x7a4 0x4>;
+			};
 		};
 
 		usb: usb@8af8800 {
@@ -585,6 +593,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

