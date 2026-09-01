Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA05E471423
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250055; cv=none; b=YsVe+K4IhwCCvw4UX8197I/NFlGeG+WyDnOVFJjjrH+aIyvrqhIKcZIMvOhWYmKlAuanR2HNVEzlIas/IiqQDIBxyRcUIA2ld7UNEPwPiseC+zLz7hAl3pViWxsDlf5M3C6JV94xaDXk+DriT36ysk00HCYvmS3Jjzd1jGNp1dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250055; c=relaxed/simple;
	bh=b+2ardxveMsnWj4o/RsEP2VSYMiRa2YAjaOSkYsrcMg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IGYrPHlw9NZWAA0YYMcVsNtz0Tn5lBf2S9xD9sFlqWIGpovHevnGrCfC33tuNt3tHpB5NPWRnehxL3A6VBwRn0H7JUtcEjiZ8p5/7W54AJfw+QRvXBCMufmQYm0wqrnsvnXpgpdcCxE6RpIIbH/rzY5eif5GjzbXEywq+N+G4Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzJZGrb3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIm2ACF1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzJZGrb3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIm2ACF1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179KUS1335435
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 08:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m70Zod04ICRCdjzQSFGP1J
	7d7ucr2LQUKCZ1g0ilD+U=; b=DzJZGrb33eIwe2dDdOuGA5hYdMazXCJiyckwZI
	Bj+SOZQ4agDkVNg7gn4RwKigmJoofDfbIvVCyXPt9qrMcEMeQCh0R8EUgr4OCjaO
	C0F56IKJTLgs/fBwGe2mZJXuu35t8z101Wgx0Hil6mr0r9XLEn2cc1xo92BNf8eQ
	VRoXhKq4Un5yEFVL7awvlOpSxx4Z4P+l4YwZdFFCWjhIRzMlvnhODKgUK04et+1X
	Ka7abotxhDL6FjLsUFHk/j9b2Ziam5vDYYejmzJg+PKR5IyibrJ7MGojIN7jYhjS
	3KpaZ0fWyNOzU+PIErYbpS2t6VoZrbkFdydSjK7BIkDO3S9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx21dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:07:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938153538caso117709085a.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250052; x=1788854852; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m70Zod04ICRCdjzQSFGP1J7d7ucr2LQUKCZ1g0ilD+U=;
        b=RIm2ACF1V1wUzGeT9oHdtqMSskC73IQdlhU37QNexmrrlctOZ3vlPxsMZSW9Yej1R2
         G37opXitJx4fYGW7j4gSq5dIaK8z31mq/bAeIoM2adV0X6atvE2gGydfKYUjaKTrUR1x
         LzJnXYKp034t94YxxX6UQ8kintNuloyFWxbfcXS8hDbUvDgrqn2n0WWkAVsXe0inCdAH
         6LBQBdRPQb74U4ZkfvDu4/qIUghPRRarGB9qle4//uPN2zz/IaLse1E0Q0o2kpT5oLLN
         OhbNoGRAkR0ulz6QqspBklVfETz4FSTGK8d876eDLZsf1rmtIJ1+9d+cfPB7Q+PML5k5
         uACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250052; x=1788854852;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m70Zod04ICRCdjzQSFGP1J7d7ucr2LQUKCZ1g0ilD+U=;
        b=IrFyR3nOtaaOfcpANbp1I239//txeolFSAcZ36+dTPtpdGfvOfQIkQxgEgJJ3RXdV0
         yz3SxsmEz7NIa1igMQXrfy0sQSHZBZ15yDx4IJyR4sPI7uftSLROu8lT+15rItPzYbhV
         BVqaLDnDPB1oiWJDcsC3dzbXZhB88dHMH9mdexizraEqfwPV1ZNL6bXzSKWjB0HQJstO
         1watHkpMs9s48Cxj906TX6YKvH1+rGhzZja7apY+dbkKPALV7aBcWJVaYMSEBKAmWAst
         gU7lSi1BWe+z14QqOSgngbM92jETpVz+WQoq1lfQ/9Ej2rHnQQV0tB5Ztxbj/Up3pWz1
         OXmw==
