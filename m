Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1283CF1FD
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068478; cv=none; b=OFrxguJYiWyJO+REv20cr7vQHIU58iFPx2oLOTtEe+RZMeNsl4c2V8ASihXmsuXCLV8EDBSvOOgV5jYmaz58wjTellineYpR8vsPo7OilAJxSlq+zEMtnAjFxtJn+Ragrcd6WO9qnMJEwCpgpTu9wVXunFcOvoR03rAzQZAmO3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068478; c=relaxed/simple;
	bh=BJj+h6cqFz7a8jDJBV4N5fl7HAGSE22AVRcbeP06B/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I2Vs4LNBCRFE8N5IQl75MCKYZqodiNBAUn37VFlZ70FaeYxZ7ZAu1cEHZSN8DLB936ZuwZmGNUaV9WlFedNFnhzcrXZGBnx4GCfttze4bKM/tuR5SDj5m/zcmBAZT33SHMznE/NOI5fKq5bbjDNr3mVgzN1RiAay5NREAfbegf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoHi1EiB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f/us1bWu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoHi1EiB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f/us1bWu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE0iXD1843403
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNUPIhgDn26t1adXEsWMB0BzKTY4owl+xpM8zcLh8mc=; b=KoHi1EiBC6jfZcYC
	QSvidTv9Wd3jNuzJaoi1aA7Rpu9eHPSlan9JCtpZqvXfHCnviCVlOtWa6ZxPEIOz
	z1ZyPw170scNBZtf9KfpfYr2SuXSoZVM86G+qXJM1nJwNPobCbLef0MxeGU1CmoL
	ffldrTIya82O0f0ovbLFk90Ke00Hm16IRazYv/ToOB1+c1xX/c534yF465QL/NwU
	h+QBMWvDWj6E/EnUKhYJ1a0oCI4BmMgTPJmiJtfoF3uotcQgldnktlOen0KuBZqQ
	iRxtLjXXBpDIt9xt+Vr+6eN1vK4LWlO0IDQpM9ZR/ukThW/WoVtUrSyKHtufmxde
	+QAazA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fvp2xkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:54:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so121115a91.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787068474; x=1787673274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNUPIhgDn26t1adXEsWMB0BzKTY4owl+xpM8zcLh8mc=;
        b=f/us1bWuTr1RLU/nGzb9Lil5JzPu6WEMMG+ODd9rNwB4JY0LorQ5JyndYWTL+1HGnZ
         vFOOlIHqOydxcZJLWrNdT9DpYn6N4ooxnJFcG7xkJnnHR9ZyPAZoUAska5uHlJRt3aU9
         0//Ry/1CUlK9cMTzWMqhyI2R+3j6W5HNeoiQ0FsjbeJeXur1ZgTN9RbgXHOMGqHEiXAJ
         Ptgwma7qQ+TMu+3JExyvta0/5C8AYupgBmg8uQgMWFnF8VpJpbg5NX5mG+C69gatyB0I
         XYbY0nTeU049ElM4mWnkO5Hv+9nABZDX6lT1Gvtf0374YnYgyxZ10RPFnwILFpoCDsbm
         DVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068474; x=1787673274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNUPIhgDn26t1adXEsWMB0BzKTY4owl+xpM8zcLh8mc=;
        b=MBfRkff+sOamqa7ev25z08/hdliWMtkSOqcNgfoQa/fB2n/c/IuvmlAoExF3z065RZ
         CDdUTwAa7DMC/S9qRk9tM3USIBjtatYhnW/fAXL80JBvw0bhnKzYfiWy4vl7LxM/fKgI
         3WJsMGV8VoP0r9fkgc6V+dq7NcdZNbfgs59ypxy/BlqUxYWyNqQk0D8hb+zrqUdpENcO
         ZMnTmh6nJaW7xtC7YB0x0h9+w2AHyWsp2DzCkCftRC9XjirtK0omhLEysMzahgGznWJq
         pfnNgbSfdMv+a22Tv9vBz3UhwY1FP5fpjKEo/DGVt1j3hxrLu2eD2Psjl/6Gmjx3QCOw
         NCrw==
X-Forwarded-Encrypted: i=1; AHgh+RqT5J47f1je4Nf48h0+aqyM/B/gbNkMafYL6lFh0LUh6Wd6q5zl1Ix5PuQ0e/Wz+SfqvkiB01OPH6Tb@vger.kernel.org
X-Gm-Message-State: AOJu0YzjJzp5d835jgw7AE+UE6QcAkZqdTkYIUZ5/x94v1njsTgGqqaO
	v9RWfF/HL9pSJCPkMY9lThLrB/dvvJsRF+inlGbTkw0UH3WTN4Vz7pFyDshbVxe3bd24LE2zMmS
	CZeosS68n8drV96SWu78t7wrR/W8AXYS0sq6lhvNOPog1AbP1RjDcX/bjdo6zmp8g
