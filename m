Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370833;
	b=ZnPx2iQ1eZ1Tkp+wLr818vydmVEfXNi+DCT/69kLLbGtQf/sSKda+eUQ2jTlQozFVjXs
	 Z04rXDBInzyhA1YMIrAOK/MfM0VhlpaCt8XHcrXHN5QoWgO4GOSV/BOdfItIr2YTLvVBh
	 8ttQJzgneblpE+HIVsX6VQMkQfIqf6LQ3u8affJpxUHZR5WuAhB8e/dRJ4o6uiNpIaN+o
	 0WIhQWQhrN30du7+pGR2/MjEyuNIb+cJ5Cccuu6L/mQgMMIwyp0e5/dCqij0ZVn5mTxDu
	 mYmdrYWrp4jIeQUOXhsZZES4kOpR/UY6ZfkOiqfe7BKj1W9+ZDXjEoukUaZ+4f/Adtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J+IfYqOjYnJDuJJ00zeCIQKxMby4VMAaf9unQyQXMNw=;
	b=WZvaf3m7PG0RT8XvAyD7oHkLsHwp9eqhAGUr7/1Z6X9lZ30fJ2fukTDLo4WvyW0UXzra
	 ooBB+ET7LgViK7J17d2zqqElV6gQHGdy6XUQ3AckF+JbZw4KBMAUrHB7ZctimKI18k1jv
	 QSvWePE8WwWC7iekEeZb3Lh1Cfv+dcgV8HrYI5UExRYw6sRYgPky12Ez8U1QaFzdTSvjD
	 CP4MzYmUMvVJiuxlS2bkPxjIZZzmlUDvOKwQmCHRwvIdw17qfn0tKqvKJlt/Yul1yo0Id
	 JQA1ryPgxh7AYQf8UF7RwD0Zrb0GP12aIg2n4exOa83Q2DdCWeCUyJvMPrkyCJobaIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nd2PjI1Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VqpwpOT0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834C3606A327
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 834C3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nd2PjI1Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VqpwpOT0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1t04a897803
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J+IfYqOjYnJ
	DuJJ00zeCIQKxMby4VMAaf9unQyQXMNw=; b=Nd2PjI1Z6DfPdvm150Gisgj+3In
	S2g+QTiesVvrhHAUr43tJO5Sa7NaTbIsgkk2jCzWaDDm0/IGRB+iEVjP657wtPTs
	XOXqB7fvplaCBc5BPhIk7x1dX+EzwFx1VfrjUXreYKixz2b4PcnPW9PvDZcIvAHU
	1qXXh0j8VfLUXhgcX1mVmvodKVBxodocFCvw+b88FMtNM4A7Wr2EB6tnl3z6wsQo
	IdK9B/E242EMRWonyvRtf+LycmHrFadOIGS8mQy8JZris0ifP/JcGUea3qTgD4i2
	ElOD0pDBZE9LXEL/MKM+Y9hQMauQaHhB/NuQs83PT3ZyEBFJ8prvPV/0ewg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufv8nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:20:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso414028eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 20:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794370831; x=1794975631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+IfYqOjYnJDuJJ00zeCIQKxMby4VMAaf9unQyQXMNw=;
        b=VqpwpOT0OUvmiwAgnCMSALVR4RsGJMlTlckCMZfkq29GElVKEo41eLT+jEBlu337fs
         O6yep/3K9KColMktdjKopsPjl46CGXGkBGOTzgtY5m/GurotIyyWljv+HnaIlPv5SwO6
         l9y3YxHBD9JsMr4scF54zoH6R4x4JjCF7OUw56ge21S/vcqiDp1S5SX+WHvcy5bHJSaR
         x21J14FFVana8n4sA/1ZLnuK0tIUeQoupWvYj4+hlYaL65nLWhLvl6xcVWaHgiQJ+TKJ
         1CEpnYEtIcQfzq4kQnpSc+LFX+QY7WXTHxVPtKf6uOKnGLkIb8koJC1Mb9WK4GG0EHlA
         xXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370831; x=1794975631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J+IfYqOjYnJDuJJ00zeCIQKxMby4VMAaf9unQyQXMNw=;
        b=2tdwEw5y6wgHffJ/nw2cgjmdfrsPY8fCIQ51QrBLTHZVMRsTC9oRIujLY+tMOlca2K
         /X2p+6l4oOLriA2PW9ZVVBwQhs3X493HAuKDG64aE9HVFsQC70ixZqIH/Flu5od8DrdF
         A3ruAWj5Y0zkNq3Z4mbXYuWDMyVRpnyTch1Hwr/Qzrg7QJvb0nLoBXRMSfASTxp+oBIz
         vP6yvAzxciBwj6HODufLoXvglijG3QOhfrsz3A9cIIXgKAf+C8NkFR1OKJf+cCBOUMWN
         Nxe1Tmmwg3LQlJTbdKNG8gmgJMwniFDqB6frHp5w6cHp/GG7xOARxGkfnxIzbfBO7+M3
         QENQ==
X-Forwarded-Encrypted: i=1; AL+hErHa/zoOG570VVRR+VosdD/bQxaGh28mvABLYW8pyGbtYm6AqLzeKkedxftJbmFeVMoPihT5NnrHHfKo@vger.kernel.org
X-Gm-Message-State: APuU4Z+b8ilhd1hGZMJGo3LoHDY6x1yAdiRqcaM76ymGv+QkEOYzoEym
	MeAe65i+FSLdZAJU3LmLeHMRxYFxcBCs6hTbGCecBAFjR/tpvz+FCx/bakcLNQ+A67gF+5JBpRj
	waKeZebQoM0M3Fl9wFDuA82DRPPj7UJl4T8+Cj84aKKN56s7sdkuNSxYkIpxgQDz0
