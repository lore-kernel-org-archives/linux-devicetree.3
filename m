Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994911;
	b=at4vMXj0h7aDyIhbUmYUFGfuXG12/w3qn2Lpt6fgaQq6uImJW73FJeFkjYeF0o8lozWy
	 PoOZUDXpdB8n0/5iU4sArxfpeDZ2UJUT+YkJxv46Lp3eefctIyXdbc6sVDvG0Y9Fw5uez
	 xIlXj51nX7Mds7H3kZo2WFqiJNL/9CoOVdJ7hn/6YpxeBagvff6xwmf+lzHDqCnNoUHa6
	 toWjBjTmOkiL5pNbhXAD1wDtXaOIt/hqL2BgdclJo4/l2CW8owcuFmjnw0zPtp5slar4k
	 PJi9g2Lqoo+QqEztkz4efrovrq/C0UV8JdMJ3tvaB0fe1kPfVBpFOR8aOK6ySu24SfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994911;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WNtGvVo+q7V4CuIbuYEmcacPVNX7AvGMLHWgHNKSrbs=;
	b=EFcvnZSNt55vuvg7IwdMHEgp7lUUDQPEKRmUUZ9KeFVwivLxkcT3e+KZZAAv1nzBABCb
	 WVIFnjXEfbeSXtMIFcwGSEic9qAmPS3EoeVZ4vG6y0p8f57QZQ9dWWfHQTk/qb1DOhN+K
	 FOe/CAWJvyyzd3kxkSzg7bNxAud91f/jZUGXXNHwRBtPsWGqWBZ66/uGAYnWp0C7tcfWa
	 S+ywkhzlqGRges4fEtr1ltGR16LpceEv1D0I889B9aXWuj9zM5v26TR2y8NAPURL/L6jZ
	 rwNCySrAN9u3rDehgwxVPyAndJ73p9s1cukMgO4Gk6URCfFh/gcW7uJffjVE7Eoi1Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SLJOhSsA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c9H6yVWy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6AA606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE6AA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SLJOhSsA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c9H6yVWy
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8gnGX2106389
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WNtGvVo+q7V4CuIbuYEmca
	cPVNX7AvGMLHWgHNKSrbs=; b=SLJOhSsAGStmBlJG9OVxVQwr14UCDi2vQTLWB8
	s86kshlgid6M5o0GyCzLhDbOQaLdP+wZIAkLYVCbAvxUb+l64LWYTArPDLVdiGm4
	H5f0rn+yEtoXHeonW8UVydGnkbwEqXgKyzSbIYEhpCiXSweTRZI/UOj+wPwfFzMk
	yil38lG/heAWYyQFLiYolEz2zMmfBAy2hFoZDXJfHCjddWzGr5REpfckD2WxxIv0
	iJIY4nN4WAkkE07JKyktk4DiLq5Mxk2m2ksYZ8IFZOm5yEIJS1Ir9ye/8azKq0hl
	Ub9aCPwaqAjuVc2QPDgMN7k0JTCW2Tncn29nKvuvJFIvSN0Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8tas1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:41:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9995cea88so6598995ad.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 01:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994908; x=1795599708; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WNtGvVo+q7V4CuIbuYEmcacPVNX7AvGMLHWgHNKSrbs=;
        b=c9H6yVWyE3mLHQoHVrVSo7oq8Th9J2Q6GtUnDotXfW+YQ0sErODLgSHVHDji+1sDZE
         WLUmdfNiaVHdroN4QiAEazILonRxMVtMCDWS0L1OV6WHGi/4ve0xlw4mk8TLxWYwZ4eL
         DAdJ/uVTkQD9AF2TlUozaNaJW+SGhbC5om0WkVLy+dj8Ujfm/hBb7CVfdso/tSXb6eIL
         b97RP8flnaSThfdLRCRHrRW9CEIigqpGB/maCz2xueIEt5yVrSFwAWVW0ki23Sg3cZRe
         +14hjAUcBF1WSSP09LW3+penxP9VuCFbCVlWaQt0yboz5YaA48OZrr3aY106aCGc+WlF
         BcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994908; x=1795599708;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WNtGvVo+q7V4CuIbuYEmcacPVNX7AvGMLHWgHNKSrbs=;
        b=BaNmEdcgJ8Jny2tmHwLRdcOdmQ2IbHWcdJkvfBnImnD/vIKVoiH9pE4yYUWHCFHPIX
         beQ0HLkBhSTwjRajH8gJtiWYwNTx5wWxHdainNIIh5ZvrXt7et2yXtjYivKe5EdMVVOc
         q/xdElxiSEt5EMC8u95tGJkexGNnGIajil4h4DFN2Oas9eQxx/9FIbvsiN3ThlQXqctD
         x6IdAOwzycpCmfJagrEJYVYSf3uH2Ksmy9Mlmp3C1EhwnYA+i6t2fK4J4I8aCtS93nr+
         4vpyHRtEEqPHCzf90Mw4KIVVsrUswMMPBOkpDHSn+ir8+j1nYC2WMTpVOblSXNwjPhL4
         HEpw==
