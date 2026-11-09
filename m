Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794205646;
	b=Pp60l3ipSExwEi9Y3C8DS2G22VBi29943KoDS685M+lzakcKTBTovY4TA2X/ZBwJPWkz
	 r1GGaUinnYIfMJi7FjBQDTR7+2sqyYXSLicpNokceK1nINfYwwgcXvUhxM4A6r0RJ+szq
	 8hcrFELLyvevYKb6ogS2K1T4RAo0VAlYixzzSMYPK2Kbsr1iHWA2s5OlKZQ226MLyNvze
	 PxYwIfO9rn2NxVclzTyvmWt9VSDkghr/UPrZESjhnV2PG5taZpeeLxo644jICcvSjpYe0
	 sjqlmShgCWSdZtBOFlfyv9Gxot9DlbCmxcGSbDEmKoo7mR2X7acmGJXMl2VyOAc1JYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I6P/+/Ar1axx3nC1T+ZFo1xV01iG4tHc1syUNQX7w18=;
	b=ERvttvd4lrlrLRzEB7xb8H+F3Xt3WBdiO4bVzqrMlynyR7qI5q1KFJYnHjWslbrh6knZ
	 uCf7VQqfX7qD4GOUdijJ3kAdsO6GFnqW0QXJQWb61Bv4RJXHZvCZlIH34WCrcNQjiAxTE
	 SnomQ35LDDvHUbKH1iq+ckKxmDArZyZIfPwlDiNmqORK0+rqv+1ryXYF0YYRvlpCYp+Td
	 vtDurrktxNsBrAZcpgcU9my9t1AjXKno4tbFEZpzMLHdTwe6ILYsag9IXkOAY37RKRO37
	 vArm43I1oB0B5TWOZBf70o4XNipxpsBu+aCyKEIHIaX6Qyr502K/6JXeaNVS0bWkbEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L1y+eOu5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LO/DTE/g";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C54D606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 06:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C54D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L1y+eOu5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LO/DTE/g
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969v5V3580920
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 06:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I6P/+/Ar1axx3nC1T+ZFo1
	xV01iG4tHc1syUNQX7w18=; b=L1y+eOu5LiT5vHGcvIarNbHENiE1K1qAEQcKbL
	A2Wr8B4tOdF0xKk3MG37atArNp2RdPOf9ceRjKXB+KXXFTsIEXVhQKEwRQItlaNj
	RjaaV2fa1TfvmZEUYcpUDIzoCTF0SG7xQxoeGYIHhlhLUDgPnFC9aHdwhLE0bSvs
	rsHOM/wat8SENxUIk6rjkygEvErJJxEZF7JUNev21mLpWi9BIHVSyYNEQMbAD3aW
	DQUZ6X4aHIKs2mCVdhZUfywzqcEltyMgQsutQEMmPVSzskoTHAD1MXGYDKRsS616
	+T36IJQq+gAO3ivArBEOfpn+9G7w707BnX+ehRqoHSoKQwCQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv734ydt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:27:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1504315eec.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 22:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794205644; x=1794810444; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I6P/+/Ar1axx3nC1T+ZFo1xV01iG4tHc1syUNQX7w18=;
        b=LO/DTE/g0L2W4B6HHShEYjaMAYUV7l9DUhyotOChTuggtYAY59CUXEixrSpuBf3pXR
         oyVDFIMhploFnLkbpHaQ/uCbs5OMiLaZx/hQLQU/36SRCBNpOOeLa101UVLMtxdVuzY9
         W5mvNegqvTY7HZG5zs34iPTyPoKys8jnUIx10qq4avKFHQgOAquxnGipAyVnTs3jy6Y5
         o8QCljVOJfxLBP5gO/5oI40FJKMRxxtNXr4lAX3HrR79VW0ErZgvH4DT2sEqT2zFVZo6
         VA4Xd+Mx6bzZ8t7yMwsl/bTgaFdX3ST0VQJwLau2fs32LZvy40uizi8ni1ZMCBlrAIRm
         ToIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794205644; x=1794810444;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I6P/+/Ar1axx3nC1T+ZFo1xV01iG4tHc1syUNQX7w18=;
        b=r1tfofxtniRi376Ji7UpxRoH5CsVlwlK/2ED5mGIuIQjjT+1D7XP+5IeamZ0tun5gN
         XR1wPpQxaLqjqWXhfmVT6Y6de6100o/McdDNUekQqkOT1mId5ppW77BjqJ/ysVNj2boi
         Qsi6ip/tk/4ZGgctIcV/3H1L36VX1eAQs2SMu0PEdfpyYUHfMg9jIjuKue3jHmA5kyeT
         kWlzBfPQA5fcwF9joSAOSXIQ0RFTUShvjrD0khk+1te4X/Nr6yq+3+P3fH0LZex6hwnP
         dUrLE52PZSedgwigLJNkPCRyi73ZJRSH2QR+2Rp3v72Jr0NJJjWoAHV/3bTByQbwkjbi
         A0Zw==
