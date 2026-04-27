Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A4A30DD2F
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294000; cv=none; b=h1M9OE+MtpnFMsWji9SF5BRz+PovKpmaRVCqz90EVpyc1GxPGsVPbZDGL1kxmqIG9N1G3DdsedZxjXzDNTcAroCRgVJ4mHkspJbz0Hd37PhP9VNO1NshnpsqsM4FgmpQKLsKuMdY0fo0O69lFdJGnBqupEnIkxXfwxiofQU34fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294000; c=relaxed/simple;
	bh=V0JA11tC547dVjIXETBYVhT0ZhmrOZQRJ965d5IsRe0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f9R/FvSvraBacYmrk1j0IGfCYN3AJcXxF7mvmtm8W+Cpnj+BVR6BVtDAdt+BtNCtyuamg/c90Tp/h0oQJECVPfT8vJhTLhkod1l4Cy74xD90Yf9QgNY5w/aD+pocj85eCtENCBf+BLlSOjwf7ybn0EejpraAzo4u7p7fXHHtAmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FqneaEx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T6BzQESD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FqneaEx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T6BzQESD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T9T51762117
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m4HidIRDPD/ENeg1siawkt
	AX3FHiD1tFgd6YIKBm+ZI=; b=FqneaEx7FpYFgqOPMwzx93G7aQfGPdCil7J8jY
	lKuThXD/GdVUcGBBv6NjVR0gymCE9EfUQ1AkhFFNMgkeoj6y53sg53Q1J3quVxAO
	Az12chcitRfKXDcM1lkczMDVUUSoWrUQWeo2+DGnLPly9QIVV5gRGDfhS2t+iKtp
	DySAPotw18UFN9vxVZ5rUNrosJU6XaKIx7qfJMpW9nfJs7ruTm57lvymy5wBCFWx
	v2VT+0ESWovcfNw9XDH1ODJSm9vBlFfgU+pq6IWKnW4++rzyzMYC/cWEv5ubk6o0
	6jiUgsKBrcniRbLPt6Fql0LLI1P0M6UxPuW1iS35B9E5PWZw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9e3c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:36 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-953d479ea6eso12085601241.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777293996; x=1777898796; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m4HidIRDPD/ENeg1siawktAX3FHiD1tFgd6YIKBm+ZI=;
        b=T6BzQESD+YiNk6/JJU7TB8YSWWfXXq/YmkcGbXalFWqwwhQMIfIvp4f6kKa/wCtIsq
         jrNvur2veuwJWUPDWuGtnhOrYK+27rdf2wiKgYFU14gUelDe5+PS92MqI4Ym9hcjJQTP
         5ZpdGgnirlqNoDjubzi+lNPcYP8wWXMYaHWIwKyEGr2/LxuvYKLyCe1XI/y1Y/EoJCtZ
         MqTIefSHk4YxXmxvhqzo7qMT4nhhYaGySIFMNLH6MMMhBR7IF5fuwSXC4SVHrSRkaCNH
         cOCn12GSpsybdNcONb1yQGLmOzIu4q0+FDxq4VoRiDIVAFnSB7laa9QIUhOhudWhJgII
         f/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777293996; x=1777898796;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4HidIRDPD/ENeg1siawktAX3FHiD1tFgd6YIKBm+ZI=;
        b=s8EPZVOAcspFq84mToOR6TGjHjNkrW8GtjOIrbPTxOMmbonpNwIX91Ykpl/5X2gEN+
         IhWmkh2VzlmIwDFdOuc9Kgq74J0YaCvtQr6mCy/ex/jcG82g9Vgi1gSbHwbDR6qavski
         fpkwf2h3Lwl1mBcM3XmgRL3H2vN7gK4j94mVNxQdIa9LOJ5kWuMff9MhZaalBxgHpx5J
         5N7GKSXLWclsPdNqLmdGrgOItbUawx6og6fpDGELnudgdO19ImLQSWz+YmICahJYYoeq
         pqQ2OgPLYDpC0/++jiw84syiJNwp3PhlOmMkWSVIblfeEBeAi9eAT1Gi8d2Bu1KeWeLR
         jNBw==
X-Forwarded-Encrypted: i=1; AFNElJ9ve4YFj9UeinoiIWz9cSNWO8umlGQXCifqu9bFvKUiWXrxEh02rcI4dT7XRjrDkfUDUn099SeiIp35@vger.kernel.org
X-Gm-Message-State: AOJu0YyhJ4U8LqhhYSSYb+FkJqcFdDyTqndGrDV/KyrbNsRkgoKRPUuz
	Rrvem/ml6obRresmYPKQeHwq1xXgHJd11h8MLMvy37z5RF7VL2p78mlAHRpI4yZHPjuE8NnDQce
	io/NvstAT0iDdoju8FgkJfOl80f1vCeJq61kO1mU1uy2b0Qq1T9oT25WLzsFUwjSI
