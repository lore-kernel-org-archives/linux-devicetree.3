Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1892A4E8E16
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788899; cv=none; b=IR/ciikGq7B3W9EqlIWk0umJV0b2xnwdtwaYl+CWU9WgaQ1pUz7LXBWmloEBdSCCAPzWq7VBRwkrS8IAaLwiWO226tixKXL3sUS4Ud8bfywGZu8u971ObbjdBFmkDNcDa6MqrWF874wfSJNAXKSV4kldSsOebt6qc5bFUyqMwsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788899; c=relaxed/simple;
	bh=YcCvCxAQsX7Pg0cBF8X84+iLbVrczDX4JCUsixhyXrI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ecYzC74OAaQV882ZsbOzw1uldeTTm69CxI5OyG9dBvn0TkrHsEdDOIo61u7B5/hkb9GTl4q19NDAyU2lq/Jfjji9aAA7gyg/ZJ3UPSWg7jUaCmLy9duFoBaYV4opYGQpZadK4DqvWgewHar6HX3WRVifiOeHJM8xiu2YsBCKEco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aH79ozgQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N+3l/WWW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aH79ozgQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N+3l/WWW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdKmr3025763
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aJ0p1MDlzOMPT/wNMA/R48
	M3AI8nfhKu/DapId5EVH4=; b=aH79ozgQzlb0bJ9TP6MIVlOEGUK7KF+VXrzhuf
	K+iRGrqEP7ZcA4esr2kcZSH8x33xNY9ybXklReW/LvHv4p43zdZrnY29NTAxyMs0
	dCCsZZUoN0CtElTG6Ypw3Dy4WQSlgKfDaV7IBRTCRGUCSPVdKEAEF44YdHtz9fEx
	X5k1qQkLFRpvws71PD5sxvthuYNUjR32CzIVWLHOPRNxLFcxUdopYUlHFpi7KG5o
	tlM5yyXgfyfnarrazD2aBVk1TAbt0P9rItf9q8xTin6jwp2Trh8e5nKywDE1DUm9
	tEr2lapIpkLiL1DYLlgxor+mVHg/0tbSGB0EMrlw74wJ82xg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0wa6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:48:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so6219037a91.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788891; x=1789393691; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aJ0p1MDlzOMPT/wNMA/R48M3AI8nfhKu/DapId5EVH4=;
        b=N+3l/WWWZ8XruIsrc1WMvaOMqDq6c4WLeSJCZ3fzcPJXnb5Tm96eCep0yvRGPaSZLR
         D18zdn3KrtwOaEDToUoDcD8VPiFWf7Usm73Ail+CvUQIXpaQwQipYfEe1FBEwCpp7/G/
         LXCTMfN3RPnWZfHCr3WCtW4+bEDKK8ckPRy0yAVLex9nAegrQ1BfktBF7iBf0brThd+q
         URCBWNjgwGKlcY0iboqDxBVrWk8gksrWGP+evlDuBmOcSKhOqOMU5U9dGzOEEJsKgn2Y
         SVWrshXP6gPfcGBk+VuwJZ5hXmI1qVw9lcPFQHwHnzZebmoh1gbh6MsrjbXOrkSzSvd8
         DFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788891; x=1789393691;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aJ0p1MDlzOMPT/wNMA/R48M3AI8nfhKu/DapId5EVH4=;
        b=CjQ9XFD6SFBwu4xZ0fAAmOTZH64OlvFX8+F6iTEgG8Y+Xjj1jLbEnzgRdGEnVGl7FP
         WBmmBJS4wMgBXhVYKfdYOLl3vuHsGekFMD2fAgWPGyiPP1Kx35W/ECSfhn/CZ7VV9/TY
         DDgAlO+O3QXyHYH3+2I0wL+2rxw5VRKy0pG/uim25lmGyey2ClgQezdFv8dKedv6An0B
         YzjvpL6cL8Nc0MoQSilySlM6V31VJy4XpRx/zQaJykyUlP33xX8yHh+1igVmiYGVgw3i
         fqN+/pQmQck1lmjLFLBu6bxT5tBN2n2jzs8kmiPrXP98Vb+GzJCH1n2WWzGO5OiLophW
         mwdA==
