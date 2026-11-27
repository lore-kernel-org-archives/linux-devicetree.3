Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794943;
	b=AnWA9IY82p4ueZdxZHdWERQSqDPQ341gV0sMcXna8VufqBNcfQ0ZRkVLV8sXLGUrzn/q
	 G7LP+q32yy6yYWLYugkhb7SVC7JsJgqsQiypjhVefqMKVS9Sv6jQWDQNdHTzR3AxVqsAG
	 YlKFoRFYKONrUbftIc7raAVHWFmKjkr2DfTW9XNjKouBr/m9LHeL1HomwGBh+zjc6R7rf
	 J1jVuiYPN8d0bGqjVEdxiOOpvIoeOKwPf0OrpThfosB2D5YuN7e21d491PvPMClUovJzG
	 AplH/taT75EaN0t3H4aeEAnTY40bD+/Gt4+ChvzEOoT7LdHwiBHSVH86P1bT2Qmging==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794943;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rG4kr1Dab3RBza5xdIKbdkUSrFDK0iKFNsbeuPBvbQc=;
	b=ir85YP911gbZuiNIiJrKoiYRd6GSgDRY23KN5zEk+xiTxGgh0ZY86R2/f3zvRFolZxob
	 bja6G4feXhCfKoGpnr05D37BOl6/JNQWku+qwzZKo7HsRH/6GQ43xRJ5O02SBb2GfsaIS
	 dZtrjf7EDU75L2veWaPivjToljDePMFoDBpj1X0mCdwBD+2UhIMn+lUCV0q5dEpEj8EsC
	 Ah4jnePV/lsSKj+c5R7kqDhjJk0TFlp/KQ7kB7k75HUrgTpPjsyHXizGALCxLtC1tKQMI
	 5WQZb2ndh7E8IL+9LwQIm7iNjUkUlxlKLPQkTvnW4wbrwDaB8QXi1i7uR/b0XEjBFkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VV8XkmTA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LzxJcOoP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60C1606A32A
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D60C1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VV8XkmTA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LzxJcOoP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp7Sj2711969
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rG4kr1Dab3R
	Bza5xdIKbdkUSrFDK0iKFNsbeuPBvbQc=; b=VV8XkmTA2AIyfOcHypJJ0qWuqQz
	au7QkqKzUvtqdux6pms9+IN5SP92H3BP10OUVJFismpodw7Fp+1FnuU7df5bYIAy
	vzfhL/gejcpDitBFxjDZz1SlWTZiyJ8sEqb3WF7uEWS3HMvGvhwrDFqtEIengowY
	9JsOGz6ywojNwe/aG5NLmt0wdD9IgKXN04Hliv7HqvIO14aUoWLlZp+WvuVSSPQg
	rSdRqZLDI3o4XG5UgHRS7XC6Y5nkNYwtUQ9g0T7d2v6A64Qy52ib2w4ZRVCBf0+B
	3JIYrvYdz2IGplbi4i8gynSjJeDi2wdDQb/IonnQ6KXQ3R1n59+ki6/Uejg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gat4ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:55:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f6f4fe531so1221451085a.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794941; x=1796399741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rG4kr1Dab3RBza5xdIKbdkUSrFDK0iKFNsbeuPBvbQc=;
        b=LzxJcOoPvOWUdsjuT3JSFnVpzRUjcEp4+BcVYqPfOTH6os5LjgHSUgkDnzLk36nFln
         27iyfyyHQWxEhZD0czFiqv9q3AmR1TEHatRp5nQ4/kwO+Hr7CTNcV7k2wRZii7lVNXzi
         qEgEZIKihGA6YiWfu/0rwHGPtU+cYUpgbeZVHVmjMZaWFfpXTyJtCNc0PKbKpKUfpMkg
         7N0krsnS1pN+QTJP7lTnWMTt8AFZw0GA/QU/L1NlkpSsjIjk1b/37ck+ld2om6qZHFuv
         BLupdq/sM+SqKhkC2/7yLN6fJyLOJhgHsDXqdYcTjknsbXpNna3ekkXY19cSgnzpGZr6
         P1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794941; x=1796399741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rG4kr1Dab3RBza5xdIKbdkUSrFDK0iKFNsbeuPBvbQc=;
        b=pkcdox0VkfypCKGlanEkBH+9E1If8iXMoJS2OgaEALyhuGh21m1ndpU3ON2ewEmf0Y
         1EC01SErM/ri9t+8QyFt4NbWICo2pkgxnoB3KVBzZHgh0kEA6Q6O/5+puv5a0K2o6ty7
         A1gdISRmRmoaa9wWIafNEkZr47PbplZuv4o1eOqYrCdB03trom58JnMz3SEltfoi4pjX
         c9+zXrpBjAcmJLl23jwdNiWiGMHm6vv32CyPpcmOxmFPhOgdaI+MIXHrciF0XmyeFVKS
         O5zxPoNwjb0UeTBb3tXbGv8Rz4+hr9d/QJfGc3HZ4XiP4JZld5WWwh5BFYB/5uwSnIt1
         scrw==
