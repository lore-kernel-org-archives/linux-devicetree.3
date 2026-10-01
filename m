Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922EA4D17B9
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862157; cv=none; b=YPwoFUtG+1NefunKoWU808lFPU1XskJiZmKorjfPiSEvL/w/+mqJMkKLFz963SobOsjR1lqYvfV9Pj58vBcbyw7XRW3/hApi2IWH8613y1wGNtPn7Hkgt60KwR0vw1gJutbar0aQMSvV2lh3QE0MYiQn62wdvC0CzltM+p+1idU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862157; c=relaxed/simple;
	bh=mqE98lSLSmX3fLm9tMCPlGSbN6qDEJ4biDfoVdVSC90=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MPhdpjDIGW7EIuiaqfgXcLqsve80dzUk8A6rE7rhDImGtVxT2sNuNQCm9lJfpmwzCafhNy3eYglbKoJE9CAr5+dkNNu5E51Kxbo7uJNzBYD592ceFoqSq0RP0SuTYJSr26Z3vbyOTLBDszAjxOv8PaKZI36Icc2jI1gjd5m5/Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/7lTexD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0XR16yx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/7lTexD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0XR16yx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Ce1R21661060
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 13:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6g3aM6thPDYa1zIx3TPPEA
	nUmPlYV1m+1gOewfHb53A=; b=l/7lTexD2it8nL94Ysvpxg0S35+llhDtKxPi49
	vMpZ3UnEfh4vlHW00QXoDimxRp5XHbSF209DcdChX0y6ciwqC2aFuAB8ZW/xCPcR
	E4pbZj46VO2f2fCGmqI/2VFqrXast4L7k+MrH/qTJS9C+E3eXc8NJgSkz9rkpftu
	izkrdI/Gi+eeiM7EJ/cWjGYvs4Ta6fwJt+IweZEDV8TDmMjDtEqIbuUN6RojNIjJ
	i6adES4m5yOloa4SvuQvdOt2LneEkzMmHutHiy0ynpcFyvb3HgvEsypJ96iSkxc6
	fgMiEeS1n8nodRVVl7y9dvfntgphI9DIAdkv3NXcKJSLbP+w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pmypy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 13:42:24 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14383177746so15119354c88.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 06:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790862144; x=1791466944; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6g3aM6thPDYa1zIx3TPPEAnUmPlYV1m+1gOewfHb53A=;
        b=O0XR16yxonk86/28lVGqFYKBSEkq40R59QrnwGWhkpL6DrRWGWyca3lOIZPWG/lM9T
         XfIRSiitDgKYs7EnPtqttWC9nooXjEfN6Fn5aKBaRfweJ0vC/aqnFvNXSKKjcrYGbkpo
         by0pObQpukjrvczAHvXnF1Y55YB5taUbigtbBAJu2jetF2OwKIsDCTvht+AvrlGfeiq3
         5n+zN3QHg5xxe2u9yax5YmonklHFntd4CFHnTuJ30hwjD568UVyC8K2KkL41EzCqBRu/
         eGo/lFSe2BaOvq73enXeS2KUeAvA6+K4EiL5I0ZYYWmftTSGPGmb2x28FMJwGRs4alzx
         tkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862144; x=1791466944;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6g3aM6thPDYa1zIx3TPPEAnUmPlYV1m+1gOewfHb53A=;
        b=gRAUep27F4Xhp75Nj59uROODTGxP6gyC8ZO47UzWRRJjpnxQNDCOjBEGb4eVfpnlBW
         bBdX89b0PIqMBt1z/YQWbJUSFI7973wjoo6q9L/x1XtAxeWcdu8c87Bc0y6zeGpQjmYg
         X/ry39Vd16JUv12dO+jIjZ22Ilfo/q5CbJWEZF+0OBYkSLsZiNcwHIoFaVfMGFjspPyd
         sziZS58XxOP9VJSEAlOVTSMtS46NOPkgxm/SStb4XH5k5dK7NAaWyFB4dkicf2f6oYte
         /pV8ErWOF4OyHkCKO9qwle6xfN3kDXFS5zxOYYor6AZbx3zjy5PWKjRmigf6WLUWxEKH
         ndHQ==
X-Forwarded-Encrypted: i=1; AKwUvByBlFBbPYDHYeCAr7eTLuvvwMMrrfBP6g0JZd9WJ1c+pZtwGkeeV7hKZCwMVY/oJMWgEvdsyoCqiuOA@vger.kernel.org
X-Gm-Message-State: AFuF++kaXyMX/DBFpH58EXoKLm6qlnY3JwCZykt7RQzCBDohSDeVd2IP
	eHhjr96lhRzqU7ZnlIJ/ERmKCw2aa3ZTjfRtQ96euY0Kr2ylB+FHmoTH3My+EZuEs8mgYF4sPxf
	QMMbgar8bRpahEpFWL5sMkCHJqNN5ApjQvpCaEo0v2rbkAfhgWXPkKS/qA4fyAvyv
