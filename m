Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C573DD50B
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676122; cv=none; b=XKzz9aGJzaNen0SW+eOjtk9mYiDdPRK8npJaAiotPRseKB/68ARn6U5hi4YzJLsWlgUqJJLnZLOFCQ0q8U5td5yxyuyO8DuXpQ91Zgbs1nDpyVmVR6A7zvbJ1GUtxHjh6OjsPWCCYfRpctMsMXW0U/EsVXEUhRvz0mMyeQsN4GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676122; c=relaxed/simple;
	bh=UbSjGL9e+/dLT7KN7lcxI4BnrAKdRxEjpy13ImBVeYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k1LY5zgeB8z84oGLpfpm8szezJpXNOLVVhnZEiNHzMoScVraHWDf3zYJ9b1UzjLQTpdTtod6ibzNXMLV0OkpMI6zQN4iPsA0BAq3Jbxa4J4HXWN9QytLVNhNOwIyYEjp2Lij6SeFZO+/3NsSm6145j/uLiXYAtRxzffSf1MWBvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oD0o86Ga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OiFARNSS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oD0o86Ga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OiFARNSS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7TeDj141381
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rLJU5lUhIyReLzUTy9Pl+7
	nUZmp2oPn4L5lAZNonlcE=; b=oD0o86Ga5BZuS7ZS9ocHyDxhC5GEaOPJT+rRMD
	JOabk6UenhNMUT11SrVMn0kVqLyhgJvVbRLCyjCDLDUNXJajJ5Wq6OLdYliObv+n
	IGnQW3RuM/vzrqZlxWDZ4UHa6wIvyuWa0Tw8/askAXfhlJAndpzKmiZmq0CVc1l3
	ivcs8BhYn8Xdx+ZpRmiGlHmj4vCBGRho15LK9MWx39LvzAjwvJLf+UOEaugSY5xj
	y15ui6Xy0cmkIlkYPHlWRYqkiuReinwp382HLg+rvoatCTx7cyUK1f4aFlPEJc0s
	sQDzA1EtiHiXQAegV6LNE4woZr03dx+NhP8zumjrHxFSB4qA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0gsaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:01:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a880e91f0so5647220b3a.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790676116; x=1791280916; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rLJU5lUhIyReLzUTy9Pl+7nUZmp2oPn4L5lAZNonlcE=;
        b=OiFARNSSeWB+spptJKd9acHmZFWuVx+vhYNjvjOWboqTqb6uIFUjsAqCM4M4PodsAe
         9YuBc7ImEuQBnyWakCZ2AIOMJPGM3L/TzbS+Nmns4ACMdZuQ2HUGMs/AoWj75lVfU/Z5
         tbr7RZMDDwn47GWZzHefY/9qyDLhMhnoWUhuBzzz+4X4HVCAlcJycygdGaaGiEepbP9O
         UZFx4i7qAivkXup8NaDvDHL1uMvzjuZ01M49bP7GVSNTw0VCwOXSG3+BRnH+ayhMau69
         tlEH91Yq/j//hX7QfkLelHCqaCwQ6+v3BA8EiD4cGmRUVipnVjzwgDbrIIXd9mm5dhAS
         b2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676116; x=1791280916;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rLJU5lUhIyReLzUTy9Pl+7nUZmp2oPn4L5lAZNonlcE=;
        b=W2pkQHXsPjSLG2wuN+fGnNiAOT3jjVrM3mIXgkBDz8ZTQe0vwfmX3kLAOOvoFC70Ux
         loBo6MVdK0M6mWo++K9R6OdTFbsU84UW7+jY9QPAefxc8wI8k6amEyAm17569iG8L4ci
         OPf43FoHb/w8EfAxP8CaAWpuk4JNBHhW8YhFdFvamBDpapYXzBnTezSetUWtRrnFbwjE
         LlbpM84oRlu6kXMGPc9Vom2pA4ObU+7duH+SehgTmcT+idKHNUdk1rMCkLXckQvvP8jH
         gmpRIVykpPSk/Uv5WPUM73KEuaFak/MZkumY+Mvypfy6j03j5aFMZY2bi3bk6nHr8co4
         0Vvw==
