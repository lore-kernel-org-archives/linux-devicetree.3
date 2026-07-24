Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEA73B3898
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881557; cv=none; b=S6LCd1jnfNK/2ZhpCdf+STUaU3wdbtdIJPJTuSjmOCLQ4Yg6CVorTKvNWIWEnz78UxbbioE3LTEC3pZdvCsSoJ3MPorkmrDAJ9UH3XAUlDuQfS7qMpyrMryPtfi/eAbpyqHyA6KAns4H9RP1sWxL41VHvaDDqi0717guauncoio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881557; c=relaxed/simple;
	bh=1m500fRumD32ZLWo4rq3yIxs0zaVHUCUm/QS8mXffpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BCr7EKFo6BNFJgKut8LWm4P4hwZ5RDDaJjYWZsHoS+kF7KgMXlYl/qa9ZUcR1HIJ0OG0FsWMQcTJsEhSy+xFOIGfEXGcSXsCsdWDWZyD+6tCiiM6FLF9M+H1hUEVEkcZ6eSf3MPH9eq0cmKBK7Gbt/k8YL9hRKezyO42kji/xjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X32gxzEr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sv/M8yFE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X32gxzEr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sv/M8yFE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lDWC2275942
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=K6IFkSV7Z6Uia04rm4ayPo
	pclzg4s2NFZLmdT2YIFZo=; b=X32gxzEre2j4yg371X3k+D9R1BHlGrcv/WooAD
	mg3fwjQa66OxFJyyRAt4wSf56mpPO9xZq6JCUVMookRBVPgYVP6Hx2BeSbzx8Mw9
	Lt5+8pBSjBcrYJuerqHOVZb6FQuK5XitK8gu8gTZYSqM1cnzG4J1J/QPHrzvcBwm
	hvGFT3RTdRO6kyqEuF3DaXljkpJxz8bMFw3heziaa9d+NDoS6o2jwdrQ304m5UG7
	MJ6cOp6EnQE3bEMlEhI71nSquppH++nRNDUij7Telmq5UnnAjNLQy6ZnU90oy6BK
	6guC/5ygX/fIY+Zxtj/0odJEUpsIpxVmKID30llLw0gb7acQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0atu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:25:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283fa0656dso26419101cf.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 01:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784881555; x=1785486355; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K6IFkSV7Z6Uia04rm4ayPopclzg4s2NFZLmdT2YIFZo=;
        b=Sv/M8yFEUb9FOfjUoD699WdtwdDZQGWG5Mj9HMqRMKeh+LuxdK7hY3797p5NtmtVUt
         xFz9yXEo2YckRPWFP2IZ8pVOebUuKWO+tDBS3iDY5f/6qyUQ7qZObMrOwDFsJYjQkZIK
         lK7qUv+LbXGS4dDeiTgyx5nD5gG6+JAEgosByHC80nL7NwT03IrUmUzdgvwC1OO86uXG
         HMekJncaVJtC0CYY7CqVrROEIPJ+Tcy5tZ2su9dNvD943uo6PpbPwH9MJLDXTqiA34S0
         G+kq2wYWeUY4FwHmuUIywmN6cnFs1bN4W/blYd1gCPqr/5WQj+olHE7+Zv2261ILvAhk
         wgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784881555; x=1785486355;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K6IFkSV7Z6Uia04rm4ayPopclzg4s2NFZLmdT2YIFZo=;
        b=VgQVE/Bpqt6uEg2MkM2OCnAxvRmxvT/mLmouZzSEDBHcHaRYhUWJ8GGmRPN5M4Xxtm
         E+MX4oxJTvwEj62dbFmt1jL0XlqZZRpFOV6HWrtvW2YvQBg9l06jHPALSi04OUdyOc9J
         gwkKo2unt4NeJzuETignKbLbnHynhZjXO/qcpuG4rUuJFMg2TPwMWCB74Nqe2dnySlcB
         PF3mIeZRVa7JD0IuZB8Ols7vab4+LyIPO3YoHLx+pVqM//hhfOuT5CVvs9/BXlywmfhn
         VzjVKotdVAt+yPq1GKBLBnDefDyFCL9E5uMeDoJs5Uzq2jJMW4JC2P+meorGvf1Q3IPt
         VnAw==
