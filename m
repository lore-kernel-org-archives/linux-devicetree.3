Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5E94F30C4
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779953; cv=none; b=HuwiykafeOBTUZzMPkEAnZnBrKZ1Rm8DBRjwXl4ePMRfrBEfP+KhF8O525FkrGEcIGnr5Z3W5lz7JjQhkuJrGHDm4gwCvLuzuejSH9Y8YuxPnn6WfyI0wZAKjTfBU6/luvjnHTHnXiODIh3ysjAjRg9QFAFsMLA7nYTG8NI7Pew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779953; c=relaxed/simple;
	bh=9cXLQQHKl6yEKaTCBAgfXYVQ5NuyFBWmetQmFW80k6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RMA7iIwFGwLJ/+fOn3SBoi0cJzZ0HJnImM3SnhN4AKlSTfTh36xmodREMcaUiyvMrh5UwBc6uVqTyVwMNjlJsOBZNsDo5qu3k6z2KEKSC5+fx/skx3I60n6+RDAEwJJH70+r9hJm/qH2VaVgF4k68m+VAhRTMrfAOaDg62hd2IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4vmgpR+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PlV9kU1i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4vmgpR+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PlV9kU1i"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE0I59147043
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Xm8ZEn8ghmOcAG3oNkRt/e9q/WbJ/MPAnge
	ljbhU5zk=; b=g4vmgpR+Wv07QF4yjUx3TTAZx5u3STyLEcb+kOa7MSOFCac/7mS
	PBph/bxk3J8/oY00Is2fhhNR7Zk2JKpHWvQ3uE85tVrNvM8CfFKkT89kOhdf/xKv
	ORFvzE4LkDRydyo/LoN4hI44GNmZcriByZHEEI3LsfqRb+JPhn7ol8we51zLukeV
	w2q7Xt6P7OUlNufe2GoXgbNEiOINH78xsHsavpU1r2w9Ks8tmH9tACzJxm5w7GpD
	1RIA+aS/kQq7ExbmuroVz/tZ9CiD/h8Q04nHETLEOm4sa/o9V1IN22pOb6lTH5OK
	a/2RtiCDrlSYOhj3/meKR1niJOq3NgPwG4Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97vvxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:52:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so6677166eec.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790779940; x=1791384740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xm8ZEn8ghmOcAG3oNkRt/e9q/WbJ/MPAngeljbhU5zk=;
        b=PlV9kU1iaBRQesYC3WrtcmAV+VXaPFJJaIwVSv+uKHVIm0AWhTSAwaXMw+szEb97le
         2V6ayCRnR83Z855T4PHPiw7WfhfAwnvr0FV4O2xlw1E4qqA69B16XRVzReIpicnVHMho
         vVcKCa3EH1sPMioNGkyWg+VIngy+tttk+Aow6zNshpRE3pumtlLXpI9f0XqSuEv45Y/E
         pt87MOpcFc6UpDvQHKoPBfTD/hOvv/n9t69gRNXA+J2Laq1a+sbefeMbXf9z/4BkPRV3
         E27ZUaZJ6bZUCDeJ1oC3SNMjQZ62Ta/M07O8TZy/fYmZyt7IJXv49VWtbxSqJ4y+BDdA
         T+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779940; x=1791384740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xm8ZEn8ghmOcAG3oNkRt/e9q/WbJ/MPAngeljbhU5zk=;
        b=055CTRJ3rWlbRVeC6ac7mjrCV5KUZtlfFaNx4ck2anuRavWBCLFrm0CJpGI3GCzT6P
         +yer8EWigkXv5GOwHfwhUrWuv9JEddbO4KvfBrJsByjsyE/sudfLbuAa9umVqJp/o/SA
         aQfNkw0yAksazJzgDcWoYKJtdm82+atFtcMxmSb54D5676AKDpPwRVPKgTSjV0l+FA35
         1Zs+5IyxqMFEaKwperWrICzgySNb/4WPjqq4WzqXVIy+P7sV6OP7As37gmnOVkwP9zhZ
         8gvMkrpqmABAi1K3sQ954FKsUCYSxLh8/pqUVfC/NePcD6UZoQaVFT3mS/9qbJEDsbb/
         C+rQ==
