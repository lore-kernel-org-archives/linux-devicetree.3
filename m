Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06B94AF169
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727988; cv=none; b=OFqfLaV1/XR49lL9YnPIGQ201z0iuak6QQGToVzMDDkHxZ/6VmL50mVJ8NfdXiNl5AnwErEpLdQFFMRX2aT1/DQXzpNcUkEuF6+uPMigl8wkwobYoUdO7BIOD3KhFayKYrbigxxUfRRJY+d8/K8uKivajwYUWxuQ2pLCsmmCRC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727988; c=relaxed/simple;
	bh=aIrQ2V0TT/6iRA5oVDp90eSuktg1iJaSHozlFmhrY04=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B5LLA0qs4rTEr7UNwqBlBymQuwfbyLAxtFYDME1e2qJpmqg2mAmlrMAv2NZPh00FMwG8W11kphyZsAjS0nWrXe84Ya86g5brtbT5vcHt4ZEVRAZ0G1sRfMr1CqqbaAMqNHSWrW7DJb69Ru3UJxSD1cNkydggffacqum1MiQbfbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JcAbxmxV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRS0kPik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JcAbxmxV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRS0kPik"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IA3ckj3208460
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0bky6LxCR8ON3Ijq+kG1vs
	nKbZeqYDBJrMN60J1xEY4=; b=JcAbxmxV25krtkVOSn6jRlug/k5Jbe01f8Tn5G
	e41oQrHnqnaY5Kbl6Uoi8uxBQk0op1qj3lgCawdIDyTRdMvdXpzKW9KCRd/XYhLh
	pqQi2BRCP9LMuuPHlJf+d5tMPwUkto9rzVhTdBxR/SUWVRw6lokjQNizfPymFv1K
	aohn5jhj1Wvgxz8QdyNHMGY47rVCTDzyYmNqPob+McV7zsGFXx63td7Yse+kzYUm
	0G/qVv7X73iwsh8c/7/BfPdVk1dslKuqKTx0fEgbQn6uVjrOUL+Ko+Jw4iq6xZd+
	mC+orU2NIoMybPdK8Z5hYon3DIyDD7jDTR4aAuxrAgLGRSkA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dg3yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:39:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8633c0d7353so849645b3a.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789727978; x=1790332778; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0bky6LxCR8ON3Ijq+kG1vsnKbZeqYDBJrMN60J1xEY4=;
        b=LRS0kPik4CCpXFIU8mIfQ0+CGi7isch1OoieyiWfzRBClHVbbeDprOF7PVV+6GFOhQ
         z5vhOKKj24Dr/mBgEEiPNIMFHrKluuaAlV5kSvX1HxrgpA50M9gsUEqCW6d5BQX64O2u
         3chVL+TWiWmzov8DFiA/tvHgZx96B0MkB3LqiTeF63LajgookkPRObx28yeiD+ikD3G8
         6RzYfXgIYs1sz3Frl0D+zKf2RyrzjcKLHPQe4VRx0YMlT+VoaJSV90Jq0q+V5oV1ufV6
         oXKL81ZzE40tsLzD0/3hCOrDmYdXfzRfrtkIEUOaRsF5jL+8U3y9zWKvUQxAim3Rd5vo
         RjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789727978; x=1790332778;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0bky6LxCR8ON3Ijq+kG1vsnKbZeqYDBJrMN60J1xEY4=;
        b=gxnenZJscugx1WczatAxDRJBQjYinnlckHjovPAIT4ZqaPFB4PFMXAzzrnbvZobjhj
         Kz1bK4+r2REgMH/DBR3/e6XqPA+r8V7TxDdkAInyYhlk7BkbMtqlcU1fTE17dhrb9g94
         caSSpDCCenwa4ogQ4Y3l8Up2lemzl5ixiPYDeAPaFDNUdKhHKOJ3+pSkVTo8ULT+gFUB
         0cHB0SMBbmWk3Ppk8kZOIApo4oNHBVr5GnEwweNMs7gMHrs3ZMMoICf4KHffGl4/8YhY
         l2dislvrnR89qW1d2XpC9bjQuAff53eEtdYChyyidMa3VGh/EhsMxrO2rtzL2gY7E/VA
         DU0A==
