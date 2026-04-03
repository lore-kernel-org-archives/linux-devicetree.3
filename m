Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1143BD22B
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775222898; cv=none; b=r3SuXN9L31eo6yjAO6SI46ZIxXaLTE9wcJr/RuxdLls7HMtMw9Q0EahIdDatwOGzclIcwaxMqlSRyj6N9EiKLEgpqVzXHrnkOchEsBrgiJmbGepQ6VLOmH0OD5RXzudkvrftNmPT06NV2z9iAUcWKXoWZsxPf6A1P9xmkKOmivI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775222898; c=relaxed/simple;
	bh=UBafEfznQM5mDg8YHW0tfSRN1bbSrJak5bCUZmVa+EQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tgA3zRblg4hJ2nFPGfd/GMyQk5P4n5nQQ/frBEAltJApapWw1CNNc8UQet54aA94YVWvmwL1MVY2ldYtP1q4hKyHU2dUSmVyXtu3WGZA+dooxCZ9jZGbfiI0+V/p/0gmkUtKJnx9cAh/VFtqFW7Y60vnqRS7zigQLbE/b1R+zXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=looJrWFS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0y1rlnp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="looJrWFS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0y1rlnp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633BRoZ21562134
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 13:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sCO+QRLdmTxJaTywtHCHpI
	I0aQClSShCW/3fkjuOJ6s=; b=looJrWFScGFsAuJTzQiPBsyHGajTJQMPmn6zV3
	PMZcW0dOVc1Fj0YG679JcyCFlcjRKORCcvwd7Gz3A2/ni1gQ9sWEnNibcAAWOXwa
	B4qYaZPD08xBCpoOt2Iggf375oNTpnCm/W0g4t0AYPhWAhZfiXODcINy8KzL2jmB
	Ng6ySmVUtV4OwS1C0SbQPXf17OIAiLDKmkNx+7wfUqdZ2NSfHTXBeMx2bvlVTS05
	buz6EQagHEk9CmoW60ETnleyaJ362+EWb8+yde/9DfkAY5b21nLlw6MXmIQ8EAXk
	mIYyRawNXNlTQuNcHWliDx1Rhez4HqGps+nqgPinhtCcwoIQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um73hh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 13:28:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509219f94b0so58545591cf.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 06:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775222895; x=1775827695; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sCO+QRLdmTxJaTywtHCHpII0aQClSShCW/3fkjuOJ6s=;
        b=g0y1rlnpGKtzBwNhGNm0w/SiYXpwzRLIMzemWkl+AgcbcSCn5E1cFsuFqrOZnkQX1P
         XFyO80JRFETdfO7TPEUiBt/lk9OFCKABPqGU/kX5OeteWzeMVYsK0CwcETbjv2T0rT07
         tMzfQxeSa9tnsMY76iGrZcmHKlnFybA9GnosZblBgC2rAISmC7GNuDeGJE7au4WOElNy
         j4nXZGFbItKOonC6+XVKeOOHKmTyA56qhjoSMm2NZPOArydf7n/QhGp4aH6LJ4JtKGKZ
         ZfAPDIr24zL7qeeNzdu9Hfc3rY7L4cYsyXMNCJpDv9lBmVKASICY2uli9N1VGg50sUwR
         UNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775222895; x=1775827695;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCO+QRLdmTxJaTywtHCHpII0aQClSShCW/3fkjuOJ6s=;
        b=SWHax7BiGFwkMQu2NYEjFhlQhWri4Dx+FcpFdD9UK4ZrxoS0PQi8ASFlpxw2oAlzsz
         ptnr3FloUceiKLJ54hmdzedp/H3EEgUzu7Q/off7IATPWTIMFQqU4gjMmXW82BNJi4ce
         qJcmNo7rIVRp9HEIDLyXHo70Ny569WKHQxm1ZdIUsSVcWNjTzOP8C2O4IMkD0j72wpSe
         +axTQvEg7LWWGPFkdI4Kr7TFjCBBZhOBh/Yy1ZoaADp4PeCs+fsPopxEKUtOzX36XbRS
         jM0X1ZsxmJ4cQsAvnFxK6WClg7IltIhPxVpjHl2PTCckUPvjS+QwhHFL5dyQMYR65dtD
         sQCA==
X-Forwarded-Encrypted: i=1; AJvYcCVDiopR5gqsUUdfHN8x3G8ltnXaE4OhXEGcImXln3Ocin+u5tC9rvyjpMObZ0HxsDju83VXdEOAQU7G@vger.kernel.org
X-Gm-Message-State: AOJu0YzHTCAAL/D5pSvCfIC6wyJcEu3fqsSqPs6zsypP+XoSvod/LZTe
	VSBGclk1uNmqNcO2fVm7PU35Frdtn981sUOIwdEhXDOSm5PVa9WIkYlE3bboX06AmsWMk7yGSMB
	tOf58ahKh1WH3UbEBJ3fdegucR4EN4PhoLmRImrTmdmjacRqxqywGYqiN8z6XzW+i6GJYw84X
X-Gm-Gg: ATEYQzwT+3zsDTL+SIjJje2wCNzNjuUa4kzurpaG5HuzYah+b3qlvfAqVnTYDP2nxzS
	7uDMIDJxzYMLcpTsAaDVu2yvtj91+PHZef9es1Q5v0qOxR5D9nQMaGoAIv+gaE+ZbtoraMQsoP2
	jKeU2rqZCnd6grc1Mlc0ahtwk+bWgj5oFpgdJCBiy3kmosP1J8DmJux7hcQUu77YsUjJaaLtk+K
	YBVmSPZDYD/eRLXPV/iuEuhiEaOW7sPAaDzkUdYBpIpl0TBWVOEH6nk9o2ERoQhysra1JXmRX0Y
	mZm6tnIZDl0IbFCWs7HYPfrxhcX65PkBiqMWfyCMXAmGN/MxGyuI4jQJgwkjgEDGDsnVrYMcOFD
	KgN0Ann5tH31VGg8oEGazKzCQIopgwvw3XhOxSEn/wpGwlgPKlwth
