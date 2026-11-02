Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629712;
	b=M/xdgW6vKU4uzFQNEgukPurjwHoFTtljwh5GwNuimH0ksoUGZ094b7iNx15v9V9dwBht
	 LmBcrVn1hFFeu59tfQjbZPHsrUmB8OjBF6Cnp4TrNF9cbWAFE2UGsHZiZT1AEJauON8Iv
	 WScuyHYXTKpzXzOkj2YGdB5lELPBFNGNrrzwKdnJFnnWvUfSyHqlHPJF8dbKN0V7wIPL6
	 5NneQ+s5b1ZHJCcfYiEO//aU1qIUyHxyPnxGvnlUaAohYDSR6Uge7AoYekT8El13wQIs3
	 B9UJels4cE3MYLvjdYleput/JvLjYo6hh0xnjGF+v7cAmtyIXWVZOthP4UD3VV8uBTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629712;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sIINajvqYe7V5t/tRiFthvALg2gMWiPdTmYACRy8vkM=;
	b=H67sZhtQijViRQHjn67ipf+nu4RnvHc6G+HM/OaL+tvh4YPogNYE/tKWsO5Budo5Ppe/
	 xLwWkTnpiTrF3nMhXGAEX1vGrYW+ke9XBDNgloL4cBCXKeAvF38I4M+lKKgeNzabRuZvK
	 EYBUjLvVWy8acV6tAmkKrbLWIyURyZhkLopt44tXWogzkvoZkTQH3ROhoDQ74Qe6WeBRJ
	 JOGXxWkjy2Hd1SI1Ta7lyyQXCCYaqXSRCFx0VKfPuTqs4MChk4tjxAKiI6YkvKVYypF3p
	 6VG69/uIp6aspjP7hGs0E4I53EnjMtTyjH6WlmAh4/HYjTTg4hzBc4z/DL32WU/n9wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IaJdH8oJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BHGeQXmi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296B360A354B
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 14:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 296B360A354B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IaJdH8oJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BHGeQXmi
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dp5bL894074
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 14:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sIINajvqYe7V5t/tRiFthv
	ALg2gMWiPdTmYACRy8vkM=; b=IaJdH8oJ20nz5orfJN3GvO+K2E3PG/dusVY5si
	+VYiM2CZtS3gmduNpE86WUpFgZHuScLvTiYf3tBHsOdWzAa+MlWVS1VAKGGrlvl2
	mURmga18RS1Nosut268iPqVotQvIcMPq4CmPizrYM913gFhSP7flGIQ4b0efv7I5
	lxVv5epn/gNRwHOEIFKrlre3MUWZWcKh95S4TpVZS8bEPJK44jyyhcEF/Mirqjvb
	/Ofpv2w/qWqglu0Klt5QzW3cFnLcNujniyH4Ac10P72hcmGcoo3iUwEhac7+GHpp
	pzBSykIsAnz5O+bAKco1Onwfw32rJjanjI2cpZNNAMUs8oJw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvs752-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 14:28:31 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0cfe694c3so48087277b3.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 06:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629710; x=1794234510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIINajvqYe7V5t/tRiFthvALg2gMWiPdTmYACRy8vkM=;
        b=BHGeQXmikQAPWv1/TVofTEBTD37r0Re+TumZrk1BjoNafLl1xLcqfYXkHqm5VmVZ5e
         XPMmMpOUPxV3KZv4CMgS++/6s+l8q5UQe0MWfzwDMvxe4EuEm/AnVj0rU290bqj75AUj
         +OEUQy+Aol7KnnHxSltGGtHkgPINCep4LzkIKGVIUGld1np1kBCTl6U51ex0fnIaZN6K
         dg0o3dot3lkdmKPi1obSluuPlyS4VxE5hAu1L7qrRTV5DFX0PfAyWLvjciu528YTvWM+
         I2E3590FdbmIuypla1kITjPRVq6Je59SO5gcLbt/Pie4Vqhpj5lLwev068kAqaLbH5tu
         feaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629710; x=1794234510;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sIINajvqYe7V5t/tRiFthvALg2gMWiPdTmYACRy8vkM=;
        b=v76fWegut5yPJtN9wdioTZgLB3cMXz8wVWUg172xAuCH8gbwHQ2YBirCrk/Dn1vQDn
         0iQZJlsXdWP0DgX3rChhPbSrmzdRr3JBDmaqjeY4B0Rc14TzhyvouvgCyhYo9fUG145K
         2HjYDwbT+BEVUHcSNljVl4N2Tgy+WLzshYpC7cQGc8yJSo8o2hUPxdZo4xe4jE8+7hnG
         TK08WZLG6DhgQzddun9IivHhTtxYwjESDhzK94v2SiSpEumoNf/XXFX44wWJ842FDKGI
         aYgs6/zF2Wv8loeeTB6cGuoguXQsvuatWnRJo+9GnWjiroTitFMhBEQocO5FmYDHwi64
         Zonw==
X-Forwarded-Encrypted: i=1; AKwUvByXMJrwFhWeDsCkuXHEmxaSGsZIrgNQA32zhgPoe29FWVeS9JTHtpoQlUUIs0Oo8PG5UZnBcCgqrWXe@vger.kernel.org
X-Gm-Message-State: APuU4Z/jOm64J+FyKVCyL2y+pctKVBBQHx5oTuOGmXRUvk3iaDnjrez7
	l/DvefCanPqFoIj8MGntoEeVl0XNb+lt9QAsZh6x5of+svlE/mmILki6T4VnlEYNkvO4zydRv+3
	l8kY/aMT2J81ig4UgpoaJ52kxO0WpRofR3Kwzch9iG409QNEZm0XM7X2FpfP/s8gb
