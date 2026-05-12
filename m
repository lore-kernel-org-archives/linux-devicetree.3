Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDBA28642B
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557080; cv=none; b=MXm7QVCkfMr2SdW0jA7uyO/yfL1cYv0W2Hgz885Ofu5w0Lgb0yZN9buOwlDF1oWs6FJYm7HOLqg8hArO0UyUu3YQlIwwmmaL62VUblndx5PZvcLOpXaLFrB6ZidJ0B0NnC3123CSuvJU+txBDyMGZQJ34jfCMFNq/6LKyusDd/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557080; c=relaxed/simple;
	bh=osXmgGSxSrKx3zpZtjMg9bkFc0mOhov0B774lUtqcLw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OmjUG42gmODUop036GV6OyJpidtgjyskUe6FRcMgTKPxI+2hH/kDy+adYg0TYn88Tn78Vc0GVbLd1e/lIF5Cu4w/C9ApP9SEyGaIL1adjF7cLS5VeFvjaV+vpwrUzDZf6oNU1W4usQJCT+AKyUZ4A4mhT+SNNXiT6VyuuE9DmY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyygtP7O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxEyw2Yl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyygtP7O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxEyw2Yl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6XWl2994934
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TnhnLrL/izdip9S/qBfDLn
	OxhSE7toF4Nmjgx76c9jA=; b=YyygtP7OoBIOBb/komBX3mkcS7xYKREvqNEU2L
	RqM9/snkpNGfOdArpU4EczKZwLiLa0ebAGkd8btYOLNKz2Q9oEj93ZQ5VffNcXjg
	iyX1DJ9Qyiemm01AYmfUggIkm542985W1egzPlkPyfsm0tZ2ord2MQx11Xb2Zjrv
	a0R+e05y9ugLA4u3dlS0AjXAd66O8XQnX0V8HEIisoGUu7AWblaxiNRmy8+v5xdZ
	j1O4iuq4a1XoieBCJftyxo5vT2tGXhLH5o0YH5KejmNvd7kQzC+owX7buE89OzV8
	gehw1/+MXwfJPHat+wA/u4Ryg9H+cQaABmfMBC6nVIgXKKxg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0s9ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:37:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso6639452eec.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778557076; x=1779161876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TnhnLrL/izdip9S/qBfDLnOxhSE7toF4Nmjgx76c9jA=;
        b=RxEyw2Ylx5akwyX7ZmaXQhuUI6iE5vkBkjgfoCGSlOxceMwQO7sr3Au9AQd14dj3Vo
         8pG6uqEnRe9aT7NUsvE7KJDTGd6Y2Kc1eyc9xuFdhJN7hwjBBh0X0tJI4ZcrpFbE8ZdN
         ep85MT7556G4gUVkJvfx8EFSRg1tA2c4tFnlDc+fNyYlqFFZbj4vskyyh9ADmeDZW1QH
         17cxo4thRUgshf9Fnk65U2yjzLp+1tFN12IlZ1NU420xte2MsnIgq8HtBv2nc/nLpsV0
         zBvl0VJiHoZo6xYZ8fB1VPUYG4VJCAQre0QoKliz6uZFuMuqufwkQn2KizLJdUwQi77G
         91Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778557076; x=1779161876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnhnLrL/izdip9S/qBfDLnOxhSE7toF4Nmjgx76c9jA=;
        b=MxM2DfjssNtW6loxcXghWZMZGYBoCvVoUEwmMQlP1LBx6GJUqkSZuMp4VLzd2fUYwn
         m8QViqEj68YGGJNruKROePyRaJWIiFC6zvRIpjwYbccwaOfbm5WdUXgPS57NfR5wOR9S
         JEd951hOBZoxjOOK/QUraLj1Y3KoSTEJJYqjIVs9YJY5ahMAow9ejr2oXkIpB2qiViVt
         VYCeUwC0V6QmF2Zawl8Tc9tIDyw1108aNP74PF7Vc9G02ilwQ3zZhCCu9z4wocSznnOn
         T9ihgowyKcu8RaOLCwQgZ66YjmaE1MIhhDhj6g7Q8Mddds9fZlnyoo0tggGjyFULE3/m
         vuDw==
X-Forwarded-Encrypted: i=1; AFNElJ8hECjKBxHLv4q11fo7hPaEGoC1jb67h0cTd+zQUhPX8sIUAoGqVcice6ekrcWJ38Oab7ZwEbUu3IML@vger.kernel.org
X-Gm-Message-State: AOJu0YwUzpCBblMQMOpwogeh5+Z1v6NEWnngRqGEYL0CJkeTfFtNcQzU
	t+OMLuTtVK++MVpOODxBIfOkzjf2tg0g0YM8xK9kgeNspicRsNCTtHWaevwk0Iy8kW5WnPOBa6w
	eQSZIWxul/Xm5RfVCjX1DwumvcEGCLzX+MTgjX1fHNtMqL+tCg/H4RhWkPZp+jAhW
X-Gm-Gg: Acq92OFB0m/2YFhWQg4PhZ4mkU9jgqUK7nisixaILlfVxqIR7DaGwWieFP0vb4/s6/U
	491vVmoZ0m0EtQVIyjDkDmK9buXiPh1NdpaS0JO0+F6gwe42NrRhVmaLQMKu+iLmP686Uyct5m2
	MlJzCFMUoJ5hrxX4hWrD00apCQ8Xxxe3iBCj7SsMkrh/hG7k+n5ItxuZwToUplcQ9v6+WRAu7LD
	lxiFO7zbb0ZRVuesGq2pNq5sorxKJtN7DnBpLJyUWjcwpDcg7dXUd5TzIycRjkhbf7UMFjhxieJ
	B9urAX6unN5EqxYKjIeyzrInBZPA025OOB6bxif99G8kXclEUgfpyXWbnUqRed+e9UN8p2wiqzq
	QFYrE8uTVHMi4VEHpr3IPCDLZLf6v+Cln1ZudjBigpzqphS6qmPgOHGkncBB69DinPdKVR0Ti+O
	A8ZeW/
