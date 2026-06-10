Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B87358D32
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080339; cv=none; b=iVscx9l9FPkFZvMnkzf8kXadbyweQP3dvwH7z2rFpZnTlW7DuONg1BUCh7W0EpmSaIRbMbx98NlhEfTG7F0Wx1bO+5gLTa78cX3e5x7ZXLDGlOHFRpfV+KQDFORKt9qRg+eM4c2WCAHH7t/fEOccikwe7tFGPtMkP1rMpac23mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080339; c=relaxed/simple;
	bh=1ETZ+Y6OK4t4qfWHx3ab49qeY0Lk7h63hvOHITkpQ6c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hnqly11mr+s31xSQvR1bAwFU3SHSgsZgyZKC3yoBmzDpWf2GjRH7b82RQO4CsDjtknbgkPasrhM34c9F3r+3Dj6RvnD/kJ7lKC8WnkeOfJ5efobvZBsOVEkgG28QzDVqAHIZzgGiU49IFp1px9/OpOucs4vsaDEbgTfUApwMtRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9J/MLJ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZKRcxI+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k9J/MLJ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZKRcxI+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7i02L991030
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SDTwp8m/1LdhvShPb3TDn8
	+XR4LX0zkaHO0N1ZtReR4=; b=k9J/MLJ28s25hZfXL0splr2jVynZdGMaQM9tuL
	2whMp4clLPHUr4rIorwLIXTSZBT/e9hGe3u6I6qZa6Nva/iLfxIvlwkPz6sluYkW
	jj565G9mXYZheWLJuFjLn430ZHXqB4jbOB4KHWXlwNYNR3IdfbvqAmzuVSjYrFVw
	HIJgoUwUm+VhOkNBgYhpaa9fsWfEfxk2FM27OQ8r/mwhOo+ilStXFmDqLi7EA3mH
	6oM9yOYTipS6DowAsYlP5HDDjl8F6lQJKT+8o/nBY4Y962+ulNntSi+qaiaUk2p9
	KjYwASdA7w2CimT6DqmimaO8fqL1jCGqhO8q8e60se1y5JCw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg0nu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:32:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5178fc89b2aso8016181cf.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781080337; x=1781685137; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SDTwp8m/1LdhvShPb3TDn8+XR4LX0zkaHO0N1ZtReR4=;
        b=DZKRcxI+L9VYXWNF4EO0lyyXcnoAuD82pry55q/SFcDDCnmXB68jfSdNbkRF4xp/dC
         oi4PXzhjqHv6qKpbJV6D9ixmJlxos/KN+2wMeAePIqs8XkKh4+c26bWk2VAs/qNXGTOt
         Dnsn/IQcQ8EZyVoVvYKYaknsI7I+wWTobd08zbFhr3h6BEFFveL/tqwfMvy7m3/NWqs0
         Bw5GrKOyTHYUoi8WCfldzZg8oJV7te9hkJccMG3R/cWFE1/rQqN8O2AjL4MWsRREXxjM
         MrKtWyvst6QQxZTPzpbgCGT3yJAHUUEHMxI+rpTO8OZMFnz0NcXrFcxJenaJFm2Jsret
         wo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080337; x=1781685137;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDTwp8m/1LdhvShPb3TDn8+XR4LX0zkaHO0N1ZtReR4=;
        b=L9Xwrj+obTccz09exG1YG/GgvXfkksQ6sWuLx55ZwOyrqerwO+rzKBQsyeajSevj3t
         UmmS4K/fuugz97NmUfWvt+tmMWoZqcLBqbYmXHzyVLu9nCbxsJ035FSrP/fjl7rheL9N
         pjp5EvXbQIs5LO1OzKNZw/W5jUJF7Wpx5LNGcoaNsn2YOxeWozzKm1QaH5AOQchURUrX
         F0DBpG9kjbac2YKgButpvHVrD5dCVGt7l0/Z8QEFfe6pHY4Fk48i/nGmgj2jU24qnC7h
         rchKFOoU45EyYhQe23wxx03iNoBTahG26PH9MKfhmIWR5AkRXEBOGx2wod9vXahDlq/m
         jKFw==
X-Forwarded-Encrypted: i=1; AFNElJ98lSeZjxN0Gv6Hse8BIHSUW3Nvo7SPz/FgZNBGIkNnUCBwbX0FWHWcpYoH6FrHRbqQYKiPlS5h+BBP@vger.kernel.org
X-Gm-Message-State: AOJu0YyHinkliLUmZaOQAIoMOBl1cOBYul7QIEle9wnNSIYzhXSsPwJ3
	IeeznQB2M/swmqH07mjoB8h2lnj13OjgZQXjMn29P52ZH+aCcqGnHYKPbSVcQ6DobIelKc7ceZZ
	UgQx5wXJZLYgEXCb5u/YFIjH7YPIUxXtGm85/zoffiLYpkObaa17VW9QFgvFcQOkK