X-Gm-Gg: AYBFou2aGUUm5K3mUlLnFvb/xB8XKM2u4MCxDHeA58XVIESIe4ja2n0LGWar1+LGIu0
	taKgpwuby9mgTXg7B87Mygo4TJaqGK8RPVHL/VBHu4Uqbq1OgYvZsbzcBMaZgeoDWkxRB7G1dYb
	GPhbYEKUV1i0G2fnIW3JXg450GuFraa4aTHY3d+d8vs/Jk//OlfFjTxuO9A34SZJXOV3wUuNyEK
	GN0vTz9TRIWauFyeLfF6VsDGvSodwyKwKnt/OhFx3+hfvbhtPz0KoTVCixA6EyVW3N+i5tIn8gI
	I7yra6l82YeLtlbnC6Dd+xhP8U5N8nKUooa+K8GxXYHDUeGAQNHW6zVPeuOU1IBcz+froyKOFgm
	N0PwLAranz2fb1YQ2yB7Odwozl7kk/X7oXcMEZPazfsh9YamKccJcEHHz7ToNBbsCBoumWgkvUC
	rccup7hsht26HKXvV7IesA7gikK7uy2SwT
X-Received: by 2002:a05:693c:41ca:b0:364:377c:cabe with SMTP id 5a478bee46e88-3766acb1ea2mr2071343eec.24.1794370830043;
        Tue, 10 Nov 2026 20:20:30 -0800 (PST)
X-Received: by 2002:a05:693c:41ca:b0:364:377c:cabe with SMTP id 5a478bee46e88-3766acb1ea2mr2071301eec.24.1794370829056;
        Tue, 10 Nov 2026 20:20:29 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm21690542eec.16.2026.11.10.20.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:20:28 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: nord: add CoreSight debug nodes
Date: Wed, 11 Nov 2026 12:19:40 +0800
Message-ID: <20261111041956.3639092-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111041956.3639092-1-shengchao.guo@oss.qualcomm.com>
References: <20261111041956.3639092-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4poagwYyeNbChu6I48jHFWSaBtEDkQTV
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af3ed0f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=CobPXiU9YXBfPT5qYScA:9 a=MK5Cw57mQeg2BjDo:21 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 4poagwYyeNbChu6I48jHFWSaBtEDkQTV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfXzSS6asGmnkqW
 q8ZyY0zS6EneAgTH3kSqnws12oILeOjReaRgBOyt/mCmLIMrCj4EeFuaxuh6kphr2qx6o014M+6
 c9+b/30y6F7lFQtnsMF9lhbsSPxR8zE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfXxNbIEsV+EpmQ
 cMNKf+r6rVYCO+VIFLax0rjYLSjCbOja1dN8wUbQE9jKjApATqrxHLFM6B3eHhyB0g9aVRn8hnP
 hVaXpNIFaTVxJSoXu5uYQj4F5sQ+NghqQbouiK3dq65xfTAajZaH+iXQ0kLFncFNme79fIYvyIE
 2F/RXjzQdr3i5cZzDlK2m1tU+O3kP9C0S9eEA2kkPPwcIDcsQzqQIAqFLVaxQWgBuWJK3bsNa+u
 SrHgcgdNgRCAgGLD9rWyqe4Fg0MgdTImsjw511jjOIoA7NgXH/Y1Q6+8qNSJBt8/GwQ3vrb+SgE
 NVs2tvgPgaVgyq9XTexfBK+bwY9f9CUWQFnqcL+SUi3paS0ojw2J2hwsltqBJl6QicjwCWNWIbN
 FZs6vTJvtxGZZALeMlpTtpyWZs1vfZnVtqcETx2FhYA7bBl3Ms8lfLmLFjnUtJnGtCoObyM/GoT
 gzRvovif+pjsd4Cii0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110017

From: Jie Gan <jie.gan@oss.qualcomm.com>

Add the CoreSight trace topology for the Qualcomm Nord SoC: CTCU, STM,
TPDM/TPDA sources and aggregators, funnels, replicators, TMC ETR/ETF
sinks, TNoC/ITNoC nodes and per-subsystem CTIs. This wires up trace
sources for SOCCP, BCV/IMH/DPM, GCC, QM, DL_NOC, the CDSP NSP0-3
clusters, DLMM, EVA, MDSS0/1, LPASS and the AOSS SWAO priority TPDMs,
plus the DDR0-3 channel and LLCC TPDMs, all funneled through the
tn_ag aggregator into the main CoreSight funnel and out to the AOSS
sink.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 3088 ++++++++++++++++++++++++++++
 1 file changed, 3088 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 617e5312f4c4..59f2575c925f 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -346,6 +346,18 @@ domain_ss3: domain-sleep-0 {
 		};
 	};
 