X-Forwarded-Encrypted: i=1; AHgh+Rp0kxpcTPWAiOlAJk8/alf3+eSuYkjAVaxIGo/h+CPgJ+wU9lD7uwPtp4poeecWkWdd1+a4UOJOHiGe@vger.kernel.org
X-Gm-Message-State: AFuF++llt2UBsrVGLAVpa9oLh7H/zKW764+w6smLGlAGJdC5/AHzOweE
	R4tQNSotja0XMzYPYHCOGRtmE9FddPE7YJCxdncLnWPepKtdIQplYMUAhUYNWWAW68QhyqY5iAn
	ruzXSTZcBO3L30IDbo7t5mB68idcxp2t2DwtvWKwTUEwUL+h9XoKWi/rVnJVhCL0b
X-Gm-Gg: AR+sD12hPBfoqa6v2sjr/wIarY/Ce8BDwehVzQ5s5w2eqm5/cPMYSmAzRgHA4W9MHmf
	S+PoB09BFbREmNGAtXpafOjO6Iry2ch0C+jpeAT/5hsBYI7vKZ7VSeieAN8sOjHIjYlYenlRqlC
	jtQ9UA0GlNZ8tH2W0ZY8S8A38sY97axswHTxLsnh63O/hZvTEtpQZbsc/IHX6+06rQg7YGAlyZV
	34SU9WeIrdQuChbAe5TYzJwRYFd1W6C+8o9HXjEwO6sJG0Kd6af962zudWgdVvmgBrEFSckCoLp
	FfUguW3pXR2i/cRQWfEmrRb1qJR5oivVdezU0Es3xqUdJasxANAjKBpjT1laUSoLhwzT5FN1O8z
	Mp+Vu5nc8
X-Received: by 2002:a05:620a:a0cc:10b0:930:a26a:fb2a with SMTP id af79cd13be357-939137af782mr2808359285a.2.1788250046697;
        Tue, 01 Sep 2026 01:07:26 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cc:10b0:930:a26a:fb2a with SMTP id af79cd13be357-939137af782mr2808352185a.2.1788250046047;
        Tue, 01 Sep 2026 01:07:26 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 00/16] arm64: dts: qcom: hamoa: Mark the EC reset gpio
 as reserved on all boards
Date: Tue, 01 Sep 2026 11:06:57 +0300
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKKHlmoC/5WOzQ6CMBCEX4X07JJSQYgn38Nw6M8WasRCFxoN4
 d0t+AReNjvJzDezMsLgkNg1W1nA6Mj5VxLilDHdy1eH4EzSTHBx4c25ADMTTNoP0MvBSwiYABE
 B9fHO0I3OA1e2qq0yosSaJdQY0Lr3UXNvf5oW9UA97+zd0TuaffgcO2Kx+/6sjAVwqFQKGWx0X
 dqbJ8qnRT5TcsjTYe22bV9ioQbw8QAAAA==
