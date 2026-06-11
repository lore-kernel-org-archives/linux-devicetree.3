Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735C73750AC
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154036; cv=none; b=bnfkPsw8DEoRfgFgqeY9bNO2yR+CrXIwW1/bSMzGvZ0zIyY7a/9suiUzDnMNBb2Z4cU9rp7Uzl1sPw5xDTPG9prTd/i9VRUbngj5XNIZcNXi8B8cYXYqdL3JEbU5qJbcMSpIIzpbmBEZuIYhdi1B29RYxsUU0U/341P4J4ECOYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154036; c=relaxed/simple;
	bh=Nn4WNBnk+vDZYN/P/46/5feE9LPbfWmC4+LCo670D9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKElPwgC1oLj4nQf/E33kHdeJcUdjLQydhJYxixEezK3hbC81f0VwRD02VvHQnqxbRhpKhY/vrlSYcR72B9M4RdnNMLOA3lElXw7S4p7WQ5Xi16T0o9clq6baMlja3IwEX4WAmgeN3AaSiAbnLBW6ckQtyqteXHFJgvC3btBcBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbtOSf/9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2FUyO/a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbtOSf/9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2FUyO/a"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0O7xQ3184393
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ClUx0JBqZpjolPUszVz/OxlB+sov65lgjVdTEbslsrg=; b=UbtOSf/9qYVSQmct
	ZDKvlt7l1IyWXcS6t9tIUKs6f5apS0a7ywOp+ItIglr9Hv+Mhh3yqizgqAzdl2jH
	8NQGnRE7fqExI9JElC8ZjTL0u2gEwlTEfvnkQR7EMgwsjyVS0+nTmeBaZf1QYePF
	WXNG2hDO925fk1dOi9xcRiGV2FMDtNymSZUa0gAoB+exZDLJdU8SOfr+eltGPyss
	BnOjSPBD4sdqt1OEB3uF3pF1Is9y4AmUZ2RpFI/l/I6XRcf7VTwOiwCCwyZIBJv3
	87YjJtZp5ivr4FMA8IU3VwSrMqfTp1Kn+IqbJgzhuCNEOOK2adqJVblRBQ5sR3kq
	jI2XnA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1nnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf1dece2ecso76395735ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154024; x=1781758824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClUx0JBqZpjolPUszVz/OxlB+sov65lgjVdTEbslsrg=;
        b=J2FUyO/aYG6ZsK8+eBbG6P25FzI3p3P/ZY70P2XvAE9F3kASp2pCGspgKZ6U7kk7oS
         71Pz2DCzdCdgvzxPHe+j4yjyuEf1Pv/f39sgTivpBhKItYqYifURVUhxUwezF9eBIFuC
         Ee/psNd1NFzVFBCZ1cn7JnyDRAGSfiV9yeU7tgeIPaGn1kfOgCkRfpsDOk1lARxqKKSv
         f8h51MPe3EW5bOxe55yaWLH/bpaxLQ7kd6Lq89H4pD4sCrfZ6nk7TZNzOgKBvWBORuhj
         nVhXBtq6dsfNcCi+aeVopGG2Hr0EeKj+S/UsqhROra030DlxHKZzzkgzfoiaOrlaDrjN
         5mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154024; x=1781758824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ClUx0JBqZpjolPUszVz/OxlB+sov65lgjVdTEbslsrg=;
        b=mIQUmokNdjcVLElmdO6YUxKsIdv/MnHvptZWOAnkNV+g7yGydQZ5ci57erNBOHSCyK
         yNuhgdvYjlWsnRU/2pk1h9ZQHaOd8pCBPDl46KZ0R3ZokrM9tY1ZEQcKH06/H9BjvXN7
         DVH0dTzEi8do8yql4PGThdfQ3WAXMsuvHvcGLTYKXIUnVEQ5NGTC44Dh+N94P2mpOoay
         x6EKpPUJflm+eKlBWxaL0rtFumFLOOfgGqmJRdc9R1w5eEBlWWDxdEZSYxgNrIKhcIjl
         OIkwmFlywaI/MRhy6lhmXPhuECduCN/rjYAFVv84fL6aLK9rpODvdzWqm6k68Md/IMj1
         S23g==
X-Forwarded-Encrypted: i=1; AFNElJ+JIkoqfWt/c7E/dHcYJilPLeiJ7h1OnWiQD1DnxO4g/8mJT6E/ORCSL7TFdfUKT9s2QI0Q5HHwa7vp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+NyfALvpfIVKD3RYaC1rDK3MooQG+iOgiLeQEeL3niCYjEu5+
	U09UjLoFejiv3xwsd10pmiygZnI9EZbARbnBz3lQrn/6UvK+6oEEIqQ5Wv+CgeCabwvE8TbKTkG
	jXUG7HISPvA33aA4Ui/rme4p+NdIbCE1nu2JlxKkSjLXmIUSkBsIMcDTM/zseJUiQ