X-Forwarded-Encrypted: i=1; AL+hErHBKli3fDfz6efJmdz/tWbosgSBJQtH9gGhidWgvuvROdKZbtD1o1n7BL0Z7w+NLkME5f5CbCHS4vCk@vger.kernel.org
X-Gm-Message-State: APuU4Z8RaUpWlNhJBWfMLvF0buwiB0cczFRBzqz4QI5B9+Bqo+E5WOW0
	fjSI6E293pCsi6DY0hmceRXQAD5RXh+pEKpsR0mwpEr6whCkKmW6XZm+L4UuY1z0yCDw0g2wF4N
	TsfYC8g9vUgStk/Mg4KgIzPnpSDhDYIjxLl1VP06T+verrdnEMCwrok2+1xYc+RTV
X-Gm-Gg: AYBFou1F5Fjqgm0cJI2LPzhwkyl1GhLITiFKJf+UbBMBfy7s0YyF2mvvaObiqozBOeS
	F9/LDORMDcvrvAlcqCCTa66R2eSAgG6k+7pVc+sVNWBvooHTEp7AjuBc0RlafJdKKnArCbXWqV3
	5xnDAOyX/Z78lHcypzut22qFbKbR+itA4VDwWh0TL3PHaYzGK0YG3mObMQlK1SFDmpDbHJLUqcb
	jux9IPHc+/cUcVezXhGDYJdKGOPqJumZcfH2GHYpFvQCHUjVtQzs+PyGOeVxZnNJ121tuBXk3GU
	8uC/gZ1XwZb5KWnQSWXg3U43W7BLoKZX6A8KiKd6iAEN6C4Oj10XwZ4ehKEkwVBHzmJUiCinZQE
	LBtnfRu0djTvvG9Hq87acYr27tvL2HIP5geOVdDxMZgE+ZteyjoDbaY9nO4zhvMWPTsNr8yVod0
	0+4kPUcak=
X-Received: by 2002:a05:7301:618d:10b0:36a:3453:a356 with SMTP id 5a478bee46e88-37276535d08mr5879272eec.36.1794205643922;
        Sun, 08 Nov 2026 22:27:23 -0800 (PST)
X-Received: by 2002:a05:7301:618d:10b0:36a:3453:a356 with SMTP id 5a478bee46e88-37276535d08mr5879232eec.36.1794205643383;
        Sun, 08 Nov 2026 22:27:23 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f444csm15812458eec.19.2026.11.08.22.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:27:22 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] drm/panel: Add support for Novatek NT37802
Date: Mon, 09 Nov 2026 11:57:13 +0530
Message-Id: <20261109-jshekhar-nt37802-v2-0-a8e9efdcabd7@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMFn8WoC/32NQQ6CMBREr0L+2pK2UkBX3sOwKOVji0K1H4iGc
 HcL7t1M8pKZNwsQBocE52SBgLMj54cI8pCAsXq4IXNNZJBc5kLwjHVk8W51YMN4LEoumVaaFye
 TmcYgxNkzYOveu/Ja/ZimukMzbp6tYR2NPnz2z1lsvT/6WTDOVIkKi7aWSuUXT5S+Jv0wvu/TG
 FCt6/oFV6Kcd8kAAAA=
