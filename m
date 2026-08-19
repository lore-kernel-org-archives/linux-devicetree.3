Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD0B233939
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147861; cv=none; b=ME7sQfZBRg1pnJ3tvXYk4co+bmrQWZ4Q/0GdisMfJwMe95Qs8tC37AvQTDPbha0g587aHIu8WwWd2352A26LAW0gp+FQZXvP7E5hLbo9ZpOMg/5mSnNm6ShugefMoAivCbX6uI+Pg+BkaeAFQRRUqM36LeuL4NXkiJusv34U8Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147861; c=relaxed/simple;
	bh=UpsMnnwvoM1v9XtqVXbOcTwlqsxGrvHI5XlgSftITgE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OIDrez6a7P1LeNsf2yh/zkWJcmjUSerdyzumR7aOLXaGmbHrxs8kg48yQAG+wb8G8XlbuSIMlGQoQtmPMz7YQTrhC5xU31Jg2F53FlrTBFk6nGhYHUe8hfsiQewEvDMO1LvVbfHMC/yxnyiQVrYVjx34yxl/S1rj7dj24lWrB6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKL12Ctl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHosg8g+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKL12Ctl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHosg8g+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0PnU372613
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8Z+ELsc0PH6pbrRyJsonn8
	OUmOguuuUUyhOc5Pjdhn8=; b=eKL12Ctlse71xMkSFoour0uxjjX+IMII7RHqse
	dkwJwwbXwgxre3J7HEkFR7+e0NYpoXlxZN90L6zzefvQ42YZ7IHIcre/PUZQd0V7
	w3gSEdM8M1RV76G5c1URWZKI8gRZx9rJaLO3h6cxlZtoBxLYUvC8enM2/625Lyup
	rt+F2igYcMPMWWni7oFNiw0eOs25UcyOAg/z15KqUoYADfygcB/7KqY3y+swQMQ5
	1cArVtXZhdhOjWcOfUdSgt2EcJY32LJ1vx2x7SsG2T49wqfAE7GQUGxfQtNBkH2P
	fJe9YBQdzC9nnsyhvdOCErfhcWahJ+V1QbHRa3T83F5Kz6sA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkbjap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:57:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbef10aac86so108000a12.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787147858; x=1787752658; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8Z+ELsc0PH6pbrRyJsonn8OUmOguuuUUyhOc5Pjdhn8=;
        b=OHosg8g+U2EpdCsw6wXpCer3QyhyL6dOeLTW8XdqlAWUXohOK73uoBX+Z9c0yyDkJP
         uuyR2l54xhHHavrVaLukKTRV5gdmsyQLZgZ+yARap9mhZianM1Lr8nbUs8nKc6Ku24OL
         D7lyA4ijCSMgXkpD7Iv1JoWFjm+9v49bJH7nkWWqQA1Aqk561G2uGGzcLvFffl9N6fkt
         YsFlRDFKMR/l+tgQtiSvWAvthV1DJpF01MNVqIPUZJF7kBdbYB+r2RVpB7dCaEMoC4v0
         8gy5Gl74C7uTOGmatZDSVsl+kPDwBLAM8a7jB19oirNMhhdu5XMQ/m8slkX99qBBBE20
         7Ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787147858; x=1787752658;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Z+ELsc0PH6pbrRyJsonn8OUmOguuuUUyhOc5Pjdhn8=;
        b=ZUd3LjfV8blz86t8fZZn4sNIj28xgvgCHaXsGQ3tvsP1qTTiqQw7uEjgSK+1Xc5SvS
         bzh+nGWZ/wUMU8zt7xM0RNZD4uOLdg9KAqK7N7+XVltpdBXP18i1o9GvAhBLkZKyARmn
         74MgxPMFn0Cb4RdX/quHusH+rftJvHxieIMWIemFN9oQ+nZznBDm25boIUuCHlPojfzZ
         DSR9rGa+QrqvK5Na0BiX7vAV/H646lHF5DJlOjS5ZmD5GK1J2PMYzGqsnTQ7CABzAJpt
         fininPLza/QrLdk/XTl4g1qDoKiC3r1pBkCVcQngW1jXktykySiJrHCnsyyq8yj/kbLq
         TBKA==
