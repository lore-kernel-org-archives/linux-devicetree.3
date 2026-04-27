Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDEE2248B3
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777251177; cv=none; b=JzedzRZkxeHBvjmotQsyRJSv81shETCFHgD76+oNmPNcsCIDiTzEl6Qf6jB9syvEUT5u8mYlRHedTsS5JrmOmTDW9Wa7DEkwgvKihAg4Nwj6Q+BgJIyeSEMm/ceY2An2JZ+0yUMn9AtrjTsKVOrslVRsYigDzwbFn7AVCIBqJZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777251177; c=relaxed/simple;
	bh=Fa0Wmb1B0Rd91BCmBH8iVForI/wfHKIoBy3LTF6XfzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cweJJZIUqp1ftz2aSYoTNQLHA3/9MLlQWQV6aBnLJc6yHVe/gFRCUA5eXPR+FeOWg4kRCe5Q6R7hxGSQ6Yqp0VcZF8tTSzvPwnFgfNEd1z0TwjKs0J9tTW7rtqOEBAGiXL21273BNG+8CCDvg587Zbtr9DcXSiBxe65yrSl6ivY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWpsK1RR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkS1fBY2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWpsK1RR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkS1fBY2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QLefZm2529647
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=plr1XEc5tQD
	hLDFdxbXSFAGAiC4BdlCU0+HKjFzAIPw=; b=lWpsK1RRdnfqz3U44Pz4s84txVb
	h1gB1FkMn8HAVLop256MsDOMW9ixd54jpjjlWcnJWBNn13TD/w3u5Le0d0VzG+00
	53iMWfynj3lq99SDquhvpOAolMto6smsncHNuHMeOn12kwz7mu3NasrNapEWPFXK
	bHU6WjGVzf8zBQzMjfef5SYy/wXJqhYLBCgMjSMRmLUG/r+CkrDordaFa+soF/PI
	boez1dJrGiLN+oFGJxQXS1bX5TEOSBA/OEEWCRNhZD+FsQmomKIHUsdZVRBg7E6s
	ryhZy+m31+V2LfKtVaZqx4IycYqhR3MWhEjin0aWR3i4rFLbMBWdGU1oUGw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtbw5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:52:55 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c8ccc7593so11481864c88.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 17:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777251175; x=1777855975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plr1XEc5tQDhLDFdxbXSFAGAiC4BdlCU0+HKjFzAIPw=;
        b=hkS1fBY26/0pNP8SNB82AIJZknN21h4oIIGL2R25gf1Ksn0YaSwFZs1JMMF5f2vBf+
         ITQDlEcp4P8P/6OmzTKdJa1o45SfmMimCwrjUOgBarnu7GwfDetbzl/1HU687EzxirQv
         WN6hdxvKksJmq7o5+MYtTyL3wWdce9q7jbwzSvjDyy4UNXaM+wFHSme9ASOgrB0t2rTa
         9BjiY1BFiF04hJMkmFnWJlX79TlzpQdvluFZaoSZ/f2oXPQPqj6AjgpDc2vU9qnotKVu
         pFd6PDzpz++nsHvb+UwQdzWb40qu1V2IT2NeIg77MdDwzsGdkd80EdNAOFsoW4vU0Tjo
         UknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777251175; x=1777855975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=plr1XEc5tQDhLDFdxbXSFAGAiC4BdlCU0+HKjFzAIPw=;
        b=WScD7GMm0BDtcK9Zavl8c19G8buoPZwtVnp5r7Hnunlatq3xYgwLs/8I+vBr9KuzRP
         CCshwXuTSKkS8X0JSvPNvUsZKVLDrT2Y1WQfbhUpioAPWIaHnfEEzl2PxD7vteXxLMug
         jMrIzN2XrgR+bG/NvIQsaSi42RQC2K2QvtsyhbN1ZDHMhTZQT+I+ZW5F64iTtrlr4GyK
         /ZuBfquX3r2qiNgQvsR+JE1sHTS/tWoiLwBzFNmemLUSYAJn3tREtkO7YiyAAWXZiCL/
         45bpTcrjXNBZoqdCLRWAcYWUJeEMn7tTlaY13YXRumuGuNrxEYZ7xqkd79q0N7cPelo7
         12EA==