X-Forwarded-Encrypted: i=1; AL+hErGrtFnNFas50Dzu7hYn6WL8etoR1h9wrUDxQpZUuTuIH6CFf12pZ+pnnbVXGHQCTtntUFPTOTSrIqQu@vger.kernel.org
X-Gm-Message-State: APuU4Z8XJgaqwOCRAn+1uS+Ch1XWK80ZAiOq269ocpPQ2y2FDu5afF+z
	8XmF1l1uBzWAubN/12yNEjoJgXzgvSPXeKweQ6Mck+pr0pO6M9dY2q/pR+cXTCKw+JUji+YJxfk
	yP8RYwrvWnZtPh6FMTdYp/Ira/7Zn85n4aSgijKElcNDvLivuGMZngkOX56pL1h+l
X-Gm-Gg: AZFdTZfr8izM4YUBhkktcJPZdwq8gEoz3iOzeXZlNXnJCaX97Zu4/mqj2Um1ufwntcd
	4+O8FQ5WJZ2eUYBaCFcaBzdaKPEySudjHv8CnxK4Uckb2mZoZnMAxS5uRP9w4G/oVA9FBDiqBmX
	YLu2IrGJZ1+qjVcEnYYt2tJK1svsObD/RD3LALRUHFpUT1psjxDLPUihbtzsyWYAoov5vSP12TL
	CuuGLBbSsjL1AdyMFmVaTLE+E8GcmD2ElDzSN4T2lx+SGOGjX1Dmf0hyXc208GgL3pU9vzC3n5+
	oSpUoOPC+a7WQ9ATzrUV7UFabwR6v/BOsjOF9IyvypejXC66PXp2H6KvlQMANPGVcCxrFmCKSFo
	aq4UGjSRXGVuIxRgtdqCllexkXh9VwHAVtxvseyNypxOTFfSUC3vXJc7Kb+hegNLJ
X-Received: by 2002:a05:620a:44c2:b0:945:dd80:75d7 with SMTP id af79cd13be357-949ba9a5803mr4563577085a.41.1795794941208;
        Fri, 27 Nov 2026 07:55:41 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:945:dd80:75d7 with SMTP id af79cd13be357-949ba9a5803mr4563572085a.41.1795794940729;
        Fri, 27 Nov 2026 07:55:40 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:40 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 5/7] arm64: dts: qcom: glymur-asus-zenbook-a16: enable WCD9378 headset codec
