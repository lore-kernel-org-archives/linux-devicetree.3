Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F483D9545
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937858; cv=none; b=OYUI7+Px6qyW3y+Xq+kIxI1gFnRnt2HPsyvP3Ucpj8KOdj1m1XX5InMEb8WBgKvqU4dFK/ifL5KxDbJ/Ay/CDo/0MLKoznUaVyhnTSGEnAEYtGKuQPyOwFGZWQKtXtyQRLjlQT8yGNh9kVuJLlS7kR38BDM8djMhyXMsr+ctTb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937858; c=relaxed/simple;
	bh=p8LAYLlXIVIqUUU4m6ZIubR5kua6Nng7WluhdxkACjw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jE0qTIopqCniug+Tc+K8NRWtI/Fp/zW7anKW5emqF+1bOpVcZkbhe+GpP3JI6etUyK4HJwhALAlUQK7aJsLcrA8SugIkE7rYBlgj3WVor7uRtUgS2mqabYAoxYxYf8/l4xWFtq2RkzK3ZtyaRk+kZqvauFrqYG6WNdYWMrUYDPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OB2tK/ad; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8f+Y0ae; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OB2tK/ad";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8f+Y0ae"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D98vt2793186
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QeQhsheK9tMCcW1Jb0rBQa
	F54l8phBy4AnvmfKSIuc4=; b=OB2tK/adwQaOQV1ocahG1Ih9BZfon/hDvZ73qA
	Kq78c+7jMCQeTUhbBTZzfkCOv6LBrniGWgtxJElP1dXBldIbkgr18NGSl6F45GPC
	3Hyz0p6VG2Rh7YIk4zFMOgnxVBC8t6kF9quK2/N0M1HpsTCw2u2maL6p6kF2clBw
	ToeRLHYW963M6NRY3VzgurekyLQmWcQyRFGbuW2Nb9TIzKjXzoyhq5dyx5JFzInh
	OVyDAd3E4aJWdMq2Sb77OT5oGj5hhJPaqkaoOiLhX0GmAy9UyaeFnuWO44r6RFC0
	VPQ0d5dbif0qlWa8MSHtAf7kExxyI83aImxcr7Lah7v01sNA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qr7uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:17:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce8a76df2dso53606575ad.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783937855; x=1784542655; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QeQhsheK9tMCcW1Jb0rBQaF54l8phBy4AnvmfKSIuc4=;
        b=L8f+Y0aeyt/XtSAakcHOiAf/nRxn+fpl3MlYKRy1Mc23oBwcsXGKo/Kt1rrOG919+O
         GUtIwAxVqrmaFClekyZXrMuWp0cH2vhkpcc00yuxm909/Gl1kMmYSbIeRKrRuq5sqA3R
         Rxzn+JM3nnb9bRM76PkOBpRx87X5F06NjhQ0dI8z7NRBGI1T7SAghM47slVCCHcBRg/c
         lW5g17+cumOJ4zif3nUxFvSbT0LQjzRYuMRkMep/EqIhsQfnK5fz7SrUYsNCjTruoQaR
         fQQS0JK2tfmIXj5mlKWGqdbu6MnurpAWhsjzD2ayeYdxBXwRVelmeH1ns+GMz8Uyyon9
         KVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783937855; x=1784542655;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QeQhsheK9tMCcW1Jb0rBQaF54l8phBy4AnvmfKSIuc4=;
        b=OLYh20l4xdPIgQCNmrlQIAZyLhIZ89UJD8UD1SHgldeuSnlsrFMIt/T/KqzaZre84A
         F58dHMqeYdZsx/vf0/C2VgSLvUnrsrD9aN5xkA4CIh8o+5NKx3lofcPb73rqFqS67CjD
         XpdaE79aTQ62VHIxZAiJvMPhrSYmhPgVkEFv3FzbXJIaiOSvlrNuanY9RL8psn/vS6qG
         RQxlGQrWTp3gWhF0/UeGc2Ql8p2oP/JKO3xLSGkuui+9B4OEcSLTQZQscBewlaSpGKQe
         ZcM93h3d8kT+wwz3qHA092vWZ+ElG+V68isdGSJ+gEZ7wi9Bsoj3s6AM8ysp6etBrFg2
         6N1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpu8nWVYOKdchbtOZAymLj9ZJtU6dJkzbZ+N/Pl6FSHxur3t/KOKFmFapz7B6j6E4wG+hQ4jz6NzMBA@vger.kernel.org
