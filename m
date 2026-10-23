Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746161;
	b=Qxvl/JlD+nWMoGt+aeCxGV2VGEjKi4etVa7NFl4O1Rv/GL2QP5JoLyErLPvrc6OVFE8+
	 oFKyO6VVLc2colCvbPLqEUwojtmj5h2XyhvDBAVFeohA2ppn12SHuj2kI5vTpsCaueJDp
	 L0ewpmxjnG0WBVf8D5WFVIBe8gitFBTB9/RCWD+5PkjQggxjKZ2/AUK+/tay/5tKayWMm
	 PtxOn9oevsLDeUzQDLpvLiZhMIZOCt5j3exRquTckYdFVp5r/Qw8MWk+oN+o/G6OtKz7o
	 QdO7gnszbA3bXQQzF9taKFZngFCYnU0JrjH3T+3SN7nrkuHD+HYwKDlaWM/JXD2IorQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746161;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cYYMNDlDg+Fz3QZ1LcfnI+mFxsAjoUWk2Dj9tVMozDE=;
	b=J59XMF4uBrC5aBuD5HR1wGWv48m4SF0zDeQKqBTWLmxRIMJEFiHcDp6+e5PpYbZUAboA
	 Gb8dOxyjIiISqKn4Tz9ENHWXsL2OPhCJ4WnOVk/yUAvn9RwQ3X8weAFUT1YBTb9eGqCWl
	 5EQcGAESQmQONsKjDfZaWUKbkgmSWJjJ/EfJXvx7yxu/MtWnRWXs4hiLVsTNZkek++/Ne
	 Ov0ImYNjNa/mZz3aSnYWWIFqo500ySmmAifQrUSgzrO2sfFdlhFc90YB3lfIVonVnyNNu
	 ndAQZyqWE7Q+fY4CZtJ1hEMFssuy5LTEa9Cw1YruVs7P0oAp90Nmf9u7+pmBGeWfLiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OaiqGzmQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cGP8i1ni;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736D960A2603
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 736D960A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OaiqGzmQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cGP8i1ni
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FOfq1048555
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cYYMNDlDg+Fz3QZ1LcfnI+mFxsAjoUWk2Dj9tVMozDE=; b=OaiqGzmQ+0jAiXs5
	RqeBVhafy44Ra/2HPtMN1nNzDuNV2JCaOzjCtKbPiqDtoRB+ntIk343NJKU/ne8Z
	UF3ECisAG1khTTwhpZ/C+514QWd9IkJSFICVVFYjkC7cNqIiPX9EDYdN3yFKQfGh
	UW74XVhZ4MJdBsQwn67bSD2zbdc+zbGBYHvxbscIXiojeSwXIaJcRvENxqgQG/ov
	vpAqMmyCXqEOXjLpXPmdckuGFCsAnXO23mJwjYSk+N2NReDIxuig+/tzDc3RRIUb
	j17kA1JJb925H2/CRCUF0uNA+EAj8OmxSTQLcmlj8EcsZW1QMM5tretlVdK76M0I
	Mk8FDg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbjwrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:02:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917baea8e5dso15360186d6.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746159; x=1793350959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYYMNDlDg+Fz3QZ1LcfnI+mFxsAjoUWk2Dj9tVMozDE=;
        b=cGP8i1niyuBO19mfEWlUp7dKdRmBWiAFudJY/KscmlWAUc2ExK5dcCNo1C2/9tGW3I
         1Qt9MQGdrFHzGAoC8cWaAtuhUnpod+Z/VgJexehJyuTuoVRJ439SNtENAcoE3r/o94fd
         vmyrnDNBrwPHGA2m/bdreWBfGgD77vJbnXvR9wr+AS+nveNrwaDTMO13mnVIXG1f88P2
         I9koMojZ4gjF3N6l8ecW5xVA53Uw3ongCiXTm1QF+9xOzBuRtDBKMBzHQYS6otpapasc
         w1JcXdGN3uRMkIyb9luyFUJgcfY4c5QpmM2ACdcPkJ+uq6DLmuGVX94LWRtW8afCgJWi
         IMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746159; x=1793350959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cYYMNDlDg+Fz3QZ1LcfnI+mFxsAjoUWk2Dj9tVMozDE=;
        b=WrGmveroPCMcEjepfWD/MsnljJ7QUtL4F8Grl+2jrED+CBIrwht/ACDv8UD3+G42KW
         yAD2lH9WE7lvNAvI/Yd9GJxlvwnXiruuClm05QE26ElS8lunvV+HQkxl/e3xr/zBbw0o
         qXXrxU6Ocf5fgqm/iBVg7n/4AT7mrfjv9+fnyD/+CtzLtcMmQjxJxqrL3dbkc6S3nKz2
         /VDNF3fzN9KgugvtUSFydvP7RDP/zj2RyEPBO8RA5O71hCpXkpfQAz1Wj/Zr9LKRI1a2
         OzrcHeF6Pr19bexuBy+lHG/2nt795H/o+UGS7GgrhIZFg7ARMTRo8jGpZsSEM4T4ST+m
         WWwg==
