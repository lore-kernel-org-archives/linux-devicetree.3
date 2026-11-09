Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214776;
	b=Rb7NMqXdwsObq7Okboa4u3/elT3E8IaYsTwiTKdRuMYNN9CIp9V3AoOejzmkFqw1sGLu
	 4NI87XbyazrzBKqhv4rU0Q51J9twrXOYEDv1vOeZYfBakj9b+ALqUGcnFsJchAzC3jZaJ
	 nsS4RETDXttoaaIg9fxy4+JlY+gYMwJRHWGQfbZ91TQCoKH5XuGIuTDceiWq2wdv3gxuT
	 gUhvqAwfovkeuwMmljZHGMDQ6DYZzM8A19wuk5c8HFxY8MocD5CtTnJMygoJSYyMSL5ed
	 xYJ6Og6/htvCBHtuHjtjWMuIoX5fayIDFPN9EUoLw1pQE7C0qqK/h515CwJ4KhzbILg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ssmNaEyrZS9wo/rCifldKjAHfj9Rbpdxj8LpdJl0xJQ=;
	b=BJg/i4iewimCOwa3Umf3B4VKc2hhplOarbTjP/UQxaVBCPWQripnHh8VDAxRnfzLyjI9
	 eFU3IIOWtc8HI9XCAf02moAZY67fXZqt6NFO/51ZRIoGFC5h2xATGOYH5HgmmTi/ZUt5O
	 QQBcr9jh8nXeemdRYVxS3M/PQoqXMQCM7cMxlZTaoYr8B/KmYTsRI1Lt+kvxsZrAut492
	 av0szxwc1loWBlqgJG7ii/Rr2jJ8IEt5RmfELerLXlAtEEnPHQaZrRJFTKvLKQGqRrD2U
	 PUUMX6ir7Jx8D6yz3DXU19fUojxS5azzTqm8vDmgOEdVW2qtPA4midREAeLtSl2Ux6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZMIzDC2T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2h4RSMm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C26D606A325
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C26D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZMIzDC2T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2h4RSMm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AACF2540203
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 08:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ssmNaEyrZS9wo/rCifldKj
	AHfj9Rbpdxj8LpdJl0xJQ=; b=ZMIzDC2Tk8gXcRoqzJIwMZcMlOLkQoQUBb6diV
	o0DhyWyXYBsZ2bw9SsyO8CRObkYm0NYdVSBjbLSbD9reX/QSTMs34jp6KCpsMqD3
	SPkkQphmUZeEz5outdf8cr45yY/ER/blLLDyWxtm7U0l5xpFNrg9UzCjdTzu77DJ
	w+vbA9SJUOVlIWBtvGsmo5VxnzMY2wK+qk/ZNneJsOgZA4OMq3H0Kz5UUmSpqDQZ
	UZKpQy3y9eIR1rQicrgSiZ8lDGdZpZaQMLprtoP26qs2w4tyQf/kLyFVJ5x8UPOf
	shHCpe3NPWWGdAc+QwP2tL0EwemWwY7XXwFskwrOq1RmXxtw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6ng2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:59:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso1079437eec.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214773; x=1794819573; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ssmNaEyrZS9wo/rCifldKjAHfj9Rbpdxj8LpdJl0xJQ=;
        b=J2h4RSMm+UhT2BzGXnxMOr2lO450HdEmrsizrKexxQvaLCyp13ebOd3KZzDbGCUzjg
         vHV7SFa205wEyX9xozk2LNMmxfhZALN/NO9bpvyYCWL+BFjUGpGXqiRyi/tbP1C5dvEO
         gUpTIws8ORrM3bbQbAKSep9u+nMDRFheoxaHDrlfC5PNmjChv+a0mcmMdfGH8HiQZr+M
         vIyOm89fEvrv54TxgdYQOVgpg1Ext77xzKlZnHYJpSGMQ/kSpdwQFsylta2PdYJ+jTxz
         PGtQssDA6AK7HV6m1KGOmCaPL9bsBs7cIwUqITkF4K6VRubpcvNiM/0sDnT0sxAjOqZc
         6bAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214773; x=1794819573;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ssmNaEyrZS9wo/rCifldKjAHfj9Rbpdxj8LpdJl0xJQ=;
        b=wTC50vQ0yzAoH0AyfcbdWwClcy25SRCBKbylUGnSzzzuAGjG066VprJVDuPLq1NoWj
         09p+pv+HSCDSt50YToeIpNN6yfZhvim+gDKAwHlTGLqadFl23yWBfwxx20Lh4SeO4ZBj
         ZIugzIRPdF+sdxucjAQ/vczBCzE8CcLloUZqiET9AnNakR2ZEKEpr6jJss3sSRfcmc0f
         BinWLcrF15GUoyuOkk+5CWMIOLGyjo7HbIXOcPunQIx29X1mrG+bHMawncCCxOZQpRoN
         3rMAkkHU37ZDSa98/DPaixcrT/F47wNL0TUiRefEqhM2Os/5Brvtx0eBVk/8J2eWDGjG
         hZ4w==
X-Forwarded-Encrypted: i=1; AL+hErFhLjJ3kZtg0NniDfuxNpnfoahV49NrxFyIX+IDxbHgk+YQFfXBs1dl6td3Oh147jgbxzxN/T2vj/2V@vger.kernel.org
X-Gm-Message-State: APuU4Z+WCxb1zKAWLCRflNH4jgM6qc3ZT4G554Sqy8sopfEf3Ic3RcEe
	FhKdKO09bAqYpXoUaxGhR2dmN4W97R41m4fCTafV0bvkl/yixSFMN9ibturZgBxq9T3GJeWUzGp
	xenAvQjKSy/zIhBFYBwDlV1tRc917KutsHBaFmSZHTj+ialctJ5M9mKPTDvVU9E5bU0anQsYk
