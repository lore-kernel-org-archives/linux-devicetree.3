Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04F230EF80
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 13:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443312; cv=none; b=a3ZCqPt9w6gyZI2pU1qGKQ67tRv9vD0/KbdAjux1OwFyuo5zu0io99kLBFCKT+bOcaXc71p8q8picHQCOwFnxf6ZNck4lSRSxuOwJk7kObQij04xBBTUak17DgH6BN8TYwyK2v6buwHZUTmLOj5RlLfK1WheB1RAxMpYIQfcMeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443312; c=relaxed/simple;
	bh=Zh7owfrPe68zPuCdATtsN5m4NFkKRByH4fE6EhrQ/Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=poJ3cVWDvf75GiEwR2TtxshlPn35sDctefZXdXMY3mnv7EKeWbCOIgCWu2T52sj2meB7xK3qQXKAPfEeFXEIibA7jOwyboWaJl6VCLTaxuYm+TCssNjVe5i2MA4EDl2qOY5lUB3h5EjcTLIvUvQIBidV9E/RAfqZsws6fq1udKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJm99joC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KxzVOl1f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJm99joC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KxzVOl1f"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAQGG539324
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 13:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9zD9ljtTSDb+IPvv+yzOwg
	HFWU19hJCt/g4cTDgfKbE=; b=IJm99joCr7W8+UJpZgU76ApPjgIU57CGygx79y
	qY6wb3CHqJt+eKRaAf9WbtC5pJ84PIK64FFses+Q/synzujEU1KzUWn44gZ1pw7U
	AcRGLZhoFkuqPTbfsCnkhUQfhCQfnIAhxGI0c8RU8VqAgnKkWxkXCq+/qh5qrD05
	/bZF8qvG1aJnNyoYPWZQeu8Crt+8ONj5Xc8S9PgnXZ16+qdcommXKR1ikEBDSfA5
	iegaJcL71Qo019t1rKl9FFcb4Z2UesWNAIWJIxlZJWj/7O2D9LHBn1/Jtbv2dEFx
	fHtuhztRKyt1TCqK2CPjW/JjWd0dzh0wYOGlPEvDo+d+FpOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx0ue1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:48:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93915f50a5cso218572385a.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788443284; x=1789048084; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9zD9ljtTSDb+IPvv+yzOwgHFWU19hJCt/g4cTDgfKbE=;
        b=KxzVOl1fGChBwctZUpuXpkCCIB2fWmRiiEaDayjEWUJNfTvDQp9FjrvM25VabWluV1
         U9xiEv8KqMulcOrEZdHW645S5UusmNME/EI31AeVST9R0rnojMuYQHSNs/KMTe1/Ha8p
         CzIVTASPVIRG6/zevBD5yycFMwZrB2Iec3isFg1Rw3OBJM5qwJT0nr1uNsbl2oiUHJd0
         kPdi59C+0Wc7EofpcOC6DzJUysjjkf7fUWtKp9xJhHmc6oUCMwmzRpGrydcgBmobw0T7
         XKZM7kH158bwn+HswFbiWSP2UNSL9DRNRneDmzg9qxjtKeL9NbSOfEs/RODFQCh5wsXt
         AREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788443284; x=1789048084;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9zD9ljtTSDb+IPvv+yzOwgHFWU19hJCt/g4cTDgfKbE=;
        b=m+ymfbJNTMvD4k7vF+vY9WYDeP5dqgiSZvkrhCGvyNbHJkkkkBjxpjek7SdD15RzfV
         2lsSJsmxwl7Qz6rSf3baehzVNfhpPtHpB4BuIu+SXs1REvOtab5RG+OtrWG3nv6fraO9
         BbEZYMeZOfRgii9Ta1rHzzLkAlCqM1waIMf9BxAmXAtvaELf6UNzHHDNXc4BXKZ8DTFb
         tf8Xp0rMwRU8GvaJ6HceK4PPJOG/tUUENno4Sp54oOSKtcddUaUkXY+y+MAZ3kZlPDf2
         W32dO0YYe54ACkLoLmsvUnEGHq8JffYCeLjn9DuepXBb6URrcHbfnj4CR+8vFw/67PGg
         szgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXyOXvYSQv7DonN1lRJsZ65vjcF4TOKTpyxR+EQSYQUvyd36nS4cGGDxtt1YQzXgBaOWC9LvkxyGvj@vger.kernel.org
