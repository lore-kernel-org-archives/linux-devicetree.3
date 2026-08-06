Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E108A41F5C1
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006612; cv=none; b=hqvS9XwbnKbzIV7fbr8pqdkDPDXZm87PT+/uFGpswsGHb9jSZLKeSvkL5zA/ahbHROINUh+gjLtMjNuHsG/YkxnqhhDtpAFUUS60Crg305siJtjEaU2WnMzZ6O1MG5w0VTVY2DwD0TBy/7ELdiBxctabQxMBKeKPI3l1SBv9M3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006612; c=relaxed/simple;
	bh=TprHX5IL8YrcrUWqFt02NpGVXmRlVfThrNPCvDkcGUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=prwfjq7zCIT+oM7gGLupHr8EA+uMPBztp72GjiG3i1mxT+YRxlezOrHUnWqllVg1WBe3SNRL6c3drXtMenn3w9jCjdtMVD/q2ed9rqZZUJaCYuDNb5rY609HRN6M88DgmipZfbsDnupxM70xng3xCSkq1qLZR18VvQgAU6RPMxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOI4xGpC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPnFkeMn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOI4xGpC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPnFkeMn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67669GMf1074456
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 08:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4sx/jJIYr0KVKmz4oHyzboJa+2zVeJWkX3RGTVkh0po=; b=jOI4xGpC7iIWEHGf
	vjgAeUaYCkSsNZmmNbjDmb9p3vPZzU+0bkpmrJ5rAMm0xaJzLcUKaZ/yeUgKUG16
	EYJY16PqF/BuBzBI/dzx5fd2i0SLtVi3lKlhDMHrXmsgdcDZZ8AO6Pd6z1KTxecH
	DrsPI3tMpGD3PJcxjwhA1SBj1n3O7Y6Nrt14N+Gj6UNCOg4zysXkgsgU5jNPFTv3
	53fNqqq4dEp6XpzeGWj2IIXRB505TS0wQiHuwMIU+U2LfL3rYFGERSd4K1MLiVO3
	UJ0R8AVZxKY7a8ew0D8y3ZCixe4YL627uwce8iu1+tbfPeyV2mkA9iRVc4pHXnTR
	lEsxdA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvmrjgpu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 08:56:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e048a801dso2695781b3a.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786006609; x=1786611409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4sx/jJIYr0KVKmz4oHyzboJa+2zVeJWkX3RGTVkh0po=;
        b=iPnFkeMnymfYubwCwzbwyJijQPnUw4xXJgh9ItW1aaYgpLFLgj4vNLHzX9FlgbA1ET
         tSEMj5P5IJNsq/Y3qLuNV+GN3k5xGQD6bP5OlzWfJVhguDOGXXZQ3OpG+cqPIeL3vAfS
         mXMhJQXnIliI/dLPkhITXaviu5FsllbhVRIpaC6XUKaCRxrwTXXJwPlsT3wqbZnvEAVj
         +ewFnLgccmxhL2RMAXj0jfLdcC1tGy20w5u96znvXULHZwkDsNnikHeZ06q9KpnOwf/K
         fwCXjHlnyxrn6VjclAAflA9JUU2bqzLkKtaael0PgnVHWBHcP/1lP3edQruexbbcYiYN
         xftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006609; x=1786611409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sx/jJIYr0KVKmz4oHyzboJa+2zVeJWkX3RGTVkh0po=;
        b=d5U6rBFT8/RtZRhzlbQBFzp/oCmMFRykymMfFhLAAUh5uIO7NB70+n3YSDK1KEyl0N
         Aq0wbAYfnFQ4YC/3mfVaLgnx4ghM0n6Py1ly29vvw8fzBOKIEC/HbU7kcpTezqzvWQRx
         6TFuS2FDPSOHB4nL5t6GBtMi3iXW0qXSg01iC0QtNkvdLpRO//ZPwJDREvWIZ+OCU0xw
         2Lu6GtNXXFd66EYrkvZXM0nkAZskVvi4wxhkSgS2tLLO4o7gM/6xzD9DX/xNaiuPifCh
         4XtNzGJJvWJIgIleElbeC0HScoVVusPbMlAPbYyLjqca8dpsGw+AHOSNvSbOcFriH4OV
         W33w==
X-Forwarded-Encrypted: i=1; AHgh+Rq5uODQ1vMaNu+TC8l6k+s7183lLas3NP5zLM9py5Y2f5Zdpu3SI8xVkKZzfegO+TZjWon22jYVxApb@vger.kernel.org
X-Gm-Message-State: AOJu0YzqrqLg+1nN3jebO8WYaK4KMkMfV9XQsr7zkwjfnKKqaA4tEuis
	ET5VnZt1UfmpBrMzuqcK0YQZnK/vD81grH76JX9Yrg8wnqC24cSaHDc70tYlL04ecwcNPgh6/bp
	V+aARiSD3P3cJxHeA4hdr7g3hntOOLF7a6AU0+YboRcIEhoazsePcOTjj1xuTvIDv
