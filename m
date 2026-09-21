Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B8748F823
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002033; cv=none; b=Kr5aVgPmC0pGl+hnopXDO5gIiGCIb0qoPIDG50VnChiZZvreocJzuMOUAHKGGR31Eq7bjMKhAjEWVvtbbr3hvtBX3q3sosPXYCVPCyScGN8BFsc74EGYOvJ6M0dIDJhWFFcoIwSoUR/luJQ6HGSL2POCfxpXKItgkjCoxEeS2U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002033; c=relaxed/simple;
	bh=fp7fQreBnthImLz9yC7TnO8ACEl9OgIHWkUN/8arfvY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OsjcNhXWjAgKV9lxaTxmxuuylOkjDHUx93wKq2jWksX6k1bDuStdyk6Gyi6k6UmJ87d4DL+qAaTEK26Dv1fK+9jTwXEO2rcc/8p7R8K0U5Rosz7tPUDe5UZFKJ0rDGeiRv8OyvPG8CRPx+gBYvLh2O0owtCqzTPdHXayViZWUiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kJsTzBr2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxyzuONM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kJsTzBr2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxyzuONM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGVtR1316547
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wQZmRGeGJySWjhLlCYRWWj
	qwDMYiYd5vCRMQPcuIPpo=; b=kJsTzBr2o5Z1KBjeZiK10XkN6LiljtRdsKxnzX
	sGvv22p7214CmAnI6aBM1ZGEaQ9N/EYpz7a6BDlSqjDmN7g0PNbLaJHHruG3Ca5P
	qaAWW5LCX0meNefvDWxjIkD/aNLPFB574h/Zt++HsBWxU3g2hbx/9XPFDpXrOsLh
	69jRhrTNS6vQKijbRtR+vqRQ0on+ZWaoH/IT9PCVrIgOLsI/1D8GcdS2wSXAcvAX
	1RsdSmnRfcABvo8zAx70rHfoJ3xiF/PZyg6zEtGJYAqqMUOVJgZXio4sDs8a840g
	bVORUgn9HlgJddgFDrwth6et/rebElneshRJWhaejeidzlDA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5jdcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:47:10 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7d2076f8aso3444266e0c.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790002030; x=1790606830; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wQZmRGeGJySWjhLlCYRWWjqwDMYiYd5vCRMQPcuIPpo=;
        b=JxyzuONM+Vv4gNIpADE8Ry6eFnJ6z8m2+ex3WCntA3wxCtEvZJ7VPv06coB87mZImB
         iuoFH4AdjvI+a1ZHomoC+NNGNJsIyf3MrNmrwajtq17yBTE/WpwT2RSRYASiOCIMtsoH
         RWsC+oPwWGZ0vLODkxjfSw14IxD4SczFJoLCN5aBBKvNmNHZP1wm1NE23VHJVHH5mdp7
         N29195iCTO4vMxueYYoK78gTkNIoVZDw4XX1j9+EWe8HGv5NbpoXXZ+T0Gy+mfPIN1tt
         SfhyG01nBbq76QcLwI8uH8/nhPV/LrIQmRqUB3DmhH1ori8tzg2C4kuA7UbgxtkQG0U6
         LmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002030; x=1790606830;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wQZmRGeGJySWjhLlCYRWWjqwDMYiYd5vCRMQPcuIPpo=;
        b=LW294ND7LX1B1nzjwzmsq7HXcTcqCp4R6osGp6KdOioxiJf1gj44LYV9zJ2AwNmpkO
         U+Ham88n+6Zxxfi3qQIAaurPRDUKF5d73S709cEVMAxfILyjUKfK3alFrPaR1FnOReiF
         /NwBsKP0J8qbDoZghFNF4BqLnJ4rviQ/8VH9GbS/88b0ItnjmlO+UC37REb/K20wDJk/
         fH1IVfPrWB1J6X9cpKhXaS3bKia1aLLKpdpwU/z/RkPtBXDAf9qOXRJfgMLYB5jHgnhb
         ePfwdzL74MkHPyvK1ul894nTRlUPErtTgj1CI++Thr7Lf6sIlkWg1M7lLAT7Og/hPoVw
         7Hag==
