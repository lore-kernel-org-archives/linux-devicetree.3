Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458214;
	b=ezVtD+EYLsT/o5lAAWGXFE9M2s8qGZl8/ysYqqy521d+eP6O7RR15QP4bx+e8cSwSw7X
	 M5J7sG4AKmB3w7r++OICU1hbH5WMFGDW1pz4o7aPauKFsV7OAagluJICU3qKsY6gX7ezA
	 jXZ+RIr1bM02U9yaYGJ4K/hLtbFZlnpGk5XpzlPbOx23nkL7nwS7UMJcLJgcWoYrbWGMq
	 BplNw37wIhb7XfxUtfYIslirQu5TNtYbTC34QmMU+oATN17p2dY19bAPHpOaAt9Yu4dfS
	 PTPJDtTBruItJCbCDm0ntRVLmY96n0n6+vwb+UQ6OoFSd0CyFI4hSEVd3xrGgF76WPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jM1/FvrJZ72VkZhPelEJIN+yu+PH9w7xc5m4Mf07sB8=;
	b=yWC5774RQ7Tq9YiCN6CBJwz9i+nxcCXDB9DfFc+XGbbOXhZn20P4CrrS/W27k+kZT/vx
	 JZB9lMjzEnXvjtvzCN5o7WvQEKGgCtNgAPAEp7FqT+LFgSVFwsbWPrPHjwosjauScxRwr
	 +1YehLUKz8AEVpXkRjPYFyfG9FGaUkR1Te8AmtyOm0vpQ5f9UR6TI7+yEOSWRXs7GcT4g
	 c8sdhzKorhSrL0h+zfeCpEhsoNxYut0A5vM2GV+/x3vxd2nA72VsMpGQF6MjctDn7PCxt
	 HnTfrCo4G4fS2QkxfaXfmWy/NeRPBzvEobO3hqzqLa4f8+TS51oKhY0Qo5poE6ITFoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuXnm4r7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgmAdCV7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF687606F89B
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF687606F89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuXnm4r7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgmAdCV7
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZZG13607597
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jM1/FvrJZ72VkZhPelEJIN+yu+PH9w7xc5m4Mf07sB8=; b=NuXnm4r7/MZsW91P
	slXnBUybmCS1KKywYK0AWHwRQApA2pDwphTbAGaSONAojlBBprppOwjVjVo35Ctl
	4SuDQwal1gxfvyfGJVMR6IYHRSjj1kKz6WHsPQnS+uXTrmcMTQqkWMBvE9qz6fWM
	9swm3LuA5KUgpYq8VSjsmlTH7QK1pwpbViKpZjGZaLsnOLwXOC3rYeGjeYHH7KF5
	jga8vpV2YpnPsFqvi0PM0DnSRmNBqaVfQ/XeP11RzXUu0QsAO1121OxN4MY++9cx
	60O88rUqb/N7kesQt/Qe2yu3X3uW8Tax/3ftRiB7bxkje301qrLpK0SLdmZVRd8l
	bIDEJA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawne45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:36:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7247713eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458213; x=1795063013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jM1/FvrJZ72VkZhPelEJIN+yu+PH9w7xc5m4Mf07sB8=;
        b=OgmAdCV7MGx2TEWLbvq3ZFhGUpYFC9TCE13hAfAeFZPHsMDr/eqIt5IqEu2GHodiQW
         m/mJZvKx4HTnfnRB3H6rX1IWffG+H5HUlAsfzCoNYiDpA4YWZWfCMbA77ErOa/iSqGm5
         rRTeny9OH7s7yylA4DZXqcywF1iFb6Vc5UxyU7Ko5HCvArJfJrTu2l4OIphyMBgiMm1K
         HE++BByVkGyjPbp3iWnQBmkFdCjXQvY0aOS+RM4i+zSz2YMGoCJiBtdK8lhOSCYkLdFX
         EfBy3/N3vnw1pXjQ1+EPGn2HtrKMh+HXc9x3RAfnVTM1rudJICkR3AapuEUEY1S1VOrl
         homA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458213; x=1795063013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jM1/FvrJZ72VkZhPelEJIN+yu+PH9w7xc5m4Mf07sB8=;
        b=jhA/oa1ZlZOdLGxrHGH0+cBzymO4moQyDK8uXSgZxTNhJoPuxgSBkupLIHlAqrdvEg
         i8qhJm2pnC4jL9JQM/kNgti+HLMxPKh/8Uq6RHyjzG5k1bi9BJKm5SOyDYIwUDypu8sF
         r+d1i9SbeByKJejzIiNo4djn0Zt4oKuru8og8imnywghf6d0TtmxkZTdOlVzKpyX9vLn
         gecMm5MP366jgV4gzghx+gbDhNW/UDVrOEPqGf79JlebI6r/ItaoVdb0leSULz+V9hAf
         ZVk0J9RNP1YU4wejoWpYGL2nfDPBROdJtLZzYPbuRMAudtjA1TnHAQNYVP03rtZS9Rj6
         TQMg==
