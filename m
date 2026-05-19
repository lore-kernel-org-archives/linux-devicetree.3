Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC843F9A04
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210897; cv=none; b=meu54gcbdMbC3bL1oFE2db7INrv9uwURW24lAyL5JqPFBY7a04uGI5lS2o0kURfFXewvFpeOtBP1R6XAeA4vwmRchnrk1vsWzCoLzgIQd+qEkfyzYYudHpIbS/qCz1qB5i15MFejY/goqV99WE2t+btsEP87AhyQSnafETA6jzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210897; c=relaxed/simple;
	bh=AzdLA1TzAsCzuU/MBrnUw/9CewP7MVdZCq9MNreNRZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vAR0xWCVxwznNrUOIgCE5ldlhJB2FSZfui4Gfp4MuNfTupZ8bZzhlB11UouMAd4TBGiRB2g8uZnQi/9HvxRIJkVrWzBH5xyGxyW8BweA0Z0XzbwnqTynYX4lHgVJAkxXgw2Tv8gVBckrP2If7J00D9tG3eYsAZtCjuLMjNnOSxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVXwd0la; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eew13V1y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVXwd0la";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eew13V1y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExJvj1237939
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=661ATbGkgPTBuBK5BhuwWyi11aQQCSuMWmT
	9eAVX2m8=; b=cVXwd0laNlE4IczR/FTlPsfYT9724UXYSdRk3UjoXLPXo58rzaJ
	ZEoTIYxi/Mjgp7Sr0YAYZ+BvEDhLds++XmpnkC8r3nTKU1W5qVZX9CIa8izFtzXm
	tsPmn9rT17iuz2ALDbmF6pmf62hjW6DhOGv7xi6X2Y3d5rij6R/RK9LiqQMKzccQ
	ftsxosw//NdqQwQBBoC6sT8s7p1YUumIza5hk9pnx3/nGQeR3WIsuAWszB8GgyAp
	I6a4P7K1dtESzhK/WQWvwONX9/gFm95VchAawUU+Ej/xpg3Tsjb1BAjnNx5Trvf0
	LqWeMaXFsJI9oUl4p+4ND1tQ39hViLN9qxw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3srmbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 17:14:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso2387954b3a.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779210894; x=1779815694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=661ATbGkgPTBuBK5BhuwWyi11aQQCSuMWmT9eAVX2m8=;
        b=eew13V1yFyEwBbLieJI4aKe+oacB4w+S24ptAs3JOL6Un49pgcOiHTFbEOozJV5t2l
         yMNRfvv4wOA3csG6gh9v3z1MjNq/Xy8YzOH2ielPVzl59h6+UoBthcKFU91lkZTqnq28
         Hf4ENBazPb92gQntHY6NONZ6qyWD+gnVRaFXXPmsMmbPvdcp88IZeVWLOgCv23vk0hh9
         ajh91Nb637+Au7KhH56BcsDUjRXNFNxVrv0jyWDRYzypeZjJK1T7WJW0N8tOoHiTaiNo
         y+6Ov59a5Y1f5TD+vLmAeOh80v/CFPUzMf8QxVq5yrl/V5Q1RluHsm0O3wpIy+om6p2I
         gT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210894; x=1779815694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=661ATbGkgPTBuBK5BhuwWyi11aQQCSuMWmT9eAVX2m8=;
        b=bg9bmyOf6pfYqybfpSSGhg2QPer0kKUTB4EG0GJBPX30dPVqo8MIwioLNWuat9Gg/Q
         6MVqLhlHPQDd3Fi+AkjoWdxexacp4IHjSvtMBfDJwTr03qYY4VEKr16fM5S3ytZZSQuq
         hdkRStqv6s0KBF4GUsa8ooGXw8EUpWjH0ECY45Oz1rXdGtxb6zS3e+9kZ8uFe0K9sMbt
         zGMdMyyIfrHhCgwyilFUAf7I3DTtWYt8bufZ7tz7oCv4b74s4w6avYa6Ot3zIy4BIHdK
         KCz8TAP0T6ibeNaa4lMuKm+4J+H8H1DxncPDc7Qc4x9l5jfQr8VQelL+SDdcht5yR85S
         5Bgg==
X-Forwarded-Encrypted: i=1; AFNElJ96ucQVDHVYCb3HXZvYIXuHSu9FD5AJiHG3esfgCAwVN2wBne6sgpwTZvyQgOCVYLJb4OfctGfU5yWT@vger.kernel.org
X-Gm-Message-State: AOJu0YxJZEe9gjfsxbzTHZhd5OB04Xdh/KMxO773r6CQELI1GRXtBwD3
	G1OqSxfIZy4Eod3yBtd/CjtfSIdItYzWtV6gppHzSDCA4NZfjOTqptXMXeLwa1LJGLZyzuWB3ib
	QeXlm2ijQb2gQp6t+r26s4eCW2tMBYni4AT5Q0bpEm9ajYpFG7H9FnbXm0hHWlVwa
