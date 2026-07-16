Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358EE37CD33
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219365; cv=none; b=CmEbTySFzimnGIPobioR1ZodfWTzQ91blQezCB0OGCRp68n2jwO2hpsSXzihDkKBitiuso1F9BX5BlOBgpSTLNujm9DuW1l7LWIAZDv6DrIl3INddLiSskrOfa8LxrkRcP/J8JvZ4jsNLtC8g6QYoZ6YAuNT89HFJl9dm/3frtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219365; c=relaxed/simple;
	bh=tSy+31NSf4ZPs/L7gY8LgjvC8hOcW3PXCsaALkCykCo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UNlHSluKOuLlF895iSDvV0d3viUXXL0hb5mkplZ98UKV33sNQ9pNcMjVl9PYYZspiD6r1r65I/LoXvqZLvy89rX8prBNJ5KhRjAghcxwlyDekF7n5YtBXMg+6q/YaMKafjgATzLXIJgjeNX76akBjRS69gW4yUL0zClRZDk/VS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVqGDz3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNyXWNGp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVqGDz3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNyXWNGp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSgKW3154865
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XYh6d77eEjRpERjmohISLm
	pXcEE9l0SU4Ey4ZbTQqLg=; b=eVqGDz3IOGSGdh20WxhhKPzoifFYjd0zRbRNFp
	/mdTm6ioFxPyJCH1NYtN04NQPmkCnJAv/AEmEgQF4ffWFE2zPtW/tml553QWCkFN
	OOtRjeSY0IzHeWEUb51x7vN87/RLruJDU6dkr+KIF0CAZy92BK0R+R25bSlwSb79
	a6Na3/bc3vjUEOctRsd92ZtrAJk7ybNX7pPjFhaexyC8GmD09peaQ3GXn5/CpeKW
	wUSKILOx/yR+7YAwwnVFTamWryLDV3ZkZ5vQmMt6BnjOby5KTS2lwgvW6chUV5U3
	9/mzGGNPjIoun++dOXF0gR99CmcjJ4phGxk14mzbf6uv8uUQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1we89qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:29:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so12807335ad.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784219362; x=1784824162; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XYh6d77eEjRpERjmohISLmpXcEE9l0SU4Ey4ZbTQqLg=;
        b=PNyXWNGpALe4X++IJ2jE9pC9lM1ai2iTfQslXqxtYPC9ZVxAgC2TlabIOPNmy0zURx
         HP+sgHbIg/qoH1MHH/bmzPEiCV06mDRgoAzXsrciBvc2f4Ca9N2JtxQI6W/+cmI8Hs7i
         2JjmWxg2wWa62I/wnZF9OCwqCm1oLyttxdFRE2ejIV98SFQrmdvPFGznEZp49asIaTln
         lHLmXzyCEsNW37uetAibfN5sMUH0c6X3CMO8BVIY0Sgx8+m29WeNhFf5rpdmZF3ygbnC
         DFFi/9ZyRMsKUHX4w9UXticK3dHcEhBTKVqm8gBtJq5y2OIK+uRm4mC+993YkarzxPjY
         r1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219362; x=1784824162;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XYh6d77eEjRpERjmohISLmpXcEE9l0SU4Ey4ZbTQqLg=;
        b=S9EWldMD2dDUiNN/UUxkPUjjTCF8ePCtNTUumpjGfL0pgWR1b1mD7JY/MFhEsqwKqA
         tRQvQbmRrZ0wSnmgAITEyUjbzEVakJIRfcGq2DjP/gHBdg/SppWmX5Sr28ZW9mVp2+mz
         YikHvCPwUlQbUmkGYiDcLoH+MSXg5+Xi+t+jXJfb56KRcW0h4HEm2etii42ZJ3NUxgd8
         PFo3uPyzI+0ULLAmNZnzmWBjkiEV3RT59+YlAFiE8pZuFC0NYMpqA5IIEP8K9c4L9nmU
         Fn2ABCIOZaeLM3NdcAEubxPO5wQxDyQ93bImiWrNHExLx8il4ZiKe38NwNt2OfyxZ1Cn
         ckfg==
X-Forwarded-Encrypted: i=1; AHgh+RpHt4QK/CzDl6Hak3a8+l8ty7PwefT2MNEJp5zoNK8mu7cGN+z8NShWStbuRXr2IQbqDFqOUoYKpBCF@vger.kernel.org
X-Gm-Message-State: AOJu0YwLWTeupymx1AFW8BvnOxRvJCdWgZVXcYGCSlvLOP/dV2z1fUtc
	x1uP4l3qrbdHSeVNBiJGHiKsCAYvqBCxzRLAhTwVWUfBipoo28FP+QwBAsgDM8smDOmvpmXZsEg
	zQhcQ54eslAhHidQAOrrYJ5CUl5sbtNPCm4JPv3Mram6A4f+24hF2ODOlMNiysjjh
X-Gm-Gg: AfdE7ckRBgM1SPq6pDy6WNvJi6izM/9ovKKklHrgrR551JX8YXipXyVqF+HrFRM8ujH
	nPjxkdfv4+EHGHVeiaCE1PTj6ZUvqts9zd1qqt5slzRJ00hs4Ty1n18a3l/vU5JWxN69s/ByHoy
	/pDqSPtOQcBX1dRSNLwGf5gebX6w8zft2Wtd05p0dGMpl9FoFlq3S5YuvXIk9l6S6Y88Dqw5cz0
	HYAoM5cCbzrgxY4xsYkymucW5g4OnpuApXyLZ8pUWH7/bj1bmHtwPmGJRQWJPZwI5LP33mHBe79
	Nt0K+GOVHTaAX2fg0wBFjhYoG8OY5fuZCpUAjegmnMpPNR6cz+IRaHFaKprRcJtRVLtM+S1xJ2n
	KttdEP62oQtSi4hwk4icALYYjO+RjaDGayPZ39OChNCFNtOUEU6jTaz30aspa+xL7ak0JSA==
