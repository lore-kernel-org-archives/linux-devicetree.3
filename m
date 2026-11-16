Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800955;
	b=IpsYapdvEc5GjJu0wcUa76azsrmoKDWZLY7oRXNhkpyu0lllM7N9XNgCjoSXqf8r8bWr
	 i9xtwFr0Iuo8z33C1jTqTWDsIiAXxVeuyu9rFg4aI4q15KcMK2HP1G5qhKg5n2L0c3p5j
	 gzW7EOY9/nDYR91LG5D+Z7dyV6gyNTMjhDrok4f96q3149wMm49d2X1P49jkRHbOkXl8X
	 zdwkLlyZ7ZgPNhJfzFNOP4vxU1Rz53f4gdCN1WmMqxx2qH4jsZJqpD4jqXvNO51w7pO92
	 DEzLkRXPW2cG8tZwQBHD06Uaj8d0GkcqITsWDNYCvo1CHpDiZ0fkwzVMvMMFOnFvL0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AwSioBO3+sOu364AlPsy6bDKqo4iTTY21pTGV5k37u8=;
	b=JdLh7hTroNQFv0Z9ZGm5EG6BnTmpVJaHnxjcQ3qd38M+9NRdv2KjW+0ephuLgEMfXrRu
	 HHHQFyJBhxBhpR6WjtLoaBk19p/xfwDx7HwBFsB1WYq5OZ98xuskXpmPTIZu8WWDTHa+g
	 Va3r+xZg0mpcE/UPo4HXRF57XM4ed1fRvRGwXGOGM0IQqcwPevOOK5gsw6ZiF91iudKN9
	 yV3N4R21GHJ3q6/0ASc//jnSInERoSsFBLw9mVhifpYuHuEmWdxU5Iv3sN+HBWeaF2Cc1
	 7GtgkjRg0r3mwxuEjQBu+e/9cIKHK7jzg0Ihpf3mcmo84vY/L14rB6xl8GkaZQzaPBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QaT3JhQy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cVajG97L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5CC606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F5CC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QaT3JhQy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cVajG97L
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1Kso63321463
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AwSioBO3+sOu364AlPsy6b
	DKqo4iTTY21pTGV5k37u8=; b=QaT3JhQyXTHrlABiDF12wNxcb9ddBRRrWNi4fZ
	fHRXBjnXblW+VBf699jZWh2NJxGrw0MmBi+B8wNi7c0ws8bsHjOJEiajnPZLbwWQ
	IDOxA3y2qV2mn4KnDj2bnNrmhq5tCkMfPrVMv+0lqHBlvrFf/lug0Ws9eW0129BY
	sD0TE4gN5jd2m6FDD45tAFXza/9Iz7j4yqDi5bUDb8EmWlXVMMEiCZXal4vnS2Yt
	6AKCSutVmFh69aZOSaDHX2SDhn/wbtV6KpuuDV0zbY5F00CaXnsfgq3zrPBMT0d7
	wx+g46YyR+CzDn5lNleKQ9Z/LEobXOqYdfdgN5K/TULrUoxg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhmhxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:49:08 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-5713cd0fb42so2456976b6e.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 19:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794800947; x=1795405747; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AwSioBO3+sOu364AlPsy6bDKqo4iTTY21pTGV5k37u8=;
        b=cVajG97LtNTW0prUYIMn/ys255K1pJm3rLqM12H9yKzQqt02C0YOE65HAvPQSWc+Fl
         2wuK8zLhuTjr226XRoRzfYrenl8vGn1lqfo3SGXKumazZNq2cTJ2H5/alsDbE1AgBISL
         zGL0fQ5S2zMxLCh2H2k21YqWSMF/dSipXAScovdBZnlVHDObnRNsVYlNLO/rO0//jpvj
         TyUZxYwa7fLEjNrqj7trwlF/AitXvPNGskxgYo15TWjb8bKu3aEojT88gtQbVbbpXFAp
         4Q8ERxvwlfX0JXUvjZTHyg7WJPlNVWeusb6ceB1dTjIUUJTPq2FoHYwDI5qgusqQtEst
         HgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794800947; x=1795405747;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AwSioBO3+sOu364AlPsy6bDKqo4iTTY21pTGV5k37u8=;
        b=JNA5goCWYnCMKJHqYXIpeCwLzYmqFbgbM6sePOqz6Y942bzjLvqg/RNSANSLtCk+Zj
         pzQVHMB+Q6aNUuZmsVjXtD5I5mK4XcVBcVoj3pNMV+QuHNC/WZuh244DuDT6tLRiybo2
         DkMNx0+Oui/41Pm7fDG3kmM8E47XSLB+wk/irbARDn1VeipdrDs7FP+5efzmyREINHhT
         bV8RTC0gkwoiuczMmk1TjH3tl5BS2ZRFoqItggPlvPVd7IYbKCruwFIKWV/uKcsuBr8u
         iw8SfFjrYhATh6P6n/RVwNW89S4JmTujpXSxhORn8Q7gZThMpzKXM9cOx1I3WfztwYLy
         AMjg==
