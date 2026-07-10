Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4F33D5252
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674298; cv=none; b=o2W4RbHJ6+nTbfCU2gQ16sQR8Qs0FdyHrdAzfi2MOJWPDCDgqHoAqA9toq3O2JRn4HtURPs+u/3WUqM/eCYI1lRvQR7OxnkVe5SwEFGMykBUBVd+u35ahVduBMRgEbVu/uun1cjomAzHFquJXC5E5dMOsxP/pOwZUcDqD6nF1VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674298; c=relaxed/simple;
	bh=sgYRHAA8IdQaPOz1SqFrkChGOlRvTarETIwlza+HfrI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VDkV9MxAoQKOUBKAbWilHfz5A2tkka8Uzzo30MMbjU9OVXiViOlE4kl4DZYZA40z2ScBI2TMrtyaUMn7oxNVabbo0ybbOWSytPqK73kV853AvbrW6wdVzDRio5iXyRIuV3BnKx2HSFij+x828D6Ekv5MqnkVYWBpaN5dqdslXs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3MmdWAs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ute0qQLN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3MmdWAs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ute0qQLN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7eKka190764
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9eRQdmSTaAB/jSbenBeTeY
	iG0btcLXCQgf9ZqLqJf4g=; b=B3MmdWAsxNYGp6MsDkHYeUQ8iWE15BPpr10nAz
	NeABU9A/4zdNODEZw3tdHNzLuOirk7Zb/belrwdQLo0FKWPNGX9BvaUM9zk3xI7j
	+HAUeZTSupijZnTphXR+mo5Y0stXLSeTSa1xGNYFVR/Zl+Hmfsv0tS1f0lXWZFrH
	x2H5b3Fa3H4sfRFjMVxHXHQZjTlLY9CZI/0m0xdv6UGAS6eB3Q/9Z1PV2h0Far5i
	uBvgY8PZ9BbauFTT8Zf9zs9eMkhqTJEMjFxdYqZtycanPEN4OxbNlfyuLaxjSKwd
	2lAYjUBeZBGX8uiVVlwUawoI6v9YEP14kfbAr5PvbcReyvVw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n14aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:04:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c075c1e25so5280731cf.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783674294; x=1784279094; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9eRQdmSTaAB/jSbenBeTeYiG0btcLXCQgf9ZqLqJf4g=;
        b=Ute0qQLN8BSElBORaH8BiK4p6FFNNdRM5S/htBrXuvcrR85Auzws86BJEi60VeBb11
         8GKc7GcwdVAE91YEm8+QWRxvO0aHrguBVCE/J/TOHzJewsLl5nZQrUVR3T+6XooV/Hvj
         XxGJxv7LZx5x8Q0U0Nk188n26EjFW08hItSJJOeTWJQ2481aavNL+2CpFp/1VXUIywbA
         UZwbBUedyj47dzd+WaqeVUE/4Q9PiEz3AAeT2eBB50cBo9uKRfWfIK0T0xkNGuEKdAl0
         cVluuhRUSU8YErLQ86AbkV6XilFvg1TCVnm9DZb1giflGvLWO1VEnqShoY2pFFPZacTf
         rr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674294; x=1784279094;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9eRQdmSTaAB/jSbenBeTeYiG0btcLXCQgf9ZqLqJf4g=;
        b=SYHL6CZ0LBaNmXCgh+prY6ebXl6ruzDIaeU9TNsr3EAs+zd5ZonZBayMD/MYptGLRq
         NGl42ZQWCkk4qKSLCh3q+HKKtO/ZHPXAQNgwE1Tk+zpYCg5uxkGtZB/yS9Chj/Cvp7q1
         pzbmxUeElzxKEYdRsHKhQe4tdO1Ew/iM37N2MOYsdnwltKt0Lmp9URjUcTpk3yLUlnb2
         mrvn+iCKyk7nrAK4ROa60bkqqZ0HvU9AHeQSU8l2djTr7TNnin8KEiu2pxb3MZPwLz6X
         OjZD29v76Sf/bfnTswdWjnVDL3SefzkfBuF+lRxSU7/AbS5dzpJBf6cWpKkFtMG+NWKN
         lRZA==
X-Forwarded-Encrypted: i=1; AHgh+RpIWdfU/U47QlhxwqpNCH5/PApaoRG4F/hB5SRvMAi0SvA8XmaLs90W27/O8iwIX1o3MbgAH65Tbzi2@vger.kernel.org
X-Gm-Message-State: AOJu0YyVgArNXymElnWqn5w6Ik2lBbcezzRTikkGGGtZvgSFBkRkM0JP
	kjlO90Y88vdox97SfHqsffnUqaCF/GCB+cxwa7g8kSFIC1M7585zDrgwS/Ga6HTxhJ5y0MWNHa3
	XonvEy4NGfotx9PewZQKLYm786hOitTIJ3qHoSJplea0y6zb9r3fsAk4d5qYpzN/c1AnAKxn9W8
	0=
