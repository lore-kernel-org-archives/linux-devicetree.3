Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720538;
	b=Y3Oe9d+ENFo3S5gv7x8UT4OegxVuikSAC4JiYST5rRXHLO/lFZGpIfeGKhg4boK1zFbQ
	 C0LBP08/6OaZsVDXfEF2OsRLmcTIod9v08XxM4/IYPbzIEPt41FYexQIcTf/VUadTtess
	 pkHylqyXP55qym3W8kn66vshpDFxQ1CpBK/YMAe2o9x6KA0bkzKCGVC9OhS+UL4g9T+Bw
	 a1WDMA0+wqRlcxW64PWc72Qe8W1h7sHPAmBHtRrwHiGavvRc9uTs63w9pyP2AU5TVLfAA
	 pX+wP5K85lvVAjXQBiP0Z62v/hka5l6uc418ODiNfyxwo45PnmEJSPPtfFFuOqrmnWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DSIXLIS7F+lGItI32y/4UqtVNKmbhUx69vlOjqjsrME=;
	b=poCtrXMR6F+0WGrruMhPJn0NswC/V0HGhWg7YudepVSd5iyVgg2aHHdNIA4P88LsNtQ0
	 vjvN5vNtM5UKzNAlAVGKRro9Ia5JBtNzgeFQN4o70NwHVaoMr0khycm8Up2mMiBRKDQyM
	 LDp0djt7gWjFRhrL/dHEfs9hg4xfT6CHNT8vrZkMSI1K0NILwtq5rld8hxz1jHE/kgqxQ
	 XE6ykpM+wY4iARc7f/EL8xfYxvpKDSrt/9pL4RFSLuoLKTMackYT+7Nf2E2cwSP4L3FMY
	 S4aXukrCAd+jismg7qwosItho8VUg8wgXuhT7PPMJbkMbodAynycivQmFkcNO6Q7XgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QQHgak1E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LK3ntneG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94FB606A32D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A94FB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QQHgak1E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LK3ntneG
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA6OK4050066
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 15:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DSIXLIS7F+lGItI32y/4UqtVNKmbhUx69vlOjqjsrME=; b=QQHgak1EHfV7hcKV
	rEK+KzG2rFJGtw8lgrMTvV93pGq5bVdOvFJuN0b2NObHskaD2YfIiPX/sFaxJRa3
	f26G5EFRqD4yrEnaUW+2HbyuYl6ZYfW4rbzXy/LVBb3xr6u1pA5z3K30Wqn8aIxB
	lmtgLyVLrk8fj8Dvx0vanz4wrHkcz2Kt4hpYCTErD698GLYZ0kbxFAyughfmyfF3
	rB8E3hRInOFqgN/wDauqdHm5ZaPOqng5ZmPYDoOIQe8eCuzRrA42C6B39zpiXVW0
	fP6B+iHgngC+tpo1/OhJkCPgKGlab2KBCqZopbZdBOFQc/P7SNvoiP/NVqSB+Rz0
	tZEq4Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy3mc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 15:42:16 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so4107321c88.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720536; x=1794325336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSIXLIS7F+lGItI32y/4UqtVNKmbhUx69vlOjqjsrME=;
        b=LK3ntneGJ0s7dLO0ekIsGVaKQ1xOvy488Uo4ZzKGljjz8NhS+odRKgobXhwM6qgj3S
         t/yT23BpL6K4TPO+aWyE0riBxRQzYC6HvU0KCNCY3Iq7e3U0Uw7iwYfw09vTm+EUzCQ4
         lG5sppeu9kvNbdARVZgx2hVpATVjfZ6mrwU1on9qkBWuGh/ANEmLSIGGbaCAYVSW3cpL
         91BApsGCLLB1JNi5mcMYcCD50/rwV6uAw9Qd02nJe186BBg3YQukJNPf2pPd8rwWyvt8
         Im9bSU8UUpVPbFfj4OGmvcbGpjRdrZ3gm+PskrAfofC0QQQkDusNNpBABkqJgZVroOck
         VZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720536; x=1794325336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSIXLIS7F+lGItI32y/4UqtVNKmbhUx69vlOjqjsrME=;
        b=Y/iKozfVL5DQi4kAgB3OOnHJOfA1e98R8Wfxw36ojd+G6F5b5NjSQQyEFEYOG/SLdm
         zk5E8xUEmQmFY4w7yjeOGdpwqS6RGSy/3n/D2Q2Br7AM7wVNVGfesL71TfDlHwnRMREm
         1IAD9lG9JPShBbO8evZBbZpynS+GZUtDY+4YQKVOwI0Utw3OMoTtvAM07M2gjk1A9LWc
         JUd7SkeG7ks6h7ucKvxwIkGKzMA6sL0ki7PYUOZXdR97cZsz8Ie90XzkOmDgAZmYbFcR
         qULXvaept/O8RiQsRJof6XMA/pLZz+ILF3QHnpuT3oLodwdj/4BUO6hSKV6XEDqSIKbs
         vwsQ==
