Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699470;
	b=LRViV68N2nj9kDi0qroChbQSdG5cx0Eq2T39waEyD/wNXpwWcv6rs997sqbMhI6wZcP4
	 I4VVrWdJmmQGzGMpyxFiOo13Dy3I39P52Q7RbcYbrmvHaGQBOxZ404tOKQzdXnkVT3Nv4
	 iTI6Vst7HrIpLVShypCzxrxXKCs0WIMxtH4cXE117tgbOafe1P+k9MfrHUecyI898Lb0K
	 esXCRFXwwNSaGYWb63VE/hA7LkRZX394qdiGK06dNP3MNesMyW6vvb4PMarwRFxkBkBrb
	 s9MjSP9maeV/eX54tO8NlxwHEH2ZDjjSfe7Q/zE7qY//IdR0IoqVvF8EhPzfm9uIBww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5mWWymzA8upapJnu3dMK1Apyzsra33zo/5p8T/iSZLM=;
	b=LrNdvhbDwt/YZZJYliMoDN5a7B55upeO0r7oz41eDi+DAhtRkXxKYJMfa71PMHDH5Va0
	 Fq2VkfzQYPXcu04fma145tK/cbyakfsMlg78i8NiPKgmrzaV3ZKE/r0EsWMODRBpC7e2s
	 fAxh2//XieO0hNlowO1/uWFezF63RwCnAxwJ5TiEXbCTtdcmRySuVnVnLfLcVQsxbz3YG
	 nB8mdSD0JKaJXHPn036iagAr/1hVIGn4e9wxQw1IbLD2y5I2ZjUyTqNQRj7nU5EBUSBbz
	 cadE+RSVlGhgKZxNE1fCQCD041sNmzccM5v8dQaL0n91BHNEyAg4pr8TRpJvnAfXrYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ImOCUpZK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Akh81v/y";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E5C606A337
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E5C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ImOCUpZK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Akh81v/y
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQD1mBI3473624
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5mWWymzA8upapJnu3dMK1A
	pyzsra33zo/5p8T/iSZLM=; b=ImOCUpZKWG4GqOJvagIyAyUB0OY80df3YZHN/Q
	MWIZy8gSkPq/DvO6HbtcupGVOzxMo9rGysUizYT6zc6W3wSZHxh2ADEtArQqFa4L
	tATsdLSa6YJvff2MO7wT5UAR47Vz1mY4z5Vm5i0K2TZss1fAitxCGBJ0xVUwoSd9
	VgLCI4a2HIQgSVHKUwQo1RjJ9ID1a+bFejCcSTUDEmitCHrBFDosKnMQF5ET5LAO
	fKHwFcP0U98b2Y1unVOzjWUVMMCk1egW/IQif5sBztIzAH/k3nktrB6FxQl1B5HI
	AY7qeabGAuW4IZ8Apcw4GMfgMqNRPFvq38q4eMMxP7dTe1ZQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g93cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:24:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso5245936a91.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699467; x=1796304267; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5mWWymzA8upapJnu3dMK1Apyzsra33zo/5p8T/iSZLM=;
        b=Akh81v/yWVb/rlHBDNCosdvWqGRAQQakN9vKM0CZppcjlfDLlUDMnRdT/TtgY4PP6Z
         sxG/na6M0xAOt6xyK8nCYknx8yBmAcpuxz+QDTRtXwfR462S8zK2+EnrFxIhnE6018Ya
         O79eb3SsyAhV5xK6iW3Xfl4IvHPCTGKq0tm+ajQSPQCMjiKd0g4LC24NBJrk4jvaYnlS
         Tgpf1W6D1rvsWEs598g3tfw+A/s9MTq7mDq1Yyhs5Cb19mPmeN6lE5HQ/FlBqns07qFD
         X2PMU6e6vHZaiPVl0n5QNfcjQULjiiIf0VWGRVeBgzvEHOu1QW6sqncthx+hJ+uBmFqe
         pIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699467; x=1796304267;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5mWWymzA8upapJnu3dMK1Apyzsra33zo/5p8T/iSZLM=;
        b=JdN4DeflYEQ44Wb0LP+S6tCFy+2497OSmTC/pr3Wu+eU+FvvOZ8fqWg4dj7ML1tSnU
         iyzBH2ixbtbb6c2OGERZcl8zdIwR/gtqD3DHMMk5lNJwRDIJ+IDqIyTm4YR77+EJeu+Y
         MN27++9kRQ9dx/9Pv/wyGjLAaO8EpuLi3YhlX/T6mCbSQuSWqCJ2RfEVhI8gSqMpunjG
         lFF7wm4DtZahqtETUAHd6Ucr8q8yDxd5MgOy6AHem1dFOUJulrYRxUnosyFyhxccsAcB
         EmzX8eo4bNZpA1xyCphKr1ph791gv9sEAZbl4NjT9gVI7oOhtRpOim5dPFFY3zWL/Qy3
         hFpQ==
