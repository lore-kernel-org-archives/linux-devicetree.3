Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86F34E532E
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982998; cv=none; b=kxoXdnrCaXGroG0RG2V7kXOrEAI94eCSHttMAZKPgNvNYwXfO4xC0gAOo+TWA7en6oboc6oJxPuh8eBdFfrUPBodQKXV7MvPk5fMzrwKA3jst7R4rI5R8kp9sFES/SSUxmov3x1XvTZajxozZs9tQNPSksFJao8UxoUkuiZ1PnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982998; c=relaxed/simple;
	bh=E2C7ZTkYR9vN+vdiOw63P9ddewcVLDCC1y4LsZe6sNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfrIO1ldElPHaKwMEiTPdANUgFIPK4MOAlcLjv78ZbzhsNYATnJXNY3ytnWh3CEu1dtxzcwzXdsD+6nHlmv9GVNQoHqmx3QmVkF/JVYdrbPTvZDs8MD9Y230cIQaVwnsnzjbjfBfcK5eVH9jGCzZ5ZQSSFT4o80QmdOlz71mAkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvMXjsif; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQm1PBUl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvMXjsif";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQm1PBUl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7mH5P3017676
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RuVrYLINDl9vlbsbDPOgWI7Zdrcg/n64E24A5ZiJTBg=; b=RvMXjsifKlNt1rII
	fO55X/g4p41W+W1KVzo87l1zL49WmC9d2lyhkP+VeqNWak5khUcmbcS/qlN/l8Ky
	9rXz4vydkRJpeueZ3Sg6ulC3slMgtQsPCOAnDw3fhpdvOwEWE0dEM8Jl7CdChTsb
	Q3AOSLmdngmrliLne8DPzQo7tQ9ZYLO4KXt+1mc5lgQ/qNlGdN2raFKf5fnz7kc6
	VO/N3idg2CaGXT4FRxoB9YjM490GVx39VKuNKW8UI5rnASxSBjxrCxvsPg9MLKmN
	lm7BiqXBvF3B6CcnOYYJWDOqtSXGculT6o3uixXE2B21MQJAQ+Hv/1VRy2Z7eOrG
	yqnPog==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b4dpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:03:12 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98c73709b84so3226332241.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982991; x=1792587791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RuVrYLINDl9vlbsbDPOgWI7Zdrcg/n64E24A5ZiJTBg=;
        b=AQm1PBUlG+4xeWeVVHwPvt38OXh7FvF5MCnjHnDDi0HT3R7UN74H31sVPZpyLksI55
         yNT6pU522/f06iPhfsGxuVRNyU64aaOhPACeBR8pCw+E8tA63J88HT14yoDepIf7GcKf
         9ez/Md9A2PPUgGhPgvLG21J0reRDVXXyughpC+N4tNM9xcdaePkKKFYsDQVsfKnCG8xx
         RDcGQYnrTHOWVo/9Ec4HZgAojg7XJaTHmApeRJFpr1hpm0pRWGjv0pbO7uDnSvxKqet8
         wKgg+zC3RMtYj+x+5c09tEUO/OsqCa5BGUkqhj1NrQGUmbnNnripwDUGPcsFdrfJbOi9
         Eoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982991; x=1792587791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RuVrYLINDl9vlbsbDPOgWI7Zdrcg/n64E24A5ZiJTBg=;
        b=usG9dkAE7MYbM5lLeOEedk7qw/t0rqajPwqgD1h5L8W0aqEyVyND6fTBzPduiyI2HN
         667538S0NLa1xEQ/ocXERuD7JAGWMSBcepvE4bgx2zdAwt8HeSq1C2ckOAn+zCoANsSw
         1wKQew2DGDCsU0Je9b2U1rcIxqPU7qEqLclxXEYNgHjORlOR44OWEOibRakJhUsuYWcK
         D/hy3FPBn2LBgBsCnC24IilAzSLHDke1sRkiVTJXnH38A03hj1ECa1UwNdg8Dh2pUITw
         PxILxsIk1U0vzbcUT4FPlkApmdSBDt0NfKu+7r3DbtdhAKRmOAvaZcK01lgHWvTBCLTx
         9B/Q==