X-Forwarded-Encrypted: i=1; AL+hErF9Lu2ZlI0Xk6ypuO9IeZUDb94bG5ZFtwGQCA4XOvzh2DqTfff/Ru3NIxFzqk9ZWmgor5JPGcEyIC1K@vger.kernel.org
X-Gm-Message-State: APuU4Z8bFrv8rYKs6dKbrauhdHsOlR5OwpDtkj2hhaN0coEpzD/n5ThN
	ZEnVaeZV/dMPYEdx1hVZ8YZ969p2EbYfMST9n5ivQ0BDVSabiSMXuRvTbSRlniHV7fDfMt3l0mM
	gzqoI6mrrVEyEjr2hxBCB49e5VHXLdRWlLqAN2S0YEyrtiC4a5E2gs6xVZWwuaCxT
X-Gm-Gg: AZFdTZdRJS+EsuPva1XVTSvc7LVMpME+OTt7LBjgwNhfknPF5qVuWYF686mkE2P55gS
	D4eaIprO3PkJ4XtBsXJEHxIgGfek73rPcc18V0SUYxNF67cNu4yy8JpExB+D+Ns6sO9r381FKhQ
	2xw7m0DpWa4qYRNnw/uNoNw+Gj7RGR6XbRj6aUan8y0dj2ZGiMUNkCBCABMRC9WcMMSKqbb3kS8
	cwTborqGldOozayNq9j2Kyk3bIi8wKwFOgCh9+LDFSFT9PrsbRqlLtCX4dFxANZ053q6oQBtFOo
	8vbutZfQBxOG1rtYpl/srWFWht8w1SswShSRgXh/fE9Pmq6C6krvcNjevRKWHcZC8w9P5Vy/KeF
	7LUl7Z7F5UowLNmApM+hMgErHAc5Aq0M/KHHMUA9Yp5kBXN6eaIYHVf5zUvTS5R4c7myinOApmn
	CWzmfFYVwB7a/WYw3ibosWPdB3HlZFjHVCUITuA0FMLVaFhv/u
X-Received: by 2002:a17:903:2c08:b0:2e5:e1de:9c3c with SMTP id d9443c01a7336-2eff754019dmr21055315ad.47.1794994908366;
        Wed, 18 Nov 2026 01:41:48 -0800 (PST)
X-Received: by 2002:a17:903:2c08:b0:2e5:e1de:9c3c with SMTP id d9443c01a7336-2eff754019dmr21055105ad.47.1794994907851;
        Wed, 18 Nov 2026 01:41:47 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:41:47 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/8] media: iris: add support for hawi platform
