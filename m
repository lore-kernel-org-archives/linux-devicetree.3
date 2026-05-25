Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E9F39A800
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690489; cv=none; b=ga/jfypCK6g/psqNzrQ0Pye3B/WgY4BibYHNL4320ubzEPZ14BaBHb1PcL9FTJYGhXX4WU6qklnjaAPtv+U6FAnR1Q7y8XM/jQBIAKVkEiNxlKe4phVdW0ibw5Pgt4uYhfoAu9VHL4PN5pm6IWwnKPco5Xna6F1d1HQk/StSrzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690489; c=relaxed/simple;
	bh=JW/pF4CU6JWOliBbFDHY/iFx8YU4vv/wzNG6aeFcfD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ACOEXxoCWtph2W6kj11EYB6wPv+h3pTDoV9staSdW+h/GCGysu6czOOHyXq4u8KIu3kOuP/wuvNFWVC982+G1IeT72mq++d43Ft6YW4gUg40QAhIzkFw6aDN4hZVenEBTyNaQPCXKFou0N0WuUWxHFZVjxyS+x9QAQ3UXIVjpLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDQ6AmbI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KIRAq5mR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDQ6AmbI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KIRAq5mR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P0ZC3Z1498348
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RhSVgUFC8ULWfmWprq3Ik4
	U5AKO8jlcD3gbui86WAOA=; b=MDQ6AmbIWxxvMwi+N+ihj68MUrbNO2ubVmipsd
	M2vJUc7Sg68hosN64DQNu4hjj/zLBIKRBKq/Sq4VrJZE8hs4emwGuoHdU8zistJE
	48Op8VHMz4Ivhtxzg5fxAg2nbpBJExOGzqhf381eotHkajlu1wa5MXKmlzulBUCe
	1/dea4vjH8A2DUA/KCRYT80UT4+l7P5S5VPrWQeb32ILkwfBr1CCulXy7uSqfWC3
	LrjDh3UcokReFbKO5QUQu/xH+QZNttFgJkbpWo+lqfM03j1zhl0iFJyf2KbHdtbB
	38RDnTdNAF9wJXNNg1pVc9/PS0htoeQBXwuumWB4pE2msQxw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386nex8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 06:28:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3663d5e9b9bso8761815a91.1
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 23:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690486; x=1780295286; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RhSVgUFC8ULWfmWprq3Ik4U5AKO8jlcD3gbui86WAOA=;
        b=KIRAq5mROEt7Mi0ucUCT0Xxls7ntFitGr8pShMlDKTqgLx7HWJBubBPmTGS5Z/O31d
         leP2U57tbiMyGZAW7bIhSQvVRMiE4IpqLm5f9M43PnlBnkCBhmg9ofwVJIHwU+HAe0Ht
         +hm5t4QebrB5sdaNXk6MjlDfQa0sh7h7XP3dDub9hyDoL0Xby6gvNuBcRTOr+aD1IR9/
         ubaw98CUBv28dqga0G2ZFJ50KC0YaxljT7f5d6vxqeEr1deQpKzzn9QSgJcjBjEhC1nF
         lzVfSX93+ccWJhosB1mlwFWUmQSqsfk+6i9Yxls2+jjcGMA9zoL1C4nlG+EdIKTFw07A
         lMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690486; x=1780295286;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhSVgUFC8ULWfmWprq3Ik4U5AKO8jlcD3gbui86WAOA=;
        b=bFzCdqJLYVsueSCVu1+HZEmA7aozKMyFd/0i4Cr0fSIGu9SWBi3L7EpW1Mb7TKjGJr
         goHb3hzWzFgSuMUoprfXEKbRAeZ1Yujkv8qsXgfmYibBASpdwYLsuHTVfezQEsUWNw/+
         voxzBlynsLQg73sMK/7/g/YzHVcFodV7AOXarCqGEsLCLE+JOC79GskDs+RTGehawkxf
         +aFYfNIemHRLuIOEOFN+YDJB89UFWYS2UVZtfJaH4CLdkpiMQpeY3AngO0YfBNxb/mSB
         lvTuFfuz87/NPU8qx2Pay1CwbmGShin6g5rSzFB0TJ3YlMPa3DnNxi9KQdMgQyt+ppwE
         ORiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xO0cxI6tnv1ijjKGa3dTQUcA+NuuNfIXLGf9WwMPFxEefQYIApWgE9LnPjW4AWr9cDvhuN+3Yxqbf@vger.kernel.org
X-Gm-Message-State: AOJu0YyOFQJeL3721hWiiOalt6ZH11+8Jscw5v6rYtf2fxyQqi8tXUyX
	ovcrZGF4czQn9JdVMxY0M9us8PyJCP69XbGxlivagqnMCUWasJeBLGKnS69Xc1KGfFvBfyhlf45
	5l/4DHHNdZwzy1i5laZurnwKoB2CO9hpyftECG4neykdS4M8dpeLDYnQ4I9tx3e/q
