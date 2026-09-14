Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F3130D402
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353624; cv=none; b=rBwS2f0oo3Rlb29e4mTECBBXeyzfoXMbbp5n9LiX9zIpNnWjecqQSNJK6rwjIEK0PyTe39Pe58vr0pm0mAPS7M7hsnwnBwnJ66HfrdZAv+en2EACYmlJ09xH3a3mu1va0i1fSOa1aTnSc8BxeE8w2r1VAWvmN9HR9GObcOOzWOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353624; c=relaxed/simple;
	bh=jq4kTlpV3uRrIiDZcZ7ot9EzjLJSv6OEC1hEhMJHiZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXonncxeTPWSHg9Ew9LMPv1GsC3KMUglaZOjdK1y/j1p13MOTAbV4IcsvONCiW4wKn+03ONgIV4KjHyHDfzivhZFMBCLwaV/m4mVGNbPDNCHRU7CA+y9bNkE3SUEBQQiH4GfG3koipFkHjcR5RpYZJagI/jrR9cmpaw77ECji9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3J5ncMo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cm1r9fuT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3J5ncMo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cm1r9fuT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06MwS3131635
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FrAt6ww/Qdnp2x46mGwqAnv807rKoS5TuTj
	T/YfBGa0=; b=T3J5ncMouHJ2hSSaJjwzn/XLHKNfj5LjULKzGTYIa7CtzABj2LR
	yjqr8LMrpeSTqr8ccpMdM6mcLCAtn/6FKouT+OKQCfCPATRrui5Ito7hk8IgjWFj
	rnMEA6rlgoRSS0vtJgkqlORvVIZE66tTDIvrEaNaImbIiPjE/X8H4HMFpp6VA2DV
	BGKxgj6+wRHj/Sib3jz03T6QfKNXFlXk3CPJ8YbWTDywvqSsq1IVs9Md+ZTH5z1V
	vfEzEQspKl9Kj29m08JXFl3H1J++iFi18AfHi21DuYtfzkfOpbd1P0ibvTG50TPC
	oKefbgPPz16OQ1pZvGwCaMGXQJadruoVpkQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c4qv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:40:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso3405283a91.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 19:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789353620; x=1789958420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FrAt6ww/Qdnp2x46mGwqAnv807rKoS5TuTjT/YfBGa0=;
        b=cm1r9fuTcb0K2ayqzG1u3FW9fHiM4/Fwjew4amyv1qyW7hb0u5NtZLAuhL+QK9TwBZ
         2ui9a83Oa21TDk27btV5J3juusTWhRkxMIHG/vlPzbBMFGEm1B//qaEIurupUFP8Y/hi
         QarMsf5ahRHPJw0uXmz2ByFe0tX1v8EFeVt/5QKyH8MdUxpdIjTm1S7We5umWNqWQhNO
         LkdWpVq4npMnksIdc82eIrRIeGtR5xpEBdlwigryvl/KMMh2wEESc44xUA8Vk1i0quPH
         9Xu5FvljG6yUfLdz9iBDTGIy2uhJnkgS4oE7F/xlU7fjanWxGgXlUw4tXtw1hHa6TZ3o
         0vsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789353620; x=1789958420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrAt6ww/Qdnp2x46mGwqAnv807rKoS5TuTjT/YfBGa0=;
        b=Mlh7GlGkfxHiJBSbnZc8EE/02zPRUrJfXN5bke3mVGVV44hb4bcx4rFvoxuNRAQmit
         YCKUxJF8xZoLkgNaLwXtE0xdZgAC/QyB7MqZ1pmRa6c+LQ4WGq6QgO+xaUTmi5XvCdhT
         psV6EKHrNj20YT4Knsq5PVyG8CdYTpk7FBpM2HBaGemwKB8Qw7UzvgNIJBf8GgTjfiS9
         CIhoVua33IeA/M586P+gsHPYT2tRni0Mh8AsynvjpUuVn2YDxreaNt9Ba/8zhJ3kA1+s
         LqpP0ILrptpdurEGF9A+nWZH/ZyZrjDBqn864up3bgqWZQyLygKb70w1Xz+GKUvn/B8S
         2lkg==
X-Forwarded-Encrypted: i=1; AKwUvByKOCXML1/DtFAeQRtYJ6/oSJIPYVvBSvakxcVSiAov7qzyVsm0Iosfbooh3Y8b5HyoMy86eJ8ovBb3@vger.kernel.org
X-Gm-Message-State: AFuF++ll6rMr0E4dxl3CW6CuFaxV5gKXJ5lPMtoSWMeSOGvGx1TTEk+O
	GLPQIcWYmvd36IkSd1M8ji/qcD9PIrLUCArEj8vVaTurnKBJr16Tojdro8tRJziMaQw5Jtyzw0p
	W4slsxgR1nLY8cNpk1sQ8gt48NhBThaLpktBdtN49sbuPJAxtu0+i6rkdtAZrqEau