Date: Wed, 18 Nov 2026 17:41:39 +0800
Message-Id: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIANNy/WoC/33Q3WrDIBQH8FcJXs/iV9WUMvYeYwQ/jq3QJK02b
 qX03WfSXQwWdnPgiP78n3NHGVKEjHbNHSUoMcdxqA1/aZA7muEAOPraI0aYJC3V2HjfxRRzF8b
 UHc1nxJZr8EJBYEGg+u6cIMSvxXz/ePYJLlOlr89DZE0G7Ma+j9ddo1ywQbVOSic5aKLAiC0zN
 pCtkCCD9FJzbuRM95CzWTLtmv1PJIUPp1s/JVwoxQQDcdq6lgol2NuY8+YymdP816aW11WEUsJ
 xOU9drNfmWkydbPCnOBxwkTMqrDReSxF0WEHnKY8xX8d0WxZZ6DLmPzsrc1TjJAmebl2r7R91Q
 Qv7BTG+BrEKESrBcc+EVe0K9Hg8vgEkpnTh6AEAAA==
X-Change-ID: 20260918-add_iris_for_hawi-b38ed47ef2f4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=4687;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=AzXYXPT1z5vEJC3oFwINMNRDtv//CMnbNw93o+dTQ4o=;
 b=AynjC0Jwe0oZ8reee+caeBlVNTDjX8ziiWODwXyHs+BKQGjNDZ3Z89x7Z0cqvIbUxLg9n1mcI
 24RZj2FQp0VCVOkwBSAOx/nznShcQYJmNZiEOqe/O3PKrnPnhaNam/y
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: jP9v9f-8KwGbOfFR1RFAIqsPGAcwJblP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX4N5UmPfRYGF7
 8ZCE0YpUOBgBedheBIHZVKoQwUnqrtU4EiTgrDwcJeGkj3BdkkDkQoqZyEQTcdZ82mRXZ8iwqIY
 l447u5hKexHuD9S2LYdKiMer/Iojb7g=
X-Proofpoint-GUID: jP9v9f-8KwGbOfFR1RFAIqsPGAcwJblP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfXzd6mUcKPvnUm
 oafzdBVUFmuULg0jrlOIqDnIsqaJFPj+LJkdalWpLM+ehpPermvJbGGPmkUFeQGH8gWF3aBmXCc
 gmREOjIvxsVuS8tcAFMCd81iUtqXu3XaBc7BqiR624aSRAtAs57WYSM7neaSyNCOnsVCFcSgU7g
 1Yp+JDFUxsCzlCIm+qIrv1sqqV4zxHif3V7MOMCBofknwMu3bMu630UVCyZ4+cPiw5JwBXDi2u+
 9nmxaBb7TxXJ7473D1IpToOAnC0KKPmmPcO2T4xmC2N6sta1PSy7R9800HDlHyv2i3iJyN4JGqS
 WF4tKcU9f/HxS5lD+7bkU4ACm8Pr8dRhtNzSIVYmJEDAjsOI5TRo6Rscs/NL3JhVyvhcA0YOUA3
 Xfqs51UjMj5GsxvwjE4HnwojqL4t1Kquz15X6QUmRYlYresES26B4Zpmp3CI13CnzJga9TGLKX6
 YbtNOeUiPWlCwzwawlw==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd72dd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dfU1N7ktxWVFpldvRUwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

This series enables the Iris video codec on hawi, allowing hawi to
use hardware‑accelerated video encoding and decoding.

Hawi brings in the new generation of video IP i.e iris5. When
compared to the previous generation, iris4, it has,
- additional power domains for internal NoC(cx & mm).
- additional clock for internal NoC(cx_iface).
- additional power domain and clock for apv codec.
- different reset lines.

fluster result:
H.264:
Ran 77/135 tests successfully

H.265:
Ran 139/147 tests successfully

VP9:
Ran 235/305 tests successfully

Dependency:
https://lore.kernel.org/linux-arm-msm/20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com/
https://lore.kernel.org/linux-arm-msm/20260917-glymur-v11-3-e0c8bc914742@oss.qualcomm.com/
The above patchset cannot apply cleanly; I have rebased it locally and 
tested it. And only the third patch from glymur is needed.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v3:
- Rename the APV HW APIs to more generic names.(Dmitry)
- Implement HW ops on top of glymur.(Dmitry)
- Add firmware-name in board DT.(Dmitry)
- Link to v2: https://lore.kernel.org/r/20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com