X-Forwarded-Encrypted: i=1; AKwUvBx6DKDKFiimtI/yi7QBjATNJmPnpZbRL4HAZvvxhqc6RKlS6EQNPNpPIioYujPESE5/KcM2J3SS/emw@vger.kernel.org
X-Gm-Message-State: AFuF++nbDuNCmF7yFn9e92pP0WdST6WiZCPTUMJSwGt66ubOoKzuVJ5x
	pGx22no1Bj4VzsKGbWeq8TolI3DqZA0RndOQQv2fwE+o21twik8kuxdL+NWfdYrYFwRzp4/hqb0
	GAhiFCULR9epX5pA9d6DJmVhv+ovulk3xNh7ixrJ2JoUiR1GraJX+9gLKQe880qCn
X-Gm-Gg: AYBFou0O5Ckz5htUxl1ZyrCufv0pQXkAi0aeYiD5fHNlc9pWDyuKM+VV+CEAvFHjr+d
	6r0GCMFcZmkhWrUsH9HC/4aCn1wbJUvgYd8iw7gTgEv8zrP7ROK0akXVFnZywZYhCulWCE75Wu3
	fOQK62S1xoNj6h0behbFfKktmFw3rczOU36GL/jJCZbqLn8uh/GM4wUt0GTCV3t6QqbYzeGbvf+
	b1z7QGt0MPiA8e2J6290pbrTt+iWwHRD2vzyZtaqcuigt5KksLfkiS2kmtV1B6f0kShl96sRqh4
	z7hkam0EjNfJvMm01Clj8Ut8TQO5EIn43fr2ddL5AcugyVmU2oDx4g/iZOoq9l75NDox5E8PIhM
	C7lJTcfL/a4HvUlAIBPiIKm4FAQ==
X-Received: by 2002:a05:6300:278b:20b0:3da:bea4:621e with SMTP id adf61e73a8af0-3dd8c54c728mr3370686637.26.1789727978418;
        Fri, 18 Sep 2026 03:39:38 -0700 (PDT)
X-Received: by 2002:a05:6300:278b:20b0:3da:bea4:621e with SMTP id adf61e73a8af0-3dd8c54c728mr3370646637.26.1789727977918;
        Fri, 18 Sep 2026 03:39:37 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98e7sm4020702eec.9.2026.09.18.03.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:39:37 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Add UFS support for Glymur Qualcomm SoC
Date: Fri, 18 Sep 2026 16:09:06 +0530
Message-Id: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMsUrWoC/42QzW6DMBCEXyXyuRvZiw01p75HFSHbLIlVfooNq
 FHEu9dA1PbYy2rH8sx82geLFDxFVp4eLNDiox/6JPDlxNzN9FcCXyfNkGPOtRBwbe/dHKq5idX
 obEW9sS111E8gFEojdaGQW5b8n4Ea/7Vnv18OHWicU8V0PP42pMI9n8tnPqR8cO0HHF8iKIW5J
 KVzyk25CPaX7+kufuggkYEgrNE6LbKmLpdsc1gTCdzQdX4qTw3axrpMKelMroWWr5JnvEAtUVp
 dE21bjZJt7DcfpyHc9zOl9g3+HxdZBHCwunGKkEhr8zbEeB5n024Q5zTYZV3Xb80asZ2FAQAA
