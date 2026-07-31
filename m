Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDFE331ECF
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487255; cv=none; b=etEBm/dS8JERe/iT0HMSiV84fy62K9IXfqUe4pScleu2EeUEH7G46cmGGxHE+y/1qgeeeUSmKM1FM9P9c0rU1oeqanO20YvT7Lipozv8ftT1wM1qGX7vslNAEh0SdRsQPitdcILwzMDvUVyWpQ9btsOzpz0Z88d/hosCpmidqFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487255; c=relaxed/simple;
	bh=fgLotzrAx3UB47MOOtgVP+v9PLiNStxQSeaeeEILc/0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LE4pfq+RZ6RuY/EM/RU2JY4rICPPSq4y6/AEGwb1+APTYAnzQ3s20/3JeTCU+sVWBLXvamrQ5oYpIpBzRqPs2TOdNZTpPSUQRDAlrym3UyYZiym6+Q7GaRTpEAaIHiEhgeHVRUDYfzI4FU4ODCHS9k/arLwjt54LirXsw8exBg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4ejIk21; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHvlwYXY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4ejIk21";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QHvlwYXY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8a4Gp3676508
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=64HXuz6ltOAsj3Uberso7+pm1Fd+04E66Vn
	GHumkDZc=; b=Y4ejIk21qY5feH6QYI6yR2uCCjz+UIzhKtV2UuIzjLSI890ZNkF
	mU9MZyj+Wvaig8sOZJltUDKlsgp0Uu/25FalDDUnuViXsLLed0YTza+OA/4n855o
	h3MSw+l+ZIdvZlu/4gb/U2jqN3VBmLlYpS5pQ6yYsMNSbhYngbPuPGgbccEqeYaE
	qFC7KdjLKuBFFQADqggY9cuzMviU2/2eEpkPwQ3OD5PQEsoSixAMvz8uZ/zF8/6A
	Bq0ocIYJz7Ej972CsG8Q/0CMW9wNpKT2WUMG6wrykmPawncPZfOqHzB7odQ79ggQ
	Wtbf1Frk5hIDiBnquRwhQ6s6f3osqGUt5Iw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrb780jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:40:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8486c3411c8so1069423b3a.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 01:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785487246; x=1786092046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=64HXuz6ltOAsj3Uberso7+pm1Fd+04E66VnGHumkDZc=;
        b=QHvlwYXYdTWKZadl0K/oUAoAF5ql17aDzsstGvxh4HGxdiHnDKJhlyxXvZabNAaNbl
         yHz4+Q4sSpC6yydbLp4F4SlH1+gczfYfIFaBazbApY9+yYcP16OUVZjZOAre0ANspLPX
         UsEYwj127L627MDFrPAvcuKUWn7DSsqY1nNjKn+4N8ybPLYab2bidL5vHSvr+iLkApKa
         pGIsWo3OqHk/qgujIptKGLAC8pcDBvsaN4aQBZDKa/gTEJjTYL86rv8vTCUQNuIr3KQH
         qauWQr3A5wkuw1za62dfjuMT9WkQs3ZYG2TLSbOyxZIWYL5WRDYIVle38KTUFHT7N65n
         8hAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487246; x=1786092046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64HXuz6ltOAsj3Uberso7+pm1Fd+04E66VnGHumkDZc=;
        b=nw3n1sgsrwuGRQJoh5YpGn3N8zy8jPsq37nWp+up7ajR5Ef4TXcgRmyN6M4MTZblvT
         wyb3VMWqIRG6oG1ZVvP/JddNL26nk6LSX5/t/VHNhNMPUW4HyH/zP71snKjB2uSoUZPu
         RjPlN1WopEKPhxT7v9Zvyv2E2KUKmIKqbZztBNby1hCXjp8hzZoaSIzFcFp07/KTs00T
         54TeEb/ZHx8sxe67NQM/5uxu2xgFZGPFlV7Gt6VfyPuRr+r3GTMAo5yle+ZTxd84q8n/
         I1e6KQvxmuwVAMbalYWhdxgZACPYNQhqXVvcIGenje6V0snKu+lvar3i50jGfpgD7kxK
         +plQ==
X-Forwarded-Encrypted: i=1; AHgh+RrX2XjqpWUY6wSG9E0olhO/lVC/3qL1tvTFCdf+zGAGmEj1umH6xj9+toKjlKDvzuLa+UpIKktVZz2j@vger.kernel.org
X-Gm-Message-State: AOJu0Yzygkne8y0kr1Icw+a3DItuFtbAo/Zk7Fa1zc1WdbQxKkYiZEYB
	SOOj9gtJRYnKniJumXpUIkSrfQpb53shxIaas230FzaYr8IBF24lrqD/MpiwChY/RNKZi/XMbae
	0nxFJh2Kz9p/GtqcS5HvzbUv6owbP7cILTNfMXRc2bB+TlUyF9+0XU4Vk+JbcDz46
