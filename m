Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625769;
	b=2C09MKi3DjNUAtxqxafIjOmaL9Yi/jtX8WJEsaoXNgnI4REgwq2VO8m3d1P1nTt1hlf2
	 FzBrV7QQlJSaRrIvGO4msUZWz/Nft7eVliBYZgptewfk7iuM51e++b4HLen2cD3r54Kyn
	 L/2dn3e5Mjt+cQBNZISoNXwqnQSyCinVFxJAzpXfRaECUy9txxfzaWMeseahM8L7uUPpl
	 tKpSx84zHiRIv8uHkq2fZDP/iXmL8Vt3Au3AXxuyjHcWtGypbut7UMbzvHeAsG7T/GFji
	 D1/NL+oDvBVo6E7h0GTCR4B1MtJxw7DI0Cp5NEVKVeEUUphgMXpn6K3ZGNZrdglBLkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=;
	b=xDrrOQonBC7fLgwGsEw2PYhJDIjVV2Bm03uSve35yanE3yXIMDcaOAdVoEUg25FjfQC3
	 PndOoph0c+lvVVCLIHK7wMrxoTBkW+DADr++jolpmjcluP55M4vw2q+NAE53SUs2FwTdJ
	 tGr8Jd2Nw13YCjKKCIqR4brG7pL8jdWClfXGnZYQUKUazDhtvCEEjZpNOAI3qM2VZ0ypg
	 HOx8fRG6XO1eQgqYT/Dij8x0TpJ0QXfKJdHTQkDJ9u/2d5bWooDrSvc7IoMVHxbNP4Acn
	 Z9Pt4Fbdd5IM+NyL9QXWvM1GsZUf761VgJ1x0Jb23NlDN0yn0ER1/XCoD17BVXsYdyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KhzPPwlD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TRqSzZJb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD0F606A33E
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD0F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KhzPPwlD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TRqSzZJb
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE2Bk013378623
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=; b=KhzPPwlDNmzZsIoR
	H00OnEl7/kX1tlPRMexasZ/r7bTyeloozJyEU1lxIw3W0myb77SSMiuLLRw8wge9
	YpuOc8GxA8hUmmF+PTcdYCBRk1dcGYTvEGV3U368p9j8lT+WdDmg3m4dvV2g/G36
	MJGuwCjvdGtTnwFxOZx4cAlzcPM0Y7YDwAk2ehrjJozpKmpOkNIY+QFAJxZd7as5
	pDv5Kv4gNXLqMWah4QFzpnfLxp25i8m1lwnBQNiDMX6VNheRN+denX9OcbD7GEBB
	88FuDWne488pwUthOAMJr9J3QbC4AqG83DwIQTd/ZvmKLWUc82vLWodDxSmHQo81
	e9ce8A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxen6r3v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:09:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-339628f2bbaso205929eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794625767; x=1795230567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=;
        b=TRqSzZJblMUO4su1u7Fa6h1vaEgSUBnl89L9HTjzOoVf2zMb4Fx/ycJm99hg05cRm2
         ZU5sthBFwslwGd83xmPzy6rZy/MEYLkAaBS0GBX6f3awnFkT4bGdhfc1RKPVrgjI/Rdd
         crpeatHXHawwx8pEqJeFfgyBI0T/tvMRmISLtRooD7ytIa+pRgaEHk++n3JZ9+Gbl0Sj
         Qdc3PtNmvbW2TlgT7x2xS57LrANzgHju3ecY7pctJC/gcRDvDuZEpv1MlRgB2PS4pNRP
         71vlh6CM4v6OnZ+z7DKbRvRSlFsSk4Qw8n7usNY6+CwpZ0u/rrHKTHopTG0NSHDRuhrV
         wZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625767; x=1795230567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ylAMagY5rPOxgGjgaSIcrF7Y//hs/bYbPqW/zkj5EBg=;
        b=NMKhIR0G/AjHc/u61hOfr8QhxoyAxNs7LBMi5eVaNnJUfsB40gfc0RqP+Bx3SAxFyy
         cVAYiWO9XgZ8AwjlkC0gEhK1di3T0lPV1fr3SYC5S9ZGlLJ4r+KkVPDjPqq/CFiT6MMZ
         sIAqGHd+65z8Ieq+h98hm37JEU4xaHQB6+tIC7BXmtgwADEs6zGmhyJf/yhUXF9upyQP
         G4gdR5wdcAsPqzZD01EivQ1hZurFcBE21XvsCW+ZfP7zZpdJZ0w/aYgmXSt3dieimH5t
         nWCQ84Uas1rDc9IsXYwsgVcACZaNkA4vuDz2ouvqrFFk25n5CfATPpNNqyuuFmtkjoD1
         EtcQ==
X-Forwarded-Encrypted: i=1; AL+hErHObyCbmdWwg51SP0J2PWNv6t+ZTzKW58EibwQhXWFWZdBgoQsf+OiwUVbMmJgI5GoSQjn+dnY1/Ylm@vger.kernel.org
X-Gm-Message-State: APuU4Z8DKq/64D9oBYI7+YatWzx/2jxns6HKM0yD2R/s5aCH/w1pS1yR
	kHxbv9EsKWCkz1yKfr6nX1r2AJOMwlRkaceYkGwlwPFzPB/ALIVvS+MsU+HXhfrgOubsjORkqPp
	lXG7WOkG69zbi62OD0oS+qK6xF0HIKsj1ZE5aHa023KeI1fxjXmkCtq7aZjzm1AOBZaVd7fDe
