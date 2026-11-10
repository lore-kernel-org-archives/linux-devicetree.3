Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328771;
	b=I7ykgKd4KSkQQj4Aer7QMY6wIC88fVXhLAcuLYBJMDK9tBgtaab46cn7/qZJoe7ljQU8
	 YgE/+6cMgGc6VBV9+1PR5wKO9Vhx9oEzaeH93ERQ1A2AXRKFf0/Q3pfSUwWA0/eqi0D0L
	 DWAzdqS7dOb2q5jqCIJoHXKONGgvbQ+MzN068TiFhtR1ll+6jik5Pa33SzDzPe8ioIAKW
	 njB2h3FKPARyjakx1CYJ0wjal4uaCEDksTkthPE3B3Y0QsVOVOinpsBiTy6pWQkYJAENu
	 ybp1Kin5kDtAGh6bZNejbxuBFKqV/3/xZL6xN4znzXaQ42GoB8sLCpOfh1E0joTQhdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328771;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uMoLa5nXrmE5D5TkslCS164rpHjf2daSrR+xEZtKhIE=;
	b=SJ0Zzgs3ynGHmQLGIBjQoJ+Q0BpMIPz6Hck15eQcKoBjCYRlsAU8jcBpiKnkU6ifh9OR
	 267kM+/vzI+kKKu5Nq48Y1KSnuQlEMhknO3qtBbNKJR9YR+vlgwR47dN/8+BPs+Sn+NPo
	 A0FYaJh8Ryn4Ax2LnBDN7s88H/wHFUyezreRb3Kh2VHfWVIQ6PAEtmHKTu12U7ipvTeY4
	 tWlx7w5KeEBvzc5ucVtH2xEWSJrBG3MZYxxcrwzIG517l9+3VsEqiE/NWm7DCFgtlzDeU
	 NGDRlaudyOsEDWGVCgh5Om3N28mo1iKIxaoLScfKsp3YbQQaCPfJzF4PKqjc4PMxBNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=id5ECjwM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bz+erQGD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C0360A2612
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92C0360A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=id5ECjwM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bz+erQGD
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0Cvf151490
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uMoLa5nXrmE
	5D5TkslCS164rpHjf2daSrR+xEZtKhIE=; b=id5ECjwMpiTWb/JDscdsOoA2vaN
	HeC0nXtSXiQDTgP4eQ43lawRshbOlMOCRKUAmSTEdERULG3KTa4xmz3qLUPbhSUv
	Q/GdT0HTdaeNLosqL/byjhGAaxUflp/sw8/68ocVBB+Rs5kBGqlQV5JZsXTAUewd
	eIDe5F4/079MWMaLTQeaaJtNI09g/2IF8ahfB6zcLgB2aRjWiI7149Js9e2Hm+Lk
	FJcPc+N2Lyb1U6CGudHOWtWUYF/zCdoqEX8F4qbNA9sAY9qjq4I1jyn3QDqhnMtr
	nXBv2H8okQcSgjUOhxTYpcRS7T13uS03ivwl63r546QTuBSrMAiIVyAR9Bg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pv8nrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 16:39:29 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99b715e4f44so891733241.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328769; x=1794933569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMoLa5nXrmE5D5TkslCS164rpHjf2daSrR+xEZtKhIE=;
        b=bz+erQGDnO27HjArIQT8sH/5xBXf3wYQMnnsGkjPPzD6LyWnNVwArYFaTOYsg9ps5f
         gPtdWPAhkXxXdVUsKqC7LhZZfxgk/+2UIuNgRt7vRHy1H7Et0aUOv21GHG9xem0JaMXX
         BdrtYJPJCRbCU8C+Evk7GEzH0KKrlfM9s7eezdAoHsaLm1FeYCOGfrZJgr8uyWqOVulP
         VxVuqNWMAdFeSggqoMhsDfH25aMGb/S5j6HfXsVK0saAKjn9HAQz9sHVh7jyb46ZeojF
         PT0jKDKmcD+Cmi1CbPYtHbdNL2hYmRn2/s7xLdRYEQ78U2b9RC70IwiVvNE/34XTxP8B
         cVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328769; x=1794933569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uMoLa5nXrmE5D5TkslCS164rpHjf2daSrR+xEZtKhIE=;
        b=etVNEWMnvh1ClTVFkqncV/oFG1vdKAkaR9C3LUFSCG0ocqKC87QNtLFVr3J5y/dEOF
         F41CE8nCnO5/i6TTQ4r3prvMdSRjcThfW0U8y2B8cUgJbVapVb7ivMo57/rPutoeoGkf
         qIFIv1OkV4YxoOHWdMZubcf+iB3bZwH8hodjSYX+3NXFntmGM1KiJGSkCgBlIQlokNtn
         TQ59GrE7CAVfWOYieTG8AXj+SFgvNiW2HB7rmL4wsUKhoTi3VEn1Fjq7SkdasH08PQhG
         7wJnazVrXTTWO5DO7NpILL1U41iTczB0KZk+ZZiuyF9BwqVoeHkiDBCNccAaMzF10YZU
         y9BA==
