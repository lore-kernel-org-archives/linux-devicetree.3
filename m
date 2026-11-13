Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557801;
	b=l2SwTcNe7ftFhszVMN+8oma2jJV/hEjlei386Kuzc4Dig0N/4zfWhMp2HsEwrzqjP1qQ
	 W62YOE64kt81op8KlkUyBnHam4rOCBmEogkScnzfZdhllzsejApj+t3QNtmVqWOFN8owp
	 vDlK50uSyXR+BS5KZwqtuzDCnZrD7LQPPHHvIDiqfOMfVHhrbJNfTdQGRrTEKly8PNvJa
	 6GTaCn3PB+AaeindGhn000DyMMvrww0C2Nq/Vwv62XcDjpEIiDUpwVEACX4TJUhfem18p
	 y6d+P/LJbYIrxvD/SQOQMeYadtweQbYlo62pBmMYpgbnPMhiSrvgRN70gp00fs2eX+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=k7g+Q99aUbsXZ7BpjH1ZLjP7lyhxixEnb0pEleLu2Lo=;
	b=Msot8uvYnB3oYK5MiLCa6/FU/aG42xDTwWN1Pn4zuOr/cDMnJjQiVqKOcRFnPIs+P3nI
	 h8w/bo1JSZxPpOTn5HKY7ee4Tafl7YTiwm2eIzgq8m4pHS4+g605blE92NZ8YdyCFvTAP
	 Zd77iwpR10/VerjeC09o7BD+wmDZHUTVHQAEc9fcTxqI3kD5/X5VGpJFPxJIjOvjd+YQV
	 LiyWS4JikTBnG6iybxiiPAREFjBQ8k2+PlGyBk/14uUNHbFFU9ZEE4IRBtxRNI0tEQOfR
	 gxfMFUDc3lR5MjFNkGUTXQAt+vuwb57d8w6gchZgx5SZPHdwYUy4h11JoH41wbXM83w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=HgXDDgyG;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EAF606A332
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 08:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94EAF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=HgXDDgyG
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d473cfff6so111641266b.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794557798; x=1795162598; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k7g+Q99aUbsXZ7BpjH1ZLjP7lyhxixEnb0pEleLu2Lo=;
        b=HgXDDgyGC3CbfiULiOuPU0RqFlCCS/gLIr6FY7mkqgqaXSGIJ/tfJg/b7Nxv/zIRJo
         c2ji9yU6Nc5lce7Ut6mOubwmFSj2pcmyBI27rf4pmxr6A+jBO3zCX5Y3Zav51YXwMx8Q
         XBMMgOusmIMq8izF2GUBPKrchdZG/saGxxq9q3n/7B4ffTX4FVExj71TwY5+37aJWGGX
         Yb6LUEH0TBSQ7WQd3lyH1N7MVbGKUo3OEAFv0xi7hafJVFmi+JFuDHqBnIksSOApC0Wr
         mCi1H9upFfdf0bblYaDRfcKVUy8n9uCkfcGLeBpwJ4JEtyjKhMCPu4dDLbOYcVLOk6Cp
         uH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557798; x=1795162598;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k7g+Q99aUbsXZ7BpjH1ZLjP7lyhxixEnb0pEleLu2Lo=;
        b=S8zSNdm4n88AW64coeKHOtGWOa7+dqX/T+lYhsKo3iTsY5qwBylnrtOPzzfV+0yWRa
         43k8DG4UA/D/WADPi8/E17/QNok1zwFtO3IF+KdPYY4eUoruNINRTTIUHwPFU1DQf085
         vQyZxI5MvhbM8vC73SYQeJv5ahvCxhGl7+1YXE3wgshiLzgNuAW3eB7Jr7ZlBmuF6A7H
         3Fpa44RQPlN8D9Xmrm2aH5u27exhNv+dqNJnxhcTFgHHWWkLv4ABo1RypfTVRQzslS34
         QKfHtQVfPCREdjQuFAzJo3dXmzcQsxKF8C5woRFZofMJGNJmaIaiU+7L7CnVS1Cwomko
         yXpg==
X-Forwarded-Encrypted: i=1; AL+hErFG0RqZHvTcxhudkRJdT4ry7lH4q7R1i6c9mq+uBv4jwqcp3un+S9M2VecJ6qjwjRujH3FWe1rbMpHx@vger.kernel.org
X-Gm-Message-State: APuU4Z+M7JPDjm0w7bwoFp0Dymlz+Tbr5ViRpDY6BPCFQ18CWJH1qYiN
	pTmssUG3/EuTOljbxaMXJ7Jnk5lXUR52vDQc+nUz/kCo9/gxLJMy4tJ4FXWIe+XUTSg=
