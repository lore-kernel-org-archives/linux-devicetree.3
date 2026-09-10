Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11509361959
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082234; cv=none; b=Jyv9OmsJhJ8QyqFjMqrFKV70lFO9abpw36WLoe9Kq1RJQ22bXRq5Dz8icMgQeUKF7nNWOMjB/Iz7jut+BCB/g3jc/kwPzF3UQaTTpDq7c2WKIGqrl9flyFDANTXuqFhHwTWHR8tekQb+bUpvsXTC7NI0ReTVDbKfWDYRFD+36RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082234; c=relaxed/simple;
	bh=P05HO03ZYyZrW4Ag2KSYbb4FQunT5owJ/0D+IdcGUuk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i5Q3+78p4THeEQxFhjIpbcatLvEnCHAWheU4XUhSm0Sls+JtSJu9Rbwm4swyJBJHfh5bj+39Cu/tz7wCV1mcHpNhWS5hbb9h00MD5bFVfK4td8igvM5dJb+IUk41KIfeEaUOdxCbNFYWi1S+2XtBmQ1UHzCrmMN7M5b/kj2oEBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0d16HB9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tc5LnNMt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0d16HB9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tc5LnNMt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AMpFX52677606
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lhsPzx6WudA
	vXStOROuDUjr5sSipj8dOiqKgIuzxuE8=; b=o0d16HB9Bh25A8ELDWyVXNLIJNO
	E8W1CmjqoQvflP62SjH1FZTbfznJsaNLkXq3HWnktX/MtkcQNVodHoOuaplBF//Q
	GpfVmsREn/O/35/aLQwLKt27Gz4SKD0E07Fl+6xkELVtxVbNar8QZS+DSIuVgl2D
	PXrllZd9e5kWmutdVQNOr5glHN1YxfJQg3Is1j8nfssFGVCzprC/3i4V/2r33KYN
	Jf1tzN+AliOYjLNnJSgz3KfvVr+z0RSVsZ5lE1NrQVFm589QiUY65akNRsPhEc+Z
	AfW9xVH1MFBG0oNZNJ+2GESH62nowsPrQckm/t4BTuP+JcV5iF9vI6oWtqg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q402k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:17:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso513839a91.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082231; x=1789687031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhsPzx6WudAvXStOROuDUjr5sSipj8dOiqKgIuzxuE8=;
        b=Tc5LnNMtZ5qo5WrBNWpJwIVT1Db/d81siuDZ4Wd1JNimxHPKiuhIFjp0Sy9uFUgIuP
         qkDtgZEHr6NAEnlHhdKarsrN52VCl4AKPOWRhAWMJUyLo31Wwe/2cMrO0/fNsyfNEngY
         cjMSGHiynAC2IY1rSlXoee1yHD9saGJcEjEFaII0n41A0cRz9VWZzd14PAivV8jLuTAW
         bMdbyWtuYlDk/w0s/xV1X4W0EOkpegMHObVNYJyreZfOrxQqQhFKCyTEjUTw1JsqjhZY
         +Ct74owhKgLghS6BJ2WB5SGQag9pFKl0hJRWJy18pYAMcBRHXM5bezpCeQfCx5RgxKKK
         Q/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082231; x=1789687031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhsPzx6WudAvXStOROuDUjr5sSipj8dOiqKgIuzxuE8=;
        b=a8to99K//ohI0PdlxZp6KGXp+AaV6Gs8AieIpYtV155uKxpdhmw/NpVXrJ6tpS3QzY
         slp9iU9uK0nHTOF5xlRlwEQUNpbKxynAtPEgVwhAHIf5sMaLOjW6uhq0qRf2NQ9kJfV2
         C3uOhdi1gKWkLk1fL4w9jVAPL5tXUUZfHMKesT9/h8bzn6GO82iHEkJaDZqPE8mGUKlJ
         sZ+shSIBAMyQwSDkronIdQuu0S2DfuAeHcYvzZSL3yYvVXL2XYItxCK+4volddiq9eGC
         EqtVj4d/M2H4tyy1n5cdppoJfKM6EMUITQKZFIiz/kKUoc0zyDD+cFGWRwopu+q0RC1A
         WUGg==
X-Forwarded-Encrypted: i=1; AKwUvByOuUa+wKWENpmsYJaPhitHp4tXeEuTDlMaigMBm2eKCqE/Q22n3zU5ii/CIodxmksy+axCObhyo8rr@vger.kernel.org
X-Gm-Message-State: AFuF++nAYJvc7Foy6Kdg1XCswrvReCBQneZzIjlaklyU/T8Z92aOlymj
	unMoxolPA8jWLh+r7OXR5AUCUaNX7yHXWK2AwTgPoGovuQeWLAKDGNW57D5bwXEiJvocmAFt1IP
	1Ki5TOR/FmQ+bGPNLV+FbWKBFdiNCkn45r6LQNAuaqsxJJUe03JzKdRgKoEookVwD