X-Received: by 2002:a05:622a:754a:b0:509:32e9:7e9f with SMTP id d75a77b69052e-50d62a8f87fmr34798801cf.36.1775222890231;
        Fri, 03 Apr 2026 06:28:10 -0700 (PDT)
X-Received: by 2002:a05:622a:754a:b0:509:32e9:7e9f with SMTP id d75a77b69052e-50d62a8f87fmr34798551cf.36.1775222889804;
        Fri, 03 Apr 2026 06:28:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488980e312csm22224685e9.7.2026.04.03.06.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:28:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/3] pinctrl: qcom: add support for the TLMM controller on
 Nord platforms
Date: Fri, 03 Apr 2026 15:27:54 +0200
Message-Id: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFvAz2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNj3bz8ohTdkpzcXN0kUwtzC0szg+TUZDMloPqCotS0zAqwWdGxtbU
 ApC1VUVsAAAA=
X-Change-ID: 20260403-nord-tlmm-b5878960cec6
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UBafEfznQM5mDg8YHW0tfSRN1bbSrJak5bCUZmVa+EQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8BfS/DYYfctrxuaTshIm5u6wbUYKLAiwuExQ
 xXgu4gTfjCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/AXwAKCRAFnS7L/zaE
 wzBOEACnqIKquNIdIsx8RhzicJcWcFZB1II0y0J9Z/xyQNaejIuv6ryXX7/EqwrPHoxfwOnCxYX
 ntAHK13c5bMI9cyf6h6AVmI/44lhxUZgViXvImPCYiUnUs47cXSJ8UUUo0z3dW32ozuA7+3/m/F
 yjuVhtwe+8yF7vI7196T0xGFWhRApML+TG4jH6awHXwoNPMxbH3afqiYilqak3fHy4GIQu2P/4D
 bpudo7nqbM6E2nPLuR9bnvoXubzncUGvNOGPeUeLkrdilXg9kYCmdg9VOnYNMAUr7+K5V6Hr+LW
 myxaMT3t/b6O1CmnT6xJ4bi2COqtWof9ouQbiDlR4lpfRlbsn08qknfA1bTqyff3BazrtML6izd
 eCCI0vvj4iVSA0a018d7M16P/VdRJgMViHEJV6oia8yO0ViguZH7y4w1cLUo9AgHaGFsuKMyp36
 +Rop/ZP3pychk5yKDTETfkuj3lj2ELvhnLU+m6PfMkcoTF5/CJWCxbXRp7T0/cuDBHRVYkSr27u
 ztl/luiHeBb+02sOiI/lDWvih+PoeMrkSDxLYVV7do7ODEqV0X/WnuoeCqdsVgc8e9kss+qPyM8
 vzofQvx52fgtvUaJtOVZnptdPtWnaoh1NxQ36D32z0ydXhLXTsrFiUJzAYwvv9+YGEAygiXNlCE
 u6zPzELMaHR+/CQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69cfc070 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=JAQA1SFX2CWciKQcUckA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: sxJsiQ9o8SQQrMbe5S7Y3IKXOZ53e4Fl
X-Proofpoint-ORIG-GUID: sxJsiQ9o8SQQrMbe5S7Y3IKXOZ53e4Fl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyMCBTYWx0ZWRfX+JuEK4rOHSeZ
 gwXxtPMLX7eCphC9SSgih+WEKApJ+PEDatK6pZodUxy1qZI8W7V1GQJuDG36BRLFyUeZv4laI++
 F4LQggM5BgInqxy6zMgwW9XxoN2WA1UtOtRxzuhwZxfhNwnKfRRmI8r0PndLyVxJ1E5RNmPe2/E
 Th4x15NzcU0ykcb8p8ihpp9hQsUQ4hOgmxNKalPKCdeS4tTPjIVpgLlPhO07/SSa/VK7IKJ1B3H
 PyRpsqp0ERP13Yu3qTxCXUBaHzXWN5QYk/pMkrWpuaiuOoa2KCCLZFW0t1VmYzU0qT7F8tjHGZL
 UnSRdCHoKFiSyy5vtIkdLUa4TG6RnBIn+hqFSd8/sr040rA05okt/dADN9S7zJlLYlU33+ZLRGV
 fUN7oQf9rjn/O6KV6VvCIWJU6OAcLE47BQ0jn15liHmRRxogvlXsjTqKOKpvF1C99ldxilS8ONZ
 kg2y8/KxucWUy8/G+Lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030120

This adds DT bindings describing the TLMM controller on Qualcomm Nord
platforms, the pinctrl driver and enables it in arm64 defconfig.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (3):
      dt-bindings: pinctrl: describe the TLMM controller on Qualcomm Nord platforms
      pinctrl: qcom: add the TLMM driver for the Nord platforms
      arm64: defconfig: enable the Qualcomm Nord TLMM driver

 .../bindings/pinctrl/qcom,nord-tlmm.yaml           |  206 ++
 arch/arm64/configs/defconfig                       |    1 +
 drivers/pinctrl/qcom/Kconfig.msm                   |    7 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-nord.c                | 3297 ++++++++++++++++++++
 5 files changed, 3512 insertions(+)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260403-nord-tlmm-b5878960cec6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

