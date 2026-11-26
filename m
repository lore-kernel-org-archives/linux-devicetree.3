Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674568;
	b=5N99c2FNToTDCbk3RnS/IlFiiv1kA6QYqgHWt4DXzny+9bzvfMzFFTr4EkqgHTbmVxVM
	 GvUCpvXvCBefXHtKDCbrh4VMROD6r9IvCGo79uoq2XkNZqZry0ZrBJQg1yWsZCtIVFRLe
	 EWqj+e83w2XGXWy0TeXrfd3atSIPP8o7But0pdkIMJCl1fk8oSt8tEPfkw/w22zmK5uPs
	 LaIA3QESUlWtq1V6uzrCArl+f6Vvz7yu1fV0/IhD0hB4ncKBcYwrTe6YUqoS9kiXm2kW7
	 /D3pMYMZS7p9i5cTpa70BR8l40pDNDjj15uc1JTf8hHFZ74iYFzczH71Xoxc8/ZP1JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674568;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S1PfSPwOFX0MWE8bPkRfQgTr8TnbUtpYuxljXaH6x70=;
	b=GUHUadQEoYs0CIeURHnw+i55uWLOlUDlomhRxP3BFC7zRM1JEdBrXWwDNklWqJJLO8Zy
	 Gk9ragnExkk5B+ZlCa++Lp7eRDbvjrHd2IyFMWQW9B9uQGTFY3Oz72veNAnBx29I+pnnT
	 /JFQJ7yNfa3tPPzkUOf84gXfjM42A6HbKbXKOXbOw1gH+Ydd2RyYpSfqJ9ha9H+wAnsfZ
	 y46ERpQR+0nop0m1iGrp0WLhVPTH2TKsoiUcbr1t6fFk3aOiBhBRHNQ1hrSU0c8LqvlZF
	 2SYgFYYAOtQju+OB3CH3OcEJJh/tlRb6Fd5ASrT0U8TjZWcUU37YwditUuUIXHGRi8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PkJkQQdH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eSZ8160+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA2F606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BA2F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PkJkQQdH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eSZ8160+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36VuY2175782
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=S1PfSPwOFX0MWE8bPkRfQg
	Tr8TnbUtpYuxljXaH6x70=; b=PkJkQQdH0xbVgnXG9CyAYK6Q8uY2L3DWF/nsA1
	im9xk/28t/eZAFgcUdLVXcj9Scalrj/QoyGfvBPBZ9gB97b/5LaPR+AQfSy/tMqQ
	+HrgK9bgwFJTHE+OfeIxEhCftKcK2fefje+CC9tcmcz7gbo8eNEo8Hkki7tGWlvY
	LMqNfDtya2gh8Y3vk240gWMq+UODwpHI6r1IOkq+HDRisAAeXhGfZSi3R0C7CJzX
	xKVk/SXCDKVbVbmuuPi5dok928hFX7CFsbbcQmsEllR/SFB6knTlLg0hnp+7E/F/
	D3vR7lh0wneVRhQCpvqjYtJo0MqNqrjTrLGKD2Uc3AajaSCA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhva5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:29:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cde02b50dd6so4729177a12.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674566; x=1796279366; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S1PfSPwOFX0MWE8bPkRfQgTr8TnbUtpYuxljXaH6x70=;
        b=eSZ8160+33e2oEHhXip88djGgUjK2yvt/wJnqQg/I7i4FAxDeUjHaP7x87fyBha7fn
         E5sJsQZoTkHIXcM0LDvZCb30zdtf86QMnbGmI13e7XarEIoVnbNIkI8XfN5imsKmEWNB
         U3rRfBfRnJCVZ2WhjOAKcKxERiPp67SsaFbF5JPcKPjJteisieMuIhaqwuEHGK3bpJsj
         ZtNPu0gO6DDEHw4iT0cedXMIVKeALz24Pba2tVUfGBO+Vyog8vDokjWm7M985z2dPwFv
         6o5oHD9P9yQKf5cG6SXOrDtgbjgZg/Kp7coQ1xDlOwjhP4VOAQM7JBUUCXM11okjQjzk
         rf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674566; x=1796279366;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S1PfSPwOFX0MWE8bPkRfQgTr8TnbUtpYuxljXaH6x70=;
        b=YhvXSVInn8OPzmU1TV0h8FIp2qaeCiri/p4h4llMiyOq57p0+vO/kH2qGKOfQSzw3R
         VWZ2+9nGDXdBLB7ZKnw7ZLWjKakgxwMF5GgAYlPmpYiFKtzwaKq3BFgn29EZv9V3eEcs
         Rv1jO8ySdvILmuFkekYijiBhVXv1fKOx923NLF0pNAu/LD31Rvm/m7lq+Vi3Z+PCjJR2
         r66laXZNs7avT8PtozxY+ZcT05LKSvVLbtNuFKGRGuL9Vaw0XFAS+GeYngUQfD8/GO91
         zDVKLZXkAR1vJFR/W0DX3raTkad/ON4nueOCNy6JVemEC8cei3sWyPZHjTsvYBo9T5cH
         pUAQ==
