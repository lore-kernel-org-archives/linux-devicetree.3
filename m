Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972854;
	b=Bl3wZPWAEGkl0Gkb0Rnth2Qe/E7ecbmjRjl02Q5p0JHP5s/fP7N7lT1gMNuqQO4OVMKD
	 wuFCgZKL5fyp7XUQR5ExEfi/vzWbfU0mTUGWEr2zo9tl3fuQTFa+UCVrrMl6KtQNPr2cp
	 ghQxEkVAUoAo/su+v3zfJabZJxLAvlJvRy/idx1pEzh6PDwhEKel5EJEyqyM3BphHB6L+
	 dg2q6Y6Eys4AUWUKk4OHXG/8YzSS4qNeAzAFM022imdnJSUHY4TLdI418GC1vFpN2NqGq
	 EEIThhTzdj3MuE5t1cSMxCJObY3Xhc3HPpPosUYLduBG5QysEQ9yePU2n2BYbwnSVog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y5zd7borrxrnuo7aPTvNtZsQhCDXC6ETrT7Dn6psmaQ=;
	b=vNQ+khKt+0O6S+RyDh60k1iZZr4f0HjKdLKJX7YsYjsNR6p1Zs4Jhy/a/jb46lx/zRQo
	 LKPpLayaAZqLXFhyo0PT+TsTEZwLZlLX6OBEtjkziC2WMENe+Aqshzajqc8cZ0ZRdRNO/
	 vfVlTZDpx/9bNaTl+P3LRjAVwvHTi/ElmSPpBI03+4hen70iB9Es/leOJbZHVG4FpOEl6
	 MZWEs73bWUdoxy41XhfsiACU/wT+XOPIgqCJXq7djnQzaEuUs1/79wvsGwoCe2dUgT+7C
	 NVftbFKwK/dOytWnpmo7Ytvd+77Zs9Flp4fUrMziSJhnCxBmbfrsq0w8nK2dO+6uusA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzFDB7V3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke0st6+t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30599606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30599606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzFDB7V3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke0st6+t
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V0Xh3121739
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5zd7borrxrnuo7aPTvNtZsQhCDXC6ETrT7Dn6psmaQ=; b=QzFDB7V3eUCyQF6Y
	jTWUHL4Frb8aL5dBQbjwFfFzlmiFo4PLVfmxw7QcWAWnaGBNtsXC6ZlTUDVPTcaG
	rbfiD/FiMOD/ORWE5A+5+POuHDVaBzCOf5rsBRYl0nXTVrCTRUrETogIM7JbSnB2
	GpshTeTcj5zDkgxRHmgApvDQN/tndT2kMW/uBgWZJE5BbK51qgrhtv4r5i0ZudWz
	xB7eW+ZeNiU/QoIHgrSs+J4j5/e2v89rUpQkHiupaCPz2n+C40a04xakdk1VmuwG
	KMuKe6AwCxY3e1aGWLNZUxdAKY9sLszvA2fqxSDIBGApAXaSCeO8YDo6Wx880nDF
	J5fuDA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9gykb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:34:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b691cf0eeaso778413b3a.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794972851; x=1795577651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5zd7borrxrnuo7aPTvNtZsQhCDXC6ETrT7Dn6psmaQ=;
        b=ke0st6+tfJkP0uDSPVKInBc+s8bJolH1AXIJYPzjG5VCWPIwwcMTeMkf/Dc8asQCOF
         MlFLY/CNSRTLxtry3i1D5LUsUCi7XMv0z2sZ1pp9+zISubCFsRZDEPBrQ+Km9jT5DuVt
         NoCF+Y5ztyzhH6bRUbmXhez0OD8ou3mYuuqKPTdFE5d8xeamc/8oQX+IBW7HOPu4z3K9
         lgqdbR5MdhNMKemQlwAzcHtBPdagLHnvaeXQfieBJx8DF46TTFtlN/6eG8tGVma0bXT+
         qaxOEYf2ZDLHfUCFmHe/soznY0kzt+u82aPk9NGdMfeIAGIEShDZhfPDlvq9Mh+93uxO
         h8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972851; x=1795577651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5zd7borrxrnuo7aPTvNtZsQhCDXC6ETrT7Dn6psmaQ=;
        b=apFX9B3zmBsCExiWbzhqnHAL+6nkLQXRDEIRlF0blfbmIwI1gRTUjMAmZ/pZyv7imD
         k7NgFzuioryS3whno7YeHk3R4ou2jS8dGWevtg8KwszXpva9GtQSQIR5hMXsw0z/hX1G
         0EODbFtqNSs4t1rqoc3FqHNoaULQmaBfRoxdStmFCquxq1wbHh7ToRSBfYBoe32XhKdK
         Vidcwd+cLpUOVXUlfgykF0aD0RsL06kaFjosBJdfUm6DF5DJv1tOfV95q69AYScwBiLT
         EZjJbirigkJ64DezbXxLqpIPbYQYZbK3wxV28oXo/w67HKrNT75ovcV6k4f07ewykGEN
         CG4A==
