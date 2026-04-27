Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9BC3E63B5
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311449; cv=none; b=JxsRil83v/igYp8vAo4B5wYmqx2h7wMqoPYA9hbStpZVMcWA7QdT8qowR/keDCzFnthP1tdpyNfAIy7CHIHMg04r0f75TLv4cIcxlRD8Ubn5t3DTR62kErijtlrxtQPpBVbXEoLTpLZMDtTsca6/r50pQfRXQ0xGv00QeG70xDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311449; c=relaxed/simple;
	bh=3BzhTvgErlfjD/MREd+a1QNRoNkGhIpRGYMAT4WSFWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SCorWF+sSRp5fyccFbWV3zX9+ScW/iDs88PeDjF2CfEYq7bc4PI4YJbjYyIHp7BJFXSdAHeQE3E+AFKS2HHllk1Kk3qqsUFw1Q9i0L6qB4ReYyf3J/gqwEb13q0O5E5Yvtb8VguKtjquARLQxNyfVnalFfrI+l6S+TfJJFr1V7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ee90QlmK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/Qo5Mju; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ee90QlmK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/Qo5Mju"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDtet7241124
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c6VbKKP68YJjXlE++Nlt7wjf5OWIFB06XgENwyM8iY4=; b=Ee90QlmKOKIevaNT
	g+6xaGj08ZxfGRvhKrefY4D6mEzNX/znFaG1hWabxVvm2leF9p+oVRJj8LZqFLuI
	tuJJePzDM/RfK7SCkQ13a+525RbJ8H5n9J2yklgp4PKjCoN9D+5wOPpisVGHb9ia
	tTrz4pR9pCWZDlVWgwU/2jn86oZsk5pFjzRHoX7QRZXJ3VR1ZzfoQ/E6/gCcW3ZC
	wDtZxRjc12e3y2RoN28lwPyIfqZwmdSpP99uGABBmJeJ603yeSsE+sMa7+NZbL63
	38fc2FtWwEWIXHLMKZ7JdZaANbFyinyiQ7SUGY58Tdh3rH5ajLkCvGwZF18rBBIc
	tjrMKg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946ruse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:37:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b249541063so93779795ad.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311445; x=1777916245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6VbKKP68YJjXlE++Nlt7wjf5OWIFB06XgENwyM8iY4=;
        b=L/Qo5MjuXIhDhNHPCmcvFb91kLNvbg2FI+CBnsJu3jfBx+p9ez0frK+mh1pxIuL/3T
         7usTkIyYJg9ei8crA1spMKn3sZiP3csMBqdA+XDzljwkD57+FTJQgkI844xOGKcbDejc
         1RT4dlv1c4mPZGpQZHKMgmCoITT7NiVND+lv3bV45kDXHesjRVn5xBjRycyFGUQp4Ds4
         gwJS8z6cZH8Vn0CJPlSHAoUNr8G4SOqtM+jdzb0fFpbtYuzVTkanGvDUrHwmRH7p44GB
         8HnDxv2LjYbequ99pDRCjyfAPqSCQcCT0H24HfDdAOFhJrzhJTeNh1wfwVjQ+J6xrhVz
         Kleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311445; x=1777916245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c6VbKKP68YJjXlE++Nlt7wjf5OWIFB06XgENwyM8iY4=;
        b=JonzCAqjZiXqY0ORmIU4kMqrm9qM0gPt9LRb7Ed3UxvqDUppsx96mmFvDgr1pUoy/t
         7x9u4ZEEyTNTho2K+PwT7QD50qBxeVUR12+6hHG959GryVmAhYHmZsUVew9i3xGr93rT
         6fA/ko1qPJKxIEGL12dJiv7QkC54LQ+srE9cPZz+p+PUaOYz9cWoqgOMK9jr/yKKg/G+
         wVu91TR3yWoovEth6LvhDMQD7idLuW+Lpo3ucc081ErPwAGiCsr5rqdureNYSTO6O02j
         AU60n9ieRph2s0j2NiUVb0YEd50uI85SCd+MH2WjsKl9VcUw/WedO/RPcGmwxw6JSwLB
         uuJg==