X-Forwarded-Encrypted: i=1; AKwUvBxX8Ouj89DcubtkLlim5BejyCDvi3TVjUIa78uZ7j1s5NeJS7lLsobvBWcuAakVN6jsPkLGlJ46myH5@vger.kernel.org
X-Gm-Message-State: AFq9FYKOaVKvd2hAuVDIVb7MXW+lI/CuKVx03gK4weYDhlOGkH835KA5
	UbGvawhwsQopib/qsNCYi5VMwrf48xlbUIWukjs3GjvEdcMT8ZdJAX32jSXbaOvmh63uzw4Ht6y
	rFcyarVkjNcKUWJtojh/M6Xvl8ACGsiIG0pwIaI2M/NidmOdVzc8rnhHeJeJnIHyT
X-Gm-Gg: AYBFou2Je0bTZGVTmORaEQ440dFYly53QwOwPDEYclp32lgOTVGAPU9ae/dOKtDvs9r
	PkzktuV05uC3XA9qugve9L8rqQnhXUCPygQUAd4+3uVWCzotAM4bhNw94m2bRjyZkw+shGCe4xN
	+9sY1YS+YH+Pgr2p8oBNX1w3zmmLy0hZUYPMPH2MaMgqVY3UJ26v2SUllPJWoyQ8avRpG2ZlHt1
	ohVv0e/v9qdUzKizl1wIQ2ZBn8sMtvjCNifQi/t5JqgA/31E5YaZjuHUbQ0OEIBdgarpmhIGCsg
	d/iRf+vaPoZelBkYss7rPi41KDlOBq9E1RCdIqilKggxuKt60f+PLw60bnSLUmyH7CUBTc9Yjhw
	SmHB/nBjgfexhA525FKq5yBJXZjdT3mpT0FmyP+FlFt7pRXB/aBo4bNE=
X-Received: by 2002:a05:7301:fc84:b0:34b:a328:c28 with SMTP id 5a478bee46e88-34cd9177b73mr1684528eec.5.1790779939728;
        Wed, 30 Sep 2026 07:52:19 -0700 (PDT)
X-Received: by 2002:a05:7301:fc84:b0:34b:a328:c28 with SMTP id 5a478bee46e88-34cd9177b73mr1684502eec.5.1790779939129;
        Wed, 30 Sep 2026 07:52:19 -0700 (PDT)
Received: from hu-c-gdjako-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5639339sm4524609eec.18.2026.09.30.07.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:52:18 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org
Cc: axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
Subject: [PATCH 0/6] soc: qcom: Add Qualcomm Page Compression Engine (QPaCE) driver
Date: Wed, 30 Sep 2026 07:52:09 -0700
Message-Id: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9jjikpTU-hOEk7VzTR6SHT49j7TpN0K9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX2zZkbsjD3iqS
 yK8655jPDUy2wCdImalrCgSJKWNEjsv5Wd/gO7UHzfVQ0RfieLV9okMgHtOt4K5a/quqV6TYqBn
 xg3lbyMJdCXo0rZ4EnxgzMVRduIg92U+1FYmQjxdymSCMLskLdvZob4DCScd2XwhTsynzNsKuDp
 Tn6JheFYFSqWT+qhKC1GoQCj2sfukB4Ed17FEdheLvuKaI9JMPA1yS+bou0bg5/jQR/+VWnUf0p
 RBadvaHGJ7eQU6iQveuDas/p7RMhEttlqZjvB+4ziD5n8+hwf3s/B0Yr7SckFKYORMChOIrlac0
 6OHvzYeisp/nfHV/zKKKki/hziR4mYlp56FhIRXd8mIK+uHHN1mz5DwACYWejq1kr+4cGyNxU7V
 +0dsyrLbYla/jt6Ost8Q1U/Vj9VB4/0PUmQczoVTxv3zJLxO0BcGoXVodkrldzu3m9+PC9OBg3Q
 HmPVl04PTXvqrgkWV/A==