X-Forwarded-Encrypted: i=1; AHgh+RrxKmBtXoOv4/uc+qdKrAk2wDI3Ps/sCu1M/g1CiQgVxkoJpE6+5jFlwNxI3+2OwINC1WVazFKeIAV4@vger.kernel.org
X-Gm-Message-State: AOJu0YxdhIpai/GANUn0Ja13fNNwDQOelL6BgXbVlWrHQcqY3WKWyVJ2
	Je1UV7JrA6HEe15D2QwDUMB4CtWVGsea+7cK8U60mnTFnbogZ7BBEBL6BKwM6o3khNypw6M6U2i
	Mno8Hwob/BRVWsebPhHMaph38gWchw+ifMnG74th7frSRZot4M4K5KZW6LwkQsEjB
X-Gm-Gg: AR+sD13e17vdFpDDjzTAswEse7OzH7lxUmon7jvm2iVtWhpLeLOwsu7xIypSZupLMQC
	s43keahEjGDWTexIEVlmtyDmj08EuOoMSzCwLoYV/FeXPUPnRxwdxbN0UEHYUSUwUd9btNoPyT4
	ekWpnXlhBaGde5WE+Ki8VoEKhx8EcPqgaL3Pxx2PM7yPWKpUsj+eMTV/HlzbfpWwo8KEU5s423b
	lgSZY6oOxQvpFVLeSGE8Y49naImVHgQnJ16nW7PxL5YfGzmH65A5p2YC6aYn8KBTxCqDz2ez/bU
	2C6qyKvhegNkEPVwZAbEg3DxFtJilMuiBLDip0LDwFN0NT7KtAyf95wHm39S+oBUfK1lUMvVG6T
	q7c12L2fB
X-Received: by 2002:a05:622a:191c:b0:51c:7aa7:e0f0 with SMTP id d75a77b69052e-5283ee718d1mr52114981cf.43.1784881554764;
        Fri, 24 Jul 2026 01:25:54 -0700 (PDT)
X-Received: by 2002:a05:622a:191c:b0:51c:7aa7:e0f0 with SMTP id d75a77b69052e-5283ee718d1mr52114781cf.43.1784881554178;
        Fri, 24 Jul 2026 01:25:54 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfc2ff2sm32346835e9.4.2026.07.24.01.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:25:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 11:25:45 +0300
Subject: [PATCH v3] arm64: dts: qcom: eliza: Describe the ADSP GPR node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-dts-qcom-eliza-add-gpr-v3-1-2595beb0cdec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIghY2oC/4WNyw6CMBBFf4V07RCmxRJc+R/GRW0HqOFli8RH+
 Hdb3LjQuJnkJHfOeTJPzpJnu+TJHM3W26EPIDYJ043qawJrAjOecZkVGYKZPFz00AG19qFAGQP
 16KAqCsyNKEsSgoXn0VFlb6v4cHyzv57OpKdoi4vG+mlw97U8Y9z9jcwICKXWhJJjaXS+H7xPL
 1fVhm2XhsNia+YfNpQ/bTzaZC71tqjUFsUX27IsLwIgpIQjAQAA
