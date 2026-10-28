Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190330;
	b=07kGlJp/7u4v5KWbpHJ43OyKJZjwvrJDJDkd9kDtlu6nkxcSqUl6sdM0ce4Tv6Tllhow
	 n2ncAF1bx3OyqfBBXEBx3264FBhbjcQ2bZH+LQVNqDPvj6WaVuMEolM6tZChOAp1EB92+
	 kxvzatgNfmXhL69TyIHya+nOViX5kpaujKVKQP9Leso4zBVpIIIWEX1qJ87F74WiwNZRT
	 LN0Z6LSw/HUe1qF7pZ383VaByiPo18L2zcMFUoDb0n0br3ZMnad3jCGGD5u5nSOQuV0S4
	 2MjE/wvCP3WCoIxre3sjJFq3rp2MrdfHJMNU27nNgtFHfdlnOtF/O/BQVm08KHiaK6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190330;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u+aOGSLnsirSIlKBqojLhK2+vD6OvbhOz3Q4h4cNqXw=;
	b=qBqmqcTgsEy2oSZVX06urjfFHp9SKSy9btWW0wdA0Lgxx6aaljrpxIAc7GotbzocFMK3
	 RmgeHagsp3nh25ooG7OXa63pMC8LDJhTTmGxk8niPfUD7r4oDGDQ73Q84UXXOSRYOYLAu
	 iCMqvynALjBnj26Zip2NkIRCD+oD2J+U+3S+xjED96AT5CsnNm1puwyOlslrLkIbOB+iS
	 bmVIo5elYVmuBbapvPjVjwhhZ5UEvxg7ljmKPBzAkeJYrs79+MfPq/mm6q7bbKt8/TiZy
	 rI6Rj1t3QYn/MayD7KLDWAzI4yRZjsIW1hEs868kFdQjr6HoGTGxL3Vk3NnpgsKsZSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mJp16ic/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnUWiIXU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20491606A321
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20491606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mJp16ic/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnUWiIXU
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeGV4995024
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u+aOGSLnsirSIlKBqojLhK2+vD6OvbhOz3Q4h4cNqXw=; b=mJp16ic/e1pBzQMY
	EJchT49oyLZ3HE1a9y5bUMvYqG0bnZFnZm/j54LfatL9ApxPST2kSKWkRAVZbxh1
	oNK03fStBFnskik5Zog+X6FGKgCnG8QAgBPFrL0zcbu6YjM9W5WUARHlMf61wI7v
	CQWdgdYH6aK/b7fqQeqenkgJI7mUZ3+mtR47PWlXXgge1KBter98uD9rhB8eu1DD
	D4NTCsslqxRwuWmMfiREYiP5gS6C/EuXuz+ixRX7LcKm3jLGM7u9oPdW60854I5b
	QjD6epgVJmzsplxNgRULEsbtO/42/is3d/BaoE7aIAIU9oxOUrBayDlTfMOy7P4+
	Nz2YZg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tt0up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:25:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso963240a91.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190328; x=1793795128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+aOGSLnsirSIlKBqojLhK2+vD6OvbhOz3Q4h4cNqXw=;
        b=YnUWiIXU+pVswZQZ1U7iFi2TYrMugnXV5JHZX6JxuGNdGusfoM+pC+9bd2BCyQmqcr
         YsVfMW2/e/tPorVUonbWKY+dcD4f9sWr2Omn1q+NfOSymE5/AaX0lz1Zx5EbyF/ztVHn
         Gh1sYh4i3JL6FYsRQhi7n4rugH7lYW6iXNDI3mXPOEaWrzfshS3VMKMXeM3v6u/RZvkd
         GDmvUYnO0D9F/Ianup98gCCcx5mBRsC43Q6arZc+DzHT1Stn7dABzFeOJ4DadsDxkFN+
         OaZroqVyVpKjvOF1nQvgYskmcyAzCEjATkoaKP6k97gT5hR2qnRki97tw6jhgfGAJufS
         M2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190328; x=1793795128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+aOGSLnsirSIlKBqojLhK2+vD6OvbhOz3Q4h4cNqXw=;
        b=SRyXhPns3osVDw0Jw2jjvnyLxdX7FpETIBJ6BA9aEndYYjExQ3X2rdGaq5owMtCAhl
         9HYlTNqfJL0zywt8GoLEuhYcXKOH/OUtBDcotrccYcRHu5ja6xMvVV+c92k1LtKv32WP
         vsHiScm6hV2Svh2welK2a3Pks9p46Fhg2kz9opuPuM0unBcBqmoBHamDIZRZOAicihkX
         eSb89+SA/XmGGQu3zGeFYa1gL/GkM/hroJONNJaIOuxPPsqmLREHKxueZY4G0yyZAADF
         LqJtRtLbGgLeFfeSrlB0i7hsNzX5Op6p3NBUmgaAHfeRkQGJoSB1Xu5tCHYgABvbnXL9
         yHEw==
