Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B14338239F
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 06:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850393; cv=none; b=pkO9ZnWkfY5tsp/YxRerDWCIwkAlLYSbgHXjfD9x7SvAdCucaVYyaA/15ZnOMTuepVY4e0+4YmJ1nZrbHsC+Qn4r4I5zUiThdN0rZEcCmVhBqkEWwMWtXd7gRJFPOjkwxPIWeMOrLx5xpufBGijXW1juzFgyy+IYMIP3QDCuvQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850393; c=relaxed/simple;
	bh=/rHP3l7Gq28erKII9JbPiB+PWMjwfT4NtvvwFQeB180=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fJOIIGrSPuYx1JqFrgyJK4xkqlOfw2VjNW8Pxxv5QpJTLYjYwBV23R31Qi3cWjIX5pcvbAIJOXEayA1K7GdsF4Qjn1mKbxstEmX3iWXceE3CTfy6m1BMB46LW63j+sz6w3nOFiDwY1lbg5bVfuQyOOdlSQuleUPztcd7xUotjkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMUcJJ9U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JXjeU9g3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GMUcJJ9U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JXjeU9g3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M4bj2363336
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 06:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8u90eAf+GOGer9u+qAuP5b
	dr9jQFbofFPJyNttu8OIQ=; b=GMUcJJ9Usd5QgC8dmVdXyWj9vS/e9WBHaHvlHf
	mzui1t67GnqdeFrtCnBWeLdKoSiSjNtTbpujp/Ynqp5gcV0YC4vUdJe4WRfxGxvW
	ztrclTYprFN3WYrUDePpsb2fCaEOQCEJkBBlObzfpj8MAMSnF5QaBMvjQ6yYOKPI
	27MlXbNtS4OML3Gj37TeR3wcJTwIPIH/pA/ivT9rAC9qjZrIXPK81B9plVsn32fh
	mgalwnPQLqfxUl8oC6zo5uA02hLd46QsTTdUjemvjoVbXJ35Aavn5TcEZH9N+Knh
	RveDyKgid2btGIx9Uid5ZHDhB3AdRlui0r67bkaiObHkrnvQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjagugnn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:53:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d292eac1so8910179a91.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 23:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788850390; x=1789455190; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8u90eAf+GOGer9u+qAuP5bdr9jQFbofFPJyNttu8OIQ=;
        b=JXjeU9g3g2hhf0umgwE3ZyB3HRLqHV9pw+RxOD6H9a2SZp9dlgWgjiLU3A4z54XjJM
         F8V5quwBfnxkxXhxrNzjBcM/cN2aaHasgrmsBbET8B3Lo5ruFIvGaSMnpKU/C76KUVy/
         8fhz34jk19tgXX3GRrctd5odVpPD6ZX1bpyzqXC/MEhnIZq5lEnQi6IjZc/0q96anh2d
         //q0X8EiLfwCnt0ezoCUK2PbCn4wSD+7mC3va4fA0P++kd7cH4nAYlEgNnqmwwWMRAq1
         pCAU1qBkLJvj2YBJcPXhtWh69tpFxtA5dmnKJ2Bh5OZ+LPRa55jsCIFXL8WxpPuZGJdL
         vR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788850390; x=1789455190;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8u90eAf+GOGer9u+qAuP5bdr9jQFbofFPJyNttu8OIQ=;
        b=amwiI0WfdInMGFnOcCy4xztHknUXjd1mX9xY5JZbguvSOJ/dKUVoYXKFoaJrd+c30w
         QUXFnfkwa6Zg9+wD+FeYSEYOl/zfcaNG9KW+KQLqTCu+6CQ5kMYwyASEkBipKGzWyD+u
         +EL4+uZPVg4/1Ob9ZFEakSUuOlxC0WHbBC1NrFXI39HoTS0Ny2nDMHGZpUqWPP2UbUWJ
         xie4zKYYO0A+BUicI7skKUzoNyv+uMdsqlzsnNCHOdOIpY9AtkO/EoWiHG4Mu21plxtc
         7Tsm3fyRozlZnx4nfu8RHpUtbrXp6hDga/rU02sNLxFtf/C00+dctS7A6BgOicNgS+kx
         sCXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMGfGukNFXD4evG8mHhTFRF7Y+0BHr6PJMDrW5rQwE21kiFAXNW7iibKzgGB2PoG0g/tAwO0rsDyuU@vger.kernel.org
X-Gm-Message-State: AFuF++lZbXAK+DcoZhqUavhKDFzPkE+3Bkz5i6hTIPHbXODUG6RCp4LY
	pH4XdLMxiyY3Eqm96fyZeoeCRacsYcWbw0bnjGoEo6uqPv9rx887vhnAgXx929xX6Ex3X2mIzo5
	mz7P/Xr5bceCSMc3tL98K0t4GirNhD/nAKDUooaKZSGg3iZODl+HIlVWUhdVEBnC7