X-Change-ID: 20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-0bf57fbd24e7
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4476;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=b+2ardxveMsnWj4o/RsEP2VSYMiRa2YAjaOSkYsrcMg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloeqsnyCY+MdHAPbs0lmlg6ZPSmPdiqstnJG5
 gpHBAb6zkqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHqgAKCRAbX0TJAJUV
 Vo/6EACOP/dlFTht1vBupYGXd2dhyti/8+jEH5Fq/Ue8iYTZjpJdbbbmJwBnG+1yqoKZm4+/lij
 /r4Y0pJ2ote5KJku1f7k0WICKeWp1XyoQs5HPVjtwfkdcxTK2GJtJDShFMLwy+Xgv9htBqDiyvx
 prCJyXX6CDca3uCCk5M3n+M/G5aet7Wz8zH0CN2Qqp2sX/JRz/lvXYFsaA0gfWtEKBAyuCfYx3Z
 W336YFn4NP4e4KXr4cP0jVG43Y0j1c0A2ZgvOqSvl7HcmDazWaLHbNgpMUV2oB7jhIsxBLO3nn0
 6fNxv7scsAuNkrr6ezy/g1cm7V5LbEta1IYkok9kumfmnCWI9sWlYYyB8wZikGpy55ceBtgCJJp
 EJvlGOcZWvvmFJCZcvcIx6s6itvVrGioXpLV5hWBH3vlPSbzaUtr+xObK2w0L6ePJSF6rJM1qvJ
 CtsImA6OfiSmhOYEzHktaky6rddNIU20v7AAZBweSz7Z3m8+uvJAmzgG/PXr8r2cvupos9Yc7kM
 7t7FAgt8hREqb3s/IP4djAypnOehKwE9vbKSUNR51zN3dDZjRiv7RKfcHjujhPqxpKqGOCPE6eX
 ePt6S2UOTCcjeVyyn+aiXSMt2B3XyEfsE0KMbovW1QHyjTWqAmqwC6832YxDc82txooAPTuUCpa
 LvNFL3Rk6STAqpA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a9687c4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=yDUiu3_GAAAA:8 a=iLNU1ar6AAAA:8
 a=gxl3bz0cAAAA:8 a=X9uYJ1hcyrHnrYopOo0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22 a=gafEeHOdjwYkg5oUpzAY:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX7vfyCf9lipMP
 d91NVN23wnNH1VZ97Gs4OJpBytfFe/WvekCD1E/yzC/O7O+yZDxwh8tOzvJWYdyA9JT+l3sbfW6
 a6K0UtmyEjasTcML7IGsquHkw85Ol40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXzKHYMpE/XO45
 8/y2BPfhf4TsdtF2+A6kmRc7JCbvRlsUZGN0gpVIMgrFISgjaOWl8N/bfbbyFZ0rPYwV7kdTEQw
 quyT9NC3Rv7xiT+2vtkQLWi9q1CqNsuixfvaRdK7n1UnG33yAg+zxMqF3wnFUTkVcBL0zHhXOBK
 hP7sgfpF/p99hI+6Zt0ZzZTIAr/aXrT+SZFYM3G435IvJoDvcRNcLf1ydCeq5HagB9vl5vVSfCf
 ULbXpaaVimPmxFz8V8QzgnQ2xEuYw6o0pSgfRVt/EA/O/MQW90aLDQLum0Kz/VXYVwVlmw8siFW
 LKKtuxmxXyolF8uVS3FC9iXfkoZLvBMyp9EigwoTIgclxkO7sLO7foK5Nv7IHzxSJptoJqfDCrw
 Kl8HJfD2o99NqwbKZR1HRAfbyR7CRTPzdJYJhfXmophqiKPndKPnSH9o+FwG5ze7+O7v6R6qQYi
 iHvkB3hue/d95Gpo6ug==
X-Proofpoint-GUID: HImqE6x5X4a8McbdGX0Lvy-DsHYqskCi
X-Proofpoint-ORIG-GUID: HImqE6x5X4a8McbdGX0Lvy-DsHYqskCi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010071

GPIO 65 is confirmed to be connected to the EC reset line on the CRD,
QCP, XPS 13, and T14s. The same wiring pattern appears to be shared by
the remaining Hamoa and Purwa boards, so reserve it on all of them.

This prevents Linux from toggling a line that can leave some devices
unable to power on until their battery is disconnected.

---
Changes in v2:
- Rebased on next-20260831.
- Included fixes for all remaining hamoa/purwa devices this time.
- Link to v1: https://patch.msgid.link/20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Rajendra Nayak <quic_rjendra@quicinc.com>
To: Abel Vesa <abelvesa@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Konstantin Shabanov <mail@etehtsea.me>
To: Srinivas Kandagatla <srini@kernel.org>
To: Ettore Chimenti <ettore.chimenti@linaro.org>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
To: Xilin Wu <wuxilin123@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Val Packett <val@packett.cool>
To: Laurentiu Tudor <laurentiu.tudor1@dell.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
To: Dale Whinham <daleyo@gmail.com>
To: Jérôme de Bretagne <jerome.debretagne@gmail.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <quic_kdybcio@quicinc.com>

---
Abel Vesa (16):
      arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e001de-devkit: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e78100-t14s: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the EC reset gpio as reserved
      arm64: dts: qcom: honor-magicbook-art-14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the EC reset gpio as reserved
      arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the EC reset gpio as reserved
      arm64: dts: qcom: microsoft-romulus: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-asus-vivobook-s15: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-asus-zenbook-a14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-dell-thena: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-hp-omnibook-x14: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1-microsoft-denali: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1p42100-thinkbook-16: Mark the EC reset gpio as reserved
      arm64: dts: qcom: x1p42100-microsoft-sp12in: Mark the EC reset gpio as reserved

 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi           | 1 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi            | 1 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi                  | 1 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi             | 1 +
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi            | 1 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                 | 3 ++-
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi  | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts        | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts     | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts  | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi     | 1 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                    | 1 +
 arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts    | 1 +
 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts       | 3 ++-
 16 files changed, 19 insertions(+), 3 deletions(-)
---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-0bf57fbd24e7

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