Changes in v2:
- Add device tree patches.
- Link to v1: https://lore.kernel.org/r/20260918-add_iris_for_hawi-v1-0-ac60fd15c98b@oss.qualcomm.com

---
Wangao Wang (8):
      media: iris: add AV1 decode buffer size support for vpu4x
      media: iris: move shared APV PM helpers to iris_vpu_common
      dt-bindings: media: qcom,hawi-iris: Add Hawi video codec
      media: iris: add VPU5x hardware ops
      media: iris: add VPU5x internal buffer size calculations
      media: iris: add hawi platform data
      arm64: dts: qcom: hawi: add iris video codec node
      arm64: dts: qcom: hawi: enable iris on mtp board

 .../devicetree/bindings/media/qcom,hawi-iris.yaml  | 256 ++++++++++++
 arch/arm64/boot/dts/qcom/hawi-mtp.dts              |   6 +
 arch/arm64/boot/dts/qcom/hawi.dtsi                 | 155 +++++++
 drivers/media/platform/qcom/iris/Makefile          |   2 +
 drivers/media/platform/qcom/iris/iris_core.h       |   4 +
 .../platform/qcom/iris/iris_platform_common.h      |   6 +
 .../media/platform/qcom/iris/iris_platform_hawi.h  | 102 +++++
 .../media/platform/qcom/iris/iris_platform_vpu5.c  |  89 ++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  34 +-
 drivers/media/platform/qcom/iris/iris_vpu4x.c      |  92 +----
 drivers/media/platform/qcom/iris/iris_vpu5x.c      | 448 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 160 +++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   5 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  74 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  14 +
 16 files changed, 1359 insertions(+), 93 deletions(-)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20260918-add_iris_for_hawi-b38ed47ef2f4
prerequisite-message-id: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
prerequisite-patch-id: c790c17f7113da72001a1b83fa0dc0fb82e22760
prerequisite-patch-id: 5a2f89fdc7312d46f01aeb1507c3d179203c1357
prerequisite-patch-id: 1e1b6daab984b81b7ad83108fb532ea25345638d
prerequisite-patch-id: dc22e163717edf23b847a79af253c6b85bec58dc
prerequisite-patch-id: 2cc01cddaccf18ead1c1e2506f0182193afc1dcf
prerequisite-patch-id: a1e82173cdbb9c315bb6cce35108a7a4057cb235
prerequisite-patch-id: 4ed1c23d97cb438c917ab31f4193c58e3deeecda
prerequisite-patch-id: facfccd32a2f70f2bae3357106a3fe493b4c8c32
prerequisite-patch-id: 59bcb5096aef6258f4732dc8f8789c3e846e16c0
prerequisite-message-id: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
prerequisite-patch-id: e1330b5a848460d14cd6574877fcf607d269d9a1
prerequisite-patch-id: 20d099e89443a097b9ec5b297f0129d9874ca54b
prerequisite-patch-id: 2a36ab03d78d8e9c19c900e203b05739a9fd1123
prerequisite-patch-id: 155b1d8008509ce41a1c0c87b85967c8410e238f
prerequisite-patch-id: 9e71460e2d5f1e4e2993819f4d9fa27c076946f1
prerequisite-patch-id: dc5329d211e9bb5af1d54f82092fe6ce4690baab
prerequisite-patch-id: e34741f76b6919db19236ead27c966b789736e66
prerequisite-patch-id: 359d24229ad496633892e70b1cf88c2d88dfad24
prerequisite-patch-id: 6e2e9069cb620143aa305b7b29b8b1982dd0648b
prerequisite-patch-id: 3e5fe6ef2271be5263a4bf7ffbd77b0996037b27
prerequisite-patch-id: e051524017c9f39f8593fb9d2e982e6a4c39fb35
prerequisite-patch-id: 1b4863f7a7f3a8390c825d76805e8e99de97a2a7

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

