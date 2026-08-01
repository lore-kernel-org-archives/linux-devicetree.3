Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC2C4334B9
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785578424; cv=none; b=Q2zvA60I+Onxc68XYRQrrQpDIKcmIGQhHrdz4z3SUXPIhLmA11PoW/KauYTYnKyTODnAdbPsCnPF8DVa5N1YdL/U+d+gFHoxDWPgAJu7hxVebYQrLhHgKUcxrryaK3y1JgqtuYCCZKJtVNyDcCuYeasf+TCkTFRbpky8k4pLT4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785578424; c=relaxed/simple;
	bh=XHpvZd6d5AyD8McowMcSqMy5z6h+JROiB5OxZUHHvsA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fHfgrNpXf3wd5AXU/pjXYLFH4jYNLltFdtYh6JQEWezMkzXF9R3RP10ZT9QnJrFGumAKS+O/QOTe3U0JBh+Uef+UpyrX6OF5fYzTr7TMA4RJM31Rl6Glnm8VYDLzkXcnJVag8n3XwMnrJq9OPgHn73YEok0DGDH220yiuXUmDU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGxX68O2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dMCV7Maz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGxX68O2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dMCV7Maz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6714dZFh1417012
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 10:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IRJQl2ImEHe6DksJMQhFEB
	G//3HW2i/YdpyOi+8N7Pg=; b=RGxX68O27EsAtl7+2ZGC00Sbo5dVwqPSNyGSVz
	IyUJuyjmD0DXmdf8oBtZVpvWU7T7pFCa7TYPP1gzg2oTpELZlAd89mW+7JPGnnQ3
	o13FfoJ5feA+KJwyxNgRK24p9hKL3l44y4w/lDmDZmrZ5QUW28clLnzKuYd8m9Pr
	DxGImt/VtMRAxETSuGHLut95Ok+2+i83ttdC1nKt0HGQ8avJm5000su7gO5474Yy
	QBMySm3KzK/8C6eJwrMAXyXMPbSv5LbX+C9mVJUwKs/PIss3YBmAkYCZPS6sI0cd
	5g+N6lLxolCuD9GD86QOwSt4q3HKiFXwpLChmEfwc3zP2oRQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9yggg4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 10:00:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso3403308a12.1
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 03:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785578422; x=1786183222; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IRJQl2ImEHe6DksJMQhFEBG//3HW2i/YdpyOi+8N7Pg=;
        b=dMCV7MazhngSktnpK/ScVfUGBbYxBAAcDb6tAiNGp9eptG4zGrGbj652uWdyIuRLb1
         5bkcFXbsG8TbLK26QSxEVLvwSZtk2JgZfWMN1B0ZqBORJ5TrtNQc9JgvRyZUeVCtGUSC
         tXPRPAJBEDvIqYGT97Bsy3wJtjQsadMX7NdnxcOUC8x7uzPSdwSTgaE+cWJwwuvyHHOv
         D+9BhMGoBCnde7moqpR/UsaEqNLLPAhFL4GuNhcET4/O+zvoMH6ikJ4yG6EDSXYg1Ug5
         ZlR/UJcAUT4NKcl53MuvRt4nCgNlkTesmYD/JHaOz5DXGZGkL0Yp4mg32/a2VN+2f5JI
         nXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785578422; x=1786183222;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IRJQl2ImEHe6DksJMQhFEBG//3HW2i/YdpyOi+8N7Pg=;
        b=ZRjeEzGqLLMXxbsRpQW46y6HF637nYZI1vqlFQDk2HrWM5C00GfEqkWrjwxmKf5Qcn
         qT3qCXyne56pPZGcsYY49prbWq6jeEl5wgpyBDxQ2pig5Hewna6vp/ZkaWU6pAu4mWjt
         a/fV2Lj4jAUfXGgolrf1WL9yHNiec7cGk3Oc8upAOQ62XeghTCPgwogs7xEJ2iQSZEn7
         Z0PU21dc6stHjOU86rR5r7yUWRgG5Sa3e9VBcISb7ZqBpAsYX60+q6jakz+gqqUfr7Om
         lbz2gn/s/zfz/67bnLb3BVl314V6jg5rob0ij3YV9biNvsdsogPlrO4yXJulpoJvwmDE
         rQtw==