X-Gm-Gg: Acq92OHJRnAkTSHZIoE01lbJ6n9VQaPhNYO8D1aEnwjgHxqsA0rHI8fFs/tQwN/dcNU
	tcXFwPnjiJolKIDRT00Yl2UIsj7GgAm2dkOuSg26eSRwS+EO03ZnG2MgWKrGwQFCVuedhTq8srE
	Ocw9FIhPUOR5nDSCbeOB/YrzOij/nu9oim7Wy2SnkLnm7tTTekM3eE4FpubEz89sZAG38K3sHIN
	sSJWjh3dCJ4sl9BcboemJaP+5tv0tWEGE3N5PHIix3uQvQGV6zVx9aaaoMCh26z7pTXJzTXL8fr
	Yek3ucccFqrMq6m/p3RF1OqaBrdsAHWFBvEKKI12IO78RBkwy5YEvzOdxeOJq8A4Hz7IZYAloHs
	PxcIB661yf4vujnXo6FbAZrFrw1WSvptaAKx2NNQyMppET9coeC3ZXsbXbeTT11wCYzQ=
X-Received: by 2002:a17:902:ccc9:b0:2c1:6020:7398 with SMTP id d9443c01a7336-2c2f092e387mr13782865ad.12.1781154023757;
        Wed, 10 Jun 2026 22:00:23 -0700 (PDT)
X-Received: by 2002:a17:902:ccc9:b0:2c1:6020:7398 with SMTP id d9443c01a7336-2c2f092e387mr13778035ad.12.1781154018525;
        Wed, 10 Jun 2026 22:00:18 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:18 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:57 +0530
Subject: [PATCH v2 21/37] arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-21-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1921;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Nn4WNBnk+vDZYN/P/46/5feE9LPbfWmC4+LCo670D9k=;
 b=ZpYUS0kfPDClmsRkaV6GPGIpJJ3dt+TohuuCxLUlzTWLtMR+JFf1DPfXmz1+ELOn/jzOmjpwm
 D9tJcoTo2NDBcAt5lmT3vQfZjLsFfN7qBNPYi9uMK6hUKkUSb8PIJ0o
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: lGsW7__C9K9W75jBjgCldC6ADxZg0DDn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX16ZoewMIBAPK
 mLMMaBv2A3gdimwWWrfvh+IhFMhg7pKS+OsrR/vQx2kEtgrXIcPpggncBR0NxWt0K8bg5QaaOpb
 UXPMg3k1ZNF6hz61zAa1IbHrC6LNgY0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX8QGq7wANEpc3
 2TQVFu7Jra3ht/vBgh2VRW2i6VAWt4Yn2LzyLINxTADhgGGhwEfplojYX4BETTfkFZboJH1c1BJ
 iSDkhbWJUs4Owh3YAF7Oc1z1w8h2hqjjYEFNbzieISW7+fV5fQZkQd7R0nk5mTpzscf5wuFSGcu
 5p3eM37k7FpDaqkWvUr5m5j5lplC2XLAU3LJ9wDd5UtSCBomSoBdUl2F/ajymfe6JbH4A2qUWTl
 f3Z2EEceVBgRoH1jdIrWbckc+VUqWH5Tzz/UE/166ZzCKeHN0JAvz5nNMCTw8S3JSlwzyU+dZ7J
 DV34URhoNX/6cBlOwy4iJcqqORxojsZ9yvURshbyGoxFza65utX43QLyu4pAizOXKRmE0NnTJhc
 h3oPJZGCKGlGdHujfi+Ib8gMm5lJUWkP8QZTjCBdVXsC4rynaMj2S4B4gONSdirVKUfhUAJalza
 iDLC6PcTxyEHN4PS7sw==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a40e8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=w5YLtpWUZy_VJOv5-54A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: lGsW7__C9K9W75jBjgCldC6ADxZg0DDn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe phy reference and the perst GPIO property are per root port
and belong in the root port node (pcie@0), not in the RC controller
node. Move phys and phy-names from the controller to pcie0_port0,
adding a label to this node to allow board-level overrides. Move
perst-gpios from the &pcie controller override to &pcie0_port0 in
the board file, renaming perst-gpios to reset-gpios to match the
binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 6 ++++--
 arch/arm64/boot/dts/qcom/qcs404.dtsi     | 7 +++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index a22b4501ce1e..a035546a1b97 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -101,12 +101,14 @@ pms405_s3: s3 {
 &pcie {
 	status = "okay";
 
-	perst-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&perst_state>;
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
+};
+
 &pcie_phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 4328c1dda898..8166ab4bf01c 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1517,12 +1517,9 @@ pcie: pcie@10000000 {
 				      "pwr",
 				      "ahb";
 
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1530,6 +1527,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie_phy>;
 			};
 		};
 	};

-- 
2.34.1

