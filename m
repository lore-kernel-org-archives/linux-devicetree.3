Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC15233920
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782117341; cv=none; b=EvJB8IzTMctY+AV2aakS2ZEHejtPY117xizvoFdnT6+to4kLt6PRQtdzGQVTG3/3vqof25p4uv5Hd3H52RNBTFXTY8Hpb3fh6IrmFYQftaeQB6PKVnCX3N7JefbD4HrAwmHElIREfGvJISCy9MMzCVNAbHfvmZ8sJOMO+UjonJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782117341; c=relaxed/simple;
	bh=UYAcFQsdl0wlVvELJYNvsPuhaeON1HGQVMHdb9Z1pck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=shAmlAXs2tTUj0RHDqDybheciQncRfn/RpT2g/I/GjANJVmAY7kjuRHLIeXKezC9UukAYs2n+Tpzyeid5+YPAAWshM7E0RBk6hKqD4EcC3S2QROwwVANOde6ccOhGOgWERM0LZMHojSnl2MtvbWZpOCtx9UDDHl4xstrrw/TjG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLLf3mUw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=exbGW8Eu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLLf3mUw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="exbGW8Eu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59M181275555
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sPdG0qXjeboBvQV9fnjcdY
	soHMrD/LzZsyptqg7/lmg=; b=nLLf3mUwhqT8dGr3EnipICBrtalP3AS5Uk3ukt
	YWiq55ii6cjPh/+Fz5Gqq3WySJmEAQaPVwxpAKfZGylza/T9ljqW3rPqhiXyc3A3
	dWU2qQQIUR0gPSYmpYyrpiyNj2f3AFYNKaqsj7brf6Rf22Xz6KibhNGHbL+jNyek
	VJKKjSIoI9htSmdGWDqGl1xcz+tFD27xbrLM8r4097We44SNPlxS6zCA2Fp27gSS
	1p4O+RV2KtoEMBWD12Tk2YQFbDNCimJ/m4hnUMQqREnepGDTFqRPYKMHfRNrMT6p
	xAkr9fnZyM2mRg08Celq1mwbBRnRSbRn6Ko5rrebe/bvPSmg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk32wnse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:35:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30beab99453so7171907eec.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 01:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782117339; x=1782722139; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sPdG0qXjeboBvQV9fnjcdYsoHMrD/LzZsyptqg7/lmg=;
        b=exbGW8EuRdXjks2uNHMMMjiJmjnxL9yTElIfttCNbre1XAetj7yBMZs2+eFGdwttB0
         gjidY5heK1cuBX5YGFozJM/IZIU6WFQW/VrLwLInNHIQxx8rR95DzoLZoHNce2Tp7hUx
         /lzyP2kUWrjEFXU6htqg00Lc3qA3yUnA0Ca/tRqsNMiys9bMPK87G/Iuuu+ZgixqS+eI
         Z2/j/gnRSQ6nnvUf2hwPTFJGXHqyIqN0Qw0fpzf9rnYjwyhgQb8PNaMRzKFcqY2Slq55
         T/rTYDh8m+z6xsGRHAR65Nur2xEMfBEpEeXk7ot1GArS/WXOVEeQ/6krTGwpVsY5q6FA
         n66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117339; x=1782722139;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPdG0qXjeboBvQV9fnjcdYsoHMrD/LzZsyptqg7/lmg=;
        b=XO05mIYOvydc7A7OBVoAQ2sO34vg8JbDjA9fSxCouYggMWB6RWwAeYkpt3eHl5BFH7
         6FGyyu1wfunNeBWP6kAG9Ies4r49GZ5a8emLNuWcjTJ1XJjIPg/0m0d7usN32xmRcxFY
         +2ZAWBwDLsvzmdWoleURZzTGntJ2amWurw7JXgGMr48aksTTFMWSxOMZyMP4F3bPO2Rx
         cix8rgLu053PHUeIKK3g7WnJPZcSANQhpU0DdzwyYt3MJFtzyN2CaCT9AyQk0ZVXDrS0
         KI7wmd4n1ABRNjN2dfHiMFyf5V3w4O0Z4wwkiu9t5lrSs/5t9Yr2d+aB31FgZ+WxVGoi
         8j9w==
X-Forwarded-Encrypted: i=1; AFNElJ9AOufHF7dBA626Kkgr6DPWu/rd6giUVBtdIjUGSmGYOHNntpNSscog7NsLr5BYja26R7jvgadkfNgt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy53f9r56STLcrsL74crvf7FqnSoLgu4QYUPOw2tEJodpLiUnsm
	YeU7IhIxD4jtuMuSfpqEe1Jz3b++LOxGtqfQGLVPcF+cTqbVaD6s7MvfsVGeYww9sBwYrez1L51
	nFzuEyFXVL9bGX2qvM9tyh/tYKW45X0LE9YsDC3kKkaM2WIvkgjlsDe5nvGXR/nEO