X-Forwarded-Encrypted: i=1; AFNElJ/Mx2eujy/OY5pKeudwKFSLoAITuJcYBR8WgRx9RIUKKOajteRlL/0OOnLMv/O5JhmlfoocR3UGpOzt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0GQqkpDq1/94dV+vsxqqirirjREuwkbxCUCGjLgZnTVbWgZ1j
	eJtmw09TjBNO+GBSg24ulOvudIeNDxRlgBpKDy3cbbdhPJ03EZTtLjIUbrPDcbY8K0D1XA/T90y
	aq2miuk+OSx07b9HFnVw1xr1lrwsR27lnVE6CEsbkEgUMmQRZkWhXkWmJvUR2sfMQ
X-Gm-Gg: AeBDiet4X1BKd1mGK4YPYr5gDQQSK+yYogpkwfoccnxskj8CCCmiTJ3clUGLe02WRI2
	vpCuAPS5SpTZsk6+i+K7xjTiLQIFGaegB9ynobmqioVR8FOjfrR4uPyMDblh1FLsznJhST1Q9bw
	MDB4ESyGb09Dp8YI9OzBxvEgj8DqQLEsDKA8MP7GF9+/ovGhJrDngG9iMGe/X6DboIW4yVEdLVF
	0RKAwz2znLWarc7FHaWCBW7LIjqHXvZLHUR2e8fr6wDL4V4B5NW2Cp7quBYX+DfbQh/Pls7M9oN
	te+zKz1sRvjs0FcJrBv1EM2EVn14xh9iYIYTRGb5TUECMFh8ijIHe+KdKJFnRziY+ycd1JnbWTe
	KxODxXImVP8ZXGXvFMLHq8GFRVS9xO4aTUbDBCUdeVL5lNwVq/36pCS0h8AMoJzPmM4PB
X-Received: by 2002:a17:903:2f50:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2b97a8b5beamr2077975ad.16.1777311444537;
        Mon, 27 Apr 2026 10:37:24 -0700 (PDT)
X-Received: by 2002:a17:903:2f50:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2b97a8b5beamr2077465ad.16.1777311444013;
        Mon, 27 Apr 2026 10:37:24 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:37:23 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:53 +0530
Subject: [PATCH v21 13/13] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-13-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=1603;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3BzhTvgErlfjD/MREd+a1QNRoNkGhIpRGYMAT4WSFWQ=;
 b=rvn05Gu5bqUE6iUv9sodoL3hQhfRwlgTa3Cm4zjZRZac81OqgAH14XDEWkx+l9/fHu5A2bjHx
 nw7c+wgzdRID5zsDH3CkO5wFDgB8jbP8ZS1xVZ/Zpc3wmTkAnb+9Z5r
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69ef9ed6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NtfjKPfcWimlndMDSJoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: oejzSbyyS3DuLuucw-w_jxzuatx5ZO1i
X-Proofpoint-ORIG-GUID: oejzSbyyS3DuLuucw-w_jxzuatx5ZO1i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NyBTYWx0ZWRfX1eTWrM0W108u
 zSqBl/JSwIrf0uu6tz2deVn+UzSQ8ZqoLJHbpdVWpeFDz3Endifx/FX9L9lSNSiWnGZ+n7vCI1t
 H0AkkFEV0/aivscIOH6emms0n4bUkcYDifQbjj9rqG34yxeKzd4hNY+Y0p6UOzzI3pDdtQPlp6c
 PQiHmSQqxdIfNq2jUW8ogU9JzPW9byxkxrT60HXCxUHrPXG5D4EzIdVHxHee+FraoqE9N1MXP46
 ov7PcvwMLVwMB/BiU49TUgHlGM4XC1bPVw3WQAYfExEgB/t0nt9TmjjXC9oZD5J25vHE25avYZE
 lRqV1pP3COBl2GArEqMnVHgM833K4TZJyTSZNNGhHRl4khAIhN7gy77PPd5aPAPhLG6oxIJXLVU
 Yq0iStibpeP7Lhi0eVG6zBK8j36OAbLxWFYmCfmGYAlmQ3e9l2pGPfNlU7UXdkrcohc6sYNr9te
 TM6lkmwla9EOw6b5vGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270187

Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via the
  Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/talos.dtsi      | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 7e05f873194a0b61e80281104104079b4e0f51a8..8e0c5235f6741b80f975326e2b4268af068c0ae2 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -498,6 +498,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4744777829a1938754f02a5f6cb5c..83ba8d3bc40731f54d71b6892045bc1dd15d320d 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -560,7 +560,7 @@ pmu-a76 {
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.34.1