X-Forwarded-Encrypted: i=1; AKwUvByEJNmlbnzojph0oKGMbFqRWgwtzphmTK6dIZ6HBKDNtCqZqRQVSCmQ46L2iF1YHF+gW94HTEhx77Lk@vger.kernel.org
X-Gm-Message-State: APuU4Z9E9zJsuBJHCQxYph2MOTbgq1HQnnllz9hE5US2+jYNb/6EXePJ
	NKLwPJ5HOH0BY2o3ifiwWjej1QdmQ1cRq3HJ1FGjqBL0i5WYrg8RmU4IiHQHCDgxifOC9P4uF+X
	UNNbFIc1Of5MBSv7B3WgmMPWUoJFDQz3WfDyYo1EQU9nP9h4yJWR2n4zKj7EJI8+d
X-Gm-Gg: AYBFou1PGO2olc2dpJa5Em7MSGsaSGrQUd5C+1Q9HVV1TB/B5S+gfLojx2tMMN8Hj6O
	D250MJBuLusBUziV7bYjSGmKVbQ3hXA74HBXvlct9xfhr/A3I93WYgQoeBZy1Nk1wPtaLDxxmZ2
	IsX83/bdvU9gcGiWLuh+K/ROOsY+g0Qa6tetkAz8OGmMBCFvDjSDjmvx6jwl4+66k0odWWAsKw9
	i+X+laQlmt4XwHWwvwzdB6yrLP1zF/ig7PX2zy+NxL5rm3zAcvVwIVJ3NSj6DyOJiuNCU6VQBEx
	xmleDvS0oGJ3Us5aqVMFbc+o4adkuz7uMP3ulX0j+B6idFj9vui67WxLNXHHMjkVib/37ePti2+
	gdLpTo+nle4vYTZ7sywX5RT4MC8OFXE7I6b6VvzYW75vP72N9qBNkft0ayDLalpJYeOdeTxsu/D
	bB3PQKdxXx
X-Received: by 2002:a05:701b:42cb:20b0:187:c940:21b9 with SMTP id a92af1059eb24-1ac5d6a0756mr20553927c88.30.1793720536297;
        Tue, 03 Nov 2026 07:42:16 -0800 (PST)
X-Received: by 2002:a05:701b:42cb:20b0:187:c940:21b9 with SMTP id a92af1059eb24-1ac5d6a0756mr20553880c88.30.1793720535682;
        Tue, 03 Nov 2026 07:42:15 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:42:15 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:41 +0530
Subject: [PATCH v6 10/12] arm64: dts: qcom: monaco: Add Iris context bank
 subnodes
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-10-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720463; l=3345;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=EchhzG+P+vhgD9Ucf6EZSSFNL3jqT3gWIrPVlGaIjN8=;
 b=IMU82QhdRTiCD9Kl6QWCBMvIE9N7cMC+kR6/R9E5WCI507Ja897JzWgGbVzzWfgD1btV3TP7q
 GAwDSl3LO+lApMrgJzDRaJIguNa7VPvgXxfzMZlAAE3CZ88NXQk8av6
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: HH-PsBxwW4rLCCcdCW6DgiR05_vEX5G-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX0JOOZ/IbEMMy
 F21f2dX8A6BE6XVKAv2eodIQkoUhArYgKPCCWDKd77qHjc7CruGJEKOKv1Drg3U7US/3uJ3Y7xi
 FwWIpL1rrq+dBz4zfpy+CWb1OAHYPiHFAF8QLSDv4riyba6TCd2r3Aff0Dhwq5IolaYBHjF1Q1p
 IkL8klWiXgQ4jwZpPQcILBQcojpNsOfqLXOlcsz3ef7sCxmX6qaPWbC5EZ5enONvwVi99rLwsKY
 d87yMPcAW6RHTrvGsDvCde2PcGn/kJualslY2iPLm01Sc32Zeo/T1jmyiYaZVtJ3pN/oZA1ksEr
 rMJef/THz5yE4geU/Sy7M6OoKEOkP9LPEYzXYTPGYKG+JIv9GvZOgjI5IdsOGrhDdoOFDWv2KKh
 TyjvTjnNtLCpBeAdl0y2QDHXkRJKamHOxHWXS+gCzG6t6Cv3qXMgM8ls5vKdwJVyAs18cSoR7ZR
 dtwT1TFKXQ1Cd3Gp1mg==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6aea00d8 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: HH-PsBxwW4rLCCcdCW6DgiR05_vEX5G-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX0jX+9i9XYlkK
 zFx91ZdGBnjv3Gx4jRcEi1Zy6J4PkzSBV6LuHVn/8roM9bjMpOjokm1INHmseGFFwRsu+q+E1LH
 Kw1O3oGjTRTXpr4V8wsCjjbhSsW7WyA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030062

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c652005dae9b93bbb8f6a28b48be3b..5710f7bc56bacdd49d0e1f1e076514e6e5bce1f5 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5418,12 +5418,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