X-Gm-Message-State: AOJu0YyFOJXeQ9ltud4QJ8mGDNnrToRhHCUaStz9d/UTjfXGya92Szg2
	Ww+Er78Cy3Kx/PsXBKtD7rbEoSdbf0KmwbnYXqs2lWsBgt+YEn1a4GWEWeRgZl+K3WRZPjCr/nP
	u4puABE8VixEGREQJw8pR/mPfNSu+b4HzUvSIfZs27NPjU6genQ3tDd0/LSg5OFfO
X-Gm-Gg: AfdE7cnTBwydBs3jvldhun+R76phMuxORTcOyP8zv0uWnOm6zHVSx0WOJ6QCfR6PqPd
	4TSalfuoyDUS6Y1iZnf17uKyZRUr2FU6dDufpmIQbTPK59hlLcgAHfBhVLNydLZZDdcehMrp3Yz
	jx0c0MGJaIyMjsECmphssoS0qGEeYo5ZLpMUbUDkpSSnXzTl6Z3PyTz77kNz1/b6toijfV4F4EI
	eF4I7JE0aMH3A18I5ZJOX15MVKQjQoW0f8gXNGKPAykJK1zWnaC5+kHhV6piyaRwKziwyU4Dsi3
	t9HNz6pCO/lHBAoHK3Q2nkEO+Ln7VQ2Qu7FSix0UkWLwyLfCIWCJiqiE0XlJTpKuR9QwSXNuVA/
	IboGGOMtdLjq3aTMKtvqBpdxUAo2sy6BFXmjdiMAh1gXpfS7cnQmFE1Z3tLliIHmYyDWJCNIVpQ
	ELMaa6A5Hpcw==
X-Received: by 2002:a17:903:230c:b0:2cc:5f9f:54ed with SMTP id d9443c01a7336-2ce9f02acc6mr82287775ad.27.1783937855462;
        Mon, 13 Jul 2026 03:17:35 -0700 (PDT)
X-Received: by 2002:a17:903:230c:b0:2cc:5f9f:54ed with SMTP id d9443c01a7336-2ce9f02acc6mr82287565ad.27.1783937854990;
        Mon, 13 Jul 2026 03:17:34 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm98257925ad.39.2026.07.13.03.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:17:34 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v9 0/2] media: iris: add support for purwa platform
Date: Mon, 13 Jul 2026 18:17:25 +0800
Message-Id: <20260713-enable_iris_on_purwa-v9-0-633d7b87f0c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADW7VGoC/33SS27DIBAG4KtErOtoeENWvUdVRQOGBim1E0jcV
 lHuXuws4kXpBmkQfPwz4kZKyCkUstvcSA5TKmkcamFfNsQfcPgIXeprTRgwBQxsFwZ0x7BPOZX
 9OOxP1/yFHQKAZBrBmp7Uq6ccYvpe2Lf3R53D+Vr1y2OTOCyh8+PnZ7rsNi4ErXgvIxfUWeuj0
 AxjcBJML6wxUTFUHimZrUMqlzH/LIknumD/h5toB53k2gsKUYGIr2Mp2/MVj/P727os7sSeFgf
 VsFi1tIxoAAFt4A2LryzaysWr5aKJPFg03vqGJZ6WANqwRLU8aiOkZFjBhiVXFmvlktUS3ES0q
 kcmTMNST0uCblhqtkyPEmRg3LVmr1cWFQ1Lz5ZGlK6eixQblllZzR7NPPv62ZQGIS26P6z7/f4
 LBTeGYB8DAAA=