+	eud-sink {
+		compatible = "arm,coresight-dummy-sink";
+
+		in-ports {
+			port {
+				eud_in: endpoint {
+					remote-endpoint = <&aoss_rep0_out1>;
+				};
+			};
+		};
+	};
+
 	firmware: firmware {
 		scm {
 			compatible = "qcom,scm-nord",
@@ -373,6 +385,20 @@ cpu_perf: protocol@13 {
 		};
 	};
 
+	hpass-stm {
+		compatible = "arm,coresight-dummy-source";
+		label = "hpass_stm";
+		arm,static-trace-id = <25>;
+
+		out-ports {
+			port {
+				lpass_stm_out: endpoint {
+					remote-endpoint = <&lpass_tn_in18>;
+				};
+			};
+		};
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		/* Size will be updated by bootloader */
@@ -2049,6 +2075,2948 @@ tlmm: pinctrl@f100000 {
 			wakeup-parent = <&pdc>;
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,nord-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x10001000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ctcu_in0: endpoint {
+						remote-endpoint = <&qdss_etr0_out_ctcu>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ctcu_in1: endpoint {
+						remote-endpoint = <&qdss_etr1_out_ctcu>;
+					};
+				};
+			};
+		};
+
+		stm@10002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x10002000 0x0 0x1000>,
+			      <0x0 0x16000000 0x0 0x180000>;
+			reg-names = "stm-base",
+				    "stm-stimulus-base";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					qdss_stm_out: endpoint {
+						remote-endpoint = <&qdss_funnel_in7>;
+					};
+				};
+			};
+		};
+
+		tpda@10004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10004000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					qdss_tpda_in1: endpoint {
+						remote-endpoint = <&qdss_tpdm1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_tpda_out: endpoint {
+						remote-endpoint = <&qdss_funnel_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@1000f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1000f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					qdss_tpdm1_out: endpoint {
+						remote-endpoint = <&qdss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@10041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10041000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					qdss_funnel_in0: endpoint {
+						remote-endpoint = <&tn_ag_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					qdss_funnel_in6: endpoint {
+						remote-endpoint = <&qdss_tpda_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					qdss_funnel_in7: endpoint {
+						remote-endpoint = <&qdss_stm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_funnel_out: endpoint {
+						remote-endpoint = <&aoss_funnel_in7>;
+					};
+				};
+			};
+		};
+
+		replicator@10046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					qdss_rep0_in: endpoint {
+						remote-endpoint = <&aoss_rep1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_rep0_out: endpoint {
+						remote-endpoint = <&qdss_rep1_in>;
+					};
+				};
+			};
+		};
+
+		tmc@10048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu_0 0x1860 0x0>;
+
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					qdss_etr0_in: endpoint {
+						remote-endpoint = <&qdss_rep1_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_etr0_out_ctcu: endpoint {
+						remote-endpoint = <&ctcu_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@1004e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1004e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					qdss_rep1_in: endpoint {
+						remote-endpoint = <&qdss_rep0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					qdss_rep1_out0: endpoint {
+						remote-endpoint = <&qdss_etr0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					qdss_rep1_out1: endpoint {
+						remote-endpoint = <&qdss_etr1_in>;
+					};
+				};
+			};
+		};
+
+		tmc@1004f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1004f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu_0 0x1880 0x0>;
+
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					qdss_etr1_in: endpoint {
+						remote-endpoint = <&qdss_rep1_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_etr1_out_ctcu: endpoint {
+						remote-endpoint = <&ctcu_in1>;
+					};
+				};
+			};
+		};
+
+		itnoc@11500000 {
+			compatible = "qcom,coresight-itnoc";
+			reg = <0x0 0x11500000 0x0 0x3400>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				port {
+					soccp_tn_in: endpoint {
+						remote-endpoint = <&soccp_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					soccp_tn_out: endpoint {
+						remote-endpoint = <&tn_ag_in75>;
+					};
+				};
+			};
+		};
+
+		tpdm@11504000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11504000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_soccp";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					soccp_tpdm_out: endpoint {
+						remote-endpoint = <&soccp_tn_in>;
+					};
+				};
+			};
+		};
+
+		tpdm@11528000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11528000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_bcv";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					mm_rscc_tpdm0_out: endpoint {
+						remote-endpoint = <&mm_rscc_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@11529000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11529000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_imh";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					mm_rscc_tpdm1_out: endpoint {
+						remote-endpoint = <&mm_rscc_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@1152a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1152a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_dpm";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					mm_rscc_tpdm2_out: endpoint {
+						remote-endpoint = <&mm_rscc_tpda_in2>;
+					};
+				};
+			};
+		};
+
+		tpda@1152b000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x1152b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					mm_rscc_tpda_in0: endpoint {
+						remote-endpoint = <&mm_rscc_tpdm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					mm_rscc_tpda_in1: endpoint {
+						remote-endpoint = <&mm_rscc_tpdm1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					mm_rscc_tpda_in2: endpoint {
+						remote-endpoint = <&mm_rscc_tpdm2_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					mm_rscc_tpda_out: endpoint {
+						remote-endpoint = <&tn_ag_in8>;
+					};
+				};
+			};
+		};
+
+		tpdm@1153c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1153c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_gcc";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					gcc_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in56>;
+					};
+				};
+			};
+		};
+
+		tpdm@115a5000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115a5000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_0";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm0_out: endpoint {
+						remote-endpoint = <&tn_ag_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@115a6000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115a6000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_1";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm1_out: endpoint {
+						remote-endpoint = <&tn_ag_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@115a7000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115a7000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_2";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm2_out: endpoint {
+						remote-endpoint = <&tn_ag_in37>;
+					};
+				};
+			};
+		};
+
+		tpdm@115a8000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115a8000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_3";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm3_out: endpoint {
+						remote-endpoint = <&tn_ag_in44>;
+					};
+				};
+			};
+		};
+
+		tpdm@115a9000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115a9000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_4";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm4_out: endpoint {
+						remote-endpoint = <&tn_ag_in47>;
+					};
+				};
+			};
+		};
+
+		tpdm@115aa000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115aa000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_5";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm5_out: endpoint {
+						remote-endpoint = <&tn_ag_in51>;
+					};
+				};
+			};
+		};
+
+		tpdm@115ab000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115ab000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_6";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm6_out: endpoint {
+						remote-endpoint = <&tn_ag_in65>;
+					};
+				};
+			};
+		};
+
+		tpdm@115ac000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115ac000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_7";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm7_out: endpoint {
+						remote-endpoint = <&tn_ag_in66>;
+					};
+				};
+			};
+		};
+
+		tpdm@115ad000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115ad000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_8";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm8_out: endpoint {
+						remote-endpoint = <&tn_ag_in67>;
+					};
+				};
+			};
+		};
+
+		tpdm@115ae000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115ae000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_9";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm9_out: endpoint {
+						remote-endpoint = <&tn_ag_in68>;
+					};
+				};
+			};
+		};
+
+		tpdm@115af000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115af000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_10";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm10_out: endpoint {
+						remote-endpoint = <&tn_ag_in69>;
+					};
+				};
+			};
+		};
+
+		tpdm@115b0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115b0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_11";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm11_out: endpoint {
+						remote-endpoint = <&tn_ag_in70>;
+					};
+				};
+			};
+		};
+
+		tpdm@115b1000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115b1000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_12";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm12_out: endpoint {
+						remote-endpoint = <&tn_ag_in71>;
+					};
+				};
+			};
+		};
+
+		tpdm@115b2000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115b2000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_13";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm13_out: endpoint {
+						remote-endpoint = <&tn_ag_in130>;
+					};
+				};
+			};
+		};
+
+		tpdm@115b3000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115b3000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_14";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm14_out: endpoint {
+						remote-endpoint = <&tn_ag_in131>;
+					};
+				};
+			};
+		};
+
+		tpdm@115b4000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115b4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_15";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm15_out: endpoint {
+						remote-endpoint = <&tn_ag_in135>;
+					};
+				};
+			};
+		};
+
+		tpdm@115b5000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115b5000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_16";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm16_out: endpoint {
+						remote-endpoint = <&tn_ag_in136>;
+					};
+				};
+			};
+		};
+
+		tpdm@115b6000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x115b6000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_tn_ag_17";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					tn_ag_tpdm17_out: endpoint {
+						remote-endpoint = <&tn_ag_in149>;
+					};
+				};
+			};
+		};
+
+		tn@115bc000 {
+			compatible = "qcom,coresight-tnoc";
+			reg = <0x0 0x115bc000 0x0 0x3c00>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					tn_ag_in0: endpoint {
+						remote-endpoint = <&tn_ag_tpdm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					tn_ag_in1: endpoint {
+						remote-endpoint = <&tn_ag_tpdm1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					tn_ag_in2: endpoint {
+						remote-endpoint = <&dlmm_funnel_out>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+
+					tn_ag_in8: endpoint {
+						remote-endpoint = <&mm_rscc_tpda_out>;
+					};
+				};
+
+				port@a {
+					reg = <0xa>;
+
+					tn_ag_in10: endpoint {
+						remote-endpoint = <&ddr0_tn_out>;
+					};
+				};
+
+				port@1f {
+					reg = <0x1f>;
+
+					tn_ag_in31: endpoint {
+						remote-endpoint = <&dlnoc_funnel_out>;
+					};
+				};
+
+				port@25 {
+					reg = <0x25>;
+
+					tn_ag_in37: endpoint {
+						remote-endpoint = <&tn_ag_tpdm2_out>;
+					};
+				};
+
+				port@26 {
+					reg = <0x26>;
+
+					tn_ag_in38: endpoint {
+						remote-endpoint = <&lpass_tn_out>;
+					};
+				};
+
+				port@2c {
+					reg = <0x2c>;
+
+					tn_ag_in44: endpoint {
+						remote-endpoint = <&tn_ag_tpdm3_out>;
+					};
+				};
+
+				port@2f {
+					reg = <0x2f>;
+
+					tn_ag_in47: endpoint {
+						remote-endpoint = <&tn_ag_tpdm4_out>;
+					};
+				};
+
+				port@33 {
+					reg = <0x33>;
+
+					tn_ag_in51: endpoint {
+						remote-endpoint = <&tn_ag_tpdm5_out>;
+					};
+				};
+
+				port@38 {
+					reg = <0x38>;
+
+					tn_ag_in56: endpoint {
+						remote-endpoint = <&gcc_tpdm_out>;
+					};
+				};
+
+				port@3d {
+					reg = <0x3d>;
+
+					tn_ag_in61: endpoint {
+						remote-endpoint = <&nsp1_funnel_out>;
+					};
+				};
+
+				port@3e {
+					reg = <0x3e>;
+
+					tn_ag_in62: endpoint {
+						remote-endpoint = <&nsp2_funnel_out>;
+					};
+				};
+
+				port@3f {
+					reg = <0x3f>;
+
+					tn_ag_in63: endpoint {
+						remote-endpoint = <&nsp3_funnel_out>;
+					};
+				};
+
+				port@41 {
+					reg = <0x41>;
+
+					tn_ag_in65: endpoint {
+						remote-endpoint = <&tn_ag_tpdm6_out>;
+					};
+				};
+
+				port@42 {
+					reg = <0x42>;
+
+					tn_ag_in66: endpoint {
+						remote-endpoint = <&tn_ag_tpdm7_out>;
+					};
+				};
+
+				port@43 {
+					reg = <0x43>;
+
+					tn_ag_in67: endpoint {
+						remote-endpoint = <&tn_ag_tpdm8_out>;
+					};
+				};
+
+				port@44 {
+					reg = <0x44>;
+
+					tn_ag_in68: endpoint {
+						remote-endpoint = <&tn_ag_tpdm9_out>;
+					};
+				};
+
+				port@45 {
+					reg = <0x45>;
+
+					tn_ag_in69: endpoint {
+						remote-endpoint = <&tn_ag_tpdm10_out>;
+					};
+				};
+
+				port@46 {
+					reg = <0x46>;
+
+					tn_ag_in70: endpoint {
+						remote-endpoint = <&tn_ag_tpdm11_out>;
+					};
+				};
+
+				port@47 {
+					reg = <0x47>;
+
+					tn_ag_in71: endpoint {
+						remote-endpoint = <&tn_ag_tpdm12_out>;
+					};
+				};
+
+				port@48 {
+					reg = <0x48>;
+
+					tn_ag_in72: endpoint {
+						remote-endpoint = <&qm_tpdm_out>;
+					};
+				};
+
+				port@4b {
+					reg = <0x4b>;
+
+					tn_ag_in75: endpoint {
+						remote-endpoint = <&soccp_tn_out>;
+					};
+				};
+
+				port@59 {
+					reg = <0x59>;
+
+					tn_ag_in89: endpoint {
+						remote-endpoint = <&ddr1_tn_out>;
+					};
+				};
+
+				port@6b {
+					reg = <0x6b>;
+
+					tn_ag_in107: endpoint {
+						remote-endpoint = <&ddr2_tn_out>;
+					};
+				};
+
+				port@82 {
+					reg = <0x82>;
+
+					tn_ag_in130: endpoint {
+						remote-endpoint = <&tn_ag_tpdm13_out>;
+					};
+				};
+
+				port@83 {
+					reg = <0x83>;
+
+					tn_ag_in131: endpoint {
+						remote-endpoint = <&tn_ag_tpdm14_out>;
+					};
+				};
+
+				port@87 {
+					reg = <0x87>;
+
+					tn_ag_in135: endpoint {
+						remote-endpoint = <&tn_ag_tpdm15_out>;
+					};
+				};
+
+				port@88 {
+					reg = <0x88>;
+
+					tn_ag_in136: endpoint {
+						remote-endpoint = <&tn_ag_tpdm16_out>;
+					};
+				};
+
+				port@89 {
+					reg = <0x89>;
+
+					tn_ag_in137: endpoint {
+						remote-endpoint = <&nsp0_funnel_out>;
+					};
+				};
+
+				port@95 {
+					reg = <0x95>;
+
+					tn_ag_in149: endpoint {
+						remote-endpoint = <&tn_ag_tpdm17_out>;
+					};
+				};
+
+				port@9f {
+					reg = <0x9f>;
+
+					tn_ag_in159: endpoint {
+						remote-endpoint = <&ddr3_tn_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tn_ag_out: endpoint {
+						remote-endpoint = <&qdss_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@11684000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11684000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_qm";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					qm_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in72>;
+					};
+				};
+			};
+		};
+
+		tpdm@116f0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x116f0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_dl_noc_0";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					dlnoc_tpdm0_out: endpoint {
+						remote-endpoint = <&dlnoc_tpda_in27>;
+					};
+				};
+			};
+		};
+
+		tpdm@116f1000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x116f1000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_dl_noc_1";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					dlnoc_tpdm1_out: endpoint {
+						remote-endpoint = <&dlnoc_tpda_in28>;
+					};
+				};
+			};
+		};
+
+		tpda@116f4000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x116f4000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1b {
+					reg = <0x1b>;
+
+					dlnoc_tpda_in27: endpoint {
+						remote-endpoint = <&dlnoc_tpdm0_out>;
+					};
+				};
+
+				port@1c {
+					reg = <0x1c>;
+
+					dlnoc_tpda_in28: endpoint {
+						remote-endpoint = <&dlnoc_tpdm1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlnoc_tpda_out: endpoint {
+						remote-endpoint = <&dlnoc_funnel_in>;
+					};
+				};
+			};
+		};
+
+		funnel@116f5000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x116f5000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					dlnoc_funnel_in: endpoint {
+						remote-endpoint = <&dlnoc_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlnoc_funnel_out: endpoint {
+						remote-endpoint = <&tn_ag_in31>;
+					};
+				};
+			};
+		};
+
+		tpda@117c8000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x117c8000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					nsp0_tpda_in0: endpoint {
+						remote-endpoint = <&nsp0_tpdm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					nsp0_tpda_in1: endpoint {
+						remote-endpoint = <&nsp0_tpdm1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					nsp0_tpda_out: endpoint {
+						remote-endpoint = <&nsp0_funnel_in>;
+					};
+				};
+			};
+		};
+
+		funnel@117c9000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x117c9000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					nsp0_funnel_in: endpoint {
+						remote-endpoint = <&nsp0_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					nsp0_funnel_out: endpoint {
+						remote-endpoint = <&tn_ag_in137>;
+					};
+				};
+			};
+		};
+
+		cti@117d3000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x117d3000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "cti_nsp0";
+		};
+
+		tpda@117e8000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x117e8000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					nsp1_tpda_in0: endpoint {
+						remote-endpoint = <&nsp1_tpdm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					nsp1_tpda_in1: endpoint {
+						remote-endpoint = <&nsp1_tpdm1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					nsp1_tpda_out: endpoint {
+						remote-endpoint = <&nsp1_funnel_in>;
+					};
+				};
+			};
+		};
+
+		funnel@117e9000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x117e9000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					nsp1_funnel_in: endpoint {
+						remote-endpoint = <&nsp1_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					nsp1_funnel_out: endpoint {
+						remote-endpoint = <&tn_ag_in61>;
+					};
+				};
+			};
+		};
+
+		cti@117f3000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x117f3000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "cti_nsp1";
+		};
+
+		tpdm@11800000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11800000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_dlmm_dsb";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					dlmm_tpdm0_out: endpoint {
+						remote-endpoint = <&dlmm_tpda_in27>;
+					};
+				};
+			};
+		};
+
+		tpdm@11801000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11801000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_dlmm_cmb";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					dlmm_tpdm1_out: endpoint {
+						remote-endpoint = <&dlmm_tpda_in28>;
+					};
+				};
+			};
+		};
+
+		tpda@11804000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11804000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					dlmm_tpda_in2: endpoint {
+						remote-endpoint = <&mdss1_funnel_out>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+
+					dlmm_tpda_in8: endpoint {
+						remote-endpoint = <&eva_funnel_out>;
+					};
+				};
+
+				port@e {
+					reg = <0xe>;
+
+					dlmm_tpda_in14: endpoint {
+						remote-endpoint = <&mdss0_funnel_out>;
+					};
+				};
+
+				port@1b {
+					reg = <0x1b>;
+
+					dlmm_tpda_in27: endpoint {
+						remote-endpoint = <&dlmm_tpdm0_out>;
+					};
+				};
+
+				port@1c {
+					reg = <0x1c>;
+
+					dlmm_tpda_in28: endpoint {
+						remote-endpoint = <&dlmm_tpdm1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlmm_tpda_out: endpoint {
+						remote-endpoint = <&dlmm_funnel_in>;
+					};
+				};
+			};
+		};
+
+		funnel@11805000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11805000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					dlmm_funnel_in: endpoint {
+						remote-endpoint = <&dlmm_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					dlmm_funnel_out: endpoint {
+						remote-endpoint = <&tn_ag_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@11810000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11810000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_eva";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					eva_tpdm0_out: endpoint {
+						remote-endpoint = <&eva_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@11813000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11813000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					eva_funnel_in0: endpoint {
+						remote-endpoint = <&eva_tpdm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					eva_funnel_out: endpoint {
+						remote-endpoint = <&dlmm_tpda_in8>;
+					};
+				};
+			};
+		};
+
+		tpdm@11860000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11860000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_mdss1";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					mdss1_tpdm0_out: endpoint {
+						remote-endpoint = <&mdss1_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@11864000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11864000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					mdss1_funnel_in0: endpoint {
+						remote-endpoint = <&mdss1_tpdm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					mdss1_funnel_out: endpoint {
+						remote-endpoint = <&dlmm_tpda_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@11870000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11870000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_mdss0";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					mdss0_tpdm0_out: endpoint {
+						remote-endpoint = <&mdss0_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@11874000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11874000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					mdss0_funnel_in0: endpoint {
+						remote-endpoint = <&mdss0_tpdm0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					mdss0_funnel_out: endpoint {
+						remote-endpoint = <&dlmm_tpda_in14>;
+					};
+				};
+			};
+		};
+
+		tpda@118c8000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x118c8000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					nsp2_tpda_in0: endpoint {
+						remote-endpoint = <&nsp2_tpdm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					nsp2_tpda_in1: endpoint {
+						remote-endpoint = <&nsp2_tpdm1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					nsp2_tpda_out: endpoint {
+						remote-endpoint = <&nsp2_funnel_in>;
+					};
+				};
+			};
+		};
+
+		funnel@118c9000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x118c9000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					nsp2_funnel_in: endpoint {
+						remote-endpoint = <&nsp2_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					nsp2_funnel_out: endpoint {
+						remote-endpoint = <&tn_ag_in62>;
+					};
+				};
+			};
+		};
+
+		tpda@118e8000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x118e8000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					nsp3_tpda_in0: endpoint {
+						remote-endpoint = <&nsp3_tpdm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					nsp3_tpda_in1: endpoint {
+						remote-endpoint = <&nsp3_tpdm1_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					nsp3_tpda_out: endpoint {
+						remote-endpoint = <&nsp3_funnel_in>;
+					};
+				};
+			};
+		};
+
+		funnel@118e9000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x118e9000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					nsp3_funnel_in: endpoint {
+						remote-endpoint = <&nsp3_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					nsp3_funnel_out: endpoint {
+						remote-endpoint = <&tn_ag_in63>;
+					};
+				};
+			};
+		};
+
+		itnoc@11980000 {
+			compatible = "qcom,coresight-itnoc";
+			reg = <0x0 0x11980000 0x0 0x3080>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@12 {
+					reg = <0x12>;
+
+					lpass_tn_in18: endpoint {
+						remote-endpoint = <&lpass_stm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					lpass_tn_out: endpoint {
+						remote-endpoint = <&tn_ag_in38>;
+					};
+				};
+			};
+		};
+
+		tpdm@11a03000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11a03000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_4";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					aoss_tpdm4_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in4>;
+					};
+				};
+			};
+		};
+
+		funnel@11a04000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11a04000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@6 {
+					reg = <6>;
+
+					aoss_funnel_in6: endpoint {
+						remote-endpoint = <&aoss_tpda_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					aoss_funnel_in7: endpoint {
+						remote-endpoint = <&qdss_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					aoss_funnel_out: endpoint {
+						remote-endpoint = <&aoss_etf_in>;
+					};
+				};
+			};
+		};
+
+		tmc@11a05000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x11a05000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					aoss_etf_in: endpoint {
+						remote-endpoint = <&aoss_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					aoss_etf_out: endpoint {
+						remote-endpoint = <&aoss_rep0_in>;
+					};
+				};
+			};
+		};
+
+		replicator@11a06000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x11a06000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					aoss_rep0_in: endpoint {
+						remote-endpoint = <&aoss_etf_out>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					aoss_rep0_out0: endpoint {
+						remote-endpoint = <&aoss_rep1_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					aoss_rep0_out1: endpoint {
+						remote-endpoint = <&eud_in>;
+					};
+				};
+			};
+		};
+
+		replicator@11a07000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x11a07000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					aoss_rep1_in: endpoint {
+						remote-endpoint = <&aoss_rep0_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					aoss_rep1_out: endpoint {
+						remote-endpoint = <&qdss_rep0_in>;
+					};
+				};
+			};
+		};
+
+		tpda@11a08000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11a08000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					aoss_tpda_in0: endpoint {
+						remote-endpoint = <&aoss_tpdm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					aoss_tpda_in1: endpoint {
+						remote-endpoint = <&aoss_tpdm1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					aoss_tpda_in2: endpoint {
+						remote-endpoint = <&aoss_tpdm2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					aoss_tpda_in3: endpoint {
+						remote-endpoint = <&aoss_tpdm3_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					aoss_tpda_in4: endpoint {
+						remote-endpoint = <&aoss_tpdm4_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					aoss_tpda_in5: endpoint {
+						remote-endpoint = <&aoss_tpdm5_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					aoss_tpda_out: endpoint {
+						remote-endpoint = <&aoss_funnel_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@11a09000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11a09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					aoss_tpdm0_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@11a0a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11a0a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					aoss_tpdm1_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@11a0b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11a0b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					aoss_tpdm2_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@11a0c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11a0c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					aoss_tpdm3_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@11a0d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11a0d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_swao1";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					aoss_tpdm5_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in5>;
+					};
+				};
+			};
+		};
+
+		cti@11a21000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x11a21000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "cti_aoss";
+		};
+
+		itnoc@12000000 {
+			compatible = "qcom,coresight-itnoc";
+			reg = <0x0 0x12000000 0x0 0x2e80>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@7 {
+					reg = <7>;
+
+					ddr0_tn_in7: endpoint {
+						remote-endpoint = <&ddr0_tpdm0_out>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+
+					ddr0_tn_in8: endpoint {
+						remote-endpoint = <&ddr0_tpdm1_out>;
+					};
+				};
+
+				port@9 {
+					reg = <9>;
+
+					ddr0_tn_in9: endpoint {
+						remote-endpoint = <&ddr0_tpdm2_out>;
+					};
+				};
+
+				port@a {
+					reg = <0xa>;
+
+					ddr0_tn_in10: endpoint {
+						remote-endpoint = <&ddr0_tpdm3_out>;
+					};
+				};
+
+				port@b {
+					reg = <0xb>;
+
+					ddr0_tn_in11: endpoint {
+						remote-endpoint = <&ddr0_tpdm4_out>;
+					};
+				};
+
+				port@f {
+					reg = <0xf>;
+
+					ddr0_tn_in15: endpoint {
+						remote-endpoint = <&ddr0_tpdm8_out>;
+					};
+				};
+
+				port@10 {
+					reg = <0x10>;
+
+					ddr0_tn_in16: endpoint {
+						remote-endpoint = <&ddr0_tpdm9_out>;
+					};
+				};
+
+			};
+
+			out-ports {
+				port {
+					ddr0_tn_out: endpoint {
+						remote-endpoint = <&tn_ag_in10>;
+					};
+				};
+			};
+		};
+
+		tpdm@12003000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12003000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr0_shrm2";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr0_tpdm4_out: endpoint {
+						remote-endpoint = <&ddr0_tn_in11>;
+					};
+				};
+			};
+		};
+
+		tpdm@12009000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12009000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr0_ch02";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr0_tpdm8_out: endpoint {
+						remote-endpoint = <&ddr0_tn_in15>;
+					};
+				};
+			};
+		};
+
+		tpdm@1200c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1200c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr0_ch13";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr0_tpdm9_out: endpoint {
+						remote-endpoint = <&ddr0_tn_in16>;
+					};
+				};
+			};
+		};
+
+		tpdm@1200e000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1200e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr0_llcc_0";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr0_tpdm0_out: endpoint {
+						remote-endpoint = <&ddr0_tn_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@1200f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1200f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr0_llcc_1";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr0_tpdm1_out: endpoint {
+						remote-endpoint = <&ddr0_tn_in8>;
+					};
+				};
+			};
+		};
+
+		tpdm@12010000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12010000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr0_llcc_2";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr0_tpdm2_out: endpoint {
+						remote-endpoint = <&ddr0_tn_in9>;
+					};
+				};
+			};
+		};
+
+		tpdm@12011000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12011000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr0_llcc_3";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr0_tpdm3_out: endpoint {
+						remote-endpoint = <&ddr0_tn_in10>;
+					};
+				};
+			};
+		};
+
+		itnoc@12200000 {
+			compatible = "qcom,coresight-itnoc";
+			reg = <0x0 0x12200000 0x0 0x2e80>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@7 {
+					reg = <7>;
+
+					ddr1_tn_in7: endpoint {
+						remote-endpoint = <&ddr1_tpdm0_out>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+
+					ddr1_tn_in8: endpoint {
+						remote-endpoint = <&ddr1_tpdm1_out>;
+					};
+				};
+
+				port@9 {
+					reg = <9>;
+
+					ddr1_tn_in9: endpoint {
+						remote-endpoint = <&ddr1_tpdm2_out>;
+					};
+				};
+
+				port@a {
+					reg = <0xa>;
+
+					ddr1_tn_in10: endpoint {
+						remote-endpoint = <&ddr1_tpdm3_out>;
+					};
+				};
+
+				port@b {
+					reg = <0xb>;
+
+					ddr1_tn_in11: endpoint {
+						remote-endpoint = <&ddr1_tpdm4_out>;
+					};
+				};
+
+				port@f {
+					reg = <0xf>;
+
+					ddr1_tn_in15: endpoint {
+						remote-endpoint = <&ddr1_tpdm8_out>;
+					};
+				};
+
+				port@10 {
+					reg = <0x10>;
+
+					ddr1_tn_in16: endpoint {
+						remote-endpoint = <&ddr1_tpdm9_out>;
+					};
+				};
+
+			};
+
+			out-ports {
+				port {
+					ddr1_tn_out: endpoint {
+						remote-endpoint = <&tn_ag_in89>;
+					};
+				};
+			};
+		};
+
+		tpdm@12203000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12203000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr1_shrm2";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr1_tpdm4_out: endpoint {
+						remote-endpoint = <&ddr1_tn_in11>;
+					};
+				};
+			};
+		};
+
+		tpdm@12209000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12209000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr1_ch02";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr1_tpdm8_out: endpoint {
+						remote-endpoint = <&ddr1_tn_in15>;
+					};
+				};
+			};
+		};
+
+		tpdm@1220c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1220c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr1_ch13";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr1_tpdm9_out: endpoint {
+						remote-endpoint = <&ddr1_tn_in16>;
+					};
+				};
+			};
+		};
+
+		tpdm@1220e000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1220e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr1_llcc_0";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr1_tpdm0_out: endpoint {
+						remote-endpoint = <&ddr1_tn_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@1220f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1220f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr1_llcc_1";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr1_tpdm1_out: endpoint {
+						remote-endpoint = <&ddr1_tn_in8>;
+					};
+				};
+			};
+		};
+
+		tpdm@12210000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12210000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr1_llcc_2";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr1_tpdm2_out: endpoint {
+						remote-endpoint = <&ddr1_tn_in9>;
+					};
+				};
+			};
+		};
+
+		tpdm@12211000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12211000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr1_llcc_3";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr1_tpdm3_out: endpoint {
+						remote-endpoint = <&ddr1_tn_in10>;
+					};
+				};
+			};
+		};
+
+		itnoc@12400000 {
+			compatible = "qcom,coresight-itnoc";
+			reg = <0x0 0x12400000 0x0 0x2e80>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@7 {
+					reg = <7>;
+
+					ddr2_tn_in7: endpoint {
+						remote-endpoint = <&ddr2_tpdm0_out>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+
+					ddr2_tn_in8: endpoint {
+						remote-endpoint = <&ddr2_tpdm1_out>;
+					};
+				};
+
+				port@9 {
+					reg = <9>;
+
+					ddr2_tn_in9: endpoint {
+						remote-endpoint = <&ddr2_tpdm2_out>;
+					};
+				};
+
+				port@a {
+					reg = <0xa>;
+
+					ddr2_tn_in10: endpoint {
+						remote-endpoint = <&ddr2_tpdm3_out>;
+					};
+				};
+
+				port@b {
+					reg = <0xb>;
+
+					ddr2_tn_in11: endpoint {
+						remote-endpoint = <&ddr2_tpdm4_out>;
+					};
+				};
+
+				port@f {
+					reg = <0xf>;
+
+					ddr2_tn_in15: endpoint {
+						remote-endpoint = <&ddr2_tpdm8_out>;
+					};
+				};
+
+				port@10 {
+					reg = <0x10>;
+
+					ddr2_tn_in16: endpoint {
+						remote-endpoint = <&ddr2_tpdm9_out>;
+					};
+				};
+
+			};
+
+			out-ports {
+				port {
+					ddr2_tn_out: endpoint {
+						remote-endpoint = <&tn_ag_in107>;
+					};
+				};
+			};
+		};
+
+		tpdm@12403000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12403000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr2_shrm2";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr2_tpdm4_out: endpoint {
+						remote-endpoint = <&ddr2_tn_in11>;
+					};
+				};
+			};
+		};
+
+		tpdm@12409000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12409000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr2_ch02";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr2_tpdm8_out: endpoint {
+						remote-endpoint = <&ddr2_tn_in15>;
+					};
+				};
+			};
+		};
+
+		tpdm@1240c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1240c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr2_ch13";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr2_tpdm9_out: endpoint {
+						remote-endpoint = <&ddr2_tn_in16>;
+					};
+				};
+			};
+		};
+
+		tpdm@1240e000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1240e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr2_llcc_0";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr2_tpdm0_out: endpoint {
+						remote-endpoint = <&ddr2_tn_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@1240f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1240f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr2_llcc_1";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr2_tpdm1_out: endpoint {
+						remote-endpoint = <&ddr2_tn_in8>;
+					};
+				};
+			};
+		};
+
+		tpdm@12410000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12410000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr2_llcc_2";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr2_tpdm2_out: endpoint {
+						remote-endpoint = <&ddr2_tn_in9>;
+					};
+				};
+			};
+		};
+
+		tpdm@12411000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12411000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr2_llcc_3";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr2_tpdm3_out: endpoint {
+						remote-endpoint = <&ddr2_tn_in10>;
+					};
+				};
+			};
+		};
+
+		itnoc@12600000 {
+			compatible = "qcom,coresight-itnoc";
+			reg = <0x0 0x12600000 0x0 0x2e80>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@7 {
+					reg = <7>;
+
+					ddr3_tn_in7: endpoint {
+						remote-endpoint = <&ddr3_tpdm0_out>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+
+					ddr3_tn_in8: endpoint {
+						remote-endpoint = <&ddr3_tpdm1_out>;
+					};
+				};
+
+				port@9 {
+					reg = <9>;
+
+					ddr3_tn_in9: endpoint {
+						remote-endpoint = <&ddr3_tpdm2_out>;
+					};
+				};
+
+				port@a {
+					reg = <0xa>;
+
+					ddr3_tn_in10: endpoint {
+						remote-endpoint = <&ddr3_tpdm3_out>;
+					};
+				};
+
+				port@b {
+					reg = <0xb>;
+
+					ddr3_tn_in11: endpoint {
+						remote-endpoint = <&ddr3_tpdm4_out>;
+					};
+				};
+
+				port@f {
+					reg = <0xf>;
+
+					ddr3_tn_in15: endpoint {
+						remote-endpoint = <&ddr3_tpdm8_out>;
+					};
+				};
+
+				port@10 {
+					reg = <0x10>;
+
+					ddr3_tn_in16: endpoint {
+						remote-endpoint = <&ddr3_tpdm9_out>;
+					};
+				};
+
+			};
+
+			out-ports {
+				port {
+					ddr3_tn_out: endpoint {
+						remote-endpoint = <&tn_ag_in159>;
+					};
+				};
+			};
+		};
+
+		tpdm@12603000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12603000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr3_shrm2";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr3_tpdm4_out: endpoint {
+						remote-endpoint = <&ddr3_tn_in11>;
+					};
+				};
+			};
+		};
+
+		tpdm@12609000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12609000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr3_ch02";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr3_tpdm8_out: endpoint {
+						remote-endpoint = <&ddr3_tn_in15>;
+					};
+				};
+			};
+		};
+
+		tpdm@1260c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1260c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr3_ch13";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr3_tpdm9_out: endpoint {
+						remote-endpoint = <&ddr3_tn_in16>;
+					};
+				};
+			};
+		};
+
+		tpdm@1260e000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1260e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr3_llcc_0";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr3_tpdm0_out: endpoint {
+						remote-endpoint = <&ddr3_tn_in7>;
+					};
+				};
+			};
+		};
+
+		tpdm@1260f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1260f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr3_llcc_1";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr3_tpdm1_out: endpoint {
+						remote-endpoint = <&ddr3_tn_in8>;
+					};
+				};
+			};
+		};
+
+		tpdm@12610000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12610000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr3_llcc_2";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr3_tpdm2_out: endpoint {
+						remote-endpoint = <&ddr3_tn_in9>;
+					};
+				};
+			};
+		};
+
+		tpdm@12611000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x12611000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			label = "tpdm_ddr3_llcc_3";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ddr3_tpdm3_out: endpoint {
+						remote-endpoint = <&ddr3_tn_in10>;
+					};
+				};
+			};
+		};
+
 		apps_smmu_0: iommu@15a00000 {
 			compatible = "qcom,nord-smmu-500",
 				     "qcom,smmu-500",
@@ -3169,6 +6137,126 @@ llcc: system-cache-controller@21800000 {
 		};
 	};
 