X-Gm-Gg: AR+sD13JglkZhQh9s2xneyzka+bEKhicnfoluvlT90YUQP8VR0SFOn139T+X0eO6o7M
	sdwY2OSGpBc7bwGr0SCGsJHS0CHRG2XLaNccB3jufpI+VlRzd3OFJkEo6pMR31fACPiWDKWP+qT
	x0YILF78NXR3z/5HXjNmrCqo5bP+DiXW2WHv0Uuvp33OgQrvGnl+U9i/i8SV+toEzn4vynqDTYN
	UmUAbhZARn6lTcl1FOGjQGO93/p4q6oaoIAoIxwSY/AMBqqoIuaHUzIofwd7Mag8pGm2fDa3hBx
	od4x+7nnb+jTekXOoqpZ8n7uulVF/iF9sH+uk3nzA3zHtZ1B8eS0XRgF1fWxY1Wg+Owie1tPYNT
	PrdInFOIvD0ciCaYaIeuPetYy6bwBIA==
X-Received: by 2002:a05:6a00:330f:b0:848:2b8f:c9d7 with SMTP id d2e1a72fcca58-84ed6ec271amr1047583b3a.18.1785487245970;
        Fri, 31 Jul 2026 01:40:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:330f:b0:848:2b8f:c9d7 with SMTP id d2e1a72fcca58-84ed6ec271amr1047562b3a.18.1785487245506;
        Fri, 31 Jul 2026 01:40:45 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d4473sm147552b3a.40.2026.07.31.01.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:40:45 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v4 0/2] arm64: dts: qcom: eliza: Add audio support
Date: Fri, 31 Jul 2026 14:10:30 +0530
Message-Id: <20260731084032.3106477-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I7hVgtgg c=1 sm=1 tr=0 ts=6a6c5f93 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xOjjz3j2L1Nf2p3RO_AA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MSBTYWx0ZWRfX5q3KxhCVp0Sy
 iYAXmn/4uHhLgmag0Y9gwDnFL+Bjciv+intPzaj78kquIK7jY299NQ43Qsqo7RnEHoS7iznGkhv
 fdFvIZyaNjKEFkfSH2Ok6M15/hpipngLbejRdzUCkWQ1ecd3uA5hoOG5ocQ0/smv2OSWPHrPSDy
 gcEI+BiBX4LAQmRp+Si7whYYvAfJWdZTUOsuz9VY1yBsZx+n5n1j3Ir6KlMTOB9hwHaI9Wm6su0
 kqmoouWsY4UMOCh9NQ0DhqiUtQNeFWB3/LLD0V8m3WPx6m0kS9iB0JGO1ogMjbZT4JPv5o77Mpo
 JTJjtxiIL8F/vAQ6YTGBY1gBsQWMTE2ogI/XE3Y//SI6iefqDK/jhkcEBLra1o593JdfbFsqWEZ
 jtK/K1lEXJ6DZpHt3/MPedtr5QaPUIGyYe5E2hFUsTd72uG11CqrH1OMA8oiZInMsCoQkqiNqHE
 GYiiBc3MzDWqtsIRFVw==
X-Proofpoint-GUID: npZaH87OnIbYn8Ldju8uo_JbWwKOFBUN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MSBTYWx0ZWRfX6bHmxoTkjth1
 V61DhBC2KknsVclHb2egnRU0QM2GHXZ8ta/ZDUrmuMZd6chi6dpqBfpIaEeN+UqzPCRm3Xmx+QG
 IxWPBgg1BszajfeIfkFCLUjmuVzEPXo=
X-Proofpoint-ORIG-GUID: npZaH87OnIbYn8Ldju8uo_JbWwKOFBUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310061

Add audio support for the Qualcomm Eliza SoC and CQS EVK board.

Patch 1 adds SoC-level LPASS WSA macro, VA macro, SoundWire controller
and LPASS LPI pin controller nodes to eliza.dtsi, along with DMIC and
WSA SoundWire pinctrl states. The SoundWire node is kept disabled so
board DTS files can selectively enable and configure it.

Patch 2 enables the sound card on the Eliza CQS EVK platform, including
the WSA8845 external speaker path and DMIC capture via VA macro, along
with the required LPASS macro and SoundWire configurations.

Changes in v4:
- Enable the LPASS macros by default in eliza.dtsi, keeping only the SoundWire controller disabled
  (suggested by Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>).
- Picked up Konrad's R-b tag.
- Link to v3: https://lore.kernel.org/all/20260723121516.2341900-1-ravi.hothi@oss.qualcomm.com/

Changes in v3 (suggested by Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>):
- Added missing blank line before lpass_lpiaon_noc node in eliza.dtsi
- Fixed codec/cpu sub-node ordering in va-dai-link and wsa-dai-link
- Reordered &label references alphabetically in eliza-cqs-evk.dts
- Removed regulator-boot-on from dmic_eldo fixed regulator
- Removed output-low from spkr_1_sd_n_active and spkr_2_sd_n_active TLMM pinconf states
- Link to v2: https://lore.kernel.org/all/20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com/

Changes in v2:
- Fix node ordering in eliza.dtsi, lpass_wsamacro and swr0 nodes must
  come before lpass_lpiaon_noc to maintain ascending address order
  (Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>)
- Replace gpio-hog with gpio property in regulator-fixed node so the
  regulator core controls PM7550 GPIO8 directly
  (Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>)
- Move status = "okay" to last property in all override nodes
  (Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>)
- Link to v1: https://lore.kernel.org/all/20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com/

Ravi Hothi (2):
  arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
  arm64: dts: qcom: eliza-cqs-evk: Enable sound card support with
    WSA8845 and DMIC

 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 141 +++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi        | 189 +++++++++++++++++++++
 2 files changed, 330 insertions(+)


base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
-- 
2.34.1

