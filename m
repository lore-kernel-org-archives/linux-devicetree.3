Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C743E5591
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779221; cv=none; b=LRqlJs59CArst2S0lhlJ3srty2TNBinOhPpeK9UmP0yJlz9L3ql4m3pi58N6qS6l+jNflNIShxP7TZaw92rib3jc9ZnbHGqOGW6cXHgpZcd41HLzMTmFtjBGuBhydUz2hsXgXLddEnPEKy27tJpNdy/8YTiMicZwhkuefh6eZoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779221; c=relaxed/simple;
	bh=ihpkL87aG7aIhGJRkm4dEoEJiZ6G7Py9Yivq9Sh9gF8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aPtFzs19vGEtCWxqJtvmy8UtYRSu9vNF+uePmPkk+TTJexwX1EArB5Rg7K1gqPYZMsoNIxU6dFSCZZSCx1Gphs6TQTXQFP+SqV6ooamfiRAMOQhbPaPX9XQKk4MDaeqfO5yRm+QYnbmE3ftC2EFI/SiZ2fwgqHzLqDm66YWSJZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lmgp5c5+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QiQ8JB++; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lmgp5c5+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QiQ8JB++"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8DSXh3399793
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pM9xBqFe9sYAfq1yv6h1Rj
	0OIlwXkk9pwQuh19ZPqrI=; b=lmgp5c5+TNgrB2Ymq/KMYc7guVYEeRmeEkZBKD
	qVb3XfXp84+nI7z2WW6ev8Ryu3H5TWcRRjNg96qEnQaWQJDk4pBWqJsKTSocEhdm
	FSl0xYWCrou5lZpwDrWnnrMAWkhnS01hYFClR+sDKjHApZyyLzTaUNM44W7Yu3nO
	bJqMbQbfAKGoh2LJ7XROLcGxVbdHU/z+5CcjA9Ah3I3GpNTf+mBOOL95k0UEx/EA
	cE9HdWGwESU+9IIARw8+ZZMR0YmID0E75PQXFAB+SrySFu0EKfjb4ctbZkl1VUfF
	8lM12Suf0F2PqbULKT59pmzO6/qytzXbu6yiKU4WMZDFYybg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vk30kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:40:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8453031c567so538189b3a.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 03:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781779219; x=1782384019; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pM9xBqFe9sYAfq1yv6h1Rj0OIlwXkk9pwQuh19ZPqrI=;
        b=QiQ8JB++pVsBz9EN3HF4V7Xpv2H7Pr75UeV3YSb5C7koSNGJTC58+bjPA1gWMGg79i
         u6Drt/XfOjQgYB8rQP0/baAMrDtrfMCe0veSuBm0e1/NSVsYdioPTBVCD/rfYz53gIEV
         fe9n14lMFQJ3IfieJKKpPjtlCqJX53Oq1BI8BrNdNEkYtV+fZREpIerWl7ZTuvHnmoRa
         4ahN70n0hBOPaidmGwYekSH4QNA9KWRzZTuR6Z1JIAoS+BVdZCyeF9HxfPyr/vORmreI
         15Y8qlkvvtyOL1eojd/cz+Ofz5HA2xCzs6er6PaFQdjzIDg3VNV8bIoIyzMJLmpCPxgG
         jAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779219; x=1782384019;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pM9xBqFe9sYAfq1yv6h1Rj0OIlwXkk9pwQuh19ZPqrI=;
        b=nZeg+GcJUCwY0Hx/Ma/pKNOXtMnGgUyWrqT5mGCGcZF7pIWQXNr71rJaR9T0mcJbCL
         hT5xRmpA0DenZzd2vPHKsAuo9Pb+2XcLlK8lSXPS/5dFZDlw3vuvOnkS8eWqfUUaE2iv
         H7A+vyni2iW6mZc5Cf6tTdY+Bk6EB0SR64oONRldj6BA5uXoi99WQqI+VhFOulb2Wi6+
         J84dIXlEiu+N4wA6eYSqODELmhYqcrOVqWLvndvauYg/xY2F9yBBqPVrVv2MWi+ufw6c
         3+k0f8d0oJMphHNLnbOWrn3SUVqocaFQIh9eEp5X1F9WJ/YwjTqxuTFeSm9ALSxhSsyc
         Ctng==