X-Forwarded-Encrypted: i=1; AKwUvBxCV7cv2LgLTsrvnS3eW++VUS9vAeQkqqwQKrylAiXUcJEnEy2ld33QGWXV3K48lwIQ81gb0QKDWTqT@vger.kernel.org
X-Gm-Message-State: AFuF++m64wMZgFK+8LLM9vi/4L8yWd/LXes64tXuv/GkWc/bH5gIdmKx
	gdJHqJrFkTTisMv8uyhWIfbdyuCx1y8H6UjRjglIbYxDk1sOywnoSvaVo+16LFbTO/liExIcFNT
	snupmvNCmVNI7Sol2j7Reo67I/mmv32HTkPQeK+aZRCy/oI17vzfK/Bkh7DP5t5b7
X-Gm-Gg: AYBFou0l+kF83aOIM+1SIc/Yc/1Ur/lWAZrT7Rb/IdUyVaarm1u+TiIpTO7HakOk2Mm
	Ut7QEV7MTko9HHxtcdnhoWqvAOrCg8nviCypoesximhcK3ozBdRj5Q+OADWrXUmeQTSAHKMjadF
	XUnc/RrbIL9IttGCgkWWTuhPocIpX30h4rlc+AL2UfuGayIJWAFSRr6Psdc3WH7mynX1HyEgrT4
	FLs5qiMIfVi53YOif+DKJnyivKFdt7l9CFyE+JmGWP73TKmBkzUUpBU2Qhtp3g/Nfzz9WnGxSuC
	IuRl5J3Gc74ZN02JcQGCOtYZOXwBgLnVb8uUcygPVp9tKMhuXVHxykbm2jggmpa0KsOwPe+UyE6
	68UCyHYKV4I2E2DDTBhUWanFaFERvOQ==
X-Received: by 2002:a17:90b:33c9:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39b26122fbamr32277863a91.1.1788788890759;
        Mon, 07 Sep 2026 06:48:10 -0700 (PDT)
X-Received: by 2002:a17:90b:33c9:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39b26122fbamr32277805a91.1.1788788890227;
        Mon, 07 Sep 2026 06:48:10 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm20826354c88.8.2026.09.07.06.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:48:09 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add subsystem LPM stats support for Shikra
Date: Mon, 07 Sep 2026 19:17:52 +0530
Message-Id: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIjAnmoC/3XOwQ6CMAyA4VcxOzuydhPQk+9hjBnYyaKArkg0h
 nd34kWJXpr8TfqlD8EUPLFYzR4iUO/Zt00MM5+JsrLNgaTfxxaoMFUpGsmVPwa74852LLVT4EC
 nrjCliCfnQM7fRm6zjV157tpwH/UeXts3lCn9DfUglVTWKirB2VzTumVOLld7Ktu6TuIQL6/HT
 yOfGBiNgooFOjQO3P6PoT8MmP6ho2EKggwQMlz+MoZheALX4ehoNwEAAA==
X-Change-ID: 20260624-shikra_stats-3f01f136fb4c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788788886; l=3200;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=YcCvCxAQsX7Pg0cBF8X84+iLbVrczDX4JCUsixhyXrI=;
 b=ciE1q8B6FqruSzRsiulDQ7SB34xmTB6p0hk0aynOjW7qCYW8FCzejmnQpgZcelqZwVzbjAnYy
 G60kJWhjIOhByHoAv9L0Uh3YsWk+mdas8SZlmnTaSVhz/3a+JZ9Rb2c
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9ec09b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9MvkJE27OKZGVTZ6eoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: qmnca2czUPLPutimV7ZUSKqWTfnvU66r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX3BIlMy4JeqYO
 xKX9w73eooEUOgnmk9iEZ5fzMqCvnCoIw5HW+VqU3OSuqvThL22u+EzXp3i8eqfxGffO5qrooM1
 J4J9Vh0b3uvk+HwQRjUri7rSceVtqIY=