X-Gm-Gg: AeBDievOnts167CJbjSOeRigRK3w/acB1yGfgXQXc48vm8/vqTFao2iR/cFxR0Zpbss
	7NzdxBBXqHP23nfe/HxfTz7B2emS92K696NSLS/jpPJm9F9v0ZnIzUYCA9bH+cVizMCktLNX9Zq
	/2SKQJcKIz3JNMCWOfFOBxcHA28ThDL+QvHBO1Bg5h/eL8Xw/Dhc03YbscOtpvQiAzhaTKIQCWs
	TeSo+Fpzrsq/olmQ32sqpvATAcPihYfua0kewqsxkxbPHBln4R3H4soby+iniQ3aLCCma0eCHZ4
	ZS7yXd9g8/39OoocB/HzJe+WjEk5gotgJaVkUEFIP4VrKMN0LsbX1IzFtpCaK/Ywgw9Mj4KD/JB
	BIrshL+A+2B8ceQwsEXfj0O33k+e4mfEoOBSPfkFz9sUFu0PvO7AxDjtIo3Ou3pGkYpO/rYwgBy
	JzBQhvWOfEGsUBS/OX+2QIghquyQQ=
X-Received: by 2002:a05:6102:41a6:b0:60f:c9ba:b992 with SMTP id ada2fe7eead31-616f68d760dmr22047571137.16.1777293995644;
        Mon, 27 Apr 2026 05:46:35 -0700 (PDT)
X-Received: by 2002:a05:6102:41a6:b0:60f:c9ba:b992 with SMTP id ada2fe7eead31-616f68d760dmr22047540137.16.1777293995204;
        Mon, 27 Apr 2026 05:46:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 00/14] media: qcom: camss: CAMSS Offline Processing
 Engine support
Date: Mon, 27 Apr 2026 14:43:27 +0200
Message-Id: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAO9Z72kC/0XMQQrCMBCF4atI1k5opk0rrryHuIjpxA40TcxYE
 UrvbnDj5sG3eP+mhAqTqPNhU4XeLJyWCjwelJ/c8iDgsVphg33T4QDeRRFgyZAyQXe3gw2BPNK
 o6icXCvz59a636lBShNdUyP0rLbYG7Qk7jcb0xoKBObHXOa2z4+WSRPRzdbNPMeo6at+/c2qcU
 qcAAAA=
X-Change-ID: 20260427-camss-isp-ope-4b575ffec2ed
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: DIUTaSyfOnRfCA7GbGnB9r89UgMzg-d_
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ef5aac cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=MYo6ArsnHSpCJc-KhkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfXzEuh4SymAC3t
 wBx5xkrRTozGyxsblkFKVb9/+KIOgVVqeyjT6+Kz1l4otMgrzfPM0G2vtfWjKJ0rEcFZulqmCFx
 0l3iUdI+rAHLElD37o6CPCGD13LApHhskQ2abJSD8YnbBDAiAJ6HDAr/qFsrmhiPBYkgGEms9rO
 IduXA6aSUflkMxdvKCcZrE0MwFiTpKMtbJ8fkmTdGcRmtL/MuqgTb8zqBTRN9uFHIMLZ4DfIZif
 wUEkHiOatR/BdRTUCjeutJUH/VYBzBK+Y0UdbweLwsImilqfQbHGVdC7YLo7URj4S7sQZzsDwXJ
 jfltNADeNovzCFmHNHQqMpeKERDgrkNkb7+nXgA8lSDk83LlB7ZzrCPHFaKMeukIpin3yZHhvfy
 w+AuHwKjy82GVFz4bwf90VeVej3eLWzDBuXpXO32J8fS8Y5/Kfx2ov7qvkR+ibkbTROZZuOi2C7
 tWUlE0vLDK8w20t2VqQ==
X-Proofpoint-ORIG-GUID: DIUTaSyfOnRfCA7GbGnB9r89UgMzg-d_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135

This series introduces support for the Qualcomm CAMSS Offline Processing
Engine (OPE), as found on Agatti-based platforms. Boards such as Arduino
UNO-Q use this SoC family and will benefit from hardware-assisted image
processing enabled by this work.

This represents the first step toward enabling image processing beyond
raw capture on Qualcomm platforms by using hardware blocks for
operations such as debayering, color correction, and scaling.

The OPE sits outside the live capture pipeline. It operates on frames
fetched from system memory and writes processed results back to memory.
Because of this design, the OPE is not tied to any specific capture
interface: frames may come from CAMSS RDI or PIX paths, or from any
other producer capable of providing memory-backed buffers.

The hardware can sustain up to 580 megapixels per second, which is
sufficient to process a 9MPix (4K) stream at 60 fps or to handle
four parallel 2MPix (HD) streams at 60 fps.

In order to enable reuse across future CAMSS ISP implementations,
a new camss-isp-common module is introduced, providing common
helpers for:
- buffer queue management
- job scheduling
- pipeline construction
- parameter parsing