X-Forwarded-Encrypted: i=1; AFNElJ8+S0GrFY0FUVnIbTJaUKZFYjM5r6vOvSbTSZRfcvHfjtQERfzGivh/V8Z02ZkAV4aQ/Ad+Eqhn3ASE@vger.kernel.org
X-Gm-Message-State: AOJu0YxWoeTmewhIBlIw7RO88ln61qhUG2kdKd9nsym8JTZcWRMZVjRn
	Da+WURsDHxn+UqqOuw4ff/FqNnwBdN1gBTJRmST8dlpZ0Jm0Dq3P/rUuBll7VtMoll/KMSHenfM
	0UVBiytlxBKO3OmxCBhfA++t8xGE6kdIkYMZ9cGu0aA0UjQafweWNv6226ftQ18PT
X-Gm-Gg: AfdE7ckJrZuiwBXpEzRIkU/KwBfHK8bnc6N6JvLYp5s9BQ/r1BaBu7SVwz+EsP4gyfQ
	CIUjDYCWN8DNM3hvD8QtAkD7uJ2tCrOeHUYoLUwCLmZdGU8WSKsPE1tLl+N1Koj0el8m2z0pnpq
	DD7FZw9tjjKowqqtxm9dsbxjao19/npk815s7CRUcTNXNYzaOyNx9VB7sFYx2DY9ztIjprblbb6
	LqSkiwOZZa4t4Js9o38s3721vC6O19Ojl7ZW3D6/ByWkRcru1ImVrgFo5DhpGyRCrRKKi56FTFT
	RUYGcfzNaE9KEfM/lI+/L08/3FhPHKV2hUNtHecZX90ia6txbymH96IP2tyejZxGWjIsDhXOKLk
	sxRNE0blg9PCZZdqp3W8cqc4kUs9PQYRUr3Mto2MbXvASSw==
X-Received: by 2002:a05:6a00:4009:b0:845:40b5:c4cc with SMTP id d2e1a72fcca58-84540b5d9b1mr2675132b3a.20.1781779218404;
        Thu, 18 Jun 2026 03:40:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:4009:b0:845:40b5:c4cc with SMTP id d2e1a72fcca58-84540b5d9b1mr2675081b3a.20.1781779217850;
        Thu, 18 Jun 2026 03:40:17 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm17254731b3a.45.2026.06.18.03.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:40:17 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v3 0/3] media: qcom: Add support for the iris codec on
 shikra
Date: Thu, 18 Jun 2026 16:09:53 +0530
Message-Id: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPnKM2oC/22P0WrEIBBFfyX4XJdxNDEJpfQ/SilqdCPbbLKaS
 MuSf6/J7kNL92XgDsyZc68k2uBtJG1xJcEmH/14zoE/FcT06ny01Hc5EwSsoIKGxt6fgvpI00J
 1KZAZ4CjBkHwwBev81w57e7/lYC9LZs63JdEqWmrGYfBzW6haSi4FL41TjAvXmM6Yqqm04lCDL
 JsOhHESN/RgY1S7TFs8313E3YV2Pk7G0OO05JkEBVojCMcAG87Y6xjj4bKoz+3vIY8Xssn1Ps5
 j+N6LJ7bbPeqYWMZxxVFrXuvs9Q+30xL+IjD8Q8BM0K6WmNuCYvYBYV3XHwiMSqaKAQAA
