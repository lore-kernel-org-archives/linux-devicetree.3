Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467372;
	b=wzJdMxmNi1qdwpYLuhy7cz3Ug0ZTBV7NzEgbCKNmzwAi3JdloCmK4+CTi5u8HABSwh1W
	 CG/fOfqPyqDzYeSTVfTkpVWR5mOn9FejklnWsQ2v+7nYm5p87v5Icleld1bVASh4E9z18
	 6LYU2E9/ZzG4bf7GzT3G9LWfHS5QZa63mwx4/uBtNo9O9kFm6ZRjnZROEDORcSIJjBCfp
	 7Y0+/oaYjC3D8m7fd65VO6tqGTOuOo5EIcxG2089vm2amJG06U+ntXdfCRjKwwBWKq+Cu
	 Y74yUidw8P2Ss6lfGLSoFYCJsgBH0Ug52Hko+U6erGR5uur4BclQGT0P15zbQLoU9mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467372;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=;
	b=0E4tdT6fCXtwfJ1iJbkwuKzX2faDCdkq0KiAWKmgySMYCHE7dfF4XqRhhWlBmsoddCIQ
	 86RaMqNKWn4GIJYDA9reu7Dm0odsO3WRMOd9KgrfgygJ7IOPfGerv2O4Ed8JeCKpB2Qf1
	 /bndNig2idoaYniP/RzZVh6IEcypjuwcAaxZpNbVWHYhBQ/bX79h8PbyqvH+tYAiqJYtz
	 vs2oCkY8lw3CDxuM5ItyIpu5lSKTXbN+FnjfDGCxEiz4/PwcfeoLjI2m7EhwHybi66aYB
	 tM2vIxRV9cnZ0m8QYtiMv/Ri4IuWvhIjFnBV/10VoDVwuuIwhaN0b6ZF7tLVwxAnh1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGlpvE31;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKYlQclY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECFC606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECFC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGlpvE31;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKYlQclY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuPbd2349996
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=; b=YGlpvE3185+zcNRC
	Ke6y79Wm6NsMW7wrJaITFCutoGy0RJTFyhQrSd3f/2P5YJLxm4aWKl5/u+q+Qx+v
	pUHFraYXZFCvEenCOgBvUsiH+fGFlBg9Xl2YzVhGOHr7DuHoOfYuTSt4/KlL3qzC
	1vmlAHOdP4TSU4zPU2SyUILNxISbbbYrHOQ2wla1ehB4I+X96fAc1lJPE20vcSbS
	kYU7r+y69Cuxtt70ZuNo25rIm7jnVjK9VwMDQq88ic5epIueLXk3Ak8CrSZdczwV
	l0fHUmOJC9Fh0iBgQ2deWU1IuMKOgJnjoFJ3L18DiryGGcMrnpPYrWQiDynPS4H9
	1BmFeQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a3cyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:56:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so5565992eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467370; x=1796072170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=;
        b=JKYlQclYuzvlvYssp9dqZgpBlRc23gqEK/pkCbb/vCXIKAW/2boZ4q5ZwK+64/ND5z
         hbv1PH3UGz9/BuvwBM8Z/BrQzL/BLDutgdgukmmWfbn/m06BFsrLXTu0ePDEShpUx5MH
         acPPgUiE/7MT8wr3/QTv+SnJgIGA8PE6m6joLKorRoUinpdUji5RhF4SbxnF63Hecvf9
         ooPzhOE5aiks7cC4EcZLGdcVbxqC7K9M5udOGoW/0S9Zo2+ObEhMVzIWRsr4damQMmn7
         zlZXQLXWLXlsvmvkZPooD+l+zmT7j4kq88WwI2fbyBg8n9azZ/qnla+R20NN1wqS+h2U
         fJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467370; x=1796072170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=;
        b=nF7aMRXBtXvL2DDbZbyAOo1/13keUUJTa164xDQGWXtTgqF1kuYyfThKuGCIiNe5ql
         a70ikz511sUcmgLDGLybupu2IuPM/ghUG25rx425at2QazyD/pU48FWDuK6J39hY+Kc3
         QCpiQ1cri01IrcGfLbTaB8hmDX2MqgBAlwTkLkBUWILf56UFRcvZkWWkhCtq9X7QQ5X6
         2Mc6LTmZbM2C6SN37sQHt5pP29tMBn8sbg4Ib6HY4hnNAS2xwrLquL+VYaauIfC7Z5Qx
         4NSzEam13WDufHuT/3uj5SUBHjnnF6w4i1+2DxDPo7koxf5+N2p6IbItqGfYKSV89RWn
         xzvw==
