Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560546;
	b=rEn0bs9upTzMuKrijMPVgFDGxEm432ECONDxtPgDi/ayArQRt0fGNLYAnf6vlljVxSBi
	 XJfR9jk04HDIwpk1/7i/i/ZLv9PJqSWCEq/HlkZjki7x3Dlx1PRSTNHA95H9PmRCO383k
	 eUvKld3eNjqQB68eLf7h5znmUbvDCQTEOUfhFcLSMjBH9g4jWTWhO4kOYTp6jCErgDVaN
	 WLmyXgHzNK7QUPrUJCwEZ4/0nxzySNE4GEzBCntF4ltBhQbfcCZyGCHq3QwXYj5JjEZs4
	 6afDKJXZ79aNhCSrljhHosMk49nfNZu0GAz/VJegN9pm9rh4GC7w/cVEqNIKjwAJG6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=spi0eC7tVCfNiex3d0zT8UXoDtEilCerp0eznL2nero=;
	b=Pt+4F+KvznlInXwTM/i7Lay2qe0KFmgxW+uPCAfI2r0ZD+iA01XzvzKff4S1sz9O0uMR
	 oBjq0gm9MDY1XgPmiyBM0Y7l4vEUHA9VzjCiskE4sjOm6QDAgSLMnmEWWUKWgQ2o2YfER
	 flcs7yOrY/ywbga4OU48HQH2xQ01t2jIaNwZGVjHGkMdwURKMZ/Ksfg8hW9hcS5Q5PXhv
	 hPQOqnEukkFk/9p38PANQAysBRuv6xIPCkAxlcCeR0V+wsBuXQ6ckQcp0s+Sdz0Us/Qi0
	 MDLqECcQZ66lR3RVOVey3ydFJ3hW8sRUoCFwVmrbP+81CIOpP5GqeKIwAEMHKIc8f7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ScWsajd8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fw9OfeJV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF06606A332
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADF06606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ScWsajd8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fw9OfeJV
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V6gp3652797
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=spi0eC7tVCfNiex3d0zT8U
	XoDtEilCerp0eznL2nero=; b=ScWsajd8ps5+svUZeAiGK7dVHuHgAwv5SV8vaJ
	3MidTiyhVw/joQhRi1bF9ST8RdXaTVBjiYRC+BqhKbyfLwFkEu/MJH/++9w5bC7Z
	rvjEVyBY0HgvzvmiwDcX97dhOOCG/8NntDHnLNACMFN8lhpvDZOFkhZSe3qrIyMY
	hr5EzTIH8SL69SKGsFuTSFpVNAYc+25+coL6+o+yiBGFRxSKIgplTdlQPsjut7UN
	jbY4FAV52sjA4hUrZH85ZfuFV3jufqWdszbQ0XUV1EDKnXQyQ0vTWGcg9d8c9gNu
	oD5Z5lpFytwnbbPwav0N08XOYBrdSYcYTucjHzmz7qTgzBkg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwaa8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:02:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed077a15c3so6662725ad.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794560544; x=1795165344; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=spi0eC7tVCfNiex3d0zT8UXoDtEilCerp0eznL2nero=;
        b=Fw9OfeJV/QItiJyHJYOySX+9Jx59OkXPTOYWD8MvGJycayE9KdvEjoPtin8/JfeQbb
         bSt0HJJM+vBPsmTNyfy4ug2Oh0js+gCi1gm45UVt96vLxDQ1jJizxhjQzD3shgbc+GtR
         pN961OJL35D9+1CrNi6Bvox0tlrVxAPwSKtWHMo/LkdfAxtZX0KPsNSrhJH9GAiivs7M
         +G12H4WsdsRXV6rV/44AM/Ina2x7L/GybjRDrK3ePVT/FXWFYn5SNcc1KIn3EDjQd0/q
         gx0DQioMU1NfGdNOhsADX6xIM0Sxr2l3qR5WH84SUWBcPAAXxENT9eQdXWYmPI4j8Idu
         +ZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560544; x=1795165344;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=spi0eC7tVCfNiex3d0zT8UXoDtEilCerp0eznL2nero=;
        b=g/iXvAd26DkZQCHDnrfTt6Aubk43k1/Wjwz055wNOnWzmd8e8hHpZyOCEnDhwEXXVh
         0JmdF2hCuo+FRKYpYBw5leVJdfvgUrLlZMaAA1UQslhDmY4xKFCoPlIVmbR6mj2FaeEf
         sz9DbFhkrck8q6cjIMWMZJms9jyj4VgtdZl7a1yKpU3l6FWdgpkuEhMxccRf9bCVwDUU
         8VtmWB/73u48M1wryCg068jkfLXOA6nK06zQcy1QFraeodVOlV0CWL15M0pVpbcVfeD/
         kbB4oyqVFNNMjWaoOMM9Bs5Poq8niR/Bxq3p7Mj3hNjLuklJ4Gbu35o0O2H3QR6WL2Xy
         TsQQ==
X-Forwarded-Encrypted: i=1; AL+hErFSclkzUvzh7c7XoOxAnaMiFTG9HmeZbZE9t5wsSNsY79mIif/BDP7dEuqFdYFe9lPDGTGrkOWNhXkN@vger.kernel.org
X-Gm-Message-State: APuU4Z+P9MkoDRX8D1s0y8Cg0fSMkmlJLm1GY4/Yn9BeZfkznkDjsT4H
	xcetSKiDldKEE+A+Plpqz/nA1+W5JCZ2Dl+6KkzXOFbaH/Dnoj2PbGEkQ0b2Jl3JL8CE/QIZMyn
	5Urjyelwk0OgnqgtJmZzu7TNLKaHbLPoPPUWUEM7fVajkn9k3CJW70U5GHA5pc4Zu
