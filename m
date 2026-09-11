Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44A439902B
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114896; cv=none; b=iKQuxlQ6dVfYVmA4o186bTYYbEaB8RweUWzrfiKBmQlzuRd/e6SkPJn0ayFOPrBwhtXvQUBeD4uMDXBUjp/2hVJbEv7p8zZ5NRUyMIbafv5p/0KFo7vyxUGgSCRDdTXhCL/zH6mUw5Q21n+3CGtgc4B+eDAptguOz2vQtNX5Q/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114896; c=relaxed/simple;
	bh=/uI/IonCsG0gCA+TuNsimYDR40/idqbcuTaTESIrhQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AyANZl26WA12IL3nN38M3uU/UkwBvExYbEMsLASO5dEZb77WIZF9cUV37NUE9Ccec3WiIcA9xR1CGZD0v7/nbEeBIpVY3aWRO9DQ1b3lJTmhLHq1sMHxHQpBtqmgvr1xhZQYfMqNgiBvLgWijRrPcrhIfnjeh25i2PurVyp0aQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtQuau69; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmjxr9qr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtQuau69";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmjxr9qr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7klf73845340
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jC//AH8MdM789lRUxzj5I06WPe9fiOoh+LA
	3vnSIH8c=; b=DtQuau69yqAaTJOLGxdFF/nFB9/w+p6GFDhZz97tD7j3eq/IZgy
	OdEKQK2X0y8/eu6AJB91O40cXxLbud5+nhbJfagMzRbrdqK8gOJqY/RnJKxtkjvW
	9+UFI9xjvSiOYuv7FEwy1muLVHJ0XTbvgEJ5sjf4/5bFMVQrYUCXBcxWsEqOgt1p
	Exq3/zKZzfl7z0QvRktEjDcVM26bs5IZQpFpBon0sGhQ9Wfm8XK+/ueb9fryf+iA
	IYj3c7urwV0pVCG0NmTevH1Q1S9y8ZKxiJ+LMwutlcEx75vi8fjQJQMe/xrDOr73
	Cu4X6rRHiRdcCW95AtdK878K0Ywq5rUBOgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q41w30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:21:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93918756165so112470785a.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 01:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789114892; x=1789719692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jC//AH8MdM789lRUxzj5I06WPe9fiOoh+LA3vnSIH8c=;
        b=gmjxr9qr0T49W3uBMDuaHpwSQUz/7Rhn1icsbhtZAjy1FQ8JJxs8EvBeCClMWoXQ2A
         6fR7IViRmDRmjBmZWQflgpMxZ/73milZYkUwwSE/XtbHApuzjDX503M7xUbniG2skrD7
         nmAPL/Pvu5rQmtLnAom8rMJ7lvw6Stw6kbBZNbLoRfLB37Q2+CwFGgYuTZ+vxS8TRNSs
         uGGBkN1obX2z5LCjLFTcfa+e4ICZDGmEK44eHdOO9UflcLYbU8OTRDsuiukU/qkNisgc
         u56uSqphj/lgMR93AL0nYfsBg3VMDlwnC8x7k/JxEpERS8GQI+P902qLz18S3FC6bU0v
         Goow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114892; x=1789719692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC//AH8MdM789lRUxzj5I06WPe9fiOoh+LA3vnSIH8c=;
        b=Gjn+Td3oeCbfOE/kJz3Ykmfx5YhbOKfROuthUHdjM9ZQc2s0lpPT2u7fNUPiWH74Sf
         e9EnKqS0mtGOWIvVTrwhSFLdb2DmTi7DIHWNMMxEGVApRxVryjUDCIjImnJlGYUq5DgI
         5wRtSUfICInW8gSgup9JeGQRdMEN45F2BLu9vWglk1b4EI1gOTYnzZ1BZOsMuyzxPEkz
         eNq2ENtzb+Yv1s6ZAZ43JzkHfOxNKNG1Cf7qnvQJX1PHj+V2wMe7uQs2YHNowNPpHsuv
         ISax5z/odj9xOD/Mf7PRRz9+7yeRbGvzYbw2+3ta10YQ9BhAKvjGqj9YNKQ6hiNrkxIw
         OAiA==
X-Forwarded-Encrypted: i=1; AKwUvByVhM6nfEe0On/mz03XsNrEPdba4a43AZJl61aiMEglJAzhY+ja9fpS992X7zEYhV8rYZdfBGMnsbnr@vger.kernel.org
X-Gm-Message-State: AFuF++lsG+JD3auFNjC2vpWF7IHf/fUl5oOQVpdhCdJHZLgUhVtFWfey
	+3CB5vvUWC0baBnJ06ufwnAlHJD3di58WqEG3YS+YP6IjVdynhKpgrRMexOObf7zFShUqVOfm9+
	ecqb4zHgpL+a3RsGn96cew3i07Epk0qAhq35SvpQrDR1yilf48m6huLBr02KQyXTh
X-Gm-Gg: AYBFou34wZkL+3Tbt2/iiFHQEICQhmvGSi3SlfIdTvszSl7hDXgthmOzgNNYtJOjyjT
	K7cWGpkCxcoMk67inpvNhLfkv9C2IPZsrDSlW98KgZ19iZxBAWO443zy4+FDy2IsN4Yi7meSARq
	qCUY46HOpBtiqODXAAuZ728pdaWTvNklRNVrNYIjC74z2dCpumknFyIJDyRQGeX1Mr2GoZZHsW5
	bEpq0Ov41YTqiieIMQXPQrvaAFHMPz5443leqz0i1nspB645xfElZWrArr4+5q++g40Rvea3dCG
	LFcZGOBrMdCRMiGlMFMtTMpiDr2OJJPhpEX0zv/L2nD4fQL9NGk/fWkB4DfyYHhYa3eOT+w1HLW
	Zh/xmJeXsyKtdQA==