+	tpdm-nsp0-cdsp-llm {
+		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_nsp0_cdsp_llm";
+
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				nsp0_tpdm0_out: endpoint {
+					remote-endpoint = <&nsp0_tpda_in0>;
+				};
+			};
+		};
+	};
+
+	tpdm-nsp0-cdsp-llm2 {
+		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_nsp0_cdsp_llm2";
+
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				nsp0_tpdm1_out: endpoint {
+					remote-endpoint = <&nsp0_tpda_in1>;
+				};
+			};
+		};
+	};
+
+	tpdm-nsp1-cdsp-llm {
+		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_nsp1_cdsp_llm";
+
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				nsp1_tpdm0_out: endpoint {
+					remote-endpoint = <&nsp1_tpda_in0>;
+				};
+			};
+		};
+	};
+
+	tpdm-nsp1-cdsp-llm2 {
+		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_nsp1_cdsp_llm2";
+
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				nsp1_tpdm1_out: endpoint {
+					remote-endpoint = <&nsp1_tpda_in1>;
+				};
+			};
+		};
+	};
+
+	tpdm-nsp2-cdsp-llm {
+		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_nsp2_cdsp_llm";
+
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				nsp2_tpdm0_out: endpoint {
+					remote-endpoint = <&nsp2_tpda_in0>;
+				};
+			};
+		};
+	};
+
+	tpdm-nsp2-cdsp-llm2 {
+		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_nsp2_cdsp_llm2";
+
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				nsp2_tpdm1_out: endpoint {
+					remote-endpoint = <&nsp2_tpda_in1>;
+				};
+			};
+		};
+	};
+
+	tpdm-nsp3-cdsp-llm {
+		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_nsp3_cdsp_llm";
+
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				nsp3_tpdm0_out: endpoint {
+					remote-endpoint = <&nsp3_tpda_in0>;
+				};
+			};
+		};
+	};
+
+	tpdm-nsp3-cdsp-llm2 {
+		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_nsp3_cdsp_llm2";
+
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				nsp3_tpdm1_out: endpoint {
+					remote-endpoint = <&nsp3_tpda_in1>;
+				};
+			};
+		};
+	};
+
 	arch_timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
-- 
2.43.0