X-Gm-Gg: AYBFou2yYd8C6ZsME6xUKWwlVProkPZ4xqOIcTRUpNzPALwGhf3P7eTMpyInbsdFOOT
	RjfjLNtqYYSEqw97ijFyvufvYoDzBYKex/cWy214coe/ql4xf9DqZzfYoD4VpOQKszRLtYBBGRP
	yXYdLnfR5vWtl1gz6oz0sfQOfCi6z7BrFrcv2d9ujP8Yj+CR2DUX+PVd/6VKWT9sjvF23xc9iEM
	lyiYex3r8l9/ZpX0uAPfbXcF0TMcdIE6E+u8XGnRISS3BcX7IFvm3ItiE0oH0/JhZl/1eOOcZNA
	Nlz/5F54RpZy8gtg6VFe/lhT/xCfpmgH3HhxYDpaByBtdkNqeGJqnhMiRBHAWTHvXgkjtkHBf4I
	OvU/uiFlG8v7qmgLi1bLVfv39aVGNLGzeAk7WQLGF7I5eosH8XGTQzgfa4+X7eQcBY99UFkXU
X-Received: by 2002:a05:690e:11c9:b0:677:c78b:f5c1 with SMTP id 956f58d0204a3-67ba4c80ea3mr8660232d50.4.1793629708847;
        Mon, 02 Nov 2026 06:28:28 -0800 (PST)
X-Received: by 2002:a05:690e:11c9:b0:677:c78b:f5c1 with SMTP id 956f58d0204a3-67ba4c80ea3mr8660209d50.4.1793629708148;
        Mon, 02 Nov 2026 06:28:28 -0800 (PST)
Received: from t14s.fritz.box ([2a0d:3344:53ef:7b00:ab30:5358:f91e:42cf])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf27263csm5188775d50.4.2026.11.02.06.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:28:27 -0800 (PST)
From: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        akhilpo@oss.qualcomm.com, jie.zhang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
Date: Mon,  2 Nov 2026 15:28:12 +0100
Message-ID: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae89e0f cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DMYfw5cCtgNNA2bR9BoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: Stp4gjV-3SavNRCHPIt8Ky6wPVNjMKra
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX5Ll55Z+Bxn6s
 FQUblmnc4cOMKSAIVbhq7wO6xD3U09HduqqA9cc70cfTWI3XIfatdXgkjmtSERJJLzjilKCYq3Y
 gceTg6BR/UwwB937C/jQb8ygpFb5P0U=
X-Proofpoint-ORIG-GUID: Stp4gjV-3SavNRCHPIt8Ky6wPVNjMKra
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX135XDR11DKoZ
 3iiRQIYNNcUt6YICo44k1EB9f+9KLd4MUfU+SoijzX4oU0ee9UTzT/x39+GoCgrGAkjt9VfPwcu
 WcvoIdqeKE2dJIhlyeBkrslComLi+sDmcR7UdrSG/zMsJg/IEfZipqWIv4lsIub+1VeUiVNP3Nc
 tN9aG9tPspZCDEhOKQPwFn1rulyABONpNhZGx7EWu+5dLR0d0VhYCmO+dkpNPtbVy05Uko3+4Cr
 u9uwNUWmJ814Xq+KqH+c6SO3JXyM59p1x90L4QqxMvEZ2K0FZtWdjMqg1LPfzaV6vkB0gW7Oixo
 xQshkMp7gOKNMiEfg+IC8F6SGgP/UQ0v/sfEpEIa7MK9uo2wk/DfMhtvl4IEzVX1UsZcqcvG27p
 PGYavu6/SYgfsfuGVo2dISB8isWSIgUBGUOcyl8nx+vZVfa8OsxuD73s6IDM5ZNspF/F17f+F6p
 BzVrC+m7tTLdEZVP0hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020057

The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
was introduced, as the Adreno X2-85 found in the Mahua SoC was not
supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
X2-90, which is not what the Mahua hardware is.

Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
driver carries a matching Adreno X2-85 entry. With that, the nodes
work as-is on this laptop, so drop the board-level overrides and let
them inherit the default enabled status.

Tested on a ThinkPad T14s Gen 7 (LCD): the GPU and GMU bind, the
gen80100 SQE/AQE/GMU firmware loads (GMU firmware v5.2.38), and Mesa
26.3.0-rc2 reports "Adreno (TM) X2-85" for both OpenGL 4.6 (freedreno)
and Vulkan (turnip).

Assisted-by: LLM
Signed-off-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>
---
This depends on the Mahua GPU support series, specifically
"drm/msm/a8xx: Add Mahua GPU support" and "arm64: dts: qcom: mahua:
Support GPU and GMU", which are not merged yet:
https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/

 .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts     | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 255857cda9b..189dc3fe542 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -693,15 +693,6 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
-/* GPU/GMU not fully functional yet on this platform. */
-&gmu {
-	status = "disabled";
-};
-
-&gpu {
-	status = "disabled";
-};
-
 &i2c0 {
 	clock-frequency = <400000>;
 
-- 
2.53.0

