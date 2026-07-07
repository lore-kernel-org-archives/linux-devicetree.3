Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870C739023D
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415377; cv=none; b=R7J8Q5Tu84+EjrxwO3DVviXGC4TJrZtpkCbn2c57fDlRrQVqE1nDqPRS10+yoU+s9uc1rLTZ/c/mXWui61yyzTgl8aSoop3sPLg8q9mmZTYBFHDMqUgUW/YnYaSO27L2eyJUskRz/v2Ll+NlQM/NIsv9NxQhnudLdppprhE9gx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415377; c=relaxed/simple;
	bh=Glg9tGvwRHTm4aaAWYZK2xSaJDmf9qc/Es2Fhj0kHBU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qf/fHB2fN6B6pcymiQuxnOqcxvxDGt3wiqZzJOBMmyd+qGXVQYDTqQCBM/T/+mhCz96fEBStHQnWkhKUwfHwiaeU0GwErGUwjF9AGCr6lHlirEPq0bKIx06a27pTtzCDb8z8Ni6IqpiOy17+IRwq3fur/Q0pm2U+ltS6+utBfQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3CNG3FU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bjo/KsWq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3CNG3FU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bjo/KsWq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DwDv3070370
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 09:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=P/NAFwP16MMpi8dk+6Qh9Q
	W68OCZTPeTA8N4GMACQKQ=; b=H3CNG3FUlwlw1pexLbmP5mnOkaUzBe0dyAv0HX
	HH7RXIVZ1nlR07U6ihuMRTkTVvg7okIWWOB0N7RM30Q3tf6Ir0DAgRjeB+tvwGN3
	l0abiI5Xj0ITSzze5lKL7NTf7Pp300oFO4vnOJmTZPwMMvkXT+XkGeoZLKNOYzk1
	n2c5nhluBBcUhT5NkuRd2U3jRnnJ2MgSZQ0zPPs8u/rk0JLN7ZYsI1cqJxTLYMgi
	pZb3md61Vycbco4rAG3kVByCSImiWXqsZ1uwb1+zVZnzn/2hnbCsR/j/S4Pe9mGX
	Fpv14qosps356Zw3VtOq6UhPyrW8Y/ylpg7svUBa7ODH3mQQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8h6ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:09:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845ea8fd3easo9321638b3a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 02:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415375; x=1784020175; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P/NAFwP16MMpi8dk+6Qh9QW68OCZTPeTA8N4GMACQKQ=;
        b=Bjo/KsWqmmkkH8aN8iT/o/I1zTlwV4OWiynrcE2o6F6ZDc/pAUGRXlxpXGvrq875Q0
         Hw55gqEWQ8f1FfsDxDJ7j/ejdzcZl21hqmRxZzU9dNe6Q65gJZXiE8ZA18mmL82qUIue
         WbBH/5XlII4/83DQ+UxYqtGWrqMYHOvs3zR7SbQ1DVydtMngw4yTXuy43Tl/izc/LhhA
         3JGr23Hm4zZmImye3kdvkmF0ePQFjxZWDr4d5DqehSp3Tz1T3oE0ezRQIyWt1ABnuHHR
         SxuBzNVJn+aLosvlA5sC/iLmFSa9KQRiqlbuKwBMspj3SJlSpw80zqc9EtqcGbYF9oo3
         vkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415375; x=1784020175;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P/NAFwP16MMpi8dk+6Qh9QW68OCZTPeTA8N4GMACQKQ=;
        b=iWyJFhui4jPCWIRICoRJMZj2bLDN3oB5yk4TLcvspm60tYYKlzQ0PuOOb7lcFACN8t
         0fSfp7d4tWBjbYYUSzgxPP/UqOJcsJ7tG7erPIl5fsE6OGBX9RVY2vTE07akbXyoCVpU
         CLEmHgsz+u2PYDMMaADujyU3ojMgDHR8tYbr1lxaCbHqhEIoKtz1p+9tZiF4fkx09Y4V
         A/+Dgbe+iXiCVypFqtusloZ3ZKu4nnpICvNyGfZdBaBWh0DcKqT7zo8Zd5mf9QuT6mi8
         Y8CQ33/OkQ/xsXwB6EyIVKSGXwbuWdvyZgPqFwzXyEUJfcEush6TpwL2Kkt9Adbgd52D
         bhYA==
