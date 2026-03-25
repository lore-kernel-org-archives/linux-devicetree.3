Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A55E356A09
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478105; cv=none; b=KoflHx3QOOPp75H1NSoU5731fDuFx8Srfy2NFs/oeFVjSlyZO6zIqrBe77eGzonINp8nx1FjkdrXmqTyiX7zkEvWTHQ7O0+ul7dnUD37J7WjR8YulxBniPMgjxaewYk2fdFb5vQ+jx77jtmyGG/FJkQ9sl11NdXXRMrRHIusy1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478105; c=relaxed/simple;
	bh=6/vfd3lXwM2YKzs0718Te0c9REDR3N7Ps5VQj/TGXDs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nsleW8UZVYBbxqTjUzy4UAOL1jRbrrgEwSgHg2GX8VCYk01GI0fnyE616qsjJAUR5G/w6daPuzmW/N3Do6ZheJPqRav1UNLw8OQ1vt9Ziz26iT0RMoKZpPNYiouHT6eXfmnavxprgDns+rL1e4hbFASK7sav9JXVhFCWCqB72WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5IJN+9I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKtUPv/N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5IJN+9I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKtUPv/N"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKl05l052332
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z4nLBjlgqed/59ynt2cvrT
	0ZDaT2xiy+EoqtN2N0XQ0=; b=O5IJN+9I3+b8JibgqIRTqkbqnaFFFtwetGT2pA
	WOTkVKUZwPfBgB3JAgF4MwKW2YumQg5TjRpTZNQ7LWZkbeNiMGJVSWwHDHyFxBK+
	ipdfH0ALnXeabHXBPE655zQ+skAWDRRTX2QryN/sMbHwhs3Hv7WWfN9wsaM9icYc
	VBUPOaq2GHv/zCaAjuXq4dr6eJS5a59YoSIRdxrUsDz8F7Xd5C+dHFWeA/VZbiqQ
	2Ctt52lQR/john+kWg3wekbBnPtS/AzgPF1JqvNilrQrMkfjugZySurMOLQeX9iP
	NiLY/efkLF1DpAnAPTX2gmDQbDKDtS/Gae9A/aekszU9Dh9Q==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q1t09yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:35:01 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-467ec73eec1so624169b6e.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478100; x=1775082900; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4nLBjlgqed/59ynt2cvrT0ZDaT2xiy+EoqtN2N0XQ0=;
        b=fKtUPv/N9j2e9O4wHLdIXjptx+k/BxORygWSR1+R5SA4MNMgTFAmFOJXkHTjriT5LP
         IpPdToLElMgAGJiwB1tbxBpDqwnYwn8/17AUixKfM1QDQxomgW9O/E9IhJNouBTL9Zvv
         OjE4HLZylyMfKl6bAr0DjJP3yKOA6gCf+ExIgAoe8zhjQzOs48IP6ait+VUDD8X5wI4L
         gmhfh0awUgnUkbMJf1nyhuVxYl0ZtCETFU3Km7S+09K1Q998awiik+mjOBd27YredfsK
         aYAZNsMst2tRk7ZHhsmGfHAp69Db8SD3OYcNe0qs7V1e9V79yCh/2UenCnPCuvDZqPO1
         vEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478100; x=1775082900;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4nLBjlgqed/59ynt2cvrT0ZDaT2xiy+EoqtN2N0XQ0=;
        b=ATNTwDvCZHVSRe7TjMWF2FcoonBE2Ph6XUkDYGtBiHAP2IotC8J6zSPSwg2U5z0+KF
         AQVPeqyiwy4WcIMps+qLXBRMODo8rEIHfwsUVjH6cExeDT9XRxF3NWtas8qytXGI4Tix
         XEtjcNH5Q0D5WkSHeqLxgqJunzoyskZcDAp5Yn7VWI1CNF77/GYAdxxeKSrhobNlhKZU
         dwYtfJI4JaJ0F8qjMU4PWg5GuqPLWO5H3GFamsO+nP3A3c7dGYoUvHtAdTTsQ14OISqp
         iQUDQpM7oFTgyxeyhED0z5bbbuAsMkuuaUdyWnmfmSZXjGK31Pukqahc4Z8AH8YlAMlw
         68cA==
X-Forwarded-Encrypted: i=1; AJvYcCUcBDc5JXpjqxRvgCQegXeugBpS7BnobJ1gZNf19O36UCnse9wkFFnRnYUs+CQPCdVpLmULDMpqtcOo@vger.kernel.org
X-Gm-Message-State: AOJu0YxnE5Hx1u8DwWxy8RzgfWn3ZEIDXEHJ/h1vn/7qdqXI35CplDs/
	d2bNYXbsphZ8ipFcNsx53jRCaxV1lDThy2pj6yas7zyzibvRIVxH5rWLVA2UUtigO1UFQBtFVDV
	p7uyXVC9atd1P0OQC5JfXRmtNrSwj0Hr5SJvQrwVTwjVXEvoTIQG35eH6UJsiqFuG