X-Forwarded-Encrypted: i=1; AL+hErFS+/q6bSeQL5uHayyfK/O25wdSkf0y8bzR+OhoRevy7IS17zX7y+fDSb1Z4vyalUpSfs6lfylF4nJz@vger.kernel.org
X-Gm-Message-State: APuU4Z8AgvgA74YorSyarvVROh8CkhK40vVvOQ3Y/MJqgL49e1yaaO6j
	d0ir7IZOA/aYXMkprLT1UAZ9D7zcYOdLRBUOe/XA5V8E+Tf+ucuAD1vryKBxeW9cbg1FsUlodcI
	IFFbrjmEPV+kYSl/SgcmbXpbsBcuNH+E/zfDshBVjGX1msGIjrUjvmGQaJSDdkDNy
X-Gm-Gg: AZFdTZdd427VfXTDVtyBiFtdNBtRn5YOo7ypwJ8nNBe0+Xg1nWdSTpCbSCJTVdzA9ln
	ABNBkMtZ/g8hERmL38gzj+yL3FbCO55LtSKZd8fXvCggUIwdyyFtQc2dWmEfMm3mFJdjo6qeXbw
	slVuaAQGhMowh1ustJQ3xyD13Zw0jcwbyPqpCM/6FQekGpXRHEf1SBOwoQKIDTLFSk8L7DF+R+q
	8BrfpIfdIXTrzbrvjylIA45Dpr/ooDg3urJFXUhvx+SlIBdgdSLBh/eQ6Y95GPwoiD2fs5034Bs
	UQpdGF9ShP2jUuqEvrhAXu4AFBd/sPIHIFa5VMIVaQqq0JSWCJtOALbF2qUexmVL769rNZ+F0u1
	oTR7s7+unI2YcFjaayugJJfrfZlHzNNprIKs0v7uCAcSr57RdL4HfZyrlSr/mwqmSJm3XUmcxXj
	v6rY5v988K
X-Received: by 2002:a17:902:d492:b0:2f0:87fa:e3e6 with SMTP id d9443c01a7336-2f087fae858mr100200455ad.36.1795674565639;
        Wed, 25 Nov 2026 22:29:25 -0800 (PST)
X-Received: by 2002:a17:902:d492:b0:2f0:87fa:e3e6 with SMTP id d9443c01a7336-2f087fae858mr100200235ad.36.1795674565085;
        Wed, 25 Nov 2026 22:29:25 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:29:24 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Subject: [PATCH v3 00/21] drm/msm/dcp: Add Qualcomm DCP display support
Date: Thu, 26 Nov 2026 11:59:08 +0530
Message-Id: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALTRB2sC/0WO22qEMBRFf0Xy3Ay5J0op/Y8yD7mc1EzrqIlKY
 Zh/b9RCXwI77LP2eqACOUFBXfNAGbZU0nivgb80yPf2/gk4hZoRI0xRShm+lR6+epvxxnHwEwb
 T+ki4JFo4VK+mDDH9HMSP65nL6m7glx3z18gwr3VqOWtosovv61DXAPgYlLJSOhOZ045Fr4NWw
 VAZrfeWCNMGQnbOAKXYQ7BrXk8/pv79Zj8OeEt5SeMhulFMsHaidcFq0VL1PpZymVf7XYvDpT5
 vO9XZAnj/SUvXtIJrIlQreRVx3MXqxZU0TEgCtk7qEA2zGl2fz195Myc+SwEAAA==
