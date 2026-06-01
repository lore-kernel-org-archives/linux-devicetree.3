Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D7E3769EC
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328541; cv=none; b=V2je11UasLt5PV9my09oC2wzBxwVdu4Gy0dVfNBdxQV6y1qgQtw70Z/oTbIwk/WUAUunh3/z12w73DvnmFauY+GFGyq8n2pDghqN3Dde/bUHUhwAzBrU5dc9VsdQ/X52Y+6ucInFMuc8vXuYmUwfkttHNVH/CBROfwdlz2gwJnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328541; c=relaxed/simple;
	bh=Rh/5zPaaIxp8ZbUvRytanuS13RcsgAHtRgsm5GA/+8I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gSP+uWmpcmcsTfLGvkD4rWoDNWWve4Nrvj6eXAoZdJtoOaA/jF9fGfoKmc9PeEXRm6SAE4k2sH2UJ3v/MLDgymZkP43OJgp7ov8f8Jl8qS0HrN4QPLV1wHiHnGqyD+1SqCwcG181Hxs404NXUB/7E0hadedw3SFNmDGrZkbD25I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cg2Z1sGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Im9QRwUq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cg2Z1sGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Im9QRwUq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651EfTN72740397
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 15:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hcfOh5bAPnT7pihcXCpkCW
	y88Sld8qy+ZTvfp47FKLA=; b=Cg2Z1sGqGl4stZ2J6Vnw2xqB5nINH65kgvC2su
	UpRa8aHbgkZ+wYqxnJmDSvelSfbfKXvFqGl0iEaz8yMsBQaTVnakSFoF+HnHOcNK
	3O8Ab28f1yaMUs6nMqMo3hASYBISKlpq8UcaG9J6fdRzMd5FqAD/IOQqlJrOY1uw
	SBh1jCugY6Mo9irmtCWHKcyimQ7e58j7Cj+5rXmtDFrCgRikiPrF2XUBnwsGoViP
	W2URI194jRRwqCpq/vsCscT+UMJBdw7lbWbGHpYjdHWmzVk97/MQz8cA4JL17Q9Z
	vDYAGITUWJro5y5gyfGgCMrHR6j5/DSFQxCb0XGHlA6GWK6Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqhs3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 15:42:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304df51ff3eso4270136eec.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780328539; x=1780933339; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hcfOh5bAPnT7pihcXCpkCWy88Sld8qy+ZTvfp47FKLA=;
        b=Im9QRwUqaE+wapqCbZ9PzrMMTKrRv+GfujCT17mNzj/GZ8Ahc6vz9jlU/NJVcWWFwe
         LX5CK/53HMacKeggmRzetp1S5zDpiRJW/N4n+hpjXuzy9v6g8aneYX576936cx9Vw7eL
         gVc/JRWPjZeMJsBqeFuiJAqqBVOi0etzJ9YumXstX0Ku4xmkuwBMzl0Deb2dCYZNy0ze
         FmCWtXXcg31jQ8Iea5/HvMxJPLRdFl6m8Zs/I0dWqJXB+OkI6KfVK5aP+N/i3crM9srL
         z0ZeGDML6XRxiwvjOqwEAFsPKZgCDgTs/hpkVgTNIu+obSddC6k3KYVYGwjZ6oA8LCaF
         QLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328539; x=1780933339;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcfOh5bAPnT7pihcXCpkCWy88Sld8qy+ZTvfp47FKLA=;
        b=dIfUhtP/6R8WPbez8Zrs5Jt/af+vCIPQ7L1G9pyiNGkenbYa49LwIB180kRr3zqf4V
         5SiPZ5Q3AiuS3QNcbXA+SRzNtD/Ty4DKuo7Xp/ZqJfdjs/3OpXiuKOM1qvxgB1KHMYqK
         53XZLG4z9Wav8/B4E7r3Umus1Fe01DWvb/D7kpikz38Ue3uNabRvF5RWGhl5wxsn9XIt
         o7q/9yuLvyiqT8gO+BmAzzLDV8fSBqUQuvulkSIz4STAld2KtFLIUEeMXUW7HGhRQec9
         gO0L3PQBfk2uYcpyIYyFcG7JkqIikBDEmmjr2wMJBTEsrL2UGtugZ7HrPDRfec2cpAcL
         s6wA==
