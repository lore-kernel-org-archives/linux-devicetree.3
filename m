Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2B23769ED
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 07:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185121; cv=none; b=pZMObTqkknZgBIAcy9Y4whgYu/ENz1Lp9Q1SwMN77McuLxSJnjjKUbuYldVrGHABGn3MLBSiqSj9Iq4EFDdy0VgnIAntrNIEv7271XiTRWo2wuL61cUdqAF1bQzFkG6MZfIA3tAnPQeG9SiawVrz5aIVHDYy/TAtsgSCQLGbl3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185121; c=relaxed/simple;
	bh=H/ngu2NtKM0XR9OEviez25RT11Pu6dH3Orddp07YVTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wm/pNVYZVHYjCyM5bqvsc9pXLoLDuOwdAv8PICjkWqjhI5fzyrHy7sJhfnDhgrlW9BSuStSkH8DUj9rNUNpEdN+QPujrjs+NF8dni6BerIDCkoAnGatclF0R6dWaEVSUSlp8Y18dnvBwHNfYtnsxJLLxZX/j0dYx9V79wV4PR+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5CGdhm8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRc+x8Uc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5CGdhm8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRc+x8Uc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695103Qa3688170
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 07:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+0ADLN4tmjKk8N9WUyV0L4KRQPHIhMO2nAEzDRj/GbM=; b=V5CGdhm8k58mrLcI
	Wo24SlRivtai3j96ezyMNQl2BSjodo1XjTa+B5w3X74frlm/Yyb5vgPfOpq7OYs+
	2rfFfGVgQ3ofPpg7K1L2iXGVncBwyoFCDLorDtktYN8ZRdLzyXvlwTsqdDu2gKTe
	m6Tt5+2z8pGZZiCZ8HB7XuksZ8WtQqhP7fdb2uKWNV4bazEpJmg4NJW/HyPCWMFa
	hci3quG3pcw2Xa7DLotfrl6i90t+g8XhbUImiOuLAM2PxVuYXHVXvDsuEVQ3Pkba
	56MX4wFL9vog4bwGSATidxRMpsi+JXl10RqbByQi/zEkuLTwVHQHguXC8nyZ5VEz
	jQEIWA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfjsb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 07:25:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1337361a91.2
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 00:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791185117; x=1791789917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0ADLN4tmjKk8N9WUyV0L4KRQPHIhMO2nAEzDRj/GbM=;
        b=XRc+x8UcWCZXS/ZYaJrc5YFuOhzC3OErF0cs1lr3xWlrvI6TT9+fH001JmgCVUb9sc
         fj/M1fMuD7wCxWO48aQ37DNySPE87IVAjupxEcwQo/1J8Ia9bu9IHCCiF2US+M45qgWw
         XF5D+F7ry4SeWIVWR4nzCztsifmV5qYtpbiRH9SDpEDov5lWRTQdqCS0LEyvrC5QQDHt
         vNZv/L6ij2LuzOP5Mx1sf+7h4ZdgZhX9choz7RRQyQWNADpjL50xg0G6Z4Gae4uki7F1
         th+LRLuPA/zQKy6Nyc/8EdXh6WnHa8uZ1BFnI1yawhLnmMdSBR1U4r2aG/mLf4ETzwp9
         fqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185117; x=1791789917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+0ADLN4tmjKk8N9WUyV0L4KRQPHIhMO2nAEzDRj/GbM=;
        b=byTBa/Sbmj3Xf8vBU6BraxSrUG+y1OeyBUj9mRS32WUM8MyWjyYBGbWn1G/BUB15jv
         xMmC8GtZ2LoNipS5O2yq1I110BOyxlhO8XwXdvoZT8EsagBuDSMev8mAs1Y+TAfHsHEa
         DMOeD5/9Vo1YtwytSKdtQzTxxUr/sligFN0498eWovRlZtd3/cTzOwvQcQnVwP6qpQ/p
         SzWB3bqX0kvaJZ6Oy8dnUmucvYQa+ugq0aoed3j9pQslx+otDFRVAsS/aOVuoB/jTtRJ
         fnPQDWi9UeYTXQSn5/QLBMlv05IA/hlTx/+/vxyeJFQg6bj6WmoX73mfGrLF77a8ibi6
         0/TA==