X-Forwarded-Encrypted: i=1; AL+hErGPYHer7xs0sfF06526Q/BHbWajgAfKTIFpacj7YSIJyKmLEE5QqyoDzVRSjt4XpdGRNyeu6AAclXlI@vger.kernel.org
X-Gm-Message-State: APuU4Z+FZKpj44ORoGsdNZrc8zpIEf43kN05U3RV71XUJBHNclYh7xgG
	BkrivkPVK9mM6JwrIxr4fz0GQ52lez5YHSH6eGTCm+ySzONlnH8TC/ixOeSZaioQbF0oTRv/R8i
	TYyRjongE0EsSt6Ouy1a4+yH5ncUQMHw0s6pzBLiE/Zq/OrNgJS558EjOaaekkqYX
X-Gm-Gg: AYBFou0DDhWnLkiA0Ag4YVDV0vx5M76wh54pO/AaFT6Er48vUFOQgGcr9qoFulv3fDE
	KkhPqAvOjHpWpFNTqR1O23SY7kMM/+m4FFYVJxY95iR/HM0Cdz1Kh/K+i836yp60jEwWH0DWR1j
	Nr77iJTt/DEhA+0xgcXxvydyEhh3pC0m/BDk6mleB9cyU9M7+Ij8GPwFxstk2pq9iKazvzHvhrx
	2JxxqohDaZuseWCj2jB4ZcgznWJYEWBV05B9ew53efWAZS0vuAwy4GY1irYS3PaiBMF1rXma4Ly
	d+fcVmkPtHRQO5v4cnmKFdLxSyBkTK4eVMw9h7QGKwTH+kQOAVhb1PipiH3lQnLcR7X4wTLzilY
	pm//S4mYA8Yqhu/NjAyehmuCpnQtKqiAaW33a8k/Ltod6QRi+/HeOGt7BEUISx6eEt3w=
X-Received: by 2002:a05:6808:1304:b0:568:195a:3bb0 with SMTP id 5614622812f47-56cd81025f7mr8424116b6e.23.1794800947444;
        Sun, 15 Nov 2026 19:49:07 -0800 (PST)
X-Received: by 2002:a05:6808:1304:b0:568:195a:3bb0 with SMTP id 5614622812f47-56cd81025f7mr8424108b6e.23.1794800947038;
        Sun, 15 Nov 2026 19:49:07 -0800 (PST)
Received: from [172.17.0.1] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7024673csm8903234b6e.8.2026.11.15.19.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:49:06 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: glymur: Add ASUS Ascent QN10
Date: Sun, 15 Nov 2026 21:48:58 -0600
Message-Id: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NwQ6CMBBEf4Xs2ZJuNQqe/A/Doa2r1AiFLjQa0
 n+34M3LJC95M7MAU3DEcC4WCBQdO99nULsCbKv7Bwl3ywxKqiMi7sXYoxSqxgq1RTxUCFkdAt3
 de5u5Nj/m2TzJTmt3NVrHkw+f7Sfi6v1NRhRSkKyN0vpkraGLZy7HWb+s77oyBzQppS+U1KGzs
 QAAAA==