X-Forwarded-Encrypted: i=1; AKwUvBwBxiMqxoME1PpGz8DnHDmsAxRXaUnMep+/RbJf6x4F2tTw7OOTlbm+U074rHlwawUXgkJVg0K6sY5j@vger.kernel.org
X-Gm-Message-State: AFuF++kqSBvITGoAd3SHS4TBu3tAoat4hEXmB6owDC1ujdA/6n4gaO07
	2/cna7RFiZYBMVSN7qjgBFP8XPsf9lSVIbxWcDb4fIk0hdZcTExhwn+7VObURyXEuq8mfsaFwgZ
	xthWeYYioh3CQjafhDvza20JQa7AErC3YNlq7QLNnYm4nW4HJkHAIFfeyOtwNux5y
X-Gm-Gg: AYBFou1fybBmC19KVsf8ZC5jAzL8HmMbIClulniIOFAS46cpMews4UBnoI6/vroWpIX
	MVoELINkV9/VHeFD4ppKzKv2+kqaEx19Eu6XExGtjIq5JgzeEoKha+H3OBT324EwsI7u3IxZrbu
	3cPaK5e1AW+5JfZ4P1ALLmbVN5ADBXGmwWg4vhBY2NZiCIiE+YstQrZb0+Rm1VVWJ50JmxMk9YX
	x5OMMGhu1qXP4oD5932E9SPTKiAmPW46D2NhaP9gQlpJl6r5W46cFLBICsk2NojO16/yWieDoW8
	cda7S4Img7UxnjXchrAYXhFvsH/AxYHtqvk4DPacp0Q+V6hfWXAl2hwMKDNFVJ11zXDoK7HVpKD
	/7SOgy7zv5TpGt1dqAG7/1CoUnVNGQA==
X-Received: by 2002:a05:6a00:2290:b0:881:9cb2:b625 with SMTP id d2e1a72fcca58-8819cb2c382mr6437727b3a.9.1790676116064;
        Tue, 29 Sep 2026 03:01:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2290:b0:881:9cb2:b625 with SMTP id d2e1a72fcca58-8819cb2c382mr6437685b3a.9.1790676115532;
        Tue, 29 Sep 2026 03:01:55 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885defd736csm547963b3a.8.2026.09.29.03.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:01:55 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:31:29 +0530
Subject: [PATCH v2] arm64: dts: qcom: shikra: Add WCN clock to wcn3988-pmu
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-bt-wcn-clk-enable-v2-1-7a90902f3df5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHmMu2oC/32NwQ6CMBBEf4Xs2SWlIAFP/ofh0JZVqthqF1BD+
 HcL3r1M8pKZNzMwBUsMh2SGQJNl610EuUvAdMpdCG0bGaSQpajlHvWAL+PQ9Dckp3RPWLckyir
 PC6UyiLtHoLN9b85T82Me9ZXMsIrWRmd58OGznU7Z2vvnnzIUmAtNVFWmaKk4eub0Oare+Ps9j
 QHNsixfE8h6AMsAAAA=
X-Change-ID: 20260925-bt-wcn-clk-enable-9de068334aa1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790676110; l=2838;
 i=yepuri.siddu@oss.qualcomm.com; s=20260603; h=from:subject:message-id;
 bh=UbSjGL9e+/dLT7KN7lcxI4BnrAKdRxEjpy13ImBVeYY=;
 b=2UQuQk36XZoDlpg04qfIkoXXCOQIw8+4Lvr8Rl13mYnTNoriuPzrro5v6DFVKAINutfkNbe9g
 BfyTtE0GMrdA0SdMwpTIuYBf62YB92QhhVrmC8bl+6y4EtIIgGsQhuq
X-Developer-Key: i=yepuri.siddu@oss.qualcomm.com; a=ed25519;
 pk=ldEQwkUmctxwDtIVURg3xvXfzZavX8decqpk/pVLQZg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfX1evh+YqPRmpG
 dtEKOqvBHv1nqFURtgzdQVDvDBfX70UtvmTnuX2j1EPvLHzfq9TO+c+L5ATk8R4tFAyYHFhtPzh
 4AoxjRnbJzD43LIKb/FUJQAAGRM8aO4=