While currently tailored for CAMSS ISP drivers, these helpers are
designed in a way that allows further generalization and extension
into the V4L2 ISP framework.

The driver is designed to support multiple processing contexts. At
present, however, only a single context is instantiated, which is
created on the first media‑pipeline open.
This keeps the implementation simple while ensuring the design is
ready for forthcoming multi‑context support at the V4L2/media
framework level.

Since the OPE is a child node of the CAMSS device, the CAMSS driver
is reworked to properly share and manage power‑related resources,
including power domains and common clocks.

Graph:
frame-input --+
              +--> proc --> frame-output
params -------+

Compliance: v4l2-compliance has been executed without any error on
the media and video devices.

Testing: A camss-isp-m2m tool is available at
https://github.com/loicpoulain/camss-isp-m2m-test
The tool can be used to exercise and stress‑test the OPE engine,
as well as to observe performance and latency behavior under
various operating conditions (resolution, format, buf count, etc).

./camss-isp-m2m -s 3840x2160  -n 5

  Name                            Device            Dir       Type
  --------------------------------------------------------------
  frame-input                     /dev/video10      output    video
  frame-output                    /dev/video11      capture   video
  params                          /dev/video12      output    meta

Test: 3840x2160 RGGB -> 3840x2160 NV12  [5 frames]
  Input   /dev/video10  3840x2160 RGGB  bpl=3840  size=8294400
  Output  /dev/video11  3840x2160 NV12  bpl=5760  size=12441600

Buffers:
  /dev/video10    buf[0]  offset=0x00000000  length=8294400   VA=0xffffbcb87000
  /dev/video11    buf[0]  offset=0x00000000  length=12441600  VA=0xffffbbfa9000

Streaming  5 frames...
  seq=0      buf: in=0 out=0   14.833 ms  (67.4 fps)
  seq=1      buf: in=0 out=0   14.874 ms  (67.2 fps)
  seq=2      buf: in=0 out=0   14.902 ms  (67.1 fps)
  seq=3      buf: in=0 out=0   14.960 ms  (66.8 fps)
  seq=4      buf: in=0 out=0   14.896 ms  (67.1 fps)

Changes in V2:
- Not an RFC anymore
- Move from v4l2-m2m to multi-devices design
- Support for parameters
- Helpers for pipeline, job scheduling, buf-queues
- OPE as a child node of CAMSS

---
Bryan O'Donoghue (1):
      media: qcom: camss: Add support to populate sub-devices

Loic Poulain (13):
      media: qcom: camss: Add PM clock support and integrate with runtime PM
      media: qcom: camss: Add PM clock definitions for QCM2290
      media: qcom: camss: Drop top_ahb/axi from QCM2290 subdevice clocks
      media: qcom: camss: Add camss-isp-bufq helper
      media: qcom: camss: Add camss-isp-sched helper
      media: qcom: camss: Add camss-isp-pipeline helper
      media: qcom-camss: Add image formats for Qualcomm CAMSS parameters buffer
      media: qcom: camss: Add camss-isp-params helper
      dt-bindings: media: qcom: Add CAMSS Offline Processing Engine (OPE)
      dt-bindings: media: qcom,qcm2290-camss: Add OPE ISP subnode
      media: uapi: Add CAMSS ISP configuration definition
      media: qcom: camss: Add CAMSS Offline Processing Engine driver
      arm64: dts: qcom: agatti: Add OPE node

 .../bindings/media/qcom,qcm2290-camss-ope.yaml     |  131 ++
 .../bindings/media/qcom,qcm2290-camss.yaml         |   13 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   71 +
 drivers/media/platform/qcom/camss/Kconfig          |   32 +
 drivers/media/platform/qcom/camss/Makefile         |   11 +
 drivers/media/platform/qcom/camss/camss-isp-bufq.c |  101 +
 drivers/media/platform/qcom/camss/camss-isp-bufq.h |   85 +
 drivers/media/platform/qcom/camss/camss-isp-ope.c  | 2466 ++++++++++++++++++++
 .../media/platform/qcom/camss/camss-isp-params.c   |   67 +
 .../media/platform/qcom/camss/camss-isp-params.h   |   62 +
 .../media/platform/qcom/camss/camss-isp-pipeline.c |  361 +++
 .../media/platform/qcom/camss/camss-isp-pipeline.h |  228 ++
 .../media/platform/qcom/camss/camss-isp-sched.c    |  223 ++
 .../media/platform/qcom/camss/camss-isp-sched.h    |  174 ++
 drivers/media/platform/qcom/camss/camss.c          |   80 +-
 drivers/media/platform/qcom/camss/camss.h          |    6 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 include/uapi/linux/camss-config.h                  |  118 +
 include/uapi/linux/videodev2.h                     |    3 +
 19 files changed, 4217 insertions(+), 16 deletions(-)
---
base-commit: 143efe4d18f3e221bf6e9c6476296b3dd53de032
change-id: 20260427-camss-isp-ope-4b575ffec2ed

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

