Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECE8322B7B
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097978; cv=none; b=HD+uCnTYfuGh6X3/O8Bbw0j24ewSgRXLRlWZOnybvczwPOxbf1rVXp3V8guM4OvvAPO2KCuCsdAhUtUQHcK3orp4oP21dt+uuoKctLSGlrTRJPmVJU0easIcC23xpJykH437n5u6KC/zw8dihBDoOxKbHXQTQDnWWLcye/UXdmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097978; c=relaxed/simple;
	bh=of417GscjKdbAnhwfbSWrlsJm8LWUKrkEmCLH5aShT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mOTsM/94I9Op/7+nEwvomYvvjDFwx2CfXx96TO/h7wWw6dLGR3zLs8kjH+3ib0gmXgEvauTc7CCgtt0mUO2TycqQjKPzPYv/gw9AGCOQgFv+hXmbnoAUEW9oJMxLBZgZF8lHtuYP0xPca5orW9xr5LGzO07cI7AY+crLmDAp0rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qqz/K3X+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UDsp/mY2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qqz/K3X+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UDsp/mY2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7eNmL970086
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YvXvwkEtJUar+AF4mcltGq
	qcUdDyNha0AyAaMHsVw1I=; b=Qqz/K3X+IVYCds0PY48txgtanKUESkdprRr5B6
	Sfx86MEoOONR1Zlrj0it4IB6IDC+MdOtqpi4OOtzYQFyt1urqLwBaAdHacEWgEp8
	gSulg8w2isGQm85oF57WlUYCLoYMnGk1aXR2rIWqgwnXIcZNUVIe1+nnPToqAqkn
	k7h9sx3vRKAXgfr/HAfGBoGDsKKTgI6cpPDfdTvQ9cxN2H17+m/i6hEIM44ImK9R
	wnrMbKsCurt77RxVfv0kelkKjAFhEeqctAML18DLoriWIWnvCbkFuHD6D07FVJlO
	v9DDL1ll1RK5MgCEgM1SCaLMAAoVlb8BvRq5lk2KDHosRTVA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7wr8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:52:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c16233ee11so2820838eec.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 02:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779097976; x=1779702776; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YvXvwkEtJUar+AF4mcltGqqcUdDyNha0AyAaMHsVw1I=;
        b=UDsp/mY2DtTQic3APxcC1yeJuzVBbAjgHt+00/0dTKf5B8FjmzSXAl84rFz4s2zDqg
         7I4A8swA1oT43OUJBhW/jz3u0UySShOJwvH3rFa+cQJlevhLaP12w7PpOmxa6V72IpMs
         Lm56odO0EFcalCEMNi6G+VbTpYRQnmBJ74TBhptInAittXiwv84QDiJmGSI6gxMjYkmv
         MSfAbbpLPTd4lUfE9dZxHTHs4IN0Vz754uZG1ZWx/sUR7o9ZXjAYVR3nWk2mZDmGMiA5
         Qn2/vRrXtbgHLy/g7F/1TGcgJuDH4H9ok9GNAP6cLA2XyowDk1kHxUnKu2jFpmdOtXXn
         siIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779097976; x=1779702776;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvXvwkEtJUar+AF4mcltGqqcUdDyNha0AyAaMHsVw1I=;
        b=lgaFTh+YTwfC2F5jzXZvSSiApR6YlqM/oFSXa40HrqaXXAv+mXlD+kozcJWYMNauG5
         GY70SCxDn4FfoAqZOdQX2s/3QaD2y1yjN8iUY3hIf8BATlf1twZEe2MUH7SmHsvyA5jw
         GZ9DcpzILrMTplMawfOpUxU+cHw93V7zRsf4A7WLWrvGchToWOu4/M3Xofq5Z2YTcOS0
         DrKuoI8MC/sRmL1npRKsWI/FBXfOHvYhWQwcBuDA9d8OL2BhA8NTH9vkcYAz1JVwquG1
         7AKQEKzsgihHQID6bP9TQwIPIGqZcooHhjitc6Ho8hlgzfOmt4MJOTpznoMCCqEhXal7
         WOTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9d6rkPe8mLJp5Z7CJH2iM3+io2Sv3qIXX48L5hyUAMnfoRHzDUX8oemnvBtkIdKSvyDOFbergdYqTH@vger.kernel.org
X-Gm-Message-State: AOJu0YygoLI21LVhZvFvrMFWFOZA3Bfsazbkd1gTs2u/ce0PLvGGrUX2
	P658jHxqcO4/u+s6aG4kB+D/AIc/SnntNS71QjuF3RNIzLh2ar6wDOmcZ+sMjuIDXL1JtCccEFA
	js7IV+fkUnmBY7911ZvVl36YmEYNn4ge+uu0FDRucgHpGR6VC34/nnjzVOKTVBjtm