X-Gm-Gg: Acq92OFAEgWqTm47EsAtvyvxwNQjm564GTiLfHGnzgkzHgk4h8/ptplED07ZsfY/snr
	CQM7nlFnF5Izxtp1e6EzEk/pxFBp3M2zaZYBd9M7dVoXMWKNqCfqDX3dFWpHPqI9MvAXIgAxD5C
	03nipqRUPVpGvzjd8KPAMyLAhxEUQaTidx0QVi6xD2R4U4c5C5j/wRfIsaDgGiB3UwNGXw71BXH
	tWN7mzPgEIw7QkUJRsSgEQiQD2Cq+5E8OqyIH28mffOER4FG6DHiZ7SxvfB3IL1VFsX+XaMHesZ
	n6hqchsV6bC8/AsS8A/IWpLsAYxdQY9rKmXAdv3sb0cQekzYwKh5VkWDWpMUaAPahLLhyktXKbz
	iGby63rK7DIwMO+Vz9BlrMAyQjhyNVdAG+s98xh+BvpXTyi41
X-Received: by 2002:a05:6a00:130f:b0:81f:852b:a925 with SMTP id d2e1a72fcca58-83f33c54896mr19200026b3a.1.1779210893965;
        Tue, 19 May 2026 10:14:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:130f:b0:81f:852b:a925 with SMTP id d2e1a72fcca58-83f33c54896mr19199988b3a.1.1779210893254;
        Tue, 19 May 2026 10:14:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c77822sm18634720b3a.41.2026.05.19.10.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:14:52 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/4] firmware: qcom: scm: Add minidump SRAM destination support
Date: Tue, 19 May 2026 22:44:38 +0530
Message-ID: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LFg7_-2cGyC-n8jk6O1weratPHi3j6po
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE3MiBTYWx0ZWRfXwXv+Oeuu5Qtv
 +/RfsaD9WULreA0hNmks2eNTLOs+y3Sx1vNujtM2OEjMViGAc7YiHnthPHDIrb9ftxIdGGan+6A
 1FNpGlHpFQhaZLW8oUga+BtOOFnKF66qXuyzFe8mimYKsWqC7KWkR5Hyd4ibtxnGE7GkgZYR1E/
 otSVAc7rx2JE1h3pqju5QzyUyLQxvcXeybpnR1uwmZhJ0CsObM4KpIwojoRJ1HXjHmQfw+8dqfz
 MFa+59kVndHyzyJB5m2leptSjMmMA2zaw0RFthUsbOJXhH1qwQoAoDvRQp/GQMEaMu1KTXeO4Tv
 pKpxxDHYhVmosV7XV9uYlbDVKrnT5H6BJgUj2tt7DlD0iQG/D+H2n02nySMgRxjx/SyOlQGqSE0
 P7o2ZaFM8BZxWnxeDuYqdhODqhm8etZzj7gN98ZXY/cxZMHw7rhYMBh8sDGkBPLiYOg7z4VvhUh
 hXrE7jatRUKlruXOrkg==
X-Proofpoint-ORIG-GUID: LFg7_-2cGyC-n8jk6O1weratPHi3j6po
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0c9a8e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Uf9RHLb8GrDHKnSoJrcA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190172

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
to deliver it (USB upload to a host, or save to local storage).

This series wires that mechanism into the SCM driver:

- The SRAM word location is described via a 'sram' phandle on the
  SCM DT node.

- Trivial change for consistency.

- A 'minidump_dest' module parameter (default: usb) selects the
  destination.  Custom kernel_param_ops expose it as the human-
  readable strings "usb" or "storage".

- Add the support for Kaanapali.

Changes in v2: https://lore.kernel.org/lkml/20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com/
 - Remove the restriction on the binding change done in v1.
 - Remove sram-name from binding.
 - sram definition is introduced and merged, so removed the refs from
   v1.
 - Minor change in the log as per comment s/find/get/
 - remove reference of sram-names
 - use minidump-sram instead of minidump-config.

Mukesh Ojha (4):
  dt-bindings: firmware: qcom,scm: Add minidump SRAM property
  firmware: qcom: scm: use dev_err_probe() for dload address failure
  firmware: qcom: scm: Add minidump SRAM support
  arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node

 .../bindings/firmware/qcom,scm.yaml           | 16 ++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi       |  5 +
 drivers/firmware/qcom/qcom_scm.c              | 94 ++++++++++++++++++-
 3 files changed, 114 insertions(+), 1 deletion(-)

-- 
2.53.0