X-Change-ID: 20260911-glymur_ufs_qcb_enablement-1524a497520b
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789727970; l=2512;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=aIrQ2V0TT/6iRA5oVDp90eSuktg1iJaSHozlFmhrY04=;
 b=qVyth6QO2K9vr5ypFvkLN+h9wqExG799fDaZyUntYcFyRd0QWYFJj12krs8iItKMt5nQlykuo
 YHvTMqAUTjrCgaFGr3NCz5psIaUV3Damxncf4lPV882rQ0uXPYxXcLH
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfX0fF1oZTVrIuN
 Np60mEjyiRFvSBt6IWThshuvP5sSXSpcA43GBuU5op0PySUHh8hxgxmCTZ8I0XP9tFzNJqV5wAb
 0EEFeWx1DvVshR6VgSe5k8y6kv1Gn+4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfX0ONYqSod3sh/
 B1j2OxVi+oyki7c5c52LqO6Pw0KUhAbRZONzPgdG9HBP+ya092af1vnaUpDRPaM6skxDfz7/iFw
 OohW+FX5BjFfmoaT8yAhwQ9Ql4gPGabf3FPkcJ4DmLuZfRXRSDSuO4mOrkqRAExZ/7clsLcZXum
 vKOnJ/6o2nD08rRL7uoCDrHtipfM72AFkBoIsMw/2TYYM0tRVnZout2g2fwBXOpa7Sv68KfL7Kz
 u7xo34v7/rXXywdNMwZOok+MGljNPHEpo2Wyefy2bdZ7jWllmEH5QXoOnLe9KqEaX1P7Ixg61PF
 lthoZvV6p1h87l5oUNj7ENKBbdMcFlaoaUiiiXH31XgdW/F8v17fGe3WIAt7KyPRg0ARTxztyKy
 26/WihQ5dVcckOPjrQ5lT8D4LOtCCQ8eQz0JDIOPnoTJvf4qg4eK3votJyRlBaaUsaIf8Y/rnbp
 +H7JpnrWI2qHTRceK6Q==
X-Proofpoint-GUID: 2cuRHLrHWaT_Sb9UjugBFISHNfhR3uhV
X-Proofpoint-ORIG-GUID: 2cuRHLrHWaT_Sb9UjugBFISHNfhR3uhV
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad14f0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MjkSdyLvD0LHWdEy_1oA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180149

This series adds the DT bindings, device tree support for the UFS PHY
and UFS Host Controller, along with the required PHY driver updates to
enable UFS support on the Glymur Qualcomm platform.

This series depends on Glymur LNBB clocks[1] and Glymur QCB platform[2]
series.

[1]: https://lore.kernel.org/all/20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/20260908-glymur-qcb-v3-0-c194c0219218@oss.qualcomm.com/

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
Changes in v2:
- Added 201.5MHz OPP svs l1 entry [Konrad]
- Addressed minor cosmetic edits [Konrad]
- Sorted references label alphabetically [Konrad]
- Add RB-by for SoC dtsi & board dts [Abel]
- Add RB-by for phy driver changes [Abel]
- Add AB-by for phy driver changes [Konrad]
- Link to v1: https://lore.kernel.org/r/20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com

---
Pradeep P V K (5):
      dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document Glymur QMP UFS PHY
      scsi: ufs: qcom: dt-bindings: Document Glymur UFS controller
      arm64: dts: qcom: glymur: Add UFS nodes
      arm64: dts: qcom: glymur-qcb: Enable UFS
      phy: qcom-qmp-ufs: Add Glymur support

 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    |   2 +
 .../devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml |   3 +
 arch/arm64/boot/dts/qcom/glymur-qcb.dts            |  18 +++
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 125 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            |  99 ++++++++++++++++
 5 files changed, 244 insertions(+), 3 deletions(-)
---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260911-glymur_ufs_qcb_enablement-1524a497520b
prerequisite-change-id: 20260904-glymur-ufs-clk-changes-55264e596e6a:v1
prerequisite-patch-id: 934a81749f6e977edb9214104fe2bbf4c7758663
prerequisite-patch-id: d4215d48878aac66f72ef5b6c74d81d1163a596e
prerequisite-patch-id: 28be2089f7836210401b8a68c7cc0ca90d63c375
prerequisite-patch-id: cdf227f5515ad8faec49bde5e0475755a961100f
prerequisite-change-id: 20260711-glymur-qcb-1e2d2bc913fd:v3
prerequisite-patch-id: 53dfb255c51efb63dd26fae3cb30307f0d175ac2
prerequisite-patch-id: 7fa1b965056eaf3b90ce81a537d28c5a2adc73fa
prerequisite-patch-id: 96b042ef08bba0e028c86ea2a473d996880ab38e
prerequisite-patch-id: d2f390b67a2ec320db1e725f4b84b500f1f0400c

Best regards,
-- 
Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