X-Change-ID: 20260701-dts-qcom-eliza-add-gpr-f7714d399e33
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2515;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1m500fRumD32ZLWo4rq3yIxs0zaVHUCUm/QS8mXffpo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYyGK1aP33ftsDR0WDJ/Dk4Rgmgdzcqnn9JaKE
 QoKBzc4KmyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamMhigAKCRAbX0TJAJUV
 VuP0D/0bvgXMvHzfbuvtjfTIv0ZLdKh/9DnBxit0i74f5U1IsE4ga4GXXbHKPc+Qb1pZ58w3VCs
 UDdrBIBMQJ/9oWeK7NYRXnWvPHT0u5ujyQ9h8703sfXv4K7DgWNkpuDyrse0as2QteQmAqYeQLG
 723ZK0X9a2Y5Nb5npuisd/vaXGWTJReWqMwaAQUYGYYozjQgxdWbxvv+gRqS9grAQrmw+M+HzK9
 GDeSZGU9i7zRXMUafNJZH7mTS9Y7Ju3wVnsDvu9PhQb7QWvH/QI7RXkeDiB1zthIPTCfyzwT62K
 kKlDMOfpEIGQ6mU2exy21A8kRAez/DPr/tirzGNfgrpR/WzJDcibZe4TYvclTA0X5/OfQhCbloL
 QkOSvNq5wv3MYTjUW2OOOekR7jrkm7xg7+i4QR6sHHHcUMrOWhlO50nCUEWU7YFiFZhqt4lbckW
 jWpt7Es9wesuj4WcR0K6GnQE0HEO+oASWrGd5PO2O8ohCzCbVdWTT4t017aEghCFvO6HB6Trb7d
 JyTFiQNVHpApIuvMmsSmQ4+bYDloTyDlDE3B8ZSKp/iAZFw5oR/IS/ACe+xwUxELAwDJ7pSYj7S
 QtRJlfdTZFmOvjPs4r/iq5pws9qALqD8pmhVXD4xFK+zww/vGUVYfZhE4AAy9CvJa48dw+xssM0
 OdtFxs3WCYo/gWg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: -CE-CKdtK9qlIhWxFzhmK5NxQIs8OH3z
X-Proofpoint-GUID: -CE-CKdtK9qlIhWxFzhmK5NxQIs8OH3z
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a632193 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_mnWyosmxP3KJ6nlELcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3NSBTYWx0ZWRfX/hI3ZxX1Ibrs
 h+lhn5FHIcixhwQhuV7/1+HZKRVIdJRSWnz6c8hGhQz85AeKBrN+j5C5JoQlAffB6Gp+243RrVR
 34bEb0YjZWiNq5dIZSOar2SqWCAdnqOcEfQ2gF2vaf4mKtNkUJAuCAMs5dFXIdz0RH/XlhvXMSV
 Wda3cXhnMDHj46fSFjuMxMwqkyukPQpDjZCrAsP4OiIByTnmInlD2VikloeTSCj4dd2LR/LJCXG
 XtHXKV8z/fo/I4gfF8WRQwgJdwZPFk5/2HiUWmJ7i/+mwwxgWkaC6CLlBVIZ5XoZTa9pp0vy8Us
 786iWxXoxXtwQRoMYKh0w1uHCaNJO1+56SD8ZwXZULS/8tE+NATfa1doxin2prVpe7OtuLRPVDi
 +FGtff12HgZWgNirlsSZTSh/k616NT6KxvinAHQd9be5gR/11lXWXdSDrRh2vTCqjDk9x8j9WQO
 9Jqh0jBTbnX4AICcRLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3NSBTYWx0ZWRfX6PNpiWQLOop3
 /I5jZdiixg8JMgB1D50VIXK1R4YicfZlbdZwXvRaEzBDct4Swtw+niTuk0sdjgiN481kGbPPPWW
 ttKCfG+qn2nWAnjLZxmN6/z7vccQkCs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240075

Describe the ADSP Generic Packet Router (GPR) devicetree node as
part of audio subsystem on Qualcomm Eliza SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Rebased on next-20260723.
- Link to v2: https://patch.msgid.link/20260716-dts-qcom-eliza-add-gpr-v2-1-9646c57fa513@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260715.
- Picked up Konrad's R-b tag.
- Link to v1: https://patch.msgid.link/20260701-dts-qcom-eliza-add-gpr-v1-1-9cce16219dc4@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..fa6a22f2da6a 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -2012,6 +2013,46 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "lpass";
 				qcom,remote-pid = <2>;
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
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1001 0x80>,
+								 <&apps_smmu 0x1061 0x0>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 

---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260701-dts-qcom-eliza-add-gpr-f7714d399e33

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

