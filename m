Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6473B2F691D
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298447; cv=none; b=WEsApMJ8mDNdd+B8H3RYYW7l+LKaDDtFHBxPyBJuRXQk1iMd0IMR0vdsBlXk4PlB76DdJ1u2ja/8gmDiUOjL/doT3soJSNYetQFqJw5WJofCMncga48BqBGaJUUIxlDH0LVrLTZbCQLciQLkxA7cam8eWShaBkRqT/Yv2zqjW3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298447; c=relaxed/simple;
	bh=bP6HA6pZjm7hEbY5JnHa5ksDdA+WtVqVV3UGDdamgPQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mR72iBgHzae490p+heVXiWKVOfGltaeVyzP9a2sGuWsGQw/O7hX57ernZ3hjXST+DXiBnNfWq3HDean4Jd7T6V3twGWQpYedk8Zb/0iOW/YT8ojxifaYtQvVjCkYW6kroCU2O/DTtZjgvTu1/dw1EGyZHoxlIq43gz3scmCe2kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDofzOO4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U6HX0qwO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDofzOO4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U6HX0qwO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RB72B21237202
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e+qIoID6Yg+3aC2B7pB4TK
	5iyob/h1HJrqolQGz2E9U=; b=gDofzOO4I8TAtexZFG8UXhv9/zU/JniCYKUtYn
	vzGfjO8i2ThDssKjDIPSCX5J6b4Si6UrGgefdw4u/iliYq7x9S0d5tNnIh1hcIkM
	XAjU5Pe8+FnUSyzOn0DmzPaM7bg6FdPt9NqW1eJ/aXng2owDtCLkyN+icVZ5N/Vm
	FZcUeyuewHSbouCdrxZEz8BG76/riFZvRdg0W0DgSCV2tenjfwDY6D4QeLdxxDOr
	bey5Dg4+fzRPAJKtjYzMTQYlWpbKiAbptL+33CD5Y+bS0yhNmuuqdbyTYRHNY//d
	ylXVmeWGTxjyetxRp2mmbmzaGcAcjzN7+9avrvYuzyZDUqoA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt6n4gjwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:00:44 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-956995b87e6so8712758241.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 07:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777298444; x=1777903244; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e+qIoID6Yg+3aC2B7pB4TK5iyob/h1HJrqolQGz2E9U=;
        b=U6HX0qwO1f6gyrsNHVhxwrH4/9bz8LgTGatI+2d5PgbMQHcBJN3t1jwIdFf5Q3lNkn
         +voXcVF1iajf0daiVSDJ6FvGHxcbKqHWuujLS64UAhKU96vQcJhACm6uLxunYwUxhpLI
         hrwq4Z2DvAYXp1ANgpylDThBvQ6Ia2NTatvjtcH72D6B0aaSKr+OdbhLgtTsfDs4uXED
         vSqxsM6U6C9XdnddkiQ/lzSaYYJJM4+HyhbU9tSdLJVV6pNfgpmzjK8E3D85dzx2MSGJ
         d8/XOuQlEc07YNY9j2IIjFwMdjEvzzCtTzeB3jaznno2cWQ8qPjdFUM/oo5Vhsi5JPuB
         a39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298444; x=1777903244;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+qIoID6Yg+3aC2B7pB4TK5iyob/h1HJrqolQGz2E9U=;
        b=dClwYCXsmNloHDp0l2KTH8qFaM28isyVuZRNevtDvVG7o01plIqF4DRz+nEXQxuYdO
         5uBj255IsPfcMIzh6fZTSfquLwGar1JIYa2WMaHGVDwLbkd+0MUJ6YQERWEQLeYMe7he
         oNcQfUvT5LDLyjGjmVVzGN9YGIW+rivQImsv1oi9c9rtWlkzdUkykQNgg6E1loPdQPwQ
         Y2WRlRuvJa0dZ3DIrkX0D8y3GW+vyPhjCqhhKZH8VTEvTMX/pWrix0OweUbAJqqNes8m
         pAHQR41IOQVu98r+UdOtJG5CaBtpeirg4PGyYOiO7S3rm1jFDTpmPSabSl7AZHXMuQ8a
         JbGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Rw2alf87LrixlH190zAWFNQdhoRc5W+O/cjZrCSN1jxodS0z9K4hkAPlJWdtUs/D6CVJGrFZclF9+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvz3iSkviOfsTi759oCskTDftBuiAekYiRK/+Zi7Vq3O0fs28F
	bAlGHWl6grobHsYfbWmDGj2iP2g7m00j2FPsXrGS9vnKUI/9Oo7oLFT2+5VQT/v0jBoQuKzBe+p
	MjVzMNnq7HzRgvL1CdZq6yAXRzUHWnSU2EvyIcx1KtMNatmFh0o7j8JxAB9wBofAT