X-Forwarded-Encrypted: i=1; AKwUvByazON6ZES/0tREDNUfuGGbhkLAbtNMl8q/TXAF8q/6M/VpHj5dq9jWcDh9PPjlzMwblYbMBzyH3g0b@vger.kernel.org
X-Gm-Message-State: AFq9FYIHwoZmiLhO6w2Vx9SkQx64ZI/ADiueRXn2uzA3gSx2/YPN1LuB
	gFhOTYqhXpTdAkunCaQAyNCGJSl4HqrMAevmmITo+kkpYhqj2RUIpN/DR6PlZm6xbT09rR3prLf
	56HCVURrtZbEenn3RX0pvykQY5hw7N+hGAbMck++Puau7/PbmIWUDbBBgAbq5oe7q
X-Gm-Gg: AYBFou21wc9DrOTMB5C0zVybZrGyoR3YtBFlQ5cU3x8AKDh4+Mv64JNF+XA5RFMDIK2
	aXlin6I9kDYk/5pSziPG9ttYpEt3LwT0Qr80UlekZ5xJTzcMi8YfUeXyLRKkLEve6Qs7dXpJ433
	gcoTqry4lUpVkJ1qPljNTBEHVPOmQRwo8NczsFQ/nuj8zh7XJITOwmvX4d7hZ4CJSDvlaPdz9/h
	F9i3yxMUk9SM0+fS2Yc59k4d8nbwpza2k4IUSQhrLVBQ6LhcJ4uQVPMrbwyla6UEjPzqyeGhByw
	VPQ8IAgNqdmeACF2dRwRsNz6+HsR+e6cOgthNBvwx8xpvLQkCEpKQcphfbYXzk428dV6Lc5k4Ew
	K+tm5mIA39QwlCXOx5XW++6vIfHWc6j36BDuQ+wSuI6bTYQv66kBpNCdF0d/7Zj9lYykDAO7oCs
	s=
X-Received: by 2002:a17:90b:2641:b0:3ac:80dc:f41d with SMTP id 98e67ed59e1d1-3ae581d3cabmr1553044a91.32.1793190327815;
        Wed, 28 Oct 2026 05:25:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2641:b0:3ac:80dc:f41d with SMTP id 98e67ed59e1d1-3ae581d3cabmr1553006a91.32.1793190327249;
        Wed, 28 Oct 2026 05:25:27 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9f287fsm2995819a91.16.2026.10.28.05.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:25:26 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 17:54:46 +0530
