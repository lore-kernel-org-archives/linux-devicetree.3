Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F1C3C1D5B
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021259; cv=none; b=kI3YloukwJIBn3JScHffKyPbE+jpxie1i86I5YK2xtQnjch1ZrKsCpmhZouGY18v1+njvDsw36jkBuGtoWIfXTZwMysZQUXvp9OL0QqN4BcJeUq//JWImXzB6u//R6hUlvdsmF1xqtd7NcLAYJE/LAXMG/fZ/8+IEBoACYbfXWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021259; c=relaxed/simple;
	bh=UyWgn98oC86Ag7J/nHIo1FudYinUSljMSVGj4DXtPfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=agQ1WgZX2Hn1lvLBU495wq+48gtpUKRUw2HHxroN3kVxuQUfQxLYweXSiF1b4E2uNUmGmfTV6VQzbBPU/UwTGAHdN03nx8stcxN4kHSw++pv+SqF1H2GP7Xqb6qlS3Fh8Hg9QG+ojRQrWIEQV0QD0Rb6kGsFfu8DT0e/S5tM8F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PpzQDxH0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IcH1l+6Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PpzQDxH0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IcH1l+6Z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5H0TR4142857
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YSed+vK+mrdRChvJYuOI3Q4bZn3Tg5eAQaoTPgvU3bQ=; b=PpzQDxH0bFF9MsNl
	nw3mNLrPUly0WAGf7d2b14yov9KywWsCEyuq7DS9bF8nfNRkzD72ec1Ci21ElUbG
	9cXPTrxaGRrJeqgwKeXp7DrIZExH9lOoWAUAhhzMLxhHPMvfGEhfHWHqkzf0SUAt
	s8cp3xSB8sLHfwE8fYFJnytBQAZugr//+QBtglusZ7Z6xWlb74WDf6SsVdSwUq43
	GUbBWDFnidIWnpo/UuJ7N/0458mrHwK/yN380XlVyzLEz0imjOmu5VmBhy92ifeS
	7GU0M0qQVTeoEAEMDfS2fGwd7vI+GVorvGwNhgW6nL09fZwlzZtzenRow+9m2q6z
	4bkaog==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd2b7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:20:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd188e16a2so4717105ad.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 23:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789021251; x=1789626051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSed+vK+mrdRChvJYuOI3Q4bZn3Tg5eAQaoTPgvU3bQ=;
        b=IcH1l+6Zl6Gf7pbrHzxm/NT0egkGmDGTrGHbiVEiGQYh+hBZArme28/lpFpli72ANL
         KnWMqlad9UJ5UZOoLu1CNZLHG3VSkLPgyJ1BamC9+/Pq/ZvXrNlrTwHBVA3ZSw1iVtxt
         MATtwLUOl0ODfW4pRixpgP/n8S0CRtv+IEJ8XzZiggHyNfAsrI2noqF7GakAw2SsUohi
         1PXy3ysm6JE9fCV4zDkt7GVCgbrAot1JmnmcAWSCosfI3oXNWDkDL0fd4rcjcAPlBdNu
         82DcgiFUk49EVHuMASiTQHlJWsZkb9q6w1FgFp5NDQFClPYiDW4KH+VtHl1M4lxpd7eW
         KnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021251; x=1789626051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YSed+vK+mrdRChvJYuOI3Q4bZn3Tg5eAQaoTPgvU3bQ=;
        b=Eta6lsZSr83bGKcKnhS1e/l6CNRqq7+R1MnQ9ElIiAKB03A/8BMRde2XssGAslLdLl
         i0i7LH12dNCig1ehPIH9kIgZ7zYcVLq0DrTwrge+Tdh2jVP2WIBGc2gi/uhwMbbE+YrU
         KBIlJ5GYaDq+sbtsSwg/V/v2tEQr6BnDCgZgAcy3zK8/u7Q3+7452iSFORWIQ87YYlos
         +2WSYC/kvVGu8aiuMJnFlUhsWQUgv1FRZiGFW60SYXLkToavWwBMT+2i3rN6F4xn5yZg
         nNpDjzNGYBHtmnOiWrwyDgJGiU7B2gSaJRep+dkx31XbUZKGkUwRXv6ksKxWD5RTrwG7
         f4vg==
X-Forwarded-Encrypted: i=1; AKwUvBzOHAYV+ztRMslDQ8MJdZneZiaA6V/odz9rKU/whu+a70yxKGzCh3NO/mUviufYIYzdq9+vLLKrlN3S@vger.kernel.org
X-Gm-Message-State: AFuF++k+TYi867XWL6aMTHHEETt5Ln2WCXuR/K6T4JHxaGEtgJQdiw9D
	7hIPhevfkt0Cq++WwJd3xGhlb0WEI6QqXbR/Bdk1uZh/R7uF/P+qH1prDXGjWWiSPuX7JdOWVZp
	JtOKNVAT04du684HWlFcEnXqayzp/8AUBBmdtojq3ywO33O0+tiFb+IOzILfz+ocelNf02Gfj
