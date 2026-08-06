Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F24A47A88A
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 16:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786032795; cv=none; b=JRAgzq5AKZQhEjrDdU+AMhswbGNl2HjMiP48GxrejUbCh/AmwJTTutjNakdjMHVcK3LHiF0k/cSM7t7mmJtWoW7ipiTQAFIAS+C4hnMa8w+7IYSqCx8b5vaPxPPyqA8j/UwFiesXtpe4MbCggTOYoRo0XI8G0bQZtTILpOa5dqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786032795; c=relaxed/simple;
	bh=xM7II/8CoN5Sya9W2Fo/+4FjhIIp2ycNWN33ZSTrQZM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tN6TpZZbKXAkyvD/raXdQIt0cInoRlh1/uQV7cQ/e2lFicxMtUT2A/lCQu8n/89zPfgtVSKONtmUGA+8DozEQaN/XFuOSByr2djSwNSAygAqZEm4o6Sq0F5KTmh6hKZp2NhS19rbryGA75HamC+SHL5Ur30sI5zXidBsWXZnpPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgSgspHZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCD+VH0e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgSgspHZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCD+VH0e"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676Ene632276923
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 16:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s6nt1Vjx1KtpZs9U6I3iMDg0ZKhLxL+ifZQ
	JTIvRzMs=; b=NgSgspHZQ1n3OZ4TnRkI/CfSyKY9VbPTpf+0K3LB0SlbZkYsii4
	8dZQR4MeeVG1FSE70O3puUuWnfmE4GIZlANk9gOFR56RdaafCJ65mYZ8G8SgaLsf
	B4XI6xIgBn7n2iAtbT1LV2tuzm+vjKrmSxmiaNFwVhglvgOsttcC/wZtjIEpHHVI
	2wLDXflrewmToPcgx28jGmTwVub5+d2qVlJdmLdt3R4ILSnNNzpewDZG1YHTvbwO
	0KO+LzvAUHDQK65Z8gq6WpyjR0OXn/VLgdxqJTy+JzMxDOB+iwTS/UwaAHqsR7cf
	A0Xrdzf7wywdPrPOEgMhBZOpn52YzZGNswQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvmrjjt9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 16:13:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfe48ca1efso33750875ad.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 09:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786032791; x=1786637591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s6nt1Vjx1KtpZs9U6I3iMDg0ZKhLxL+ifZQJTIvRzMs=;
        b=eCD+VH0emoyMoflBWD7zd9VSh+V8FMZ25K2XLo5H9DcsNiYGzBuO4Hv3MZE1QlVVe3
         7ZskaWAw0aM7Hc0oGR9eHUqKsB4NcbvebREEj+SWnC2BxDfvf4eQsPdoXJzx7TyCucBY
         pL6EdlrugArDSlR7UTwpb47Qjoo3639wmwMKqNe6fW1RKAoqjWAv3mle79cygU7TOOJ+
         shavYB61Ea6oknDdLBVt/1Pd6Hes4eZ9PxZm0KsLsLHwpF5niag9J+K0bHjstUA5aPjR
         LWzOCPSyXnbRGnztjYYoTtbDgzrngRcqmEvofxnd3rsYCg08CybVXtN68OHr4br19VQI
         8lVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786032791; x=1786637591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6nt1Vjx1KtpZs9U6I3iMDg0ZKhLxL+ifZQJTIvRzMs=;
        b=NtjrEGxZOhxiBE83M/4xDJ35CecCUbNsNlCgZlBtmYFWVoCq+nShB4OkEQfkSknUxM
         xlf9pZrRB3dIcTJ/v92PIhLCey70tc59JZRd+1097x9EeVl0CDZxcqVQ8YH6c0gKCInW
         El/gJ0PPpdpcYUrj+VM/GG/E1Didlyo9EyzBOlc72R+qNik3Rhk/txaw9uSLk5LMU83q
         2Z4Pf/2twyDSkHJLouvOXXJ+5YMuUQRAbeue3CUDqeCWoceVIRuBs29VSj1wUgj3SVE9
         uVj+84IRG23f57KfnTu6oQyVatPr1xEIpmInB9nTW5ktpZJpDiJJU3tVEb3a1yBekwOJ
         6RAw==
X-Forwarded-Encrypted: i=1; AHgh+Rp0bwisWgFz/NKYZ4ac9kYRdMDwJN6uKg6TECuaIndgmm606cpDyPNqzYgcmpjvxgFRUkrbtT1+OJmg@vger.kernel.org
X-Gm-Message-State: AOJu0YxKvEufACaWIGs4ztbiNWY82rSgRWrIDtSBOAYRiU5LkpZdS4yP
	fv4c8N64kCxjzz2Bp4vhYTAM4phcTQEb/Ct1XuuiLOV0WQMpVcTm7OB8AcxJsViRoHvb4brHfGy
	i3r0gwBV3ZdscL47DlNuN8csVqOd8fxmHO4UAFC2FTe/Xhk+rZP/QbJui4MyHdVOP
