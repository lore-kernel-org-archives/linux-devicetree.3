Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AB4383C7D
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846757; cv=none; b=qf64SKe/SeliZit/yae8IR7QJzVvPrIiB7a0rLsimxVjpw8AzDxRiFy+WFEbRdWhuSZQ5K3AfAmT2HXYOk0d8lUS1P3TSpcE89SHzBO5jY8Kkjv0NNIQnEKlkFrIFe0Cj5XIpqLG7NEwS1doOSOjD5I1tzb768tPWp56lAqFbjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846757; c=relaxed/simple;
	bh=UQFiLl7rsF/Fmo0bCFTVlbxdjX6fNtePyw7SzgPkWNU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RAojOEN7/krc62GLILnOlP+0NuiVlDXBczpnNvnBVinbYXXVXBFlS+y84zla37wqHiNY1x0FKTYuHmlEZzxFYLiVREXS/VMimbDYPJ44l/Yz7c5Pf8/KDuso/qcMl0uUJtqSUI0Nm3cMl0a5gk1TX3UYVGS6VtMUAULuK1S3bl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1gHboA7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LAcc3frD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1gHboA7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LAcc3frD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CJuD3373748
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 12:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NKK9zzylXUCpx5WJ76ms5m
	Mf7+63cI4aasBg1+QgXAc=; b=D1gHboA7AOIIHfN1aKlr3HRoAYiYmLzdWJYtrd
	ygskirEaGeWjsLqdhBi5HYP3fWEVaMBqsLrWif3TcRCnKU/q7kZ0jlIV7pRQC2kg
	7U/5cgqF8duFg+GgbxiaiBy7BJZV6vT77MLq9fccIC7yz7TE+pFev7N1FXoc9UTA
	vv8B9Jsx9LtFR5vQzUjX5cSDsCWJVwkG75zXTViiNX7qXmDCuft0sG8xMAgQYPMS
	XCP5Mg0ftpEuAJNbE/+gcanZU90ROppcSAiM7gbow6G2n+GXhli6j4ieP5hXgt3T
	FSFyLIaELfefzjqhcN5eTYkLshlapTY4r0fYDCt2N/jZNmiw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3r461v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:32:33 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6b5741bbcso573784a34.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846752; x=1786451552; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NKK9zzylXUCpx5WJ76ms5mMf7+63cI4aasBg1+QgXAc=;
        b=LAcc3frDShGDQ4kZBe/FDO7JRTtlen+DsYWIaucrAtJjus/1+bCTYVqUaaSrMJv5Ql
         iD3tzYnjrr867yV2uDUWSyJv6JgBoS0IDTHIOHzadlfd8h/Pa/2wGdGbSAtu8QHo3ImT
         FEIisJc2wc81bVEeO7LiQqBg2oxeOz5vYYKE6UQBQ8e68uAPR1Fk4Azgu7G7dhRftQB6
         ZEymahAc4ZJKxOvjXs0zNqlz1/xDEdsnXtTURMTmOFdgUqHlPmvwK8y0XwhCUno/X0zK
         /1FW9QCGnqAw7eIs6oFn9jtxVeAKdQzoyIHTJRHEEV4+WAA6xwWhfM3CwJ/hzUBcIt/A
         BYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846752; x=1786451552;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NKK9zzylXUCpx5WJ76ms5mMf7+63cI4aasBg1+QgXAc=;
        b=gQUAUs+UVYdhE7rdfpafuglO2jWWs4T35JwqfvpwE1xIAD3Gxf6V1/fvWp+DnsgsQr
         eGBzBHPNiZ1+enVFfMceLC+I2W7+EkDD70x7uK1QBa9jgewjEQOfd5cTghQY2usiJhpz
         YGI11tTcsVx2YmQhVA5GQK8iTMSmIqtxaoBlFIsg7w6Be+2kNxZRwobjbAzRFnSbSdWd
         Hj2MKss2l436NTdi2JpqrXYLuzvOBGsWEaQ6lQeRWp4k12ky7imvmaknR2el+0DMQGwZ
         MdZe7EOjCz5IPiYVXNiCYLp9HVjWDdvgVh58+gkRLa+ADFBKlnxxtUjvaaOJSlrcwvha
         vb+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpZBcLzNucxygCrI+9lyZm2daFn8Oz0/FyKG3UhyGZxH7SDpDoj6zGAc8sznZTplQKmz2Y3gvToSogi@vger.kernel.org