X-Forwarded-Encrypted: i=1; AL+hErFJBnR825jYiYoL4DpufeA/SJ63ngP8+6Kek2aqPtFKuKcnu3QUowzZn6nWGx0Pe3aUrWQTkcTyKAA8@vger.kernel.org
X-Gm-Message-State: APuU4Z9h2L/HWgUsGzZ94NSo9koMv4JBF8ErFy6Hj/cV4m/wtrViUjKA
	2Y76qJTR0dka7RJiJMjzlgsvG1dUeJSKo6uJu0mfmdw5PUDVdrAZvKEmmAPuy8uec4vVgHu0q8h
	iMdupASvjUls8yWTzLLB7i4XIzz/f7A8T7P75+h9VFVGVOyWcLUpsDXHq1vHjC/zB
X-Gm-Gg: AZFdTZfI/lXVV/kq7OMPVbgXR6oCkOy3PJW5odAbS2UVt7QimsHV0ujBdQ3anSwUztG
	TEVKF4o5ZU9KoFaS76IECfMIFSbo/nFPtWP2urUDqKqi7EApf8poPVvdPECsXj+knFbavpiayvj
	AOU9rpepyF77TmvKeXZn4bV1hoEK6dtWlSOUzsjVIkti56VmjTaHQ/6oFxIjo7uPCKLy9EsoVyf
	5HjNB5hdrGBLSnFXCyrVLT93xQF9gf0h2PiF710+Y6a53hMyoXx3njFJTQ28CHAdDa6lhyJD/IT
	UQur/aCfDUyZmHXSkSmMGKykvHXG+5fzwoM32D0IljPNOIpTm+9QpetSt7wWe+O2dProsWOjNjW
	p47NFwepWDSp7DwNOZW88UttvTg7Kd7DQTiECcbBlcXakNn/zuJ/w7ly5V44J8onT22LH67y0zG
	38iLRa8T9x
X-Received: by 2002:a05:7300:1909:b0:383:f646:9feb with SMTP id 5a478bee46e88-3856c4b8304mr19946898eec.2.1795467370512;
        Mon, 23 Nov 2026 12:56:10 -0800 (PST)
X-Received: by 2002:a05:7300:1909:b0:383:f646:9feb with SMTP id 5a478bee46e88-3856c4b8304mr19946867eec.2.1795467369912;
        Mon, 23 Nov 2026 12:56:09 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:09 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:50 +0530
Subject: [PATCH v5 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-10-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1326;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vQA8tXnjMgCPq3216Osyn7C4Zn7d/iM3eHvItTtMIyQ=;
 b=7o1OGucmXYOKDo2bVa0gCDnP/K9W9ENk6/wgM8rCg5bs4t98Mb2pKpchVkjKTEeowv0fgDD6U
 tX3jHhP85+KAH932WIpkebZ5iOE3RIZeitr08mZfWSp0Qe5nSe0i/vd
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX13XH3ftmKjGb
 4dg95Pyw6acU8LNwsz3imVOne7pJI0oQBHPdpOhGhxIQ4U7xOjyI7j0ueLBPaw5dncIrY8snjI+
 2vJq7IBptcjr0Xc2lgp95FxUT3gN9zE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX9gcgDmyeNK2r
 yr5UwALVO8lY2Yr5Hl3ZwfrePG1pr47HRqhuxw2UrA3YVX5H4zfUGTz3ALlmGSER1z+DhLBucEq
 8h+WmILWwknme/vmhtvlMB6TnYYeLomP1Ys1wXC2zSYzV2yBBYr8cgMf4KxoiRyUsPsy1ECtfNT
 cr+mXWNg/qzgx6vLG5DUrpI1sfvrffzgyRzbT/aD8a2aQE+4T2/v2pPG37Qb/IBUe5pr+fyhh+4
 DPlDUPH6wfSNCHvpYyAs3Y6pfKYgprLghIvFoijrFKWjSgRy1zQx/voK+3W12d2VG7loTxhmWmg
 8iYeaTPusLu5zaWZYH/8SC0+vBkxsLAtshBQHNvtUFqfHm/vv85YwYAU0vB6ujGtmvuFlhkWFng
 7i8spTKVYqrWeNNSBTzdb9kdsZQQ2qwWyUhsWRtlMa/avqc9Sl5YSyvuwqILvzGTzXkSc8SmDGi
 kHMk+Xq3QnT9F9tPLAQ==
X-Proofpoint-ORIG-GUID: tma8BWgBXQitP4m0S_N3fvKCzgAaafxE
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04a86b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: tma8BWgBXQitP4m0S_N3fvKCzgAaafxE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..9f6bef6087cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,17 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