X-Proofpoint-ORIG-GUID: fMcUFgxminfSZ4UnHW2fmtog4u0kOn_x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfX5QURKwR1hRpS
 KiJ6vnH5zzdFUdiHUEwAuDLGHxWhR40mi4MYr6AzV7K0dHUKJlLLnwcuSQOTHPtOwRrlOHeRXI8
 3fWwy2l5omkoiqy9LEBEvf8VmJENEJHkpZa8fcW6eyfw9gXEuEiAbWKDTnet3oGTnR5b4OMnesh
 Gg6M/0TFBRMFyBs72Qcp0UQ2Ek8DJC1OOPnhv9MPM1D2VWyJ2Svz7wLgwwLAdwHdjKQG6WeSDdG
 mgjHqpBE6h9ykRF2pp5wrMXLo2cUcm4K4bE9YT51SexwzZqe7XTJFE8gS7qs9W+h5HsrJu7x7+w
 d7lukfuuGi6oCvqpVKkOB9ECT6WKGWzpNnV0d/x+hahAazPdO85DTzxun6cwK+9qjv8qE7nSwXL
 /PixSYfAHuKaMSg3VG8HjZmsBgRxwsgZ9miaHKrvtKohH8HEJUfs+X18gs9z51pOAq4RKBkTw/z
 ydqx/xoioi3KWEs8nJA==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abb8c95 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=nywYmDCMRSA-jTRoS_oA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: fMcUFgxminfSZ4UnHW2fmtog4u0kOn_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290039

With RPMCC proxy vote removal, the WCN clock must be explicitly declared
so the wcn3988-pmu driver can vote for it during WCN power on/off.

Place the clock in the wcn3988-pmu node since the PMU driver owns the
WCN power sequencing. CQM SOM uses RPM_SMD_RF_CLK2 while IQS SOM uses
RPM_SMD_RF_CLK1, reflecting the WCN clock assignments on each board
variant.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
every clock, keeping them non-zero until a consumer takes over. On Shikra,
the BT WCN clock was surviving on these proxy votes. With proxy vote
removal on QCM2290 [1], the sleep vote is no longer held, which means the
WCN clock must be explicitly declared in DTS so the wcn3988-pmu driver
can manage it during power sequencing.

The clock is added to the wcn3988-pmu node in Shikra DTS. CQM SOM uses
RPM_SMD_RF_CLK2 while IQS SOM uses RPM_SMD_RF_CLK1, reflecting the WCN
clock assignments on each board variant.

Validations:
- BT enable/disable verified on Shikra CQM, CQS and IQS EVK boards.
- Confirmed WCN clock voted on BT enable and released on BT disable.

[1] https://lore.kernel.org/all/20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com/
---
Changes in v2:
- Move clock property to wcn3988-pmu node instead of bluetooth node.
- Drop hci_qca driver changes; clock is managed by the PMU driver.
- Link to v1: https://patch.msgid.link/20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..48af2bb87cf3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -45,6 +45,8 @@ wcn3988-pmu {
 		vddrf-supply = <&pm4125_l10>;
 		vddch0-supply = <&pm4125_l22>;
 
+		clocks = <&rpmcc RPM_SMD_RF_CLK2>;
+
 		regulators {
 			vreg_pmu_io: ldo0 {
 				regulator-name = "vreg_pmu_io";
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 4ff97945274d..90aceaa6e1e3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -52,6 +52,8 @@ wcn3988-pmu {
 		vddrf-supply = <&pm8150_l8>;
 		vddch0-supply = <&vreg_wcn_3p3>;
 
+		clocks = <&rpmcc RPM_SMD_RF_CLK1>;
+
 		regulators {
 			vreg_pmu_io: ldo0 {
 				regulator-name = "vreg_pmu_io";

---
base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
change-id: 20260925-bt-wcn-clk-enable-9de068334aa1

Best regards,
--  
Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>