X-Forwarded-Encrypted: i=1; AKwUvBxi5Tm6TY47A62QodltZQbWABSXh0eZvCHC3ybleYoQXBPy701NUDVSN7EQWGT9NQNoxtbMnFha4Xgc@vger.kernel.org
X-Gm-Message-State: AFq9FYLDbjzTr/W12ptoiddm9tM5QuZV8Ryvt2Ua68pDZmPmX+jgzuRK
	1WtHeJ6tBmq0U8IsqJb3isDrIkOWNNncX8pT12eYe0aIRGbNcvvHBKfp/rjvvDIMtQkzZaCCCWU
	A7pNNEMKDFtUB9IVrdAziadteSrpiWFuulbfofvGiXp+zMhcePHUJbrqB2xUjTjBJalK+CkxW
X-Gm-Gg: AYBFou2NI2UZV9DrdM+Zjk8X7LH63tYuh5s671UUiqgv+Qqm4muPRQUZnElNsMVxUAF
	GcuEFG5y4Y6CX4gkDTWGPNiDbFarCYj4WJnb2CLt3e9GoTNkfLyj6K4jcMJtA0x5hJ0KyD/eHMF
	FKGuQEPSC/rc2rBJsnsK1fy+PpvW6xnAX4zlWX9Try/wLOGWKo5gPjASXN/8hEpqym2Q0GMt8KF
	Udc06pdJbFTDsHf0e3p+zFlwVtbZTf2Uu3tOe5Rtoi2JulSE1XcpP/3QsJ4WioNbGDODDIsHh1P
	uRz6ywnRfK0FjRaLS+KzQO7ZHtHVRqc6fkOFxhCwlDcR1Tsmw7BhRaqsIYFqM6Fnxk25K2HRoOy
	CPadcMHK0PSmD38/CK5iMy3KEJYeD
