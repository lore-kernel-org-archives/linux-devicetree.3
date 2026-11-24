Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517632;
	b=24EaswzKrhSRXByXSVrPLfNjUNMxIrWNvbifUTZUt5x0Hf4maXF0oFbC6UYJxS7ocoEg
	 FTsDSq0+Fa255YgfhE91H3okuKQ37YwwUHzLyEiK4x3faTC0tLQl9F8dmMrgIjX1K4DRB
	 oXdZ//niO2q64zKmgSYI+1ACleZCe2BI8gxcDb1uxmCI+W0SPsVyy+1pn4bVPUBy1zytK
	 Oe7Cht8E0DLmuJ4jXW53I/t3CFq8rn9IO5v8KaSdA2DbHrRRG/uFP5eyh96J7f2Qaf/8R
	 JTVv26DhPjgDGmmabBuKOmCcuJZAbLg/D6ew16T3i+jJH2SNsd/9dg0d8SqmMCBwF3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517632;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bJSBeVd1nmd59BdEQIYSOqfgRiLbrJL6a61eSr7kRh4=;
	b=e2KVs7Z9ukFPhQeseQmP3Lnzurw3+G6clAGuuSMkO3uVjK5LK7LiolpPnKTy92rC/dfm
	 PLFfjI5tYf4PGRoTPXi6NrtsbLIIJnZ5Z+iwh5BeJEerQdLV8jxMzMrGG0o1zlVSIO5Jl
	 CkeXzXrJRA/puvmcbIvEre8QoaKLC7MU4hAam7vhcJr4Uj0+UPI1Ds+g/tsSV4UR7Bbvv
	 rkR2/sgyd7WuJdSA98e6GKKPasmLbdaXFMOKEQZAN+0LvlJx+/a+IhbpgKYyI87zdzWHI
	 o31eIhsYZr6Z2kLVIGlId9kP1Yt5aMon3p+Jpt5CfH48BUsUfjMJ1524+KTv8LqD9yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D8mEi16O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="b/1Oxouf";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6EF606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C6EF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D8mEi16O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b/1Oxouf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8KjOQ4128835
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bJSBeVd1nmd59BdEQIYSOqfgRiLbrJL6a61
	eSr7kRh4=; b=D8mEi16OhT1h9GVI9NJ/ER+82d6UcxApLEMRZ24FmkqgGIGpktZ
	dhso8bPlYZ1orj79vUVVYQfZO6lF3FuPVfTW5nfSJE1sapBkUYgMqCAwCyIonQOt
	2aNMteg6WueYDNEE4M7t+WNSwBX8B8r8Dim6vyDW8t0OQgHoem31nH0nSxwOBGvS
	/P5G+yRSbN/g9/MHIm7zu4F8r3jvqpDQlGINv9vCIwoBGpXncclyYuXK/JFRTYQT
	uz4W8vLOoYOjnfBNlXGw+mComUeucBTwZMp1xGy8ymzbu5Gnehc3K1lP6Yq/wPKC
	jWMkqJ/CdveuYvoLzT8fg+xMe34qZoc9EyA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt2a9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386c3309469so560813eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517630; x=1796122430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJSBeVd1nmd59BdEQIYSOqfgRiLbrJL6a61eSr7kRh4=;
        b=b/1OxoufCS8VBmvOSexD6teNvc5t5Vt3xW9oUeh8r0ARbrUA22zSYmrq3gKaS3RW2s
         qL5bfc5M47yQqch/UL58IpGr5hjHDcZb5bBIArKaK3MHWuIYR+6tcp0VPy5ofhnQsKD/
         Oe0f2GgKB0GU+axTbpvA+GyJz7FabOjlIyvJbVVG2nvqcauHJVEcVauAuAAcM4jnPiDq
         bwNI5/ssuZs9gSZD/4ko9hNvayq3+iNXp0b4wPGHoQrIZXTSkse/Ba3tlCyp4gklcLR9
         JuRdBQJ/DnvoNtkRA8xzplKAbjEQ4ZMLUbVm557whsqYvRIr20hOqIthflSuCuyGNMtC
         z+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517630; x=1796122430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJSBeVd1nmd59BdEQIYSOqfgRiLbrJL6a61eSr7kRh4=;
        b=ziacg9g6gzYCDYiLQjZFyl+PcwDcE5k6QZ1VeDMUAzjen/mWgT/U6LZ2IP8CbUN4Of
         3+GnT9tod6IbEImrvOwLnpX7rnr/oQzDZQmF8XoOu451m3LCWAz6rH+ToihlMDyd1Mlq
         M2k7XOSzvhqpRVZMf2q8iRPLB/2r9QS6ral+TQq/6XwNz9bZebqnDTJy3Ky/mJln9Uky
         ECoV9881zHBNSxOb2+jAF2vMASOq5Vnv+7VulPuQdY+zyQUffV26SLBQQ22GSK/aKCV+
         1wMMTVqVTjUeOKi/5wERYlzDR+45U+X7rNZiRRP2cfY6o8sNgkORLW627f+OQlgCAzyt
         IwpA==