X-Received: by 2002:a05:7301:fd87:b0:300:255:22cf with SMTP id 5a478bee46e88-30002555971mr304828eec.28.1778557075595;
        Mon, 11 May 2026 20:37:55 -0700 (PDT)
X-Received: by 2002:a05:7301:fd87:b0:300:255:22cf with SMTP id 5a478bee46e88-30002555971mr304807eec.28.1778557074985;
        Mon, 11 May 2026 20:37:54 -0700 (PDT)
Received: from u20-san1p10573.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb4b7sm16730109eec.2.2026.05.11.20.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 20:37:54 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] soc: qcom: ice: Enable firmware managed resource
Date: Mon, 11 May 2026 20:37:47 -0700
Message-Id: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a02a094 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Jyhv0Gfyiw9a8mKZ3MwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=s5zKW874KtQA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: H4eAP6YnwgXX07DMaBFUdl9a_6IPaGNr
X-Proofpoint-ORIG-GUID: H4eAP6YnwgXX07DMaBFUdl9a_6IPaGNr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzMCBTYWx0ZWRfX8H7/EY19eHe4
 vBCaSs735/VpxWrTv7to1NA7G4vHrKt2q6rWiXBDP9UUU5umXn+NAMsHzm6NJa11cRYc510dMqI
 zFxTkcaTMdM0xw8wZ9yqVu2uRu6NMrGPdhQ3epVCHb/yjP3QZMgTMv9rOOkadLMVkGOem/uU87Z
 YJuqjNGVaofV1cqbjv4yEwJLIRnIjFOsJ2pgjHDpIQ0WquTl4zNW9ATJy6MTyN06HeVBrDH1Rm9
 mTu12XdHdYjiOENKJFyikbZKmQqCVOcEFsbsXDfbMhUYK8tnaLUG6RoGqnXseGB98RPXM6cVYyJ
 YDfu6PlJWbRFGsqatdegwmAWe3wf1IZEb0VleNxxTT04SQEy4ns0TDXJJG47x+4ks85r9gis6yA
 CUc7v64d+sMLoMh/ZMtDqY/IecchVQJz/50NatRzqF8H32WAPNuRDgpr3Jrd633hrNpUp8WXe6t
 LQfPT1e/GCRfmm90Llg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120030

From: linlzhan <linlzhan@qti.qualcomm.com>

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM (GPIOs).
These resources are controlled by the driver via SCMI power and
performance protocols.

The SCMI power protocol is used to enable and disable platform
resources, including clocks, interconnect paths, and TLMM, by mapping
resource state transitions to the runtime PM framework’s
resume/suspend callbacks.

In this design, the ICE driver acts as an SCMI client, with clocks and
power domains abstracted and controlled by the SCMI server in firmware.
This implementation depends on pm_runtime_resume_and_get() and
pm_runtime_put_sync(), which are available in the OPP tree’s
linux-next branch.

v2:
-- rebase the patchset
-- update to/cc lists
-- Link to v1: https://lore.kernel.org/all/20260430032136.3058773-1-linlin.zhang@oss.qualcomm.com/

-- To Linux Community

v6:
- Protect calling clock API with fw_managed flag in ICE runtime OPS callbacks.
- Link to v5: http://shc-kerarch-hyd:8080/kernel_archive/20260324095703.1306437-1-linlin.zhang@oss.qualcomm.com/T/#t

v5:
- Align the continued argument line under the first argument after left parenthesis.
- Modify the return value in probe function.
- Link to v4: http://shc-kerarch-hyd:8080/kernel_archive/20260318170626.3654744-1-linlin.zhang@oss.qualcomm.com/T/

v4:
- Commit and signed-off by OSS mail id
- Enable runtime PM for ICE dirver
- Add driver data to diffrenciate the clock managed by the firmware or not
- Link to v3: http://shc-kerarch-hyd:8080/kernel_archive/20251107091315.476074-1-quic_linlzhan@quicinc.com/

v3:
- Update the subject of patch 2.
- Update returned type of remvoe function and firmware flag in ICE diver.
- Link to v2: http://shc-kerarch-hyd:8080/kernel_archive/20251104104935.2752144-1-quic_linlzhan@quicinc.com/T/#t

v2:
- Addresssed comments from Badgey
- Make Document binding of ice pass for binding checking.
- Link to v1: http://shc-kerarch-hyd:8080/kernel_archive/20251024050921.3573402-1-quic_linlzhan@quicinc.com/T/#t

Initial version:
- Add fw managed resource abstraction support in ICE driver.
- Add respective compatible and document it's bindings.

Linlin Zhang (3):
  dt-bindings: crypto: qcom,ice: Add sa8255p support
  soc: qcom: ice: Enable PM runtime for ICE driver
  soc: qcom: ice: Add SCMI support for sa8255p based targets

 .../crypto/qcom,inline-crypto-engine.yaml     |  27 ++++-
 drivers/soc/qcom/ice.c                        | 108 +++++++++++++++---
 2 files changed, 115 insertions(+), 20 deletions(-)

-- 
2.34.1