X-Gm-Message-State: AFuF++kX6omLwYvTqac9sHmM4nSG4C4oux5+BzZ5bYN37B3cE51qHjd2
	ler+8yY3v22YizlkqIqbmceiUKqcYwNcM+Dh/rkQ8iv0zyiAWBKxAUBmsedV2IV9itHE/QIbT/c
	1yNItQdPtolRI/xCRPoCg6NGaBaeyIXd29E8sHL9ndOMG3fvygA+rNScLgLASjE6A
X-Gm-Gg: AYBFou0wcjQWSRgw2fLhfuUEzTOjeGBONKJ2qwgUxVn/0apUhFr+0ps62Uk56Y6y/jF
	rr06AHTIlc5ImJl1W/Wdhe1iqaSVLqifZsOiT+0VvdA88e3DMfgC9bhjcFRt/A3fSlIRY6hDqTH
	hQ7IC/cHCkgXC75/9z98aa6dOsn1ntWLup6B6XKq4EXgVmO248KZivjcEKTJ5Z37eSr3peXEEyz
	hCqxr2HhFY7J+j+WLUPI7j6MaAq77/fXWOGOnx1Yp7/BLMAwLKzh72q8yaD1Y1H6TYTTu/KGZv1
	Q5tv5BsELa65vjEN28U3roxnB5SNhTEkVKLaSxqD/Zn/VSz/+rxWG+xRgiFXif/a/b6kkeBC2Rr
	j525DlA==
X-Received: by 2002:a05:620a:1a20:b0:939:72cb:baee with SMTP id af79cd13be357-93972cbbc65mr308643585a.37.1788443283764;
        Thu, 03 Sep 2026 06:48:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:939:72cb:baee with SMTP id af79cd13be357-93972cbbc65mr308633485a.37.1788443282899;
        Thu, 03 Sep 2026 06:48:02 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm112897815e9.3.2026.09.03.06.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:48:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 16:47:59 +0300
Subject: [PATCH v2] arm64: dts: qcom: eliza-evk: Add power and volume keys
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-dts-qcom-eliza-evk-add-volume-up-v2-1-375fc9ecc3b6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI56mWoC/5WO3Q6CIBiGb8Vx3OcADV1H3UfzgOArKRUFYZXz3
 kO7gk7e7dnev4V4dAY9OWULcRiNN3ZIwA8ZUa0c7ghGJyacckFrXoKePUzK9oCd+UjA+ASpNUT
 bhR4hjCCrQoljxagQFUk1o8Obee0Tl+bHPlwfqOatd3O0xs/WvfcPkW2+P+YiAwZUITJR10KXx
 dl6n09BdinV50lIs67rF2lBaizpAAAA