X-Received: by 2002:a05:620a:1a0c:b0:93c:89a0:bf82 with SMTP id af79cd13be357-93f6f796dafmr309358885a.43.1792746158672;
        Fri, 23 Oct 2026 02:02:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0c:b0:93c:89a0:bf82 with SMTP id af79cd13be357-93f6f796dafmr309354985a.43.1792746158132;
        Fri, 23 Oct 2026 02:02:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a215437d4asm23076245e9.3.2026.10.23.02.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 11:02:24 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: lemans-sa8255p: add ethernet nodes
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
Message-Id: <20261023-sa8255p-emac-dts-v1-3-a34d778ce9ac@oss.qualcomm.com>
References: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
In-Reply-To: <20261023-sa8255p-emac-dts-v1-0-a34d778ce9ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6781;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=777rO2fg3kwhzi5ZahF5WsYMYfIWw/p0ISPkHmagl3A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2yKm5xoMVWgIFDWv+HR+baScVfhyZYFPXTRDE
 OBDxp3mvomJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatsipgAKCRAFnS7L/zaE
 w9atEACJ1W28mDMvQs8ArmQHlVOxvHnO2LQfrEn6TtV7ktRJsABcX0UKy0Vf3FJvOjPWGFmaSdO
 htkM4NrF7y1GpwIFYetD/ySjdEl6QTEzQIemk3Ct9B9U/mMWhH1XWWd8XjXf+A/pN1IG7vchCEL
 79G5piTiC0JgpFOTsGsM9UxSKqKB0U8gASZCEexFJvfe4kba2Nk6wd8neHgPx+joXqp1sd2lk5o
 8zKqxknWjJtDKunJJlie2a006pBySMmjZYcpqqT7W9/NkcYU6tneZZT8RP3Ki3dMo1jhROXzCrv
 6D6X4IDnZvXGqJ4BzpdMKNcJ8W6vDlg/eQCzdPFHa91AiBUovQ9sDXEvT9dMRJeev42vtEV86wb
 0oYRGW+La3SKr6DrCml1oukN5fw0WBntXrOUYh/UkemyZ0d7Zz+JYSKPYS2bL/8ZFV107RRnIlZ
 K29clMro2TEr6pva2kpVTLNr1cBIZ7oBrMBEpDCXhnFdUKjtISlvaTpk+q2sM0qSz9+KuNqCzui
 pp4ckSK5M9IJdxe5kJ6vSpj1bsSTnxYwKLJ7SDc28+HQ0siSlVyjWhaZsUPQRgaokZxUj5H5EIM
 /HEgnMv97OWbv0GmM5w40KrVLNuEUvjq0YA+OQnMUnXTw86hMy8w3YY8YlS77mbdiAhVuEUI3+F
 eG716X8uqltC7Lw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX4Ljzh58w2Qhi
 aFblWFih+bLN3M+MntCoI/69ID0+4ZWIk1ICDtvZNbK8TXK+bVEzG7bfOzsI++ZKkwE+12z8Qcn
 bHu93ajQbUkDhnuovgPibKOcTEAI2Zg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfXzj2mgEfqsv0D
 JbcwNNRhqtKVWSwfSAI+QUIbMJdEpoAC6SofDiboW2abGzcMt1JRzRryC0GbAGjYOGn9sxuZKN8
 2tONaOsS/zNQHESOsA8/+6VehHNi0cDFfBdIoi2wv+zjsf9oiinP+fErOp+CLZ6+9mYGe37Ab7q
 4HD5fchJu+7WDT238ThQFgYwd6WdGWpl972bZVPYF/EKE7588Gfise8kpLckP+QsRghkE5W2JX4
 Y/rYeTBl7gLC31tWDHDLKrNdrT3XGCMm3nIatZu0Ai6q5MO5qSjZ6ckB8pNzit/Vwe9/bw59Iak
 UlPpCCdcV9GTnoVQOJ8LgXOR2brtSro7FsyVuljImbnKWo8tO1+6Vi1O2lcGH2LD5nTyb8A9uNJ
 XIJ1pNoOiiVpOZwjwiiJTHwd7/pHfOZG064/BXX92R1VOcAJcwVDqquj3Tl/5SDNZ6963e0qztk
 96YP8/jG4MTYwyVdYxA==
X-Proofpoint-ORIG-GUID: wCfH9oExCnUq02PLPKQTnDB41CAbSC-v
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb22af cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=rwyBkAqmBo9_f1Gw9VQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: wCfH9oExCnUq02PLPKQTnDB41CAbSC-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

Add the ethernet nodes along with their serdes PHY nodes for the gearvm
variant of the lemans ride board. Enable scmi7 and scmi8 to serve the
EMACs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  28 +++
 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 213 +++++++++++++++++++++++
 2 files changed, 241 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