X-Forwarded-Encrypted: i=1; AL+hErHyAb7i9WPNa9P5sxGX98jaiIuTSfFj/iDNNEKkfQQThX3aLrh7QTf3wCebKeQmjLf1n7RLPGAve076@vger.kernel.org
X-Gm-Message-State: APuU4Z8ajPXuNsiUTsTL7xEb8gPnozMyGCs3CxuXzbnU6SYLSIszJMkF
	lZAGQoNfFjp01lAMeEAENNbtj7urmys7x5/AohAXQpXOAp7UIEQbgMPR2G16gn0Xzc+uobS7Hcq
	LmbNu/POzI28ky2e84ZihggFlj/uim7P9gefuuUpqECPDkwyX/KUM5v1qnI2Z1npY
X-Gm-Gg: AYBFou2gAPgEo5V5w6THv2K6eiIsJwT0vtZ2hFMt+Zr7fxeE/mHUzRepIukOyZnKF5o
	z4joO8ZZgGM1Ga/XQ8z55ftwZfjm/b0EAdNq6ef4ebKGNhytW5C3uJ/F61mUMJdVuQHS93jMrz6
	SjEpIKa2lW1PC/sksU7CV8o7CEgjzHcSwnc8LdnqrNcpsmZVBT0v/XmuA4Qvtf/BHWI7Q1FbzVJ
	iLSYQJ4LiUwSh4CoIX49/1k0eLXcXJU1B7nQM4D23pkqSs6jg8x70qOZ7YK1ZVJq3O00NF6GdZv
	rl2obFBGNdBkWdbp0kaKpzmit+wD7AMroSkvrFLoDz2am5PpJrrRWvkWsv/Bfch2L1zIr7T/a0f
	g6foKuNhX6uU1fU2+KpwwquGA1uNG+N5z9u+a7TBS2+fPHR3C+XV1mXd0BkX6vsGsAlKSb7EdOR
	giP1TMvvsXwCcfKvq4K+Nb2d4/1KFKkwD2UvbC3+PLHQ==
X-Received: by 2002:a05:6a00:13a6:b0:881:4b47:f305 with SMTP id d2e1a72fcca58-8c5d101dcdemr1132148b3a.5.1794972850968;
        Tue, 17 Nov 2026 19:34:10 -0800 (PST)