X-Proofpoint-GUID: qmnca2czUPLPutimV7ZUSKqWTfnvU66r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfXw19bnO5QIL8V
 NDnaOgTLYendA5qGTUe/UdnZwikMLpKZFKODjTztbsCuZK+ZZYh7jtpjZetDmcQyWNbXX2D4/I8
 1caAE0umc5PXAgIulD4AjkM5Sdz5lV+ipG7NKpeCqpc2+UjlcA/4Q832YNj5jReaFZGDfm2qgjF
 rZV3Z8BdqasmT4wYJMnCzhtde0NpFGmghbEZq303YoQZjYNd0Q4GvI87AqRIOPqwUpK/jbFqbpy
 zL/8hFkzZ+Mr1K936WESOLoPhZnX8kdZ7/0HiJav61C5uGJEoL5mYclRe6Sb86VZpff6jUEtw5R
 8s4uB65lFlU9UrvZnu9f11zYYAY+zKc6os8VmfkiNm8CsVpfwxeT6xVrWfWgXkPpTpPf03i3nvb
 IeAHzZGng8XK39AgIrJS4ZDz4ndx2EVuUmsply5XGHFyPROlRzjfSh61GM95ewRIShiU5wBaezG
 34NNWn8BFHIkR2fL3Sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070153

SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are
present in SMEM for Shikra.

For earlier targets using RPM processor like msm8974, rpm_master_stat.c
was used for subsystem LPM stats since those stats were populated in
RPM MSGRAM.

Here is a brief summary of previous targets and their stats configuration,
along with the drivers used to display them.

+---------------|----------------------------|---------------------------+
| SoC           | subsystem LPM stats        | SoC LPM stats             |
|---------------|----------------------------|---------------------------|
| msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
| msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
| sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
|---------------|----------------------------|---------------------------|
| Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
|               | (qcom_stats.c)             | (qcom_stats.c)            |
+---------------|----------------------------|---------------------------+

qcom_stats.c supports both the configurations for shikra, reading subsystem
LPM stats from SMEM and reading SoC LPM stats from RPM MSGRAM.

A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
and vlow. Add shikra rpm compatible and config to read subsystem LPM
stats too along with SoC LPM stats.

Below is an example showing LPM stats for "apss" subsystem with this
change:

cat /sys/kernel/debug/qcom_stats/apss
Count: 2192
Last Entered At: 5498618336
Last Exited At: 5498708046
Accumulated Duration: 2046572620.

Keep "qcom,rpm-stats" as a fallback compatible and add the bindings for
the same.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v4:
- Add bindings support to keep "qcom,rpm-stats" as fallback compatible.
- Link to v3: https://lore.kernel.org/r/20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com

Changes in v3:
- added back "qcom,rpm-stats" as a fallback compatible.
- Link to v2: https://lore.kernel.org/r/20260708-shikra_stats-v2-0-beb52f24f1fd@oss.qualcomm.com

Changes in v2:
- Edited commit texts to better explain the changes.
- Link to v1: https://lore.kernel.org/r/20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com

---
Sneh Mankad (3):
      dt-bindings: soc: qcom: stats: Add compatible for Shikra
      soc: qcom: stats: Add stats compatible and config for Shikra
      arm64: dts: qcom: shikra: Update rpm-stats compatible to SoC specific

 .../devicetree/bindings/soc/qcom/qcom-stats.yaml   | 25 ++++++++++++++--------
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  2 +-
 drivers/soc/qcom/qcom_stats.c                      |  9 ++++++++
 3 files changed, 26 insertions(+), 10 deletions(-)
---
base-commit: 4c9d9db1697a873f78d236b4ce304272206238ac
change-id: 20260624-shikra_stats-3f01f136fb4c

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