index 4c155cbc79754af632848cd55b738e3ef0511cb5..c64cfd279af458e24fb48083ae549c96cfc07485 100644
--- a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
@@ -58,6 +58,14 @@ &cpufreq_hw {
 	clock-names = "xo", "alternate";
 };
 
+&ethernet1 {
+	compatible = "qcom,sa8255p-ethqos";
+};
+
+&ethernet0 {
+	compatible = "qcom,sa8255p-ethqos";
+};
+
 &firmware {
 	scm {
 		memory-region = <&tz_ffi_mem>;
@@ -3226,6 +3234,26 @@ cma: linux,cma {
 	};
 };
 
+&soc {
+	serdes0: phy@8901000 {
+		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+		reg = <0x0 0x08901000 0x0 0xe10>;
+		#phy-cells = <0>;
+		power-domains = <&scmi7_dvfs 0>;
+		power-domain-names = "serdes";
+		status = "disabled";
+	};
+
+	serdes1: phy@8902000 {
+		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+		reg = <0x0 0x08902000 0x0 0xe10>;
+		#phy-cells = <0>;
+		power-domains = <&scmi8_dvfs 0>;
+		power-domain-names = "serdes";
+		status = "disabled";
+	};
+};
+
 &ufs_mem_hc {
 	compatible = "qcom,sa8255p-ufshc";
 	power-domains = <&scmi3_pd 0>;
diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
index 4273f47c3dffc4244ba7fd7cf10b06054c8c8001..99d014ffd07701ffde255df01a67cf808cff213e 100644
--- a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
@@ -14,6 +14,8 @@ / {
 	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
 
 	aliases {
+		ethernet0 = &ethernet0;
+		ethernet1 = &ethernet1;
 		serial0 = &uart10;
 		serial1 = &uart4;
 	};
@@ -101,6 +103,185 @@ trip1 {
 	};
 };
 
+&ethernet0 {
+	phy-handle = <&sgmii_phy0>;
+	phy-mode = "2500base-x";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,ps-speed = <2500>;
+
+	power-domains = <&scmi7_pd 0>, <&scmi7_pd 1>;
+	power-domain-names = "core", "mdio";
+
+	phys = <&serdes0>;
+	phy-names = "serdes";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sgmii_phy0: phy@8 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x8>;
+			device_type = "ethernet-phy";
+			resets = <&scmi7_rst 0>;
+			reset-names = "phy";
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+
+		sgmii_phy1: phy@0 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x0>;
+			device_type = "ethernet-phy";
+			resets = <&scmi8_rst 0>;
+			reset-names = "phy";
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&ethernet1 {
+	phy-mode = "2500base-x";
+	phy-handle = <&sgmii_phy1>;
+
+	snps,mtl-rx-config = <&mtl_rx_setup1>;
+	snps,mtl-tx-config = <&mtl_tx_setup1>;
+	snps,ps-speed = <2500>;
+
+	power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>;
+	power-domain-names = "core", "mdio";
+
+	phys = <&serdes1>;
+	phy-names = "serdes";
+
+	status = "okay";
+
+	mtl_rx_setup1: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup1: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &gpll0_board_clk {
 	clock-frequency = <300000000>;
 };
@@ -145,6 +326,14 @@ &scmi6 {
 	status = "okay";
 };
 
+&scmi7 {
+	status = "okay";
+};
+
+&scmi8 {
+	status = "okay";
+};
+
 &scmi11 {
 	status = "okay";
 };
@@ -170,6 +359,22 @@ &uart10 {
 };
 
 &tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
 	pcie0_ep_clkreq_default: pcie0-ep-clkreq-default-state {
 		pins = "gpio1";
 		function = "pcie0_clkreq";
@@ -213,6 +418,14 @@ pcie1_ep_wake_default: pcie1-ep-wake-default-state {
 	};
 };
 
+&serdes0 {
+	status = "okay";
+};
+
+&serdes1 {
+	status = "okay";
+};
+
 &ufs_mem_hc {
 	status = "okay";
 };

-- 
2.47.3