X-Received: by 2002:a05:6a00:13a6:b0:881:4b47:f305 with SMTP id d2e1a72fcca58-8c5d101dcdemr1132129b3a.5.1794972850507;
        Tue, 17 Nov 2026 19:34:10 -0800 (PST)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c5327088sm431644b3a.0.2026.11.17.19.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:34:09 -0800 (PST)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:33:14 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: maili-mtp: Add WCN7850 Bluetooth
 support
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
Message-Id: <20261118-wlan-bt-v1-2-18bb1b059a17@oss.qualcomm.com>
References: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
In-Reply-To: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794972840; l=2058;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=Cv/gIda4Fl9M2sm39HQXP0VgMs/shsqTRt4j3BjUb2E=;
 b=7QBahbqjxRvz4Iy1cJSQK7td0NKbK8eJVLO2p5e98lvNGFXlfpKBmRpwUhLjZwx5i4V5Ns35x
 J7GdGtTZ/onAUdxDLeQpcg1f/kdzIbDN7+Q31t/UK/gT/CewjdTM5MP
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: WVPuHNcxVoWQa1WIP8nf65ARcWNDgXBm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX7o2XlyrovgEK
 2jrhqay2mPIy0lqE7ovnfO7i7BjxSQTgkrORfQVIqR5AK2D1VSfYqwDEzVFjX8Rbn8XBxfpke6p
 wCP9ybD7z3fvL82NSiK/wlkx2pB8kRE=
X-Proofpoint-ORIG-GUID: WVPuHNcxVoWQa1WIP8nf65ARcWNDgXBm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX0kV9LzySkSAU
 WRyugmew4ox7nG/nglXxtViAlbC2GUlxUqZWTPhpf5cUaoEPQ3CZxM6xZb4YM+Ypg76FcBTP1mj
 XST2DYihoROurwNBTz85MeIL8w9qoFQ0H2FPss5Cb2fk7I7cazmaeFSZ1VJ2RiDUv+qAq4FeosI
 FAooZwm6ffGtaiGZGJE+TBtxYoAgeZrUL8mrRiYYjqQtmGFqbYWis5kZ2JacBNRrKT6GAZ5lSuR
 Cr5A6B9GlNZnbZIjOePjvEtWFD7yFMzkXEfUvRvDHeE3GkzlJhXngg/kJCFfCBMFFcCzNLGKkiT
 IO/NeydmbgrK2FZUk8w8EJh+nBWTZfPM4WvjrX34HOvl0toyQX48Nogzm/gEHLgzMqyJdwyYV/u
 C1+T6LopDgi+3+7oudAUbM3JzwzfxpeONfY7VT+sY6CTMAkDc2Xckt8nVoMJCma3WdHIOAAzf4r
 MJEkeuO7WtE1vGqpcAw==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd1cb4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=R0MM0Ny8nPPmWmS7J_kA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180013

Enable WCN785x Bluetooth on Maili MTP board.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 35 +++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index a3c2016eb9053..49fccc43c9828 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -146,9 +146,10 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
-		pinctrl-0 = <&wlan_en>, <&sw_ctrl_default>;
+		pinctrl-0 = <&bt_default>, <&wlan_en>, <&sw_ctrl_default>;
 		pinctrl-names = "default";
 
+		bt-enable-gpios = <&pmh0104_c_e0_gpios 6 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
 
 		vdd-supply = <&vreg_s1j_0p8>;
@@ -178,6 +179,10 @@ vreg_pmu_wlmx_0p85: ldo3 {
 				regulator-name = "vreg_pmu_wlmx_0p85";
 			};
 
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
 			vreg_pmu_rfa_0p8: ldo5 {
 				regulator-name = "vreg_pmu_rfa_0p8";
 			};
@@ -872,6 +877,16 @@ led-1 {
 };
 
 &pmh0104_c_e0_gpios {
+	bt_default: bt-default-state {
+		pins = "gpio6";
+		function = "normal";
+		input-disable;
+		output-enable;
+		output-low;
+		bias-disable;
+		power-source = <1>;
+	};
+
 	wlan_en: wlan-en-state {
 		pins = "gpio7";
 		function = "normal";
@@ -996,6 +1011,24 @@ sw_ctrl_default: sw-ctrl-default-state {
 	};
 };
 
+&uart18 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+
+		max-speed = <3200000>;
+	};
+};
+
 &uart7 {
 	status = "okay";
 };

-- 
2.34.1