X-Change-ID: 20261112-jshekhar-v3-dcp-e89cf035074b
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=15813;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=8adzhkTct+L8UJxlUtsJlP+OozclkRKTwrEhNyQCbo0=;
 b=zhrpjcY6ZZY5QoduKoGWgyUCTnPSi3da2MZzYzPprK0W+GjxuQ8abyYGni0Nh84SFKKhNI7OH
 NQ771JwviljAkuoGHLXY0Mc8HV6QODjM1Q6H5uQHncsELKpObkS7TEM
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b07d1c6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=tVI0ZWmoAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=zd2uoN0lAAAA:8
 a=e5mUnYsNAAAA:8 a=FiR2urJ6vj9GDEvaUFUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 439rnVCfGR_lDr-2m0Hs0eTuBb_J2xVA
X-Proofpoint-ORIG-GUID: 439rnVCfGR_lDr-2m0Hs0eTuBb_J2xVA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX8mN0/3ZvRJ3R
 UuE+bPXUI1l08sXfUU2fxk592qotbT2hworZu2l4MvR4O8NBrh6hgHg+IrzF8FLhZUYuWqORtHN
 09+UqrJJS881GfSopbdNjGL6Czs2nyQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX1pSjHlvFj9u4
 1S+3b3be6HD54yvi67YnbHT+OzU7P+kNcRMndgHkw1sDwW1Yp/yPpdFejLiCYxusxAWsg+d8kyZ
 P/Zgaci6mAbi7KTSaQe5ccPGEYmYSodJw/CaBCKmaAqEFfh/3QGhljuATpajcENZ0sxo+7Ao44e
 onV2m+h0E65ec2Q5pmE0pxIHxcUIx56Pa5MAMBjVurBnUeJ8URREE7p+PvHLIAXukVK7+45ovKV
 cqHm7K3QymZbyZ5BSF8flw5pAhID6N99/8fGS68BNOxbL6CR3ZqBUs9vaB+JUH2XM3PFXkUQHkA
 lSiyo/641r/nyi1JyMB+fh4CfZ6gimlWEhdiNTGqWyHEuHX5f7Bhu7qnZxIeWVpKy0ha5AlhCNR
 AHZHxhzZ3So+VuqQ0UnEoAkp46xeGVbHTUSBbgzE7LryeKwCQQ7UkbA+d/zyTicvVNT/bIbyWO6
 D0Ccb49lv7kTmiFm8yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

On Qualcomm platforms using the Display Co-Processor (DCP), firmware owns
and programs the display hardware. Linux cannot directly access the display
controller, DSI controller or PHY, display clocks, or related pipeline
registers.

This series adds the DCP display-function driver as an MSM DRM/KMS backend.
It discovers display capabilities through HFI over VirtIO and translates
DRM atomic operations into firmware commands, while preserving the existing
MSM DRM device and userspace interfaces.

The series adds:

- HFI protocol definitions, packet helpers, command/response handling,
  capability discovery, and asynchronous display-event processing.
- DRM planes, CRTCs, encoder, DSI host/bridge, and KMS integration for
  firmware-owned display resources.
- HFI-based DSI mode validation, display power/session management, bridge
  configuration, and DCS transfers.
- A DCP VirtIO function driver that carries HFI traffic over VirtIO queues
  and handles the DMA/IOMMU needs of the display function.
- Device-tree bindings for the DCP display function, framebuffer IOMMU
  context, INTF graph, DSI host indices, and downstream display connections.
- Hawi device-tree integration for the DCP display function.

The Qualcomm-specific VirtIO host transport is submitted separately. It
handles IPCC power notification and VirtIO-MMIO register access; this series
contains the DCP function driver and display stack. The function driver
currently validates its parent transport using the device-tree compatible.

DCP is integrated as an MSM KMS backend rather than a separate DRM device.
Firmware reports available display resources and owns the display pipeline;
Linux retains standard DRM/KMS atomic, framebuffer, bridge, and event
handling.

The initial implementation supports the DSI output described below.
Split-pipe, multirect, cursor-pipe, partial-update, DisplayPort, and
writeback support are deferred.

