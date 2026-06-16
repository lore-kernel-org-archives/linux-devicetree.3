Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C63386C05
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640903; cv=none; b=CTLtRE1E3zWWptfCMFqDJA0xfnsozRbvBk6QY3V7Zo2cQ40d59JQeYi3eUsARu68BYRAsPo+jBMcW6pnwROBIv6jfa0lJlw3anuk5N3lRE5L5CZYEvSTDnpHcPYBM+ZbvwDxb1qwlEDBMadFarLCkyQ9uyi8zzHl9XltxxfPZjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640903; c=relaxed/simple;
	bh=mPmaD4IFVUIu+HVzzg//Q2MgUjywNjd818HGA2EhJos=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GZeANMW5CvJUOQ/rw6gJMK7cKH6Sio4hzNOw8KUX7BGCTPIH3DsfLqoTDU96XT2vQZKUq0Ekw8WlE++FpsO5zhKzpBknSHBZCJgFh8coSp6SxV/HfEE9FzlDcdbrCdY0/eAeEtawzgfX+zKw9ai/2D0cCVekKO4/YDXdCLwL9MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zv+IAM/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJuUCJhE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zv+IAM/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJuUCJhE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOO9e3965404
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tZzr6OI7+ha
	3hWJUlCjNXNQakVSOBK5Fqdvx7xYfU+A=; b=Zv+IAM/7C2t0SXWNeQL3375XUbb
	gZAOeK5Y6GrwpBz0fXjLt52AK2JhUbhU/P4FLb8KlYt8QxHs6keOxeZFPWBbiQzb
	LhrwzoMQLNz032jeIcD9qXKsOHh9SdmE2rz3aocal4lY9q4q/yMgdhdu54HYosVk
	I/egw8NdgKl+82sJ6E/UhYY3I0+pOMMOjp3xrFopOcS/m6d5tN8yu41TS3Qx9vxN
	ggsvjNhTNcm5CRGbh15mFqP/+IB++j6gktSofX+O5ywTo3LOI6beEH/uU/2zMEqr
	tX3UN4+o0YjrOZFteVadn8Y5gdNfyajqnz1tazd/apmKjcCEGIp+h4KPP9g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8kcmj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:15:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37c649e84a1so697310a91.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640901; x=1782245701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZzr6OI7+ha3hWJUlCjNXNQakVSOBK5Fqdvx7xYfU+A=;
        b=FJuUCJhEhHy4+XjCwGgwgYV4AaZQ/rxl0VRKHw3yzAQx17nyKMWpOjdHVfJpK4rrhA
         Rt7jqkwZBm36tapbpjnfJMTHl2bn0lDtRP4BYSUEnxckno2lMpLLBMcv9k0e9GXzH185
         Glh4t79C3IrDTGDAZhiuUiHOMUiLdwOAfajpaze8Iwml7ZJkFmK+kTVVehyZ9ImtLgSS
         LrvKpChB7G7tN3wHMVef1/5zs2pzE2Ebe78759wJnkF8BL97BGUIDOIVsn7YaYisnJQo
         juQen7b2XKEAmnXxAYJ44beXta+Mq5Q/BSWWTxi7YhZJ+sbH9HMxKBahftUO91lIwV1O
         5g2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640901; x=1782245701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tZzr6OI7+ha3hWJUlCjNXNQakVSOBK5Fqdvx7xYfU+A=;
        b=AYRxlZcp1NwlU2dQ6R5aUuKtONMx/I4EV4H2zZ7Q4gRS6yODNzn/L6gaI+zeRo9ol4
         YgEmSdORp4P7eaeXDfBe9/BHcUpkTJbmsZyELP7/Ir03n64Kg5+4jlHB5h8Z9xEXVp1E
         FjFXXmcHyb8pdLSp7gep3noodYl4GEygEcrgwLflOpH35USfqOqs1fo4uIxk63cxIEqx
         dxebOGuFA35OChDqSwgAHAS3xneOyHxjEx0g+5FcgZL68of7ktIOcLRomeJQDYkgEU6G
         G3cjnOroedCjtipLazKhR99m+JpdK5dSt6LSPV11rq4IMmO/3ZGG3wmTSAMKIJyoszsE
         gUWw==
