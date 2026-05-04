Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D94F4C97
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 08:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882297; cv=none; b=isypiIDqN+jSrHcKRwp4F34Yr7dohh1luiu4j0kvvq5o4Sic061zcB1aPmP5TkIARIn6NlXvOCIiGqx9+3WS3kMuxrgx3Z6DIBURmZ0yArYmmuI9WrlF8WQ9T6bXiIXsX42C+GjT/w2r2EEqlNqlb0CqSS9DfeHJFzOiKd+OX0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882297; c=relaxed/simple;
	bh=Fs8aw0GwDMxzXF5DoZ4DIJuh1XJ4u215nDizum5b5vA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V4SYJ/tYakUfvMaY3gqPWXzhzKyfcAWvQ5YmUQpuG5TA8SWeK5x2lFAWG4/Jcou1HsAzV3Zlto14DbH3OO7/rMIu+dNcsShh7zZw+YpR5NXEHcNaSL3rAhFWx9o9vCWNc6hplB8wTkg+5nRBqUXiuGfJLbxJ2faHsoxRXbufsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxQZMiJz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rk3/En3T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxQZMiJz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rk3/En3T"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DCHc118457
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 08:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2Zx1VURkpdCX5NdltAMIOg0C30qagOXX/1o
	D6d6vHWM=; b=FxQZMiJzE5cyYy55mTKHXiVB7cwKsRMm8jmRWrBbLUOl9eSi+kH
	yAFdk21CDZagpxthFXFbZHuKNNJ+E7qNmSUEXrTrKMN/9f2AMY7rO117ODLA7+8N
	nPBtJK4wzE1I0+kz1TkzRqCYEZWl6aT7D9OwGxvT7PBQfdD/2+5N4y/HXeTjuqyk
	GlZzbnrQwc7wpkEX+8+ng+TP6SPa66irpTcbMjaOrppUjSY/m+Say/rLYgc/T4+U
	HsjdfNGbD+VR8M6TpRh2vFTcIIIqHkmEmVFl9g1oiuqKvNqMVcrS31nelQOKcTz1
	9YRvMbTVqX3WMY43w5EhfW6wkMDmTb1mwfg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaejmsvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 08:11:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bda35eab74so3219080eec.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777882295; x=1778487095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Zx1VURkpdCX5NdltAMIOg0C30qagOXX/1oD6d6vHWM=;
        b=Rk3/En3TKN62BiP5B1xVaiZIdWjJnjAKYHJhdT2lJz+ecvS38RLzefw/rc7ks9wsqB
         CCQZmi3RzUBgY4XJjiORsrrPcoEoCg4FwsXl9vA7mdfjome/HBmOEZlbk9ek4Y8o5Qzd
         RDkRkkfgTLnkcW5mn+F9xHGXG67RF6Q5Px9Xtk7cwQfueFPa/6BwiJ137lCpRF/4252t
         p0yH+VXbBjFtmNh8e/pTXeAazFcaGLDtLzimg7Ct3r2qSQ/4OSoojmcymowLHIkj2kmD
         9jPbe5xxeMx9SbKCpy93BhF+IqWi85wtWj4CRWRQpm1b7Dyr5lFMx06aF08d9kRC/Rwo
         SlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882295; x=1778487095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Zx1VURkpdCX5NdltAMIOg0C30qagOXX/1oD6d6vHWM=;
        b=r1KAAEkQYDb/OPC7Xw5SAoEGE+gABW2gVzm4/IhcmjzvZuhCAs10mpMOEsVg4r2Jkp
         hv/Q8O509QQt7E32xzvE84sZdROUFUyUwpAYi5ZpumNHxeuh9HajOa5Gjj+wdieXybvG
         4hk0lZw1oYGUCqfvHinKc+3w5EmybTEsxKxcQaa1wJW9lUS9KCo//3vTRhEOTNzxAs5T
         It7U/tdzQjIn6ZQpvjGcSt8YltAv7Jhg3xp7Bnjj5zHA0zk1pIje2O0OTg/BtZD/GMN2
         yaNArvDrWeQA3bM/rdpqDukBFHnMKwCBQptIS2RijDhH9UNLfg7f6sC8+jZI4gCd29CK
         nZvA==
