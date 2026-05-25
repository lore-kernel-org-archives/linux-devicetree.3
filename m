Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D8735FF58
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690018; cv=none; b=WhRFEkbWANQ1NHTwCc0i4NZZ1Po8ChbCliegu5YJXLA0zsTMeJgeg95QegeRZf4kZ7DKVxx15zc3GX6Tu4QW2umYh+G5+zgf/6sBw8jjMtqrbCipaP9kvEDVnNnnnGZ3MMkTqi/yIsxOnGS52uA6edLTi0khanM3O4eqWki+3Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690018; c=relaxed/simple;
	bh=960m/9Z4WWieVtPzeUUrnPor92ad2oqAsT2Mj7D2XZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B32rMmT048Ii1eotshLy6rsJ8K3ZtKUsBq32zf+GdgVFaqqO60U23WovoQWTmwmGKT9eX2T6Mw7yESt73UwKdf/8l1qBfqrJIrQLLFKMwAbU0A6LzUgvrc69IcpIoE5y6J8pPiz5vOQIRGk+yVDkbEejxbh5gFqkHgQiaitg5XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHLv35Kh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isx8k18J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHLv35Kh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="isx8k18J"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ONShcm2024296
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s41+5WfvaShROC2zOmEnUf
	H0d3wfCy6LO58hVmGT8XM=; b=RHLv35Kh1vzxIRgkpWf3Uw+yWk/5fNU0jve7hr
	ay6Sei9Yhm4MpNZ89O/j3XhuXFizncZmEczn9mV8nFMW/ye14338NmIw2tl+NlMK
	9FvU1E/RsxGQ8E7hvLFFnU6wwPSbdOIm3N0sf830QY7eoYKCoiJW0P11eSLhK02K
	Fe3aI902XEgytIRn1ElhQQyQS7JNyYGA6V2qXyNxRgF+ZEwcsFxxXL6RzRTvmjWI
	d9QGmNchdnzf7PJqn2QvktdAeM1YMPvg/veg4L57hFAAd0xsVgIs3lLq5+EJva1G
	Idv2Dnf0461fWrM3jVOcdcq19vDbMU+TbdICfI7PlA8ClZzw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0vf4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:20:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8292e18166so4477095a12.3
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 23:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690016; x=1780294816; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s41+5WfvaShROC2zOmEnUfH0d3wfCy6LO58hVmGT8XM=;
        b=isx8k18Jhgzs5lGA9XjZI6XK2Dt/LoObpD0EaFnP8tmNandng9ZbU/cxs56IO0kiwU
         qp8a/n+96JVLXi52PbsBMuTeRpJ6zMseIYfKhOxYN2pBG0YMN4AVNna1SYgDnkFhzdDU
         KNgRzdfO8f5NgVtN2wlUtdFRHw++HI9Ok0BzvQqF0xG/q+uYHFL/v4vKW2KBk22Qx7QC
         XrfOlEdoLJZM/+5eA9L/82QBljoo9OE7o6GGnds+AXRTS8A6QFtHL0lUl8mOcVA/uzu4
         nGXtVz2Kupt0/FRKHrriMBZXlaOT0gBbfLnZbffBmY/EApuQI8IUOz9R3DPkA3JDVZFH
         4jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690016; x=1780294816;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s41+5WfvaShROC2zOmEnUfH0d3wfCy6LO58hVmGT8XM=;
        b=souF02O1LL9+TVxpnoRvmVBMZipGOVZD3lQkqbgamXEKb7shg8t+1wp8CHaffM9ZdL
         G+C+dF7kx+5ODXoBFv57XEE2nJsbVTQujhisn+OpdJYxZjrRKhIS/XH+8qGjnFf7jwkZ
         vUMfy1iEjzgibMkhNkKu5iAyR2loBfxAgcf7v0k4lPbKMawqCrilluDI2jzAd/63rKBp
         qNdIT8BWOWXI10dNVMeRn5VkOPsGbXnqikefcxfzrB/oG9kOlNZO8Fy79dNQ35pAXNLr
         Ob0k3mg8uHbEi7+8Oj/WDmmOI3VaLSbDptFu8NWWeZsth2aoT1XkT/vHe4nioV76wsE5
         thDg==
X-Forwarded-Encrypted: i=1; AFNElJ+ktZS9/hQ6RPJ7MGXaeSzoM5Q7gksyJqCvQ02RIcVXIWc8I1oEEltt0loj6L/+p1VR5HsO4FkFPEX8@vger.kernel.org
X-Gm-Message-State: AOJu0YzG3L/W80f+52VpYdnskCVbsoi1slgoIOD5VKJ3HaXibQuk7RVE
	IO5/H2r63MWpWmyJMF+YJbEAykESXDgA1BWmo2STwCSDQG4cS6ZelUTPCTfKLWDVaJpD7YHpLMV
	CwOtt9NTaJgIpa9ZZ3JPQUG+JgBCbvWaDzf9bglc9Hi1PlIn8Dyz3ByVdpJ+m8Vidafev98FSG7
	0=