X-Gm-Gg: AYBFou3k3yS8NWo5aPdVFlRqnb8vAltuGbThbCEbsLgtoNRbo/9qzOFhtDO7W/7JtWy
	BMdVieW0pfTiCQWEYpTZ8h9zvEMUFbQmr3QXIQalRcYnocExOFp6sk8l62K+NE3XwdZFBUGoneo
	EGEhX77byZt10vzdsy1ffK3uE59mYhuJw0ZJqyEV+0m8yGGbXIQvjkfavUcDEiKSAYEdboSgyd2
	bjNevAZxKtXpsM/GOBlXroUDtg5oExuvOCnp30zXt3mv+ZZuyxANVjc24v+iRfZAHlZGhCf0AbO
	Nt/Ej7V2TV8lcAmUiTgLUBmOAk+pbdmNmfuKlOHXnXhRQaAa6AouWlWPpwB16L2Yn4e1XpWV+aE
	PWWsZ6quOyGJ+Izg4VTq6iG2DFBGDl58T4C87
X-Received: by 2002:a17:90b:498c:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39d9bc6a1admr1752543a91.2.1789082230901;
        Thu, 10 Sep 2026 16:17:10 -0700 (PDT)
X-Received: by 2002:a17:90b:498c:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39d9bc6a1admr1752507a91.2.1789082230512;
        Thu, 10 Sep 2026 16:17:10 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:17:09 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v2 4/9] arm64: dts: qcom: shikra: Add gpr node
Date: Fri, 11 Sep 2026 04:46:37 +0530
Message-Id: <20260910231642.1794948-5-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 009VRClPNnZ217cs2m8S27sUCs07xE06
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX6CDYrzDUsAwq
 Z1tVxR1ue8N1bih5B4ar3gHirc3b2UuPd7VYl6g1OmSl8nHn/nysNzzGjsU9J1MDTnAFlgP+8R0
 h4LLv1K7QW8QTo9Fa/fSZ3WEErxZng8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX8JZ2dDtpmidD
 z/5m1neeAhZZo88jt2zRvEImEAn9sYSNI28pVrqF3q/m4zVeS5pyNzV/DLi7rdHVpXOKs9Do15b
 xfhZZtedu7E6gRHgLet6ytvMIfm3kzupi+cfBt0HWbamQQO8wFXXiu6Rndq5SDwn+xmbUoARbzI
 gDUvadjMECh/V0rudghXnq1Nrlrj5cPVCWbBiQstw/7eq7Qul8Mt9IPLvfNWGZAlY2NNkIoTvDn
 bWx2OKem9p/ger0UY0M5jixMzSrMN0Jubj00dW6lIOyvAursqwCD28wgQdV/sg5/ju5VFXhKt/T
 CUjddwbC9Dvu0otF+WuaPQxk5kc5h0U6iDPVLCm8puup0HOctYO5otA/VKKqt2VaKV0LExmSJ3/
 6lNFzwTNNU6o5RL3dHUCfVQRCKJUadMRHQWlHsJylw4RMVeHUaBfATIRdbxAllpMSyNHzzldNMi
 NpvDWb+kqjxHlnSYQqw==
X-Proofpoint-ORIG-GUID: 009VRClPNnZ217cs2m8S27sUCs07xE06
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa33a77 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=T3D8ljLgrI678HBggIwA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100293

Add GPR (Generic Packet Router) node along with APM (Audio Process
Manager) and PRM (Proxy Resource Manager) audio services.

Add a dedicated MDSP carveout memory region for audio usecases on
Shikra and mark both existing audio heap and MDSP carveout regions
as shared DMA pools.

Update the Q6 APM DAI node to reference multiple memory regions,
where index 0 is used for control path buffers and index 1 is used
for MDSP data path buffers. This separation ensures proper memory
allocation and access for APM communication between APSS and MDSP.

Also add shared-dma-pool compatibility to the existing audio heap
region to align with upstream DMA pool usage.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 49 +++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 52b71790becb..5ebc40b428af 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -15,6 +16,7 @@
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -475,7 +477,14 @@ smem_mem: smem@86000000 {
 		};
 
 		audio_heap_mem: audio-heap@86200000 {
-			reg = <0x0 0x86200000 0x0 0x100000>;
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86200000 0x0 0x40000>;
+			no-map;
+		};
+
+		audio_mdsp_carveout_mem: audio-mdsp-carveout@86240000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86240000 0x0 0x100000>;
 			no-map;
 		};
 
@@ -2016,6 +2025,44 @@ glink-edge {
 				mboxes = <&apcs_glb 12>;
 				qcom,remote-pid = <1>;
 				label = "mpss";
+
+				gpr: gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "modem_apps";
+					qcom,domain = <GPR_DOMAIN_ID_MODEM>;
+					qcom,intents = <200 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							memory-region = <&audio_heap_mem
+									 &audio_mdsp_carveout_mem>;
+							qcom,vmid = <QCOM_SCM_VMID_LPASS
+								     QCOM_SCM_VMID_MSS_MSA>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 
-- 
2.34.1

