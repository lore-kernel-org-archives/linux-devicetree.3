Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640333246EB
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651221; cv=none; b=Na2rwROe1CShiOCGDpsUwN0keXfZykyJbvY2v1rEYv041+W+yESet69IPKA1maC/HqI2XWWbhKm7F3n7JUabFeozMiF/OxhEMVlm9uY34uUh61KQQAtcVDWLuSevzk1MGNB2ZU1rsfsuKZg3nnluhDeqvUj0cVjA9l0eujEPLmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651221; c=relaxed/simple;
	bh=4MVQmgwxUQUw39D/a4v3zOkEzV18aEDsQ8FTgHlTgXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4U08sMsRpnuReucP6/3AqwR1ep3MvnYB+05xvMMvwX6qH7TbqAvbT7Df8LajgCd3VcYUaIuaBvcnT6teOiPRntWqNMNZtRN0UjRRc0Lai4UshyCaMgaC/offgBtHL9v+CikWR0A3okaG1QXrJbMjB3eDs/VTl5eeExmvHBOdj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OdkRUdt5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iH5FLYpK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OdkRUdt5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iH5FLYpK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669JUtbu2557209
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8mNKTHss5RCMjCMw1FqMWARAA+Av+jdGhXhUgfnnAQ8=; b=OdkRUdt5AGZY24Ac
	D4wv9Hd+nCoQCg0YwCcAWBYSpCx9Ce3ulqn9brMuqYEE6EUh+CarLNIE73FUEEbb
	/B8U6Zuk5IryQaDigiKSULvrHc63C9oB6RSAevvp8RySHR/IIEgCyT9WVbTZqqu8
	LMEOGoCeYQwi/g//w8LwhdKYt2g1AVvdVy8TJ84sMS7r1/nv0+t2GEmMIrQlXLss
	bIeVw4FIUvFpHB2FY65TX81Hs6AI0dfUjC2LsbltpQDSmI24LSAJmd92/xLyXGpa
	wFqppkAgqcSMGCTksXm+CUhfSIqnUVz0+CuYwerHVlJGoD2jp805i39/8KJxtMWV
	5Mfg/Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8h7a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:40:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84870e7f498so474830b3a.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 19:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651214; x=1784256014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mNKTHss5RCMjCMw1FqMWARAA+Av+jdGhXhUgfnnAQ8=;
        b=iH5FLYpKvxX8O9PJfRXIOWSOahdIH9pKNP5cQL/+auAjg5udt37q23nFWqRAFC49j2
         SBx1MSrwcJ6Aicgs957Wh8ldtzKf8wK8Yna7WhKI0Ha5WhM3FpjwV5FnO3elFnETTgBL
         aoZxFaHJSh4xTZXhggB9H71gC8dLrKaglQUNS/E5wXBEQVUEOR6I39dKw3ptoNu/xNk/
         1Rh1f50jur274GS0gIR484nuJR4y9coictySVRXK7+PWuHwlfo3v9MXXfz7nL2uvmXWW
         GLuhMS+LOJ/my3A96NkaiUdG1B95OS4In/lPf1DE255DAIrEgAgIBcBP7AxvE8lmeLNr
         1MyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651214; x=1784256014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8mNKTHss5RCMjCMw1FqMWARAA+Av+jdGhXhUgfnnAQ8=;
        b=maX0oluF0dU/8Sv69FAPdbj1ZNBhhJyLUMIkXuutONYWxT83nWnNBFxmbhUCP+h+x4
         qKgL0gMkErf++GYqDHk1MOSUB0rR11haR0Vr7D7UaKbACp1yWEAglJgq1gALPUVa4YFc
         PLGLI4RANeG7AC2Ku2UvnrjNDbUb9MqLRg5/iU8MYcrM7r98M4UYYQg062MvHgwzd9pc
         irzzD6/6xrb7/lRW2cVmhMzHdHUR7eoKgoEf04Hb/+6tf/4krox6OGIQ9J6B78YIWfFR
         v4mEZbFaCRuUT5ti8Pre1SXE/IU06m4EZC2RWt5GIMacAqt9PE4CoySYvxzrTCKNJ1YM
         Y5Jw==
X-Forwarded-Encrypted: i=1; AHgh+RoIkvwsxkuJ5/REZ0xvzI9HYrHoBU1exckFFEV9+SRMHpt2H1oNlwwxDSBOlXN68wf2gszvRJOqq+yw@vger.kernel.org
X-Gm-Message-State: AOJu0YzSDwlEK+Ab9KGOsrXhC288IeRWcA0xOAdfP3/ablDY8fT3z0ol
	nq6baxqqRDq3YPxpqLII5Xfk2WR+hwqe59UibnS6/YFLkIXgh7ip9g8UMYgsASOlAiYuL7mpWmT
	NMyBcZNuCLwepkdD6TlUHNKEJXnL3tJnveWk7ECZRMF2uvHEvMW5H2djnIFb4tF4r
