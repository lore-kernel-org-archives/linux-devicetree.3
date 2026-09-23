Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E510A3C062F
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181261; cv=none; b=Vg3wMAM9O/xMLIavXmzkQCvpJiALWihlGwHrzCR7iCsj9IwEmUUIgYjQoCF+InBKoedxVi+0/9KJY1YXf4U6qAoTP0VBH+5dMOLM0upRulQmsHRVEvlv+7z1oJsIrbdeb7d4KhD3dM5q4JVXQvaCAZzS6mSgsWnRVtfWvhnfBsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181261; c=relaxed/simple;
	bh=bZFCmikbhjibr37QyYsw1BYnrmuWJX2eRfQcgt38jzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H29b853wSymth7iBBMWRSdSvajiBKecZtIJE0v3JPK8lCVnx3yHXGoaxxegF8ZfvB09NmL95oefpMiFRNLDrJI+wgDTS4W4eVaohdgJMCGwXADfAU1s3VYDEzdWs3FIjgSnNfwG5X8hx74s/TqTgkaZMKM9elsuu1t4pVDKC61Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nahf0l9F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fz10Hl1e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nahf0l9F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fz10Hl1e"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTsUV2470361
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0pBwxzDmGvmNSPMqwBbxTyOwURg+F3QxfDPjVKyU68=; b=nahf0l9FZwqO/OFE
	YtKXTqp3WUrfiS6yFO7MwJoQSV+O8vg1FEkNYZZoJiPrc6kIb1vYwu0fGqql/9Wf
	IdZG6Q0qROLFo5bTn4CZ0hoIpWHDMRbv20dueCA+U3VZb1nYN41lsPsa6u2hLRkL
	9GyOXAuRRBThbUCYjDLLZkFBFUtfYnE1SJ47+6g5ghMJzElhqvrUBOt1dnMVP0C1
	Fn+bK6artLcmN0agK4NsXccxSNZnUb/DlWNOhEUFOGLkEp3T/0UIw4Bs/F9ak4e2
	vAKX2XYofATsoLY07hkk7bqM20PyfqJMwAKA9dDsNOgcL49OiUOOBIgv3LgOmL+1
	FA+vyA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv0w4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 16:34:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so9979455ad.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790181252; x=1790786052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0pBwxzDmGvmNSPMqwBbxTyOwURg+F3QxfDPjVKyU68=;
        b=fz10Hl1eBV44ofxsDS/c+c5/FOZaCT6gf6GttIaDuYNiv51rIeiTBbXOWWwJ1kBZCr
         pVDe4SAxYZJxdzhxrTOvSEkXSOq6Ib1kKspbRoOZh1xSXXg7NTwmt0xhUZ3Vy5E5KqJv
         M8lEmakRQNH4yKHozhesb2Q3MiDTJBqRwbKbuzChBue4eKBqnBAtPMMMoRwl7IrXl6It
         tIYdSbIzcyLne5lWTYFqXpajb8UCS35ETQSG25IOTsopucctjMWCdHRh5UmlcwhpUKTQ
         eML1PKaYxlD/rDjbayo7UrVdA6bqNWvuqZ1kkwmfKrrGTR7xizytvhA6GEunFe0xp9ee
         1kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181252; x=1790786052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0pBwxzDmGvmNSPMqwBbxTyOwURg+F3QxfDPjVKyU68=;
        b=ABjkapGaXpyyH8SsFARNDwmotAdaPi2gQwghIvrfmYNQVoDdQAuYHQhAHF5HPa+Yoy
         z6UIwNew2T8zQc9Xiz3v1liHhX0kfP6iCiqwn6hGl1YD+WvgiV/orTms5/4gVFTGy3AJ
         eOTZH3zd2f6mFeMPMCaRzyaLTAVuUmO87oSnUhzNG1W/iE8P41teRdCIG9cDRTjyuJ24
         837mZnPDAq152EbmRRgZLHkx4lp1TwSKNOsg6HWJzjuzBJ6n8Y5Kr3eJ64ZnXSvQjwlW
         scrFtpwXFKTFLK5hKYdoIBA55gNCnu89JBni3V6IqZblnnW1yfOq1Ce0Mih+FWbnAqvR
         +4jQ==
X-Forwarded-Encrypted: i=1; AKwUvBwq8KYNlBFXuKVy9lcZcHmYJkuNeKdZsF717WzOHuO01LfwuH0EDTkuSfHDS4xFMtFdNeC79RYivwaN@vger.kernel.org
X-Gm-Message-State: AFuF++kOaw52TkHsIcB/LlEQrlJxg7DPaWQWKxg0sq9iJ7haVvMM8ISv
	xhItnt24A4jo7YQ4xZG5OaHjHHG6Yt7ujoSyo3vYhRRrHOhWNnplvwxba6BqlKwpvfHoX0Wr4Hy
	H0BqdgaJ1Js0i5XckmXV8QvzdcBJ6pH0j3FpazoMwBjM8rA7ttDMpGWRn9L/xli00sW8QyIqm