X-Gm-Gg: AYBFou1jR/fe8BftvBnqeujw+TkCmlhPybFEo0GCZOlpNRbSYUJOFINhhdTiDa/Pa0j
	//JC4jmg7RbebdWnzCOx9gKzgIaQh1hLCCpkISMcF8YJs3T8PAN5zjLEFmNG5qPlhrykXoVLjMq
	fssQZKtwoQiaZ+ps58037i9M4Llctqiw+TRmIVW5A/oF8cfBLcz3Cvq66cXw0Edlj1OBXS9YBKd
	w1Kv2y4CSLWfFD0FDGgj9kRLX23d78jkn5VpB0JYwVyYnNNFNhwlwXqJZQauySenDki8NmgIor2
	MbErOYhGnjDYjOsbHxGA4Lif09QAt+dFSxCXQ4iEjQM6UGSRqCQ6h2DBAVcaYWcPln8ZlqV+JSj
	9/rwPEI94plWQOrSZu3bsGlz5SQ0NwwTIqCf13w/RdVWcM3aMfAtanvUl/xUtSTH3krpzwduavh
	FDFnUFfQ/y2Q==
X-Received: by 2002:a05:7300:33a8:b0:369:38e3:5363 with SMTP id 5a478bee46e88-3725d1a4f0amr6122858eec.7.1794214773309;
        Mon, 09 Nov 2026 00:59:33 -0800 (PST)
X-Received: by 2002:a05:7300:33a8:b0:369:38e3:5363 with SMTP id 5a478bee46e88-3725d1a4f0amr6122830eec.7.1794214772718;
        Mon, 09 Nov 2026 00:59:32 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37391fa11ffsm5470848eec.6.2026.11.09.00.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:59:32 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 14:29:05 +0530
Subject: [PATCH] arm64: dts: qcom: lemans: Enable the Inline Crypto Engine
 for SDHC
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
Message-Id: <20261109-enable-ice-sdcc-for-lemans-v1-1-1f25debeea49@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFiL8WoC/x3MQQqDMBBG4avIrDuQKDaNVykuYvzTDtgoGRBBv
 HuDy+8t3kmKIlAampMKdlFZc4V9NBS/IX/AMldTa9qntcYzcpiWWiNY5xg5rYUX/EJW9kDnev9
 yxniqg60gyXHP3+N1/QG1/Ea8bAAAAA==
X-Change-ID: 20261109-enable-ice-sdcc-for-lemans-9ee375987009
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfXy0Nuno9t3G25
 +SPY7cXnWSWoJUS4k39sHFFufb3Ku7cttbqKjdJbOAaqYLcQQa2iWmea8GfcUxJG0vV0GidloPi
 sojcZmgRWTNYgxtnULHLLJ8ZN057uQ/2E0HSvTybM0uyYfpNu8r11rguT489YSOjyl0Hy0juxap
 qrjFeS5gzIsva9MqqlMDmgI1kD0drJkF9w8TSo9C7esew/oyukao9sZ1YU9NZjRiP3huvTaAHez
 tEoqpRbcdkf6WO0rDxN/xMr+HyJjAzSwKFQ8I+G9a9LywPPMdZQMeZBtPmB6CcF44xYkEKbAZRg
 72wnwlY/CS+GGrNB7V3nRC4Bn8wdyfZIF5kaBi52gCdLG3pmxq9jmkIKna4BNa4ZMgtrK2yVt0a
 tUtx5qFe8IOC1RIX7Xl13xgQ/YYWWoCRRr0mCSgLHSGbgXRlzDnsszzd/FVTi78lYCS9Dmh1M0j
 EyYe6p7ILEDkctcCZLw==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af18b76 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aDrDLeE5ssBeLXbAN28A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX7nJ/u+iKVUuA
 mOLYHCxNwImYGC5HYjfEvhhYq3GlrGAdIgyvTJF3DO16bDxJD0b00r2lTvr9E52qqHeRMMQ3P4+
 /sF4gYoZpGmXeVMcjM80mCSqYaiWud4=
X-Proofpoint-ORIG-GUID: h2mYHPqeo89pMPijwwlJbXEVf8oso3-0
X-Proofpoint-GUID: h2mYHPqeo89pMPijwwlJbXEVf8oso3-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090035

Add an ICE node to LeMans SoC description and enable it by adding a
phandle to the SDHC node.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
This patchseries enables Inline Crypto Engine for LeMans platform
for SDHC storage.

Testing:
* dtbs_check.
* Validated on LeMans-evk with custom Mezzanine board for SDHC support.

Dependencies
============

[1] Enable ICE clock scaling
    https://lore.kernel.org/all/20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518446ba2ea582e8362e86bba75c379..dfd41b613523fb85eb122488e0562447f7228e61 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4327,6 +4327,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,dll-config = <0x0007642c>;
 			qcom,ddr-config = <0x80040868>;
 
+			qcom,ice = <&sdhc_ice>;
+
 			status = "disabled";
 
 			sdhc_opp_table: opp-table {
@@ -4348,6 +4350,33 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@87c8000 {
+			compatible = "qcom,sa8775p-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x087c8000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmhpd SA8775P_CX>;
+
+			operating-points-v2 = <&ice_mmc_opp_table>;
+
+			ice_mmc_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		usb_0_hsphy: phy@88e4000 {
 			compatible = "qcom,sa8775p-usb-hs-phy",
 				     "qcom,usb-snps-hs-5nm-phy";

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261109-enable-ice-sdcc-for-lemans-9ee375987009

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

