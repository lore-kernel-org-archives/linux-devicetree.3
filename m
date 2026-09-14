Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E6F322B8F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353629; cv=none; b=KrhB49eiJp0WmjVwWnACIQatlHNeYxL6QS7ArHuQ3fN6IAFxaWZjo6xZX4EkDwJGQC893JW9u6mLmd7QLDoZJbicCuE2VqcJjnA5qBzCiK03/oKO4jjB68qMN1h9ITm3EPtqPENCkTqScFUTxDV5B10KEbf2NSPdSUPFmPIwZQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353629; c=relaxed/simple;
	bh=PcLHYQWm10d9bOBJWQj+s6HnmUSKdzIhXOC5vShv3ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9DAcWZbWC/sCZxq6Bx4o+DOF/vjZE2JshpyqiBHXDh2pXLWVh0dJHpxgSDILz20v50uTfkOdlsGx9bwy1c4q4oiICN9aP99pwKvwzqcnQIf/8rzCxXzJHcbbBIzbXc91MtbBAuGyaTUJl5SwHElLKXfgf5c/2eIHC9eECIdEc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U96+lu5z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0ZbsTuw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U96+lu5z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0ZbsTuw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06Csa3717259
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Iv7ebB4XS+4
	S5TjbX5z1MBy9DOYicifnuRSlLgc0kgQ=; b=U96+lu5zkJmxuaJBWOzZHpNILfW
	WDdQjhfj2mSLXI92kXmFg+Oe4bNXtWfFFoyb4CwWuPs9Wmiv9ZbO6Kd63Uenk5VD
	o5l3KU5k7QdhrmaWffkN/V4nw1W+9xQqEHsHVLOkwanF7RSMZP2vLLYKSCzkEL/Q
	jBO+K//M/99wQ5WhmDJgS6w9+qXZNvFQMBfU2F/LwFCC86/Qg9Rrny1S5nXRQmkq
	v07WBzNOqd+XzKuSYU+fmpNPWaoqEULld9iM2G1gcKjnWFgzkvuOSJJyLUejVu8o
	qTMUbZ7MQHo/146YmGmLLO+GNfvY5ocPH+rLaV7U6tLXQHOW3lJiBVrTwmg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dmqjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:40:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dff6253so41182045ad.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 19:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789353624; x=1789958424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iv7ebB4XS+4S5TjbX5z1MBy9DOYicifnuRSlLgc0kgQ=;
        b=h0ZbsTuwxJNgMQnH26nyHLYkq/0sU6MWXe8lTLH7vBJemylMi5ZWWqo549NMoSUeQY
         9p2DbDuD8non2dDzpzTwDIu7zdqWr1ztrUhFzEQDn6k9b4AeIsIUt88elZLLSeeZDcIL
         746zVzApIg55JYvP90pnpnlk/5Qo7A7D4tG8gLBsynuXbRriViSKCUzgmHEgwhjOwQo0
         HMNBmDcOSYYH/PbBk1KwLL+Eb3kR333RLCP2keTYog1BdbXjoAlaPu29GXjTeNeBm1NK
         eyO4MnfR1ceMN2T4IyyPvztt3UlbrBE8dZOSRTCDwsxLBpYYh2HNHootLtNT8Kazoafw
         mZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789353624; x=1789958424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iv7ebB4XS+4S5TjbX5z1MBy9DOYicifnuRSlLgc0kgQ=;
        b=BF5q9+XNe6chKNip3Z20NikeULfsZUrG+6oh6gYdics4rOb9EaDMLltIAQeS5IwK80
         dRwT+8F7/fcWomI3b+ahJ/hKo5Kr1fmQ4srK3RjYAaZBLjc9v+cETZgcejphIuuXJTPv
         tiYddJ0DDZP5QtbnwIm7ZGThVHUH+kgkobZoyZFfeUxWmnaA876Shohd/CpWsSW1/k3x
         FM0GKfMplshvVYFDgd2RnDYzUY9agAag8HQ/sw2COkVSef+4A0f72cHLlal8OKL2pr00
         54DaIL7f81xDpnvkLGJ0Vw6Q35twtsFwU8PeLp2AUGH9yJqZMqGJ1WIxqwyWLdbEkSKE
         xaQw==
