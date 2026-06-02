Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048543C73EA
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 08:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387714; cv=none; b=O6qn+g8QNKKldhRnI+lCYEC36E+jubY2yzGPnmHmE7RA1F+iO7Cm+IOI6J25FuX4AzQQvTHeb2n0RKen6lLx48cFqODOqbTAfAUBiO1SljXwh+Tq88nHRY7v6GrvDlBwk47NioPb/nn4sjgMFZ9TDiTy1NTCtNFT1RolmMEL6oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387714; c=relaxed/simple;
	bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IoOvZyn9RiJSWIOIdwjQv6OQGIMLKWcgVVhst/RxweTS87lPQpAp11qcVfycAYQY5wgKl9bBk2eb+sWeiLcuj/96GV0nnqyfwAHD6AOeFH/SN6Vp0NrIkgPU18FZMWTnAVIXUFlEfhqxQpMF+wC9wkwWhB11az23oxcbYvcUL3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqkNaI4r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLjLR6OC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqkNaI4r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLjLR6OC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525ti6C4012749
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 08:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=; b=hqkNaI4rqo6FoMBX
	H4ZyzuLlPHj2kY/iRlEYAb1yDaCLkeF9z0rBJpgRMp/K8e2mk1K6kdiTuI6HRbNZ
	pmQs996N2k0XOqILj7lWnl4LpF2xcXTJ0FfB+0QeRFHdF/x4WXDnNpwNHp7K3Sd4
	kKkufTG0JOXV/Gy52cXTkNbXH2KRAulV0u84FLrLu2duXbM8HcsThqBuTjRFoOJf
	cw4JYyMEyfLjASjYBWE6MqAXQXWajhegIOOoyzkkH82Jj8/3NrYaeUb5AwzHZcd5
	wgm6SaFTa3QH4zq9591DssAzpWGXTaMDHSdTdfQ1ZodL2F0GxyEy+iLMge82baE7
	Crk73g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4ghjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 08:08:29 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-137ea73393cso4881206c88.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 01:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780387709; x=1780992509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=XLjLR6OCC9n2Xa9cttOqrA1Ri9DMsWKU97mG4Ija68gaqmoQ7qKyJfnzzf3uEeonhV
         GRi49r5OfaFSOoZ5IXdRsYehi2osHybaHz4CFZnoFURvT10twclQF7kPnDdKWHZ0UGrc
         6wSq7Ioxn5/YaaF2NTBvW/uE2r6R+jBLUOPTN8V5ZZ42zmR+nxN7Gkjkbo2nePeshl25
         sZ8JeYSIndAe9yFlKRHbQL0z69ZF5EFLHwnM9h8A7gkJGGD+1MR7un5w+KnvJPM8T73/
         i/ByDZXoaBcrxBaMDVqQXTnLB65stoMG/pyMjOncHIDsRedoCyWl+W5de3lEnlAc0SZb
         7UUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387709; x=1780992509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cAfjiA1l0N3l6JHykhKskND7GC3CBlmNzpO/TGQIE7Q=;
        b=WGaNFQfT3If/xqjU4YfpE5y6NuSmBYDqNUpY/ENDj3UrlMqQD7HvDEYpfPBMEIP3ay
         QelvDcNma9M6theTwNVw/kfnrAON6EwhPMdUDGgUxYmLJX169r4xXR2byp44ESYaCRNo
         PjjdfG4bWqNk8KnbUiLonrYV0QU0X3fWnqlkwNvzkihm8eyc1zD0lrPmZWwY74rgqT9i
         HU6Qt4cpWbJPXZUJi3oKK7+H3hQG3570P8oW++BUkaFBOH67zqijdoklEv2dYeH59y4M
         BI7nxzOrdzVUMGaj5JO3V3hJPkJef+F8Jw36U9fFiBspP5qroyjeVfHOHiS4pn5aZpPr
         zsDA==
X-Forwarded-Encrypted: i=1; AFNElJ8EbAmNRf730NsDBLbYOV83GvYOqg24FFbdh8KdmduBeOErDGMkDWa0vSbwFbjbQ35Z5bWlRum9TfI7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm+zacoUmZs04OGfaHPzyz1Yvl0EQOAvStTdSY/y0r/Pje6za7
	CqRQ3YeRw/y9/zsrISa6UB4zH0SNL7tQWxSDcdr7lRJygDo/LIsq885Ih/mpiry1xbEV2Yc4ng7
	xz5kzxzII0u8uqH+SZhhOXRNUvblvWg0mNFtDCwCdh2jPfpawIDJfbuiDynkcaCSv