X-Gm-Message-State: AOJu0YyjbmVoJAVWA35mUZt7AIKVJPl/rpsm5T2IaciCGMmOaWkN1tS7
	7yACxwcFXAPCLoU3sogOegZu0ScGXpmX2jADMTKn9x0vyt01Aa1UFhm4Z6fVgkuCp42xiIQxUvI
	l+1YQdkQUyHoYlsSqt17wl3baCeKRVoGVXnT/lAPS1LznF+g7+MeIXucmW7TZQzzm
X-Gm-Gg: AR+sD13zGtztFPU58oxRCUeVdnP92mEJDTawVb2yYJBHuRqe+TCABniodjfY8FCDljI
	/2xHvD9GYmcqZ0pL/G6s/Uvsv02o2REylbufV1xpYA1WHoqehOvF4UHjXVGOUxE2xZKZ5ynl+ze
	vmko0WqEGXm0FKm6RKKbtMEpuZOPwuyCvUp3xKgRkh6BfMZjiD+NuHsH7jDmtskOThBrdlbZQif
	dxEvF3Haa10BHPCjpKgbqHHREeUWGQtqpsdhGTmjCn9V9b2qu76KtFlviHvpQw7flVecH1BpszF
	lm/+ripAnw9F1l8iEsSUvhRk7XMumY170xaB3grfgXkZ3y109YSNKXPVZCPjmmlVz4K+bjU5qnU
	zp5G5jU/mTMcrsgIQYthHTUBnBfhHqh+rOLp3045Uf0PKkpVkJNo=
X-Received: by 2002:a05:6808:1487:b0:4a4:da68:943d with SMTP id 5614622812f47-4af5e31db0dmr14240774b6e.3.1785846752542;
        Tue, 04 Aug 2026 05:32:32 -0700 (PDT)
X-Received: by 2002:a05:6808:1487:b0:4a4:da68:943d with SMTP id 5614622812f47-4af5e31db0dmr14240754b6e.3.1785846752028;
        Tue, 04 Aug 2026 05:32:32 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f6064d2esm12227013fac.3.2026.08.04.05.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:32:31 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH v4 0/4] arm64: dts: qcom: hamoa-iot-evk, purwa-iot-evk:
 Enable M.2 Key E connector
Date: Tue, 04 Aug 2026 18:02:24 +0530
Message-Id: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANjbcWoC/3XNwQrCMAwG4FcZPZvRZe3qPPke4qF2nStYq80sy
 ti72+0kqBAC/w/5MjGy0Vliu2Ji0SZHLlxzEJuCmUFfzxZclzNDjg1XWMOgfdDgEbqRICEgb5R
 RAivZtCxf3aLt3XMVD8ecB0djiK/1QcKl/W/l4bBFlEKbilf9aR+IyvtDX0zwvsyLLWSqP5n2m
 6kzIzpl+xaVkEr+YOZ5fgPioOhb/AAAAA==
X-Change-ID: 20260723-hamoa-m2-dts-v2-2067c7421569
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a71dbe1 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=xQ3PatI_n2DDq3JNOUQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX5zEsj0lBKO+N
 ilQhaodxn8N3/2ICCUQBpp7vXIdQ6rO7kUsrykyQu2aWBzCjHoujfHVKdQLAkBOTAWrcZzo2uFg
 ck3KBo9zzDxIKrLbIAbwEfGOczD5Yw0=
X-Proofpoint-GUID: ilrb6RsT2jTY8LKqF-nOAsQk_M3Eavju
X-Proofpoint-ORIG-GUID: ilrb6RsT2jTY8LKqF-nOAsQk_M3Eavju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfXzl3arTcqpG+X
 +5pDq+CurFgDdc1V9SMFsBA9PeRoAeKJN7piTo2ZSzNEo9J0X0XuwWtBip0PxQ/+SV9rGeDSHtw
 YNOhPrdnGkIqCjE11NZsV6TryKJXdBjbHSnhYwydkiTHaBs2I4QdB8BXqoFIVTZGcAI49PHK1Jw
 +p8pX0k0/BqJnIfXfQFl420Xrqj3PsQf29s00R9Xjyparrh9IwppugksOZkgvdhnMC0Q7/Vctar
 mfk03dNgFLVGJ/wR9BVw8aJjfvfwQKiHKEP5bzRHyt8sdM7P4C4rtyUsDSCI1x97TiT68jK2tUB
 rdJAmz9bPCf4Ojna8cpduclhM57Vz1TR70yCqO73d/u76qfdL8GS0SHmGMplqEiyK2mo3ZA9bhf
 NXff9wMqUS44317nApAu90BJKcJCIsFzZTp+60dOBFUr15Sms29S4+Aetc8vz862zrSFa7cav6X
 tD8tQVIb5EzepH/VKBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040099