Subject: [PATCH v5 1/3] arm64: dts: qcom: glymur: Add UFS nodes
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-glymur_ufs_qcb_enablement-v5-1-09cda5e3bab3@oss.qualcomm.com>
References: <20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com>
In-Reply-To: <20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com>
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
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793190309; l=4404;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=lx4QDJQ8xne6p4Wg5DQ9+pgRxdE/BlGcSZZOdqlsUKw=;
 b=4wGgxUttx81ECAd5ykhYaNl9cWeYwlP/VcUOsW2Y4ot7QldEIOBNiNMhuoICy/OxfYK/7NXE4
 sRNu65/MvvbAhwRu1RwX+hQA2ymrLWqxz6r5960aIlzn9NxpJwUbpW2
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-GUID: 6l6ySN4zh-eV1u5eTQ7I1d3MVBBe4z1B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX2DeDIyC2eCZo
 TTCuKrY0qqf9nWkBrGMKsVBn2pV0Kzdsy4RUMP6noeVKvDR+FEvK7gpzC838kaqiW+5aHhlYvpZ
 IR2sb8577KfcqMoG8HkEDSA6DmTuUi4=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1e9b9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7sHo3vQ6stv6frjssEUA:9 a=JqOrBNmfTE-P4NNt:21
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 6l6ySN4zh-eV1u5eTQ7I1d3MVBBe4z1B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX30+fBMCm/rPx
 Wcamz/UvfIJshLYphykETKpuGMn27mJ6KBIbVBxLodwG1OlmFDGi2cY35D18dDG9w5bt3ybzxG7
 cnUB+4klTGkSJZrT7m6eD/kc9wqXQWcOxqGLuyEXFIyazrN0jsEdVgd5CNt/QqS3n/PR6ydSauf
 BWXnIgyXJq1ULfI/mymro8ItMzD/CbtLYkOnoZnqM940E9DEnHIUyZkK+Nqkzm9RrsrgWOJ9zCp
 hZ0Gg5aUbb09aNWc4ThHgyHWZS8plupQjlBkKZXyp9ecMjj5M0Ysw0p3ixtyjIlHPSoV6RR4Zrr
 IiUBAPF6Ln8vJzZ4ZU7BQzvq6yJDvgIVjsXXQPvOrCQIT5+rAU9DqNoZgo0wW6439MIqc/FM9Nf
 i4TYI4Yi8R0SC+NzxwB9rnbwRG1quj+NTvfHGvKAeOljasCMDGgdxluPrT1nOnsMEfNIjGettor
 IDnLy/pxKo/ZSTBI1kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280049

Add UFS PHY and UFS host controller nodes for Glymur SoC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 125 ++++++++++++++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..049fb2226466 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -811,9 +811,9 @@ gcc: clock-controller@100000 {
 				 <0>,				/* QUSB4 1 PHY RX 1 */
 				 <0>,				/* QUSB4 2 PHY RX 0 */
 				 <0>,				/* QUSB4 2 PHY RX 1 */
-				 <0>,				/* UFS PHY RX Symbol 0 */
-				 <0>,				/* UFS PHY RX Symbol 1 */
-				 <0>,				/* UFS PHY TX Symbol 0 */
+				 <&ufs_mem_phy 0>,
+				 <&ufs_mem_phy 1>,
+				 <&ufs_mem_phy 2>,
 				 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
@@ -4102,6 +4102,125 @@ rng: rng@10c3000 {
 			reg = <0x0 0x010c3000 0x0 0x1000>;
 		};
 
+		ufs_mem_phy: phy@1d80000 {
+			compatible = "qcom,glymur-qmp-ufs-phy";
+			reg = <0x0 0x01d80000 0x0 0x2000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 /* UFS and PCIE4 share the same clkref */
+				 <&tcsr TCSR_PCIE_4_CLKREF_EN>;
+
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,glymur-ufshc",
+				     "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0x0 0x01d84000 0x0 0x3000>,
+			      <0x0 0x01da0000 0x0 0x15000>;
+			reg-names = "std",
+				    "mcq";
+
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>,
+				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				 <&rpmhcc RPMH_LN_BB_CLK3>,
+				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk",
+				      "rx_lane1_sync_clk";
+
+			operating-points-v2 = <&ufs_opp_table>;
+
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			interconnects = <&aggre2_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "ufs-ddr",
+					     "cpu-ufs";
+
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			iommus = <&apps_smmu 0x460 0>;
+			dma-coherent;
+
+			msi-parent = <&gic_its 0x460>;
+			lanes-per-direction = <2>;
+
+			phys = <&ufs_mem_phy>;
+			phy-names = "ufsphy";
+
+			#reset-cells = <1>;
+
+			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <100000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-201500000 {
+					opp-hz = /bits/ 64 <201500000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <201500000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-403000000 {
+					opp-hz = /bits/ 64 <403000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <403000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;

-- 
2.34.1

