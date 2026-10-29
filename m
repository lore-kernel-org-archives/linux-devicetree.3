Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246040;
	b=IE4/4Ap6JsrNXTfgR7NQ4F6vtBBqgzpQzQSw6LBbTihPYupJoEXBU5Wz9bYeggWS2RHG
	 /HXhV/7jZGd7yOX+E6/jcmMV80Rnn3SKbefyOvatLRypbzKQqUG3IYb50Hlob+u08SvFd
	 Al9wKxZ259G9Ol5sn0XwAsltgpKOsLRB6mJXthO/x398czaS3ktMvAOqlnMBO5SXxH3Gz
	 6mzxkWn8jys0GoGh84JsRYlHXJ13G1ci/dZXs+akZUCr4TjXGc3jHZ2JFjbUybKmIy2+M
	 dOyF/9i3woZJ+EAYQe7U7ou+e4Ymk2IOtXMRilBM8V6BJtbVHChkpExUhI4a3LAiLNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oV+YYQgmYqH5rHweZ98iHnQy4E8Zo46BbQyX59hM0ac=;
	b=Aae2XlOXcxBrfMwFOSIKNmDLPLuhZ85yts/4exlk6buDQLbcVungX8ufxa17e6pVCigs
	 NrQ6ZYs0boWKTBaJErTAJXPiOoFc3UwNkA5E7yvtzLlTxWPXrtiQbf6pppEIL8pcWe1Kf
	 t7t2YT2F3rZjdpnVUO8lJJFPV7arn5skaCONQ+SIGv54rPFRjSq7w1d/xO+dQ9WcSghJE
	 one3Isrkg1GplEIVVnODM87Pzl9sOfsJW835pwfuaB7k/+OOit4OPkEunWRYBvDQgn4hC
	 9NaH72eZNaFvciOsJHp63V3T7CU1Pi5oCud012eJSvcip4huX1/C8RIuoURsVDH6GmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aaSnLk+9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ue8Kk+bg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915AF606A321
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 915AF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aaSnLk+9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ue8Kk+bg
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jWfw1975022
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oV+YYQgmYqH
	5rHweZ98iHnQy4E8Zo46BbQyX59hM0ac=; b=aaSnLk+9O3ug1uq5y+ZtHUCq7o+
	zLBPTTuMBFyswCLw2Nxk9IeEGuvoCo91SdmvXKUaJ3B6p9xiXQd7icQFcpT6P/vw
	rT/PIuea7/7jsPuGXD3OMqDPU7R8BJm3nFECOgyKv/O0nS7pkEfbG/kR+2JNG7oF
	O6dVPDsNVl4Vu2vvrGgXtySOkvWJ9GFbLhMTmf5pB1Y3dHmAn9gkG1DE7LKC6DVW
	wTzhi2RPmJCO9uy345FC+Cf8CBFKNriFoes9KHBsGH9i/Y4Iz23PUpOXagfWkq1/
	0xcVJI42tWwhjQe0imCU/6Jymm9jK/Uq34hgTKzg5sqUlPLhrp2psXmhfWA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2a4qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:53:58 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6f508fd6f44so1396543eaf.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 20:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793246038; x=1793850838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oV+YYQgmYqH5rHweZ98iHnQy4E8Zo46BbQyX59hM0ac=;
        b=Ue8Kk+bgMlX+tu8jKpqKhdh9B92sNKydnieoK2r32fwui6S6gIeDLpjk3P/IWGDOTB
         Vpie44cw/FJ8XfNqDeYAfaM7J6PN/MlM3Yz3Jz/IalfKj9oLtSQH7gXvCiO6HaZ99RYZ
         TXIIBQXbe7xmdzU632Iv7o+fbVh+ld/GCRnCTIXr7yS/VwBpWNjQ7O7Nrnd2+UzbWoRN
         nDOX2J4vGLdhYASo+lkTb5HySmNes1G2yCijhOEv1vWtwEsmyLPkuVd0NEvITxlWLf6k
         DSHe5lHra+K3uFJglQHKEv68mvKPOTLWGE/pPwWMCyFueQa5vNisumY2JtptfAY7KoAF
         5lWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793246038; x=1793850838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oV+YYQgmYqH5rHweZ98iHnQy4E8Zo46BbQyX59hM0ac=;
        b=sq+ZwOoC78PKTkIlBnM05hvKXpcd2P0nRzkJt1CB5aMAfHCnxSBhYfwS31fbh/n+gn
         NbmyuNahL/tUins0RoYg/9FjdgIyilNBSIQkimAymwMaAz1SG27YldjKA3IHhkqMg3Kp
         d5PlEqb8VmbLgmJtKZp3At9xoFBwhz10+Rh3LZ/xjpaQQ7RyrKVuHz4+UHfPiYH/GUG6
         chpnBrh1aWnIVfTlmGTr1V1LBhd80xk/hC3dZh87J8shQFb04IqRE4P3k5InDr8IE3LE
         gIj/x4kV1iZtsVeY5QJGdNQBlujqp+LQ1ZO71KFVpUINpxHdRu45ylqmMPpLLo6pFXJ/
         STig==