X-Forwarded-Encrypted: i=1; AHgh+Rqrsw2jwVsW1/djNt5bRP3dnwf9Z1H+xCgPP5Jr4tbhA4czoq0HDiBpE/M9x0sI9rwSWBsPHpB/0oNh@vger.kernel.org
X-Gm-Message-State: AOJu0YwIOwxpSX0TXqjEAqFPH310BETJko8a6ioZw6zsumxz+uw8bWO7
	JoycxXLRWUMxRMl4rCk0q9m2XIKBaki/8OOBVzpuZaszWJHEjEintfKCS4vMhggocd+ZafxRaSz
	jpftRCXnXiQjJ6rKW37yG5gLQ9EGynfUMTlfGAoh1BezZZ9j6xoH3Io8NGxwubv4r
X-Gm-Gg: AR+sD12cj7WIxQUejz8w3UZuKGfS1b+c6RYJ6U5DQZ3I1mfLVfw4KmX152/mIeq2Beh
	bAxObQlBVYZahLZVs4CtzpHOXiPjp2PdOV0HfMkFxhflebDoeK3EqsRPW9KnBqgVEEfgL5xiyr2
	dQ22Q1hBT8pUoz5Pn2NIRkiSokTgV2YwoYSpcdNAMCof0rj98CzJ6qLwnqGi8ku9N7q+af77bje
	8fOJvBsuXH9T8yoCFWwkQA+4PZlEWe/0ELskfCstYQzlYyzbgKDMCSAkmrA82V1DC5eAhxv5o3M
	UlQnfQxsrwbSMtkUVqEqQM1cJKbHHO6lfTbW3TvBrLW1xhRWuA7UdzbXDiyI8wqvXrdqHi6/+o7
	Zr+oU44qswSxPx/zHdSiLsooN+iIUVXMxpdecG0IDjio8RXJx4U/C9t7OIibJ3j0v
X-Received: by 2002:a05:6a21:6f15:b0:3c4:1493:6822 with SMTP id adf61e73a8af0-3c92a59aca9mr3046473637.18.1785578420904;
        Sat, 01 Aug 2026 03:00:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f15:b0:3c4:1493:6822 with SMTP id adf61e73a8af0-3c92a59aca9mr3046428637.18.1785578420473;
        Sat, 01 Aug 2026 03:00:20 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04506csm16290600eec.17.2026.08.01.03.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 03:00:19 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v5 0/5] arm64: dts: qcom: Add Kalambo SoC and CRD
Date: Sat, 01 Aug 2026 03:00:15 -0700
Message-Id: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/DbWoC/3XMwY7CIBDG8VcxnBcDA7TU077HxsMA05WsFYXdR
 mP67qKJSWPXyyT/Sb7flRXKkQrbrK4s0xhLTIca5mPF/A4P38RjqM1AQCNaabjT/Af3OLjEfQ7
 cNp0EFMq5AKyOjpn6eH6AX9vau1h+U748/FHev0/KvlKj5IKjFE3nDEJr2s9Uyvr0h3ufhmFdD
 7uLI8wUgIUCVVEQNIbgJfrujaLmSrtQVFXAgBU9eiJPbxQ9U5RYKLoqpI3trRNWSv2PMk3TDYD
 vkHGFAQAA
X-Change-ID: 20260715-b4-kalambo-crd-86912a03bbd2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785578419; l=2608;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=XHpvZd6d5AyD8McowMcSqMy5z6h+JROiB5OxZUHHvsA=;
 b=jnqFgS33PvR8x0J8tSJJqsw6n5ylJcEfF+KN5RntbdB2q9PUquKl2SSR4MPH/t/MhJd5DkVGy
 fUaWGgopgRZAHU2W30zIx5ulrWc9+6DQHC4Ec0z1d+nj/Pqs5du5FnS
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX7zgDfDuWconA
 gjrlcC7EEpEKm9WDe+QrUrTptZDXe2mi5Hraz2Wt4i+HKFFmeCWcJGOBQR0dkgsQ58Mq1dIcunF
 xvknbSpu9VSdgddQ/VlQquYNIFuCnH4=