X-Forwarded-Encrypted: i=1; AL+hErFWaMOP6l81xYr1wJAKkyot9oIqvpEhDyMdWoFh5Z6tYCuXV4yhH6UPI3OyYR4LoKdNIFxs1ZT9BURT@vger.kernel.org
X-Gm-Message-State: APuU4Z8Uw7Q0uXh1ixFtK3o9bIZtNCEF6DN1Z2H2KwjiauW1Mvc0HvQM
	BFc/+4+774wSRkkzE/8Aq67n8XUCg7MNbVzE/DlEdecGqBQW7grLFQ4aoNK+2KoVKt8MVX54InC
	aYB6+ZqOiSI+AT7hqrLMvn8EEgkF4cbDw5djveLqeESZ+X5cqUuanIaObSkI1AL4w
X-Gm-Gg: AZFdTZfUIStrnYMYZ53cHLhVk3zxuGN9AN2P9zOihEHtdE4IczYCS+47FLErBABk8hc
	ROycgyhSJNba57p0IDp2J69EM88KQ3W1Z/NYvXKKgzyA0SbrhKM8G9spJZpsQN23CW3Abr/AvTn
	cGpZ06HA7Ha3tuI8RqT1a7gWJAmkfn9X7kyr9Dip75I0rtzbTiXlkoBOjBI9jEb3tjd3MGUDmQo
	NGfO+/P6tYulh1yGotGvnqnxuU61+A2BfmEwWHXId0jgQNfCyR3ZYMOy+mXIhSQo4QrZW0jtRC9
	sNH9PcyEWdkkFamLS+IKrrmJMQ2HtjKulQHx/KfZ411jPZembOnwSdoquq8jpMpPHtI7fcT2OzM
	2ijKmpNvLtzabYxgZ5Ch4LJk4k0KnXkHOWZXGHyCZuihfgZQY/XGm3x84+G4CfTZ2OT5/NmnCOP
	mypPsKnkR3GJnToLKNVQ6TGGpVlCOwam8FHT5+hrY33kJCyHPgmSHFwxY=
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr15017997eec.36.1795517630116;
        Tue, 24 Nov 2026 02:53:50 -0800 (PST)
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr15017970eec.36.1795517629438;
        Tue, 24 Nov 2026 02:53:49 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm46282021eec.6.2026.11.24.02.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:49 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mailbox: Add Seca CPUCP mailbox compatible
Date: Tue, 24 Nov 2026 16:23:37 +0530
Message-ID: <5bfd311f596ea5945b7c2251199d2d0ccff41133.1795517617.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX72sD8dxnauyn
 EEW0kyGHQHb3t/HQOE50eJhTe/JGjutN9KhaY6XiZ/UDmbgw65ism0E/n7CULWTvH/hik8JGL3F
 j8OqZg6eMsjsajGaOJdMWMZRU1Lk/dw=
X-Proofpoint-GUID: 9ZEybNuej05-gs50vSFby7_tkgv1JzE_
X-Proofpoint-ORIG-GUID: 9ZEybNuej05-gs50vSFby7_tkgv1JzE_
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b056cbe cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX+AvUEvKs9ZQy
 KJKSS+AWngS/XaLPfPzNs1Mhsxd82p2U67DPH0tpiyaMn8ltCVeFPhn0Pumv9X3W1EOoNb0pY2g
 9KOOA3yN9Ew8RJtt84TYyRPbj8FrIYzydO+e5una8fasnopL3rDgrMi0Ct9w/r/Dcf8ymhx1Rkh
 FvMIWkb/UJif2qp0r8155k4Njit4b/NYTmZGgRaU5NtI6mFNprKcmGp5gNEN62I66N0SA6is5ax
 p+QUW/gJva2BBpR8Prc12sMPbRZYN6Tb1T1aJghGPnR+9TRMzF5tBiY2nO7QEnDJcNkX019m8pB
 C+SnEJqOTEBKfbWEPo2LJPmOBqkrDXGZvGMxwKGjkrLUsUaCRiAjmdvcan7rMruV+7vkHmeBjQF
 uz1f7QwV9K4B/1PMgb5LLh1noPe2+wzl0zC3FAngsr/SUwUlvs+s4/XXz1wyHUyLWLehHPTRHmw
 k9RG2FLPciefnrXM8cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add qcom,seca-cpucp-mbox compatible for the CPUSS Control Processor
(CPUCP) mailbox on the Qualcomm Seca SoC. The Seca CPUCP mailbox is
programming compatible with the Nord one, including its channel count,
so describe it with qcom,nord-cpucp-mbox as its fallback.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 2185920e1b5d..4e0527203e5b 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -16,6 +16,9 @@ description:
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: qcom,seca-cpucp-mbox
+          - const: qcom,nord-cpucp-mbox
       - items:
           - enum:
               - qcom,glymur-cpucp-mbox

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

