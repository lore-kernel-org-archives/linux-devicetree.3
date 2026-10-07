Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851703F9278
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 06:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354597; cv=none; b=tQ1vwsTBmxdDR666ACsLheEoiecBF6FgJrsEh/Dzn6hz5s/7AOo2rbdRCRbrkKQE6hkYHdmTHUAMg4fk6xbJyFAPONpMq3rIFe8va1oETBIo3vxFz+Ztvkb9olZrPSGCAnZCe1IO1u9B0HWl9P8O0zeBNmt+0mzOACHCsJYirKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354597; c=relaxed/simple;
	bh=dHA97+2+0JYIuKPe3in2smGgFvYwusOm38SwSWOCOKs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L0ujuwFRroTjMPnhm4QIVA4gu/SkVqbOVonWrq956i083znPbpHzIcDMeFDsJ0JoAq506ElfR4+mP7c86nIdR4w9dh+m3aK420N2ZGtLYcjUsaX9XXY0mlxPzMS7cL3zVyvx/yHKybAUevv85qNHdwxLPfAH664fQsulNXou4sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4ncJMTW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AqHjzlsI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4ncJMTW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AqHjzlsI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974ULag2551389
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 06:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bNj3YXbFi99+G0rbyhLVAh
	/fUq5/lgEJO3L7wMbr0g4=; b=g4ncJMTWdkdAK6nZ9qXiq0WkPNbyLGy1GBjcV2
	Zz4jEmdsWQtNF1/3phWlnjyQbqLBelkmX2JbB3hIPqs0njXE2F/3UEaErmA5TVSv
	6JPTEUeA+q282FKEwXsyF9ivc95ttX1qUIStsu4DjPEvAxsAgUMdiVvHKwwmeZDm
	YBk/R9TwZiLKBIo0WNKrAiGjh5DxcJ45OrCvO1E+oVvvGhwOPuP+MQlkdENYxPZI
	EPWNeaZ3wB4JKLXuniJMQ7xNtsbcOa/6oHCa4S0XLwR1awnI43F8CRjxb+9G3WKG
	WIcLc23OyOMzkYe38TqbOuYk1TmSU4Gs9rGwv8jjwEwjWTCQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c678v77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 06:29:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so3941793a91.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 23:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791354594; x=1791959394; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bNj3YXbFi99+G0rbyhLVAh/fUq5/lgEJO3L7wMbr0g4=;
        b=AqHjzlsID3KXCf+a9ikY8K4rAIugIpVaXPhz6r+haUPQ/4aJ8L4fBs2d+QKBlP2uRI
         C2v2nMmVxjbhljO2WYdLpWMjR7OOkMXqlk7cQJxmjKtH5u8PZZFWtgTiOc2ydRbm08ov
         mFEVnZqQq97+KYbum1xDEpE8t35R3OL51QijYXOxVe9A3Lm314hZ2vYrRpkuTZkvNKwj
         XKNDKFY9ppu9WWHUacosuKhutUcz92MAZ4aRbprDBOMAwAVQQynNrJBZ2/Hg63If9H2p
         ofaXvqchLeGURX7avI1cNb34JyJPYXeeIb/Dn/X/doPHZjIwTF/LsrHf27KFis/FviLL
         y2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791354594; x=1791959394;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bNj3YXbFi99+G0rbyhLVAh/fUq5/lgEJO3L7wMbr0g4=;
        b=OEeBXS2uDVM0iH8rhRp6uHm+f1VoCPMGpKDMpkBsvqHvhipgtcHYKjTFUfcw0yedY6
         pqgWjrXqKPbV9aRYF+1o3YyR2dqplnH8yQrjM/yzW9loNX5CZecU7S1yoGoJ/ji/F5nz
         Sx1cAJcRpfY6CZa1ENNDi4wLJT/5WixVsnb9n7YFqkmzapjo3/BT4nkUmNkDmLJknhwf
         li1hj4qMR2k4/uRtkwE19+q8NUhYNspplKQhAldngn6SJUt/PchPtUICNmuHkHoAer5H
         w8+J0f2qzHJJsCNzQx6gdIjNx15CqQrxR/sZt2nCZoXbyqRrwhm3jPZCujX4pRDQHMCo
         GYqw==
X-Forwarded-Encrypted: i=1; AKwUvByeS0/XnnxpUY3D1RKIoYeS9l3Infr8HoXMg0zuL3cSQ5Gfkil5FZsPHs38bNoDv/DobsgBvEnbQIJj@vger.kernel.org
X-Gm-Message-State: AFq9FYLGuxLiHJ/ZnTZxQzrSpqraHUpO/vouctvJ/KT/Pg+Mq87ymEnt
	hUaxNsiC50TOqF8Vpb5TZl4WabCnvQYYvmeVBmC4K3Sfp+QRRQTCljIqNthG1TogXzEj+6OVGL7
	BxeAUl32DmW1SSvJ/KPxa2vQ4xXT3TnbzpuJf0SLTgjRrhNj8lfqVOby9YqckosWo