X-Forwarded-Encrypted: i=1; AHgh+RqCSK1wZc/d7i2pJCPQLF0syI6J4bkhMWnWtncH0wCfUC1OYxBLWzwFT8x3gXQwIJSbgSQNPY7DmJI+@vger.kernel.org
X-Gm-Message-State: AFuF++l4HF9XHqv6c2xpEJsKhFvJ7UeEEuiLPqFtI91CCnqriqGGjRQP
	9iJLuPvXaEuhAX26AcUjPamcgnV8JVyZH536gwBqstKJQETq6EUrwe4SyIOJiyi3QiTpdMnTryx
	etO0Nj7VBE8HmSuyNwC7oZCw/0JzwtV92gVZSVj/Ve48FdO//qX3Ws1CxisJwmKxz
X-Gm-Gg: AR+sD113fNNdvpUoDlyREz0LtfPor/4X6l/LmaYplgDxloUgDliU3dSiQSYv9bBB2W1
	b7+usHS8MdFzqRtP988K49HRkqYzqOaNsdF8zMx+xilLy2EOQbGSM5Wq+8H+gAM2O0l5VoEcRhe
	lE/gizZzkeL4gtYW8vTpmOmncor/np+r8GXSmGh7Yva+1YTzM11ypqvJb2IwDebheAjAzMy83iv
	ChDNtnkm0XyC8nTV9mDxOws9tms5i6iPZtn0zdGea+yE6PGWM5tDq0frFOtmz15uwYtoTWWSQeG
	/95ld81jbNqDjMrDQP/rGu2TT0MfYwwhJNhhSjx46mSkthTi9MbGy2DNE8WNwCZyTAVLEmlSLNj
	qxghnrxR3MArHkHOCwdmM+pQPpiGsPg842Q9Moh17Qwltu/DwROA=
X-Received: by 2002:a17:902:ec8f:b0:2d3:aecd:51f7 with SMTP id d9443c01a7336-2d5fd60ef05mr45413345ad.1.1787147858336;
        Wed, 19 Aug 2026 06:57:38 -0700 (PDT)
X-Received: by 2002:a17:902:ec8f:b0:2d3:aecd:51f7 with SMTP id d9443c01a7336-2d5fd60ef05mr45412815ad.1.1787147857804;
        Wed, 19 Aug 2026 06:57:37 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e550dbsm25318255ad.42.2026.08.19.06.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:57:37 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH v3 0/4] arm64: dts: qcom: Describe the PCIe M.2 Key E
 connector for Monaco EVK
Date: Wed, 19 Aug 2026 19:27:31 +0530
Message-Id: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEu2hWoC/33NQQ7CIBAF0Ks0rJ2G0gLFlfcwLiiMlmiLghJN0
 7tLu3LRmEwm+T+ZNxOJGBxGsi8mEjC56PyYQ70riOn1eEFwNmfCKBNUMgldA4MftfGA6QoDg1S
 BtVxgp5SsZUvy5T3g2b1X9XjKuXfx6cNnfZKqpf3v5aHAG6aMQdFypQ4+xvLx0jfjh6HMiyxsY
 r+U2qZYpihvWqys7qSgG9Q8z1+6I7QqCAEAAA==