X-Forwarded-Encrypted: i=1; AKwUvByG/x/NqBStJF/h+DlxsFb6WY+L8BKaFvRrT8E8X/KytFc+96eK9WQU/BqQL0UzqAohNS+Is1qyIgCD@vger.kernel.org
X-Gm-Message-State: AFq9FYIBnphfkQ1Relrm1jsLG9hgqhNB+yxJTpmLHzqLQVlpOmcbGRcY
	ceQwz6SOzu8ZqgODfoGMpVygdA9+8jSqkyCgoW2tYy1MeLLKoCM+TGIrJSI8PktIaVWUVJA+3CF
	ptvoETdn97N+cz//+i3q3nwRbk1p9ZoYhGmECGT9NxfM/U9vcWkOQx9tEWea5X5vPmw49H9pX
X-Gm-Gg: AYBFou0Vx8JQXLoshTt2/vzc6fxfTVo6xZLUCxeQWTt4DFoBt+TXTo07p/A2iH+t9em
	oPkxYduVHH7HPyaJhZYrz7B8VzjSoqameVfavJ2smt24HCWwD75deXpyATRiXccGDt95ruX+0DD
	1qsvaY1opDZ6HKv1qkw60xGxkhrCJQkzPr2Hp8nM24F9d5ngwwzGO+Obi+SWLxFXoaNQUQ0FiCu
	J1lbfhII6htJraKnQfrs2opuXRHpxhP/hYsyKGWsBehmelyRprqlz93kT/sexHPXYZNU15Y5A72
	p70DeMB9qv5ePeQDXC1v+PBSvX7iM2EWTX4d1S1fSRDzqkIr3Vck7/mNL1J/rQJSpa19Z5sZIlR
	tSIpT/AwLWw==
X-Received: by 2002:a05:6122:2194:b0:5e2:dce7:2d35 with SMTP id 71dfb90a1353d-5e91f44e9c6mr5335606e0c.9.1791982991314;
        Wed, 14 Oct 2026 06:03:11 -0700 (PDT)
X-Received: by 2002:a05:6122:2194:b0:5e2:dce7:2d35 with SMTP id 71dfb90a1353d-5e91f44e9c6mr5335558e0c.9.1791982990526;
        Wed, 14 Oct 2026 06:03:10 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcece106sm567795e9.9.2026.10.14.06.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:03:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:43 +0300
Subject: [PATCH RFC 5/5] arm64: dts: qcom: glymur-crd: Source MAC addresses
 from a UEFI variable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-b4-nvmem-efivar-v1-5-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2060;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=E2C7ZTkYR9vN+vdiOw63P9ddewcVLDCC1y4LsZe6sNQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqz319fp6TR+yR8jNw966xWlfX4ZKxxMxwQAtGC
 Y5X7z2YpXqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas99fQAKCRAbX0TJAJUV
 VobVD/9FR+oK6sjkKteWETGAXlgN3C8denxNZe0WyouXGAVyEW12pOEEF8fr0C2OgAREtKa8eWx
 CZb4fsGAvK8yJg3KZOKUfK5uk5m3ZMHS3HPIWJbYxJngQ1lCafkynQLa4H4o4FJwKhgr+ekSXda
 JF1SVnurtaW6JZ/ykrvQlE/NoktVV5grv3NIB8oS7qY6+ZaKslQWvS4t2urpFaIm4g7vB6bFCSB
 TmqO49Bu1lO+3aeGr9yzXDd2h2XwyLZg8ONQxt44WLSyR4XOx4TiERP901FshmhB8bnbyb8sImX
 ZgtkhQX1BmRyWve2OxnpimwSGJ9s4jDpa0YrLttVmpZadBf2FjEVGxGOyTJh5WcIkqmnmuie2me
 SJYwOTtAlSMM9uzP7yyeUKy7r4w4DsWBAxfjLPnhW+D0IAO2Gbkl5u9JBNgV6hGaTqRZXj7eSbT
 PPFg6alEbLkyqaXPSZTdCdqt4NQAFDmaktq7G6XOgfC51m4bkoZWQGT58xvxtpY2KLFvcBU4j1L
 hTyjsZqvlcFaH60ghHVuTjnLfSfOttEqAuPKd6FwxWngzOuoQN8icHerDTx7m+4zWk6ycrbU8dG
 b73v7BApj+nminpuLcxv9fGjYYgjQsEGZ+yJaT0vE/xlwuyfdUWYilXyMp/42KgLvBLZKiJ5VxO
 tYlAxVFim181Kuw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf7d90 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SUfgz0WXR8OkDwgVpNIA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: -WKwzNHWRbObMxpsew1agV9wLBRQks4m
