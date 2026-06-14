Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C264A175A9A
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781424330; cv=none; b=LRYilvQV1WQcmTPsqmD6xb/xPRJKmkcUN2e3erABm4UgXwqK4HAtu89UE4ISC8if9eH6rPqv8JrI34ZqbQEzGaoGZK+eKsngXb07Uir1mFAl/vzBpaI+HrbQCDnuKL+ct0qULuiKcsK5H7gach96TE1lfaMeV3WM8kPxnH32blY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781424330; c=relaxed/simple;
	bh=/4/biboWAkv1lQS6TXW98LH+lNEXeuQKoPDNn1bh87k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=litZEM85hlOXsxi4eKC3lktCGaXUdn0H1Q6sTn60IMiRcx2Hgv5YcJBnSgLZTTEUhiJYw0Q2WUwm73nOxZ/xV+eIZgLbuZYIStrJ0c8sOYRH34oJ+j7RvH4EHqLlTbDqnrLl0gt4cWaartgrS2vBvSfZ+iNgRVpjoBci0Lz3lZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jguO0wIb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgrYuPlS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jguO0wIb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgrYuPlS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E48aKS045448
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mRFq1wJZY/+H2wQ02QMedE
	DOCtcndF1/JdZtyF+mv9A=; b=jguO0wIb1Oou62VFt6rAVF1jpQAEWSjX2NMSF2
	SQMtBTDKiHNkf9YN9QHjGUyjUYBNI2tpQC48l1Fckw+knyp3SCg5IC2qRQOggPFe
	lDw8d6MFR8EhcfCZEeaJM6FkeeLhPSs1qCqbOyzhdi5vs6e/zVhUwSDAJGNzqDtQ
	sziJtfXX2smF3XTmDCFCZ8TW4+On7D2AiPSem2oeo45U1STnKXWJcGsISbz0t/kp
	qwBOB+r7N53SLXjnzM+5BOfGb21YtRdZMTSVAli8XbOWUto3+X+5ysJz3UYug1Ox
	XmIhJJqYIgTufe65WbWTD9Otsl8YjTFE+GtJKsD0okKrJnGQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybty3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:05:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c272e532so24430555ad.1
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 01:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781424328; x=1782029128; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mRFq1wJZY/+H2wQ02QMedEDOCtcndF1/JdZtyF+mv9A=;
        b=XgrYuPlS37u6wszk731NdtYOPMo/fWwB0Plwsw7tJ/kwwH+Qa65UbJrtmDmeEYJTdN
         FDolwTxqnEtyq11izFO1wa7+u3GR5y0+8pDsAzyHitIGqsRCmgl5/RPh34xMw/0FPVch
         JfRqc+HJo/rTt9IQIlAmOrKhR4ID6P6mPN4QTa1E5IVHHy641RboM4vDAYA2xYbmLqaN
         CMGWbx1tmPrUtaCVxLCZvYLqX0cZJd0Rc+yoC70wUyEhepbGvC9aH/C8QVTLkFgTivJr
         Vn9c/k5qsKZOSgY14ujwvI6QQidwY0KdzuoHiafGFCHP5CZhwWJEiejcfc9dxZT+ZKlo
         NsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424328; x=1782029128;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRFq1wJZY/+H2wQ02QMedEDOCtcndF1/JdZtyF+mv9A=;
        b=kVwc6WIkWOfW9qtjQl8I6AQpbm8mT3+rNc0yR7IHrQMhQgfIzwnbgY8QA2PaJv4cJk
         KYDDblLFId9dFRlklb2fliuSAa19SL+yW4OGQrD4sgpb6OAiagbkYT7yPR7SXd7+ZtQM
         q/cqX3T6F6FdRQvAGOp6s1KaCODmIWlXkRTq+uDi2X6Mf7dr9T3bmNiabv7hM5f8gwkZ
         sDecxvbUAM0xhgVN/YsMDWCoRRlxoRlcRZNRM1CSPnLNTqLl1df48Dn1zI2c2H9xsSF4
         bIZ1np+oIlFMnnWJ3JKc81WZuWq0e+7113aHq45R/jHBQ5Nc9kCh/C2Q55i8kIPvk2N7
         hDpw==
X-Forwarded-Encrypted: i=1; AFNElJ+RvWaIjlUftw35C6ZjvQfCEN0KEknsa6YL2NGRz5ZQIkwK9zkxROmMSb6gdkyb17wvblVpBybV/JG7@vger.kernel.org
X-Gm-Message-State: AOJu0YwuIhABjYxyEDuxkJ+VA6PQGPDcg4ZpqboX2GrKaZ/yPEyE1J6A
	2fT/GRqn5a7euXtj9RyfTlooUup/vdwGk8+pThZmycgLm3yb5CnssyQxWMmmbcAmR1QP4y0CByd
	0QrH1NkYddOTe5s53jplxTAr/4pRCX+zR8P5gvpjnfQd9WwsorPZcV/3Xgc6OsGyhccYMyWKs
