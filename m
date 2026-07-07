Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CD137E30C
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 05:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400853; cv=none; b=DWatPZGZvhhpqKR2Ezb4N4u+lHEt/O+9WknK7BLqkknOXHSFRAXdfuE/y0SHw9wq/ZKYwsA4nJT6oeTOkCfwX9CyIOMphLb5E5vaUaEEDO1/gVUbG8R87C9S3uGB7zrJVeNO99ezxcNPCjAFb948ZrguqMokoWxC2iyU+x12pHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400853; c=relaxed/simple;
	bh=k+RJzLghA5+Fmbp7u31dj0yVP4xPFFLe4fqiKeQqDF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j8IgN/z7DWnHkCgYp2gjkU9xRDXc2J2JgKPGad7d6wIhlic3BWnCZAJL3HZeHRZJ/25ZC+WAlctDn0X6iH8GVzgwH/iuBcd5kQgU/gFWf7RhM8wAGmMs00d39bgvqpWfRLZyVAu/TIDIbYeCvGCZCNMlSYZ+iqpgwPX2ukqscP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pC9P9L8w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DpQ9JNr2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pC9P9L8w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DpQ9JNr2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748nfP2674844
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 05:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JnRh4Ub2vuIaZx4wegh2UPHNrEES4UIAhed7f+E4Tw0=; b=pC9P9L8wdDpWU//g
	+S9hwBsXjjNqefJMbfnZ1iEFVoWaSmT9dS4V9BkfcDdboLEPwVcC0C9yRGkTivVd
	qZDO7X4XALvYL+qlPP9AfXVOZOnCJ7vXiRoycZcgZK0VVjEWQ55zpaILXVA/SKEg
	LuqreKvk76GtSAk63NQx5AH0fr03UW+8nB+efatlrMGNxT/RzjSsUWJANXfWXYuX
	0cbPpnPQAHARDnbNgr/0KleUeRgWM8EsgXAkixnLgV3Z2EXQMZmAwsvRGxbCRx7k
	Kh39oR0T6mccG0Z+ME7MqOMQVw1cU5y1CxjutAmuCewYGuuciy98sK3p2ZuzrVCc
	TleuhA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj78nm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:07:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso5745775a12.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 22:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400850; x=1784005650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnRh4Ub2vuIaZx4wegh2UPHNrEES4UIAhed7f+E4Tw0=;
        b=DpQ9JNr2+XitadFQSXLOusHIdCCiX/FX9rOkzE6jPY7VsF+r3e2V7kK9x6aDmHbmDl
         wVTHQ/yNzKyavbEHy9uREFOLansCxLmYkPrBcQ87JfeXoRlLuK14VtHBGTAN3Y04wV2W
         V2CvSmh4nOltdJqRoK/c1SYCXg2PMt3X1EbNiRqqKZnk4vipJu5X6QxnbyJ80KCf8BB4
         kiZSywxybjSaxqtU+IP30k15MOkl0p8zZXE9QVKfj/04/MznT7I8/Ok59jLJ4bhtjaTC
         H/SvN5teHcsbJfcusL6Q0e0X7d0A4jGXkjRw7YRKfUi+vx1mqsFLHM1LPpIGKGxIpmCy
         hFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400850; x=1784005650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JnRh4Ub2vuIaZx4wegh2UPHNrEES4UIAhed7f+E4Tw0=;
        b=QiAngc06/AJD1Y+SqHy3nqBpiWEqeeiNYa3ce50vLjlcG5q4ybTgTuQ529Vz8Pi7OF
         ucv6BvBy+WtZ1ENTfOyBkfZcwsEXJyB5xSpWbVnHWLzSakhbnBx5lTkPqI74137/pO5J
         tKpJeMf0Z1uiE3YLdXvTBQFKAF/8y88voaEhCEfuX9LaQAcpBK6O0TgPWheBMQLfxEhJ
         SaDMPvRz0dLcwy6mytjexmOexqfL1dXq1T3RYKT/G320kNpHebHHIOGhz++AnmWo1Id4
         yk8yQV6m5nhU5csMF7gjJh02t67yIvCO6i9HxlZlSakjEirUgbcW2gxi9ZMP/9bzufaO
         xF+A==
X-Forwarded-Encrypted: i=1; AHgh+RqkXnnmIiKF3KfzRJ1ZT52D7p89qcytJ600FZia6w5a86WFZQ4VLmLkQVP1gPf2ho+EEAKgFkHbB8xc@vger.kernel.org
X-Gm-Message-State: AOJu0YwsJUuCcPMxcHJE/CUlpflalorAlz+SS1KhxWIMFKNRhR5OnJr6
	RIUtvxqvkcsmot2T9SkQ8rH8fzb7lpNkT/6RCdyupx41h6HVzAS0z8zEm2m10TdkMtp/0oL2Z6G
	1BARNZjzQACnZKskXG5BkhWxSJOfPd7L6uRGSjiXO1b8x2z0dLfEu+lg6VAJPD1aa
