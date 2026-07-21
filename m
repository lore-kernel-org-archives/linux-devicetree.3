Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E74F3845A7
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609866; cv=none; b=Uxj/n/J0eerUwcsSX2LfJscuVI+phEi9CS8JUC24a8TIxViO1oJo0oETgc/dnfOGas/MFYLkXqtGirzklughvBG6vUG/HLqp4MH/1fyXoKPXwyHRtvDyVl6jgS2A3s8xnMeySlRhhOySKyey8x92m/RFJKaB7fIdQqvXKDFD6s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609866; c=relaxed/simple;
	bh=K/ZAH9ELK4SChKb+nx93qCeoPRqba7jRn6VGz+I71+U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DugKA5eTna0ZhSxwBX/rjoF9q3ZmikRVL3WWBfTEfWKW0YgmZwc5UmhcfkgCrhjvOf6R5zGL4rL59/ZaJdZdwAZMUg3l8CJ9AsmK3BQgXnPFvkcqekM76YKpNDSW9x+1S9tZ9GKNt1yAUfH8k7y8BG4ojQqY30V0yvtAcHzUkGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5lbgN2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDW60NQj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p5lbgN2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDW60NQj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L3xqRq568619
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EIgADuTgHbMX/s0xRCiom2
	8an5iwCUDoSZrdINbqdVs=; b=p5lbgN2m0GqSKl4YSMRAYZYlnES2S564KOnaaO
	cv4pmt/gnJRIzNvJ7zOGOTjx71hYnhGpmrVR+j0c1dSeAHtDPs/8JGqKOz4E5BYw
	8kymJXZ5vLugZOcEWeeK3CNpEiXvi6D8X/mhxjeax5tDoNTwiZ0frC8yxF4UR1cq
	7ERZIjje/e/yeEzISwmXBHw+bd1i/gst3yNWzAUMf1uwrV7MLmGVdiFpmHPPpoE+
	LMOlMDYaR8QWfhRdeKOAaAf+cBejFnMM/ykIjtNDuHH1Y4JrynTk0jYyMu067ftX
	LDnxeDdgG/8lhP5/zjJt+9nu9Vj3KX+r3cPntsWcopRM8V1w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvr5vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:57:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca5d2474c7so195305365ad.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609862; x=1785214662; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EIgADuTgHbMX/s0xRCiom28an5iwCUDoSZrdINbqdVs=;
        b=BDW60NQjffl0JWUX8AcKSxxz2C6fEALiJBU/QqsXKmISP2TPrIH1nz1zeTBErH3Z7/
         lBgjlhOD4dR+2RJx4rCZBBmITzpTO2mmeRhUTUAOk6TXk+t0EYq35ZGP6fyXNyB69Cba
         +HgQE8N3hhVPXrDccJNkcoAqP+NAMjTLr/N0J8PyeDOx6XssY4ymVnd2slDvNE2RyWsC
         SGOUuST5glgJk1xRxWJUHmFJnq5UCzZNyk8xtxd0QujlrRKoZ8N3P30BvJR0YMoUCH3o
         vyew/9uQ9SjV6bN2MSicw1FWo9Ado8R2vfYJvRsBIiASmX8eh3GQO/TEE1ZJV/ZoeDHh
         4Pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609862; x=1785214662;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EIgADuTgHbMX/s0xRCiom28an5iwCUDoSZrdINbqdVs=;
        b=KXwhSbM4z+xnYSR9zmHRRa8EsdFW8E9BDhpAbo9KLlJnztt61QqQAhsu4nPFxBUP7d
         Jg4goJx1Zc3JB/Y1F4mDHMkZokLbrV7ovjxZc9FeJSd2LgEqhmiOBrhAWDv8k7zyCHgg
         EjGErdKglcmlT+eMfT3eLovY93sHjjAGvS3trJ2nhhYnfpuNHxQ2nyjU4rjhCvkoX7Ux
         +FXo/QClKcTqqHJOQcDKt34EV4mG5kKT9Dr5gLA3rvahO0j8GlfSdwX+cvoodx0I0ajf
         ZldmJGNDqS8PGJdUX6Y+WtqWDMeQm1ZI/ihl6leJxzE1AlF79CQtZb/KD0z5/evIvmyJ
         AQ0g==
X-Forwarded-Encrypted: i=1; AHgh+Roxi1hPX4hiOb6C/e+t/JUqA7yHGpHxYRL0Gk1ibzWsOqe+XxjOEkvGGpvS2fhdG3Xy78bGE+yMXOHg@vger.kernel.org
X-Gm-Message-State: AOJu0YzvlPwLVP+uWvglwr5GxCrFHHv+g2/F5jRQNeKhwS63FuxUpCWi
	1sYLGMgkLXMyYTx6TcGOblDgsNpMfpFZprZ9BW098eQLVZ+LWoWV/RKPXl8F0ZJfvtkBekZS0oz
	97wHVOL+KoHNGw3FO9yi2z8GJy87/7qJUC9Z7iZslS3RlsN9vuFVg9u6aCvWIwTm1