X-Gm-Gg: Acq92OGW9kZHNeBJD/PQ87xAJgCYLFSI7R9HgwjYQA5IzwTDXMSsAWN/xCmH2JEWQLg
	nWLpKqAhvI0TOIokpfs0t+eqoatJPPW8F0cU1zBJTpB3pi4Qd2AKgHJOL8BaWNArn90L9Biqbzn
	4GLL3M+j7oY1V6WerxHcDKR2hOCU08cG1sH3Gnz4P+Z+dKnRdiSA4keZlZHI8ca8MyF9WKem1mB
	D5ThEVoK0x1MTZIV9JctRRHuFN2Gr0G/zvgybLTZadrMjpOvscqZwpWNynM9k7nLYGWEfNtG3Fm
	4NFq14Zpf91J+rNrw2d7U26IRihnvJKBsyoaGrcK3/nd+0ciYP9LGhWaZSWqkwELbS6uv15YdLc
	Fs6LGddv/cV7mTj2QnW2OJ/u0xxW28VsCuCiX0yaa
X-Received: by 2002:a17:903:1b04:b0:2c2:5446:30f1 with SMTP id d9443c01a7336-2c6641641c4mr71729005ad.14.1781424328388;
        Sun, 14 Jun 2026 01:05:28 -0700 (PDT)
X-Received: by 2002:a17:903:1b04:b0:2c2:5446:30f1 with SMTP id d9443c01a7336-2c6641641c4mr71728685ad.14.1781424327907;
        Sun, 14 Jun 2026 01:05:27 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ca31sm67309225ad.55.2026.06.14.01.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:05:27 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add ADC support for lemans, monaco and hamoa.
Date: Sun, 14 Jun 2026 13:35:07 +0530
Message-Id: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALNgLmoC/3WMQQqDMBBFryKzbiTGpNCueo8iEs2ogWpsxoYWy
 d07dd/Nh/fgvx0Io0eCa7FDxOTJh4VBnQroJ7uMKLxjBiXVWepaCut604641K3bxMBKV8YgKgN
 8WSMO/n3k7g3z5GkL8XPUU/Wzf0KpEmw61XVaDk5f5C0Qlc+XffRhnkseaHLOX32o/Z6vAAAA
X-Change-ID: 20260430-adc5_gen3_dt-f0434155ee25
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781424323; l=1677;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=/4/biboWAkv1lQS6TXW98LH+lNEXeuQKoPDNn1bh87k=;
 b=0tM9O8UeBcxiP253ahrazSkkbJhKiFKpgBuqwlas1RQNm5hskfd4U/0beeuVbcom8lJxDinpZ
 2RgAWkKF23qAFAV9ZvQZyObeOWgLtUgLvQ0Kgfq/UusFdB+qlTHf1jf
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: eiq03qiuyFnKc_SlvqqBonqaTBBYvLwM
X-Proofpoint-ORIG-GUID: eiq03qiuyFnKc_SlvqqBonqaTBBYvLwM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfXwXVI++IdcTD/
 r8xNMpVJrjfkw/FxXJ5tjhexFapGtpwKYcmd4jUqK92+xZ8Lk3d+jPZGqTYdtaH/82xbHzSOD8c
 xuarl/gNL28/BN3Sv0BJeLNMUQhaJMs=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2e60c9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=vX_1JvrjfLHLsnB50K8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfX6L/Lq0KB/NTm
 g8ymlXdC7R+3GomGop/NZCjZw5LjNgEsbrS4HuK+9d8UzYkWnUX2CV1qgT8fTDNaBL59HUOeGTr
 x0At2od0YNh8tHAkY59s1N3eI3mX2cch6xE8FhU522ABEpQwMzSxyqtlcjne/ZRMf6qA5NgG6XZ
 W2XR0EpZfUXpICaywo1p+tXw9EedAmnFuCyoBNn6TAPzf8guOoqHBMVadfLcbb3fG1JVIEygg2f
 4JcNkm6bZiZGI+E1aaM0p3zh4vGVf7Ryif3l8R7muy2raYT+HflRaIl6Gr2I2S+QHbRK2A7McJD
 Eg6ZeL11UEK8YiIzyNVNs0hoIILwqaBEQwqY0gM1ItA0CWYA8wMFdeSjgR/VedMJyJ/x1yV+HKN
 p6uNXl6aQ1JudoI8+6C9pnH8BFFTlOaGnsBvdA1HrSpjD6AdVmNOEhPSb15w/L4zN6WFhh5+HyK
 kou95STcST5NP4QQmfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606140079

This patch series adds Gen3 ADC channel macro definitions, with basic ADC
support for lemans, monaco and hamoa.

Patch 1 adds ADC virtual channel macro definitions, which are used in
the "reg" property of individual ADC channels and also by ADC clients
to reference channels. These are a combination of PMIC SID and HW ADC
channel number, which are parsed in the driver to identify the intended
PMIC and channel under it.

Patch 2 adds ADC nodes with channels under the PMIC instances on lemans.

Patch 3 adds ADC nodes with channels under the PMIC instances on monaco.

Patch 4 adds ADC nodes with channels under the PMIC instances on hamoa.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v2:
- Added ADC support for hamoa.
- Link to v1: https://patch.msgid.link/20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com

---
Ayyagari Ushasreevalli (3):
      arm64: dts: qcom: lemans-pmics: Add ADC support for PMM8654au
      arm64: dts: qcom: monaco-pmics: Add ADC support for PMM8620AU
      arm64: dts: qcom: hamoa-pmics: Add ADC support

Jishnu Prakash (1):
      arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros

 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi  | 250 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi |  93 +++++++++++
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi |  43 +++++
 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h  |  88 ++++++++++
 4 files changed, 474 insertions(+)
---
base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
change-id: 20260430-adc5_gen3_dt-f0434155ee25

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