X-Gm-Gg: AR+sD10D2ZsirfkC1rxugEgXyAY/6HAkAya57dNkuzTrdvChRjKpShsw5RX1VbKAoec
	NkdRu2JFIiJy6d6Z3spq6YIp5V96NLzg1PbxT1C7es+nRfvMkG+WA57fzxa5E0Oot+J3cy4qS8m
	cuKyn2uG/kvOvPji0G3B1vGoB8vEJvfcS/7Wum0gpoZKaG1EEBuxeDut7aOAI+PVJKYYXCpFzTf
	Kr1WY8KfTKWDxZFrKOhc7huEkAMEr/bBcYzOPKHHZ+fvqlxng4eid6PxucLa/BMRENz8eOf7urD
	TuvV5CcD+uPvGT1W/PHq6KQEBVO506LwgRgVacrqYGNphVmIaotDCcol09hLhippD7GRMpOM29B
	PzUQ3wUrWmOLjOnj38zUNceYi0ZAo
X-Received: by 2002:a05:6a00:4488:b0:848:56ff:6ce4 with SMTP id d2e1a72fcca58-84f2dfc533fmr15894455b3a.5.1786006608931;
        Thu, 06 Aug 2026 01:56:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:4488:b0:848:56ff:6ce4 with SMTP id d2e1a72fcca58-84f2dfc533fmr15894394b3a.5.1786006608354;
        Thu, 06 Aug 2026 01:56:48 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b7368sm953876b3a.37.2026.08.06.01.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:56:48 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 14:26:28 +0530
Subject: [PATCH v4 2/3] irqchip/qcom-pdc: Add purwa compatible for PDC
 secondary mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-purwa-pdc-v4-2-62467f4b4ddc@oss.qualcomm.com>
References: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
In-Reply-To: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786006595; l=1014;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=TprHX5IL8YrcrUWqFt02NpGVXmRlVfThrNPCvDkcGUE=;
 b=tf7xixIqMQmLd8i75hjGynYpDaTb5OQY1CrUH4aWllEfjFbstqSY3guA2w8sAz2Ip43I208by
 iZtEsOxKSh6BIqgZgI71hdPerY1aduAuYutfa1/pc3kSRaheUG/+clz
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=VNPtWdPX c=1 sm=1 tr=0 ts=6a744c51 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PsF74K0pJtfrG51pEAYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: GgYY8479BCH-QBC73akSszZ2kJJeZOCu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2OSBTYWx0ZWRfX5vVuS1ymZqb+
 gTWHZgaGH3n6Q5uTIDD8EyAFL4iC1IMZ+FtvfKu85OuJrCF915ijInKxqUZxwxhdwfU1IVdDSTt
 6w3Ak6P4iLvz+0w9V+G9NxnXYHUA0o8=
X-Proofpoint-GUID: GgYY8479BCH-QBC73akSszZ2kJJeZOCu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2OSBTYWx0ZWRfX7JMUxtgoD3y0
 1a7RWq0PxbASEnf5UT5kaw3qehdZfsybfGT2NqgGCH8TG2tDD4ZB8pjGo+t5Sz4H+ejEBtLjN6n
 wGCi1SxDrlEAt//cUIPomEUq1DKehLQakA9yMT/cKzGDkW6O1HaeU6haE42g4QHcFyZYdD0XZbA
 cH2WtLh8wXonpHn0h0ZrRe6Vq3ej3gs3Ms+sNJ2u/eu1pp9peCKuVjY7i4s3hvKNzv0iWTk8mMi
 3X1bojs4T4W5y41xFI1bX9ZqZStnAL6pka/0DTbAjm26SZS1UzSlPAGdx9CZih8OisVBHlUgQO3
 O+aeAHzehr7vBrv9+DPv/M/ffn86QFByKjEkzBx9ktbUu1OF/l0/B1w7PhEmCnHcUOZE4pKo9cc
 E3bag6OKrfWU1Jy18BrCs1YxCR2jNabJEP1ZrRS+z98CDg5YkoyQRysCF+OmfrDhPXINMn2GfiX
 vPUW/PfycnOeZe12s8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060069

X1P42100 (Purwa) and X1E80100 (Hamoa) shares the same PDC and windows
firmware sets the PDC to secondary mode for X1P42100 too. Add support
to reset the PDC to pass through mode using qcom_scm_io_writel() similar
to X1E80100.

Make sure x1e_quirk to workaround a hardware bug is set only for X1E80100
as X1P42100 have this fixed in silicon.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index ce6d80c7f17a..29025a212ece 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -715,7 +715,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		}
 
 		pdc->x1e_quirk = true;
+	}
 
+	if (of_device_is_compatible(node, "qcom,x1e80100-pdc") ||
+	    of_device_is_compatible(node, "qcom,x1p42100-pdc")) {
 		if (!qcom_scm_is_available())
 			return -EPROBE_DEFER;
 

-- 
2.43.0