X-Gm-Gg: Acq92OGUlKa8dEOU+WhtnmRrPkRR/wDRP364Rg9ZzAFGDoWnU99nIGuaQ3hjEGWa5by
	vsC0nb2O/2GtpVpyHT7mwXV5gpswRvnSlmT5pwPUGuF3g/BNvG2Z5WFAc553606APP5wdGkK1R+
	nrDn8sOTtbu8ha79hBOyrfpWpLj7u/bbHIJqhKs1XONFHUWyV9E1YlK92zBGzUC706fhf4+Y6gk
	GSt/vh9sugKVXUlDDiPnl25jKz4D9tdykRjM/binNcOqnpjPBMWYD5SV6r25xyvOdC3R0W9y5+R
	Pz2LMNvUhzdX8wOE0/T9GTWfsx+OEme3kIROHfsbXV7OFEzBHYv2+m8fNuOKUCwPwTfeYTFehIQ
	Tq4P9dzUD/hftq//J4NOxDLlHe9QAJ5ozxRFiWlxs4/xrWgv2yVSH27duDZvpVLCeSfvzWcTwZy
	KrcM59ft/xhA==
X-Received: by 2002:a05:7300:4307:b0:2ea:5057:a331 with SMTP id 5a478bee46e88-30398655963mr6287207eec.21.1779097976158;
        Mon, 18 May 2026 02:52:56 -0700 (PDT)
X-Received: by 2002:a05:7300:4307:b0:2ea:5057:a331 with SMTP id 5a478bee46e88-30398655963mr6287190eec.21.1779097975658;
        Mon, 18 May 2026 02:52:55 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcd0csm13994915eec.24.2026.05.18.02.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:52:55 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 18 May 2026 02:52:53 -0700
Subject: [PATCH] arm64: dts: qcom: glymur: Fix wrong interrupt number for
 i2c19
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-glymur-fix-i2c19-irq-v1-1-7d5968bd9b2b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHThCmoC/x2MSQqAMAwAv1JyNmCLC/oV8VBsqgGtmqIo4t8tH
 gdm5oFIwhShVQ8InRx5DQl0pmCYbBgJ2SUGk5sqL3WN43wvh6DnC9kMukGWHcnZpiidr4z1kNJ
 NKAn/tuvf9wPxO2rrZgAAAA==
X-Change-ID: 20260517-glymur-fix-i2c19-irq-eda945df62af
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779097974; l=1351;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=of417GscjKdbAnhwfbSWrlsJm8LWUKrkEmCLH5aShT0=;
 b=mWZjj2MyCV27OBRk1TyCJFKRcyHSGfjtLj2EPmccgnJYpL4pBYnp6BbAUzg7z6lN9RN4bL6Nn
 XYVbo5XMOx9C5j4fIdxLno50tkzvLDfw1cC4af6I070OLCXSqfOZnyv
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5NSBTYWx0ZWRfX+AHw58sA0cFA
 ZR0EAswtjB/egb/cFGm9G5BlAQATJWPNeVJ0w/XwJojZfXhtWO5qL+YBTMn/nHZT5dUev5y1PZt
 Y6yTCsOy3uscC02VTe9a7eNrnxMnMGoxzRekeF2Go76CsHfO2ca9OTgY8C8eoqxNaoMiJUlJDNz
 yhWJvmckiKQWLelsJTye+b11O0fCs/8oHn0iklbdWcl3S2tV9rfQduUxbuT+wyuLY1ZRGO/idqy
 8ymzDtgseinyOx7pXu7IJUptcYNHjsTBa4Sg78A8ex00yNNAUn4UHa42PRKFTsBDuA+lL2whHx8
 ZiKjFNW/GaQDkeExLlWZ9uCJg4mcqsP0dNNmBJphIObzrPWGQjKmJObbvNnHp0j+RYou1lOsxOY
 voJBNT3HPR0AfLnI0Q4xCHru2pjSSyui7srtWuuBKdrAG9WfsulGcP7NVK7X6a2ZE9d4/dJ6Dot
 xpy3M9QD8wXlKHI+sug==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0ae179 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gUn1S9SPUxNGwtii2nwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 39uo7yWEvBue5LikrXnpPHHx244eT7oj
X-Proofpoint-GUID: 39uo7yWEvBue5LikrXnpPHHx244eT7oj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180095

The i2c19 node at 0x88c000 uses GIC SPI 584, but that interrupt
belongs to the neighboring i2c18/spi18 node at 0x888000. The correct
interrupt for i2c19 is GIC SPI 585, as used by its sibling nodes
spi19 and uart19 which share the same register base and clock.

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 0c5cb8532b20..ff2c66eded08 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -968,7 +968,7 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
 			i2c19: i2c@88c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x0088c000 0x0 0x4000>;
-				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
 				clock-names = "se";
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260517-glymur-fix-i2c19-irq-eda945df62af

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

