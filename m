Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BE624CEEA
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 18:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363651; cv=none; b=gIeqvOBnMzTb+H5if3txkyaHf9Bw2nEyoSzs8rO6FZRZU0u9+XbNQSSwS83uYtt2/wkBqhnS0j2ZcVKBYutsdkg74tUjl1tqfvI/lUNm86RRgDBRiollKe52L9f8nsEaJtY+m/u/IQ/0/4tPe0jTMwwnf1JbzRasLVZPWhYcEiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363651; c=relaxed/simple;
	bh=DslgyWQhqoS3FgUQ0SixGQYUc2U8QPcs7eGUdXnZmfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pQT5p4DtUdbWlKdFbSo78KSgnMT8gEpTv+qSq5k64YXqPQ0cerlNvv0khjFsnm7OtV8RSWNHGBqN0RIKw6s0Zwl8OTQNkrDPeA887vyBxg+eWaJpnT2NxmzzDlS2Mi63Sv4Xs0ZgYYUg3Ski3kyYR5tgO16J2PAeCLJbAzpccDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIlPtDE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1nQYTdH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIlPtDE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1nQYTdH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6Mx947319
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 18:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mzAnK24B5Og
	zyCTXlJoJUUix70FZiSCDjrespS3gvYI=; b=UIlPtDE2b4OtCjevzArJ+AkWgpk
	7SNhYKWX4SLQiyHvmNPxjo+NXBfaWUOiNnhWFOKGANAw6pHY6lqkjbPVOsjMkp22
	W8dRyw+DeuayeIp+L4vJ6l4+eOqJU1ArLG+CE1rgLDAcvSh8otBl8pKCndxxLhwG
	yFFK3kC5/w5xUc/5On5BGHkZRnyVxa0YIk1vzxDX8jM6UOHFEbyUW/8YmpT4Bc+j
	NZ1T7OqtGp5Hk3AmDhNULODVBOVwOMbIIwxdAGV8ynrjJFPKLxWS53pas+jT2aZA
	A8IraQvZn0QxoLKt4IYDHED5tIGWp1v7n/tvKNhBb62ac8pGDNmWqWwXM/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h52u8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 18:47:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91ed0e140c5so609660385a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783363638; x=1783968438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=C1nQYTdH3j+TP35XJS22tnqFg7mhBIgNdAu1G0HenjsKJ4D0O8Ztov2qIZRetAp83O
         pyT70HYtEeWH0XNDPo2SjVK4O7IsY+EzXAsMcSyxpGgq4Z5aZft2hoayxcGkL6OqRCcC
         3/SnFAVt3jOmhBG6QX96PnEmNWsgyB22y93+Q2aQ4rJqaLcW3DqBX5GTORTsoOZFIe7I
         42dPXSMeKB199WyYUDM+r6uOqG0EOqetTLnFOxBRf8s5+f7IHwEbKSoYxUSPKjgfXHTL
         f3SJfmhDJHAoopY1isqLDfxOr02yz6V2g5wDSNvrDBsgoe88dRIhl/sTLA+s8VRFB65T
         P80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783363638; x=1783968438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=cI1AzS/w0rYY9zoerBL8eFWsLvxNP07/6itqq+oOyVplPaXH03V1yKTKi52aqRg6GY
         m5be0RD7zE2cue0mNX1z+7IdjxYV03hckOZ/eyE3nTvVxGmpk4cMn9YdBuN7d9zrVHH2
         mgvMLVBSCJEvx5Rt3oISIp9w8rk/7et5xU52ys0m06YLgjRK/E8GCgBv7e6Rc2Oxd2Te
         fqsn/AANC5RfGIaR6jMsLPxQyDzPOZtr13YpV/fRzbVxo3iT6+IebB4GQRwSWo5Hp6X2
         dF4vxF+0xGJE+oDDdHtOX6QUo0YqJgWE5+uRaxu9+UVr+P/ui+4r0kLYwjDjhPRI6q/T
         F5Kw==
X-Forwarded-Encrypted: i=1; AHgh+RrWunTrTvlTLnUaz5QZPQLJEPIZlqTiGX1V7ZIEooFbshZYRYKTcnpunTisKmYuVadHAAolBdmcxt9Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxXoOc4YXuW4rcgjjMRQTp057WRbS1rloVB/Tq51a1ooNAeLUMf
	CzVeZ2v5HFVacFcffJbGiWHjwPb9fSJ3D/n9RQiyGHS0g3v2bkl7wcZMPyca/Y7iRCwlJfTTKpX
	H7OcfUgIAnYF5ghq6h63j7tp5Qd5Wl69zITzvcqjdAGjctIcfr9dZaHL4gYpBEHfF
X-Gm-Gg: AfdE7cmqoLYTz1WpxQT5xa+ShZrCwNCm+vo4QNJG/zPmNL+56K1yRbQRa0v2Z9ut94H
	JjsIuC5vVuIMEQp8zWAmio/3Enk1rxLtT2LsZxrJ+sQ3oy7meUW8WYBycoXNyY1EUxmPFVCRWu+
	kHzk61VZToRqLDzepu9xd5v4FUml6OPppSeUeYwktNveP+Hb1C2gn5Bep8Xpl/HEkN2F2+EqJ75
	FSANzq2HtjbighiRViMRadEcLvgeGTNqm8Q0HEpgWGKHFexI0wO6DAXwTKo2bu6woVrm9sSdrwY
	ys/29nKzE938Bu1Uvk9WfcrNMVGFoA1CQ2MGDamfOweu/uXtLSWZOuf/CEO5zqVrttnzeAJ8fHI
	VG0EzscGILykAay3CH7bhUxbxlJ9Q9/aSh5XaQkXurbmoHA==