X-Gm-Gg: AeBDieunwKRI/ju+mwAvDQLv9mBLFM8DFMTwxCDQGtfwMaze34zQbQPmKcPf8rOkBEi
	5Cm3H3s7EqpAb/RbUYMwN/JrWfdUPCz0pemXJUvZcT6BDQlkQlXl+yIFiIcG9QsUOh8nS1ERXYf
	8rtZzKpsTKPlIt739QIk3PdcaQC/1j8ZCpD/E5qIi2wJYpxq0LIhm5NPhx7ZbJy+iLC9xRw1V0F
	XwvFi8/d2bhbJCNd51AoQIjPPL+3VD/kAYmvYDWGxGyLDXTUrGbnOm+CM4N2jziOq7RB/VkmvKL
	GlL3N27Od+g1KgYXGM0zCiV2C4gF05nPqimUxhjYz4YfdatHG7nCoUe9uvnaHgGGbfunYKGb0aX
	cCQSvmfbsuPwmSk6HU4KmJpEZna8lbI2Kc5AgVdKh6UrG8OFccOJQTnLLtbNRZg==
X-Received: by 2002:a05:6102:b10:b0:611:82b:a590 with SMTP id ada2fe7eead31-616f73f6ee1mr21753640137.25.1777298443184;
        Mon, 27 Apr 2026 07:00:43 -0700 (PDT)
X-Received: by 2002:a05:6102:b10:b0:611:82b:a590 with SMTP id ada2fe7eead31-616f73f6ee1mr21753575137.25.1777298442558;
        Mon, 27 Apr 2026 07:00:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:85d0:5328:3f13:c3e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc558f2sm626849135e9.1.2026.04.27.07.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:00:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: add support for the TLMM controller
 on Nord platforms
Date: Mon, 27 Apr 2026 16:00:28 +0200
Message-Id: <20260427-nord-tlmm-v2-0-ade8e0f3d803@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPxr72kC/22MwQ7CIBAFf6XZszRbRIqe/A/TQ6XUblKgQiWah
 n8Xe/byknmZzAbRBDIRLtUGwSSK5F0BfqhAT717GEZDYeDIJQo8MufDwNbZWnY/qVadJWqjJRR
 /CWak9966dYUniqsPnz2dmt/7r5IahkwoKUaBqFvEq4+xfr76WXtr6zLQ5Zy/bOd6sqkAAAA=