X-Forwarded-Encrypted: i=1; AFNElJ/JSucJmEdekEPVZpM7XbpnMqGw7loWr6N0g5289aaeH3j6pZt11a8GCsQtSVouDU0vjRsBRhWUIb1e@vger.kernel.org
X-Gm-Message-State: AOJu0YwzHoD6QT1gv/Y0TknyxzhoSNVnQySdDWUlon9Qmd06l9JJAKZr
	qpffyp2icHlluazReUPC+3MdtbaqRGw8ph60D9G7pcgVjSQJyW5KvEuaFlw3CSYzk3ejcTm87zQ
	ycoQ9DKsxpBkX2juyqz7KnIBZbt+yvF+bPXezGbaIqo8Zro06WOIkblAGigYDUFYM
X-Gm-Gg: AfdE7cmiSyTUG3cYFuH2pgttYn08ecWeX+wDhqzdNc7PHUkvgHwc/acVtsxbYYlDyW0
	jEB12uHv4OIdV08klo+sy4MK95/lrrw/6eFeLjBTjykkbJj1AuPfZM2CvKsU3QGLfFBcFxg0Hl3
	yIZqBCOMTS0e0VLhIMws1m7ocCCPmGRgpLvL0xC0zmWnMCE5xso4WgZkOGLjNvxUU0cteNAewdM
	/PlOgLHJwcr3x0om9SuzVRTdW4xGWM0EshE8CRc/wV0TpB1T2aQa5UeiYx3tWMqFB+aUq6LIwkV
	n+nuEUKxKpKr0ak40EMlEpZq55Q0jbzn/uMnMpHkesBMiRGttY62AaQpOyWP4Ewsu2F0Cai+yCN
	cb+KHG1HgSaKhm/itcVpNv5CBMir91wZNQSpGB9A1hwQlpC+N4C96BXtwGw==
X-Received: by 2002:a17:903:2441:b0:2c6:a45a:4f7d with SMTP id d9443c01a7336-2c6bc2521damr4623135ad.29.1781640901328;
        Tue, 16 Jun 2026 13:15:01 -0700 (PDT)
X-Received: by 2002:a17:903:2441:b0:2c6:a45a:4f7d with SMTP id d9443c01a7336-2c6bc2521damr4622895ad.29.1781640900899;
        Tue, 16 Jun 2026 13:15:00 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:15:00 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pratyush Meduri <mpratyus@qti.qualcomm.com>
Subject: [PATCH v1 3/8] arm64: dts: qcom: shikra: Add gpr node
Date: Wed, 17 Jun 2026 01:43:10 +0530
Message-Id: <20260616201315.2565115-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX9sKf2I6ZlKGw
 i5FesD+yNGFnjjZCMc4WunuY/kSr+hS7DYJ57bxWlmzBtw5+e2mlsG5fo5ciqgae88J1OdrnNd8
 Gqd8/nQ9O3oP2ipcvt3a6q65j8eToIURVfFGz1aV7dbSfAbllsc8ORVHUlLNP9FP8Ss5docp7vZ
 YaGO6zwdQLT0HMqND9xo2qH4DM0XtwLIlcjdExGUkKlvvAJX1BYL27XrwdFesbxQdNb7uRwI+Eg
 NCNfscAAPOs+aJ95xsSH6uWgtSA7vqwmr83cfBwaBYmsyheEZcBeBxA0nMdPZ6DBC4qgBaZH44N
 +QEayWiRYVevI+ladAzdgZn/bmoomck0TnLVg4Duseijk3ZQ+92RU94aznQMjpvBatHcgwnCTq9
 C9Mif/2UO2Bs6q6DDvywimk9dgBtlxb4AzwqFo8lJ9g/aFcl9mffApu+3VIH7HybvkMXhvfZmII
 AMg4e9FeO95ZQDTrVzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfXzSaL4KNzGafO
 +LjlYWGhSd/HlSDgJrytjWi4M281ATmt+ZeFpMPL+tOrPpRy49Z8qvHUnm7m4YnszTaWX4QZ6Lf
 zjIU9wLHak+PqaxLc6GPAjTzLUh1B7c=
X-Proofpoint-ORIG-GUID: 9gW8cH8K5d5rngmWwMy6JW-d1xiQLkdZ
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a31aec6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=SuvoWwvw_XIP34NGM4IA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 9gW8cH8K5d5rngmWwMy6JW-d1xiQLkdZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Co-developed-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Signed-off-by: Pratyush Meduri <mpratyus@qti.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e58c87fc8cb0..3df09cfd17a4 100644
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
@@ -15,6 +16,8 @@
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -1851,6 +1854,42 @@ glink-edge {
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