X-Forwarded-Encrypted: i=1; AHgh+RqMVbjvcyPVh98B8FIefdoUXihXMs23Zikh8UgbAlK1/32FLk9dm/KqxO3d22INtS+tUh8kJpn3qV7F@vger.kernel.org
X-Gm-Message-State: AOJu0YxkzGN8Uodhy3WKuwE8LhEvOZ3PzbK+jkKaOnDSHQ4ozvQDRbry
	JunLuZjb2z4xsyESz8rNW+KRQXOztCxNHf/RVRPOh7jB0pxvveEU3ie6roquvRPj5KDjxdU4fyW
	RAtWDPgLhcXdySIEu1RKIsFdWGXNJLB/rOsSTP9sjfxKxI+u/eBidqEIUXXsnTmDx
X-Gm-Gg: AfdE7clGZ4A2lA9eLz3jrR6w8j5vLJlm+k55bEFwGQIBNtJ7/s0E2JoSApQD48SPxi6
	w1+a44XOS6GVH5c/pEwudDH1xo4QW0OWYhsUWPlZs8J2FNhZu2K5wA10+667It1HwdCov5iAIKi
	mCZLrE38XKdQNPzoZTSnVyCnAc3vXvTjrWrBlxieeHUZmulrxp+2bK8OJA/4+Mtaj6vrhYzoStI
	L5xc8Mq/kze6G6bG04xnTEFdOlNX6tzW7s1r12FhNF7ZgWWtEFU9qgJ/Xjn+umSvIt2rhO6YG1w
	4REMyC29Z6Zo0lRbodXDkAGRRMvQBEqeKb5MKwWVduFURyZFu7AJ/uUDgfifwqU3Xij3QWS8vIG
	TK+d+wJMp2laIjCa4uZ4934lw+luK98ZQrvw43rmLHPEhmKiwbgO4MWS9GgyIx0u7oX74fYYXgw
	==
X-Received: by 2002:a05:6a00:4b0b:b0:842:55b6:f5a1 with SMTP id d2e1a72fcca58-84826c1e0bbmr4186012b3a.6.1783415374781;
        Tue, 07 Jul 2026 02:09:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b0b:b0:842:55b6:f5a1 with SMTP id d2e1a72fcca58-84826c1e0bbmr4185953b3a.6.1783415374126;
        Tue, 07 Jul 2026 02:09:34 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:09:33 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v5 0/5] Fix traceNoC probe issue on multiple QCOM platforms
Date: Tue, 07 Jul 2026 17:08:48 +0800
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACLCTGoC/43NwW7CMAwG4FdBOc8odt003WnvMXFIU2dEGg1Lo
 GJCffelXLbDQFws/dbvz1dVJEcp6nVzVVnmWGKaamhfNsrv3fQhEMeaFWky2hBDiBc4ZedlSh6
 OOQ21UcpZwBumfnRkx8Cqnh+z1O6Nft/VvI/llPL37dOM6/YJdEZAGLzvbIu9Db59S6Vsv87u0
 6fDYVuHWu2ZnvUINHTWtKSDoUB4x2v+eI1+4DWrRxoFLaP0fMfjX6/T+MDj6jkJbmDuHXf6H29
 Zlh8cpymrtwEAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415365; l=4279;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Glg9tGvwRHTm4aaAWYZK2xSaJDmf9qc/Es2Fhj0kHBU=;
 b=KhMUCBqaORwT26jbahQIaOf9vDYgsqZarWJ/WMGkwL/eXAfvjxQjvnnMecG5zH/BPmcqy5Kh/
 Av1ph3z2bvVDiEYYNHBOByZVTCiUhj7PjZLJpCNZIsndyzj/evkv4yY
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfXwryum1imhgjQ
 QCq/Xpj/Cj7KFplnFI5peJgrHktlyZFRik5Do67is4tKMySGQ4xbOJrDie0OeTWHHRSNZTzSqHj
 6k0ENc/BiKY2EkFXdOoPZTrEeUhuTUZh8IfZzZzpPXQr2pQyZQT8uFQu6ZSgjeZe9taGYEe7mkO
 uhzDO8eLF44uZXREAcNYKf93zxeNt2n4d1Gj0KHwM7vtt063CRQ1lssF8aRsHzGq2Fupb5NRxs7
 Zg/rXBW55a87AxrE2J1vimfzWzYSkvbQ1PwUlCLk0VeLa7GQzzUAmdO+Hh+K4TiYRD7KfjzzO0l
 GIzbd4ySXxpYT/8Q0EMpzlTIUND100hMP0EKkZQ79hbAQwPbmSzuZLwKEt1mOP5J/cb5DLiBveF
 hzSAiLATRqB2kplCTXt8Rf1R/0fvG+hMx0+i+s0a0b3jis6LLrImH5v1qjg/fgB6BF/TQop/Osq
 wOm8uStCZSwFrc8YAwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX0at9xXtyiW3a
 WIooZKf8L5wot++D1HkCMH1xEiv4qY/Qmuz5E3ukG+lofV+0vlg4Q8ASLr/uHAsxMTdk1LA6zRc
 XNhRBqSSkrzsb0H+DxI+3OolizJI3v4=