X-Forwarded-Encrypted: i=1; AL+hErHD2wPo1X/LkZPRqF3oeumOaB7G5JpSvp+JT5y0oE4s3Xl7jdyztEjBFrRs0dfAZbSw/sqQRPQ6jd22@vger.kernel.org
X-Gm-Message-State: APuU4Z9pT2PSKjF16wb2urXnP0+E5FjAjHojKUsOIR+7tPWaNVHzFhwI
	ZP6HKNvUfL5enNeIdZpM5foAE/cNJmXliuSJPV7hHgnFh2Cni8OWGfhyqovYLz5wC8CeDN0p4Wb
	KnllqsjKYETRr+drVe1gjJ4bqbK8cBtL8dZkq2mE/GBsO4+ZTomu/BBNfZZ/0Lyey
X-Gm-Gg: AYBFou2DbuWqTUaA75Yn3JjrgfAH/TPuqmS7tIp8V99l7mM0lBoVekzh6ojhPJ6QMHe
	KY9hGFU2SA1HRnc79v9aKbwBG8SSVr9CItlu/FY0TVlgOcqkCvrYo7/khUmndS/aG17NSUewAEK
	tNowPUEiaAgTKtg8eZh0YkT2Cpip63eyg9azLqZ9Ie691VIkxVs+UQrLGVtqGRS2ZarH9MjG32e
	VcUG8V6G+w36PpdSXzxSV2+BmcGEktD88apbu7kd5C7vfolP2mdbPwsUW9P2ZvllLlqj4dL8c2r
	Kf9B5D2pKk6QolBi2qVQUlVULE6Z9W8hC9eujeBdSr2DZV4pngoJbHRP9bpln+pu0i3UMzD/dEc
	glDA/DJLXV7IfML4pf69Lfl/Xv2PThBOLRQiVnURIcMreS2LCuqb0qbdEEoE49Tvxa9KRHGc+5Q
	==
X-Received: by 2002:a05:6102:579b:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d301c16e28mr1097955137.34.1794328768903;
        Tue, 10 Nov 2026 08:39:28 -0800 (PST)
X-Received: by 2002:a05:6102:579b:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d301c16e28mr1097951137.34.1794328768520;
        Tue, 10 Nov 2026 08:39:28 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:27 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 7/8] arm64: dts: qcom: kodiak: Add JPEG encoder node
Date: Tue, 10 Nov 2026 18:39:08 +0200
Message-Id: <20261110163909.78085-8-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af348c1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=iVVtd_vrlZ2ormJ2GbwA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: Rf1th5DzayHKTsEzJkWFgTCu1UJPlkb6
X-Proofpoint-GUID: Rf1th5DzayHKTsEzJkWFgTCu1UJPlkb6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfXwW8QPvNEGs4F
 yOkr4yocVwGirQD5vKoMwsfwxKB2UFJSFQRs8KjC4IwkXRkJqSot6UqlgYG3wSsYHt8+1lE5TQs
 H1EOJpQcP1veiQoeVb9eJF6zIb+ATzc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfXxaUDwuhpAYW8
 7p0cYmxUO2DqcPUFXsMkuDeXuMLTrjo7/JYBNAukblZWlB1ujx7c8NeVFHWOQN6p9wBytPnXL10
 Rtpr58dfvgRAo1f78oWG88/cY4d3yAj3LeP2rIQuyKgxTMbdGPjShPndK4ClxvJWicuB8PLCA5S
 EtbFjryeWcBa5ZDp1UEVnkof2eFSOQE3T633DgTeco3uS8RlL/IZlDkQ8ur3MzJjcOEP2bIuOA+
 ho4wQBeYwB7X2KHri9ThVezkYYxvlHu/PsMZMztORtqQC8/A/uOoLIyJGJPUmYOQF+tRf02qr+x
 3Tvl3kcfxQIukenF314ysPGGq0X+h9CeMhbxMR+P/8y94slzApNhNaWEPHy3PNqfZgdE6d+5wrc
 +zJKgRPMOAfb4Qd/lOAkQQvB8Z4u+i+Kk0osa4s0mBhrIgfiv/J8mHC8PzSsYi6vkRa/UNEffHs
 nu6yFwEcXtntqiTzvnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100066

Add the JPEG encoder hardware node to the SC7280 (Kodiak) device tree
so the qcom-jpeg V4L2 encoder driver can bind and operate on this
platform. The node is disabled by default.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 67 ++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d271..b46fbf5ebbeed 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5164,6 +5164,73 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		jpeg_enc: jpeg-encoder@ac4e000 {
+			compatible = "qcom,sc7280-jpeg-enc";
+			status = "disabled";
+
+			reg = <0x0 0x0ac4e000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd SC7280_CX>;
+			power-domain-names = "titan_top", "cx";
+
+			clocks = <&camcc CAM_CC_JPEG_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>;
+
+			clock-names = "core",
+				      "bus",
+				      "config",
+				      "cpas",
+				      "camnoc_axi";
+
+			interconnects = <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "camnoc";
+
+			iommus = <&apps_smmu 0x20c0 0x20>;
+
+			operating-points-v2 = <&jpeg_opp_table>;
+
+			jpeg_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					opp-peak-kBps = <258480>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-peak-kBps = <531480>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-peak-kBps = <1006560>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-peak-kBps = <1084440>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-peak-kBps = <1084440>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sc7280-camss";
 
-- 
2.34.1