X-Forwarded-Encrypted: i=1; AKwUvBzP35DYS/2nCNZEpCpsI5Qt7uC7IjhM6dN7jZMF7GrSYf0rJg+nk3lpRbg97YGiW0iLtkk0LdjUz+9w@vger.kernel.org
X-Gm-Message-State: AFuF++l1aG6ZUmHD24ChTpgbCQrPLUCihsGyKHqr5VodUhIKgY5qiYRs
	QTRO1JpY5AlG/tWieStzwsqIKqwWvGsrPSPaMWktIdTWFWS3/ZX4LOMZILyuUqGH5UxIjgFqXsE
	s/Wr7pYCX5Hlb02l1r5Ujl2Gm/Z4cCMLYMYZuYdKtkUfY8F/lTnYjfIBHzQmILWT2HIDWh/dj
X-Gm-Gg: AYBFou3p9tOhfBoT6tCMDb9u4UYXi8YKaUxDTi+uhyGdurYx/TsJKdNSTVhRHFvdhWU
	VJBtbIfwol4H6LamyNyctk4DY63iyCJrEN8jf9zthR0nJMb19IH0NX1YateTYagkniqLXhfbYCI
	t0OZofhVfFPdxRFEGwGoPPfbW2YwCIauB3x6lxI2ulJ560RpMn/3XiSOf1aMfe4/36kUHK0FxV8
	dDg6HwJTVGsEpVHLolLY2ntizALviVsuqxggRdY16zDvZstEnlJK5oQkTcpy6jEmGhe88QrKta1
	ztUqzh8PpM8wpvIpDfvfOTD+RijRk/oQM6fL16z1vCJ/bgpl0EDSy1J8++tV1d28zVjiAzMZiRn
	d/EnX/h6u5hgQt1yLMj5OlHRgcYE=
X-Received: by 2002:a05:6122:530b:10b0:5c9:a5b6:27b3 with SMTP id 71dfb90a1353d-5c9a5b629a2mr3863579e0c.16.1790002030374;
        Mon, 21 Sep 2026 07:47:10 -0700 (PDT)
X-Received: by 2002:a05:6122:530b:10b0:5c9:a5b6:27b3 with SMTP id 71dfb90a1353d-5c9a5b629a2mr3863536e0c.16.1790002029956;
        Mon, 21 Sep 2026 07:47:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm24992091f8f.14.2026.09.21.07.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:47:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Date: Mon, 21 Sep 2026 16:46:57 +0200
Message-Id: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGJDsWoC/3WMywqDMBBFf0Vm3ZGJT+yq/1FcqIk6UI3N2NAi+
 fem7ru5cC6cc4AYx0bgmhzgjGdhu0bILgkMc7dOBllHhoyyihpV4Wqdxmlj1LtgQUVZlUR93Su
 IyubMyO8zd28jzyy7dZ+z7tXv/RPyCgmpzk0+NoNqNN2sSPp8dY/BLksaB9oQwhdLDsOOrwAAA
 A==