X-Gm-Gg: AfdE7cmqdwTuvdhIG8aovUNit2q9B1L5ZISeT3xN5dpPD17RuhYXdBMObWKAZ/aoxhE
	6qhT8GqqJxXBXFJ+VSl7qDqNgTbcnpkKYaE9OrSJ6guVkBnL2pm9ganbxQMBws1E32p02TkQqjL
	gQ5M9PjfK83ud6jlgaDtL9nrf0BMzed892YddAGyGXv3WkC5bxCZBvPXPhZdsmlO3anSYFH+U7T
	s2X006EEG//SX0Z5BYsqsbvToDMnpwaxC567hgGAS7FCEmAPLQ74XRxX4KTc2R4uRY2q0r/f+SP
	bT1pbYBZth6BsVebut5Nt6v6mk9qqcUu4+oXlez+Dg5QQpZwN63ZeGimF4F1c1FHHbAiu5Hs78x
	lBwR8IimNPoxd5xSbxsQF1fsHG/BWGYuhS43EiGDuTftZBcBdmhAcKup82nWW0KPoeO1HzE+UxA
	==
X-Received: by 2002:a05:6a00:b90:b0:847:439b:ae30 with SMTP id d2e1a72fcca58-84842edd72amr9032054b3a.20.1783651213890;
        Thu, 09 Jul 2026 19:40:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:b90:b0:847:439b:ae30 with SMTP id d2e1a72fcca58-84842edd72amr9032022b3a.20.1783651213435;
        Thu, 09 Jul 2026 19:40:13 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:40:12 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:39:02 +0800
Subject: [PATCH v6 3/5] arm64: dts: qcom: kaanapali: bind traceNoC on the
 platform bus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-3-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651186; l=1634;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=4MVQmgwxUQUw39D/a4v3zOkEzV18aEDsQ8FTgHlTgXk=;
 b=9id1mYjoy80wRtGxcFyPA7kI5SvnAWvY6ixcWCAoVlNUvjuYNtKp78orzdxBYjBm3CXiuwuyC
 YYkFpe+JU/eBbIMC4Qiu2TzEhjOIALL95aS8NE6B/Vnki47ITGNGYJF
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: oCFNGEJ_k1m9RiPUFbzLdDhfvosNrBTl
X-Proofpoint-ORIG-GUID: oCFNGEJ_k1m9RiPUFbzLdDhfvosNrBTl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfXyMgU4qdnZ/h9
 dXCFjFXJLwBaq/4vAe0a/TXFZRUWsIMIJyftIeth4lbUDQRGp1Uz5IcWEHQ93roqKSytTYYIILO
 Dw8WUUqXrmjbo31mECXZKwDoW1qP6jQ=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a505b8e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7Rut49xxg77_icr6qwgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX7m+1flkwTyaW
 UU7TvfYJkKJ/1HaM/WygQNip7mfBumO3A9TGOIFPenFQIB57KHklVCb96At90Q0MFm1+neByanh
 GmZz20dlscZ+SLBfvZ90t41ejScqXJhnBkFI3m91A+H/fKHSxkaculc/z7M9iYf0UrnhOMrpZzO
 unHEqu66Un11Rc/MgvuCdNwnacLfDys26Yw7gvRjsFffG7hPHo0LkqqCJPPKhYSY2LWL7Eyc2tv
 0qEHZ5EH8O0jSW+JU6+qXbiPB42TWirP86N5LbYQ/QXnEaVMS2JVGv/gEjIqTPuVjc9y68Zuvgh
 0H+P2C/r2w7w+P4+7npEZWuuL9AXs2BrgkDltbAc5DAah91Dp1pnoM5A9BP1rJ6b2O3ZpGUy8Fc
 +hwm8veICGqXENijeHDRhHraIEKR8H8cPKztzfue+zxF+r47ADVcWRS2I235+FNE9mcCt+NV56M
 Hcvi1PYLUfkqDcF2J7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus reads the peripheral and component ID registers (PID/CID)
at the top of the device's register block and matches them against the
primecell ID. The traceNoC exposes the CID registers, but the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the match never succeeds, the AMBA probe fails, and the
device is left stuck in deferred probe indefinitely.

Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
compatible, which binds via the platform driver by compatible string and
does not rely on the component ID register at all. This lets the device
probe on hardware that does not return a valid CID, while remaining an
Aggregator TNOC that retains ATID functionality.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..5d0e7e8c2e58 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5004,7 +5004,7 @@ tpdm_pcie_rscc_out: endpoint {
 		};
 
 		tn@111b8000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x111b8000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1