X-Forwarded-Encrypted: i=1; AFNElJ95w0BOUHMCwbZatKKHvQ16y+HAk/tLoo17iOweVD89HrFlg1zkTeBkubk5mG0ZnINu+F0suGuKWiVz@vger.kernel.org
X-Gm-Message-State: AOJu0YxcQLCS8Ychp4/hWYZNHNuA2fw6y22FcpJBQCFcl1o8m+vC+WDL
	XuryTWuKsO84bFe96bQOeRF5tFYdagdr/FfL5a6MVt+2Foy0U8cX4aE3ED0yzotL3kGYh+2TM/j
	h7A+4nSb85nj6TjZda+2ZwB5yGC+K0wJX9oGn24hj7P0/VMVpjZMty625+OeK+GEZ
X-Gm-Gg: AeBDiesrp/MaT8bRAaKYkgLWP+8Dx4nLxJkp3SBKl/NRrRaNIA53jsq1izWBtoYs32G
	X+nDwcV35XNKfvk1d7KPC/zZdS7uHWvR273WjoFmSLDyipYiGK6qxqqkW31LwAZ/Zrq/leBzWAk
	nKAAdtDreDxJ1smUU/7ti7l8ymKzp1o+r4ookCZ07qDwn3jQv/dKsR7Q5kjHq1fA4VwsnSBZWHT
	XpYagzVsjHUKPFIfb3f2q/A/N6GdyoFu7vGhBVjh0ppKZiUKjwRCJyLOOOU+jKjRioNrfyV6cFV
	inc4Ky51KZet85SI5homJ5fGOZxyS+yC7a48TUDGK/7NPHezi1zSq930w9xIOm+6qA+HqqDY5C/
	eLCpPTd3omEOHwoWdzqLLpSXmKQgekOlAUT+7YYAnsG1RWn43tCQ2Y7B1orp4StaD57/37V/Ajh
	p1HODkNM6mZkbAbj/A
X-Received: by 2002:a05:7301:5789:b0:2de:e194:5fb1 with SMTP id 5a478bee46e88-2efb09f2b92mr3478907eec.7.1777882294992;
        Mon, 04 May 2026 01:11:34 -0700 (PDT)
X-Received: by 2002:a05:7301:5789:b0:2de:e194:5fb1 with SMTP id 5a478bee46e88-2efb09f2b92mr3478890eec.7.1777882294391;
        Mon, 04 May 2026 01:11:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bb60811sm14760444eec.24.2026.05.04.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:11:34 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
Date: Mon,  4 May 2026 16:11:22 +0800
Message-ID: <20260504081122.825635-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4OCBTYWx0ZWRfX/fh7x/Bilgik
 hWI9hgWDxLwEEpP4FIigqlLtSB3Mr5X/dXa9Zh8Erqrk2omhBi8XHwwmyMl4bjzvykwLO0dTh1v
 vkWWfTayzzXad/72pZzEGUc5zBJyDcLp2GNW6TEJUz8OJ2roJl96M1s/7Yl73rxepuIdc21KvTU
 +Yh/kYVEi5dNqVtvxVltADir4uY2eBkG74WLbUCiu27SKxjnvqM66C+Z64sooXZyO3A+AUpFq4C
 vHc+8nrtzQlDf1IVdb3D21cV2YXVuFpLjlq8KMfTriwqT2nxgbHjalVLmTzi/ZaenVV6J7+tPxy
 8Zq0VqZbftI7cybD6FjeV+j1wFoKMOAIrvMAvsk4pLqFg98HzTFmejiW2o9b7ze4NLaH5j+H+H+
 3Xqui1NTLtJJuU7qtEXBdbY5JVoZS7G/vITXiLJPgM0gSiX887wCnm9+bZ1Py0nac8hDpgYibAl
 zcjy08VLc1auq6uIrBw==
X-Authority-Analysis: v=2.4 cv=Wa48rUhX c=1 sm=1 tr=0 ts=69f854b7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lMbzd2IQPU6w-k6tvTsA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: eXFxuql9y6gLKubiQsQfshiDt5vSzd7j
X-Proofpoint-GUID: eXFxuql9y6gLKubiQsQfshiDt5vSzd7j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040088

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Top Control and Status Register (TCSR) controller on Qualcomm
Nord SoC.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v3:
 - Improve commit log to drop "compatible with" part
 - Link to v2: https://lore.kernel.org/all/20260427012116.231226-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420042124.1247995-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..23317d1b381c 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,msm8976-tcsr
           - qcom,msm8998-tcsr
+          - qcom,nord-tcsr
           - qcom,qcm2290-tcsr
           - qcom,qcs404-tcsr
           - qcom,qcs615-tcsr
-- 
2.43.0

