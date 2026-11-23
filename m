Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467340;
	b=1GmQucJ3jpCTvVank8a/AAUYSvFD39O5EnTS/3illVb3r0Z8fuUpwto5OzmnnN5iFTjw
	 uC6YcaZELFhF86k/sGh9TunSXue0hQR8+Oh4GVQJlgyWo95kZg2HWSkUInjLHqD2v1UKc
	 1hdrOAnMamvwtkgk2o9lXgXIwflgIA4gopeuE0MwTF1jhilx1UUjyTbwyGIT0F4V7kWGN
	 Lqn6Sxvffc8dlbVxxEpalesEqTCY6SmV8+dnepVbk5HnysEYbXZVnMzzxnX88R51tDNi6
	 kY8HokZukzSvTll2aJJoQHBQJNIp2oDo9HilyO/9uRo9TCzFmsas5k/+YJ++A3EN1dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=;
	b=dhhlf3P1Il1H0aCXGYqtYDRTb1IF4t80DnGxK+PUFwhMoWkcgjo1nr1+6nXYmt+ckd5N
	 MmmaIQxeyLhC27ZOV2uN2rcMpWKsaYqFt8DZwkfrYC7fyMG1R0+wP+MT0GjzwIi/RZOZu
	 zXKW9iW51lsvILciKf64YpT4xDqnAa13+7mZX5HKtz7U2fkhK/w/onAaBx6y9/KH8k5UO
	 HAMBzYOc7Om0YCjDVxvVAerj82p+iVbkW0HKAC9Fe1gpKUJj6KrVS/EbqTXUTsRjCxfw4
	 svh4bhznVYCeHjcCzcCg0FwUm5RHNXzqxfC6QIyZBZjfAdB8gbBCdd69BF/e9aK48Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UWLFtAe2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gAjSoauk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AD1606A333
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41AD1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UWLFtAe2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gAjSoauk
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuYmE1579750
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=; b=UWLFtAe2S4Q8jUG3
	mTrIiniGHu/xf1FQ8LVv7WN3T0HiTcefhVSzp70zVDcu46R/EiuwfBGr2oSGGxvg
	9+zfFJ5m3j58wGgTWFJ2oxM6Ul66PA2Jfoqk8jKiMRMaS+zBnoXqDJopwLiOixKi
	EUQo1bGQMsTmjE9Hv76okRuAIWfunDw7UcaTX4vMF/DmWB5Lg1Q7/m2LYJLB+bbI
	j8vvvTDgc2DtbhnxDvcsaHSn9QtDPIiSPz0PO1POE3uk9nj+o5Yw0MP6DkoS/d3x
	KAasvX4e/U31MVLVZNeL35+PJ+8dipLM7OgAOaW/JlbdIGxCwxLTqgvRJJ+Tfd1v
	iI7PtQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0tbqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:55:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5172350eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467338; x=1796072138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=;
        b=gAjSoaukfJEXi7HCHnJfD84msTrNSOX5ADp+UcztIDKxPexyTGmRpQJxQPloohS9kM
         JSaeXyzXDFM7XqcScqwbQPei9FsYtZldxFzypyZyoGR4cGm9g6hNvWeOQEkOJ2rlHM/s
         bAIN6wTWrGdaYkSNH0FGWSkbUt61fX58rvEj8qC19YK4Zejx94Fits5neyxOjeUHY6Up
         lGJEi8sTDVDGJy5x5MikXR14JTVDn5rA1WFV8uqP9Z/KUGum74cQJU+p4X7GrdxamoOS
         TCqlTEEVb7zakToV7BedfRbXLQ0OIgUUNhSUUC15t1AoFDntAg4T79CogpM94wI5ZO9m
         1JZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467338; x=1796072138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=;
        b=nOs6bhVc1D2Xlxi3zrdKsacK/YbEUlo4tJZpEMad1xeSYpZ0pP2fJXUROIXbioW2AP
         D24JS33XBgS92wsjB9EwIfmF1bynZLrTcZs8eRtDg/wQkvFfe36HZV6GK7rZ3VP7l2e2
         KM4wAZqqSytm9R4owfrelvuMb1sYvYTquYtqFmv1VBj0sBGT4JVsYRktpg32vyruHnw3
         +13gqc4kIwcFD2huwFJjJ394i6W2FBPYMy0rAcu5Jy3vRk3i/C8CnvBQ7CBdZ2At6EMC
         f2szET26ri/dSJLyfM0CZ5102dvx678IPQmlKGcTfPftIIudNH3GXpaqkFaRwJpYuuUl
         +SHA==