X-Gm-Gg: AYBFou1+VYPQKQH4Vs6SMKBnlhJaW2vzckDbPkQth8i/iWIoeYiKdlwPu8KSiQjPd8o
	oEJeg1jddFgc2xYjIVy6kUVozSPRAbXmFLLmVbJ/KP7oIFPWSKiAlFKXlPzVJtmWzBRb8hmmaVv
	M4vLvzJa3bKRutS/AGZgwVo5WEmyTJxmsekHl0wb4cvc5ojczAMUKnIdNDEuhuO9yHKbdtUk5BR
	+1ml5lWrKx96kWgynwv13DBSCMwiguqTGCUA7LnL8gPPanrR9UmxSVxI81kustPMfNYcU4WmptJ
	S05WehyZT5BtcgOAqZQ9UMvpsMU2sNeUNZY9r9I5idY9H3JK+wqX450HeiqIrXL2oTSoeFff6oZ
	K+pXRkKC7JM6lYHwOLJ4e9HtZkzfB4dUzRg==
X-Received: by 2002:a17:90b:2ecd:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39b2609f306mr46201442a91.3.1788850389941;
        Mon, 07 Sep 2026 23:53:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2ecd:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39b2609f306mr46201376a91.3.1788850389427;
        Mon, 07 Sep 2026 23:53:09 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm28231417c88.6.2026.09.07.23.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:53:08 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 12:23:01 +0530
Subject: [PATCH v4] arm64: dts: qcom: agatti: Add memory-region for audio
 PD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-agatti-audio-v4-1-b3db91d3fdec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMywn2oC/3XMQQ6DIBCF4as0rItBEJCueo+mCxioklRpRU0b4
 92Lroypm0n+Sd43oeg67yK6nCbUudFHH9oUxfmEoNZt5bC3qRElVJCSCKwr3fce68H6gBmXBqw
 stFOA0uTVuYf/rNztnrr2sQ/dd9XHfPkeQGOOcwxWSCEAFIC5hhiz96CfEJomSwct3ki3htwZN
 BlMcWVybUrC1YHBNgYlO4Mlo5CMSaKkc5z9MeZ5/gESEZORNwEAAA==
X-Change-ID: 20260806-agatti-audio-357bcd74ae9c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788850384; l=2319;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=/rHP3l7Gq28erKII9JbPiB+PWMjwfT4NtvvwFQeB180=;
 b=yLmZzC3rXbMx6rEvh8K9U8LuTyZG1JpSu11wy4TufoCp9al/pHtMCf2nz1mXK5OD65iJk3/dW
 Q/0VmPiVMIzB32zRbms0v/sUMdWgScxjJ97keeJydGmmp/dRBzeeB9p
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6a9fb0d6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tc8gWtmjloUqR9SNod4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 5DvfssWMahhtuJlDfflMsllmQDnK74By
X-Proofpoint-ORIG-GUID: 5DvfssWMahhtuJlDfflMsllmQDnK74By
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MCBTYWx0ZWRfX/j9OM39sPzZT
 THM67o6yU2l6OJikWTm80PEzfwlzDSMY4Q/yVLctrsS4AgevM92VBLZuPsCoJIjPVJPRWUPkaer
 ARJskUuarGWdk+JTh88IsF9A3q0Y61Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MCBTYWx0ZWRfX0Q8kpvklgZ42
 1I6L+xJxeh0K5aeb5ra6MvxX0tkiVW2tjYp999IN/rWsBLr8ya3FHGbmPRz2Sx0tlKeBRfK6Cmn
 u+hF7pvHTcjVmYoQUmCgxw1gij7Qjk0nZDaUfJ7T8kCJYsqhRHXFQlbD3QmsJMEi8TINT4cDlIi
 ett3G57Vx4UGit64vJsgjwZx0tyty1J3Ww/GvuG8bKMBK4lAyqEiA9zfUwAvFe9YvzE63YMWr1E
 bzUQi6M8sEg3e6k8alPj7UdFRazlWH/VMbmylKqAR35EUHqbcMtM6A82QjgTvuamJzRZ4xZ61a/
 uy16inQpfAz5NL0r61g6u75TB/IDgJZB3vcWXMdBJfkQi+TcDw1QNV2+RGSMRVTv4LfA7eQtKEM
 gPXeB6C2n6IgrY1mRWV7EkpxWh/Wr5f77Fn3MWf6Jt+geg67Q4rxjN8Vjp7ogNWSpHXZl+72Clx
 Miz9lweMjr413j1fXHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080070

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Fixes: 851d5ae6003b ("arm64: dts: qcom: agatti: enable FastRPC on the ADSP")
Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
Changes in v4:
- Added a Fixes tag.
- Link to v3: https://lore.kernel.org/r/20260820-agatti-audio-v3-1-47337097ee53@oss.qualcomm.com

Changes in v3:
- Changed alloc-ranges to <0x0 0x0 0x1 0x0> to cover the full 32-bit address space.
- Collected Reviewed-by/Tested-by tags.
- Link to v2: https://lore.kernel.org/r/20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com

Changes in v2:
- Fixed VMID list alignment.
- Link to v1: https://lore.kernel.org/r/20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index e7fed60a59d9..8d557010d3c0 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -381,6 +381,14 @@ rmtfs_mem: memory@89b01000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_NAV>;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x1 0x0>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -2346,6 +2354,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 
 					qcom,non-secure-domain;
 

---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260806-agatti-audio-357bcd74ae9c

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

