Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B263448BB3
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046934; cv=none; b=hpUeCE8oS538hO/vnfvLzL1adbc07RTuwiCsGDCI4gTbX2Mjh1i4tuZwEQ4p92vdiOrrIKinNmTx+tuQIWmFgz8nV234XIO5vZtWGwOQxUvsnXmbef1n22W2fdM3xW2oxjaak+k2bzagCurB4G+xLXVzRuf44N0SwSY8HGkc01w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046934; c=relaxed/simple;
	bh=2YgJi6Xu05WRGAOu11HrYjiko9QwNnMuDrlWwm7+KxY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CmWj9RdXWqcEuTW9TipQ1RnK1cHrf7tZFXn7yRdXK4Qh9fMA5yrUcMKPjNEnwRyfHmybQOEwl+n/1I4iQYg42z8rM79Bt79WaRUHLnkK4ACdI6YqxwDzmMbzLZUaYr4SDdtl8cgnLwSyRaPJ/eyPqWuKorz7X++Me9peY3f1idg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HCz8OIla; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NO+eSQlJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCz8OIla";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NO+eSQlJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BI2l645218
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kyulp5Ob1zYRkpfwiDZJiE
	zv08LazV5iq4P3t/dAmMM=; b=HCz8OIla4bUUgxD+QW+a8sppqYmWAI2st/rkpM
	9U5e99Gu7EMYONp4bf1yJEBRnDDBXmiTmbVvh3vEcsCMYYRx9UGlv5HSpwo8zeXW
	e8/eBGAPIW6ELstNrQAl5nMrM0oCn8uRlNmpQN+HLN7zSdaaNUE9kLW8vLuglTJb
	iE6J+WHdARl5rDISp6rqy+siIVsOLMG9Zozr7xWRf491Rbb/jSYDE9xxlZPtNG2g
	Ed+AqDcKtNn/90bXzd3kpUnPZVCipIliD3CY9Uq9CzxBYX3Od/nDpvcFbE/9/6qq
	BL7XlRsdwCfeP7nShdceRcl1OKxhQ1+zjyNBQO/JbGS+/hgg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611bxbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:55:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbeeaabcadfso5344048a12.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787046931; x=1787651731; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kyulp5Ob1zYRkpfwiDZJiEzv08LazV5iq4P3t/dAmMM=;
        b=NO+eSQlJkgns0B6tVTe/XU3dcnjYJUqd7UdxU3iI3fXMsNDLwq5iG4bh1vW6IbrG26
         8W4zUW4bquXkBvRHPP3U1Z7TLDBSvitmLcgXOBnS535E9IlTXuVnqK26x89wgyNYS/lG
         YTKlitbbsjVay2zEs4wtxVvjmuZfXBes5gswns2zROuiUcs04d4xrNMevQI7TJs9IFqe
         QBxbC/YGNJefb6stgFHUnF+faeMBpA5IWByX3MW26u4aK9c5epwio9NDfkiq4ZMWwjGY
         nqeqlsdFif3WOLQYh2G1XbxDDvd8hXHoqu1oNVytHTcN2mc9djbOU3odTaoo7QhkB/+y
         k5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046931; x=1787651731;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kyulp5Ob1zYRkpfwiDZJiEzv08LazV5iq4P3t/dAmMM=;
        b=QVtsVOhsaDKaDAi+TmbIQ7+aYNpLyv2hg/YzE9q3SRgJ5m53giygnMloDb6uOLN0bc
         DsHJ5Qf/Bt273Liv4ewvPJuJXWZ8hcZeDmesPvfkGvc5s+aniOSvlaAV25g/QJFtb7K8
         yG+Mw/bt8rcKJIwoNbGqNMVv2n49jtDHOYL9hFYS9T7e8tbhaWu6KjCMJlJ5nQqm764M
         iDRRZzweKfUB+gB8HiQO70LDmwv+TTKG32GLw06hcP/QXXLzykSd21fImO8FxFSEXSrD
         ZNj7NQwhOq/jSYnF7t6SWKdSsaUuINhjSyoAwlYk1DFzglXmCMFALPHxF/jQw4AYsu45
         snOA==
X-Forwarded-Encrypted: i=1; AHgh+RqM5ZydRDpCkw+aTCpfCnLOOjKIkRgWRcgnl/gfo8GwLPbiSabkpl5HXrMlTxVygVVUteti1CVaVjIN@vger.kernel.org
X-Gm-Message-State: AOJu0YygL9ilZRAUi57J/4VKGD+08pDIAZYXN+e9B9oB7E1N3TEPtLJ/
	PoRMvdqJMsIli2pV5AT9Hx7435PR+L3klJvZqflQFBQvLIxJwcrMwpS18KIEdQeY01cTdCHCcvH
	KyzoalVz9uIb8PiNWA3LeLnJKC5PKH6K7vAXT0WvIZKB3Qx0v5pB2Heu6Q80AqSSO
X-Gm-Gg: AR+sD10jfPHuR4OD6Z2fPuiyjlBnRguVRuBeJJ8es4iZR/l34PypUQtrVzo3E2GgyQ7
	YDEheKqdNJm5tA6Qitiq/kk9gz/xVinMtyJzNgEDG5xIeG/wZ4vhRdWNzmOYzlELZyXe8mUzjvu
	iQ6lllzm0/uLlDynmZUF5gqEjoEZhN0BvZ0IttT7FdThHZtd2FLNPTTAjxPcYLRLQFMF1upcaCt
	DvR8QZtmSX+gpF/xaj3Pm9D8RaU+JqlLWAXbJQP/YMYCTV52BK8gfknf8GNeR5FzlnKdKCZkQNM
	I4/frrPPhkpvgs/5nKIioUIMHgpX4mhPNWJjC8H8Yb0ckF0ZFDxpDeygcmR5Q/95DcYUqMN3jOa
	3S+QQUgWqpulire2oeckfxhJjNR+0Oqiu
