Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E300C35AC36
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293816; cv=none; b=B6EpfVjt6bMOy2b/gjbAkMFeSFhnodzlHhWgzqSJBC6VzFKgkoLQbsyITXlrbmSFGe1qcb2AkjE35JgE8xqNF/xWvu6zwL8Yg9t8vxQ/u2Q3WPMxXFXleybSi7ywiNfKmZwplzeJTVyYAcQqlX3qb0vbdZ6kW4rjOzZUmRtrVCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293816; c=relaxed/simple;
	bh=guPYou0GHQCfyONXvBvRBR/VhsDUO246QcAdqWLTHC0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cA7C0LuIJXxhrgjWw87A5Xv6k8CCHlBL629T/686i74lrP0EBLCNVR4sOiWwOT+A5BjpqnCtaKHvYR02aJ+s6znYfThi0Du68NMUnd8GsuhVlM1JyNzUY8lCqcnhChrPaVdA8SM8Ls+ozwEj/L784UGulVYl9H1ogTzhFd6g/yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+ZpvIpQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N599YpSJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+ZpvIpQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N599YpSJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXeu1761799
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0z0Z4a8AqRmkbpCrWFHHut
	ybxh1dNIaJRE0pn3lU8jE=; b=Z+ZpvIpQAFlM1ovmf92JoZQ3FIoMhbtVkNo7d2
	9mf7yVI0fWDP/7V4gsWd2lHAkS+WK1tvgeZ2njYid+toh5iNF2Z8Vjy9SWBa/hnz
	Ykhw6UH/+HBGtoL3BOvNTAM9/2ifte4eOWXzd4bWzxvoHjXJNusxBW5mf2EZK+NW
	k+G5H3tc8FyUz0AiizUr4UKE2YgLR981piEgKzCGDUPyIIaVnC8G5UuL8ESjin/E
	EJ5+UNi+eCdxWV5WdQDYnOIYmevwLfuTD4CLoqrEB3tzo5s9z5eeuLWBxs7LvqUq
	kBmHRGOVAcFQAHrfpmmO6ibCE3q6ETXWZi4htvM7BViGqKaA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f098pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:23:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b31cff27fso6072971cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774293813; x=1774898613; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0z0Z4a8AqRmkbpCrWFHHutybxh1dNIaJRE0pn3lU8jE=;
        b=N599YpSJG5QloJrgWCJOYCDCCFYaQNsdvhhDdqygFbZSZ80eGCfksFAi+SuvBmb5MW
         NoAtsOLaxwbbyjzr9VHMi/bMlMucdVKDqG/dwr9Xl1WeD8csTDOlsrRao9MTP2N5vQu1
         naE3gknkB4lVeHYrHhv1Nz8EOEqt3165u3e3pOuux/5y8gUWKIbYoWIjfHBTfi9BE6NE
         UQfdwVPg/240AYYT9nV41hVs3joDL1AO9OFDuJK1497L65VnjAe3pkLeW/7AX6jGfRkL
         GF/l0EFHMlK7HI8h3H30Ea35CqVZIgN9CSkg3A/9KevfGLBi7CeASqNs/Ywx/fJue/mF
         cmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293813; x=1774898613;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0z0Z4a8AqRmkbpCrWFHHutybxh1dNIaJRE0pn3lU8jE=;
        b=C2K2+/w5NBCK5t9eAy7JCzN1Cs1Gc3zZOkxyj/iQ56VJz/U0HflJyj1VqoBPwLJuAw
         gGItC13/uh+udn58pmdZhAbmY54ka4kFuzsBo6LQBGOv9H9gebNwwruM3Aa0F4/+sGqX
         47p4AkR0jbQkxUavF2CKBNKieC4xD0ZotJySlRs/OgMgjaGNFCbezzsjIIiqvhMSXiLO
         MsDBswLHCQoz1MPxhmHh3k6llLqwNWM1v3naQ+1p36sAKeXMO1MrRa+PBbfZg01wVL4P
         Q3QS+wUIeQm74eW/p4HV2/vzlvgOuXOptRpPVfy+yRlS+bfstLKw9Ahu11wa8igMuuBW
         e6nA==