X-Proofpoint-GUID: 2KT_b9VUrPshEomgW_bKNU_08C6ezosx
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6dc3b6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=lMHH7xqUNCQZAqxxBscA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 2KT_b9VUrPshEomgW_bKNU_08C6ezosx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX6IBnShQbufY5
 +dpSkPK7DMxy7n+nDIh6xljR9FOwL+sC1oGXt0SC50L8WQIPrGKeJcXsPWEgucQ3ekhHzWXsR7C
 iZyUD3nUNTXHEh6aZAn34g7z7RPgOYjkUnWRtoB3KHq6HEnI133VB7L1+4mVyHeDRxZJlAl0Dav
 tQzDoT2eIcssvl0aghEwHYkuggpO94hpFOAfwTmWPTHkohIom7TCXWo2E49LjbDdWGSFBL0E/CO
 qt/af1U9oBaooH37CORQdlqK+B89R2s9htd6iQuJ9Ln/pUScfRVL6zbXLeXVMj9H9FQeWnstYUz
 2Oz+T6hbjUXhN8fokBGFquH3eTef1b/+lGUK9hfyHFiLD5zqF/FRBC3BoAV8CiSHjf0jKERqrCE
 zqq5PHU9cFtd+aFcA8LL1TYhPzTYz7DUr1d4R/FcpapkxylmXcEuzrac6TtBD5Jfcd9CH6rMb3D
 7yRBD1JYm3LFwxC636g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010075

Qualcomm Kalambo SoC is derived from Mahua SoC with CPU cluster 0
removed,leaving only cluster 1 present.

This series documents the board compatibles and adds the SoC and
Compute Reference Device (CRD) device trees. It also adds the Kalambo
compatible to the UBWC configuration table and allowlists the Kalambo
CRD for QSEECOM to enable access to efivars.

---
Changes in v5:
- Split PDC ranges at 130, 147 and 171 to skip pins 134, 138, 156, 158,
  172, 181 and 202, which carry gp_irq_hvm inputs with nothing wired to
  them on Kalambo. Reported by Konrad.
- Reword the commit message to describe the PDC difference.
- Picked up R-b tags.
- Link to v4: https://patch.msgid.link/20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com

Changes in v4:
- Split PDC range <108 619 22> into <108 619 1> and <111 622 19> to skip
  unconnected pins 109 and 110 on Kalambo. All other PDC ranges match Glymur.
- Rebased on next-20260729.
- Link to v3: https://patch.msgid.link/20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com

Changes in v3:
- Delete and redefine the whole cpu-map via the /cpus label.
- pdp0_mbox: one reg entry per line and use '0x0' instead of '0'.
- Rebased on next-20260726.
- Picked up R-b tags.
- Link to v2: https://patch.msgid.link/20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com

Changes in v2:
- Fix the cpu-map and SCMI perf domain for the single cluster.
- Give the SCP shared-memory window its own IMEM section.
- Rebased on next-20260721.
- Picked up R-b tags.
- Link to v1: https://patch.msgid.link/20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com

---
Gopikrishna Garmidi (5):
      dt-bindings: arm: qcom: Document Kalambo SoC and board
      arm64: dts: qcom: Add Kalambo SoC
      arm64: dts: qcom: Add Kalambo CRD
      firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
      soc: qcom: ubwc: Add Kalambo UBWC config

 Documentation/devicetree/bindings/arm/qcom.yaml |   5 +
 arch/arm64/boot/dts/qcom/Makefile               |   1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi            |   4 +-
 arch/arm64/boot/dts/qcom/kalambo-crd.dts        |  21 +++++
 arch/arm64/boot/dts/qcom/kalambo.dtsi           | 119 ++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                |   1 +
 drivers/soc/qcom/ubwc_config.c                  |   1 +
 7 files changed, 150 insertions(+), 2 deletions(-)
---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260715-b4-kalambo-crd-86912a03bbd2

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