Tested on the Qualcomm Hawi MTP with an NT37801 DSC command-mode panel:

- Display console at 1440x3200.
- Panel initialization and DCS transfers complete successfully.

Device-tree topology
===================

  qcom,dcp-virtio                         (companion host series)
  └── display-subsystem                   (DCP display function)
      ├── framebuffer IOMMU context
      ├── port@N ────────────────────────> downstream display endpoint
      └── dsi@N
          └── DSI peripheral

The INTF graph endpoint connects directly to the downstream display
endpoint. Firmware-internal paths, including the INTF-to-DSI connection,
are discovered and managed by firmware rather than described in DT.

Runtime architecture
====================

  Linux DRM/KMS
  └── MSM DCP KMS backend
      ├── planes, CRTCs, encoder, and DSI bridge
      └── HFI command and event handling
                  │
                  │ VirtIO queues
                  ▼
          VirtIO core / DCP function driver
                  │
                  ▼
          Qualcomm VirtIO host transport
          (companion series: IPCC and MMIO)
                  │
                  ▼
              DCP firmware
              ├── display pipeline and resources
              ├── DSI controller and PHY
              └── display clocks

Probe and initialization
========================

  Qualcomm host transport initializes power notification
                  │
                  ▼
  Host registers the VirtIO device
                  │
                  ▼
  VirtIO core binds the DCP function driver
                  │
                  ▼
  Initialize HFI queues; send DEVICE_INIT; query capabilities
                  │
                  ▼
  Register the MSM DRM/KMS backend

The host must complete its power-notification sequence before accessing
VirtIO-MMIO registers. Once the VirtIO device is registered, the DCP
function driver initializes HFI, discovers firmware resources, and exposes
the display backend to MSM DRM.

Dependencies
============

- The VPU IOMMU series provides IOVA handling required for firmware-visible
  DMA mappings:
  https://lore.kernel.org/all/20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com/

- The separate Qualcomm DCP VirtIO host-transport series provides the
  IPCC-aware host required to expose the DCP function device.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
Changes in v3:
 - Split the patches into two independent series: one for the Qualcomm VirtIO
   transport and one for the DCP display driver. (Dmitry)
 - Fold the DSI-host schema into the DCP binding, rename the transport child
   to display-subsystem, and clarify the shared interface-index namespace
   and IOVA cell format. (Dmitry)
 - Model the Linux DSI connection as a generic DRM bridge and use
   struct drm_dsc_config rather than duplicating DSC fields. (Dmitry)
 - Move mode-dependent DSC setup and HFI mode validation into atomic check,
   and send display-disable and post-disable HFI commands from their
   corresponding DRM callbacks. (Dmitry)
 - Remove redundant NULL, framebuffer, and vblank-state checks; use
   struct drm_rect for mixer ROIs; and enforce blend-stage limits
   through normalized_zpos. (Dmitry)
 - Remove the portrait-specific width/height cap swap; check max_width
   directly and leave full mode validation to firmware. (Dmitry)
 - Reduce atomic-check diagnostics to debug-level logging and document
   fullscreen-plane handling. (Dmitry)
 - Split the Qualcomm VirtIO host transport into a separate series,
   use VIRTIO_ID_VENDOR and validate the parent DT compatible for DCP. (Dmitry)
 - Clarify that DCP uses firmware-delivered display events and has no
   host-visible display IRQ. (Dmitry)
 - Remove redundant/unused Hawi pinctrl states and clean up the
   DTS formatting. (Dmitry)