X-Gm-Gg: AYBFou0bVQDISFi1Em72xXJ21HgJDlGzlighm6LK757755w0KaFYHX9AzEPHz4cEtia
	koKyXWnh5oSxIqCSM4pnlCxNG2OxeLlb4kvHX6MaR/fUCnLtqs3RFUwUW+BtYdduFYrpAhmPvAL
	clMkLMuOSWBr3yeDzY3NwiGdeISoqiGiYUb+uI2J2txi2UuPmAZjPgVh9lYHbNzqVD4aVf45MQC
	DKy9D2gqLWxPwLhyb1BJW9gCnqOrezCWe316PjtoF7DZyGvWKaVFzfngVTP7Fe+iXZlUzIAZ9r3
	RQh7qPFPW48FSKtothj7MpWYAUULmuP/CW+bF0KGPcFila/HSVo+6iqtEjnSihA1HcYa3n3ph+H
	gsGdRAtNLzrQmaoSWxrfujOvwUw==
X-Received: by 2002:a17:90b:4c4e:b0:3a8:181a:2bfc with SMTP id 98e67ed59e1d1-3a8a0a909d4mr1015436a91.14.1791354594297;
        Tue, 06 Oct 2026 23:29:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4e:b0:3a8:181a:2bfc with SMTP id 98e67ed59e1d1-3a8a0a909d4mr1015409a91.14.1791354593862;
        Tue, 06 Oct 2026 23:29:53 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89ab81bb0sm2972690a91.5.2026.10.06.23.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:29:53 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH v3 0/5] Add UFS support for Glymur Qualcomm SoC
Date: Wed, 07 Oct 2026 11:59:33 +0530
Message-Id: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM3mxWoC/42NUQuCMBRG/4rsuYmbOltP/Y8ImeuqA525uZGI/
 71pD/UQ0cuF88E9Z0EWjAKLTtGCDHhl1aADpIcIyVboBrC6BUY0oSzhhOCmm3tnSlfbcpRVCVp
 UHfSgJ0xymomMFzlNKhT+7wZq9djdl+uLDYwuJKb32Co7DWbe+55s6z8pT3CCK17LHCgA5+I8W
 BuPTnRy6Ps4HLTJPf0UHn8JaRASxgivC0iZYF+E67o+AR+S4PwvAQAA
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791354585; l=1813;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=dHA97+2+0JYIuKPe3in2smGgFvYwusOm38SwSWOCOKs=;
 b=WAELjHwK1UTXE8rQO/ltsrny8yaRhLMj3rTn+kifBQ/U8fK7nPalJp3iQT03sglkoHfIzv1H0
 uTsfiZN9vDNBaeF3Auc2ySPiLYgznJ2RtxE17ViuALtys4AYnehLviZ
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfX9P/6lAhMIS73
 bdGPShdaeYp9w5qbrAlx6c39JCVO1fxJQoUX421bRVMVMSi6YZo3vViZjfT/Tt1H+/hbLGNthMI
 GYUMdCdernstUg7Cc3xvX5bbTrkMj9s=
X-Proofpoint-ORIG-GUID: RGvKtjVe4JQUfkPF1gSatcv6_hWHEiu3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfXxEw8SUFNtf2F
 enVFMlG0/rTvaHRxkUUa7WehZV8Ewf06JoTbKrjWUcxdp62EyDiKP12xX/OnaQnemB+zX7/Hjrb
 OLuUN7xwsSb8mpBJXMpSszWhQoK+N76avzdGePRuDvWzWg0UwgIr43VkDJYx6CgenuApOnAFMZl
 w0RLoYi0AyNCb5p7ybbkuMuKSUZiig6OnEJ0WedhA4ceK+Aei7uCWzQ9gT+inkgSeAuixC4tr79
 uRJWw0on/lVFqpXPErHYyablPlfrt+VN+nS+OIXYFOK9L6AfL+mytdb8XweOKFbjHpBCVEZNbm1
 h5E5kT0F4hOIXIZT/i4KDkNFK30QIaAkGrFqYRjBDJ4Ugj25UorpoUwBxdQgtcL2Lm8+AkWSTwA
 U8So/Vxpaq3LTo6bv7J4ZXNXtJeP94w9rJw2pJXFEETD9tsPq3pv+GxDFWtQw7vX3rM2yhRXg9a
 yZZsjE9dzhLugUo/ewg==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac5e6e3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bCOaQtj3lm0yH_HaZWYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: RGvKtjVe4JQUfkPF1gSatcv6_hWHEiu3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070025

This series adds the DT bindings, device tree support for the UFS PHY
and UFS Host Controller, along with the required PHY driver updates to
enable UFS support on the Glymur Qualcomm platform.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
Changes in v3:
- Rebased on top of latest linux-next(tag: next-20261006).
- Retained all RB-by and AB-by tags as is.
- Link to v2: https://lore.kernel.org/r/20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com

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
base-commit: eea3fef32a9cf36abcb5975a5a594e4135a6b026
change-id: 20260911-glymur_ufs_qcb_enablement-1524a497520b

Best regards,
-- 
Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