X-Change-ID: 20260727-b4-monaco-evk-m2-v1-dd56eb997378
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 2dQtAQorCVSqiv-SoJpMMQS4vZwLw2Kb
X-Proofpoint-ORIG-GUID: 2dQtAQorCVSqiv-SoJpMMQS4vZwLw2Kb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfXy6dyT1oodJ80
 p6yVdLr+dwXUpkTdy9zLKJotIPwuehQ16Rz5HgB5xIaloq3fKc2c+Y3z+88Gn3O55c9btJ9fnzP
 iVgQ31guT433d1gz+eWSwM2vzLlABNlIPGAMdpZYWSgYyM3S316zgNMJUlv1CRwo+0cV+lzEloy
 F+YdW8FcZgOhP3QAfdIb2j3QQLuoYmVS1Loh71lqcfZ36ZaWvKBm4m6TbVPhL+GImWR0q7bJdxD
 4kxugL6sQEhq/ab+icmYfYrWnbHW79tRnMzGiqv6LoXuQimf3pHAXfRvqc70J/hqUlmgbd4MG1p
 VENz1JgG4ygO/4zwJc+FlSyHj0tfEw/DVNRhfRfbkZcLqnBpodwua3+eLHGmC6KVvwAeKW3l4zz
 EbJUT9aaELu2CdwjzAstqKRUetoWMeFSfltSjwko79kog8Vz7cP87WdapG/Bx3BphH2NdSGdDwE
 10Qc9D3WA7DymH3jVrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfX21w9pF3HJVd+
 q4KxkIDzWWjhCAiF+1L9BSIB0SIczVv2QzBYkTuUcJdRbhJp+D8WNZnDAYjcJrqUaiww0pA5GTw
 PMgMeJHT2l6ma3NB07gN08KCmSnJ6gc=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a85b653 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q_Sc9yZfLxUicUOugGkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190109

Add DT support for the PCIe M.2 Mechanical Key E connector on the
Monaco EVK, following the same pattern as the lemans-evk series
(already in linux-next, commits 67f06acf/a6d4bb0a).

Patch 1/4 adds 'compatible = "pciclass,0604"' to the pcieport0 node in
monaco.dtsi, required for downstream DT nodes to be matched to PCI
devices.

Patch 2/4 adds empty labeled endpoints (pcieport0_ep, uart2_ep) to
pcieport0 and uart2 in monaco.dtsi as graph anchors.

Patch 3/4 describes the connector-3 node in monaco-evk.dts, wires the
endpoints via remote-endpoint overrides, adds the vreg_wcn_3p3
regulator, and adds the serial1 = &uart2 alias for BT serdev
enumeration.

Patch 4/4 moves the graph port/endpoint anchors from monaco.dtsi to
monaco-evk.dts. This ensures of_graph_is_present() only returns true
for boards that have an M.2 Key E connector present, preventing
unintended pwrseq probe on boards with soldered wireless chips
(e.g. qcs8300-ride).

This series is based on next-20260726.

Changes in v3:
- Drop vreg_dcin_12v from connector node; the 12V DC input is not
  software-controllable (Konrad)
- Add patch 4/4: move graph port/endpoint anchors from monaco.dtsi to
  monaco-evk.dts, so of_graph_is_present() only returns true on boards
  with an M.2 Key E connector; note that patch 2/4 (the anchor additions
  in monaco.dtsi) is based on a pending upstream series not yet merged:
  https://lore.kernel.org/all/20260720-monza-wireless-v5-1-69ec6743543c@oss.qualcomm.com/
- Link to v2: https://lore.kernel.org/r/20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com

Changes in v2:
- Move PCIe Root Port and UART2 graph port/endpoint declarations from
  monaco-evk.dts into monaco.dtsi, per Konrad's suggestion. The SoC
  DTSI now defines empty labeled endpoints (pcieport0_ep, uart2_ep) as
  graph anchors, and monaco-evk.dts wires them via remote-endpoint
  overrides. Splits the old patch 2/2 into two patches (new patch 2/3
  for the anchors, patch 3/3 for the EVK board wiring).
- Patch 1/3 unchanged, carries Konrad's Reviewed-by from v1.
- Dropped Dmitry's Reviewed-by on the EVK patch since the port/endpoint
  structure changed; open to re-review.
- Link to v1: https://lore.kernel.org/all/20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com/

---
Wei Deng (4):
      arm64: dts: qcom: monaco: Add compatible to the PCIe Root Port
      arm64: dts: qcom: monaco: Add graph port/endpoint anchors to pcieport0 and uart2
      arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector
      arm64: dts: qcom: monaco{,-evk}: Move graph port/endpoint anchors to board file

 arch/arm64/boot/dts/qcom/monaco-evk.dts | 60 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    |  1 +
 2 files changed, 61 insertions(+)
---
base-commit: 80489b8b7c62068b5223af10ead175367dcd127d
change-id: 20260727-b4-monaco-evk-m2-v1-dd56eb997378

Best regards,
-- 
Wei Deng <wei.deng@oss.qualcomm.com>