X-Proofpoint-GUID: lNV407_JhKZzEGFVB5GIQE3tI2vmpIw2
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cc24f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eJfGDJWfQcjy8rMVS6kA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: lNV407_JhKZzEGFVB5GIQE3tI2vmpIw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070088

The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
forces the device onto the AMBA bus, where the driver must read the
peripheral ID from the device registers during probe. On several QCOM
platforms this AMBA peripheral-ID probing fails, so the traceNoC device
never probes and its trace path is unavailable.

This series drops the "arm,primecell" entry and turns "qcom,coresight-tnoc"
into a standalone platform compatible. Without "arm,primecell" the device
is created on the platform bus and probes through the platform driver by
compatible string, bypassing the AMBA peripheral-ID read while remaining a
fully functional Aggregator TNOC that allocates a system trace ID (ATID).

The series is organized as: binding first, then the driver support for the
platform-bus compatible, followed by the per-platform DT fixes that switch
the affected nodes over to it.

- Patch 1 (dt-bindings) drops "arm,primecell" and makes
"qcom,coresight-tnoc" a single standalone compatible, and updates the
example node accordingly.
- Patch 2 (driver) adds "qcom,coresight-tnoc" to the platform driver's
match table and renames the itnoc-specific names to generic tnoc names,
since the platform driver now serves both the Interconnect and Aggregator
TNOC. It also restricts the ATID-unsupported handling to
"qcom,coresight-itnoc" only, so the Aggregator TNOC on the platform bus is
no longer wrongly covered and correctly allocates a trace ID.
- Patches 3-4 (kaanapali, sm8750) drop the "arm,primecell" entry on the
traceNoC nodes and use the standalone "qcom,coresight-tnoc" compatible,
fixing the probe failure on those platforms.
- Patch 5 (glymur) switches the node from "qcom,coresight-itnoc" to
"qcom,coresight-tnoc". This node is actually an Aggregator TNOC (its
tn_ag_* endpoints show aggregation), so it should expose a system trace
ID rather than being treated as an Interconnect TNOC.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v5:
- Drop the separate "qcom,coresight-agtnoc" compatible. Instead drop the
  "arm,primecell" entry and reuse the existing "qcom,coresight-tnoc" as a
  standalone platform compatible.
- Update the binding, driver match table, and per-platform DT nodes to the
  standalone "qcom,coresight-tnoc" compatible accordingly.
- Rewrite the commit messages to describe dropping "arm,primecell" and
  binding on the platform bus.
- Link to v4: https://lore.kernel.org/r/20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com

Changes in v4:
- rewrite the commit message for the patch 3 - patch 5.
- free the allocated ATID in remove path.
- Link to v3: https://lore.kernel.org/r/20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com

Changes in v3:
- add standalone compatible for AG traceNoC device, allow it to be
  probed with platform driver.
- add fix patches for sm8750 and Glymur platforms
- Link to v2: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com

Changes in v2:
- address the ATID issue reported by Sashiko.
- update binding to accept arm,primecell-periphid property.
- Link to v1: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com

---
Jie Gan (5):
      dt-bindings: arm: coresight-tnoc: Drop arm,primecell to bind on platform bus
      coresight: tnoc: Bind Aggregator TNOC on the platform bus
      arm64: dts: qcom: kaanapali: fix traceNoC probe issue
      arm64: dts: qcom: sm8750: fix traceNoC probe issue
      arm64: dts: qcom: glymur: use Aggregator TNOC compatible

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 16 ++--------
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  6 ++--
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       | 37 ++++++++++++----------
 5 files changed, 27 insertions(+), 36 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

