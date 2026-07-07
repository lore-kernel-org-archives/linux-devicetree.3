Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B649E37F73E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 05:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400849; cv=none; b=NOqp/tu/1caCWp9lZcdaQx4bnMSLZDE6HATQeZeKqyG9ELYML4jTyAcGuTEeshPPrLzgM5t2t93IgF0UJ7JIu5rtrYZyGe3SYuIkPKftAINbCJ+sRthdNRg/Tadnltb4vh9SExwlvZNBOsRqKZ5Xa4h5On3AlcL1DZ/27+OxAmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400849; c=relaxed/simple;
	bh=eqcCYKMryMGwlC9zaraKEy9MlKfs6kQJBp/plrMSrgg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hdYhIo2PHPErHKelJGMhv7r+xdu5hoF8IEvQRS2dWmQI4AXVDq6mzuzU9iMJTyTrylVoGl+a1B9V4IxQWKYmGDoeNEW9nMt7ifIZ5beATzlaMOD3GWTt1bjTl37MtR7uXHduCsIRJFPKgD5/hIh8QjAPFXsGC0oOXfMg0mL8HnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=buqbwuwD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwLu4GFn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="buqbwuwD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwLu4GFn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667495762498869
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 05:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vUvi04PvZe61cI/q7bqpiI
	6kNccx4dvVj6Inrik0xB8=; b=buqbwuwD1pz+XgszBJuhRfrPwWMdK+eO9ZRaFz
	8Vr9NBJ/BsRaw+i9VtpHha2co8Gd76uEq0+LLhmETwunv8+APDHuOPymU3itpgKi
	LC7bAXAy+mYaLBnywhRbcLsO8or8ZjFJ91fIvlnJT1kntaN514MnUfrLWcx3mL6r
	LxopOsshDNbrTMQDhvR/36/ty97OQBr5Uz/VD7LpyReyKG1o+N7nxVJd8+ByFNwh
	w9Yc2C51iY4aGaZf4tN5K6KYHWlx15izIiPkSwzfgDnx4PZ67RyFEz57kr4YHX3c
	Th20qUlyytlIr44N7iz3UIA7/yl92mAJ2e2YFPuShYyhx0bA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hscnmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:07:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845e3ede1f9so4386371b3a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 22:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400844; x=1784005644; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vUvi04PvZe61cI/q7bqpiI6kNccx4dvVj6Inrik0xB8=;
        b=VwLu4GFnlb9N6CDXezUw3nrZm/hW8vIhTk8V1sMxW9jQSzavC2ZYoO7wKaWoGcseqQ
         EXpNO1VI3cA8movbu1rUL15GZFqqEYDqwIA7gVEyTKhIsAvJdoN/F17BXcNk7XNMotIb
         nomZpxohpqqLuig9FIolJAbN51LnK/AUMqkp1MIvRsUqW5CwFVeXSYs+RYdeVwY9vF/e
         empAiQWn2zL4SQvYI6Z9hksV6ENQ/bN4cUdlCRrXJS+yzjD+NV9Xh4AdR8O+ihKUxM80
         +QBQvg80sXa5Qhygc9aUD3aqpTCYFN/EP7GmVk1cqFC1u2/F5BlGXbXe4Opj6OsO6MNn
         4qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400844; x=1784005644;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vUvi04PvZe61cI/q7bqpiI6kNccx4dvVj6Inrik0xB8=;
        b=fapgyaMGwywq97t4xKoEQXcRZjDttf7IgskqguQ68E8cIjTuJDfRpYQBkYMr09mjbr
         HmsvKuKCG/cUHU2vt9VE+RD2vXckIjAg7uFBEW/VJT244f8NT21+1WoHrB9ZKUCk7xtC
         t51UH80JRxNyAvrah2qhNk0Iw0G96Bncl2XZ2VthOIUVJTAQ7cauAviksSbhWLAFdVdM
         tsFuePQ0a+eq6ikVs5y+VZNk9NOztvPPNu39F523GPw2/EYZvTpTsy+5OL3f3364/cOX
         ryCbpJLnoA/HNFYh/6vvi7gCdHWWQ/3VraewzjnzJrcRkH4lvIwbQYnCIV4vltxlZrM2
         x/MA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6n1Zk4A1RZqiHqhcI8rjzTEn7LHbyr5d4TbdTyjaIKKpZQ1paOA7pa49s4UHeEeR0R59wV7mLkvUq@vger.kernel.org
X-Gm-Message-State: AOJu0YzLlrQUpKCwR1V7VEVhYZ9ugQ4VFkiXDebGOkKrKB1DJ8oIdj2y
	5/I6r8B+w05GLk3chzYII+GVwtvogCXUOpeHHP4eLlskdiVnGJxW0nFIGDXXtDgHd+YWRMzXIY9
	8CCdYhxN6Z/ufi0FKmA5UQ83L9/5WyVMUVuQpFBsCKoceaoUZeoM7lsCyjj6hIVlX