X-Received: by 2002:a05:6a20:3c89:b0:3c3:791e:5e0c with SMTP id adf61e73a8af0-3cc71d5cc30mr35735093637.19.1787046931137;
        Tue, 18 Aug 2026 02:55:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:3c89:b0:3c3:791e:5e0c with SMTP id adf61e73a8af0-3cc71d5cc30mr35735041637.19.1787046930703;
        Tue, 18 Aug 2026 02:55:30 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13c03d7c1sm1828956a12.29.2026.08.18.02.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:55:30 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add eDP display overlays for
 hamoa and purwa IoT EVKs
Date: Tue, 18 Aug 2026 15:25:24 +0530
Message-Id: <20260818-edp_overlay_for-next-v2-0-bd811d378fb7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAwshGoC/22NywqDMBREf0XuupHEV62r/kcRSeK1pqixiQZF/
 PdGS3fdDByYmbOBRaPQQhFsYNApq/TgIboEIFs+PJGo2jNENMpoThOC9Vhph6bja9VoQwZcJpL
 dkpRRca0xZeCno8FGLefto/yyncUL5XR8HY1W2Umb9fQ6dvR+iuy/wjFCiYw5CiFz1sT5XVsbv
 mfeSd33oQ8o933/AB4w3ELRAAAA
X-Change-ID: 20260804-edp_overlay_for-next-694510b7de51
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787046927; l=1978;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=2YgJi6Xu05WRGAOu11HrYjiko9QwNnMuDrlWwm7+KxY=;
 b=/eYLMhx4alPZLt6HDmgVPM7s/d4kuLC6Poio/E9y74/M+WPunrr5XJOy1/zPYWFw0/ZFfCAp2
 FG1z2FAQWjoCKteWaEuT8FUh6C/4aQ6n7MGRYEkzG9WxCgezT70tobk
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: c3T0uK_pVeJCM7MUCmm1FmgJmkeyAdSf
X-Proofpoint-ORIG-GUID: c3T0uK_pVeJCM7MUCmm1FmgJmkeyAdSf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MiBTYWx0ZWRfX68keN7CsEZJc
 XLQUp8M8bYhmFmGp4Ni+6071M/GsUWKWs79KNcaFmOEC36gGaLCOY6RCfJ7bXrr/y/AXLBcJ+7B
 FKOfpV6lEsDKiCbIqf3HnaYNhNk+j1Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MiBTYWx0ZWRfX2S+GAv0236iT
 pHRxUi+ahg9tXldYXKEVKxTfGrhv/NC0rA0ChyYArd8GfIgluderIavrjci1qciMEheIyI72mDE
 n2WD6ppVR4/G2y5uR2Otki8RF0mJFLv0WZ/wkW8+wOSgLgOS6uenxV6XZ0vUinyl/lQ7nH665Xe
 PfRW/7P2sgAeCGnALMtHpbZXskKMgcXaaIOQdHkX9t5B2nANWIye9PmnA3vjSui9K/T7Q2iIvQh
 F/s89apjcxTP2lLXRFa27fEEtR9on6j//mOdi1y30kjwWzzZ8X8YrUEAbSTFf8Fq94eJIofBJAI
 ox070C3FJgrkDMdHbjWy+93/wR4uHrDrigTDu1nan5atijw6fnwT0H3cXfBeS3HEeaVphr/ixrS
 A6ZDhZ5/A+Opo3CnGmm/F0ZBFGWIGDNfKBJLs5oubSRZknRt8pjZ42d03Xa7qWzkKPGF6DTjf0S
 9B+9atIhWtBhsd4WQNA==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a842c14 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=GgFmGPxI5zm20d61fSsA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180072

Both Hamoa and Purwa IoT EVKs are available in headed and headless
variants. The headed variants use an eDP display panel connected via
the DP3 controller, while the headless variants do not include a
display.

The existing DT is causing the eDP-panel driver to probe an unavailable
panel, resulting in AUX probe timeouts and missing display modes.
Userspace then attempts display commits through the eDP connector,
causing repeated DPU vblank, frame-done, and IRQ timeout errors.

Move the eDP-specific nodes out of the base DTS files into separate
DTBO overlays for each board. This allows the base DTBs to be used
as-is for headless variants, while the composite DTBs enable eDP
support on headed variants.

- Link to v1: 
  https://patch.msgid.link/20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
Anand Tiwari (2):
      arm64: dts: qcom: hamoa-iot-evk: Add eDP display overlay
      arm64: dts: qcom: purwa-iot-evk: Add eDP display overlay

 arch/arm64/boot/dts/qcom/Makefile               |   6 ++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk-edp.dtso | 124 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 107 --------------------
 arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso | 124 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 107 --------------------
 5 files changed, 254 insertions(+), 214 deletions(-)
---
base-commit: 56d828d0b65fb3451a23b5aee961531add7cf0fc
change-id: 20260804-edp_overlay_for-next-694510b7de51

Best regards,
--  
Anand Tiwari <anand.tiwari@oss.qualcomm.com>

