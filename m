Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDAA3A1E7E
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318564; cv=none; b=GOTE2/TPN28T8XG+zb8Qlg/P6/0HKm8tGRYSWnCBCngLIlynrffRVHG5loCBj9/HsOSFX+N3FxZVrcYmyHspSRcbokoz7uiUSiuwoPx8tsKmzc5SEgaC6Gj39RAgXRWsudO4oEt4/Bc2cu6qa8sXTZbAQWxgeh54VjnJ4PJfKxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318564; c=relaxed/simple;
	bh=O0ITinEiBDoqyNtfUbyM/puvl4+BRtjPN1CGKUba4DA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DJK5Q213hflZMR1wQB7TKddt7mfYJezlT9itSr9J2qhbv11t1lGunpBgCmLJPfEhbJFdXQcSaw7iZRZvknBzlUl5yfj2493tQtptuWySLGJopxuquii9JlNqv7fh+dcsbB8+9sQ72fdNTrfGfAzhYHyyBAUIiEpWeVMgUNTxUF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0mrGx4K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhmiALvL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0mrGx4K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhmiALvL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518dPbk3563524
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 12:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gl6RrGCb/bv32859x3E1VYQ4SH2J4WZy2L+TCOfEc9g=; b=N0mrGx4K4JtV1ruv
	EJChM2z5p99YNBJaVb5kSHMspT7rNu0cFrhujlGmLyB8pj4x11xQDOFc/cbtBWOd
	y3PTnGbkusssw8IEwL4ZHcyF2fbKlsy/vhF/1sYVtY9n+AUeww/ku1d0/r60JHMi
	GPeq+zQlrauSVBDOyFY0tyhWTBbezwMRwbolP6sBdBcqipa9Ie9YLDUZiFf+0PQ4
	TtP8QPrsrXAlJsFIjd7HKKxFws5bn8IHkXX3fANZi1RDMl/CrjIGPolBYywNR7Qo
	wMNouhWDPrqcns2fyxqIA2rIpkv4eis/JGgU86kA7ED1VsVaeb/GTzL7Wsuw10+y
	zzSKNg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxs1td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 12:56:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c331eda3so17036515ad.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 05:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780318561; x=1780923361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gl6RrGCb/bv32859x3E1VYQ4SH2J4WZy2L+TCOfEc9g=;
        b=EhmiALvLy41HwzENteYKy9qeTxfaVbr1ZpujHB+Os6BWqqdWI57Eq3H7Iw+Hc7oOkU
         zB7aKvrn+L/h/lKvoKsQZlHhx/7k6SItlmyOgzs0ZjcU68IHW1aZPtugmROQ1aEWJGci
         XQh6r3lmngNixvMDW5Y6UO3cPdh4gsAsIZd4xhFraYsZrbstGpWgVkAvOjfeTikZIOCJ
         JoSpOycnh1wKg//iHL3KCPV9pTT2TRL1BM4SiyyyhnqIjCPwdRMXhlUtDTQ/DVvE2qcu
         e5e0pIgDrUkeEqfJ1WQrV3jGJ+lr5HNh2d1kUrNASxgSb+z7OUVrd0vpUNachm/iGMjO
         wg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318561; x=1780923361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gl6RrGCb/bv32859x3E1VYQ4SH2J4WZy2L+TCOfEc9g=;
        b=Lw2w8+qCck9L7ijgBNMttticeerTXhds9gsHn9RcZmxqkp41YtW63KyO8NQDT+K2Ok
         NOn03b27D871iEDdPD78SfuTu3l14XmEq2Azb33MvBkaljGllnhm7TtHqGHd2jdiXAu1
         GbIcb9zxO/ot8ARQcTmXfN9lInWlD6KSXiKZ0vlTfi2y6S4vWSoMGQIRa3nrQ9YFFgjj
         05K71pKxEYi7LX6Itv564GVlYhWQWkD8SvyFot3rlmW14pbvWweWtnVXmjpiaq3Tyc7F
         PBxhgYKv49taRhhbwtKlE4sfhOlR/tjWQHPsysxldCkdRm4eWH6amH4t9ydNz84hNliA
         eS/w==