X-Change-ID: 20261113-qn10-29181ac11481
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=O21hWmF3JdxBvxYQdqKe0pInn2b0anFSnwH0bvKSzcs=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBq+n0xpa+l4miB9Ynnm+C0u7F5g+uCEFiffNX4T
 tU9TEWqvsGJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCavp9MRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcV99BAAp92sYWEGlxRLgGrMAGyEfrGMLjrC4w+PZtXvHMU
 s7o0tM8L3YE4czCgSObNQHXRnRBjxE7/hZ3gkToACaA0hPwtOzz7b1+JCnHkkS+ewcE9gUcMpYj
 LPo5PE41oNKcj1HQt8khDylArZeiUqgw8NFQPZA9pJZcNHnabls2KjoK7CCcZBk+a156JH7POe0
 oqSqn0GHikA78joC97xTMxeqoErYVUcbwian7shJDXLjsPLYv+vuPQ9bwolyi45uss4yrpKa2Ll
 Wasp25PmnOaRiT7CyJld2+nND0jMW2aqPcwyygLMq92bJttppAyUENxmJzI2a7d9Mj51X0YRTZS
 HMdzyC1vDydlJ4oq+KzTJtrGAuDA+DOLBiBp+mKOxCIeOb09hyxTXhZWQBOdp3/eX4a3Im+9qRg
 W5gx4u5eN/1qP+ykDkkXBUhFKY17eH/hWgfFgL5uTw+X3ONU+uVXr9KJrJp+2ZYcxP8njXm5FOL
 meHpH6pA+tbVrYR6pvcRGTeSF9JVauhXfwIPvtdomcbK7nST8ztCL8XpFYX+qXUGbTvTfgfrpcg
 3z7ABssEYmXnREOnvlNnfuw6RdTCzHL6Ue7xW+9JOxzL71iw+t2Z4pmqC/V74E/nMSvw4dUgOr3
 Z6TEer5b2L5+3e7juyFLhuKDIH64j2JP8t07fk2XbL/E=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: bduXVAnJkzUQ2rv7dlGEKfzlKJZjVb5c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfXzH/mqiQ6ymLx
 RiNfF9TFysTwystMZjTZUnqOrzkNVgOjaUVt9ZCZ1hxDCy6PzZyJpyZ5ik/8U6fvXatMqL54MlD
 vcD1jfg7DazbuHBydodaEg3AKyZKUXY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfX1cJGpvcDVvOF
 oAxohLYzRdNJiN+95YtpPomo8a2+7jRCoJ2nBVpYtp5U4t7/3vgQs5Q1IzIqyhKNiAWRx8JPePG
 pYBl+j2AW6LBUg0Prv6H3W/5zJ5aTShPLU853/HgfQGlGpP21NUgiI1du9/eI9gUMKLGFxsEFol
 ULJUYlMiyJsTgBlccO3vFyH6mU/YscUURSKUPX7bT1PVOfRLhq0qOvdWGEMiZtAdPG3Qw3GXtPt
 69Ee4WT8qqb7n7uXOxJaK3Wi9UttRAicYdExgV4qAwk5ZAXvX3cj+ZHT6nVobRvqprfbh7K0wSp
 eKCit7PPFptu/uaY5iJDRQxnL/tXgZuPJAAnmRD7K0S1uYhhgKCDB/8NiTLFc5iKTfrjS+xjqSF
 3ugN+25ECt8kEZZ19SMCAjTXUSmT3Edvw0nmxliEyO8Yce4iTKNpUcAN7W8penQvKrOIPrrzAkm
 KDE6VrNyuQOKJp1emfw==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afa7d34 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=ocDxE02YPJZ25pTkHFQA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: bduXVAnJkzUQ2rv7dlGEKfzlKJZjVb5c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160014

Introduce the ASUS Ascent QN10 compact desktop computer.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Changes in v2:
- Move the RPMH regulator override below the SOCCP remoteproc node.
- Sort the GMU and GPU node overrides by label.
- Drop the unused EC interrupt pinctrl state.
- Link to v1: https://patch.msgid.link/20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com

---
Bjorn Andersson (3):
      dt-bindings: arm: qcom: Add ASUS Ascent QN10
      arm64: dts: qcom: glymur: Add ASUS Ascent QN10
      firmware: qcom: Allow QSEECOM on ASUS Ascent QN10

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/glymur-asus-ascent-qn10.dts      | 664 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |   1 +
 4 files changed, 667 insertions(+)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261113-qn10-29181ac11481

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