X-Gm-Gg: AYBFou3yXdc+XPIBBgCvesgrBeGk/F4zw0TzHrXcZi0uUFgWrOsc602zbsjjE10GFCr
	+hxN2v26SVNRrmoMM7OMz89OGHWrhvTzNJ5OlsuIRG4OwdtccpKmirrccsQbtnebA5Nyn5a0ZsO
	6xMSS5FcUtj4Aypcuc5sNXqPUre1oIjOw3baz4InrMFWzIOyY0enaojLYTGcGOvFDlI3rJDNykB
	ujeAQsGKDD91iYFe+Qq3nUkTAmlLYatfFszZUsZgzmDCR/dGutcN/Py7++obYwkRFLgyWDK2aEj
	AZ90Ci8q1y0EE6ZhHG9D2yYagsWH6L5hAS1cV2i0EpZVAFaodtlOOxXyvCwv6UvCyUpRn5Z3wzQ
	mEXUZQDODqthKC7OTdos4YJEPkGpSIpCB4pO6F0sreTWLACNyY5cY/tlweUL+ej4yfrez8XCphy
	JHNqetj2Jh0DF1vkMVBBFdk3xjzgmxSoK5
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37964e03109mr7463951eec.1.1794625767032;
        Fri, 13 Nov 2026 19:09:27 -0800 (PST)
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37964e03109mr7463890eec.1.1794625766486;
        Fri, 13 Nov 2026 19:09:26 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm11158803eec.16.2026.11.13.19.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:09:26 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 19:09:23 -0800
Subject: [PATCH 2/3] arm64: dts: qcom: mahua: add iris video codec node
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
Message-Id: <20261113-mahua_iris_enable-v1-2-b7107e1cbcaa@oss.qualcomm.com>
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
In-Reply-To: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794625764; l=2554;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=NIhQBb10oAVEd9idm4CYEPbkBor2YqP2ym0YbzLwWeE=;
 b=QDCsI/X5bqUbfX8kcms02h2BT3/1Mzvp2V+vSAQiU0RuybZJjEeM16F6UTFxKdTALiYzPzjRe
 I5e3u/0E9JOCF9pqhPP7PpNPZuQBpCuJtevklmwBBRohvgMH10knX4B
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: Z3Ec42Bd9-pu_VLJxbP9aawCIc4Fo3U8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfXxO18mvylGiib
 dc7Xn/0ebQSk8O1yVF4KYjrgLx7SvYM93WUo36ky6bc+wmvNlXv3Zzr6aa3hmspybX4+cEMjDW8
 8z8f1bVQ32kG9NcKYeBQmvlgKywQ7V8=
X-Authority-Analysis: v=2.4 cv=c94+0h9l c=1 sm=1 tr=0 ts=6af7d0e8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=A6Af-tnAtVRmK4LPXG4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxMiBTYWx0ZWRfX1+wE2bxpyMhp
 bPISnK2FxnQZtX7BGgWM0pqY8opk5Tt409ZWNwPHmWae/IVd388LE7tH+wAGGmZ/5DGHv+M38/X
 XFW0xtiFUMeUSBo5EIsYEhktb1VOnxmbWuB4jl4+HZH7xQDDEuFOiFx4A+2GmyISRzXCYalc5Z3
 CBTEBDtva+CRkKZsJ7xmyBon5CMFqRbx5vTKFV/r4gTTMfMojcyMAB/KiTSGfBei7rh3FEInpQc
 tLRe/Cb1ZhBI7vJTRLLbNlK4TQryjdt2IuiLwaAhk/ekaKIiT0jTt5CbfynnpYGySlHxmq73m0Z
 9curqpCSYk/lTDlMbsHIxeN7zrNBsax1BoSXlRIfr7TThpSBnQ3xOMNbx9y6esQOMgcWX7RAiHV
 BFQlbrr2k72uyIanxwneDLTOoQQBauwJrUhEJkYr91t4mwP7+rV6NxxrbfTvvsdOHEjVUDlHabd
 5eEdDsOLFU53hFUAf7A==
X-Proofpoint-GUID: Z3Ec42Bd9-pu_VLJxbP9aawCIc4Fo3U8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140012

Add the iris video codec device node for the mahua SoC, overrriding the
fields clocks, power-domains, resets and opp-table reflecting single core.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 66 +++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index a59c5ed7b48e776841db58e124c4d66225faccf8..1d01655e7623d13c43063b74d2ab086d2308e3ea 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -400,3 +400,69 @@ &tsens5 {
 	#qcom,sensors = <15>;
 };
 
+&iris {
+	compatible = "qcom,mahua-iris";
+	status = "okay";
+
+	clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&gcc GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
+	clock-names = "core_iface", "core", "vcodec0_core",
+		      "vcodec0_iface", "core_freerun",
+		      "vcodec0_core_freerun";
+
+	power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+			<&videocc VIDEO_CC_MVS0_GDSC>,
+			<&rpmhpd RPMHPD_MXC>,
+			<&rpmhpd RPMHPD_MMCX>;
+	power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
+
+	resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+		 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+	reset-names = "core_bus", "vcodec0_bus", "core", "vcodec0_core";
+
+	iris_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-240000000 {
+			opp-hz = /bits/ 64 <240000000 360000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-338000000 {
+			opp-hz = /bits/ 64 <338000000 507000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-366000000 {
+			opp-hz = /bits/ 64 <366000000 549000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-444000000 {
+			opp-hz = /bits/ 64 <444000000 666000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-533333334 {
+			opp-hz = /bits/ 64 <533333334 800000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_turbo>;
+		};
+
+		opp-655000000 {
+			opp-hz = /bits/ 64 <655000000 982000000>;
+			required-opps = <&rpmhpd_opp_nom>,
+					<&rpmhpd_opp_turbo_l1>;
+		};
+	};
+};

-- 
2.34.1