X-Change-ID: 20260609-shikra_vpu-b5421c03270c
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781779212; l=18257;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=ihpkL87aG7aIhGJRkm4dEoEJiZ6G7Py9Yivq9Sh9gF8=;
 b=GXcgVpBLG0OFV012e0ycJpzKUs6vHE0ECJas3Wd75kFguGEkHa/jQ2thY1ecFfO4P5vnyNWIi
 l4VQhvmCM09CBbpXR+aRkR8YENv2b2XZX8x1/otF3GVWv7Nx+QMHmiM
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: GCSEE_WQze4tMCuu6ILtmRVeft2-O0Ng
X-Authority-Analysis: v=2.4 cv=DNy/JSNb c=1 sm=1 tr=0 ts=6a33cb13 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7s1ES9sKXb6EmgU4USgA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: GCSEE_WQze4tMCuu6ILtmRVeft2-O0Ng
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX9PccVTZ+IWI7
 9O/nvSs7uybDW4Bh6s/sFPVAzXeM0XxZkH37OOBoyPXZUnlgOgDjooeYpIYWRP3xDHnjIkT+k7R
 Yd55GAcTv7yWPhwETkmH5d3fHnUWQ5U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX6B3Rn9xPcqsm
 q0Ypw1U5egPqXb95AedJ/h5tRFXN5vOcJV7pS49erBo+B1gK4qk2Oxu4qszB1+WEDes3EKfoe4M
 53vtX2U6XrrGOx1LB8M5Uhz8xjDGOWKp4h1QkOGD1qRE3jhLDkrmAVmuu7H5O8v+IX1K71gBi5T
 aJoxQJydw2oJZB6ntVyxB40PJIqDiT8kzzO6kCDlyRcLXYprkpBE8s6Q3IutrFVKNiEiYqu1v/a
 w43d0Vl8+akuNRBg21EoxIvzZRLbvllnAWH8jFKJ2Vu8OlPmDzsnYWZhc7xoYiX8mD7pHuno2fD
 fmwHX7Y6RACs2DBUauILYVx86Wnm3QuJth5bfdDuv4BjOwtstvj6+lEQ4TYf+6W3EPIKJcQrUz+
 12+Qb/1PxIe3AQUuiEr+NfgiFCBB9Lm/SeSca440OPnt40dmgHMn8QMUSrfJ5jO7DDjMHVGGoFu
 nYehUqPsDvJQ2BAdsOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180099

The shikra platform uses AR50_LITE IP core as video en/decoder codec 
block (the same as agatti platform). Extend iris driver to support this
platform. This has been tested on the Qualcomm shikra boards, shikra-cqm-evk,
shikra-cqs-evk and shikra-iqs-evk boards with HFI Gen2 firmware.

v4l2-compliance results:

v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.31.0-5396, 64 bits, 64-bit time_t
v4l2-compliance SHA: 3f22c6fcee75 2025-09-18 09:49:23

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:5a00000.video-codec
        Driver version   : 7.0.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 41 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, REQBUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select, CREATE_BUFS): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

v4l2-compliance -d /dev/video0 -s5 
--stream-from=./data/resource/simple_AVC_720p_10fps_90frames.264

v4l2-compliance 1.31.0-5396, 64 bits, 64-bit time_t
v4l2-compliance SHA: 3f22c6fcee75 2025-09-18 09:49:23

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:5a00000.video-codec
        Driver version   : 7.0.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 10 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, 
Warnings: 0

Fluster results for HFI Gen2 firmware:

./fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2-Gst1.0 - 77/135
The failing test case:
- Unsupported profile: H.264 Extended profile is deprecated.
        - BA3_SVA_C