X-Gm-Gg: AfdE7cnat7Tk1CH4gonioq/HIJj3AikpCiPjbU+SjIk0SyuGRGg3w74Wrr/wgDrKihJ
	0UwWcW+StTDhlDjYd5JKUF/BCx7RVMQKAKc8u7XFoDw5EkrRuylyPsL05mTc2ENzdunkg5GgIZe
	YzXx0SVsCgWGus1VqipcIeApbiEfmw4SqZuM72JC/PGeNxBvQwdedon+3jC7ss7vsX/xxUbe9sV
	TzmG3/23Kf4nBvw8gGHQ+Xbozo6QLxvdydkQtx9UqDCaJdsaBGYVVX8wX8CvWWowliGv6dcd47L
	JFIGi3TlmoZm2pv8TooXOuMqQKVxNzBe9/XYaD5VSKbQyzE8ODWL6+LWkwzlN0zd8EKGQywt8EB
	SsRjksj3X/SNC3Zfe6z5ekgp0wPIrQIB6tc9nTYtUIqViF9CW8BeYjCtfWoUV6GT79Dl0Dswwqc
	ym6Oo6LQOKHCb6JMqczjp9k4olZ2zb/eIpS9J+P8fCBNIwiCUu/3e2fEe5ZgmzBg==
X-Received: by 2002:a05:622a:294:b0:51a:8c9c:7f3f with SMTP id d75a77b69052e-51c8b4fc799mr127639671cf.66.1783674294509;
        Fri, 10 Jul 2026 02:04:54 -0700 (PDT)
X-Received: by 2002:a05:622a:294:b0:51a:8c9c:7f3f with SMTP id d75a77b69052e-51c8b4fc799mr127639281cf.66.1783674294034;
        Fri, 10 Jul 2026 02:04:54 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm259932266b.36.2026.07.10.02.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:04:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 0/7] media: qcom: camss: CAMSS Offline Processing Engine
 support
Date: Fri, 10 Jul 2026 11:04:46 +0200
Message-Id: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK61UGoC/2XOMQ7CMAwF0KugzLhK3IQiJu6BGNLgUkttU+JSg
 VDvToABCRZLf/D7/6GEEpOo3eqhEs0sHIcc7HqlQuuHMwGfclaocaMtVhB8LwIsI8SRwNauck1
 DAemk8s+YqOHb2zscc25S7GFqE/mvUmJp0G3RFmjMxjgw0EUOxRivnedhH0WKy9V3IfZ9kc/Lb
 VmmmO7vmXP50j+W09ufRXMJGuraaOewsrnt3zsuy/IEiwRSlvkAAAA=
X-Change-ID: 20260427-camss-isp-ope-4b575ffec2ed
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX+fOMTBY5PA7o
 CEy2G2xEPL3c2Ze4lmVIYhV+YFrapXYdIUWq3+u25jjdDHFqj1YgJfHvoG4tAzWMyob7txcxJad
 Vsj0Jr68yh5VSsbR48KSsd0sPm+JTc8=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a50b5b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oJE8aRnLwfUkw7FiLPAA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: nX8fCmKyUrMpmq-GlCvflg2pW7YMyVXR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfXwdUPgXSvR1gK
 HxB+pJw8UXkPoH9LnMdZ0a9GbMKO7ZGMcSWYkuqdijY60yoM+3cJb2PgKc2IUWsGOG3wq3lX0lD
 SqS4mHu7aKSNOxbIoxx1iXEmeVjN8FN1RAQV5V9Og8jUtezeIi+jrgmg8JzALqkxHviUNSnCqI9
 sdOMCwHUVhv6gO+xhdOq8OgSH4oSvKOfv+uEBwONNz1loWmht6ThSe/h0SUO/+aamubcKFut1wZ
 E2MBplir/Y3utw2/yzwd+Pu93tjTApREY87O0iPa/NKvRr/whw/52Y57jm2LCa/CivNF7po+T8/
 IbX+1jMgdMeUhvOTxwWktL2m7QizZP1M245PIr9bY/RS2ZQLyWRSbbFSbctuiVAttIbS5XdyP86
 9WO29n/WVDtPtvfjQu5tL+H751SZ+bO63sZGcBSLN94EGyzWEKnpwlXRvwDFWf7ZD+iGDvz31Rn
 zsWi+LYnZ9fuqAoBCZg==
X-Proofpoint-GUID: nX8fCmKyUrMpmq-GlCvflg2pW7YMyVXR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100088

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

The driver is designed to support multiple processing contexts. At
present, however, only a single context is instantiated, which is
created on the first media-pipeline open. This keeps the implementation
simple while ensuring the design is ready for forthcoming multi-context
support at the V4L2/media framework level.

The OPE is a standalone device, independent from the CAMSS device. It
manages its own clocks and power domains (CAMSS GDSC and CX), and does
not require any change to the core CAMSS driver.