X-Forwarded-Encrypted: i=1; AL+hErHGePCEmJkPcjDm2FseXwqQ2zvCtw9DwUIlHiXzoEcMDto6l5Ri6yuo5REVN3h0+T6Kilqc5QZ7xxsp@vger.kernel.org
X-Gm-Message-State: APuU4Z9NP91hjau5plo4ZQMEgMw9B7vsMHP7nJbq9TnOSfogcThBgK2N
	gYcVksW8qOKr41fy0CpBzyHXO2td+hV5h2iRPmv0Yty+MF5jk9ubTSlgszuvZ+ZLNCXk33WNun2
	3aykRez5/iXvToVwcW7QeF/sMlh0GXSlwFLyJ0bYbjjdGVJH+D1YaEOkUHBtaDbb4
X-Gm-Gg: AZFdTZclc4ZRUHBTCigZLr5sy6+G0rTcr9CZPLxRfAPkaFgUeUeumMAc2cUyhTxAApp
	QI0CL6iKZXJdnthIyL/J1sXhUTkehnESjn/W4lPsnRi5HlNbqiy+OtySgC5aiexzkM9WAz8vRHg
	NnV9ofOXy9FQq9vV3YIUFNy5OdkRbwR3eEs811/hBzAni4glNG6OurA7DsA4XQS5N0hqhdptzKP
	SNqFIwxbeJ8aO3AKgwbe18VjKUQTbl7tumKTrSqeB51ZmJD0trYnQY73VETHAoLUrz1mL5HLXeK
	qyGzxZf3WPG3/6EgZtSvPdAG5UHcy4mtYxz3Fn3mlDjxaKJ5gNKF6O03HlphhLfqP7CyRbzdieX
	D/bAjtr8iYtlZloO4hlmfXURoBd+wPm1E50pKule1g0OXXhV/7YIiQZa7LXM1yvAgd/YV49Wd75
	eqbQ2z
X-Received: by 2002:a17:90b:384b:b0:3b4:fcba:8c53 with SMTP id 98e67ed59e1d1-3b4fcba9699mr4881732a91.21.1795699466982;
        Thu, 26 Nov 2026 05:24:26 -0800 (PST)
X-Received: by 2002:a17:90b:384b:b0:3b4:fcba:8c53 with SMTP id 98e67ed59e1d1-3b4fcba9699mr4881693a91.21.1795699466361;
        Thu, 26 Nov 2026 05:24:26 -0800 (PST)
Received: from hu-gouravk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d03adafsm11232196a12.23.2026.11.26.05.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:24:25 -0800 (PST)
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: nord: Add iris video codec
 support
Date: Thu, 26 Nov 2026 18:54:17 +0530
Message-Id: <20261126-nord-iris-dts-v2-0-bb88dc5832ea@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAEzCGsC/yXMQQqDQAxA0atI1gY0lBF7ldKFY6Kmi7EkVgri3
 R11+Rb/b+BiKg7PYgOTVV3nlEFlAf3UpVFQORuoolDXFDDNxqimjrw4SuRATI9maFrIzddk0P/
 1e71v+y9+pF/OCez7AS+Qz49xAAAA