X-Forwarded-Encrypted: i=1; AL+hErF56w1Qu3+7Y0bpRDCSIUCMfbI8tQLULd9FDUCfBT8Ob/aWsqfuquTPydWj2rGmi7++BAmTR33qz10f@vger.kernel.org
X-Gm-Message-State: APuU4Z/XaP0sbf4jlfGQkpKQNVUqGrbG4oK9VhX1YhYN0NnrSqadYIb9
	ZfzpRSGmq4nca38BrqFv7DBu1xz+Gcxc8FipjFcoePDiKyV/1fyqycUxtEQRQV85RwZHIN2CiB6
	LP+cCh9bM24m0AWGUmdWa3uuv+ZxP6aFnGXemE7HbeWYAXSG2VpvZ4LK40+zmkKVJ
X-Gm-Gg: AZFdTZe+Ze5fmMFKaJPjWInOchFvN3BuCqYkmR82olFPhQ//96VhRBVsvEkVJjxuKIp
	gKvCek0/6I+q+D3DJHku3cTJ/D8pfntVONW21KLaS8zU229rpehGM77Wm1AO69A97JZcU5v9Ec2
	RAfHVsua3MBnzZ/ovln8I9y2CYIBy187Pl1YVtHcmD/1Bi02XulmGReEfZ6vV73pxVtIZChdVNU
	HTRJJ/XtwHt3wdO3pSlrc+D36nud0HCPNjbW3LjW6nA5Sg45421eVwTvXhdcmcQH9BjpjXm9uur
	fH8gt2S15kvwAJV/eirs1m0th+RonccfCXusYtvx4LCTMPKsYln7Gs/dicLkrbWsje1XODmzYkL
	UnWmEukaSUF5fRyJQwH2jkUvDXcql9XuHAeiq+t0215V+2qlKyaB3kKzptFZBxdGe3cwZjJcOgL
	fYc+jseYwg
X-Received: by 2002:a05:701b:4541:20b0:1b5:6e71:3f0b with SMTP id a92af1059eb24-1b56e713f86mr5295863c88.18.1795467337938;
        Mon, 23 Nov 2026 12:55:37 -0800 (PST)
X-Received: by 2002:a05:701b:4541:20b0:1b5:6e71:3f0b with SMTP id a92af1059eb24-1b56e713f86mr5295807c88.18.1795467337385;
        Mon, 23 Nov 2026 12:55:37 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:37 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:45 +0530
Subject: [PATCH v5 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL sensor
 node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-5-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1300;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=TQ8oMR4dp6+o4PLOcph+lfW15bcDXGH73jPsR+cwzaE=;
 b=C5ta8bd5Vrxxa5KbLb19w2pR0Zq327fKQRmZ4/uw81a02s8hsXDOFC662q0c8jyTj7xt/Wwxl
 kTo+phYoe7qDJH4Q+Mo6ZhjupbPnOQacYERjTqPlw/DkZBFXITGkTjB
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: 6qYjYbgMruj6-YRA9u3kR1sMDZVeyREy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXzLJ5sELPQhFf
 vfvmy0QzUc5aJVw1fjSh4IZpZ9EXbPIjyNysX+JgFl/89vmZZnTJn6kK/Z+12TlVpv4e++oSZ+g
 FM5aw1puLMat86wZpKxVaVm7taaK/9c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX/bbpfROaMhSy
 qGJJqklf9TArVBBXMKGjv5x/LBX/MrNaa6rRF3H2IWFuwD+Cn+Yxg0Q5KxZFJXU4lN69XWPVX7j
 tkJFhI/AljMDAtxJHquGTbDtWhTAvhZ3RVccM/FzuG4BiimO5gBoP0ucm2Jl0bHhvGBUwBP6wD6
 xkX+gqg1AFRI4sVwznoVUCMvBQXW7jAq3rUqUHNprC5xynzmZog/kJCJC57udL+8GtOzkQWViiu
 jFEmuT3qexclCQFEkFomljpIVrr++Vg2T1KUcjTSl9c15Z7Ahl8onxlImtmbpf5j6HItlmKGImX
 jy9G9vb8uAQCTFJmFxwZGUVUIi1o9sjDyjfwnH6b0Dwpwuy2+C+8wGkvOMCIc+s7vnG1C/ulS2b
 6BjHg6WRG490AnfxlFZM06XqRNDdp9jQuJjPNPylwSarjBQP2SaeyAFNMkeKeRYkHcKshVol8MG
 rPE38zDrXfwH0PVUQgg==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04a84a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FmpG-t0u5PG92cBmzUAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 6qYjYbgMruj6-YRA9u3kR1sMDZVeyREy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
index 9b907f69264b..72a70b5dc9f5 100644
--- a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -48,6 +48,17 @@ pm7550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550-bcl", "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550_gpios: gpio@8800 {
 			compatible = "qcom,pm7550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

