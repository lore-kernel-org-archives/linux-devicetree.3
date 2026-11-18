Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987933;
	b=wHn7xNO5AI6cj1AmTk/kv5kChIg2lEXoIVGw7oj9a7zZ2bRP5XHZbikyNzI8X8cV3Ndy
	 v3Php5KtXDf20fpDNeMR2BYRmdmIFIjyQONAQeYwCDr8qMM0DGt+awObtABvTlLDA/51k
	 SHolWjjflVZ+xNwJY7BJmbKRCVyDgynwwEv7XSfEy5CA8PqT3n30xDEAcbS36i5SB2EOv
	 DdkTRsfzx6ftqEmo2ZbxVVhXOOHWO4v7t213AhiRNHSMBHHDznHytJ7BOwduj0PoqHsnd
	 7Myl/dz7Pk13BrtyTV2gv7C9qeI9/5Maji8mKJXyEUgBvFsutHuM7UoHRnM5cthuv3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4aaym+w6ECE5LECeVX0KksCzfYiqLb3m/CsaepPrZ7k=;
	b=nN1ZPmqtoypogdMi1Ae11t+eyck+OEDxH4ktbum3fS9r/pMAAj3L9sIlXaXlrw/InB5J
	 g4k5c45gl8VdWq3W/8JrLBKvwI17zHlt67JFG+cyjyKSBZwd0ynLBv9o2/Aw1MLdlpH0B
	 IO/TRne+W71GLGF137lpoezIhMC+TnQlYCM9siDFGyNuUtDP1Jfo5wgNfmZU6pDDkHTuk
	 hj6gsSlZDGjkGdlvndICTdvmDuXjhSM1VjHB+QOj3Xokr/Hb41OsXIS3oQt/hrcZ5pu22
	 nJ7GHQEnc96b2M/263pa+Znh8ugH1Pu34gKHS+jYfcRjSerSwNES+0a77g+sekZxBVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DvhaKroK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJnWC9WW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC096606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC096606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DvhaKroK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJnWC9WW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UvMH2453547
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4aaym+w6ECE5LECeVX0KksCzfYiqLb3m/CsaepPrZ7k=; b=DvhaKroKnQZwpoBY
	8V6lesU8gRNqXHOMZmmqq+ku9yhOCgUtsZHeS3E9erFPd7sul7Wa24xt/uhMEepx
	tnQvMYDTBoupR9GDq2+vnk/QgvzyDz12XbNHjRk89K3nADfcRWr0BHvAoq36yIQL
	SrcR4aiIhfkgB+xqloC882YNqw/ocxBbELuK5qaYFwrwoiT0VeF1PJlez11F9dzj
	kAK/ygUpQkqbW7Lp/Fb9qYRV6eurIQ5iSfSo9E2Bp9Pe6by9jmV/l2dG8QOeR6cx
	T86YIkZGVWpR6Vcta1+8YbjB/urERO/CB09iayWQaw6x7waisPUjROHrYPO1vRh5
	LXEuoQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99uhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:45:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94961ed97d6so118712685a.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987931; x=1795592731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4aaym+w6ECE5LECeVX0KksCzfYiqLb3m/CsaepPrZ7k=;
        b=HJnWC9WWe1HOVYjEOd3qjSP56oW3JP1kMuRtS1nu+y1+N87ZeFB2rnUC4tlkLJxEIS
         CAvZOHfw8l2ky/AOFwzOf3NlM5XJpT2Pb3cMVwTl+Fqicrky8CFUwfELwzNVhW33cfmV
         yI/zgSKr+ifBe7Mu2IfiUKPG3QuG4N4xHMpwmrclR8GVeAWgxQneRHBlcl7hBWMk3fBT
         QyH+OlcoTK6O94UR8dHb0qEMNGBZhcBCDw34pcJTGlVDwj+knWnQvhJH6qvsQB28uQtf
         uoV0LUiFIH3NN+8hbtE1Gvooy2fx4xoPs0liw208cxIGSecGLaZOXiG7ikItrxkGK5UW
         5qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987931; x=1795592731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4aaym+w6ECE5LECeVX0KksCzfYiqLb3m/CsaepPrZ7k=;
        b=XrAsp2pZelDZV7D+/ypgxiNqp+JjvmHBrgu7WPsZtONP6fND3PhV6HxEkJdISIY47q
         rNh+d9drwgZuC5ZswAN/Wr/u+ivkyUppyYf/XzY9dmC7IA9OLID6QOzu81W3SuGHXV3g
         qe89wvBYIdXiPbpnWg6mwjik5MCCmAgMqn/EHxxgBNxjUbmyX/1Re4Y+6efcADyed0co
         fZ9Tly6Ba3LHoNKXhdPLbHywKRbxELPYozpIdtJ1ez3BTMqfRrAFWuLMPfqQ+P46RqAk
         H43IV1lNRvNWCgEja5QeVh0PJkO5mIFghqoPu66Nt5B6z8GF7oxGr1Cd/yQqhf/z/Rdr
         YENA==