X-Gm-Gg: Acq92OEhCIp22V0SH+ZZ1WYLw/0BHcXkpgRz1TdnzEN+AOiEu6BmT77ZCdO3FeGSehN
	H0m+Avuyh3b+5NcKrQTNnz7y12XfkiWdk6GOrZut5afEoQxN/pumtL6UxjLDNC8aEe1PIFWHcCy
	2wvzodXzOUIUctXo7u4PjIzlb/uPJsa3U/MKaBzvm1naAMLfSvKoT2WZ594EkJ80dTtLY6dAATM
	5JTuLVklJxEkRW0gRteYiO48Qz6qXg2MzDTgCcaIIYHT5BVPktEd7NN7HG6I9If4kyMI+46ghGP
	7m4FKtDvN+dA+zSvBOanEixg+OJxnfzJCOSNTUzFVvPSwlMKmfLViDKipuSqSvB7BQsmtJzCNmZ
	pdWDPAV8Z+Ih2wiRXyEMenCUAd1uI9wQZO6BNJ/8sq8a+Vt+ZWv5xgERo0uj8iaY92mwjk82t4Z
	xSkr2VnpOo7OfkxmI=
X-Received: by 2002:a05:6a00:180a:b0:835:405a:7e72 with SMTP id d2e1a72fcca58-8415f141d5fmr12115774b3a.11.1779690016254;
        Sun, 24 May 2026 23:20:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:180a:b0:835:405a:7e72 with SMTP id d2e1a72fcca58-8415f141d5fmr12115749b3a.11.1779690015759;
        Sun, 24 May 2026 23:20:15 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fafe14sm10040849b3a.42.2026.05.24.23.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:20:15 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:19:53 +0800
Subject: [PATCH] dt-bindings: interconnect: qcom-bwmon: Add Maili cpu-bwmon
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-bwmon-v1-1-b8f6e189c3e3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAnqE2oC/y3NTQ6DIBCG4asY1iVBQSpepXExDENlAbZgfxLj3
 Utrl2/yzDcbK5QDFTY2G8v0DCUsqUZ7ahjOkK7Eg6vNOtFp0bcdt6+4JE5olfQOtETDqr1l8uH
 927lMtS0U4jZDwvl7HaGslP8w0/1R/6yHPiguMYZ1bPpeaKGcRmMNeRyc0AN4b5RDKVptFJzBO
 yI27fsHveV/KrwAAAA=
X-Change-ID: 20260512-bwmon-ecb43fda63c9
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779690012; l=1281;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=960m/9Z4WWieVtPzeUUrnPor92ad2oqAsT2Mj7D2XZM=;
 b=E9P/oZH7elw6QqgFN5c/EhP+hAaIcUIKw9DSGy9l00gqmNjMDFLyuMb9eZg9sStH+Q1D7wk6g
 FwQX7VttMJ0ArIM9iz0fUPW9YMbX5hEbL/hb0tUg62LKW9kOoI12IZ9
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: SMjbtjSakZI4EU-oJ5fMMXosCjkD1fsJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MCBTYWx0ZWRfX3OWDMVlPuNbE
 PZ3RgLL60wwhJSzw3fypwbtFbsmjUR3ZidoDDspkFsUub3/cf+CJuUww4C0QiF+dDtGarJjEztL
 wJ10olA9TN1yINCjNJVMp3Bd/x/1gMsBFzZdRm1FlZV+Wf1jpVtKxEAF9pKW9tHJKxRm4hkdRhA
 e4pNtygmfTzyX7iYU156/zUWSYHk317djeeB85FScan0XRSsiCCiFU4gI4uuSN+iIVR9wFUdIZj
 ZPkyCpewGM0jf7Xz4RJvppsHXQQfZabYDLiOi8EB3AwIiQzDA31/W+FdrNPswevYY75un8pLQ+i
 WgSBlxa/pLZ2TN2VTgsZR1BPmWBCMuCGWcM4cBAo8qlr5Zv6tFggECgaPfUlOO8f9I8PODzGsXQ
 fh8/hOv2kfbzAClj5tLTRYuA5ktg1i64+LKwqtUlujEB4RR8fU+hiooNdJPpbVaRrI9ZjrVtdDg
 hRsveN4YyuJG2zucPXw==
X-Proofpoint-GUID: SMjbtjSakZI4EU-oJ5fMMXosCjkD1fsJ
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a13ea20 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=axenEgmuRSwQYXswx6EA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250060

Add the Qualcomm Maili SoC compatible string for the CPU bandwidth
monitor (BWMONv4). This falls back to the sdm845-bwmon compatible,
consistent with the existing pattern used by other recent SoCs such as
sm8750 and kaanapali.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index 82b1d94d3010..7989db1aa774 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,glymur-cpu-bwmon
               - qcom,hawi-cpu-bwmon
               - qcom,kaanapali-cpu-bwmon
+              - qcom,maili-cpu-bwmon
               - qcom,qcm2290-cpu-bwmon
               - qcom,qcs615-cpu-bwmon
               - qcom,qcs8300-cpu-bwmon

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260512-bwmon-ecb43fda63c9

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>