- Interlaced content is not supported yet.
        - CABREF3_Sand_D
        - CAFI1_SVA_C
        - CAMA1_Sony_C
        - CAMA1_TOSHIBA_B
        - CAMA3_Sand_E
        - CAMACI3_Sony_C
        - CAMANL1_TOSHIBA_B
        - CAMANL2_TOSHIBA_B
        - CAMANL3_Sand_E
        - CAMASL3_Sony_B
        - CAMP_MOT_MBAFF_L30
        - CAMP_MOT_MBAFF_L31
        - CANLMA2_Sony_C
        - CANLMA3_Sony_C
        - CAPA1_TOSHIBA_B
        - CAPAMA3_Sand_F
        - CVCANLMA2_Sony_C
        - CVFI1_SVA_C
        - CVFI1_Sony_D
        - CVFI2_SVA_C
        - CVFI2_Sony_H
        - CVMA1_Sony_D
        - CVMA1_TOSHIBA_B
        - CVMANL1_TOSHIBA_B
        - CVMANL2_TOSHIBA_B
        - CVMAPAQP3_Sony_E
        - CVMAQP2_Sony_G
        - CVMAQP3_Sony_D
        - CVMP_MOT_FLD_L30_B
        - CVMP_MOT_FRM_L31
        - CVNLFI1_Sony_C
        - CVNLFI2_Sony_H
        - CVPA1_TOSHIBA_B
        - FI1_Sony_E
        - MR6_BT_B
        - MR7_BT_B
        - MR8_BT_B
        - MR9_BT_B
        - Sharp_MP_Field_1_B
        - Sharp_MP_Field_2_B
        - Sharp_MP_Field_3_B
        - Sharp_MP_PAFF_1r2
        - Sharp_MP_PAFF_2r
        - cabac_mot_fld0_full
        - cabac_mot_mbaff0_full
        - cabac_mot_picaff0_full
        - cama1_vtc_c
        - cama2_vtc_b
        - cama3_vtc_b
        - cavlc_mot_fld0_full_B
        - cavlc_mot_mbaff0_full_B
        - cavlc_mot_picaff0_full_B
- Unsupported bitstream: num_slice_group_minus1 > 0 (slice groups not 
supported by hardware).
        - FM1_BT_B
        - FM1_FT_E
        - FM2_SVA_C
- Unsupported bitstream: SP slice type is not supported by hardware.
        - SP1_BT_A
        - sp2_bt_b

./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 
113/147
The failing test case:
- Unsupported level
        - AMP_D_Hisilicon_3
        - AMP_E_Hisilicon_3
        - AMP_F_Hisilicon_3
        - DELTAQP_A_BRCM_4
        - IPRED_A_docomo_2
        - IPRED_C_Mitsubishi_3
        - LS_A_Orange_2
        - LS_B_Orange_4
        - PPS_A_qualcomm_7
        - RAP_B_Bossen_2
        - RPS_F_docomo_2
        - SAO_G_Canon_3
        - SDH_A_Orange_4
- 10bit content - not supported in this generation of video IP
        - DBLK_A_MAIN10_VIXS_4
        - INITQP_B_Main10_Sony_1
        - TSUNEQBD_A_MAIN10_Technicolor_2
        -  WPP_A_ericsson_MAIN10_2
        -  WPP_B_ericsson_MAIN10_2
        - WPP_C_ericsson_MAIN10_2
        - WPP_D_ericsson_MAIN10_2
        - WPP_E_ericsson_MAIN10_2
        - WPP_F_ericsson_MAIN10_2
        - WP_A_MAIN10_Toshiba_3
        - WP_MAIN10_B_Toshiba_3
- Unsupported resolution
        - AMP_A_Samsung_7
        - AMP_B_Samsung_7
        - PICSIZE_A_Bossen_1
        - PICSIZE_B_Bossen_1
        - PICSIZE_C_Bossen_1
        - PICSIZE_D_Bossen_1
        - TUSIZE_A_Samsung_1
        - WPP_D_ericsson_MAIN_2
- CRC mismatch
        - RAP_A_docomo_6
- CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
        - VPSSPSPPS_A_MainConcept_1