X-Forwarded-Encrypted: i=1; AL+hErFLTFSXtgrCSNynHIHdvUvomgMBs09iAJ/X37/LytddxqzfeP7hGAsZbADv3Gd3YaEUfM+Hst16vMvt@vger.kernel.org
X-Gm-Message-State: APuU4Z82o3kwYQRB0Fp55cAqehYZhlS7Tdo3skdODbe0aCbxMzBdikvQ
	k2z+TBbQiKpFngbZvQQtPfAujPTdHmjJ/5rP5RvNa3zO5mEuFAZZTcCPx+LesA3OWet0IOcNNl1
	zzECOTn0WovomTS0FeYz9lWheJ/Tn5Cs31o0R7uRB/nfVLRe0AXhy9dPtaCpunLIy
X-Gm-Gg: AYBFou1hkl/EYwgWRcvNRuTnmW1kQd51aAcrkTpB/FxsmxmKLefgRT6AtgOJJv1Y6wa
	7lDxwrDNA6WMvDu+e8tbftIWlQivukKQws5FmRUxJ5GaHkOIXO+5qDJeNvlFcc/tsGcdkCVMcSd
	VndX62D4Y99ZIYQptXTMK+4E2UFfmMV2Yam8dydLIpVlHqqIlLdotLXtreu0Jqxgx7K4f45AOAF
	363Bfns44Z1GKYEdKegwVJ5v3Qex5jpbFblgGvX3hV3rBl9iGatSeXJDhsP6vyF2yj4llfOq6Fk
	Byu7bA5qYG55TYvRixEAfIL9PIMU6ehaZBmFyrjoQIPR5Jf71ECjD7kIlp5MoP75uCJbktKjr6j
	ycp9pNJjSxxM0IAERncM74Wf15rRNB5lArl9nA60dP6THwFlT9FRnjTSFmyEYHUr/UVUMmBlcY/
	CK4CCibioR528o3s0UzOxOQ7LocmBMiFLpv7vPrIPv
X-Received: by 2002:a05:620a:2587:b0:949:959f:e213 with SMTP id af79cd13be357-949996be2demr311183185a.37.1794987931134;
        Tue, 17 Nov 2026 23:45:31 -0800 (PST)
X-Received: by 2002:a05:620a:2587:b0:949:959f:e213 with SMTP id af79cd13be357-949996be2demr311179585a.37.1794987930428;
        Tue, 17 Nov 2026 23:45:30 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7b8444sm119359085a.31.2026.11.17.23.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:45:30 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:45:07 +0800
Subject: [PATCH 3/4] arm64: dts: qcom: sm8750: Add interconnects to camcc
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
Message-Id: <20261118-camcc-fix-v1-3-279d269e343b@oss.qualcomm.com>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
In-Reply-To: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987910; l=922;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=/Rz6qgPhvg0/67hfY49NLq/bi6XkxtXgxMoprPKHax0=;
 b=xcUzHlsa0uUwlwiq9Z+kd5kXzgkNdUJA2NImHLlyrkpSdr9GUZSUtuU+mtMH4Cd2VzzEywp8F
 xwzsJD+koUoAPxcTl732ZMN9RE5DwGsKVu0F072HcSZwQ7Lf9T+HDUI
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX61YnbFSUHOvn
 m+NLGikA4/3Mf/9cJUe3rJwCR3POhFAF11oX8TFggCdaAjniJPYK0mALJBEba0df4zvp6Lz3lv6
 lGclcGV3oCI0SKwpGK4CtrTJmlWCRfo=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd579b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OHQEiVBeTy0qr7fm1XEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfXySoaXfd74FxK
 +OhiPqpM8klBTQklP2ueJottfnX2diOvZ97N/tKp0NiXqkxTOa9Cod0gbg7/FKk5wN0Neg5KhwE
 aUIma/9OHksBMsc6PR/w2d50RCBAvweSkOZvxABnLS1upVTxREGJR49bjYqlgxE4tyCXReJyzEw
 4FrZU9odG7dq8xvinNIO7FfMOik7tZ2ETBVd4R6p98sZavwl94JmGNquZoOlRfOBZ/MYjZanEDR
 uOhHzzom6pRay2VBoFwIrb2vXNwPd3FszA9aJj6gUuBgej8WbQ/0L6LCgM6+PM1vwFGEGQnjDu5
 zt+EHG1eWd6kIVAcEJ72ZdrdYj7mb0qxJcaaqJ9W61pbD0qg9sqcxuNJy2pEag4ryR3lVDHTIcD
 gXJ3G7qNeYW8o9L6Xow8B0LUA/lMnxn8NZw/sFNxfxTkTQkKBCOEk9SbAvBVPylyZ9wdlpiZicy
 KNGn/q4CxhmN8S0DBZQ==
X-Proofpoint-ORIG-GUID: qw3nvIoTfNDyoeV3bcUGdCtk_6ZxS2RU
X-Proofpoint-GUID: qw3nvIoTfNDyoeV3bcUGdCtk_6ZxS2RU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180030

Add the interconnect path for the camera clock controller, which is
needed to keep MMNOC voted for while the TITAN_TOP GDSC is on.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index d8a853c31eeb15fb1d0023fb8b5a5a59a9ed763b..9312349d19ac5df67a875194a99e4a818cc61bcb 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3796,6 +3796,9 @@ camcc: clock-controller@ade0000 {
 			required-opps = <&rpmhpd_opp_low_svs>,
 					<&rpmhpd_opp_low_svs>;
 
+			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

