Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3D03EBF35
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100502; cv=none; b=ImvufGpUxdWo0P9hVxbo+LPUD9ozGBYvcDhskA/Kh20+U721LVc2LUKVET+sHI++ykhWLs9wnvufb50IKvKmnkzr9ANsKeBYsgypF4vIc0F2LcmJYJWzb2W/faeFlYpNnW1MTafeTdiVmwLGyEjIG+jvrMPXWpDLoJ2afLXdJ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100502; c=relaxed/simple;
	bh=u8v8CNSfX49ylyxzKrYVQag0107VfDC8fMtgShe9hkk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XwBlD3djqcWEGisgD9qPWGJZ12EddbrBOJ4XdEmnh0ATbWkBgzesRrOkTA/LLjEh0LHunaCCHQVLT/NX+DUvULHBkWJQF2syXWJUuryHJiLeoRCZoMsL4iXcrkHBb0H4WYnoRWa/kTa9KnZ+PEUzJhAC2Ae+kdOCDfDC8brVjXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inGa/gUd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQwvdoW1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inGa/gUd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQwvdoW1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7OYtq221510
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fDwKWlwQGOochU4nwJPd+3
	5tl+JrVx7kQH2npiXLb6g=; b=inGa/gUdIRmxKU11dDaXcNQDN6nxOvTlvzT001
	ckorbJAimcW68YG/JGsT6Tw83TcqRNlEAT7O11v39yedq+/LEsyNzFB9WgVHmhTI
	3nLdMkdicf1ruPNfUkCgx85wuZREQJld2NmtOULPU7pSzVOfF31tZgNbOv8jijRR
	1Vq5KctRjvXsrKKTBl+vk+ICNh3ENM8LbI3CXV1hFL+GqtcmUXWO4GpYruDIAaDk
	5WYutDQ1jNA2USphLZTxVWD1F0f+kRvhF95gqkC/efWK3R6M2p1AGkzJTkVFT5re
	FakM0EQE898ktLA3tTfh6cBMfQs9cmdwVZCM3jVV8QB49KjQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g60ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:34:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d6bf346adso51609261cf.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779100484; x=1779705284; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDwKWlwQGOochU4nwJPd+35tl+JrVx7kQH2npiXLb6g=;
        b=fQwvdoW1s+pQkfAvOq31XrgY3E9+gj0iobYhnSn1JW/V31sI1O51HCc5yBXuGciydl
         o0HSoDzeRnkzwyaopefPpRp2wunJuN3XIW37+kTBkkjfLSQLLtDX1fndh8R3TZc5iC2M
         mKCIgVzzMAcXhkGfDb4OiA2vrqwowgPtU89L9bLOP9IdI7Y8Ik8iRMLGb1yygZMz4KMR
         17qiYj0FMAgeM5bkP0WQSBHfDXUVCeI3aEpWiaFQX3zqr573rGx6dJBtg/QzXJKTSx3H
         qQOCEsncgiR9VTAFFcpzM+X6lCwB/4kYuQeyFeTIM7xOYRXPkF2sTwokeivQ7kSNVgyq
         ZwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100484; x=1779705284;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDwKWlwQGOochU4nwJPd+35tl+JrVx7kQH2npiXLb6g=;
        b=AcrwqRyzuaytNHoKc5s7JlhZnWLSEcQd3YmekbzuaNo+O6NJwVlhs2O7gIgUYDS4VN
         JL9B1OfOYH8DPzA0GMF8BqhTTu1NTffZH3qLTz4K79L0SDkCOVJ+HfqV6oUcSRWjh0jl
         NqYkXXIsB0049gcSxiY8i55FFBc70EeXfk+ogM4otsNVpNrqgmZdByaZR1+VgJlXmTRc
         2Vd7SNO4Pxbbsoq+YMFYi+6K14VbbV87rqCrTdrM6LC/Vo/zGLS8KU2RVJof3+y5IHtP
         ruch8WSqqAxRmkgvXiLugZimKDkMXut5nlzrFjIJr58/DtGgpySGPxb/ftR2va3k8TFC
         E9BA==
X-Forwarded-Encrypted: i=1; AFNElJ9YUZ5R+IR3SN0ELfAUEpD3FFRJzyYHpxR/63ULBwXs6cOatqR5szvqhU9SkdNuTYuKUaJaeNas5arG@vger.kernel.org
X-Gm-Message-State: AOJu0YxTVdMDDt5eGJeW5XcwWZVh/xwz5J3u+H+34fiDbYPy06SH1K1Z
	xIacVr2BQJfjV60MzVYIzz7LCR0/wYHAA/d1Q+1K4RzQ3lPPrl88AqtQq6FRD6xg+zBF9TqixME
	6vkWb4mrB1S+lgW4dIKHgUbbooHJqxRhyY1LOR1TMPta+XzMzMAfvYc8T1nVHhCFw
X-Gm-Gg: Acq92OGPznLyljOIKHWaLiw2gMSXeSQSURtajlX5ELuKbUByLCQ750jtdEUen/OOV6I
	o/xeUyC1QfhTKdg0UdWkUZkElKz4N42kLBJkLveyWEx1D3YN287kxHtpYRLLyVcXmjODTl3fyB6
	PlU/siiAMzG2kS9sR+2kasuSWnildeQgPYYdQ7hQU4qQ4CDu4fF3FClg05oOm19MRKfRc+BJpHJ
	UVl1iBTLfs3uuKvoqum7ill6HKbIoRGVcmTtEB07urUZ1F09s18tU+VOgeibSNSy0chxnaZrXho
	MSDn5U7K4+VyTb6dq6a6WSYBosl+EStnxKqSn+21U2ApiBdnMszFfY/JguYOTjvH+CljVYWZmTc
	sZt//oBWPHlkfAuh4wWUiyJnAZkjUbsGQqRX9aos/eiC7nYAgcw==