Date: Fri, 27 Nov 2026 15:55:18 +0000
Message-ID: <20261127155520.358909-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 80FObEXozmyLJMFzQhX1UdimsdjX98ol
X-Proofpoint-GUID: 80FObEXozmyLJMFzQhX1UdimsdjX98ol
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX17GwUrvgyQOH
 qXTVyqdM9xzG9/lSBjJD1n0AKktMK2NUfNOAnJnDNqgguRGc7nHt+IgfNYh2ma4kP4MpHrnenSk
 UAfD8AF6QN1r+a5gxZDG20u25ccJiaXGs17ws2OWdqVT5iE+r817wuoOKk6IUsdIgV7kSCrtycN
 xhkGjfATdyq6sJpqcByZafW80hy2syHJnVLLZu4KOVBlAdViZbAiFgYRX0/nMuYNKfvO0pX16wb
 p3hjVW6Tl/Ymg4k8V8Fhtyi95BaAw7vOPyvzkmgRkkDlBrru9JjA3juY636DoW8zVo8sIilJBAD
 K3O3RFl0rWaTz5DbxuR/HxzUMJF8XtC3PVeX8qTOshipP/uxifunFBL8sAvGsw+WcqwiYIrrp3V
 h7nsCdLbwhhzmG/XVHXX/1Z3CgV5JXeD1bthOdIZTmMOTxQZpLnRd4WpDaWYAjFsrE3+n8uwXaz
 tyOz9KzvJVY0ytKiTZA==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09a7fd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=HoGlWSY98BlP11pXvYkA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXzNtccXIV5wNc
 LruY1Csv7wwBHr9/7CYyuCeBV/QGPQyttWfiTZRFoQ2BxlLsA8GUW6SQ9XiVHVH6jE7ZEjJdDvP
 T9PlR27qVnq6MOeiY3EUQdWXys7aF0I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable the WCD9378 SDCA-compliant headset codec on SoundWire,
matching the Glymur CRD wiring.  Adds vreg_bob1_e0 as the MICBIAS
rail.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 91 ++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index c253597b5a5a..3922d3eebdf9 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -272,7 +272,10 @@ sound {
 				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
 				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
 				"VA DMIC0", "vdd-micb",
-				"VA DMIC1", "vdd-micb";
+				"VA DMIC1", "vdd-micb",
+				"IT 41 Playback", "HPHL_OUT",
+				"IT 41 Playback", "HPHR_OUT",
+				"TX SWR_INPUT1", "OT 36 Capture";
 
 		va-dai-link {
 			link-name = "VA Capture";
@@ -308,6 +311,38 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&wcd9378c 0>, <&swr2 0>, <&lpass_rxmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			codec {
+				sound-dai = <&wcd9378c 18>, <&swr2 1>, <&lpass_txmacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	wlan-connector {
@@ -351,6 +386,13 @@ m2_e_uart_ep: endpoint@0 {
 };
 
 &rpmh_vregs_b_e0 {
+	vreg_bob1_e0: bob1 {
+		regulator-name = "vreg_bob1_e0";
+		regulator-min-microvolt = <2200000>;
+		regulator-max-microvolt = <4224000>;
+		regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+	};
+
 	/* Unused */
 	vreg_l2b0: ldo2 {
 		regulator-name = "vreg_l2b0";
@@ -763,6 +805,45 @@ right_tweeter: speaker@0,1 {
 	};
 };
 
+/* WCD9378 multi-master: swr2 primary + swr1 dependent (DATA lanes 2/3). */
+&swr1 {
+	num-lanes = <2>;
+
+	qcom,multi-master-mode = "dependent";
+	qcom,multi-master-peer = <&swr2 0>;
+
+	status = "okay";
+};
+
+&swr2 {
+	num-lanes = <2>;
+
+	qcom,multi-master-mode = "primary";
+	qcom,multi-master-peer = <&swr1 5>;
+
+	status = "okay";
+
+	wcd9378c: codec@0,3 {
+		compatible = "sdw20217011000";
+		reg = <0 3>;
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b0>;
+		vdd-rxtx-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		vdd-mic-bias-supply = <&vreg_bob1_e0>;
+
+		#sound-dai-cells = <1>;
+
+		qcom,sdca-compliant;
+		qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC Secure I3C */
 			       <10 2>, /* OOB UART */
@@ -920,6 +1001,14 @@ wake-n-pins {
 			bias-pull-up;
 		};
 	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio191";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
 };
 
 &uart14 {
-- 
2.53.0