X-Forwarded-Encrypted: i=1; AKwUvByfbg3+9bosQcLco9pzT0lPOKI8G1eKmyoVP0qyzs+XjQuOMPDSdV75p4kmEr0Cm1+o2qP2g2VsAyVx@vger.kernel.org
X-Gm-Message-State: AFq9FYIa0K1DNjbsx2pA6WOwIVNuU2PGb/Ndo7QmFuEXcbUj0Btl/kKB
	by015sMr7kdW68S1wDkQP/7Lo8wl7ywjRkM4WtAFsSo9NwQCSLjXBQH8x+6eeL134PVoNF7mj2Y
	MtbFP2Yhn55aqmIQ7draKB/3s7wc+xdQYyKtkbcGdVIiFOz5FDUM1YjsBfsUu7WHw
X-Gm-Gg: AYBFou0G9oI85nFjc6t1iMb9M3iqV0wnXenuPxbuRDGMMWHKbn+OsmQ9fy/kWEz49dE
	O16OxrxLUe6UlI6yCI4WM1TD1a7OVnQd7yVccdSvoUU53o1Otsj3coxTXg8xUPVnh2k4NvB+0f6
	TiU/898ew2B5APx2lAB3fP/IQ9RHYO5y+P4cp7/IVholCMk+gjQozElZ37Y7fS1u2E3EXYKjES0
	pgp1flBG+p64gFka9nDGQgCN5QLWoconQLLc/zt30f2AsP9tAs2mpOQit4/XqqKugjUxJnl4YxQ
	8m9/zh+GwIWLfodi/O82Yux0AA0mi9d45j3QxBbbFVITF3OvK1lNdEGL7sZ3Nhj874olBdOYDQG
	LkLogoeVEZ+VZfLGkdsmU4ln+DERXNsjd/Iw=
X-Received: by 2002:a17:90b:4d0c:b0:3a7:a463:54bf with SMTP id 98e67ed59e1d1-3a7a463570emr1941176a91.33.1791185117386;
        Mon, 05 Oct 2026 00:25:17 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0c:b0:3a7:a463:54bf with SMTP id 98e67ed59e1d1-3a7a463570emr1941150a91.33.1791185116922;
        Mon, 05 Oct 2026 00:25:16 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4f3911sm9901421a91.15.2026.10.05.00.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:25:16 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:54:30 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: kaanapali-mtp: Enable DisplayPort
 over USB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-kaanapali_dp-v1-5-6faeac3a6d59@oss.qualcomm.com>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
In-Reply-To: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791185070; l=773;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=H/ngu2NtKM0XR9OEviez25RT11Pu6dH3Orddp07YVTY=;
 b=D+xf16u7uxuQGu/DAQZ8gv6a68ZQIUfSSSOn6ayBSuo43khwowC8y4fM1svWyJdiebAe5xzBG
 yUJfp/uy3LCDY6ghTGnBTNWaIER8u4JC3fwO8PU4lULQmrIgUNGl4JA
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-ORIG-GUID: 7JDc4LljmTJLPnTKlv7pIlcVrAER55no
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX4XoQCBsHvO8W
 f+DFiMVcSGFVe3LNyuSa/sT/88c6WrTBdUWW9noAjibM0gCCMCej4uXC8Nw3P4TXXuWzP8WeRHt
 jAhsam7JxB9AMciTyZTiZx2ju8ydshM=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac350de cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5UEAqLcyi3SyoXtcnFMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 7JDc4LljmTJLPnTKlv7pIlcVrAER55no
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX9N7qrU222V5a
 zWuwKuAxohp2HWL20psG+hL/0VaudXFFu5na77+Peba5d+FFULjsEkHXI3t7uYhhM1xsSWStDBq
 AzsqgO16oBZAfd0mCJWs8Qd2W4pC5OpmJevbFrFAB9Kr6mS8vin/UrDDofoq8oy9zx5Yeh/1o7K
 gjNwlk5fiyrSBCnORiDS7qs8PKSR4IZ5Oe+XvaXgwXOH/TiRZtNodUb6WHnlpKokCb7egmPbrVq
 /1QezEWXIy1m89Eq7cokj8XT6Q9UyyhErGh7BBZUcSEWSyzqRQ0/0uAdXGwF5OVa4d6b8Vvyap/
 5gjqpfVYsu47DiryXWyo/BbBboJmxV5oXEJP2E8GFIIPTIcZ2iiK4U/30hTqU7vhCbfRXUVeMge
 X/8zBJEJVW/HuVBoDfXgS5cryX8Isi01EanTSil7mIrHuMrf1DRq/nOZp4TOQoWI5moWeSqocHT
 XbkIm2wGAipwtugjh0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050028

Hook up DisplayPort parts over Type-C USB on MTP.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 16f4dd041649..ff5d5c2fafba 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1015,6 +1015,14 @@ &mdss_dsi0_phy {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1