X-Change-ID: 20260209-enable_iris_on_purwa-a000527a098d
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783937849; l=11399;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=p8LAYLlXIVIqUUU4m6ZIubR5kua6Nng7WluhdxkACjw=;
 b=wsjUpZRUXHfogy2aI1c7X9tDxCMj1E5BY2ta5goahXP0dXAJa5LgBGY/PoYVFRvteGWcAWRN5
 i7OouliVVUDB+FUWdqAXccwAWiu+jMFtodxhMUU8NTsXEzdpwA1fc+N
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwNiBTYWx0ZWRfX5zUksnybAMOl
 6OIpMBO9xV7QZntl6O2od/WVnRAKwrQFdzHrVMUn1Tsie1xUbo/ISm4/YcwqfiTtfteFo1llNzm
 BGobZgBLOG5zexpabU0LmyrupzskQ/ovGGKsiimOaHp+6QQHc1th25q9D/S8OftfSwD2W1JrO9p
 BHJlr68EXzun+UgoQr3E/g6L1jiOZ2+m0CH1T1gRZhlDhVBvnpCx40Of2QOPn9pwgEOSXlNrey8
 15BQyx7SKEUnuFC4oFM2j74JON8WNBN0OkcXi5UyFJof7l2ETsxAZkrnKvvoBg+vBifwjRDkZJi
 jwmfAtVn9of3S5ni/pJlT3wfLuZTVUpViGmr68imMPPparx8O8TH9HxrN0bA+jqs5DEDFXxWjhc
 Y3vrzjMGn4k98P7E4AG+niBGBx0leoCHquIZs4JyeC+b+WQKg6Rr22ltDw1xgjO1YL3MzD1toH8
 4QHwjK77DjDg+R20STw==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54bb40 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qLdzKuw7Enaw83zpX7AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: OWEe_loOkrIpa-KzYlXgBSGUpqV3cmuv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwNiBTYWx0ZWRfX3ieNtuNGcyV2
 xUlJdZQ8LlsUf1mAfPk1236ZHd3s9J1y1wSOU9erBlA6rUW6WiBvUCi81qQmQlIKv4e+1KUDxKR
 3KhPbKyCZg1oIavFbDHTxyiVuGw5t68=
X-Proofpoint-ORIG-GUID: OWEe_loOkrIpa-KzYlXgBSGUpqV3cmuv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130106

This series enables the Iris video codec on purwa, allowing purwa to
use hardware‑accelerated video encoding and decoding.

The Iris codec on purwa is nearly identical to the one on hamoa(X1E),
except that it requires one additional clock and uses a different OPP
table.

Therefore, purwa can reuse the Iris node from hamoa, but the clocks
and OPP table need to be redefined.

All patches have been tested with v4l2-compliance and v4l2-ctl on
purwa. And it does not affect existing targets.

The result of v4l2-compliance on purwa:
v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
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

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
root@localhost:/lib/video_test# ./v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.31.0-5379, 64 bits, 64-bit time_t
v4l2-compliance SHA: 14c988631ad4 2025-11-11 11:19:35

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
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
        Standard Controls: 38 Private Controls: 0

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

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

fluster result:
H.264:
Ran 77/135 tests successfully

H.265:
Ran 131/147 tests successfully

VP9:
Ran 235/305 tests successfully

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v9:
- Rebased to 7.2 rc2.
- Drop the applied patches.
- Link to v8: https://lore.kernel.org/r/20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com

Changes in v8:
- Rebase onto the media-committers venus-iris-next branch.
- Link to v7: https://lore.kernel.org/r/20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com

Changes in v7:
- Rebase onto the media-committers next+fixes branch.
- Correct the firmware name.
- Link to v6: https://lore.kernel.org/r/20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com

Changes in v6:
- Correct the firmware being used.(Dikshita)
- Add comments to platform data.(Dikshita)
- Link to v5: https://lore.kernel.org/r/20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com

Changes in v5:
- Modify the dt-binding description.(Krzysztof)
- Move the BSE clock on/off handling into the vpu3 code.(Krzysztof)
- Link to v4: https://lore.kernel.org/r/20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com

Changes in v4:
- Correct the dt-binding description.(Krzysztof)
- Fix incorrect required-opps.(Dmitry)
- Reuse the vpu3 power off hardware api.
- Link to v3: https://lore.kernel.org/r/20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com

Changes in v3:
- Correct the dt-binding description.(Krzysztof)
- Fix warnings reported in the patch.(Krzysztof)
- Add separate power on/off hooks for Purwa.(Dmitry)
- Link to v2: https://lore.kernel.org/r/20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com

Changes in v2:
- Improve the dt-binding description.(Krzysztof)
- Move the BSE clock on/off handling into the vpu3 code.(Dmitry)
- Add the required members to the platform data for Purwa.(Dikshita)
- Link to v1: https://lore.kernel.org/r/20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com

---
Wangao Wang (2):
      arm64: dts: qcom: purwa: Override Iris clocks and operating points
      arm64: dts: qcom: purwa-iot-som: enable video

 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi |  4 +++
 arch/arm64/boot/dts/qcom/purwa.dtsi         | 50 +++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260209-enable_iris_on_purwa-a000527a098d

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