X-Gm-Gg: AYBFou0E9AF/DTWRKV0ECoDVstNQCLOFp0yNmbR3lZP7xOeUsBmEkJjyisAuS8GQqbC
	e4st1Vgcv3l2HGR4IMSgO+9N6fryS3UTYTnYJOfhnfWJDrmAxfJr104b2Rv5VQq+odykxQXCcfL
	ejhWgrKePwquj7GQCZR6SEqrf9CRuGoJFGxZdF4jrJaY4dp1zKiJlDje2vt+itYuO7t0CMQqpVD
	NUfmhXD+agZqwYjZ7Ek4s4tkRSZ0wO9v6n7SNoRI+ZEBS0MxeTpZakqKmtedr09dVkNiFR2JK6z
	ffg21oezLojj/OP/GsHtEI8kze1CkvXfX69T1hWE+E4A6gajZLzXU7QekTQgd+HfIMCdtANgDQX
	My6WXhew8+foGYcDCuVfwYaDVhH9RcP1+8xPfCmhnkP7FiNHVkQ88UNIEHWUKJheR8kZxZKVDEo
	GTXFmOh732/MY0cAPaL8oRk/VUdQbvlMtEl79zd07EFywRyoYNBHgpcCWandMaWoPltqDQsITYC
	rgg9BmCO1ZmlHxsJYjU+OE54Uilj2KxNXRANDqyZD1yXfz9g1ubwsb6WjHwi3DJaacNb6B1b8WL
	u8Rin0Z7QEYqa/fkdPnLhQvhZ1Ui/zBkq7Nm/GTf01mzbvxlOJNVgbgYfJYUiwVsMBwQEgk87gi
	H4kkNPJ4=
X-Received: by 2002:a17:906:9fd0:b0:c42:102f:15df with SMTP id a640c23a62f3a-c5096346e89mr133898666b.8.1794557797957;
        Fri, 13 Nov 2026 00:16:37 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4214fsm65243866b.35.2026.11.13.00.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:16:37 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Wire up LCDB regulator on Fairphone 3 & Fairphone 4
Date: Fri, 13 Nov 2026 09:16:34 +0100
Message-Id: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02PQW7DIBBFr4JYdyIP2NRGVdV7VFkAnrY0gF0gV
 qood69jZ9Hlk/7/b+bKC2VPhWt25ZkWX/yUVsAnxt2XSZ8EflyZi0YoRJQQ3GiBkrGBIqUKyip
 6bmVvBzHwtTVn+vCXbfH9uHM5229y9T7zSGT6Oa+qusd4pFLMptLsZTc1gxDYdvKgul6iAoTFh
 LfZuBPVenDTFF75/xs123oNtlBij10Doy9zML/gTB6BWknU2aZ3CvUi7lVrCoGbYvRVs0SXCo8
 fBT/ebn955r9HGQEAAA==
X-Change-ID: 20261113-lcdb-enablement-6b6e7438b929
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794557797; l=2210;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZtGX8N9MTzVFwe7Y01QGBCSDH0pFtGps76E3FzM9X84=;
 b=NLb2RlhXIJXbUXS+lt2QrOjap3pkmIn6+VG7gBNj3PB2KW82jhdRUl5WQ2hdKyuN4oJM38ZSu
 sOl/tLZNusiBjXov+zTiLlbTob8w0tbb6TFZhmeDghRHV+YsU+56feb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Thanks to Dmitry Baryshkov for upstreaming the LCDB driver, let's start
replacing the dummy regulator-fixed in Fairphone 3 and Fairphone 4 dts
files.

On top of linux-next this series depends on these two patches:

  dt-bindings: mfd: qcom,spmi-pmic: add LCDB
  arm64: dts: qcom: pmi632: Add LCDB regulator node

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      arm64: defconfig: Enable Qualcomm LCDB regulator
      arm64: dts: qcom: sdm632-fairphone-fp3: Wire up PMI632 LCDB
      arm64: dts: qcom: pm6150l: add LCDB regulators
      arm64: dts: qcom: sm7225-fairphone-fp4: Wire up PM6150L LCDB

 arch/arm64/boot/dts/qcom/pm6150l.dtsi             | 14 ++++++++++++
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 26 ++++++++++++++---------
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++---------
 arch/arm64/configs/defconfig                      |  1 +
 4 files changed, 47 insertions(+), 20 deletions(-)
---
base-commit: 161837d37055642b03475137461d4438c65dbddf
change-id: 20261113-lcdb-enablement-6b6e7438b929
prerequisite-message-id: <20261109221453.658316-1-val@packett.cool>
prerequisite-patch-id: 84d9aa24bd2b6f02ff8ca2ee6c06aa15820a239d
prerequisite-patch-id: 83283c2786561b5b60886150044cd3c31c9ee9ee
prerequisite-patch-id: 44735c66f6ee898028d303e7c52199c6e9bf805d
prerequisite-patch-id: 465273bdb21128b91fa70ecccb67a46ad8b92e2d
prerequisite-patch-id: 87e1ba7499655a72820b61fd0a61e9b64a28d678
prerequisite-patch-id: 7a38824c3aedab41d9c2e8af53fd2ac6c5240467
prerequisite-change-id: 20261014-sm8150-display-card-e43ee5b08c61:v2
prerequisite-patch-id: 9c929d1d906b763951d1dbb6982d08a464fb27a8
prerequisite-patch-id: eb2335be5ef8557f58b829ae86bcd44ce4f942fb
prerequisite-patch-id: 2fb5cb31e9527f530afc1199450f4399cc9d696a
prerequisite-patch-id: 6604ef4253eeb0a71e69cc275f686d8acae95e36
prerequisite-patch-id: cda0e5a03ff6db8e7c05625c5aa2b8d0cb55923f
prerequisite-patch-id: af1e08086776ad9975fbe76d554d0176bd4ba70b
prerequisite-patch-id: eda808edb82735d47769c147ceaf21946f801a0e
prerequisite-patch-id: a3272820b7a6fb943a06f267566afe1ae97a56cf

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