X-Forwarded-Encrypted: i=1; AFNElJ8Z65TqXGfaTt6olEy6pzf8sJypj/1UGoviuEb2l1nJdEygg3hGGQDjiX+b+K7Q8JbVz89a04IEDvbh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxhnct47lVq9GgCL+zq2UGWQqIXSMqWSiTUUBI+URtDJGUhz5L
	WLCyNnFKf6yw/NBIRL/Sv3Qd0mm/u5cRtwTH/wCkoKxg7j00Sn4i1MRjw23IvFu6zM6W5ozlgpO
	HjKol1wY0Wb7eOKLHQEsV+7eAe42tT8A8ojlLlUqEf+wIiMLEelGNusj/NAXBM+y4
X-Gm-Gg: Acq92OEmAUJkQuwqAEhac2/aKoo91MvIM1UnSMWTVU5m5Hm/3sMAVd5t1ILAeeFUsQR
	/r5hiYDwigCPt9wim6rLhUsE3ap4aNYsyb8rPkqb8+GgK2+4bw3nXRXPQKwM6znsIb/4xiO1LgR
	eXeYamDAQdttOs5Fe4SlsfX+OFgSzMJJRlxJ2XZuSAXOMzNI4Dmex8MLdyor/nljwKdCrTao1PC
	zoFFtPig+VIs9Cu7MNJZhzx5qbph58CWIDXti37QVORD1/N9KXMOdtSawt9kN1/gfGzCFvvk68H
	K9skkzZpt/nHoCtcyvaH1nTKtTGdlcEOrpuKemjZSduQ4Y8H0LHN8Dc0Tl1OWot2wYBWjkXfuVU
	aYHjFPzOqeZwb4iUnFdnMLB8mtxAOsuGMOswGzB4QtFxRMdygqum9GQrlV0rdTY4sEj/k2ZOg4v
	x+L347alI+HY0=
X-Received: by 2002:a05:7301:290b:b0:2ed:e12:376b with SMTP id 5a478bee46e88-304fa6b75bdmr5168115eec.33.1780328538844;
        Mon, 01 Jun 2026 08:42:18 -0700 (PDT)
X-Received: by 2002:a05:7301:290b:b0:2ed:e12:376b with SMTP id 5a478bee46e88-304fa6b75bdmr5168075eec.33.1780328538271;
        Mon, 01 Jun 2026 08:42:18 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f002sm9430371eec.18.2026.06.01.08.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:42:17 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v4 0/5] media: qcom: camss: Add SM8750 support
Date: Mon, 01 Jun 2026 08:42:13 -0700
Message-Id: <20260601-add-support-for-camss-on-sm8750-v4-0-1eb6f432cfd1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFWoHWoC/42QQW+DMAyF/wrKea6SACbltP8x7eCCWaMVQmOKO
 lX97wugaodt2i6WniV/7/ndlHD0LKrObiry7MWHIYniKVPNkYY3Bt8mray2pTEWgdoW5DKOIU7
 QhQgN9SIQBpDeVaWGUmNTtJxj65xKlDFy56+rw8tr0kcvU4gfq+Fslu3/2bMBDVhgx2z5UFn9H
 ER25wudmtD3uzTUYjHbBxa1MfnjeqPNNjG4LFx12Dumln5h5F+MUru/o+UJ2zXo0BCWDVY/YO9
 bHZHPl9TztHWiehahtec6W+1SaHgnGmikk3+kNsUSu8LOIhHi3nznJ/qBhGFZ+KnOBr5OsD1g9
 8n9/gnAv9Nr7QEAAA==