X-Gm-Gg: AfdE7cnTQYo2SJOc3A4GiZ3aVYt+cxBcDOP+/eV0FXx2azRj/uQH+748EdfOmo0+pTr
	k0Wh3ZJiWEgWOWslZGfgvD2yjar7IGtzJhR6j5KN/443eIPzRe8HdKCR0kdHGdJX5oQtU+N6Aek
	DgTGbD49DwBcpnD/Ve5KYXFHURReP68d7Asahv2s0HR4XEdb6S7SO3RV0V4kjiSbLcBlUxgvTR0
	KX9QeW587r/BY41WsXuW7FfxcMC7ZNSI8ElHdyXpAV4efWxi6tb4ylPM8f67le6hZZMBXzrwEr7
	fUmoIVrEIgR/OmrrW0dXTIg5pvHM3HeCa92o7MGqcJ0EUqrtioQHiBzdkVO+CDAq9mrKNoL6SfJ
	Wv8/UiYT7X3oNEZBZsaOJShMcCEZG0wecsMR2lTQHXMvY+SrD9i1Z9zJSeJbVmw==
X-Received: by 2002:a05:7022:629:b0:138:30b1:4c00 with SMTP id a92af1059eb24-139a2035deemr7515163c88.3.1782117339020;
        Mon, 22 Jun 2026 01:35:39 -0700 (PDT)
X-Received: by 2002:a05:7022:629:b0:138:30b1:4c00 with SMTP id a92af1059eb24-139a2035deemr7515147c88.3.1782117338507;
        Mon, 22 Jun 2026 01:35:38 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adca1b18sm6801967c88.3.2026.06.22.01.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:35:37 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming
 Maili SoC
Date: Mon, 22 Jun 2026 01:35:31 -0700
Message-Id: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPzOGoC/22OQQ6CMBBFr0K6tqRMoagr72FctKXIJFCwxUZDu
 LstLkzUzSQ/+f+9WYg3Do0nx2whzgT0ONoY+C4jupP2aig2MRNgIJgoSjpI7JFOaPXsegqcyb0
 2B6Z0Q+JmcqbFx8Y7X2JW0huqnLS6S5RIgFTr0M+je27WUKTyW1ABfAlCQRllUggu2kpDXZ9G7
 /PbXfZ6HIY8HpI8AT6Q3y8DJEijKtVq4I0o/0DWdX0BisZ9pQ0BAAA=
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782117337; l=1257;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=UYAcFQsdl0wlVvELJYNvsPuhaeON1HGQVMHdb9Z1pck=;
 b=Z3SBQcWgGoqJXq1T3gxXIxl+q2t4tfHXo7kVzRNohfs7pPfe7kvg0Tp6TYZBAeqjGrs4RYNBv
 U19dZQ3WnU3C55WylYSmvUXKbUQKOjx1IQA4LVA/GfF6c+6tHdNezls
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: _o1DtAyC4TNZEmbxnWV9zIsH9PsJ0Thd
X-Proofpoint-ORIG-GUID: _o1DtAyC4TNZEmbxnWV9zIsH9PsJ0Thd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA4MyBTYWx0ZWRfX06iMbwgu+mwy
 jRBsGYhOBgee24V2EG1t8HkIpeYBPiXh2/dKTkdxHTFIrSGY0PR1DwKLKEkKJe556ASCqfAb/bh
 ho6MYU31dQuqFrLlVs/z/NC7RSkgBH8=
X-Authority-Analysis: v=2.4 cv=NovhtcdJ c=1 sm=1 tr=0 ts=6a38f3db cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=shj1PICiUaLHCvf5g4YA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA4MyBTYWx0ZWRfX/cuka9J1WM2Q
 widgVJ4ZSemQbgKsr+oyaC4BiZHUJnONxVe51QFmEU5+tjYUJRp5N+zFUNqEs7758jKX+VnBIgF
 olOy+ixjL5sdJW+kfleiSLEVM9ZxWzHFZJ6v6q3FVbVArm0GGORWFTDLaqKFrQwOK75hLSMEpl9
 f70LUTZkMqB7j0VawRxImzOwBdaQeVTF7cqlj+8ua+u9dDxHMJVYs4I1zPdy5TbuN2QWrh743rm
 NZ9cI9ivebzTQgnvlDnisfImNwPtDsLocEmG+ez+n3jUw3C829A8HcijR69leUFJvuwM3wRTGWE
 kSkESNE4dJ/CEJC1j9jUJydtrAeu92/iBEW67hrSi453YmOMsfEPRgFFJV0LzF7+iOI3xQDEPNK
 mOB8V+sYT4roz0zKR9mteModj6JIny9yBrfWI890pd/Ei9cBn7cI6QEm9f/3j//dGanHeXqaSbz
 0/w87c5OtVmoZMzXB5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220083

Introduce Top Level Mode Multiplexer dt-binding and driver for the
upcoming Qualcomm Maili SoC. Maili is the new mobile SoC, and its DTS
will be upstreamed later.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v3:
- add reviewed-by tag
- remove comments before msm_pingroup
- Link to v2: https://lore.kernel.org/r/20260614-maili-pinctrl-v2-0-0db5bfc23d64@oss.qualcomm.com

Changes in v2:
- Move MODULE_DEVICE_TABLE next to the table itself
- Update gpio function to MSM_GPIO_PIN_FUNCTION
- Link to v1: https://lore.kernel.org/r/20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com

---
Jingyi Wang (2):
      dt-bindings: pinctrl: qcom: Describe Maili TLMM block
      pinctrl: qcom: Add the tlmm driver for Maili platform

 .../bindings/pinctrl/qcom,maili-tlmm.yaml          |  120 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-maili.c               | 1625 ++++++++++++++++++++
 4 files changed, 1756 insertions(+)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260614-maili-pinctrl-230a8ce90bcd

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