X-Received: by 2002:a17:903:98d:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2cf1f4bafecmr37373415ad.15.1784219362483;
        Thu, 16 Jul 2026 09:29:22 -0700 (PDT)
X-Received: by 2002:a17:903:98d:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2cf1f4bafecmr37373055ad.15.1784219361871;
        Thu, 16 Jul 2026 09:29:21 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42b2c0bsm11828262c88.8.2026.07.16.09.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:29:21 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add DT Support for USB on Shikra
Date: Thu, 16 Jul 2026 21:59:06 +0530
Message-Id: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANIGWWoC/yXMQQ5AMBBA0avIrE2imrS4ilhQgyFBOohE3F2xf
 Iv/LxDyTAJFdIGng4WXOUDHEbihnntCboMhTVKTWGVQBp58jbs02G54aFSGVGZ1rp3NIGSrp47
 Pb1lWv2VvRnLb+4H7fgCLrzPgdAAAAA==
X-Change-ID: 20260716-shikra-usb-dt-v3-16e187393c78
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784219358; l=2103;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=tSy+31NSf4ZPs/L7gY8LgjvC8hOcW3PXCsaALkCykCo=;
 b=wtWB1omC57q6r3DrEz/OAX4ApXzO/fnAJzdlfCCRt3ZQTxSprSW+0co05IXJ6OTJgLDdUcwfw
 fKa5ODEXT2cA5/TEEX5YW9u0Qe06K9EiIa3rHf6p6YzAC+YXiW5y3oh
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX+GhXoiuZW9ff
 ZZpyjr++lZV/a1HVf04c4qvc946z1saNC/Piwlfwr/AqGwDdaNNd0860IR+uYegjSygFnyAtrnn
 MX/6znTUy8lRvdO9Dxp3inQXZEuC7A0JPyeklYghmZXN2xE6bmsBoI2rSzRGvZy9Lxnux9WwDMD
 S6/+1fgxUaBGx8vAtpLuRf5Dc/1b42atuve4KL6TEn7a7AVj7AGlOXSOFueW9Bt401fIjYO9+GC
 Z5xtq3OaZbuBY4WPganSQihA9CcVHJkv9WNFLxcstc4/SNDHY+QgFCfSmuSo+5kN0vvm5HgiJrp
 Q0qwT0uFggbns3maw0JR+ufIjWaRgqTA83Le+OZ9+0jkwIImicegCrca25+mwQqxZW87JNrPRBv
 O9cSpNsk03mIYMGjCRpvdGb8oZ/uCxMGC0/Mj9YnSc5sluHd09bXyXRYU8Cs2r4CjeNWEa5LM94
 dWMG7rIIq/q+31LBD+w==
X-Authority-Analysis: v=2.4 cv=JJ8LdcKb c=1 sm=1 tr=0 ts=6a5906e3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6AMJRFMpDxLzbceWcnUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2OSBTYWx0ZWRfX7j09CJSVlnLC
 0b2mT82uJdS/9Fnev9i873kUMYOxEUg6xhG7Le3xllbCax1AnM7nNPOHqgKubhipFvu9L9zZyVq
 1VqlibMnYUgPMjZ00bMK86XMVmYBsnE=
X-Proofpoint-ORIG-GUID: OCZkE2MyuiuhzmOnq7gDrm6XI9RXYc8k
X-Proofpoint-GUID: OCZkE2MyuiuhzmOnq7gDrm6XI9RXYc8k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160169

Shikra has two USB controllers. Adding both USB controllers support
in this series.

Only the primary port has been enabled in peripheral mode for both CQS and
CQM platforms as I got access to a remote setup and was able to verify
only primary controller. On IQS platform, both the controllers were tested.

Changes in v3:
- USB changes were sent as part of consolidated submission in v2, but
they were later dropped since bindings had to be updated.
- Remove double vote on USB3_PRIM_CLKREF and also removed xo clock.
- Uses &mpm as interrupt reference (sashiko bot)

Link to v2:
https://lore.kernel.org/all/20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com/

Changes in v2:
- Moved to using mpm interrupt handler for ss phy irq (sashiko bot)

Link to v1:
https://lore.kernel.org/all/20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com/

Binding dependencies:
- USB controller: https://lore.kernel.org/all/20260711-usb-shikra-v4-v4-1-9d59b9d9aff7@oss.qualcomm.com/ - (RB'd)
- QUSB2 Phy: https://lore.kernel.org/all/20260712-usb-shikra-phy-v6-v6-1-1b3e51bf1541@oss.qualcomm.com/ - (RB'd) 
- QMP Phy: https://lore.kernel.org/all/20260712-usb-shikra-phy-v6-v6-2-1b3e51bf1541@oss.qualcomm.com/ - Under review

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (4):
      arm64: dts: qcom: Add support for usb nodes on Shikra
      arm64: dts: qcom: Enable Primary USB controller on Shikra CQS platform
      arm64: dts: qcom: Enable Primary USB controller on Shikra CQM platform
      arm64: dts: qcom: Enable USB controllers on Shikra IQS platform

 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  19 +++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  19 +++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts |  35 +++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 221 ++++++++++++++++++++++++++++
 4 files changed, 294 insertions(+)
---
base-commit: a99b3734e51c5a737205dd42c35334be1c5746dc
change-id: 20260716-shikra-usb-dt-v3-16e187393c78

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