X-Change-ID: 20261104-jshekhar-nt37802-a5a079c4cdce
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jayant Shekhar <jshekhar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794205638; l=1979;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=FkR9f1cRWmpPscVyf3yZZzodXrTf3YT8+24ASTDxW5s=;
 b=2ulozcueZqDqpHWeGJjX6hJAQs4SqUcC4nFygoleItg9+WBmpeZz3r9I6y3DzrlgISPkqWh+a
 2mf3SROcaNOAP8lyceUDkBHoiK0l8UsGnhphyFQkYwSioImOnpjDzLi
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyNSBTYWx0ZWRfX+a1ee1W3ScPZ
 FOkYjcsQQhqwh6JuMFYHLnBHT0ZowuAPRQRQ+DwQMLKFIdGaoI4iV2hZ7iWBL6qQnarBDZlok9Z
 HqTI/fvHBS5jAOtlNvIZlziPeELklACZStaThOViHsC28gCJmVtsRadUxmerOXE9Ilt21nne/0d
 cML/lIc3DaH98gcpFj9k6S9jTP2liRh1Jxm5uNQkL+eNS8W+I2cfjn6MSR6uplPQwNn+mG3meZc
 txbyziVRHghljCeVOy6mp4U446NeLr6wY5CW4sJnh9xCE0zCAwfJ0k5hOeCNJIPjC8ZpDJfnCo4
 nbfcJxBLzHevGuBiC61sBfHQZEx0DGhyYpg9Xef9ERGfkw/tTgj97vevc8PBE8Nx8IsNaTX7HMT
 N6JLBLGc25fB15Ky2ixL5Synzs7jZZyj5VYrCLtg3zsgaP8i2/7gGeDwwE2sBCMUSHFpB5Myo0q
 MUfdcPDCJ3sEDYPMQbA==
X-Proofpoint-ORIG-GUID: OJV_Y8kHQU98uQDaRlD4i4GmMOzc7kRh
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af167cc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=0fWOHazxJtL7KIpFMY4A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyNSBTYWx0ZWRfX40MjtN31ZPW/
 9go1hbUkgEvEzG3Hl/fpe4M5FmkzNXGMwrnrJxtoLh3ccC8TrwDG9mNhvtpjHFZDaFsxPfmTv+G
 wcCvrawY1AdRdhB3cTtSbsb4xi1qzWU=
X-Proofpoint-GUID: OJV_Y8kHQU98uQDaRlD4i4GmMOzc7kRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090025

Add support for the Novatek NT37802 AMOLED DSI command-mode panel.

This series first documents the panel's Devicetree binding, then adds a
DRM panel driver. The driver provides
the 1440x3200@120Hz mode with DSC 1.2 over four DSI lanes, sequences
the panel supplies and reset GPIO, and exposes DCS brightness control.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
Changes in v2: (Krzysztof Kozlowski)
  - Extend the existing NT37801 binding to cover NT37802, including its
    required EXVDD supply and an example; drop the separate schema file.
  - Drop the arm64 defconfig change from the panel driver patch.
  - Remove unexplained Maili/Pebble platform references.

- Link to v1: https://patch.msgid.link/20261104-jshekhar-nt37802-v1-0-58e5e7fb2556@oss.qualcomm.com

To: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Jayant Shekhar (2):
      dt-bindings: display: panel: Add Novatek NT37802
      drm/panel: Add driver for Novatek NT37802

 .../bindings/display/panel/novatek,nt37801.yaml    |  49 +-
 drivers/gpu/drm/panel/Kconfig                      |  15 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37802.c      | 544 +++++++++++++++++++++
 4 files changed, 605 insertions(+), 4 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-jshekhar-nt37802-a5a079c4cdce

Best regards,
--  
Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>