X-Change-ID: 20260403-nord-tlmm-b5878960cec6
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bP6HA6pZjm7hEbY5JnHa5ksDdA+WtVqVV3UGDdamgPQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp72wBv1/nO6x/9nLQf3pM5oeNQ1lnuKL1EZSMA
 RJ1XvrHqFeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae9sAQAKCRAFnS7L/zaE
 w1M3EACON20QyLwDiCoNEIMTZZVSwoXpmGSDFS4F949jGpccdICoTjVZLof23FFgmfG5U7OGZq9
 aZxhIcKe4eck97XE7sc+urLbgjbXLapWv1Wm0E2D18hpHJcRcfFW1/7BQdRyfwcpfbUJ2egRgjA
 jt4VxooIw6MGU9yIBwPWx09kfC63R1jvE4VkEBw3D+Y9sWcHHxbBSws7SDz+gM5+xMnms4dHJRl
 dZRDntz795lNy/0G4RRYpUEFMn90dAHhq1A6mqRAfZkE+P39PNUnZoKQ+06RrunmedmynTfXBcg
 +zTUekOyJ4jAQ7bVqjOys/2YJzyihVo978XZ2g52JQloO60pNLw4C0pmeUnF6DEsvFqOGfwvmzc
 Gv6B4r9Bn8k6KOwEPH1D+fJDQhn86b98nWdcJ6D/kO2Oe4ITDIKePPtNlFeFqAbcpTE1Z3foVmO
 l8lfCemf7Hh4hQGW3aZ/NW7HGhXy57QJMvYclpnNSYJX/aZ+6iUwprC7eCP7NP7W5TcPSgD6gXA
 6Ekir5wf5gbkl4AoQWxuyNOWFwPMLWaUobbl5MPe7h67CN5CaY+X0gMzCHF3KNUELE91/KiF9sP
 eT4sos/jzfrQvjyAVX9g5ILPuh4mNIx9bVekKOOeYMRftpgi2M/YoO6uv2SlUC9ZtUnJvP2XA9x
 BN9CTFbIhVRgaDw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: AESyJwp164nZHbWuivNUe1LNn-y63-Fi
X-Authority-Analysis: v=2.4 cv=Xba5Co55 c=1 sm=1 tr=0 ts=69ef6c0c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=qGPvtIwEQInV9_J8vEUA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: AESyJwp164nZHbWuivNUe1LNn-y63-Fi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0OSBTYWx0ZWRfX9owpIVsFhket
 QI8rYKKLUlq5fZOUYTv01ivrwn44f8Im9REX/uqhQtC8JWfMZfOQx4AxZo8k3saOjBoMZKIfWfv
 U51YNTUNAco8kKMivemGW5iD0DTDvL6wlLXy0tjaYobapaq1yUpLfXVyrzAoO5UJ0j3rUGX9SIn
 xbCVTxttafaQUe7gTp5jJSO2zZhK5gi8uyM/6pizAYPb4v0frd1Ew9/djIh0dm5xvT9iAzsZH/6
 GC3cNEwnzXXpYlub694mu3ZVkKv71wpQnF3OkyCKUIXmRIIq9w1UEAgpZnBrx+4ZomWpYt0wM56
 WyMLLQyeEf9PJZo7cCKEsdpbK3OaFL6Mdn05ETwYvf29kVAh9YWERbC0Mdxf35+zuomU/ZNQtKI
 OIunA6gks4Du611L4K5kPOdoU+xfoaLZ888gHwjJ3WGEoAOfsKAsloDMAG92iumaRt+7YDTYnln
 sCuevOAJotgcKNCdwMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270149

This adds DT bindings describing the TLMM controller on Qualcomm Nord
platforms and implements the pinctrl driver.

More info on the platform here:
    https://lore.kernel.org/all/20260427003531.229671-1-shengchao.guo@oss.qualcomm.com/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Order Kconfig entries alphabetically
- Fix the regex for the pin state pattern
- Fix maxItems for gpio-line-names
- Drop unneeded line break from bindings
- Rework the pin function naming to make resulting state entries in
  devicetree more concise (drop the line number suffix)
- drop .intr_target_reg from PINGROUP()
- fix values for interrupt entries in PINGROUP()
- drop unused SDC_QDSD_PINGROUP() and QUP_I3C()
- drop the arm64 defconfig updates from series
- rebased on top of v7.1-rc1
- Link to v1: https://patch.msgid.link/20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      dt-bindings: pinctrl: describe the Qualcomm nord-tlmm
      pinctrl: qcom: add the TLMM driver for the Nord platforms

 .../bindings/pinctrl/qcom,nord-tlmm.yaml           |  184 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |    7 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-nord.c                | 2843 ++++++++++++++++++++
 4 files changed, 3035 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260403-nord-tlmm-b5878960cec6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