X-Forwarded-Encrypted: i=1; AJvYcCXbTSJ+LNpCWJNQToacOsYEYM5tWbpWUVHsqEb5Bb9cyhtGLMQ8TYuIFXmTSCrFyPEeHdbC5GogmpM8@vger.kernel.org
X-Gm-Message-State: AOJu0YwsBYirFGSmkqEdix7z1QwXXlX/hF8EYshtv7GevqFR7ebSQJ8D
	rmq0+J3XWIA65PQ2UtM34sar7S/Gb5UIyLEDN9dKP5EtoyyyQKM6MZ/p2m3YSDXq65+rbFWVxkd
	b2vjeZEMh1diUdCjsk8ciRJFC7f4CxjSsVy5ImZEGRFf9M5whlkk5v3/2aYYQQhZN
X-Gm-Gg: ATEYQzyjmnV1sJkcEQUVRqsFm0jE44TGVNB6uwcTUq9bjaTleC7Ppp0epeNILKfXYfv
	Y/YfyezGaaqcCy5Qw9WcOsVyZCE2Lelh1CS1HoKIX4HbIewQfceCPuXVoArxOlq/C7ZtEKEtqwh
	N2sUWQ6wRCSkYF05DmMbZJSLor93LIhFEsTW4QLJvAoiJMiAn4WU+SMRHfbb3tJIdBrS72BWDqC
	QuXkkXgxO7+77/g8KAQWVMVwF93uRsJFTWgD6wP1bhdxKKndFPAt/y0sw6Cwetstx+lkm6BVhNR
	3ZCatrAeANjFraCWdMtiXBiiPzfJY2Kr6oz0kpANnb65nEGqyFEmnR9GwRSuV2zRbn5/RkKU+nn
	LhSrr88gy4YD1k0o4S3/muUrs5X4=
X-Received: by 2002:a05:622a:4294:b0:50b:34f1:6309 with SMTP id d75a77b69052e-50b3753e998mr199286081cf.49.1774293812997;
        Mon, 23 Mar 2026 12:23:32 -0700 (PDT)
X-Received: by 2002:a05:622a:4294:b0:50b:34f1:6309 with SMTP id d75a77b69052e-50b3753e998mr199285611cf.49.1774293812310;
        Mon, 23 Mar 2026 12:23:32 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644acb52sm33388113f8f.7.2026.03.23.12.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:23:31 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: eliza: Left-over review fixes
Date: Mon, 23 Mar 2026 21:23:23 +0200
Message-Id: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACuTwWkC/32NTQ6CMBCFr0Jm7ZDSkhpceQ/DorSj1ADVDhCVc
 HcL7t285Mv7W4ApemI4ZQtEmj37MCSQhwxsa4YboXeJQQqphZISqfMfg41hQjfi1b+IUTeVck5
 qq6sjpOYj0m6k4qX+MU/Nney4TW2J1vMY4nu/nYst9/9hLlCg1UoZLXRpZHkOzPlzMp0NfZ8ng
 Xpd1y8u2HUWzwAAAA==