X-Forwarded-Encrypted: i=1; AKwUvBwhZ1huSB4TRBq4Us651Wnl6VCxbW8W1+Ucm1z7vJwkXzb0bFShhMCfOKYuE2YGNnmv9maBC59Yy+sa@vger.kernel.org
X-Gm-Message-State: AFq9FYLsf8mXj/Sq60vCZo8RJ4z7hMw8JNYv8RkZGJf3ciBnkiEX0C2y
	4w6rwEwn1ofn4vyCQII1vJvmUMsHqzkugQjn5I8F8YdEe/s/ooisH1XxDzkbgLl7yZvDKtSJP7N
	b+kpKqBSTe/P5nWOGVXJiXpzIIRMhAwXKyCdmAuR6EofDJx3nAeV3fG1I9gBtvxp74BrzuZPVBc
	U=
X-Gm-Gg: AYBFou1sJ3J0BiHHSli+IenEUi3mBem1U9n2gac9UW3uEYAEMoYnsPV5JQ6WbYEYWIC
	h7eUYFb4zPDGx5e3yDFSwk9z3Gs5krIYdmxk7mPqkrEleFMzPFe015Ar6GMCBQ/4OrNpVrC+5NL
	vo9O2TPpAZjOIOEMl88PmwUc6ghibnF/5kZLWH8G9JG4u9f7tyUYBbI0NekXFrSsED+MWoW/ov0
	A9HWo1NExm/5udoNKeI7dq0XoHFiydybuGaU8U55atO4uM5SjFOCC02yM6IgJz2qMIQsP6o3gex
	jpYFbgV49NtQ3mg3/TROu59+6f84OxE36mykDyp9lJKwIAzkCzIm7nbh+0s8ueDr8dCvHBOJSQs
	WXyabbLFRpbS/crI3QxdfzqmejS87trot6Lw7Qo79JVtr/sktImkuyoKJJCRGqvdSJjXB4lWCCI
	lFIXlReHTNgLbew38zVnf7EbgFkLXFoj/Z
X-Received: by 2002:a05:6820:f014:b0:6c9:80d8:a201 with SMTP id 006d021491bc7-713eeb53676mr2481358eaf.62.1793246037917;
        Wed, 28 Oct 2026 20:53:57 -0700 (PDT)
X-Received: by 2002:a05:7301:fc01:b0:369:fa8b:d725 with SMTP id 5a478bee46e88-36a204a51c8mr5854369eec.35.1793245676251;
        Wed, 28 Oct 2026 20:47:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm11064286eec.19.2026.10.28.20.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:47:55 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 3/3] arm64: dts: qcom: nord-rrd: Enable eDP0/1 display output
Date: Thu, 29 Oct 2026 11:47:28 +0800
Message-ID: <20261029034728.633495-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
References: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae2c356 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=wlBrTx1nK-2z6_sN8T0A:9 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: Z7Lyqz--s4cCLQH0Jpa701KUks7Sx3ED
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxNCBTYWx0ZWRfXyx0Hmi7GjBuJ
 03NQDISS9cMR8bZR+9udznkGD5De5qV5X+8/SB87pwsCQNk6Uechzl6NIfIsEI/R2xrWa1BocJc
 h0/lSaFwOvkgdvLtwFf4TckbQfGEMXc=
X-Proofpoint-GUID: Z7Lyqz--s4cCLQH0Jpa701KUks7Sx3ED
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxNCBTYWx0ZWRfX2SE9rVlvKcwD
 EK0WbwM4vJAxfFzeuRXZMJ5bQlCnl6DD36JdgFzgiWab7tE2kNLwJfkaLi3Kr2NyOnHxzgQ/tVd
 5U3lVDRc+xdeYGk2lGukcXnHu+p+M/TuVKgelaptyZlcarNj/REuNv7MMD7v7OKI1DwJgGR/SZY
 gPEQ8cXwEk2aFt/40Amb0fl6g8oD8QKRRLRoDvAHw+bAZcWH2mmjbIHdWnyUl9U99nKzUxiewmz
 tOlLVh2VctETR+Z46VkQ6WQD1Yu/JGrjCU08poTB7iMmMzkuKZ3p+kd0BEhyHojH4BRJ+G4RYRd
 C3hSYuDX0GDPLB1LSebFxruivqzD/XOfTY3p4JB6NaMPlT27s77F/NcoaIfK5xl/Tms/TZfyUk7
 LKISb6WYuOFmj4RAta0FXtdZLay9xOC8vdIlcozSDrTdLnYcpBoY4hkWHoPFDdio6SXNm0axhfS
 maPzMN7ZuKdc5LIsY0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290014

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Enable the MDSS, DP0/1 controllers and eDP0/1 PHYs on the Nord RRD
board and describe the eDP0/1 connector, its 4 data lanes and supported
link frequencies.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..9e3a74f8deaa 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,30 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	dp0_connector: connector-dp0 {
+		compatible = "dp-connector";
+		label = "eDP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp0_out>;
+			};
+		};
+	};
+
+	dp1_connector: connector-dp1 {
+		compatible = "dp-connector";
+		label = "eDP1";
+		type = "full-size";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp1_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -377,6 +401,44 @@ rtc@32 {
 	};
 };
 
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp0 {
+	status = "okay";
+};
+
+&mdss0_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss0_dp0_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
+&mdss0_dp1 {
+	status = "okay";
+};
+
+&mdss0_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp1_connector_in>;
+};
+
+&mdss0_dp1_phy {
+	vdda-phy-supply = <&vreg_l2h_1p2>;
+	vdda-pll-supply = <&vreg_l1h_0p9>;
+
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