./fluster.py run -ts VP9-TEST-VECTORS -d GStreamer-VP9-V4L2-Gst1.0 -j1 - 206/305
The failing test case:
- Unsupported resolution
        - vp90-2-02-size-08x08.webm
        - vp90-2-02-size-08x10.webm
        - vp90-2-02-size-08x16.webm
        - vp90-2-02-size-08x18.webm
        - vp90-2-02-size-08x32.webm
        - vp90-2-02-size-08x34.webm
        - vp90-2-02-size-08x64.webm
        - vp90-2-02-size-08x66.webm
        - vp90-2-02-size-10x08.webm
        - vp90-2-02-size-10x10.webm
        - vp90-2-02-size-10x16.webm
        - vp90-2-02-size-10x18.webm
        - vp90-2-02-size-10x32.webm
        - vp90-2-02-size-10x34.webm
        - vp90-2-02-size-10x64.webm
        - vp90-2-02-size-10x66.webm
        - vp90-2-02-size-16x08.webm
        - vp90-2-02-size-16x10.webm
        - vp90-2-02-size-16x16.webm
        - vp90-2-02-size-16x18.webm
        - vp90-2-02-size-16x32.webm
        - vp90-2-02-size-16x34.webm
        - vp90-2-02-size-16x64.webm
        - vp90-2-02-size-16x66.webm
        - vp90-2-02-size-18x08.webm
        - vp90-2-02-size-18x10.webm
        - vp90-2-02-size-18x16.webm
        - vp90-2-02-size-18x18.webm
        - vp90-2-02-size-18x32.webm
        - vp90-2-02-size-18x34.webm
        - vp90-2-02-size-18x64.webm
        - vp90-2-02-size-18x66.webm
        - vp90-2-02-size-32x08.webm
        - vp90-2-02-size-32x10.webm
        - vp90-2-02-size-32x16.webm
        - vp90-2-02-size-32x18.webm
        - vp90-2-02-size-32x32.webm
        - vp90-2-02-size-32x34.webm
        - vp90-2-02-size-32x64.webm
        - vp90-2-02-size-32x66.webm
        - vp90-2-02-size-34x08.webm
        - vp90-2-02-size-34x10.webm
        - vp90-2-02-size-34x16.webm
        - vp90-2-02-size-34x18.webm
        - vp90-2-02-size-34x32.webm
        - vp90-2-02-size-34x34.webm
        - vp90-2-02-size-34x64.webm
        - vp90-2-02-size-34x66.webm
        - vp90-2-02-size-64x08.webm
        - vp90-2-02-size-64x10.webm
        - vp90-2-02-size-64x16.webm
        - vp90-2-02-size-64x18.webm
        - vp90-2-02-size-64x32.webm
        - vp90-2-02-size-64x34.webm
        - vp90-2-02-size-64x64.webm
        - vp90-2-02-size-64x66.webm
        - vp90-2-02-size-66x08.webm
        - vp90-2-02-size-66x10.webm
        - vp90-2-02-size-66x16.webm
        - vp90-2-02-size-66x18.webm
        - vp90-2-02-size-66x32.webm
        - vp90-2-02-size-66x34.webm
        - vp90-2-02-size-66x64.webm
        - vp90-2-02-size-66x66.webm
        - vp90-2-08-tile_1x8.webm
        - vp90-2-08-tile_1x8_frame_parallel.webm
        - vp90-2-14-resize-10frames-fp-tiles-1-2-4-8.webm
        - vp90-2-14-resize-10frames-fp-tiles-1-8.webm
        - vp90-2-14-resize-10frames-fp-tiles-2-8.webm
        - vp90-2-14-resize-10frames-fp-tiles-4-8.webm
        - vp90-2-14-resize-10frames-fp-tiles-8-1.webm
        - vp90-2-14-resize-10frames-fp-tiles-8-2.webm
        - vp90-2-14-resize-10frames-fp-tiles-8-4-2-1.webm
        - vp90-2-14-resize-10frames-fp-tiles-8-4.webm
        - vp90-2-14-resize-fp-tiles-1-16.webm
        - vp90-2-14-resize-fp-tiles-1-2-4-8-16.webm
        - vp90-2-14-resize-fp-tiles-1-8.webm
        - vp90-2-14-resize-fp-tiles-16-1.webm
        - vp90-2-14-resize-fp-tiles-16-2.webm
        - vp90-2-14-resize-fp-tiles-16-4.webm
        - vp90-2-14-resize-fp-tiles-16-8-4-2-1.webm
        - vp90-2-14-resize-fp-tiles-16-8.webm
        - vp90-2-14-resize-fp-tiles-2-16.webm
        - vp90-2-14-resize-fp-tiles-2-8.webm
        - vp90-2-14-resize-fp-tiles-4-16.webm
        - vp90-2-14-resize-fp-tiles-4-8.webm
        - vp90-2-14-resize-fp-tiles-8-1.webm
        - vp90-2-14-resize-fp-tiles-8-16.webm
        - vp90-2-14-resize-fp-tiles-8-2.webm
        - vp90-2-14-resize-fp-tiles-8-4.webm