X-Forwarded-Encrypted: i=1; AFNElJ+FneNXjd0BCBHks54aD/tZcq2Fq/ozkRhgU8NH2VKcM+hWb//B6d1sqWkQxQrdNRP9TD5S+Jw7yjGF@vger.kernel.org
X-Gm-Message-State: AOJu0YwvVSIFqtGElKlZGFXcFInu8d+S4O0MB8JLJNO25YEmfVhHsgM4
	aQzqFzxvauMZSd60dyHi/OXUJuaEtyFnedi+98CcsgvZUUXaTArC6eSz9AmXvdwSnJLvFZD8RZV
	r7HRGvH1ocvPGNT9cynuWad+miztA7Xaa+4MMrgL4UNEWw3JrI6V/4r6s+NdEuJ6E
X-Gm-Gg: AeBDievLyctEv5VAt+WEFY5uCGZmoZ5uF5p0sUV8yET4YmIH9GIckAX4hHSu8PZrXwp
	scRr/gFjkuQIhcj9yN+M4/U+4npzwOSwaStHevm953JmAAlS+f+PyilsqZelwujdig0z4vLBo4p
	T6QJEan/jpyPJjO8ck0M5LdHuHrWP20fXtNwVkmCLW25nMmOx1zkQu4MhNfwYN+qZQ9a8lf6eNs
	cdZYdeXNr5UGiFJOsMKOYjjMKVxzNrfGe7okgezVPCwLEEyT5sZ0x0u1H6BXwifo4f0g71IHOVe
	XXKDH5+4G3U0hCCGJPv4EHmYlQBKvtdehpDE0cq16E0DOV+FNDFssiEf24BKVmCkXxyIrwv89nG
	vGmOG6Z1/Oho6VfxWMj23J8bD6dcF2HlzXrjtBHyxTKLygKm6G6d84jgBq9p1AXlkVsiyHkmKVB
	k3fOJKZj2kJ5MzfotK
X-Received: by 2002:a05:7022:1e11:b0:12d:d27f:d817 with SMTP id a92af1059eb24-12dd27fd905mr1225983c88.19.1777251175272;
        Sun, 26 Apr 2026 17:52:55 -0700 (PDT)
X-Received: by 2002:a05:7022:1e11:b0:12d:d27f:d817 with SMTP id a92af1059eb24-12dd27fd905mr1225969c88.19.1777251174732;
        Sun, 26 Apr 2026 17:52:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dca2c1c16sm11449051c88.5.2026.04.26.17.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:52:54 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: mailbox: qcom: Document Nord CPUCP mailbox controller
Date: Mon, 27 Apr 2026 08:52:35 +0800
Message-ID: <20260427005236.230106-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com>
References: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69eeb367 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=SweKOXIDzLmhf61SmjgA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: SOvHQC2hLhNQhPupmjyCF_W7RikvSB39
X-Proofpoint-GUID: SOvHQC2hLhNQhPupmjyCF_W7RikvSB39
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNiBTYWx0ZWRfX/JONsfCfGUHt
 trM0PPS60oLPQXDWbmlBIaes+bOUFT3Aab0U5ExWSMD7fG5/3yvmdS7O/4js/BCgB/gRA7uYALB
 i6vLobDQeOC1zbn2A38eDVt2UkfTl22hu3gvCpTR9Qt2mJpczuVbeR0GlzJUECOl2TGSomkPkKJ
 V+kiPPBzwxj+Eu3hg04Gbq3s4QdjU+NdP6YCcr5evaprzmKE8Gy78zoZomlcWpuh74KQWFiCXKr
 uUgtQpkVdMOWTSfGkrnbPQavVqJLnfPzd3DSxk3q1+niJ5ifb/yV3ZF0F/zF8Rnk4ek8YOH/0J/
 rhajsEAkJ6ahmqLO55qHddX5BSG7P3CV2IDnFhHSfF+/I5NjZodrdcQzkUcPDmCnCMBK1ceH6km
 CXmR6D6XRGqRvbJYeNNvSKGSOedWkdfdFblRgFN9ELSlAn78G17vBATJkES2JMrvW9oUxueHyPH
 XugwCi4QQuZLanfqfBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270006

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document CPUSS Control Processor (CPUCP) mailbox controller for Qualcomm
Nord SoC, which is compatible with X1E80100 CPUCP, even though it supports
more IPC channels.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 90bfde66cc4a..c8107d58f3d5 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -20,6 +20,7 @@ properties:
           - enum:
               - qcom,glymur-cpucp-mbox
               - qcom,kaanapali-cpucp-mbox
+              - qcom,nord-cpucp-mbox
               - qcom,sm8750-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox
       - enum:
-- 
2.43.0