X-Change-ID: 20260916-nord-gpi-dts-40456500b7b1
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fp7fQreBnthImLz9yC7TnO8ACEl9OgIHWkUN/8arfvY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsUNlxYY2PQigrzQt/5uYl3xQNsxOP31Fz3cvi
 cGuaUp25iWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarFDZQAKCRAFnS7L/zaE
 wxz5D/0W6qUgy3Q2YpmDFDHj5qJgZ62zwjNuDXo/ngZFJJoRT9HbK+WYE5IoIzolInQx5Ax3EU4
 6rOmTPPn6fO4+W2hZ7VcaawIudNdD19WqMCgMBeYMGCpGk58l41zR0yGzIjqddpHPkRzdaZGlm7
 C1bvWWBaV+J6oypKzLDQxJm+VZXe9IO2hOu3rjtJXiqD6A4nfiXU+fOhb1/kk4BRfAJio1v/NqL
 S9dfvOec0FhLBLHzHryeSNRMRDu7VQEaNXzbmMQ78rrIBUwv4XwC3SPAO+QWcS/pRydAebhO/Nz
 u3RRMgkxSGSgXwRCfrHU77dk4EFvxkr6i3ZYXK9pFFadIvP4p6zgOtBJ+K4pj1/UPeEy4uh6k8o
 sB6J9a3KCawtNerIAutCkjG1sYFTSVc+hkgGIdPpfSTuePjhMeuSrLxzVqm2KApH4rRkovrAs7Q
 0BOipYi4tNoKJ4GXYV/3wnosnud2gB3BCu7mSekml0jlohKVnRnKMJTT6KFIns0zPpKFEQr1cLU
 WI1uKQ/0TcUdtuCcZKKJYQqd2yxV+RUoLbEDt2BbLXQMDebTHaNEuGiYqBDLYMi1Jesc3DK2xp0
 vYMZXqulewVLjHmame9xTttgM5OhicUTbtFaxpx5HP3/RbJwOrTkSiwlsYw2h11YO5dZ9Bjxcuw
 O0HOa6KwQ7A9hrQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab1436f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=x_AYlYZoqW90jIegvs8A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: Gya9TdCgHqidzAeO9FmTPzhtfenjbZGS
X-Proofpoint-ORIG-GUID: Gya9TdCgHqidzAeO9FmTPzhtfenjbZGS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxNSBTYWx0ZWRfX2v3lBBPgSP+5
 xpeoqvS0dEa2aB6dc10KvHgj43VzHsSiy2RsSEcuxx7MlkhT9UVzAgq4gvQefW+HDig2PuBLEb4
 HSDusAFfER6MZosIYg29AI4GNwl3qPg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxNSBTYWx0ZWRfX9G6afx7UoW6Y
 iaGAXwKEyJYfnb2lAlS5TBl4BCJL9HkR26UI9IC5rtt7R1HUULuXgdbR22A6d5taJN93ent8EzC
 ldUoiuH9nrH79yZTA96xnan6zhloxAT/fdFO4e6OZMHtOHJclmCN/l28IL3RnVURfXW8iiqe2EY
 0gHJZopm/w5OOsx4Y3lv1mZ8pOEMezUfl6IfeALkR8dOLNi3qeDg/QL2XTQZFE/VS7PjSc0ZIxC
 guyAyxTTbdzkr5Yk3UCq9l0lU1P7t2GlQaf4Vo1Cu0ZHHysJePfSSotjuupXbhqLdjN3VWwOmBc
 gGBni06Yt3Ng5JYEW/QnJPu9PVvEJa4Yy6g9BQ5UMNqm6YXv6AD27EUpdRPtcR0Eeu1Pa8cBnCS
 BUoLeQBdb8yiAOsaHvjQH9+PU1HNgIFB8HVYRx1Y6hd31rFc68+9jkkOex03Kok4SiYMVYUD+VH
 Sm37bdoEpmXFycUAH5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210215

Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
nodes.

The DT bindings patch was sent separately[1].

This series is rebased on top of current linux-next.

[1] https://lore.kernel.org/all/20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Remove dmas and dma-names from uart nodes
- Link to v1: https://patch.msgid.link/20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      arm64: dts: qcom: nord: add GPI DMA controller nodes
      arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines

 arch/arm64/boot/dts/qcom/nord.dtsi | 191 +++++++++++++++++++++++++++++++++++++
 1 file changed, 191 insertions(+)
---
base-commit: 6abfe1f0063dc103de5be76c09cea2a25e332c20
change-id: 20260916-nord-gpi-dts-40456500b7b1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