X-Received: by 2002:a05:620a:31a3:b0:923:8612:f15 with SMTP id af79cd13be357-92ebb4e39damr248195685a.18.1783363637916;
        Mon, 06 Jul 2026 11:47:17 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:923:8612:f15 with SMTP id af79cd13be357-92ebb4e39damr248191485a.18.1783363637451;
        Mon, 06 Jul 2026 11:47:17 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b077:843a:5587:be05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d56sm3858625e9.8.2026.07.06.11.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:47:15 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v5 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Mon,  6 Jul 2026 20:46:48 +0200
Message-ID: <20260706184648.35613-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Wj7shy108FylUrLyCAwTmMRf2-3mqGOr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX8takYlICdU49
 tR+4pvJrqo6u6AqkKxo1cKMudBR1B97iqc63jcH9QtjNSE+irNEm/+CkrqFSDfktJr459S/uTXJ
 yCo8okNcmmjJZNv9rvwMRhLlg7LrQxA=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bf836 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=8S540zSUgs8tgqG0LUMA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX5OqWe0Yvse7b
 mvGAMBJaovZ6YnDfC3jv/17y5ys7AVmL6qrHXv3dYyfbLNJboti5jZqaHsgUceqX/5LQv55/ori
 rR/eiU0QmVSeLJviHFfHEXOkH26C5EI1xhwlzQHCSsbg52EbqbRHzi9f7PLkFgiX1wjhjrJpc4V
 bkPYqFB/Gq2b0XaV9RgGQ7H6H2E4mDYM1lb7jybmG+svjc1A96KyKuSBBwHpoEsgQeUKGpf23GM
 fzYZWJuild5eLGAdeKdapYXXfnIhPYNZJgrqqHKeShVdu8V1Dh3rXW9lQ981q4DAaLL57CQqgx6
 VMgIEQBJ0roEsIdiRtTeicwkfaJ0f33B3oDJJnBOIFEOXG/M3Egx/vj2Mn5+bez6YwGhPpSmrBY
 njcEBuGIK5fFkW2kHyUq9ngXvfGY2G2NSajdT0jAhE1Xrkt9jlfrosCVAPy7zvW0X9EjBVkrtRP
 bg8kKonZso2UgM80FGQ==
X-Proofpoint-ORIG-GUID: Wj7shy108FylUrLyCAwTmMRf2-3mqGOr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060189

The Lenovo ThinkPad T14s embedded controller exposes several platform
temperature sensors that are already used by the firmware for thermal
management.

Expose the EC as a thermal sensor provider and describe the keyboard
skin and charging circuitry sensors as thermal zones in the device
tree.

The keyboard thermal zone defines passive and hot trip points, while
the charging thermal zone also associates a cooling map with the CPU
clusters, allowing the generic thermal framework to apply CPU
throttling when the charging circuitry temperature exceeds the passive
threshold.

This integrates the EC temperature sensors with the Linux thermal
framework and enables platform thermal management using standard
thermal zone definitions.

The EC protocol currently does not provide a mechanism to program trip
points from Linux. Consequently, the thermal zones rely on periodic
polling to detect threshold crossings.

Using the charging circuitry temperature for thermal mitigation provides
a conservative approximation of the platform thermal state and prevents
the platform from reaching critical temperatures under sustained heavy
CPU load.

Without this change the platform reaches a critical thermal condition
and resets under heavy load.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 67 ++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..ed5ba3a428a8 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -979,7 +979,7 @@ &i2c6 {
 
 	status = "okay";
 
-	embedded-controller@28 {
+	ec: embedded-controller@28 {
 		compatible = "lenovo,thinkpad-t14s-ec";
 		reg = <0x28>;
 
@@ -988,6 +988,8 @@ embedded-controller@28 {
 		pinctrl-0 = <&ec_int_n_default>;
 		pinctrl-names = "default";
 
+		#thermal-sensor-cells = <1>;
+
 		wakeup-source;
 	};
 };
@@ -1729,3 +1731,66 @@ &usb_mp_qmpphy1 {
 
 	status = "okay";
 };
+
+&thermal_zones {
+	ec-keyboard-thermal {
+		polling-delay = <5000>;
+		polling-delay-passive = <1000>;
+
+		thermal-sensors = <&ec 1>;
+
+		trips {
+			trip-point0 {
+				temperature = <55000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			trip-point1 {
+				temperature = <62000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+	};
+
+	ec-charging-thermal {
+		/* EC trip points cannot yet be programmed. */
+		polling-delay = <5000>;
+		polling-delay-passive = <2000>;
+
+		thermal-sensors = <&ec 3>;
+
+		trips {
+			ec_charging_psv0: trip-point0 {
+				temperature = <55000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			ec_charging_alrt0: trip-point1 {
+				temperature = <63000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+
+		cooling-maps {
+			map0 {
+				trip = <&ec_charging_psv0>;
+				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
-- 
2.53.0