X-Forwarded-Encrypted: i=1; AL+hErFxahXPT2CQLdKyHESzD45960uBVg3YwgSLnzr5BGwONthZ7oasGEbvMRD8CSveJ+Ev/omundqQQFpI@vger.kernel.org
X-Gm-Message-State: APuU4Z+U5WCtxFBJWNIuDaeIe3EhDEXR6jxhXaiVv7NDM2cabc3sLOlS
	kp25Lm5gwn/pZxucrloHMmOEJXX4wlWIDv7nAes73hP2/CO9ruwGSTFphHY5Wdp0FacoPTGl0hK
	DJBnkW3JUmdmzBGGUQbzBRwERDAUaG2sybif2pbU6V1w/XCdkuLs2Jau6L5RKWaOA
X-Gm-Gg: AYBFou3s8kLFd3UA3u4GTiC6yJR2OSytESKBnbNtfNV+7h8oOz/JrM2EktL4uci/82r
	mNBf06Y3Oi0ykuj29YmWg/QsH/7SykimCh/arcafscLZDpfblf4+ESwhYb5fHO4UoFayccRETnc
	5DE331+JQ46K2APINn9+dj6yJ4RNLrQZ0H1bO61a/C8ghDokARUkijUBuFShLrVx6MoYpFXCl8t
	7l2YzY4bAv5qbDUUBhD1N6SJt/0TC2Y/hlecuttZANe4qAhQYaPnFTS3Iw3ntE5MisRSJ+zOgac
	jWZQg7M30qUFji/twPJlbKHrFrWt2Gr45GgWQhOvmqd65ATm7gJ7jZ1IgtWKp/IQa4Wh1FouJDn
	WGvWiHNU1txoPf9WhmCITeTOIyBMPvalJlxuSQb/GT0ZRSyMCsV/tqevgmsqGLmvjdpYCGbAl/E
	uBYZuJc0kjmIvdTeIhWch2uAm6q8BNjoTH52OrLOYWTwPzsreXwFA2SAlOJ7gTj2B/N6nQh38ag
	6iQnNY=
X-Received: by 2002:a05:693c:8801:20b0:36c:a084:30a4 with SMTP id 5a478bee46e88-37685c7a193mr5060023eec.21.1794458212298;
        Wed, 11 Nov 2026 20:36:52 -0800 (PST)
X-Received: by 2002:a05:693c:8801:20b0:36c:a084:30a4 with SMTP id 5a478bee46e88-37685c7a193mr5059993eec.21.1794458211572;
        Wed, 11 Nov 2026 20:36:51 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:51 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:25 +0530
Subject: [PATCH v9 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
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
Message-Id: <20261112-08-dts-v9-6-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfXykp8BnxFhg0u
 zc7WM0Vy5fZuOsBhiZPgcmowExHCB9PWtiP9fBLm3ivBWgXQQTT9Buh0fykyatx9mykQ8S5KsLb
 Y8ndNesEvPP1Z7Exs+ilsre60M2hV60=
X-Proofpoint-ORIG-GUID: 69e7ix0JG83O9Zk01XC6Kkv5U-vBnIq0
X-Proofpoint-GUID: 69e7ix0JG83O9Zk01XC6Kkv5U-vBnIq0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX85DcicvKixbp
 tboxrYKmBUhovsZrj6sl0ryPpagdHEKaQCDe8cYTz88EleEmgxafdpHBdwvq48r9/0Rw3xukgKf
 aXsrYlTkINbdRlQIH/oAbVLaorjuSvmKwJpyk4QdgZsNBSJ1PVB1mz5NnUY5S9t/d+zL+i/SS6U
 W0oxLkR47N2ywp2zan+YaHMmfsTFLa53+IG4jFxBd8mSfM6DjAfaD/JEVI+UbbKTFuuH+SfU7jM
 qQVvRu7AM8n5dYbBHZb4J29+ys/rT66yyP5mIQeKfVCVBVs5bGHaf/SnUSbCFzpATVgtqN+50dp
 8s/cW+mEN2Mh2l6oRs/Y185k3wrNiP1MGApXsLPFCd1boRzq3XDszWzVqKTFlK9AdGNUzpTWxZx
 P/i2D6YQmBqXOKZ4WgPpNRkCmRY0Jl0HhJujYgn/R5TXHmbm5fAYhooUjm/JFLp0lt1YdQm+4uX
 bJJwmQDldC7uT8swF8Q==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af54265 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=oTQqOnWIMzOobJ4mAXcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

Describe the SDHCI ICE register region and clock, and enable CQE support
for the IPQ5210 SDHCI controller.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  4 ++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 43cdb981a4ba..aa8b37d837ec 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -22,3 +22,7 @@ &sdhc {
 
 	status = "okay";
 };
+
+&sdhc_ice {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index f3d688fded80..267255d2980a 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -164,6 +164,14 @@ opp-1416000000 {
 		};
 	};
 
+	sdhc_opp_table_300mhz: opp-table-300mhz {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -456,7 +464,25 @@ sdhc: mmc@7804000 {
 			clock-names = "iface",
 				      "core",
 				      "xo";
+
+			qcom,ice = <&sdhc_ice>;
+
 			non-removable;
+			operating-points-v2 = <&sdhc_opp_table_300mhz>;
+			supports-cqe;
+
+			status = "disabled";
+		};
+
+		sdhc_ice: crypto@7808000 {
+			compatible = "qcom,ipq5210-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x07808000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
 
 			status = "disabled";
 		};

-- 
2.34.1

