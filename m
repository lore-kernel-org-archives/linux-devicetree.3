Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FF62E040E
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471443; cv=none; b=Ex0DHbLh6AvQBZm5dzR22If5ml6X8OJnUMn4I9O0fZu6mcvfjXK+KtSaY8br1gr4wZoYfJdaKSXEcxuonAjxrTleLwDRA4ZX50shaj+Rf7yH5IE3o62g/8xWDNbaBVttYQT4U7ws6rJheUOTs1OZymGwXFyilurCJAEOzGtQ6hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471443; c=relaxed/simple;
	bh=TFNBZbF2AykqlmAlNRgGuyEzwxEGnJlOKVQCArTNHJk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j74h3GrWPc/Rl/x+iywQDo43IJ8XgoK5M90lLpGqf5QZhP3xwEACp+Zq0xGF6sW7DRlhTRbIGLUYswIdh7bXghJzVM9s/yEHIbpQ64LLqJB8gkWoQIG16WJZolEoHCg0waKyMEqTKxDF3TyPywgyeZKDygtVxbOoyzupgluqjcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CwJqMuqo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdFy/q30; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CwJqMuqo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdFy/q30"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qbD8870103
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zAUEpmuNkB+tZxSdEw+3Gm
	F38llUPVXR8WmpxBRa8gU=; b=CwJqMuqoVo96t8g803mCCxDfql2cIvgS9ZB4+M
	Q60HRONsMmLd6A2lFqz7Pn16BH1j3suDGPTz4POz7+7BJQIPL0DUtSnWXwozLO5g
	lPJKwPeJKE19RwUpJBCMp5FdoLoRTtdYV/3GiFceFVuKqgqD+4IRmO+YEWHw1KMx
	njS6a4iYmFbDCKd0fc+lXwzlz65Dw8qEY21gQh1WiXwxhE+sf14dySpic+r5c+n/
	C2M6XcwnJk1NRJoPqSMrmHaamBJJNKDp38sZACwrUL60BRSbmXQEdzyKWwpAJU49
	FwT3d58ba+ZalSKZ0Z4y8hV0jElnsvjhb+fMNM0qwGDXZNyw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1v78q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:04:01 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-79cfec4344cso209613057b3.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777471440; x=1778076240; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zAUEpmuNkB+tZxSdEw+3GmF38llUPVXR8WmpxBRa8gU=;
        b=fdFy/q3084YC6dhc2JDWniOkKP/M0ZKpX3RTnb9c/8KQwHu2ZLGCH9ztwHu8iPREtI
         9pgt1HYBt9wrON7+qUdIF1HvwsIWJfAXkWPoO6H8/QAFd3GksnBONousi6v9lQI0vYVT
         Zj9wpica5jV/Ek49BOXpjzEfPTeSS+uiIGUqRDDkN/F7YLyc1C8wg0eCpaRpVSSWepg8
         MstrsgP/GA0PFjkSfC5AKCAqjVdbLoQ25FgkczDDlknb0Eh5QyqZi5OdFb/cuuYWMQZw
         J37knm/iq+LcNvLaDqp2N2dbTfzNlzCxIWSvoLnUi80KC9IKcxKk6WMJmW1S9ve0nP//
         EffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471440; x=1778076240;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAUEpmuNkB+tZxSdEw+3GmF38llUPVXR8WmpxBRa8gU=;
        b=oTOjoRWFaoRvPL65hZ67OL3COFMtxNAND7lubBiQRhI97vEBWaT6sHleOS+Kov28ei
         bduUPTIL9uq5wuxmaz+A7QwBQfNQIOJmHDoQIK58R1pUQg/Yxh++baibDaTV5+YcPVFy
         dDtVxAEoyDy1Z0tVFdzN9OaESWKSa8c95nh5qwcF6fYyL8nPWwuDQ9iV2/d4WXdm5oZX
         iqoFONADp82PVQ0RD97u6/+siPcpmhdtmQMzYt10hOelxr6uHMlYPtkEQ+emSS3c8c2X
         SeBMqq04aTS3WbZdLHGK+29aUADDTWKlABc6WIQCbJmErwwS4VelHaXcuefZN0UdLdnQ
         qxdw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZLvHFCdwS19VN+0q01eu+2WJ7CWdwYMx6bAvJrYLOM8tRbK996T1QQYlgZW4aiv/oKOiOkJKN3p8M@vger.kernel.org