X-Change-ID: 20251126-add-support-for-camss-on-sm8750-506c4de36d88
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: EW5DnZWXpsxucIWo24IQv9dPwT-8gvQF
X-Proofpoint-GUID: EW5DnZWXpsxucIWo24IQv9dPwT-8gvQF
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1da85b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZthKqu_aCWk3wB8NWGYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1NyBTYWx0ZWRfX3nKO6KiuSlXL
 MbwnTPkAqJG5DyCqwnVrPsju3fwEgFtMS4Gdj9HaRt/wmpdPUWNDYSixGu3/5WVZv1HLZAqIWBW
 bz5NRx6vG30S2v3RSL62vuJJ/JsJcPCjynBOHD5oBFa+N088zM7K/iD//qkqP6Uh2gt7xeR4krb
 w+hDOUMOa36maRJLTxIQqdwneIeVrX9IHABUXHwaOTWi+OfX2RKVr6zMVBlIqyKL9HboCE6kejk
 Q41itXTEatzh+3GQ9HqDLXli94Wptb08ayVyEwuQaMOR+nt7VB0tw/HcrqtmooqFF++ymlQqiEf
 +4lSrXrP7n1rNXYxP4c1KbZxuoAi4nipwc5s65371PuxPh5H53sxKbA6wYRfdYgkADTIOmIvB0H
 jLsv5rhIfc5jRznBazkI6on4ixXESQMIaE239wtX8kBAF43DoYfxww/kZKXg78Wxxh1AvY2UH9a
 jEIgs/QIL3Wv8Y7PnGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010157

Add support for the RDI only CAMSS camera driver on SM8750. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

SM8750 camera subsystem provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

This series has been tested using the following commands with a
downstream driver for S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Dependencies:
- https://lore.kernel.org/r/20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v4:
- Update dependency to kaanapali camss v14 and rebase to resolve conflict
- Link to v3: https://lore.kernel.org/r/20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com

Changes in v3:
- Revert binding from full hardware description to CAMSS-only scope for
  modular and incremental development - bod
- Rename icc path names and vfe clock names to drop redundancies - Krzysztof
- Separate port index from VC value in csid_configure_stream(). Previously
  vc was used as both the loop iterator and the hardware VC, causing
  misconfiguration on RDI path starting from 1 - bod
- Link to v2: https://lore.kernel.org/all/20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com

Changes in v2:
- Rebase this series due to conflict - bod
- Add module descriptions in binding commit message and cover letter
- Update property names to align with previous generations - Krzysztof
- Update the vdd supply names with 0p88 to 0p9 in binding to keep such name
  style consistency - Krzysztof/Vladimir
- Add missing Kaanapali dependency - Krzysztof
- Add regulator current in csiphy resource due to interface changed - bod
- Make csid board level code style consistent and add comments to explain
  the differences between csid full and lite configurations - bod
- Remove redundant initialization for empty set in csid and vfe - bod
- Remove DTS patch due to conflict with camcc dependency. Will post it
  as an individual series.
- Update vfe commit message as renaming work done in Kaanapali series
- Revert change-id to v1 to avoid increasing reviewers' workload
- Link to v1: https://lore.kernel.org/r/20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com

---
Hangxiang Ma (5):
      media: dt-bindings: Add CAMSS device for SM8750
      media: qcom: camss: Add SM8750 compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.3.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 980
      media: qcom: camss: vfe: Add support for VFE 980

 .../bindings/media/qcom,sm8750-camss.yaml          | 433 ++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csid-980.c | 442 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 357 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 9 files changed, 1248 insertions(+), 4 deletions(-)
---
base-commit: 697a0e31ee66f5ddb929c09895139779fff33f20
change-id: 20251126-add-support-for-camss-on-sm8750-506c4de36d88
prerequisite-message-id: 20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com
prerequisite-patch-id: 03f9fe5d9a18559572b9a56c3b1f0fb86109f4f2
prerequisite-patch-id: 5fbe09dec4a5448b016a6bd1d36473727bdbd485
prerequisite-patch-id: 60fd384dbeb9f837b0ac09b8900f82c42c14f914
prerequisite-patch-id: 23a9dc6e6230cb4453df4261ca37653fbde28b69
prerequisite-patch-id: 7a42e3280f6aaf17df14d5afbca9b29f34070116

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