X-Forwarded-Encrypted: i=1; AKwUvBzdZ0HBHbUE+Pg30vIOniqs3+hk23rZB7hlxyjUYOTi87SK6JLFXf8Nl7Q68vQL/fCqJoW91Z9gpVlz@vger.kernel.org
X-Gm-Message-State: AFuF++nU1NlKapvcYSIsA9TtcBnThQvPZcxYX+cYRNkWIsoJtFeeTvrO
	mPXWUqmXt0ICdc+B6xvt/rDnq/mhxFjIgRxkRMpMAORMYBongmMziFQS6d1o/kfhPHRiqwcdtfx
	M2rTlRN1wf4WaIG8xP04q1HvXZK5Po7K5I108hzBsaKuV7b0QfUMGyrLKBICPuydw
X-Gm-Gg: AYBFou3cId8a7unNUsMUQa9vFzONCuVIU2QD1sorpRKExlu23n+EVxmUAZcErC3dChb
	Qum8CnkixPwzF7tkCe39789U/qN515SlVsdBglzWV5qyTGDglrv1iTvws74U5zID3Dqt0DOKVzE
	sg8wnxqz1g/M9vmUVi+lJ/kXfj7kXbCOnEDGiVe19vVFANRonQ4d1zGC7/Lwo6OwWqq2HrpYVNn
	MtxLRpxfVHdFkgLaS9jR/QwRrLJVihZP7/c+W/z0nzEeYOtiD8txHhFW6bg/jVIkH0OlaWmrhPc
	smipT1UwKvkkclRkKmfJATshdzDhyzAKx9QGT5q9C4xyk3wPQBlbjy05tw43f0nV2AVvHgonQbX
	++Xqt1jTlH+z1Kv2iSdJ7genBMhdTMgzz+39yIML8/hLLU76o3t71+kTILV1Z
X-Received: by 2002:a17:90b:1b01:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39dd5726af1mr5629617a91.32.1789353624067;
        Sun, 13 Sep 2026 19:40:24 -0700 (PDT)
X-Received: by 2002:a17:90b:1b01:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39dd5726af1mr5629580a91.32.1789353623649;
        Sun, 13 Sep 2026 19:40:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm25943953eec.17.2026.09.13.19.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:40:23 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] arm64: dts: qcom: nord: Add gpr node
Date: Mon, 14 Sep 2026 10:40:01 +0800
Message-ID: <20260914024003.120931-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
References: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mfyF89i-rsXVmEQ1KsAfktrpB7NLboWx
X-Proofpoint-ORIG-GUID: mfyF89i-rsXVmEQ1KsAfktrpB7NLboWx
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa75e99 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=kWXEwByHTSV9Wy5cQ7kA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX6AzIl+7AvRaf
 GYG3EwKujTzUaD+jNbZzXLY4DY8rpeVr4QPM0gUoYvSeOZeuHdCh0FJxXSSSa8/RzM7fTKl1+dQ
 kA1sdQPxhHbaYlqvOXBRCp8KRcO5YgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX0Dn5KwWO6Ans
 TxRvWLFXXr5m1DTIHRYYnhVGwT386coXJg7+QgViZv0YXUTW7JgR8n1YDyRIFBffVdkRBFPCPnX
 v2q2ZPDDoRV4HETiLTTvukQ3x54e5pyuo82UvesfPLeuBC6m4m3v5yXJijXgjEITMxAf/q/6cJd
 jElwGvDxvjwr7S2rMIX63/mR2cMck89XCSA4dd6xi7Qzn/H33kni/nblx3iSSoUUaZ4WGjJYiI0
 MUU2BHHSeb2ebnTucYhVS+5/d9blcI/2TDjjnJi+RS7JTkzkDbAA/v9EAlJMsr47ps3J5gRCGL/
 YnuNS0SmT3yIpWMxCcRQxb57CMBUcSS9qwauercFjpv6+zY2vJGUSYtLeWaBb4NZN8g/jGGEPZs
 n8oWoikSPu5uvsfSQyG+SZlqjG//d6A5aau9hxkKpZcnP11ycsw7MxsA7SLqlTNU/qDixe+6VuI
 ODt7OTEVvZ4WLrryP/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140035

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add the GPR (Generic Packet Router) node to the nord SoC DTSI along
with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
audio services. These nodes are required by the Q6APM audio stack to
route audio packets between the application processor and the DSP.

Assisted-by: LLM
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 98967478fc3a..4526b3bd608a 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 
 #include "nord-ipcc.h"
 
@@ -1723,6 +1724,41 @@ compute-cb@6 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
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
+							iommus = <&apps_smmu_0 0x09E1 0x0400>;
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
2.43.0