X-Gm-Gg: AYBFou1EuWuOcsEUASPDq/NUEeuMEjwRY6nr8O6bwJ+N80//t5/Xuh04Njwo3zCmqUs
	dtBP7W1HFAWquzmivcNOzhZR1D3zb7uK6iRPlex51Ifs2LL/a9UnG8peBmI8YDDXJRqjOK6NcB+
	ns22AJ6ITDO3qbicpXxe4mJXpymTC4Hu6LqpAPgUMb2edTvJIfY5mNLMTOuioQZVQgGPKyXBhsl
	lQnxPKwBsR47RZf/5fdzXJhAK4AOnW6gdB303d+XqAWxJaVEaT7jzN3ZZUwu3sCmVc5uwBBKPDy
	BNoo+M9xf5sAY+KTM5DPsctItYUKUrAzcLtMFDShbfplBo00A6u/ad8U4tgfkoRtV0bjcsiW6HS
	VG1EoAU22kBIl+hRNq7jAUHV8+DmkpBG3Gk65
X-Received: by 2002:a17:903:3c24:b0:2db:479a:5127 with SMTP id d9443c01a7336-2db479a55c8mr352995585ad.19.1789021251541;
        Wed, 09 Sep 2026 23:20:51 -0700 (PDT)
X-Received: by 2002:a17:903:3c24:b0:2db:479a:5127 with SMTP id d9443c01a7336-2db479a55c8mr352994935ad.19.1789021251041;
        Wed, 09 Sep 2026 23:20:51 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm54709946eec.30.2026.09.09.23.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:20:50 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 11:50:14 +0530
Subject: [PATCH v2 1/2] dt-bindings: soundwire: qcom: add
 qcom,shikra-soundwire compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra_soundwire_support-v2-1-f98c9a6ea1e1@oss.qualcomm.com>
References: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
In-Reply-To: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789021241; l=1210;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=UyWgn98oC86Ag7J/nHIo1FudYinUSljMSVGj4DXtPfU=;
 b=0xilDjFBxsdVGeNOVdonbjktJDRXI1p8o8P87zKqhQ3BL1MRfRpqIcESAoPrXomaLwLXuTaqj
 HHLDsgWuXmeAjuSP2dci8Pza+Rqzo7LdtekQgCeJepulA7RSH0m9moL
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: 4kiVYP_4XxQh2aLqyU0-kHjQPl2IQU94
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa24c44 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rFUVSjzCmDUomrWsWBIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 4kiVYP_4XxQh2aLqyU0-kHjQPl2IQU94
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfX0Hr7HMNyphsv
 VFSw944nnkr5R/2aeqt/saVyz7fHXOrDCjKQLOhWSdvX/l3PmZeA9VhN0WAu/AnUqoEpaKO4WhZ
 bY4/5bdIgKgHO9jg95Zsd/Wd+447BqA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA2NCBTYWx0ZWRfXyZL+xKexO5BM
 5gh4vqFHqvUp3mhEcBFUqyalHp50fpaXntlgSsIN6Ly6+kpcBeHdm19FDrz+nySdzgpf7H3azAz
 gttpOIeIiV8UPeTH1iOh1hi0TvijrW0CHOiESpld5X4OR8KAooBNNltz3+73Ylc3kY4CIRmI1K7
 IUK+7pom9EEaVLZJQsv4/gu1Zg/QkcvaeYQb7rfRKdriNslknr5F8ZXsebKEUUJsbKp1EyuUOmd
 E58GUkQFE6gJod6jPuPvvQI5tHSRW/t57dtfSxeRp04r0ej16Ys3WAi6LhK9kP8xPBkU6jvVWvF
 9FkDwMdmu48jk9d8T1p+zU56rDm1+oD9ziegfkHIPNhqnuKCiVr7O5xkMEWjMOjW0wu4GsyvCCB
 KKZq64thx4utiexlcfnb3spM1dJbyrg6F6M7lrBxOtyVQhv9YN4Bun3V5loN/yKoOxp8aap/8u3
 LZd9hPoNxZur2aZswpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100064

Add qcom,shikra-soundwire as a standalone compatible for the Shikra SoC
SoundWire controller.

On Shikra SoC, the SoundWire controller is assigned to an Execution
Environment (EE), which determines which banked register window must be
used for interrupt, FIFO, and status register access on SoundWire v2.0
and later hardware.

Add a dedicated qcom,shikra-soundwire compatible so the driver can select
the correct register layout for Shikra at probe time.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 8e6973fa2..81532cf69 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,shikra-soundwire
           - qcom,soundwire-v1.3.0
           - qcom,soundwire-v1.5.0
           - qcom,soundwire-v1.5.1

-- 
2.34.1

