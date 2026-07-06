Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381433FB7E7
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 06:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320170; cv=none; b=QUZ+BZrfX0++a3critD+dhnGhRS0+5C8ATEhjHhBZJvdOyPz5wQClv5v16Ge7kcGSA0Fp5xGrSbE3uccciTzi3VKKmRfuIqxqQBDTmneoQ1ZmUNd+TupQJ1E09XhmnijiaTtQ0wkF9skKuTDcuWB545EIaUU6uYntQfDR8oIDc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320170; c=relaxed/simple;
	bh=lr07Sa1LL+bANOHURraO7areoYwhIVnfwu0qiDwHz+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e86ez5nWnKZzKB8Cl4Gh+FApYzsaQHyKdWUgdS/+TEEwA3h7Yh5B/Ta0tJ4WsyPD0x2JlAVM2ebqFnQw8vp1ORdwnMFURvRpjptkQZyFYAXWPdpyC2XqgqY/hhKK8xdx0OftvhCd4k7dZtOVc27R+skGHen16aWXbxMW6esm6V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggsDn8lV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gj/p0Fw/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggsDn8lV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gj/p0Fw/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666424dO3624983
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 06:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ubG5dDnjAv5lWaI6kEtVG9gBsMiUc2gOEKI
	VnVftgdk=; b=ggsDn8lVm+EZsFfYH1nhjQVP/Y/r8XS/FoU7THgHY6NEJm6S5wX
	DvIdrCGc4QkRWHUvoDLFM7qLjKrDDJDZgGwPo4udtbLPcqzERi7OwUHBjLkyhMG5
	94jEemLRxjVf9viWpN3fysFN9XGt9IfJJFn19z5Cpf3uBELcnf7flB2xRP4mdQc8
	Utw/dKw5cy1F7QN6TN1RZOmj8eo7P6gHKKsqDUqFtutLvC+PLHpC7GzpYkrlG7kO
	29t8jJ1yBl30eRhviyh/vWdZX1d30lUAVfvBz5XWML2rCwGbgkmKvUMn2yhZIRru
	uyRbLh1GxBgtE9eyv4k8UlpUqwKVv8kCrxg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sw06p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:42:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e9b9f30d65so35282236d6.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 23:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783320155; x=1783924955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ubG5dDnjAv5lWaI6kEtVG9gBsMiUc2gOEKIVnVftgdk=;
        b=gj/p0Fw/TYzfueMHuMd58vu4iU2jUeZZHxD8ZVx27vAxtveHPqRwDmIP0fqtW/y0sx
         q3nV3g/0SmRxKHzauk+MSTLPXY94r60MUVHiydRBhkc8PZ1bR55QFnidQMtuXtNSsKJV
         hCxPt2BPJ+Qr39PJEOtKtct1GjsP2Qrdx3xDxcbItedXXEPtn1FT8yGak4acH3kH6QiW
         /P7K/k5175aa/HDPnAJ+qS6rT99obILdwGPlQHRuK/FamqzV4PU93c64id3HaUAvunVS
         bJtEZPyi3pp2gGiyy3k05CP54MoCR+oRLvcQlRH3NC+7abgBoCD8IIToPvynoF3DKwZU
         e6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783320155; x=1783924955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubG5dDnjAv5lWaI6kEtVG9gBsMiUc2gOEKIVnVftgdk=;
        b=BA6oJMcfczdXXVNnCy5+Ww5FCHFZdn2nGhY9pV5nkRO6QqvOhAc7iKZrhChr1Iw/ud
         4hYxIVR4/PBQni9KU645/mrUf6m6Xo8Rwmu9ITR9zL37WZ6AFeM5z7jc7mBLSKrrYtnW
         xi1UqWXJI+clNzcW27dWO1S0X52yCrpLqrS4G3CaOliM6d+KRnKSNR45TcZMQnULOX6x
         1Y9+YaBHTAD2Kfw8BQtJbyZ/ja8KWUA0XJosk0vQw0V1arCH4c9J6+0letw4s8JdLxSy
         RZnhAZby+fNy4li6t9ptxwrf+91lHgJ7pK12AahurzVzkHUcMgma2WnUER9GZJOeir1J
         Lsdw==