X-Change-ID: 20261126-nord-iris-dts-ebd62d247f79
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Gourav Kumar <gourav.kumar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795699462; l=14416;
 i=gourav.kumar@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=htdAXNalK8eAou5Ic1EtSdqKXUTWdXbgLxyv/ut2iMQ=;
 b=BQQH7DY6w9YLMnmbfAlZ/3mQnvZSjKh6aa+EJ5c1cxbvFQsAimRGxf8/iYaMRX4IksIZQAq1H
 RpiDAo54DkeDaIWQmrtrirvbHWnj/3UHfK5Ar2J4iHl0ugbyZPooTR/
X-Developer-Key: i=gourav.kumar@oss.qualcomm.com; a=ed25519;
 pk=pp/OfJjGYucjyEYKqArAaVDesbfWZ44Dom+QtAdDZ8E=
X-Proofpoint-ORIG-GUID: bkQOUikyoOULC8JOH7nXDWdCVFIiSq_g
X-Proofpoint-GUID: bkQOUikyoOULC8JOH7nXDWdCVFIiSq_g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfXxTVWcm6qmNoy
 GP1Pa8czw7lQRtbmjJ0ufGA/LTg3gExjBqdeBlcFtwhzrXd8H/5kwAK3BXcUhs19abfWiq2rErD
 T7kQbdI4uIw0JVaBLtBJpJTiuDK1+LfrebAbwE8aU1ou3a6pBKi/8iHnlIgza+bXRzGJPFLsxnf
 nlhtBwQelz/ju6x5d8xEK5m8wVkX/HC6xj6mv2PTmrtFYZ6R9yuAtYaq/zb760p45tMhx1C4I79
 2TpKeFI6FsVMWJLuEWaVEbIhESg0rJWh+8DmUCv6hVv9WJR1zLj1Ls2T/Myq5Wk3i3eO1Dva495
 oqeMFVKxroI2kdVtkkYfbEo7yzum3GmhibO64fYO5NJuU6UiLI6OeKx7k+Ngnanza2VTTEKoQRh
 viZFmJ3MTUcwJxVdBh4Ef3mWqTQ9BZiBMV1D3gwb8cJORof/RFZYR71kp8n2ZgZpy6ZYBiUHq1K
 ZwnmBXTgAqgksfOtLmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX86fof2uiLWrT
 CixDDJhL3unmiPs6p9WMgp4rok0po/mVKJU3hfn+nt41KE3FySKKM7RbiYWtgMySOzGkmK5C1vO
 xRT05CzwIr37agceARo1DuGMIOBDwU4=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b08330c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Lvc17u_2AUzMQOMvoCEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

The nord platform integrates the Qualcomm iris video codec hardware,
which is compatible with the glymur based iris implementation.

This series adds the iris video codec node to the nord device tree and
enables it on the Nord Ride Embedded and Nord RRD boards. The devicetree
binding change is sent separately for the media tree.

Dependencies:
- https://lore.kernel.org/all/20261126-nord-iris-binding-v2-1-95c960de80ff@oss.qualcomm.com/
- https://lore.kernel.org/all/20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com/
- https://lore.kernel.org/all/20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com/

Test results:
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.2.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format

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
        Standard Controls: 12 Private Controls: 0

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
        test Scaling: OK

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

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0

v4l2-compliance report for encoder including streaming tests:

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for iris_driver device /dev/video1:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 7.2.0
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
        Standard Controls: 64 Private Controls: 0

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

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 52, Succeeded: 52, Failed: 0, Warnings: 0

Fluster test report for Nord:

77/135 while testing JVT-AVC_V1 with
GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1
The failing tests are:
- 52 test vectors failed due to interlaced clips: Interlaced decoding
is not supported.
- cabac_mot_fld0_full
- cabac_mot_mbaff0_full
- cabac_mot_picaff0_full
- CABREF3_Sand_D
- CAFI1_SVA_C
- CAMA1_Sony_C
- CAMA1_TOSHIBA_B
- cama1_vtc_c
- cama2_vtc_b
- CAMA3_Sand_E
- cama3_vtc_b
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
- cavlc_mot_fld0_full_B
- cavlc_mot_mbaff0_full_B
- cavlc_mot_picaff0_full_B
- CVCANLMA2_Sony_C
- CVFI1_Sony_D
- CVFI1_SVA_C
- CVFI2_Sony_H
- CVFI2_SVA_C
- CVMA1_Sony_D
- CVMA1_TOSHIBA_B
- CVMANL1_TOSHIBA_B
- CVMANL2_TOSHIBA_B
- CVMAPAQP3_Sony_E
- CVMAQP2_Sony_G
- CVMAQP3_Sony_D
- CVMP_MOT_FLD_L30_B
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
- CVMP_MOT_FRM_L31_B
3 test case failed due to unsupported bitstream.
num_slice_groups_minus1 greater than zero is not supported.
- FM1_BT_B
- FM1_FT_E
- FM2_SVA_C
2 test case failed because SP_SLICE type is not supported.
- SP1_BT_A
- sp2_bt_b
1 test case failed due to unsupported profile.
- BA3_SVA_C

140/147 testcases passed while testing JCT-VC-HEVC_V1 with
GStreamer-H.265-V4L2-Gst1.0.

1 testcase failed due to unsupported bitstream:
- TSUNEQBD_A_MAIN10_Technicolor_2

4 testcases failed due to unsupported resolution:
- PICSIZE_A_Bossen_1
- PICSIZE_B_Bossen_1
- WPP_D_ericsson_MAIN10_2
- WPP_D_ericsson_MAIN_2

2 testcases failed due to CRC mismatch:
- VPSSPSPPS_A_MainConcept_1
- RAP_A_docomo_6

235/305 testcases passed while testing VP9-TEST-VECTORS with GStreamer-VP9-V4L2-Gst1.0.

64 testcases failed due to unsupported resolution.
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

2 testcases failed due to unsupported format:
- vp91-2-04-yuv422.webm
- vp91-2-04-yuv444.webm

2 testcases failed due to unsupported resolution after DRC:
- vp90-2-21-resize_inter_320x180_5_1-2.webm
- vp90-2-21-resize_inter_320x180_7_1-2.webm

1 testcase failed with CRC mismatch:
- vp90-2-22-svc_1280x720_3.ivf

1 testcase failed due to unsupported stream:
- vp90-2-16-intra-only.webm

Changes in v2:
- Rebase on linux-next master and update the dependencies to their latest
  revisions.
- Fix the AXI clock and reset assignment of the iris node.
- Split the iris node: common resources go in nord.dtsi, Nord Embedded
  specific ones stay in nord-embedded.dtsi (Shawn).
- Send the dt-bindings patch separately to the media tree, so this series now
  only contains the DTS patches (Shawn).
- List the dependencies explicitly in the cover letter instead of
  prerequisite trailers (Shawn).
- Drop the display driver series dependency (Shawn).
- Collect Reviewed-by from Abel Vesa on the enable patches.
- Link to v1: https://lore.kernel.org/all/20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com/

Signed-off-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
---
Vishnu Reddy (3):
      arm64: dts: qcom: nord: Add iris video node
      arm64: dts: qcom: nord-ride-embedded: Enable iris video codec node
      arm64: dts: qcom: nord-rrd: Enable iris video codec node

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi     | 88 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts |  6 ++
 arch/arm64/boot/dts/qcom/nord-rrd.dts           |  6 ++
 arch/arm64/boot/dts/qcom/nord.dtsi              | 28 ++++++++
 4 files changed, 128 insertions(+)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20261126-nord-iris-dts-ebd62d247f79

Best regards,
--  
Gourav Kumar <gourav.kumar@oss.qualcomm.com>