X-Gm-Gg: AYBFou32nUkYjDz8LFTXt4dbwSu5waH2v6VmubKvQ/eMDdn0Z3KFk44bxVo3hwOKIWM
	+p9oY3mX20nMRJ9nkhTurWembCDUfX3HM3VxJteoPABiDtt7ec6cgJzNnrMVR9279CE47v1PtJO
	wIF2oTxYrl0WefkdzYc+pOn8ZyPTLug9FBoB54H4vYSYEBiUk20SHgHw9MJck31hmE9tm3Np0IF
	iW3vGUvfckdOTdVZGhD8Vu0QazWKvj2syaiAkEzpVINOKPxzkggg1OzrQ+Pa00nKnLsbfnt1o2m
	amUDrqbymPP1NzjhwJ0sGv/lKYxaXqiLettE8WlPLEg7eOgbzioNohuoHdecOsjcgm9qRJidNUo
	6apTKpPhwMouO10DyrfvG+ESKtijonk95dYHnfgsZkotiIsi0tj127/BQx5D0X8yIcfDNoEUc9J
	SMUJoEmg==
X-Received: by 2002:a17:902:e84a:b0:2e9:3ec9:5ad7 with SMTP id d9443c01a7336-2ee0dc052a4mr18944165ad.39.1794560543536;
        Fri, 13 Nov 2026 01:02:23 -0800 (PST)
X-Received: by 2002:a17:902:e84a:b0:2e9:3ec9:5ad7 with SMTP id d9443c01a7336-2ee0dc052a4mr18943895ad.39.1794560543014;
        Fri, 13 Nov 2026 01:02:23 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f884be3sm7068695ad.55.2026.11.13.01.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:02:22 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:31:57 +0530
Subject: [PATCH] arm64: dts: qcom: shikra: Add OPP-table for ICE SDHC node
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
Message-Id: <20261113-shikra_ice_opp-v1-1-14c222a83d6a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAATS9moC/yXMQQqDMBBA0auEWRswCsH0KiIhTic6ChoybSlI7
 t60Xb7F/xcIZSaBm7og04uFz6PCNApwDcdCmu/V0LWdNcb0Wlbec/CM5M+U9BCtsxHRukBQo5Q
 p8vs3HKe/5TlvhI/vBUr5ACVna6FyAAAA
X-Change-ID: 20261113-shikra_ice_opp-8f696fcc69ae
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6d220 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_O5C9CTu6e29N6usQqQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: xgdN9oZSQpgdetZdk0cIgIymqIr31dMC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX3NlhvY5lSGTw
 5+1C+07D9Qc8MUs4O7EI/mzZ3B5HigM67x5EWocLELTAutKhV9QLkH9AopHcIeltw25tDwEAFdN
 We/zihJ3tPo3o9iv9mgZi+ah7yke29rtvMUqeUyeTV+NabgqdudpW0zTlZwyt/P+aKlhV98rdA0
 REacZCMWVzNgU9VgjG8YfsxyyueKFyC9ZAFLKQktfqmtqGgEiYuhfsgVGKSGxzg0FnBhUAPFUps
 50ZevQkUCwdPMnixIPoPfwjWDKeXAhfko3AmlhiGG2xnQg9at/hXQrdWfymdrrxcJ4qgqaA/27s
 BGW32BwFqJOJubi5PGV0fzTTB625FYF2aZGwZ2maU/n/mCuDY1mg4vFNpQIB0voj2RZDma2ZsLl
 qrYQ2OmZkZdnuWPuIET6P3h8D5PBhi5UL7rjNcwUaHAIFyPit1wn0alkF2ItycjPaiAOC1G88I8
 Ihqu8GQJ6Qcwi7oQfNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX3qoaEXySg1R0
 UDoapE+u8QsO+mATt6n6XWiE2ncLCVaqAJeJSiIBXMuLUhIuoDu5MtHfDBgDsLCZZL6F8iJqSIM
 pu10FsY6qsi1jElTSwUAsLRqWPphH2g=
X-Proofpoint-GUID: xgdN9oZSQpgdetZdk0cIgIymqIr31dMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130035

ICE run on default 19.2Mhz(minimum) on Shikra whereas MMC controller can
run at higher frequency(example 384Mhz) too. With no clock scaling in
ICE, it will continue to run at lower frequency and thus degrading
overall MMC storage read/write performance.

Add opp-table for ice sdhc node to support higher frequencies and
eventually enhancing the performance.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
ICE node with no opp-table keeps ice running at lower frequency which
degrades storage read/write performance when storage controller is
running at higher frequency. Add opp-table for Shikra ICE to support
higher frequencies.

This patch has dependency on below series.
https://lore.kernel.org/linux-arm-msm/20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..50cda82b6e94 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1406,6 +1406,26 @@ sdhc_ice: crypto@4748000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc_ice_opp_table>;
+
+			sdhc_ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+			};
 		};
 
 		sdhc_2: mmc@4784000 {

---
base-commit: bf7672020e0346bfe95ef54570af10f0c4364756
change-id: 20261113-shikra_ice_opp-8f696fcc69ae

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