X-Gm-Gg: Acq92OGr1mn9D1Tr/ViYspGxYOYSDbKD931PqM0P1Fx+GzsWb5fyvNGAjvOd1pOd0c2
	mcCO+CMGFjRE7Qk5ZZc0y+I+NyM3CN0UG7LU0+y1KSM+qAenja+tNxZjUHgYh3anoJKo1PaWb93
	6STpIeBEizmWrIXqet7q0S21uiHkrO3aYA2zSESil8SzFC6FOlNVD+RD7MBvJ3v+4fRQTO6YmhM
	YvjWxfhY0WWwtljThtJZwI4G16rmnUBi+ftwR8CZKMQoK8c25YIpRCphKgprsZvYrm0BUPpUeWA
	tMdhSpTqK2aVsJJN/gJjwdGZ4Hww8BrR/TKfZYKmaI1QFlASOZQI7ua2juPWz54GrX7Oh6Ex5Ua
	/zL9gALC6jum6QCHh2Q4IjkuiImBW+fARe6SJ20Cxy6Pi0b50FHN+qOhTf9Pd8z+2yiSIiIaOGy
	VH+jBKCVGmtzEnqr7w7deOKthTJjeJvTfWUnBsAl7SHCoxA5TLvpeZJM6GOee93cMocG3SeAkZu
	s6WQeRV2NJg
X-Received: by 2002:a05:622a:2cd:b0:517:6b57:8164 with SMTP id d75a77b69052e-51795cda6f0mr359455031cf.55.1781080337107;
        Wed, 10 Jun 2026 01:32:17 -0700 (PDT)
X-Received: by 2002:a05:622a:2cd:b0:517:6b57:8164 with SMTP id d75a77b69052e-51795cda6f0mr359454761cf.55.1781080336736;
        Wed, 10 Jun 2026 01:32:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm9516218a12.15.2026.06.10.01.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:32:16 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/3] Add INA232 power monitor support for Arduino VENTUNO Q
Date: Wed, 10 Jun 2026 10:32:12 +0200
Message-Id: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAwhKWoC/x3MQQqAIBBA0avIrBNmDKS6SrQQnWoWaShEJN09a
 fkW/1conIULTKpC5kuKpNhAnQK/u7ixltAMBo1FS6iPFB+nJTrTGx2YBmRrx+AJWnJmXuX+d/P
 yvh/xJWDDXgAAAA==
X-Change-ID: 20260610-monza-ina232-de180e669dc1
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: bF3GaPyHA2FJMbij7b1dGvvPFkcjDlKX
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a292111 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=MAzMz8joEOkdVeTcSskA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OCBTYWx0ZWRfXxGSRJvDKjkZW
 L0+GiCwO2PCuUPwPEQjQMgXXRO2cntLaF5kObaZkYso95LDz/rOQwb82ih3sOYiGf2Hy6c0CWsl
 jG+TrfrMQ1Wv4iQCtskGT/FKhATx5he4QpWKH+JNsGo/y7SCGP1gdXtQAJIex0YEQvK1zZeVpuv
 J4kQqF8kmLI+z6hePyJyYwvIdVo1EOvUvNjp907oDxsVC3I/LbjqAL7lmenqZquWlZw53bvZ54r
 vgGqSlwULjVfaPIiGtdtHRaGiPF1SVHQa61PD8kkmi1UBhe3Fvm4Gd8qnp8mHiEnhReNjRPXi8m
 SvXgjAc1s153cQIopfU7l57lMZmfQjIqFGM5sQK4lw7tiFWHMKpSLb3MDVm+ngSBDHMlyYoWov1
 MysOzCXZF+6E5W2H5TSZvXokkPRlXrU5yCRj5wiBRHrHawQh6cOVEpomih9pOSbadpzW0PvCF3t
 gJabV4r3H1Wlkgy04BQ==
X-Proofpoint-ORIG-GUID: bF3GaPyHA2FJMbij7b1dGvvPFkcjDlKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100078

Add support for the TI INA232 current/power monitor to the ina2xx
hwmon driver, and enable it on the Arduino Monza board.

The INA232 is a bidirectional current/power monitor that shares the
same I2C register layout as the INA226, but has different electrical
characteristics.

On the Arduino Monza/Ventuno-Q board, the INA232 is connected on
I2C12 at address 0x40 with a 2 mΩ shunt resistor, and is used to
monitor the board supply current.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Loic Poulain (1):
      arm64: dts: qcom: monaco-arduino-monza: add ina232 power sensor

Martino Facchin (2):
      dt-bindings: hwmon: ina2xx: add ina232 compatible
      hwmon: ina2xx: support ina232

 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml |  1 +
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts      |  6 ++++++
 drivers/hwmon/ina2xx.c                                 | 17 +++++++++++++++++
 3 files changed, 24 insertions(+)
---
base-commit: 8a4062d204752e0d66a1e7e1a2f8834571a8d40f
change-id: 20260610-monza-ina232-de180e669dc1

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