X-Gm-Gg: AYBFou10e+K4zqBOdiwf4wjtc+dgWQHLzyubcX/IN6dX205ZcFCH/qFE15W1bxsDmGT
	CE+mFw7mSsPRjjubPOSzazU+y2BHf18JG1kNlUXx+mt5aRl3mRgaICHiy7MJj7bednxvJgHRhZ9
	rsHVX2D6oqZQ0DS82KJ3d+vG06HitdAw0/QoRbYRXgwccCqlA5pyoC/2/wbty6sYZBPShKNEQZW
	B6m0TeRXuH5FrjDpafSMLtEwWVu55gVvucp8hQXnfF1XZWbPkx6u/8vv5Ocz2xxMl4NvvDnB+RG
	lZ5gaMvoo1Uw/FM2qyfFCr4hPs7jF8oDUB3rgBshGJk5UNT7CqhHj6mkCdMc0uS7NlBNpFlSYoD
	bl1ixJLLBNV+Dis5Zk4b/um0hLQRp+8YXIqk=
X-Received: by 2002:a05:7023:88c:b0:144:c112:5f23 with SMTP id a92af1059eb24-14d35f35d42mr6135891c88.24.1790862143725;
        Thu, 01 Oct 2026 06:42:23 -0700 (PDT)
X-Received: by 2002:a05:7023:88c:b0:144:c112:5f23 with SMTP id a92af1059eb24-14d35f35d42mr6135795c88.24.1790862142082;
        Thu, 01 Oct 2026 06:42:22 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14df34a8385sm6668906c88.6.2026.10.01.06.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:42:21 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH v6 0/2] media: qcom: Add support for the iris codec on
 shikra
Date: Thu, 01 Oct 2026 19:11:55 +0530
Message-Id: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACNjvmoC/23NTQ6CMBAF4KuYWVtSC7TgynsYY/qHNAqFFhoN4
 e4WXKgJm0neS943E3jtjPZw3E3gdDDe2DYGut+BrHl708iomIFgQjEjB+Rrc3f8GroRVSmTlcS
 YcsEhDjqnK/NcsfPlk53ux2gO37I2frDutT4M2dJu2iFDGFElc16UZSlYerLeJ/3IH9I2TRIPL
 FrIfwXyJ+RRSFWBBRcqo4xsCPM8vwH5IXQhAgEAAA==
X-Change-ID: 20260721-shikra_vpu-f37cfc006aba
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790862135; l=17698;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=mqE98lSLSmX3fLm9tMCPlGSbN6qDEJ4biDfoVdVSC90=;
 b=odPwXm6TCDGPFkccoaLAdl5AdNYodbhEjuIBbMxartgJElj/bFteJLxMBygJmjmfgYVpTepQB
 89qnyVxh7hKDV9GpUWH3Sr5LRKcvmQSxUr6MEpuAR1sHbP8pjkLygFA
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: CydNx9QGGwjCNmxCfGYZF5g8gpPmQq4l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfX4DHLYAFK9g+O
 6zZk+pBJubCPFkPVAbDepwK1kUIdtI4XcBdoy367Ne+DqqMO8s2zSVMjGNsTxVblFn+fCmXQ1mU
 4Xk5JffL9dcgZ8PWN1AFcPSwAkL78Gk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MyBTYWx0ZWRfX8KveHN88EIRH
 eGIMXpEbzSGGr9KDBF7k76UrY71fTUntT1zk+N9mltw0jSCsQFCQtjwEXFGmuB/hCNPC+iU+DnZ
 vbEGyDk0lGFUEEg8zSe50yMsAyq+Cut98rctk9R5EqJOXFU+vfHEKCf7+PuJpysaIHa4q1N9gez
 5Mx6xx2PKEXcI6T4Z5POEGGO0IoiJJe1FFuSRPxgcw576Bu9q4WiDkeDVynV30IroT0QIBUm1Vn
 YeJro6QO6b4Nx4ozK1aRzz9tqca2CeeJAKlVGVohKuuGPGv7xxRG5Xd+JSBxwJ4WN/RFDhXshqn
 MdIqiQGUPj/DtYCjleWIjxUpGtfHvEerJX2rcxL3vFcd5UjKAWHXExpCwppJ34x3b7kBzZoo2Qg
 zO0crQ2nYwJhMQ3J1vw7Ozm/JBAQZNsajKSqT18dwVUCb96S2LNSoiqXQONs3RegrD7a8cGEnKr
 X/mx1t9O36IW8LaWsHA==
X-Proofpoint-GUID: CydNx9QGGwjCNmxCfGYZF5g8gpPmQq4l
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe6341 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7s1ES9sKXb6EmgU4USgA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010053

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
Changes in v6:
- Drop the binding patches applied in media-next.
- Drop the reserve memory region as handled in driver.
- Link to v5: https://lore.kernel.org/r/20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com

Changes in v5:
- Moved the common schema changes as separate patch (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com

Changes in v4:
- Added handling for 600MB (Bryan)
- Link to v3: https://lore.kernel.org/r/20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com

Changes in v3:
- Fix the compat name (Bryan, Dmitry)
- Link to v2: https://lore.kernel.org/r/20260612-shikra_vpu-v2-0-bf8727370a1e@oss.qualcomm.com

Changes in v2:
- Move the if/then schema at the end (Krzysztof)
- Fixed the order of compat (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com

---
Vikash Garodia (2):
      arm64: dts: qcom: shikra: Add Iris video codec node
      arm64: dts: qcom: shikra-evk: Enable Iris core

 arch/arm64/boot/dts/qcom/shikra-evk.dtsi |  6 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi     | 61 ++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
---
base-commit: e58d7c08800bfc66579e2686f9f1ff4bab1af79e
change-id: 20260721-shikra_vpu-f37cfc006aba

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>