X-Gm-Gg: AYBFou1SMrofF5G68xS7Sc6c4KJnCkpZKEWbmo4DEbokgJubptivPuNd8Fis2p65Zyd
	/X9jn4yWwmQYbQDVlDpzDLhwThUmG+GcWM8+therKUqsqzNVRrGJ/4KG3FaNDKja7hS/vlOgTTQ
	gmKKAeaKs5FEa7ezjcUiNrunhVu0D4AIfyx0IhEcs19a3Xuu3Eo8XelA58wHvvg/sK0VkAFh7kP
	28r/65YQREe6+d8VENOzgrgOM2PhJ48c30Qijy+R7W8anQOXHWn7dCxWaht/on/6b/WOX8YtjIY
	4WYUH32VdvLlxA8oVJB1Nf5502uTBch0m5ShajTg1OEkaJ2mWZNdI2nB2Cn5gBRPClhSjef54Qh
	au2U8zJk+2eeIHRhSpP7m+xy88iE=
X-Received: by 2002:a17:903:3503:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2df69ddf227mr25747755ad.34.1790181251378;
        Wed, 23 Sep 2026 09:34:11 -0700 (PDT)
X-Received: by 2002:a17:903:3503:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2df69ddf227mr25747375ad.34.1790181250803;
        Wed, 23 Sep 2026 09:34:10 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm13994895ad.19.2026.09.23.09.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:34:10 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 22:03:40 +0530
Subject: [PATCH v6 3/4] ASoC: dt-bindings: qcom,q6apm-dai: add
 memory-region and relax iommus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-vmid-v4-v6-3-3d61a0319b1c@oss.qualcomm.com>
References: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
In-Reply-To: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ajay.nandam@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX6NpgoWIy2V/2
 h/1M/Xbypj6KuhnuVgttKPkY5QO/qDRUgmtfF7Xh8SOAdDL56/8nrYdDoYXkDP7E144F0SymkMj
 wRjlneOonkpSqb8CVgyGHjvWDnSe5LnVu21WVUaYugSZ2B3Fdjq6cekXMAutjskHHUIudQ1sLWH
 wrkLt+maXSTVS+YSjeHHoyFMlMlYKyS4IpHx62WIPGJsUOWlc4OnqwyPrSlR8Pni8xapRKLZW7G
 5wfHt2H384OVSWobv3gnTdkRewmCogVuAGxLH65xJy5HL+qyzgDIa/OBLoM1YkH/3vwm7L9ont0
 JHoKnRWvHBS2jpJBKZ7vwxPb8ebAMehr4UQYFlnLD93yDjO42mSKeV/AeBIpKt9bUILCkGeWhUt
 mGzgGYHU4cVnt0QZWvbhq8dny5IkU4xo3s/WEHoxRs7EbTDR1OCdHYl/NY8Gt3tNHWBwcChzm9J
 NRWOe9DFq0GVWfVyH3g==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab3ff85 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=d-o4ErlZh7ezHBmBfcwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: yf6b-9clFZskt93JJ9cOzashybwxN6h9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX3niGnA/83Ydf
 AtXOuYIvxzQUwn7/vFxJtoYMyw8ZMr6D0tQCj+cLEqA5Ibko1kkCHebIFYLGpjbp5srXCqbk+Io
 J5/qFuqczWHkZhQJ+ZY+wU8WJrq0cb8=
X-Proofpoint-ORIG-GUID: yf6b-9clFZskt93JJ9cOzashybwxN6h9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230066

On modem-DSP (mDSP) platforms the DSP runs in a stage-2 protected
context and cannot use the SMMU. PCM buffers must live in reserved-memory
carveouts that are SCM-assigned to the appropriate VMIDs.

Add a memory-region property (1-2 entries) for the control-path and
data-path carveouts, and require q6apm-dais nodes to describe exactly
one access path: iommus for SMMU-backed systems or memory-region for
mDSP systems. Remove iommus from the common required list since mDSP
platforms have neither IOMMU nor VMID DT properties.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml       | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 9e5b30d9c6e6..c1f9fc9eab64 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -20,9 +20,24 @@ properties:
     minItems: 1
     maxItems: 2
 
+  memory-region:
+    minItems: 1
+    items:
+      - description:
+          Control-path buffer (audio_heap_mem) for platforms where the DSP
+          runs in a stage-2 protected context (e.g. modem-DSP).
+      - description:
+          Data-path buffer pool from which per-stream DMA buffers are
+          allocated.
+
 required:
   - compatible
-  - iommus
+
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - memory-region
 
 additionalProperties: false
 

-- 
2.34.1