X-Proofpoint-ORIG-GUID: 9jjikpTU-hOEk7VzTR6SHT49j7TpN0K9
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abd2225 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oM0TwoE6PClt58MffhQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX9/4ZD+3PSQUr
 mJicKdplE9CiFajhvf6cQcMoAPAzEfcTC69PJ8/JRbs7SKr3zFYFrY8qP+MD8QKBu/d0Rt/OPMA
 3FyI04JvTNLrf3SMis3Oq5Ases0whkQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300059

QPaCE (Qualcomm Page Compression Engine) is a hardware block found on
Qualcomm SoCs that accelerates page compression and decompression for
use with the zram block device. It is composed of multiple compression,
decompression, and copy engines.

This series uses QPaCE's "urgent" (synchronous) path, intended for low-
latency single-page operations. A command is issued by writing the
source and destination DMA addresses to one of several per-CPU urgent
command registers with a single store; completion is then detected by
polling the command's status register.

The hardware also provides a ring-based (asynchronous) path for high-
throughput batched compression, where transfer and event rings allow
multiple descriptors to be queued and submitted with a single doorbell
write, with completion signalled via an interrupt. This path is not
implemented in this series.

The driver integrates with zram through a new "qpace-lz4" zcomp backend.
Both compression and decompression are performed by the QPaCE hardware
via the urgent synchronous path: each request DMA-maps the source and
destination buffers, issues a blocking hardware command, and returns the
result size.

The driver also integrates with the Qualcomm Last Level Cache Controller
(LLCC) to activate dedicated cache slices for compression and decompression
data.

This is validated on next-20260929 with the following patch applied on
top to allow booting completely to the serial console:
https://lore.kernel.org/all/20260911-rsc_read-v2-1-98675c248278@oss.qualcomm.com/

Georgi Djakov (6):
  dt-bindings: soc: qcom: Add QPaCE binding
  soc: qcom: qpace: Add Qualcomm Page Compression Engine driver
  trace: qpace: Add tracepoints for QPaCE operations
  zram: Add QPaCE zcomp backend
  soc: qcom: qpace: Add LLCC slice support
  arm64: dts: qcom: hawi: Add QPaCE DT node

 .../bindings/soc/qcom/qcom,hawi-qpace.yaml    |  94 ++
 arch/arm64/boot/dts/qcom/hawi.dtsi            |  17 +
 drivers/block/zram/Kconfig                    |  11 +
 drivers/block/zram/Makefile                   |   1 +
 drivers/block/zram/backend_qpace.c            | 134 +++
 drivers/block/zram/backend_qpace.h            |  13 +
 drivers/block/zram/zcomp.c                    |  11 +-
 drivers/soc/qcom/Kconfig                      |  14 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/qpace.c                      | 830 ++++++++++++++++++
 drivers/soc/qcom/qpace_internal.h             |  84 ++
 include/linux/soc/qcom/llcc-qcom.h            |   2 +
 include/linux/soc/qcom/qpace.h                | 154 ++++
 include/trace/events/qpace.h                  |  99 +++
 14 files changed, 1463 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,hawi-qpace.yaml
 create mode 100644 drivers/block/zram/backend_qpace.c
 create mode 100644 drivers/block/zram/backend_qpace.h
 create mode 100644 drivers/soc/qcom/qpace.c
 create mode 100644 drivers/soc/qcom/qpace_internal.h
 create mode 100644 include/linux/soc/qcom/qpace.h
 create mode 100644 include/trace/events/qpace.h