X-Gm-Gg: ATEYQzz8NoFgjpJa9WPCYCkQFdLq5XyaHuVhD7YEp6rwtCQzk3roko3Xd7M7G319hl8
	c/h3xKVf7tZabBXvLLopqZeaNzZqUvrE2upstFDVhVUPbCLlNd2TMs8n/may4/56ZvHAcAxW0R+
	ldCidU9coA/vZVQVCorkRqyRQZNHNc0w2wMMcwUQDuDrPk6JvUF1oYl0K2UyLugImONJRPNwFtc
	XtjUeK+x801pS4DSqSt3XLiK+t6idQq/RCOWVGrBsW7W1jth/BM6SQDjO14LmBkrYK0FriCDBfC
	EJTiA5CSSGYXT41tiC4k2EADSh0kKnQb24c33slqPsWNYuEU9Hwy0H6Q9U1F1K4xyGUpQ2DrpkO
	RjAs4TxNUmXtRLKlJ6Y8sXJRVeccm00nj25TRZtRECIA=
X-Received: by 2002:a05:6808:1409:b0:467:100d:22c9 with SMTP id 5614622812f47-46a5c61022bmr2112934b6e.19.1774478100569;
        Wed, 25 Mar 2026 15:35:00 -0700 (PDT)
X-Received: by 2002:a05:6808:1409:b0:467:100d:22c9 with SMTP id 5614622812f47-46a5c61022bmr2112926b6e.19.1774478100113;
        Wed, 25 Mar 2026 15:35:00 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46a70634941sm565790b6e.3.2026.03.25.15.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:34:59 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
Date: Wed, 25 Mar 2026 17:34:47 -0500
Message-Id: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAdjxGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0NDIDc1MTk1r6QoVdfSwMQiySI5yTzJMk0JqKGgKDUtswJsWHRsbS0
 ADw4z+VwAAAA=
X-Change-ID: 20260311-ideacentre-9048b8cb7b9f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=777;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=6/vfd3lXwM2YKzs0718Te0c9REDR3N7Ps5VQj/TGXDs=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpxGMS+Gnq8jTfBEUehPIGqzXHvCkZAryiEtZ0H
 l3wI38DjZOJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacRjEhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVHPw/+JT9pNlPHAxutopYBRMElKa2zf1iWhN9qxpiJRtC
 So538S+vofujE6D2OkrFV/Gz7l5387dWI1ngq+pz6kot8e79P6Lu+vB4lo+cG/IfeM9MbGdPuC+
 V710YbWYMU4y6VSNSMhc4Lax4PRrB/axXOHwbgQ0dIrbiAvyPHoJz5bajuK13wIRJopdVTlJxRo
 lVMeqvvPFQV+EF0btle5jniaOHmJQSteU19z/MHO/3gGlpcZimDVMekDaJOHWJvcAvm3rk7Zn/3
 PKgHNj5xiARarDgRjCuDeWDZdOB6ALCqrzJSWhjHitfr92FNwXuWJw8wyVcP+0zdNzab2qhp81j
 wtuOe/tcZOGpy6YGl74jG6xPita25dLqXojj/6jrLJKMvcy/RFmrWP88pr5GOb87J55CKIpS+M+
 Nk8/uScKXWHg15FHLgLFVhr4uekYBFX6yZBu9klkIYL/fY7vOHNsnvY0nEwLkniLk5Pc1YuM1xh
 vZKyCvNNTmLwj+G7JDAK9IesVvsg1B63G2Gzw/lDRR5fLIHzqZcRrNK1YH/XfSJKnRvWyq7X/Ul
 EGnStWqaJ/ZbMtcUUFAbEZdbR5ooHlF9b/N2MGOgeFjI8+WvWXEkrdRRZ6fV5EeI9rNfh4sp4g3
 x7IztD7YI0O7tBqG/xe24nUP1oABHYC6IkmZOJzdDkUA=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=e7cLiKp/ c=1 sm=1 tr=0 ts=69c46315 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Eo5HmAVCleSnqplLZ4EA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: 9XSHNCk5n6axzTpM0Oq58UtN_U4ZWKG7
X-Proofpoint-ORIG-GUID: 9XSHNCk5n6axzTpM0Oq58UtN_U4ZWKG7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2NyBTYWx0ZWRfXwArG7Yvn5RmR
 jTOnfvhzRiXGSg1fPt5mjYO/2L50iXlZVfBx+ASwfb1foaFqUc+7lxevDc04t8R1ipVERhvinuG
 7S06JrmsuSHfskCaF/ScXMwa4oeFl0IDtrr9emWs1a/ZPSZ7ezNthD36EokuZ79TNII515WWIYG
 e5ExjtjenxFJpMHb16pZ4gOkkPph3/GqnXdxc78T7AT1Vasgk0pgJWsJ5vmzks74FMsBmL561vG
 T1IX5Mi48nISxCIjSiua2RO6jN5l4u94bEOwRD5GKJDzqRhnewM/ux5Y16mOsDwcEeCpxYvbThe
 h4QSBmJzpekPv7H2xnZtWqm01HxKgKvet4q2xLrSy8yAtSHawAX1dIvDEHfxa+25Cr3JQVFpBPW
 sZ29gGzOne1FdkjJLpimfOeHfayxaJVjlehSMWYFDkIyZQkTWIglYzLurpRpcxXyZw9XyJWz6J0
 6/Hk+bq7Dp47/toPp5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250167

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (3):
      dt-bindings: arm: qcom: Document the Lenovo IdeaCentre Mini X
      arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
      firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  | 1199 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1202 insertions(+)
---
base-commit: 66ba480978ce390e631e870b740a3406e3eb6b01
change-id: 20260311-ideacentre-9048b8cb7b9f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