X-Gm-Gg: AR+sD11d0fjP6pcqF6yveJmE24kp+P2EG1bVCTjp2hNX/eKa7KWm0TJ5gePwQCm/4JA
	R5iK+OSj0mVogFWsRmSjYBLKT4g61L0gR9xL36rgDAzbGhYIuVuqQNTD5Waxg0lWAc9UXJqjCms
	8/Guon6UkpDIrgKRZ1GlAiz8FDxRPj1med10RhJeV2vs5IWKHtHYXD4VXe1C7M189WVpTydEE9N
	jLcpYX7wD4n7crtZxmiF8ToRYOCQTXyHIDFijHSwjbB+BZlGIadED2rhfoyiT8Ep3TWMBh72SWa
	M3PCCNtZAfZhxKYZOGvI2W2aVbqS6oBe3fNLoefc2iZ0htElyEX7G2pwgJc067etJqsxsFcuTAy
	/4c/iNR3+7ZKAN1tHJzTwY4wb8qtK0WFajA==
X-Received: by 2002:a17:90b:554d:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3955a7b15e0mr12443635a91.11.1787068474166;
        Tue, 18 Aug 2026 08:54:34 -0700 (PDT)
X-Received: by 2002:a17:90b:554d:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3955a7b15e0mr12443583a91.11.1787068473674;
        Tue, 18 Aug 2026 08:54:33 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb41esm8877721a91.10.2026.08.18.08.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:54:33 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 21:24:14 +0530
Subject: [PATCH v2 1/5] media: iris: Add dma sync calls for input and
 output buffers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-iris-fixes-dma-pseq-fint-v2-1-8dc8c4b3880e@oss.qualcomm.com>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
In-Reply-To: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787068460; l=1822;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=BJj+h6cqFz7a8jDJBV4N5fl7HAGSE22AVRcbeP06B/M=;
 b=LNSWQJ0jEEwG5D2jDFEvMvuGDkumH4jv3k41dqOwv7gmEqT/9Cft6q6q32zjzDer19dYL4Fgc
 JYH4rzTJ2+fAWZYi9ufsCiytkJsAQPpMpv0FmJrsDhUgc2bmYohs5g0
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: CkF0vEY0NEFtWZAGnG7sMjcBmER1Yudn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfXxvAZuPM/28hb
 rxfHNKUBcAybY508Xw79OZSk8B1vAuXju+WFttSDOesEnI6TDOqruv9sI3gUMyTBuOLCxtWrJ+P
 zPf7BZf9ipbeeBjKuz2i8MEopWuhidzS+vAraGAyjqtZhXbNMGASHVgai+n9Do8F9dqTxLPW/5g
 3pSl/SjDqYOlN74H064XRa2wQxBwe7kfgH/oU8D29rsxeK86YqrQqFz2H4+rcDAJnTDJUnZeyDL
 e/+QMHL3xDiSKt/8zY6X+GY3uAVIwM9mpcCQfTmSjiKaVqJ3yi84OdQtN4Cb6cGNakRhXKkZtbe
 cPvloYj7stE5giP+GwA/DgqJqEjUTsPNd5SD1gv/sks9AqJxi2J3ouk/odA4xAc4cKyqLLrVMKk
 iJYcp5NITosZsviuH8y0SpOV+mo0FfHjfA6eut2hW2OVSHRQwlxl1jpFdSclIR1bM0aF3+48Mip
 cP6sfuz+dhP9m487zAA==
X-Authority-Analysis: v=2.4 cv=K/IS2SWI c=1 sm=1 tr=0 ts=6a84803b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cW1-DYLjWNxHbtL6yV8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX5KS8Gl0rBT/x
 BKiAbUOVXQea1IbHQ4AS2OQh/bCFklBOc9zB6m4iXcJ/D6I4U4X6SMRoNXG7FbFQKkpDHuoU3E8
 g4WSiBV8g4eNA6cBziIA55IvhTtHYJY=
X-Proofpoint-GUID: CkF0vEY0NEFtWZAGnG7sMjcBmER1Yudn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180117

While testing with some higher resolution clips, the venus hardware
triggers a fault due to wrong input data being received. Corruption
was also observed in the captured output when the client dumped it
to a file.

On debugging, found that DMA buffers shared between the CPU and the
venus video hardware/controller are not in sync. CPU writes to an input
buffer can remain in CPU cache without being visible to the video
hardware when it reads the same buffer, so the hardware receives input
data that does not match what the CPU wrote. Likewise, on the capture
path, data written by the video hardware to the output buffer may not
be visible to the CPU, so the client reads stale or partial data,
resulting in corruption.

Add dma sync API calls to synchronize the data between the CPU cache
and the venus hardware/controller.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177..c7a664426187 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -585,6 +585,13 @@ int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf)
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
 	int ret;
 
+	if (buf->type == BUF_INPUT)
+		dma_sync_single_for_device(inst->core->dev, buf->device_addr,
+					   buf->data_size, DMA_TO_DEVICE);
+	else if (buf->type == BUF_OUTPUT)
+		dma_sync_single_for_cpu(inst->core->dev, buf->device_addr,
+					buf->data_size, DMA_FROM_DEVICE);
+
 	ret = hfi_ops->session_queue_buf(inst, buf);
 	if (ret)
 		return ret;

-- 
2.34.1