Describe the PCIe M.2 Key E connector on the Hamoa and Purwa IoT EVKs.
The two boards share the same M.2 wiring: PCIe for Wi-Fi (via
pcie4_port0) and UART for Bluetooth (via uart14). Purwa inherits
hamoa.dtsi through purwa.dtsi, so the endpoint stub labels and the
PCIe root port compatible added in this series apply to both boards.

Only the UART BT path is described here. USB BT variants of the same
M.2 slot need the USB core to acquire the M.2 pwrseq target, which is
being added by Chen-Yu Tsai's "arm64: mediatek: Add M.2 E-key slot on
Chromebooks" series:
https://lore.kernel.org/all/20260724084328.3943997-1-wenst@chromium.org/
A follow-up will wire usb_2 port@1 to the wifi-bt-connector node once
that lands.

The pcie-m2 sub-ID patch that was part of the original series has been
sent independently and is already applied:
https://lore.kernel.org/all/20260724-hamoa-m2-sub-id-v2-v3-1-af97de70bbbe@oss.qualcomm.com/

Changes in v4:
- Drop the usb_2 port numbering hunk from patch 1/4 (was "hamoa:
  Number usb_2 HS port and add M.2 endpoint stubs"). port@1 =
  usb_2_m2_ep hit the snps,dwc3-common.yaml "port@1 = SS" schema and
  was NAK'd by Konrad; the outstanding binding question is discussed
  in Konrad's replies on Chen-Yu's V6 series (patches 6 and 11):
  https://lore.kernel.org/all/c6526ba0-be08-46c6-a501-1b161939657c@oss.qualcomm.com/
  Patch 1/4 now only adds the uart14_ep and pcie4_port0_ep endpoint
  stubs (Konrad had asked for these as label references).
- Drop port@2 (USB) from the hamoa-iot-evk wifi-bt-connector node.
  The connector only advertises PCIe (port@0) and UART (port@3).
- Drop the &usb_2_dwc3_hs endpoint override.
- Add new patch 4/4 for purwa-iot-evk.dts, reusing the same connector
  layout and the labels inherited via hamoa.dtsi.
- Drop "Depends on:" — this series is now independent of Chen-Yu's
  MediaTek Chromebook series.
- Link to v3: https://lore.kernel.org/r/20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com

Changes in v3:
- patch 1: add uart14_ep, usb_2_m2_ep and pcie4_port0_ep stub endpoints
  in hamoa.dtsi so board DTS can reference them by label directly;
  remove superfluous comment (Konrad).
- patch 3: use &uart14_ep, &usb_2_m2_ep and &pcie4_port0_ep label
  references instead of re-defining port hierarchy in board DTS
  (Konrad).
- Link to v2: https://lore.kernel.org/r/20260723-hamoa-m2-dts-v2-v2-0-82254ac101fb@oss.qualcomm.com

Changes in v2:
- Split patch 1/3 of the original series into two commits (Dmitry).
- Add usb_2 HS port@0 (new patch 1/3) to pair with M.2 USB port@1.
- In patch 3/3: rename pcie4port0_ep -> pcie4_port0_ep (Konrad); add
  port@2 for the USB BT variant; remove unused vreg_wcn_0p95 /
  vreg_wcn_1p9 (sashiko). Konrad's v1 Reviewed-by is not carried as
  the new port@2 endpoint and vreg cleanup were not part of the v1
  review scope.
- Drop patch 3/3 of v1 (W_DISABLE2# else-branch); the Chen-Yu series
  handles it via USB pwrseq (Mani).
- Link to v1: https://lore.kernel.org/r/20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
Wei Deng (4):
      arm64: dts: qcom: hamoa: Add graph port/endpoint anchors to pcie4_port0 and uart14
      arm64: dts: qcom: hamoa: Add compatible to the PCIe Root Port
      arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key E connector
      arm64: dts: qcom: purwa-iot-evk: Describe the PCIe M.2 Key E connector

 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 130 +++++++----------------------
 arch/arm64/boot/dts/qcom/hamoa.dtsi        |  11 +++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 129 +++++++---------------------
 3 files changed, 74 insertions(+), 196 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260723-hamoa-m2-dts-v2-2067c7421569

Best regards,
-- 
Wei Deng <wei.deng@oss.qualcomm.com>