X-Received: by 2002:a05:622a:1b90:b0:50f:ba44:ce5f with SMTP id d75a77b69052e-5165a059af7mr198117301cf.22.1779100483691;
        Mon, 18 May 2026 03:34:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1b90:b0:50f:ba44:ce5f with SMTP id d75a77b69052e-5165a059af7mr198116941cf.22.1779100483243;
        Mon, 18 May 2026 03:34:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm35654171f8f.5.2026.05.18.03.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:34:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: nord: add defines for the USB2 PHY reset
Date: Mon, 18 May 2026 12:34:31 +0200
Message-Id: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADfrCmoC/32NTQ6CMBCFr0Jm7ZC2BKKuvIdh0Z+pNALFjhAJ4
 e5WDuDmJd9L3vc2YEqBGK7FBomWwCGOGdSpANvp8UEYXGZQQjWilhWOMTm0/RNnNgqnbsWKGuG
 NsJV0EvJuSuTD53De28xd4HdM63GxyF/7z7ZIFHgm7a1RrpbqcovM5WvWvY3DUOaAdt/3L45Gx
 dS5AAAA
X-Change-ID: 20260513-nord-clk-usb2-phy-3e60fb0c31d1
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=927;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u8v8CNSfX49ylyxzKrYVQag0107VfDC8fMtgShe9hkk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCus7TwWaBT0ofaGoWaOHpLesP1f3TPV0zgwDO
 y5fCRTeSzyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagrrOwAKCRAFnS7L/zaE
 w7noD/4rz5WbbBWapkqcAYFdjgbnoSECtjcwNw0NRfeEsLn96Prwq2nO3nYA6QsLyjHaBJHCZJK
 BqZcB6PF+p8WKOrZshe+FFAn/tC0CLQ1JcLV04eaaUIIlPLC6NFzanNVszVF3nFIMw58pCrjEQ0
 1XlxW2T0gXfbrdaAMzeNnsLomc5EQ/OvOLKn6/Uld776KH0C3pcRQ0ge2kETpmfgJmAMM6XxtEb
 Xk2QZADyzUCJz3ChE9dGQG6jnAy97ECRNfq6UrPrpGHPbLdXXHz5iEWOchhqiKGU8rnrVMBxAup
 JnIm0Q6yyrYTMXrghjltXhWwX18CBGp6NrseMVxo2qND3rq84j24nggB/WzCqqPp9TSBICIDqRy
 MdUbA9u4zZz8scG74M+zy8epDmBN4tkX2LbNPgd4QBiiU7C5ZFAno1jh2YKUhrjTc2W1JcASief
 IGM1dUkQzItv6R6UGz+AY2ZLQKXAHjEisnb7/8OEjJ06dKwOMrVXoe9l209VptHYoSmkV6my1Tw
 TlIz4XU7FePSlOBlUqNBjm4Dupj0FVHtOVoO99ZM58AJ8vAW1190wPqr0xy4y2/UxsVcNYHTSKb
 xyBYvpBnKsAJJPh3IDrstEwkWjD4fxuc9FN9jaL9TIg2sp+656DTTWCaO1WVExeGTMl3VjECYLW
 6u60w3pQjVHFsFw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMSBTYWx0ZWRfX4Vf04FRzWi+q
 tSmjMjzZiz3yB14JWZPOOMq8BLRaJJhkuQgTmFqZ+HzvYJueqSyglLSBdPGEKXix0y1N9/yCx5v
 err2J/1U2D3HadTxxjMLO/S6xBKRczgnlppMYDW7zjEGmb8t+4CoLGedfZAS1r1UjIhYNfApIYA
 eAU3lTeWmKS/xsDlVLadrYIdNH6agHtnwP4+tDmrTIdreBD04RaIe+rQon0TW7Ohb06qk2J3itZ
 fYn0WfDc3fJsC9DjMAKZsbMJWYfVNEjv0fEuMavWY0jkbALz7e5fdVeHAea2sJpJ0A85z4grovy
 7gfTQqL9IZSQ8aB1T2MVi9+zlg+8FB0M7Wfo6bwAhABEhjcByp015nvHz/NVrYzgBW6YOmFq5uC
 j/i5IjQKHfp0Z/dm2Fz+py+R8G/508q2MtWHG2vE/9a1lIVwG0ARZeWXxp0T/K/le3sas6OA6oB
 e4FEA4WDl+0FWCGdBiQ==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0aeb44 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=BGJgbtQK9DYxViS1Zj0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: fjdrIRsPs-dEG_ohdt6SenQK267AEWH9
X-Proofpoint-ORIG-GUID: fjdrIRsPs-dEG_ohdt6SenQK267AEWH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180101

Update the bindings and driver code with the definition for the USB2 PHY
reset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Fix the name: QUSB2PHY not QUSB3PHY
- This is not a fix but a new feature so drop the Fixes tag and rephrase
  the commit messages
- Link to v1: https://patch.msgid.link/20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      dt-bindings: clock: qcom: add the definition for the USB2 PHY reset
      clk: qcom: nord: negcc: add support for the USB2 PHY reset

 drivers/clk/qcom/negcc-nord.c               | 1 +
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-nord-clk-usb2-phy-3e60fb0c31d1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