X-Forwarded-Encrypted: i=1; AHgh+Roby4T64oKtmlawQZlsGSurbVUfx0sOr+8pv9FMivsqjhulNYrCCb8KlA4Yb0fhEtWOyz6iNH/mY44i@vger.kernel.org
X-Gm-Message-State: AOJu0YwFynX1muJkr7GpkBXWHfx+5hBoOVV5DAvgceeUIVAKn/sR81a4
	4uwVBamc9eJqLM890H/gk0zDO8Tu6jzOSqW8o71ysdbv7BmM/kuWnSSu+kfnWIZBVJvdO02gWb5
	2JGOm1QHbUYy6GN8d+ZZHfxj0WPX3g4j/3EUSi/3waVOMBS+CGl3GrspEyx8yQG1i
X-Gm-Gg: AfdE7clW3yosPcxzBYp2rsolqrpzqEPjSyFFY88WI0MKy6DXDKWE+TN0AuDiBo/HUc1
	lMRhQVy+5NbMKwnm1ymoO7nFnmVlY2Yk8qFkKgg1TdvcU1X0o+OUvm39b0MUCJpYTpYPy8/cPlM
	jCzpwmzNB3XZUTyz35XW5FE4qWZeR7+VkOcDTbsr1WNZJMG/ZazDYMg1qsEErhZTFo8oEbewp2b
	BwpYj92s31x6gM6zZc4qatCGKAvKt4zUI09B9oc4p2PDk4mY2KKmgHFHT+RYsjlWd/qwCSayWQt
	zDpYRZJTTKhAOkWwg9SXqFliVlK5oXthzVCXfJlSasRB/yyeY9sEhNMJRGdN3fvjRH4ehW0cPJY
	hPvC24rFgqczBD1RQYoq/7GBU
X-Received: by 2002:a05:620a:46a9:b0:92a:c203:471e with SMTP id af79cd13be357-92e9a344366mr1249811185a.9.1783320155128;
        Sun, 05 Jul 2026 23:42:35 -0700 (PDT)
X-Received: by 2002:a05:620a:46a9:b0:92a:c203:471e with SMTP id af79cd13be357-92e9a344366mr1249808985a.9.1783320154566;
        Sun, 05 Jul 2026 23:42:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6381e4fsm401457155e9.8.2026.07.05.23.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:42:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v11 0/2] Enable ADSP and CDSP for Glymur SoC
Date: Mon,  6 Jul 2026 07:42:22 +0100
Message-ID: <20260706064224.1328576-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2NCBTYWx0ZWRfX357dyo8sOPw1
 BTR4pFmIG3XBSsphHrknryotZhrpjTs2elQnXedy7Hf/3nxmBdyoiY0U2nItNbfGukPFCaRST3A
 Wal4Y+pAlovkpifSiPfHN0hzptDlTS8=
X-Proofpoint-ORIG-GUID: iysTEsaeYP2WDvFIaf4lpDJP9aMlvOTn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2NCBTYWx0ZWRfX+r3XZ+ByPFDk
 frwmeXUHJTyP8N7fU7O0fJRkVLdK7p4a2wa3T8Qe4CfxBSKL/wCUcAalTobA9qL34dQQQba3loq
 U/vO+sMGBLfTBICnsj9Kp26zx2rdorVtuszV8uHPweN6jSpgtC9mx2KDVPXintjhZrzbdfxqbvT
 N3RhRGtwIu+qIziGoKTyuHUuQlawb4dT8SaV4KlmzyFqDyDaf68tRiP1ykNwq5jhHNAtvmtuIQO
 jmfkhUL4qJE7EAkbt2TslyD00q05MFloRqLL8vWF4nMhGnLPhyg7ZE/22qzx0BqRUkOyQ6ttfJd
 XyYat9hypIawYNyg+QhT8uirTZfWJiAZ7Xm8IKE+zRrM3iInGIuX7Wj1KjgG9p2JQF8SxlbT//p
 O7ZxLQsFhChmW2P+m8H7KcwVEbOGH88gtK+esD895FaGBFzkX7MhLBsebpgryO6b9+hOivP0Abu
 Aa20Xg0M3pNDQPn+xcQ==