X-Gm-Gg: AR+sD10EK+DBSX0EKIQ9baALjgZFBEHYX7f/mCEfRimVneMbzN2JIlscnoJ8wk+A886
	jOSN71d3qjqs/NL6JZ1gg25ycTIiYayL5FS0wRyFD4exlAJoZS+68LWHNrht4n+pIybuK01LprR
	wzUjAIZFT+OItSSueW/PCjSGDVV2CgIBpi4wthu7Xux6w5EW2qqF++KaeM8GFAeelFGIAcO/sz6
	sn7UcfemaE54BH1Zl7IS9z5k+kDZiU/w0OrNyZ92Myn+wslekVMYpnb7v8SB8yb+WCqIrtOBm4c
	rGArDlwfnmFKUlsikcaUMAf32dgzUrCEQcvtGzgXMMvS5rh34QvX90Vzu4xdGojOxAD3clJEvZY
	FhLWxQVRvxhEdi/7FsloLVbK4S1ZjPxDIJJv8L9MXfNZ2Lu61lkrfezI=
X-Received: by 2002:a17:902:e74d:b0:2cc:ffa6:4622 with SMTP id d9443c01a7336-2cf349de7a6mr194972255ad.41.1784609862341;
        Mon, 20 Jul 2026 21:57:42 -0700 (PDT)
X-Received: by 2002:a17:902:e74d:b0:2cc:ffa6:4622 with SMTP id d9443c01a7336-2cf349de7a6mr194972065ad.41.1784609861942;
        Mon, 20 Jul 2026 21:57:41 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm42110862eec.24.2026.07.20.21.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:57:41 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add CCI and CAMSS support for Kaanapali
Date: Mon, 20 Jul 2026 21:57:33 -0700
Message-Id: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD38XmoC/02OQQ6DIBBFr2JmXQzQoLar3qNxQXGspBUU0NgY7
 17ELrqZ5P/kvT8reHQaPVyzFRzO2mtrYuCnDFQnzROJbmIGTnlBBS3JywxEyR6dJJKWtKEClRA
 cIjA4bPWSZPf6yA7HKTrDUcJDeiTK9r0O18zgEkjylpzCDnTaB+s+6ZmZJeK3W/3vzoxQIlmFv
 Lqw4tw2N+t9Pk7yvavzeKDetu0LuPMBM9wAAAA=
X-Change-ID: 20260507-knp-camera-a070d05ec552
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: O0hjjImkqLITFIBW4lCVkabiweX4ilA1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfX8R6A8VUrrqpB
 Qfsn4+ljy0lJ5nguC/oBbuTmNM4Ot9TtztfIl2Dx9hu9A7Ts/Vpco+BgXSjtFVjHzupcYhrpzBY
 zsWBdTuwJWnuqHw3s7FwESVtMHx8qxE=
X-Proofpoint-GUID: O0hjjImkqLITFIBW4lCVkabiweX4ilA1
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5efc47 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OFdHJre5LK366wQswZQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfX9NTdDMTfoefa
 X4e4BDBKkZyISpwJLXdPof4VQNNf0mDzXz7nE+eimmNlC+rcrH/Wb2YBW96CcdP+znLJNtyJkiJ
 dlgSK6KhYvNyNzYkG81kAOl+luN2qmoUcebJ3XXz+sHHsywl7EVxSGj6sdyeuoz/I8qRB+9edR8
 tCnpCShp/mJV0IcHicq3w3YjWxcve/sB4tFjfOTyJC5k7fhZkNhEmOSYIQoF4kvKwIx2rORYFFx
 AuszMX/sTpS8d8ShqOtK1ezzQLOTJ66VMNORghZI7Hhxw00BYggEwkgw2dTX67HoQYFeHNNMwhv
 SSCcYoQLugL+D/lY27fooxRuEW+k7Z7HUMlfD4YILkLu8f6cdFT+Dgf3aaUYklxVJdC1XIWCOtN
 zs+ZoqrDePEBSiBHqu2vRl/UXkw5WjFkxPyMc4kYWs/1KZ/R+NB4cHCwODy2yWEtwuHjDapOW8n
 u6O2VYtQxnZw09L7wHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210048

This series adds the camera device tree support for the Qualcomm
Kaanapali SoC and enables it on the Kaanapali MTP board, which adds CCI
support and enables the S5KJN5 sensor via CSIPHY2.

This series has been tested using the following commands with S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Driver and dt-binding are waiting to be merged:
https://lore.kernel.org/all/20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v2:
- Enable the S5KJN5 image sensor on the MTP, connected to CSIPHY2 and
  controlled over cci0_i2c1
- Link to v1: https://lore.kernel.org/r/20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com

---
Hangxiang Ma (4):
      arm64: dts: qcom: kaanapali: Add CAMSS block definitions
      arm64: dts: qcom: kaanapali: Add CCI definitions
      arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
      arm64: dts: qcom: kaanapali-mtp: Add s5kjn5 image sensor on CSIPHY2

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts |  90 ++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 723 +++++++++++++++++++++++++++++
 2 files changed, 813 insertions(+)
---
base-commit: 03cfefef0119410fc464d0d56e83626cb570b7a8
change-id: 20260507-knp-camera-a070d05ec552

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