X-Gm-Message-State: AOJu0YxWQEQHOvXYJTIKBvHKKvBgazMo7y6YCXa/pMli3/iUPbKKlnOI
	CghsFNrMdcgTGnINnLcpgP5nD5poB5wIhD0VfRBCpE4HguhBR+BHSN+ark/CcjKdaYTEBLMxNEl
	qyLiiH/Tm4vt/v/TAtzH4uWydLKH0yq+K5wskz+BNZteVkHFSTXu1r29DeLogjSFo
X-Gm-Gg: AeBDiesB2IV03gfGkzdel26XIM6/T2+YJycI/3+Tk3/oIrS6GGojGF3NZdEtMub0q90
	4je+JP9z2hVxJpKgCeCyauOn6LEJWx1nOPU2hq0+y41Hyw3L+v33goYtHDMyF0jOBq5ItRRD6M7
	uNzsx+QEqrgAZuF3EaxVFaJeqwKW+rbdKqed3Yq8WRgXGLu89JYV2hvUchvGPDNGuyloMmAGCSP
	1agp3JaiE3nbpKYmg5XNa6c2jDexkFY2YdLHaJhLGMNSK+CBSPa9ux3NUCjgw/RJnJ93UxbpbNV
	H87+aC/YraGr9slqH02O4+Dphg4zGeaUhPzmhg17WQUXK26Rm6+2Ah8NFmmOz6n8NI4/BPnnXw8
	aOuN9/zNMddcGrvBpyEeC2xpuY8+wQ7D5RsDso2OSElM3fgFD2VbNEvk=
X-Received: by 2002:a05:690c:c4e8:b0:7ba:fd82:9113 with SMTP id 00721157ae682-7bd1d3787b8mr40117337b3.5.1777471439730;
        Wed, 29 Apr 2026 07:03:59 -0700 (PDT)
X-Received: by 2002:a05:690c:c4e8:b0:7ba:fd82:9113 with SMTP id 00721157ae682-7bd1d3787b8mr40116737b3.5.1777471439121;
        Wed, 29 Apr 2026 07:03:59 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd258ce06asm15382827b3.36.2026.04.29.07.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:03:58 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH 0/2] Add interconnect support for Qualcomm Shikra SoC
Date: Wed, 29 Apr 2026 14:03:47 +0000
Message-Id: <20260429-shikra_icc-v1-0-e3439903edf1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMMP8mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMD3eKMzOyixPjM5GTdJMO05NQ0E1NDI6MUJaCGgqLUtMwKsGHRsbW
 1AMUig0tcAAAA
X-Change-ID: 20260320-shikra_icc-b1fcef45122d
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: xI9xrSM6Vwf1kXTNzttQaEYqGDsp69tO
X-Proofpoint-ORIG-GUID: xI9xrSM6Vwf1kXTNzttQaEYqGDsp69tO
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f20fd1 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jFa1RlLEcyH7Bxs9oBUA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MiBTYWx0ZWRfX2VrnDtE7Ylpb
 iKQO4BEyNt4d0XEMo/ZAy7We4Nsa9oOtQ+xGf6WDHefl+UMF6xzuY2dJCOpd4iNViAAja7ER3cU
 u1/g7W3YyEqRsIRNfIG0mRifJG7yxu9a8O7rEFwyO4WIAU0S8qJCceZYkhDziOOL7tcu+aOkFAI
 mpdKNZ6G0VSUx1g8nlNq/CZ3aeoXp9D5vRC3eWji3BqaCUMrjpJi12I3vVhhvlUOEu0BW/Z58le
 oX9F7lHibrkK2AbiLHFP4VajFs/XU0KpIvdhM7uQOfy03TlnSr+dMWDdFv3++zMpS3QNt4f0CsU
 8olWtTV99TnNSp5YxlzG4NLqvA/TQr01CfhIRpK1zh5xk69NiIkcwz+O0xZ6fTP3Hn9pv/4Os2t
 0vk1cTv4K9+PaQmIaufHylDwwOwVGpZl3QgHtNfhpgg/betZM7VJOIoKrEan7HGCMSloZW5iweX
 /t8ABvlSM1JjGst8bMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290142

Add interconnect dt-bindings and RPM-based interconnect driver support
for Qualcomm Shikra SoC.

Device tree changes aren't part of this series and will be posted
separately.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: document the RPM Network-On-Chip interconnect in Shikra SoC
      interconnect: qcom: add Shikra interconnect provider driver

 .../bindings/interconnect/qcom,shikra.yaml         |  135 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/shikra.c                 | 1837 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,shikra.h     |  121 ++
 5 files changed, 2104 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260320-shikra_icc-b1fcef45122d

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>