Changes in v2:
  - Compared with v1, the series is split into smaller patches. (Dmitry)
  - Reworked the VirtIO transport integration so the Qualcomm
    `qcom,dcp-virtio` wrapper performs the required IPCC power
    notification before accessing the VirtIO MMIO registers and
    registering the virtio_device. The transport registers the device
    directly.
  - Reworked the DT topology so the DCP INTF output connects directly to
    the panel endpoint. The firmware-internal INTF-to-DSI path is no
    described in DT. (Dmitry)
  - Updated the DCP VirtIO binding to document the Qualcomm VirtIO
    transport and VirtIO MMIO register layout, Qualcomm power-notify
    interrupt, IOMMU contexts, mailbox, and firmware-visible IOVA
    range. (Dmitry)
  - Removed the interrupt-names property and used the defined interrupt
    ordering for the VirtIO and power-notify interrupts. (Dmitry)
  - Added panel bridge and component integration so panel bridges are
    resolved through the DCP DSI host before DRM registration. (Dmitry)
  - Tracked CRTCs using firmware display IDs instead of DRM CRTC
    iteration order. (Dmitry)
  - Moved DSI DCS-buffer mapping into KMS hardware initialization,
    after the IOMMU VM became available, with rollback unmapping on
    failure and before VM teardown.
  - Reworked IPCC resource handling to use managed IRQ and mailbox
    cleanup. (Dmitry)
  - Moved IRQ-wake handling to the suspend and resume paths. (Dmitry)
  - Removed the ipcc_valid state and made IPCC initialization and teardown
    follow the channel lifetime. (Dmitry)
  - Embedded the HFI capability cache and removed unused capability fields,
    feature flags, and callback state. (Dmitry)
  - Removed VirtIO config-change capability re-query handling because
    capabilities are consumed during initialization.
  - Removed the temporary self-component shim and registered DCP DSI hosts
    as components. (Dmitry)
  - Added optional GPU component matching for the display-only DCP DRM
    device. (Dmitry)
  - Made HFI packet-ID allocation atomic across wraparound using cmpxchg().
    (Dmitry)
  - Updated bandwidth aggregation to ignore invisible planes and planes
    without framebuffers. (Dmitry)
  - Moved DSI topology values into atomic bridge state while keeping static
    panel configuration separate from per-commit state. (Dmitry)
  - Removed the unused DP catalog and resource path. (Dmitry)
  - Removed unused HFI hotplug and error callback plumbing. (Dmitry)
  - Simplified HFI buffer release paths for callers already holding the
    command lock. (Dmitry)
  - Exported the generic MSM GPU-component matching helper for the DCP
    backend.
  - Replaced deprecated DRM logging macros with DRM device logging helpers.
    (Dmitry)
  - Removed unused includes and fixed indentation, naming, logging, and
    error-handling issues. (Dmitry)
  - Removed status in DT bindings and commit subject. (Krzysztof)
  - Documented the DSI host DT ABI: DSI hosts use the generic dsi@N node
    naming convention, and their reg properties identify the corresponding
    DCP output index. (Krzysztof)
  - Fixed the Assisted-by trailer order. (Dmitry, Krzysztof)

- Link to v1: https://patch.msgid.link/20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com
- Link to v2: https://lore.kernel.org/dri-devel/20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com/

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
To: Christian König <christian.koenig@amd.com>
To: Philipp Stanner <phasta@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Flemin Jose <flemin.jose@oss.qualcomm.com>
To: Mahadevan P <mahap@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org