Graph:
ope_input ----+
              +--> ope_proc --> ope_disp --> ope_disp_output
ope_params ---+

Compliance: v4l2-compliance has been executed without any error on
the media and video devices.

Testing: A camss-isp-m2m tool is available at
https://github.com/loicpoulain/camss-isp-m2m-test
The tool can be used to exercise and stress-test the OPE engine,
as well as to observe performance and latency behavior under
various operating conditions (resolution, format, buf count, etc).

./camss-isp-m2m -s 3840x2160 -n 5

  Name                            Device            Dir       Type
  --------------------------------------------------------------
  ope_input                       /dev/video10      output    video
  ope_params                      /dev/video11      output    meta
  ope_disp_output                 /dev/video12      capture   video
  ope_proc                        /dev/v4l-subdev13  -        subdev
  ope_disp                        /dev/v4l-subdev14  -        subdev

Test: 3840x2160 RGGB -> 3840x2160 NV12  [5 frames]
  Input   /dev/video10  3840x2160 RGGB  bpl=3840  size=8294400
  Output  /dev/video12  3840x2160 NV12  bpl=5760  size=12441600

Buffers:
  /dev/video10    buf[0]  offset=0x00000000  length=8294400   VA=0xffffbcb87000
  /dev/video11    buf[0]  offset=0x00000000  length=12441600  VA=0xffffbbfa9000

Streaming  5 frames...
  seq=0      buf: in=0 out=0   14.833 ms  (67.4 fps)
  seq=1      buf: in=0 out=0   14.874 ms  (67.2 fps)
  seq=2      buf: in=0 out=0   14.902 ms  (67.1 fps)
  seq=3      buf: in=0 out=0   14.960 ms  (66.8 fps)
  seq=4      buf: in=0 out=0   14.896 ms  (67.1 fps)

Changes in v4:
- Made OPE a standalone device again, sibling of CAMSS rather than
  a child node, following maintainer feedback (Bryan)
- Aligned params with ones suggested by Bryan (when possible) (Bryan)
- Correct usage of subdevice states for configuration (Hans)
- Removed the bufq and scheduling helpers (now in ope driver) (Bryan)
- Moved generic pipeline and params helpers to camms 'core'
- Fixed Green hue with some downscaling factors (reported by Hans)
- Fixed ope_enum_fmt_vid_cap (Hans)
- don't hardcode DT assigned-clock-rates for AXI (Konrad)
- Link to v3: https://lore.kernel.org/all/20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com

Changes in v3:
- Simplified camss_init_pm_clks()- no clk_get, no rate setting;
- Added Assigned clock rate in devicetree for CAMSS AXI clock
- Add Kernel Doc for camss-isp-bufq exported functions
- Added description explaining the 2-cell for CAMSS bus
- Reworked OPE media topology with intermediate ope_disp subdev
- Support for crop and compose in ope_proc sink/source
- Fixed Write Engine violation with some scaling config
- Fixed input/output custom-stride issue (Hans)
- Split uapi header (camss-config.h) into its own dedicated commit
- Patch reordering to respect dependency in regards to ABI/dt-bindings introduction
- Link to v2: https://lore.kernel.org/r/20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com

Changes in v2:
- Not an RFC anymore
- Move from v4l2-m2m to multi-devices design
- Support for parameters
- Helpers for pipeline, job scheduling, buf-queues
- OPE as a child node of CAMSS

---
Loic Poulain (7):
      media: qcom: camss: Add camss-pipeline helper
      media: qcom: camss: Add camss-params helper
      media: qcom: camss: Add V4L2 meta format for CAMSS ISP parameters
      dt-bindings: media: qcom: Add CAMSS Offline Processing Engine (OPE)
      media: uapi: Add CAMSS ISP configuration definition
      media: qcom: camss: Add CAMSS Offline Processing Engine driver
      arm64: dts: qcom: agatti: Add OPE node

 .../bindings/media/qcom,qcm2290-camss-ope.yaml     |  147 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   74 +
 drivers/media/platform/qcom/camss/Kconfig          |   18 +
 drivers/media/platform/qcom/camss/Makefile         |    6 +
 drivers/media/platform/qcom/camss/camss-ope.c      | 3245 ++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-params.c   |   67 +
 drivers/media/platform/qcom/camss/camss-params.h   |   62 +
 drivers/media/platform/qcom/camss/camss-pipeline.c |  386 +++
 drivers/media/platform/qcom/camss/camss-pipeline.h |  232 ++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    3 +
 include/uapi/linux/camss-config.h                  |  161 +
 include/uapi/linux/videodev2.h                     |    3 +
 12 files changed, 4404 insertions(+)
---
base-commit: 6b0fbf4352615cc5e542347120f1724ce31837f8
change-id: 20260427-camss-isp-ope-4b575ffec2ed

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