X-Gm-Gg: AYBFou3ucEyA27p5mWgPmzbEg7m3VcEJlpKW8DCiysSYAHGwJnn1nIGj2SgzmK2toOs
	Hs2VjQmIh7SHqwagTMCPUiSdM0U5WYR0sk86TFvx8jYu9/LrFAXLUK0eOy/cVMtzPxOBDxVtB0Z
	STgY9MHOOUI+btD+oTwn3pe2aGB84nJWNtp32c+rhukXwcy8XPHLTMpMziixtYLYq+cz1YS4NGe
	ZP57iQ0nJJpqPq+AyUkJoUa308S0bojwKet3m337Sei18zYi/DsTS5D+PwhXAziBhndGER6gcjw
	yS4f0LfC/J4yrQCHbEeSrI8SNi6yQK2IohITv2UEffBlZ+A1Cb6/XqemjGOZRYes7vFisuKxOea
	RmvzaQOJiXCFm+2nCa5vrDoaXzvw9AdtDiTIyaXLjDrE4E72iW0usF0IEZpYF
X-Received: by 2002:a17:90b:1f86:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39debdfb22cmr1677062a91.0.1789353620362;
        Sun, 13 Sep 2026 19:40:20 -0700 (PDT)
X-Received: by 2002:a17:90b:1f86:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39debdfb22cmr1677007a91.0.1789353619937;
        Sun, 13 Sep 2026 19:40:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm25943953eec.17.2026.09.13.19.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 19:40:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: Add audio support for Nord platform
Date: Mon, 14 Sep 2026 10:40:00 +0800
Message-ID: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gNylDjOyss4R1ctewxtvdg3GInEhoJlF
X-Proofpoint-GUID: gNylDjOyss4R1ctewxtvdg3GInEhoJlF
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa75e95 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rXtzl5NixRRfy2LdUdoA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX02BYUmGfqmbJ
 0uVJrbUQiE4bUwl4dglH8PhrHdBlNH3Kg7Pu96MhfAYmZX+BEYmc0WFZ0spnCZnftEXv1X6EBn+
 gTPRQ/9wUl/I6vYBkwXXiuABhMfZio4ycZPNWFXvY9ZnqL6+4Nz1UUraRf8hjF5wQQEgk4sUVLd
 RfaxtqQb8MnV5uzH/SIclBovTjfdcu+QUwcI8x8XdOLwSCCkZue1Wlg2rbeGP3mqeTsRuxVcK3k
 uHryKFz3yqEDIY4iFEftW13Fefre9JehzYFX7YO3FWIo43fytmI/CqIKek9D2rue5a9HVU7T1qa
 96/AcdRRWAk4cPeOQm+izWD7VKZopurHmtV5xUBvLuanCvaamGpr9LfWsy4diCDoZG4uchoT7bQ
 hRFdTPsi2hdrCeDc7DunZhg9jDIQF5VNzXyptuQs84xwrWRQR4PwjM/uYgvWXTMT/mArBpKMTsl
 Jrai12KcJerbRfdiZ2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAzNSBTYWx0ZWRfX2rj3We1wuZNI
 8GUJEVjcWDFXWNZBWlWz0mxP+0HcxAp8JQpuasi7+PU3hRdVF+hZygFc1ELFulrKWHOFcrljRe0
 RiapWt2YqX5tLptDNpKVfMVxZMWpYIQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140035

This series enables audio playback and capture on the Nord RRD and
Nord Ride SX (nord-ride-embedded) boards.

The first patch adds the GPR node with the APM and PRM services to the
Nord SoC DTSI, which the Q6APM audio stack needs to talk to the ADSP.
The remaining two patches add the board-level pieces: a sound card with
a PCM1681 playback link and an ADAU1979 capture link, both over
Tertiary MI2S, the codec nodes on I2C18, and the TCA6408 I/O expander
whose hogged outputs gate the DAC.

Dependencies:
- ASoC : https://lore.kernel.org/all/20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com/
- Prerequisite DTS: https://lore.kernel.org/all/20260911142040.100263-1-shengchao.guo@oss.qualcomm.com/

Mohammad Rafi Shaik (3):
  arm64: dts: qcom: nord: Add gpr node
  arm64: dts: qcom: nord-rrd: Add sound support
  arm64: dts: qcom: nord-ride-embedded: Add sound support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  30 +++++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 112 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         | 112 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            |  36 ++++++
 4 files changed, 290 insertions(+)

-- 
2.43.0