X-Gm-Gg: AfdE7cm/LKKOlzQPdKsje6QBNZPUEtoqe6WHHOU31mLQUhADMGmlaXCt/g1EpScUrxC
	EKxlhKfPAyOnwcZ30S7untX6buZfn51v+8ojMJqOX3ESTFi3/SPcjWQtvms+1AipHpBf+6jHWtB
	ufXgQoTgGYPiOgRael3zub3MM+bYZPMz/RNsOLme9du67TB1sBRbzzlrTPqkpdWQWGWN1SDEEzX
	g2HOlR7bxZA6E7iL3AjUj7dg57sj+oK8LILDUJUGCXDssUQJI+MYAhsnJiNw1Qthr5tezhmpZHV
	2TrOvh/R9WH1cRNAvsmIlFm765iSe5FWnrXtnOg8h2uH56vVbFiPo/GlWL9do9HVXgILYhZnnL5
	WUzHzL6cnTmXY67PcF4wsPPoE8OzZeLBjScHiSbOkOqRLI0h5qZ5FAzhxmOa/IUuNhhTF7Cjryc
	aCtS48
X-Received: by 2002:a05:6a20:3948:b0:3b3:cea:874d with SMTP id adf61e73a8af0-3c08ed81a5emr4534450637.18.1783400848255;
        Mon, 06 Jul 2026 22:07:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:3948:b0:3b3:cea:874d with SMTP id adf61e73a8af0-3c08ed81a5emr4534428637.18.1783400847816;
        Mon, 06 Jul 2026 22:07:27 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162b59sm352300a12.16.2026.07.06.22.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:07:26 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 10:37:17 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: kaanapali-mtp: Add PMIC Glink node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaanapali-pmic-glink-v1-1-3f7d476672d9@oss.qualcomm.com>
References: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
In-Reply-To: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783400840; l=1786;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=k+RJzLghA5+Fmbp7u31dj0yVP4xPFFLe4fqiKeQqDF4=;
 b=FYfmNZ1TG1FQ5byuCsB0uJR/DccEWdf6tGHN078G21IEMsywlNRR2Fvfqj6vtMuCh0GGn/wAo
 qWc7T0ZD0s9D5E4cthcY7Yzk1FQwj+ZvOi62XcWCSeXKnDwASNY9i6F
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: MrCXQw23K8QlMHDTO9CHdfhIl_ux-M93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0NSBTYWx0ZWRfX7xLQGuMSRgw+
 zkCI6h9C4ALKxxVOuXBF/dr/WqZEiAUBvQtis7bv2XGRu2bGquVHwlfVrOf6ECbXwjrR0pIcS1i
 uISqKZgK1RYfempIdsz96rzZv1igVYlXfOP+G0OvG5CUvl/5O9H9vOL8h7DarIgFfq4Gwey/Sjs
 d3fNcI/3jJW7+gRfGJW+2JWUrWyOTKAp+6wXjF2bWH2D3AUpUDc+29QD0hZzYEFqejvGqxUl+L8
 jkZHyHpT8arr6zckip1aCf0yRvKblW7YS3CWciwJMliWXqPuAWMuwtFFHEKLfUWh5EljIPYJe/7
 XhhvTMN6P8XYGfyiOdDbrp8uQnQmt6XMJL1QbZfOGVNzIi1Rt2ItzGUxBPUlb7JuUa9zqL2K0Ob
 SFi/jAJwOo+oMAvpF7ZLInSkR/PkuLkGIl3SFzrWsLS79o+GRXiAKkVGjTjcZy9qSSFtn63nAGi
 tTGv1RdHrCWam/mkudw==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4c8992 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7aILTqA_qkZ4MrPzyYUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0NSBTYWx0ZWRfXxYjMJu8oNYz0
 IJKDdxB3QfSlrR+dZc18uG3/rE3MvesoU0dhzaKLqpGqL5yfYUU0RmmcPgudjXiuFSBuzqBobrv
 22rNevIt3qH0U+ZTH45Iii9ZpGM/TKE=
X-Proofpoint-GUID: MrCXQw23K8QlMHDTO9CHdfhIl_ux-M93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070045

Add PMIC Glink node on Kaanapali MTP Platform and add remote-endpoint
linkages to DWC3 controller and QMP phy respectively.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 53 ++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index f9b5b5718b90..3e9d9fb008eb 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -163,6 +163,49 @@ platform {
 		};
 	};
 
+	pmic-glink {
+		compatible = "qcom,kaanapali-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+					};
+				};
+			};
+		};
+	};
+
 	wcd939x: audio-codec {
 		compatible = "qcom,wcd9395-codec", "qcom,wcd9390-codec";
 
@@ -1328,8 +1371,6 @@ &ufs_mem_phy {
 };
 
 &usb {
-	dr_mode = "peripheral";
-
 	status = "okay";
 };
 
@@ -1348,3 +1389,11 @@ &usb_dp_qmpphy {
 
 	status = "okay";
 };
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};

-- 
2.34.1