X-Gm-Gg: Acq92OE421l41iB7cU2sVURa+Oy3I2+nu39Zn4ou/pIZtHa22tjMx9wSdeKPmVWJlkU
	PPxnON4PN4LkOh403rfJ9rXa2ep9fvvSCRtRDk9MEB8vH1QM16dixBusA3IjpPGZ33UaQGRd/YM
	37WTNF3aCUh5nv4ck72RTcr0JkVCm9a95jKjuOLLUvztgtVfYE0EDxWA93HryHlKUuNem6AaHWi
	qNxC2H5W3tENeFYKN24AozTt9v62IN7gRBn3pxUfK5N//mJzQ0v2p1siZcPOXEwxWGSTqlklY5r
	r89VB0yIy8/iLz/mnmPv2kn1PhwXAdzlgJb3p1gsSb7OD9/YWz2HjrBYyatJ9L/EyRHEM+1w//t
	98eHm/F1WK3uobGtwDeqtcPpu3uRGyVMfUDx8Z4oLrUVzbCI10OPXiE0ECXYxx6cMsTsjl09o6l
	YordE=
X-Received: by 2002:a05:7022:41a9:b0:137:eac4:82b3 with SMTP id a92af1059eb24-137eac48995mr2598626c88.17.1780387708535;
        Tue, 02 Jun 2026 01:08:28 -0700 (PDT)
X-Received: by 2002:a05:7022:41a9:b0:137:eac4:82b3 with SMTP id a92af1059eb24-137eac48995mr2598601c88.17.1780387708024;
        Tue, 02 Jun 2026 01:08:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3d8f839sm8006025c88.15.2026.06.02.01.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:08:26 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 01:02:23 -0700
Subject: [PATCH v5 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref clock
 to RPMH_CXO_CLK
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-tcsr_qref_0527-v5-7-8ea174a59d7e@oss.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
In-Reply-To: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780387692; l=993;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=4YeWlIEukC55Yr2J3TwKx6HzkQvNRDSFgt+i8fnXgCE=;
 b=H98TNurlWjladkP+bi4o+RpFOHyFZNlHSpzGx9FP6oNW2HziFKwHwxqJJ5ZGA3y6kJUjBj2q1
 roGThJh7vkVDcyyk4KyPU8ReV6d7YG2bct2QVVM597xzdq68aEbD5wp
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3NSBTYWx0ZWRfX10yvYN9qxPlo
 MTLtQa9viFjeu3WXM9MOaAUaJe9og7U6iAKJ0oMGxe7qpnYJzkXHvz9C6thX+UHY3JD3IG2Hmh5
 n74RztB/9iVRf/zvRfH0T1to4BXbOR1JwcGhzUK+sZU3v+o5yaeCQKChn+veBTve0hLxyBdh4Ie
 9H4iw/sdLt51bFPy13SByLGJOra6GAYltotHXAQSZzc+rsWoL4yffRQOGhMA19mPH39UGWc389J
 iJAIUMcKcRlFNB0EPGBrs+gy+xWD9YrH95Y/z1cf9CEetF1WWLDn8CKC5rRNW+NM6a00jlb6tri
 SzVIYioYkhy5VjTlep76LUCW9cLtVFJngroi5scEfQI5+GncPIa3uR+4UrOyVDRZTPXVPgSJJCN
 miNSxRWOu/Hn7bg3p28fMTcunaNZMnUBDcXmpv7MC5x86fmEdVStZ2Ev5tDURYr3h8G+eSqKRoN
 xDu/fUNOkTT/MHh9TVQ==
X-Proofpoint-GUID: Sr3LbpHzxdo3RVD9hJp6hHQPDSNcDp8I
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1e8f7d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CR5IuhOMo0Dix3IxAI8A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: Sr3LbpHzxdo3RVD9hJp6hHQPDSNcDp8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020075

PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
directly instead.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index eb45adc8a0a2..e6c059708912 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -115,6 +115,15 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie5_phy {
+	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
+		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>,
+		 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_CLK>,
+		 <&gcc GCC_PCIE_5_PIPE_DIV2_CLK>;
+};
+
 &pcie_east_anoc {
 	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
 };

-- 
2.34.1