X-Change-ID: 20260824-dts-qcom-eliza-evk-add-volume-up-a73c65710667
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1949;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zh7owfrPe68zPuCdATtsN5m4NFkKRByH4fE6EhrQ/Qg=;
 b=kA0DAAoBG19EyQCVFVYByyZiAGqZepCi8pr0mtgZyv8jfhsMl2cZIrIR0YYeFOmbbWESaYVUw
 YkCMwQAAQoAHRYhBE7z7hFOeo8qyqfRuBtfRMkAlRVWBQJqmXqQAAoJEBtfRMkAlRVWVG8P/1qr
 dBCJwU7MUnb0a+Istp85Kta02QcsxVugUpP9fXEfuMtxKFyPM4DptP71OHQ4T8yKnaXeKb3X6r6
 NzlIQMmx2qd7HEPKGskRpesHs9AUKjzQGghWEjGfPU+lJefBWc+Bsvz38ob5rlObgnl2Y/DZeYf
 FwaBg1qHs8da7tIKjqS3ErVJYNAKNeH3R86MwQy3t7zNI9FC2WjkgHwTFeBf3fYfxD1XiYXZmYl
 0b2r37T1bqElQJ0iZ14KYZJSOvVszMB9br2DjXG9+twUaG1hgFzN1dtsOJmTlevHXhitzojp8su
 MSqkYRDw77qOwgPZ/mp7n+I2zhCiPVCsUgpfwT6IgUxRJZEu18I1GIrz48wZjeq/206T1InlZmS
 Gp9bvTg1heE/fVSaBb7WTaMIDy35eniog6bGeNKEandwusY2WfNM6K5oNXuW5VduS+mdEH5tpT+
 zbx70TdznAemn38EXeyoEmL3N7yOL+vV/Gnlw43zPemzSD8rzAJjLWbiIMGABN86tQPkImyarLk
 axwjudSb1lNrr3EIjJfwSvQCkYY8o0PqdUAgHZtifWeojPW04yTQohhXUi3dIL4MDV75CeFrk2b
 tWcsMtiix6Yg+GcUXw7FguKB5+NIuX7KYstRzpCTJ2AVnz5C3diPOIgq/pa3lu8WZSOdwpAjHoS
 xaN25
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 7ikKdEGwU9kRdJSponOewtYAPyv7rCuC
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a997a94 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=WXmoD6rnIWV3ZxB4njQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 7ikKdEGwU9kRdJSponOewtYAPyv7rCuC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyMCBTYWx0ZWRfX5vKuhLcHBVpZ
 V6jRP6Zg6/XObdJQTmuNOfUjg3cqh1V0IAoOqa/+EPszpLIl7UfEZRkgnVZCSKW/nd1q24CzpI3
 ofapbm78Wj/yzVx/tdGX6s6PjXXVI11ERtWVXeNT04RyAVEPTYzriIh9HiVIhCoNYRld4CrB23z
 ePHqrLCbGP1QDHcWK4Lz4mXsIiMeRN/za+AqmLO+hj9aDf5cPiZ+SixJAr6R8wMkjpckfQcPoTz
 zxCTZVcPc5saYRrhe3a+8SYdOooRjXHRr4HyPQBcO9a5Xmmq5+RhIwEi8e1F4a1iprS6ysnTk0g
 2t+v5ffcVV0ba3xSPRvD4CTKeEqaa8Vw0jHWcYntQ9ZkUnGLDTrOOg2CQDv3xrqJjmSpZ9aNWMg
 nHt0xEmmX9z+1TjFMkvn27pFby3TwGJCUiwxdJGh3up7MxLTCjmOLfSk7LKMwll1y7De/ch9Zgt
 NtHU045HbrJfsJaTz3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyMCBTYWx0ZWRfX8SLtKqbIi51O
 mMIT6FmPzHW0POtTmjaLc/97aCtmOETBv/4aEOgtWk3foqGcsSmxBX6QQHYggfWfwlPwRzwdboI
 8c08NyePYAS4/cIq/xXDkkuGITFeTGs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030120

The Eliza EVK has three tactile switches: SYS_ON, Volume Down,
and Volume Up.

Enable the existing PMK8550 PON power and resin keys for SYS_ON and
Volume Down. Describe Volume Up, which is connected to PM7550 GPIO6.

Do this in the Eliza EVK dtsi so it can be reused by the Eliza CQM EVK
board.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260902.
- Moved the nodes into eliza-evk.dtsi as they will be
  reused by Eliza CQM EVK board.
- Mention in the commit message that this is shared
  between CQS and CQM EVK boards.
- Link to v1: https://patch.msgid.link/20260824-dts-qcom-eliza-evk-add-volume-up-v1-1-0cee16886d43@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 86f2be6e37c7..6c5cc47a183e 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -12,6 +12,19 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm7550_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <10>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,eliza-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
@@ -157,6 +170,15 @@ pcieport0_ep: endpoint {
 	};
 };
 
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
 &pm7550ba_eusb2_repeater {
 	vdd18-supply = <&vreg_l7b>;
 	vdd3-supply = <&vreg_l17b>;

---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260824-dts-qcom-eliza-evk-add-volume-up-a73c65710667

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