X-Gm-Gg: AfdE7cn+7nKM2vJJ0QqQ0GjIPyWDdjSZLunBEBSBEmIObVeWzLUdMgwR8d0UTDovB7U
	0yLXYCk3nOfu/xWtuOHNbrcpygadTzwM+gN92kY6lT2OFS/i+g8mqR7gtSwFxiKR1VIvanT0Kd4
	Twx2CXB5GvPu+bDyLE3njFQJQEZ70OOEIxBi5tsWSapz8Fp2HztLKJ6n/ZbX8BzItc6AaJ3Z0JX
	aJoC5mszw5175IsFJTy6JcvL7vSaDLEL9fwgcZSZiWjmVwIHCsaV2CI6eXs1rOOB67WE6xV95T6
	TdNTY2RNOB8SEbCKnQUJESIn+SJkzriIeoX99VNN7nY9uzZSvLLQlVuiFeQBYxdi8m8xLDSAdJ0
	TYZroD1iXNJDtq+Xz8p4SdDLNoY8UiCAvODOHw8PEdACwiSwexxylwno/rVhxs0viBYUh7ZY4H8
	70ouXK
X-Received: by 2002:a05:6a00:bd01:b0:83e:f228:b112 with SMTP id d2e1a72fcca58-84826d3e5f0mr3388098b3a.34.1783400844139;
        Mon, 06 Jul 2026 22:07:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd01:b0:83e:f228:b112 with SMTP id d2e1a72fcca58-84826d3e5f0mr3388073b3a.34.1783400843646;
        Mon, 06 Jul 2026 22:07:23 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162b59sm352300a12.16.2026.07.06.22.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:07:23 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable PMIC Glink nodes on Kaanapali
Date: Tue, 07 Jul 2026 10:37:16 +0530
Message-Id: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAISJTGoC/yXMQQqDMBBA0avIrDuQWmhoryJdjJOJnappSLQI4
 t1NdfkW/6+QJalkeFYrJPlp1m8ouF4q4DeFTlBdMdSmvhtrLPZEgSINinFUxm7Q0COzeHd7MHt
 LUNKYxOtybJvX6Ty3H+Hp/4Jt2wEOZJEmeAAAAA==
X-Change-ID: 20260707-kaanapali-pmic-glink-ccefd39ccf7a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783400840; l=761;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=eqcCYKMryMGwlC9zaraKEy9MlKfs6kQJBp/plrMSrgg=;
 b=XDlPi7cLYgtqwj+vt/NyIESfCAOtx2TYyQIO/IWZ74979X0MdGgA4G+8OIS4QuHAkt/yZIqYU
 3M5I++7Adt5BYLxkrL5Ksvdn6/LMNFO1Ri0zxXGWWUUBh2Keeo5X4L9
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: a4G0KImgManr67CuX8ltoRg-ke8oAVbz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0NSBTYWx0ZWRfX534ZyxySQdiX
 X4m7/sFT75JVjPXiXWfNLMIGeE8IHWlWfUDjezePfUN5naEF+i1q8TjuW1Lhjl6Hp56Zr1sOhUQ
 h45o4/RFFTAmo8SXlFs1hlHVZG0m3ir2+wae3bYUtUvK34KvoBEk75ZCLjEJliYDk7ueSYN0+BG
 yaBuBe7+Hwmug4FSkSzwCTqSqXf2WH39yBWImHEqw+RAjFzud0yQzLK+RuM14/hb+4/bsHLWSLu
 +I1/zAk1QzrnzBfiU4CfmxWsMYsLxkVK0rgNjl7n34ALceWQmqbicum+N6U5lCW/e2DuSzrrxZB
 4NsQwGk+davMzDLck6MctOZFbzbh7GFOS2c7sF2fyILJEgwVGvR9ptyaIL99uWxK0EdrMCZd2/S
 NMAzFcSyNo9ZmDjjtkuPfdFGXLT04Gc76Z7pVDfJODahKJCvWyE1IHU0ChEgZ3nHwQdXreIpiJg
 XfAf2gNWsjzQAyvJ7Dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0NSBTYWx0ZWRfX8Vp/ymKfDBjB
 HgD3K9Bc9/hVFoL5Hxe+Rpz2kEjg2tlNtoBMnPaNi+hmLbDSPoyKeIyLmiJBiEbbggFvU/1yMFL
 L7z6osuuYADb+FbN2Tb8WOBejHzaUDk=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c898e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LW0o7yOu68IG-RbqnHwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: a4G0KImgManr67CuX8ltoRg-ke8oAVbz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070045

This series enables PMIC Glink nodes on Kaanapali MTP and QRD platforms
for providing role-switch notifications to usb controller.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (2):
      arm64: dts: qcom: kaanapali-mtp: Add PMIC Glink node
      arm64: dts: qcom: kaanapali-qrd: Add PMIC Glink node

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 53 ++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 53 ++++++++++++++++++++++++++++--
 2 files changed, 102 insertions(+), 4 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260707-kaanapali-pmic-glink-ccefd39ccf7a

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