X-Gm-Gg: Acq92OGnvslPBAbREbcLkg5wE0uVZVV98KckdxUciiD6+fUMEPfzH0d1OgafetHqEYq
	AP6gnltEVqyvjNBojeKk8orC9Dpv/J5f/eyk2rBvCnjqAnINqPj9XeCJil4IcGMzQwt72hoJasd
	3mlZb0zG9j1R0GUp3ZPZ58Yb4POstUVW+I2FREQGdptY0yv4c/y9IWOaPAl8TpNtis5jUcr0ZJA
	bEZrGYh5Lod+fUqz4d7+TTitlJPZXel/aNugc61UnrTg6qDAfBJ8ZDL5CL0RSANODK7e6vOI1x7
	GkNOyuBTAju+BD4PN/7SNUWvkJZTisB/ZHcGPFdTSmxaRCO7hlsOqa3vCPE+z0YZ781mGb9DxNY
	avT9G277JS4gGxJu4EgdI4+kS1QWfItnG8eT6dnX+3nN4EwUsIsi8T1RlgnAa4V51Mv9EHy/XV0
	Kyap6gOGycG3UkxTg=
X-Received: by 2002:a17:90b:2b4e:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-36a67719220mr14103219a91.7.1779690485945;
        Sun, 24 May 2026 23:28:05 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4e:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-36a67719220mr14103201a91.7.1779690485438;
        Sun, 24 May 2026 23:28:05 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6f0baca7sm4925398a91.2.2026.05.24.23.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:28:05 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:27:52 +0800
Subject: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add Qualcomm
 Maili ADSP and CDSP
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-remoteproc-v1-1-9a1cb90994d1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOjrE2oC/y2NQQ6DIBREr2JYlwRRqfQqjYvP51NpgljAponx7
 tXa5ZvMm1lZpuQps1u1skRvn32cdqgvFcMRpgdxb3dmUkglOil5ohALzSki14RQt0ZDA8R2YU7
 k/Oc3dh9Ozot5EpZj4WgYyMRNggnHIwqQC6W/mui17Pfl9M8qxhB8uVVdJ5RorUJtNDnsrVA9O
 Kdbi42olW7hCs4SsWHbvgR86OjTAAAA
X-Change-ID: 20260522-remoteproc-9eca14b9a3ae
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779690482; l=1856;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=JW/pF4CU6JWOliBbFDHY/iFx8YU4vv/wzNG6aeFcfD4=;
 b=f1Hq1ZHQk5xw6u/hTP7c/g0jdSJenUg6o2jfHaMlERDXP12nhAJ3bbJl0QzBbUivTzLWJFmnE
 zPnexCKGLowAnlKEbQjJl+ORz4vbTloP6xcFnZE+3Sj9/TXYa+gXrlP
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: Z83F3pCvV4Z3dHFa70BMxqgPATKBAyHR
X-Proofpoint-GUID: Z83F3pCvV4Z3dHFa70BMxqgPATKBAyHR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MSBTYWx0ZWRfX4dDKh0ELRGnK
 faGPNMUyMo1cy6LjWlRDq4Tibve0/MY9BqJMy5x7EFyg3DTLuoVb0s40whxLnqIEGO5hwsSWYpW
 6iOF7M8ei1l9yZL2uIbzaToZzDBk0Jk/ebN6ecvB5bLQ/+b/BrXgjxfXWCH8FZKpc8nC35gAerO
 VtF/1QGQXau0Nj0ZcXhsoZq+IIOsTJejtazn4lkBfMZGNS99QJfWUxjTEcWXWwLL3KxIjI7xXqN
 tcu4D1/gzdlmnqZWLKklGhAlyyPkOT9ZgSF+g94aAKRPUREY1OeHiBVtJ/qtITR8iU8qvF3PewN
 FrZY7vraIWTYSHulhYeDeUyomXNWfqXjMgDyOMSacc5ylxCSuQO59YGyuHqohdG/bUl1R0qhF/a
 YnBYaqX6tnLWx0Lbrer5Ho+rNNtl7p1awBYeaLf2r2rF/ve70oJvoZN+UuX3xT2NoZxC070TrAt
 vKAsTejPolDkhFy+0qQ==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a13ebf6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NyR1cor_mINAUlzJR3sA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250061

Document compatible strings for the ADSP and CDSP Peripheral Authentication
Services on the Qualcomm Maili SoC. Both are compatible with the Qualcomm
SM8550 PAS and can fallback to SM8550 except for one additional interrupt
("shutdown-ack"). For CDSP, similar to Kaanapali, "global_sync_mem" is
not managed by the kernel.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 1e4db0c9fcf9..ead7a7d68f59 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -31,12 +31,14 @@ properties:
           - enum:
               - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
+              - qcom,maili-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
               - qcom,kaanapali-cdsp-pas
+              - qcom,maili-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
@@ -106,6 +108,8 @@ allOf:
               - qcom,glymur-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
+              - qcom,maili-adsp-pas
+              - qcom,maili-cdsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260522-remoteproc-9eca14b9a3ae

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>