---
Jayant Shekhar (21):
      dt-bindings: display: msm: Add Qualcomm DCP
      drm/msm/dcp: Add HFI packet helpers
      drm/msm/dcp: Add HFI device definitions
      drm/msm/dcp: Add HFI display definitions
      drm/msm/dcp: Add HFI panel definitions
      drm/msm/dcp: Add HFI VirtIO transport
      drm/msm/dcp: Handle asynchronous HFI responses
      drm/msm/dcp: Add generic HFI display commands
      drm/msm/dcp: Add HFI DSI and panel commands
      drm/msm/dcp: Add DCP CRTCs
      drm/msm/dcp: Add DCP planes
      drm/msm/dcp: Route HFI display events
      drm/msm/dcp: Add DCP encoder
      drm/msm/dcp: Add DCP DSI host and panel support
      drm/msm/dcp: Integrate the DSI bridge with KMS
      drm/msm/dcp: Register DCP display pipeline
      drm/msm: Export GPU component matching helper
      drm/msm/dcp: Add DCP VirtIO driver
      drm/msm: Support KMS backends without a display IRQ
      drm/msm: Register the DCP backend
      arm64: dts: qcom: hawi: Add DCP support

 .../devicetree/bindings/display/msm/qcom,dcp.yaml  |  159 +++
 arch/arm64/boot/dts/qcom/hawi-mtp.dts              |  108 ++
 arch/arm64/boot/dts/qcom/hawi.dtsi                 |   45 +
 drivers/gpu/drm/msm/Kconfig                        |   26 +
 drivers/gpu/drm/msm/Makefile                       |   20 +
 drivers/gpu/drm/msm/dcp/dcp_crtc.c                 |  721 ++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_crtc.h                 |   85 ++
 drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c              |  708 ++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h              |   60 +
 drivers/gpu/drm/msm/dcp/dcp_drv.c                  |  193 ++++
 drivers/gpu/drm/msm/dcp/dcp_drv.h                  |   43 +
 drivers/gpu/drm/msm/dcp/dcp_dsi_bridge.c           |  988 +++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_dsi_bridge.h           |   71 ++
 drivers/gpu/drm/msm/dcp/dcp_dsi_config.h           |   67 ++
 drivers/gpu/drm/msm/dcp/dcp_encoder.c              |   29 +
 drivers/gpu/drm/msm/dcp/dcp_encoder.h              |   16 +
 drivers/gpu/drm/msm/dcp/dcp_hfi.h                  |  264 +++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_core.c             | 1150 ++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_crtc.c             |  191 ++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_dsi.c              |  166 +++
 drivers/gpu/drm/msm/dcp/dcp_hfi_dsi_config.c       |  597 ++++++++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_encoder.c          |   60 +
 drivers/gpu/drm/msm/dcp/dcp_hfi_kms.c              |  325 ++++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_plane.c            |   63 ++
 drivers/gpu/drm/msm/dcp/dcp_hfi_priv.h             |   47 +
 drivers/gpu/drm/msm/dcp/dcp_plane.c                | 1042 ++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_plane.h                |   36 +
 drivers/gpu/drm/msm/dcp/dcp_plane_state.h          |   37 +
 drivers/gpu/drm/msm/dcp/dcp_virtio.c               |  310 ++++++
 drivers/gpu/drm/msm/dcp/dcp_virtio.h               |   12 +
 drivers/gpu/drm/msm/dcp/hfi/hfi_commands_device.h  |   78 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_commands_display.h |  105 ++
 .../drm/msm/dcp/hfi/hfi_commands_display_events.h  |   90 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_commands_panel.h   |   27 +
 drivers/gpu/drm/msm/dcp/hfi/hfi_defs_common.h      |  182 ++++
 drivers/gpu/drm/msm/dcp/hfi/hfi_defs_device.h      |   61 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_defs_display.h     |  464 ++++++++
 .../gpu/drm/msm/dcp/hfi/hfi_defs_display_color.h   |  247 +++++
 drivers/gpu/drm/msm/dcp/hfi/hfi_defs_panel.h       |  287 +++++
 .../gpu/drm/msm/dcp/hfi/hfi_pack_unpack_common.h   |   79 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_packer.c           |  106 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_packer.h           |   65 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_packet.h           |   76 ++
 .../gpu/drm/msm/dcp/hfi/hfi_properties_device.h    |  102 ++
 .../gpu/drm/msm/dcp/hfi/hfi_properties_display.h   |  480 ++++++++
 drivers/gpu/drm/msm/dcp/hfi/hfi_properties_panel.h |  198 ++++
 drivers/gpu/drm/msm/dcp/hfi/hfi_unpacker.c         |  157 +++
 drivers/gpu/drm/msm/dcp/hfi/hfi_unpacker.h         |   77 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_utils.c            |   62 ++
 drivers/gpu/drm/msm/dcp/hfi/hfi_utils.h            |   56 +
 drivers/gpu/drm/msm/msm_drv.c                      |    8 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   10 +
 drivers/gpu/drm/msm/msm_kms.c                      |    2 +-
 53 files changed, 10654 insertions(+), 4 deletions(-)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261112-jshekhar-v3-dcp-e89cf035074b
prerequisite-patch-id: eecfd66a55b8f2b7b2fc7d76d815facca0489d00
prerequisite-message-id: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
prerequisite-patch-id: 43f30570f31419a014962e6012f98f5b341d46bc
prerequisite-patch-id: 08ffd8da137637eda4fa6d64a4a7fc5a24ea80a6
prerequisite-patch-id: eca5d1310fd57c909cedf1668e075acb966db4ba

Best regards,
--  
Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>