X-Forwarded-Encrypted: i=1; AFNElJ/EYZAZ9fpfMTF6zbq6iiWlS2R0xS1dseqQXZjKgAQOY+G/fafactiXxDfw211iGpB7xkwrZ29ZMjOG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1S5kQbQm3pmHKz+BHXitRBo8ocLjxjpL4UOZgLtHeD38BMNPJ
	2Xli7Wzo/3XgHV/HOv1JT7hLpZaAvqX+GfZjKQaUG60F1b+cHzdVkA+8AKKFfAfTmmf21DWeeHD
	5lR7JbFAhaN1xL+ZELvTIH+5Sb1cSmkxCyp3PxSTA8XDIJYvik0OWyjChmGeXEvAl
X-Gm-Gg: Acq92OHgQIGaQr2k2BwpqqUJBccxMo3yUwV2E+jHIdEMcNmO29Ga/8zOvFAoMyov7Nl
	uu2zVE9wFIw2ykbiooHu8SCMivvyKiNYMU9yZN3og1cS0uZUEU2EfFPCf0zgKqjpJrpgnfayx7J
	zQUelzJ4xUan7oBmgcKkqWJ7ri94/nlISAk/X+ffgbam7NWXP3JtH/+RA9Cq3W5QwtinUiPge75
	8Mdfro+8N6goFomr8aQz/NcjkMaExwmV7mz/QuF2edZf+STAUohx1zpOHzaBUz7jAe9P/2dQDKc
	jfnnmvFudyY+so4gSs3NXQsBq3n0JD6hK411eKKvVh5SDkG4xDzDNJExjbShdXzr0ZG1wPA9zbB
	bFidE06UkX67tUaaJ1Nt6KMrKWkSyc13pk4isubZHz7e3ViQ=
X-Received: by 2002:a17:903:3585:b0:2bf:2243:d4e9 with SMTP id d9443c01a7336-2bf367c1458mr133131115ad.13.1780318561106;
        Mon, 01 Jun 2026 05:56:01 -0700 (PDT)
X-Received: by 2002:a17:903:3585:b0:2bf:2243:d4e9 with SMTP id d9443c01a7336-2bf367c1458mr133130675ad.13.1780318560657;
        Mon, 01 Jun 2026 05:56:00 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a21f0bsm98584135ad.34.2026.06.01.05.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:56:00 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 18:25:10 +0530
Subject: [PATCH v3 08/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP and
 MPSS on EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dt-m1-v3-8-0fe3f8d9ec48@oss.qualcomm.com>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780318512; l=2571;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jZ5sk6mDCOuUmvLcAvbMml5Kmz0BhTO2YLQnfm6VPW0=;
 b=oCFQRf5uugbIlMfn3dajQc67joQaFaK47HWl9OtR23I+WDu/VDYFCfc8DgIwVAldaSgNeGgh8
 cpaBde0NDQjBkq82ad5QmDXqDZjCQv6UyY5uUwbTAtOzs4wkKkbGtqX
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: jgg2oOZlTTDrzMBEHzhuXPuHEaVXKQKk
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1d8162 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nu3v8zf0uA-Bo5sjUnsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyOSBTYWx0ZWRfX5GWmfWpbJ5Ts
 8iMfGNd67mH9yDp7XUllJwGwqV5LTtezn9yXSstP8hZM57qWrzrP85fyLB4oX7NpwDg4AiWnkgo
 YP1sstBDCqXrzPJVWSVN8j5iSSWv8rYBhWEe4lCLXxqUNlWF1/mS69K415O+cthjzdHpRB3SXWN
 bEUKhRyK8y1td3H0wz65BV62wC9YnDUSioyE973e517gnLLhMCXwvvqmNFg6nJHj4Tb/HRmmKRQ
 5ddcFXTRNb5q6fYolyYaXrKVNYyduCxdacmVGFopzg0JFbAiQ0cai6SgobfQvaiQb9bcgj+D2i+
 2KMSDUzJpSzzfjL+pI60n3rTwKCKxPnAzbCIpctdj11E5u/UO7XjORdU1Bfw5dS5aRyz74NrhJ2
 BcXl8CRfrTJBcavJOzyBZ+R6nymu8btJ+c4+8R/J29RWv2mhPJ+hAcwI/+QBnvqastDdmfdbq3O
 GOaj99XWSxK5rCuVdTQ==
X-Proofpoint-ORIG-GUID: jgg2oOZlTTDrzMBEHzhuXPuHEaVXKQKk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010129

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
IQS EVK board.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..b112b21b1d79 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..e62ba5aef71f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..727809430fd1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.34.1