X-Gm-Gg: AR+sD106CvkQml0oPQ9jIXCO7COl5p38QJUpoxZKJXfoM6uRKjtZ64T7sxiefvFVtTM
	7AcM/CtAF0eMNw06M7vHxtzlIGjSD6g7vUFntk1DalkHEl/h0P6H7258YPJPGxKleYErthJPvQ0
	Wn4tpDUAY6JcnErLH/U7cSFL1RcXKdXrLja1H6wbMcxWeVkp3FJ5+u0hY2kKvBjedOY5sY8ow/m
	K/HqL2OeUAAw4VNh1hJKB3EMqii63xe4JSYXejbYqzeaVgaTsuSvKwMJiVCe5e+6bVd74gM0qI/
	KlEX5n6kdNRx/NY9vekVqZ11BWcD7dpshspn8mXz8YXCo/xi88FOasJ92UivHp214bnkFIDNhsb
	f5x+iO7rybnTtkPxTImc+1NT+mVAfnX/9
X-Received: by 2002:a17:903:1986:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2d0ca9feeb1mr208862295ad.22.1786032791475;
        Thu, 06 Aug 2026 09:13:11 -0700 (PDT)
X-Received: by 2002:a17:903:1986:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2d0ca9feeb1mr208861555ad.22.1786032791000;
        Thu, 06 Aug 2026 09:13:11 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b761asm43074546eec.1.2026.08.06.09.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:13:10 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH v6 0/2] Add Hawi UFS PHY and Controller support
Date: Thu,  6 Aug 2026 21:42:59 +0530
Message-Id: <20260806161301.1010876-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VNPtWdPX c=1 sm=1 tr=0 ts=6a74b298 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=wRtOOnJjwWicnHpPwtUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 9lkNYgbrAc4AH36rdGnL7ST_JByCWu1e
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEyNiBTYWx0ZWRfX3F0uAGDjpqfH
 XS9i12QPSBEzt+Khl0WBPQXx6ugYN0xthHlEBJ/yWknlL3q/SkrNun4T0ydZ3vK+QwphpRGRPZB
 NXVpOlcVG4PjtpcqXQTU7+jd3EaQ27k=
X-Proofpoint-GUID: 9lkNYgbrAc4AH36rdGnL7ST_JByCWu1e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEyNiBTYWx0ZWRfXzIlGJRfc1YAM
 0XdH9NdFeuJVCAPmfOfZWgKko5gYRpy6UNvAdl4eN6ezux2UGLrLiWqcNkjvgQDXTEpoC7Eh9w2
 kb8xV9aoaPPL9D1Km7wgUPz1JoDjYOHm3PplQdZgXaYP+n29VNNeVIsdYX5QbTAgvUzCmqnE0lu
 RR8/r03Pdq0KPabalQDL0EK7IIXQ5bJiLEC1dtUMxE60ACc3ou8u+DsSN2j83AXAgY/0HXRo9uv
 HftbQp6PkiSMFkEzT5+pnzWeFnzazyYeUkSFn8Bpdv353Pa62vtqDDEfoSvl9pFDRIRKXORCBMm
 rkkam5FHudz7F06ac1ARzHHkq7EGo+QYsgk62KdvQWOoALbsIUmpzKxJjX8gyCBdCQ618Ceaw0J
 2XZRcm53e01T4GBgU2i5S6gm+Ify9WjHo0pn00aRw8zOZw/UCIQFH/9m3avBveI//5uSeVUJoAJ
 gMqXt7ljm2l7aMfrQ5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060126

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

This series introduces devicetree binding documentation and PHY
initialization support required to enable UFS on this platform.

  1. Devicetree binding documentation for the QMP UFS PHY
     used on Qualcomm Hawi.
  2. Initialization sequence tables and configuration required
     for the QMP UFS PHY on Hawi SoC.

---
changes from V1
1) Addressed Dmitry's comments to fix versioning for PCS and qserdes.
2) Addressed Mani's comments and fixed missed compatible string and
   binding name correction.

changes from V2
1) Addressed Dmitry's comments to remove whitespace and stray line.

changes from V3:
1) Addressed Vinod's comment on missing macros.
2) Binding patch for UFS controller has been merged, so removed here.

changes from V4:
1) Rebased code to tip.

change from V5:
1) Addressed Vinod's comment to fix register offset formatting to 
   use lowercase hexadecimal values.

Palash Kambar (2):
  dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY
    compatible
  phy: qcom-qmp-ufs: Add UFS PHY support on Hawi

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   2 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v8.h    |  13 +-
 .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 139 ++++++++++++++++++
 5 files changed, 214 insertions(+), 1 deletion(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h

-- 
2.34.1