- Unsupported format
        - vp91-2-04-yuv422.webm
        - vp91-2-04-yuv444.webm
- CRC mismatch
        - vp90-2-22-svc_1280x720_3.ivf
- Unsupported resolution after sequence change
        - vp90-2-18-resize.ivf
        - vp90-2-21-resize_inter_320x180_5_1-2.webm
        - vp90-2-21-resize_inter_320x180_7_1-2.webm
        - vp90-2-21-resize_inter_320x240_5_1-2.webm
        - p90-2-21-resize_inter_320x240_7_1-2.webm
- Unsupported stream
        - vp90-2-16-intra-only.webm

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
Changes in v3:
- Fix the compat name (Bryan, Dmitry)
- Link to v2: https://lore.kernel.org/r/20260612-shikra_vpu-v2-0-bf8727370a1e@oss.qualcomm.com

Changes in v2:
- Move the if/then schema at the end (Krzysztof)
- Fixed the order of compat (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com

---
Vikash Garodia (3):
      dt-bindings: media: qcom,qcm2290-venus: document shikra Iris compatible
      arm64: dts: qcom: shikra: Add Iris video codec node
      arm64: dts: qcom: shikra-evk: Enable Iris core

 .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi           |  6 +++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 61 ++++++++++++++++++++++
 3 files changed, 86 insertions(+), 7 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-shikra_vpu-b5421c03270c
prerequisite-message-id: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
prerequisite-patch-id: 67fa5f31ee5109470da23db3b513721580f4c86f
prerequisite-patch-id: 0e79e46bc5a88849a2f0a410b39c08f3244dfed3
prerequisite-patch-id: 0396ac157aba73a5afd7ba4a8a744847f5a7b433
prerequisite-patch-id: 2b1aecd97b9c073a1b323138cd7a98cb34e3715f
prerequisite-patch-id: 823bc7bc713f6fce1b9de47a266307f1829636b9
prerequisite-patch-id: 8a8a9df61f7c7c51d7ea9cdacc52b7bdd917f12c
prerequisite-patch-id: 5b89b41d7c729c23b3b1fff9b5f572f4baa915ca
prerequisite-patch-id: acd08e91e5e2c6f4799879e48481b07167c0a400
prerequisite-patch-id: c9f2942207341ad4f450b20f049199f35188c02a
prerequisite-patch-id: dd62ebff6be6a2e2d32743812d35ec54daf91d00
prerequisite-patch-id: 3a6e9752793f2d7b084008b47daed10ea572064a
prerequisite-patch-id: 3338cdc5915c1e6b991067d3a7afb734c182663e
prerequisite-patch-id: a3026c858ffdfd3bfafc837e72c67fffe46021eb

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>