X-Change-ID: 20260322-eliza-base-dt-fixes-6b93dd26c697
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=guPYou0GHQCfyONXvBvRBR/VhsDUO246QcAdqWLTHC0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwZMtGmECT8qD4sMYZ6fXCRUqwt/jna6ONVZLI
 ndVJuoI3giJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacGTLQAKCRAbX0TJAJUV
 VgZxD/9KnJ+8pTKIMJNz7CCXnoFsachQxNbgZa9sfSvnSE+W/xF7owKtHOMU3Qi/E0HtGET73Wp
 bkYl68NucagnSJmolsYc+9ye06ospd53/Y4/RHiDguFPrCldOh43Zw0cbDaQWhv8wgc+0/g5XV9
 MVrvbGpIJ5lvL8GOUA/XKiNiJ0OSJ+h5JVhKECzlxZI3Qg31MChaEYV+6g20UTuFvzC/dEzrVYp
 9DYrzPf/XIXDL7Cg3HcP8Bizd4CWss9OqU4e+Ms0g839hSW+UBi1ValaEA/THAfV/9o2Gq53fKC
 wS7erI3fd27+xwKYTwjhvpQ2/OKWPY5OKKprftajxPxejascBeSHhCiqzj3qNIhOn//T8Bp1aWB
 I5yU8e+nfHfRtP7Ix8m4m8nD+q1hnDsNDTHasTIlL2kobr53blu691QtUfdGUOeuUqP5ly9LTwY
 dFQzqMgC0eknM5B/RiWXvixOdbjIpi8PNEgzpIRl8obUKUAY1En+rRSI99BhiwK4aZEhHYANcKK
 JntjUXqUXwoNSuCMMWmLC+NiNBC1TnGrijQff7H/C6SSrAn+em9Cazw7uatRFakn4KUOPvpddvt
 XhoyENCCCbuZFWlhqGWBkylqe+Nv9g8Nz6V2THChAYbmIfWOI2XfT0LLXSaubI3pLc/TR1zUb1W
 wIXzR7hH5NxYlbw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c19335 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=6mNy2ig4jJ1XD91nwuYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: oLKzdLAvb1r2FMcMz6u92x2I4RTrrekA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0MyBTYWx0ZWRfXzYaSpuZlDmv3
 QEMiMwKJJwhoh/Oi+/dpAcXJs0AmBZr9XQ0DCD5CMatwa0pmj7daVsPXUI0jyKY5LXFrvvt0v6z
 Pn9qSn2doVYboF5dEVticI4w8sJXI+3SnYJFqrlsndix9mYmQYouZ/0gbEt54Dy+QEdEmxZCleR
 awYedq/UjYxDdv+Qu4FI7iTW6i9CCCI0BaXZWZpY4kpJb8iBV5GkmyVfwnEZGx50GQy1u0usxGh
 L2ESPdhzZXqfZvRTX6oKswJDaLMlQb/wVDEh3bE7y2uCz8/xwrXWz0FjrHNi2mHW5ks22OHIU6F
 mPr5tGSQQ/X3e0PCVoTSszk5LXxFtuCUsF/xKPTEc9/hLDkvFAIkmEU8Ug6mg4QHyAps6caWXlJ
 huCDMsdzmrmx0mo2Z+MtJkMou2Pmp8hPq6yHYxqce8npG9lPRY5ETeI+5sPfXUHyB6NrFEfyy2w
 6O8IsDpYTWTFuI7/xoA==
X-Proofpoint-GUID: oLKzdLAvb1r2FMcMz6u92x2I4RTrrekA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230143

Some review comments were not addressed before the initial Eliza
devicetree support was merged. This series addresses the remaining
issues.

The changes are split into three patches:
- one patch with coding style cleanups
- one functional fix for GCC/CX power domain handling
- one functional fix that adds the msi-parent to the UFS node

The MCQ mode was enabled during review in anticipation of driver
support, which did not materialize in time.

Bjorn, feel free to squash as appropriate, since the original commit
is currently only in your tree.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260323.
- Replaced the third patch with one that adds the missing msi-parent
  property. It turned out that the MCQ issue was related to some GCC
  bit missing, but this msi-parent property is still needed by the MCQ
  mode.
- Picked up Dmitry's and Konrad's R-b tags for the first two patches.
- Link to v1: https://patch.msgid.link/20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Coding style clean-ups
      arm64: dts: qcom: eliza: Add CX power domain to GCC
      arm64: dts: qcom: eliza: Add missing msi-parent for UFS

 arch/arm64/boot/dts/qcom/eliza.dtsi | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)
---
base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
change-id: 20260322-eliza-base-dt-fixes-6b93dd26c697

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