X-Received: by 2002:a05:620a:19a6:b0:930:987d:9cd7 with SMTP id af79cd13be357-939ea0e3700mr387707585a.11.1789114891883;
        Fri, 11 Sep 2026 01:21:31 -0700 (PDT)
X-Received: by 2002:a05:620a:19a6:b0:930:987d:9cd7 with SMTP id af79cd13be357-939ea0e3700mr387705185a.11.1789114891489;
        Fri, 11 Sep 2026 01:21:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm4488880f8f.23.2026.09.11.01.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:21:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        prasad.kumpatla@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/3] soundwire: qcom: add multi-master support
Date: Fri, 11 Sep 2026 09:21:08 +0100
Message-ID: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xxHyF-CtrpfkNiwkdnwzhRt73u-EgK__
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExNiBTYWx0ZWRfXyNUGrIM81aX7
 9Qxjdsp6in7/ZYP7Ng6t+YR4AcD4hzUasWs21i4FND/lvSz7Hb8BiYmQU7l8qw2RhIgC/euY14h
 tB/SEecwV1ah3zumH7dMedtISzz1P7g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExNiBTYWx0ZWRfXxzfYg2PMDFIa
 bVZLx0dUiVjFDUUQ2ePVwMJD0Uroq5X9uiIcaqEbanT5oqD5EwUzsSmHQPzPl1dJHcKtH/B1HuE
 dv0i/9JPBM7fqGU8uxMBXPJOynd6H7HBfTEAgUa2c75rWaYhXu+MH/5kdHOzNwSqVoGoBa3fEnD
 ypWoQ63Mvr6g8SF+QfGBg8fmQt0Tblz0lNLhw3mIPbfBbU6sBOZQh0pnmwF6U/5MkkFtemTwlK6
 cLdr+R62eBGY/qTyRr9odIyaEKqtoQpXYlPWYtGuCaGssest+20dK+qQ3syFxSnS42/XAqX1xFM
 yQvjcSkp6Pz2acCaSvy/fmMCmFJgwxhQNO6cdtV6rDoQ9LlRQMsccJodElflmfBIiW5BzbpBHBd
 D9R84KIurRLkgvnenzBymamITdyyXtiAxlQmfgces4s1+7nLPCvpRHqTbFZwd2AtCCtfGJonblx
 fBPn4u9+FxJyuHsv5Mg==
X-Proofpoint-ORIG-GUID: xxHyF-CtrpfkNiwkdnwzhRt73u-EgK__
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3ba0c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=ra76rZe8w0pY-zNsRq0A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110116

This patch series adds support to the multi-master in existing soundwire
controller driver.

On Qualcomm Glymur SoC, both TX and RX soundwire controllers are wired
up in multi master mode connecting to an SDCA compliant Tambora codec.

One of the two controllers (tx,rx) act as primary controller in this
instance its tx which provides clock and control and some data lines and
other controller instance in this case rx act as dependent controller
providing extra data lanes to primary controller. This is called multi
master mode in Qualcomm Soundwire controller.

Multi Master mode allows synchronous transport across two independent
soundwire masters. This includes synchronized clock-stop, clock-resume,
clock scaling and bank switch between both masters, the Primary master
will ensure that.

From the slave's point of view there is still one SoundWire bus with
one clock and one control lane; the extra DATA lanes just come from
a different pad on the SoC.

Currently the bindings are added in a way that its possible to add more
than one dependent, however to keep things simple the driver only
supports single dependent for now.

Topology (2+2 lane example):

     Primary IP                          Dependent IP
     +-----------------+                 +-----------------+
     |  MM_SYNC  <=====+=================+=====>  MM_SYNC  |
     |                 |                 |                 |
     |  SWR_CLK  ---+  |                 |                 |
     |  CTRL     ---+  |                 |                 |
     |  DATA0    ---+  |                 |  DATA0  ---+    |
     |  DATA1    ---+  |                 |  DATA1  ---+    |
     +--------------|--+                 +------------|----+
                    |                                 |
                    v                                 v
        +-----------+-----------+           +---------+---------+
        |  SWR_CLK, CTRL,       |           |  bus DATA2,       |
        |  bus DATA0, DATA1     |           |      DATA3        |
        +-----------+-----------+           +---------+---------+
                    |                                 |
                    +----------------+----------------+
                                     |
                                     v
                              +--------------+
                              |    Slave     |
                              +--------------+

This series adds multi-master support.

Patch 1 adds two new DT properties qcom,multi-master-mode and
qcom,multi-master-peer for describing the pair.

Patch 2 wires up the primary and dependent roles in the driver.

Patch 3 programs SWRM_V3_MM_SYNC_CONFIG on both sides so their frame
generators lock to a single SWR_CLK.

Tested on Glymur (SC8480XP) CRD with WCD9378 in compute mode. HPH
playback and mic capture both work.

Srinivas Kandagatla (3):
  dt-bindings: soundwire: qcom: describe multi-master
  soundwire: qcom: add multi-master support
  soundwire: qcom: program MM_SYNC for multi-master

 .../bindings/soundwire/qcom,soundwire.yaml    | 109 ++++++++-
 drivers/soundwire/qcom.c                      | 218 ++++++++++++++++--
 2 files changed, 303 insertions(+), 24 deletions(-)

-- 
2.53.0