X-Proofpoint-GUID: iysTEsaeYP2WDvFIaf4lpDJP9aMlvOTn
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b4e5c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pC0kQTKkh_gLwOHhAVIA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060064

Qualcomm Glymur SoC variants predominantly boot Linux at EL2. This means
that the firmware streams of the remote processors are managed in kernel
and not in Gunyah hypervisor. Given that the Peripheral Image Loader for
Qualcomm SoCs now support running Linux Host at EL2 [1], this series
documents and enables ADSP and CDSP on Qualcomm Glymur SoCs with its
fastrpc nodes. A few variants of the SoC are expected to run Linux at EL1
hence the iommus properties are left optional.

[1] - https://lore.kernel.org/all/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

Changes in v11:
- updated SoB Chain
- dropped already applied dt bindings patch
- rebased to https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=for-next

Changes in v10:
- updated commit log for bindings to include glymur SoC
- added vdd-micb-supply to DMICs in va macro.
- some of the Sashiko AI review comment is incorrect as WSA codecs do
  share resets.
- Link to v9: https://lore.kernel.org/lkml/20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com/

Changes in v9:
- Include a binding patch to accommodate the data port increase to 17. [Sashiko-review-bot]
- Fix all double spaces in data list present in qcom,port-* properties.
- Fix routing of WooferRight In to WSA2 WSA_SPK1 OUT. [Sashiko-review-bot]
- Fix all incorrect lowercase speaker/dmic names. [Sashiko-review-bot]
- Link to v8: https://lore.kernel.org/lkml/20260520141828.2724689-1-sibi.sankar@oss.qualcomm.com/

Changes in v8:
- Drop bindings and remoteproc nodes since they've already been picked up by Greg/Bjorn.
- Fix SID duplication between gpr and fastrpc nodes. [Sibi]
- Fix Incomplete DCO. [Krzysztof]
- Match model name to the one already used in Audioreach topology. [Krzysztof]
- Link to v7: https://lore.kernel.org/lkml/20260331032121.1279203-1-sibi.sankar@oss.qualcomm.com/

Changes in v7:
- Rebased on the latest Linux-next
- Split patch series so that Greg can pick this one up so that
  the dt changes can be picked up by Bjorn.
- Link to v6: https://lore.kernel.org/lkml/20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com/

Changes in v6:
- Pick the audio series up. [Srini]
- Pickup Rbs from the list.
- Rebase on top of the lastest linux-next.
- Fix up address size and other misc fixes. [Konrad]
- Fix the ordering the various audio nodes. [Sibi]
- Link to v5: https://lore.kernel.org/lkml/20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com/
- Link to v0 audio series: https://lore.kernel.org/lkml/20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com/

Changes in v5:
- Fix commit messages (patch 1/2) to accurately describe compatibility [Krzysztof]
- Link to v4: https://lore.kernel.org/lkml/20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com/

Changes in v4:
- Fix SID used in ADSP/CDSP for correctness [Konrad]
- Link to v3: https://lore.kernel.org/lkml/20260129001358.770053-1-sibi.sankar@oss.qualcomm.com/

Changes in v3:
- A few variants of the SoC are expected to run Linux at EL1 hence the
iommus properties are left optional.
- Add fastrpc bindings and nodes.
- Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/

Changes in v2:
- Combined into Kaanapali series since they are fully compatible.
- Link to v1: https://lore.kernel.org/all/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com/

Srinivas Kandagatla (2):
  arm64: dts: glymur: Add LPASS macro codecs and pinctrl
  arm64: dts: qcom: glymur-crd: add Audio sound card node

 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 111 ++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 263 +++++++++++++++++++++++
 2 files changed, 374 insertions(+)

-- 
2.53.0