X-Proofpoint-ORIG-GUID: -WKwzNHWRbObMxpsew1agV9wLBRQks4m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX7I946J66f951
 09ET++6h+bf9a0vQY8u/j0MmGTH3IIMBZs07ik4DGh2ZyRuCbp39+Qz4uBiNxIHvvwQFfOq3VJI
 hV33wpzFHDnXM65OAdHax6/LZSKVlwviJ7VB+kEukBgtJ5QE4uKbO6ZSu1JioyPidK2w+/dwv6S
 LRL7xv2Ta2foarnIlfk5xxnkFIJgnsCDnUm4IEqFlN15Cem5RNs44Wd9g1id0Cxdk1CM/C15T6p
 Fb3jgal7+PmcHA56awtPCwMyjculNq2HAp42xEsFPMXva7uWvvL2/jD/+7ulebvL+8PP4yb0gJs
 H86MUOMMdy/nGoDRUSqg1kQUPFocW39nRM0VGEXUavgbjju53cuBnemrK4N0V034BL1DQyhahCS
 gg6zx2VjdmZ3unFgBCzqBdl1GRc47pYGz0R60e/HLfHstdIeAqDO4BDq6IJrvi2T08UFfYRYiTq
 CXi0ut5cB02+3GltoGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfXx7s2aK2gvhMe
 RM43iwISF9euJ5RNsM0TS34GDM08KuLPgHvi+MatJXDBX6aTf63T2K5vuJdGe5kppFLcrHcfIZw
 OklEsoKKj9gbkoZ3PiRxvLFF0OueXio=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140051

Add an nvmem-efivar provider exposing the "MacAddresses" UEFI variable,
carrying the Bluetooth BD_ADDR (bytes 0-5) and the WLAN MAC address
(bytes 6-11), both MSB first. The variable is looked up by name, so no
vendor GUID needs to be hardcoded.

Wire the bd-address cell to the Bluetooth controller and the mac-address
cell to the WLAN endpoint (pci17cb,1107) via the standard nvmem-cells
binding. Until the variable is provisioned the cells read as zeroes and
the controllers keep using their default addresses.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..2dd09ab1d550 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -31,6 +31,22 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	/* BD_ADDR and WLAN MAC from the "MacAddresses" UEFI variable. */
+	efivar_macs: nvmem-efivar {
+		compatible = "nvmem-efivar";
+		efivar-name = "MacAddresses";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		bt_bdaddr: bd-address@0 {
+			reg = <0x0 0x6>;
+		};
+
+		net_mac: mac-address@6 {
+			reg = <0x6 0x6>;
+		};
+	};
+
 	clocks {
 		xo_board: xo-board {
 			compatible = "fixed-clock";
@@ -776,6 +792,9 @@ wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 
+		nvmem-cells = <&net_mac>;
+		nvmem-cell-names = "mac-address";
+
 		vddaon-supply = <&vreg_pmu_aon_0p59>;
 		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
 		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
@@ -1163,6 +1182,9 @@ bluetooth {
 		compatible = "qcom,wcn7850-bt";
 		max-speed = <3200000>;
 
+		nvmem-cells = <&bt_bdaddr>;
+		nvmem-cell-names = "bd-address";
+
 		vddaon-supply = <&vreg_pmu_aon_0p59>;
 		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
 		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;

-- 
2.54.0

