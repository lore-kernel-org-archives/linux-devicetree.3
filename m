Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981831;
	b=fonKnmetQ/C5dznARAQz67DNKI5biajysZDUBrYD3pSUlkf10tdjSeLkTFmCK3F4Euvf
	 w79cl88sSMn8UAWfv3K1GwusonQR7fVx1PNaXT2/l4ZsLwjH86XEUXS6qDquPd4Clm0ck
	 ztnchREdSdBlLhkb1BPUGdq/57yPbriBaqGxQQngoj3Vcr2haQN9KAXEPI2UhnGSuUNUy
	 H+yYxRvUW/74A3N1iOUEVbkGB4gxCiNOGxbkOs1vmWFvbAULKLqjHLQV70iSiqi52MfJU
	 zIF0U9kAuYd+jsi4Fv3AmYfqUoQ1Yr/vM6qqyFY1fr8xVOLWloIWfno2RJNTrWGLb1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=;
	b=hvex6kaGgDDDX8oLuxpgxX1E1C35dleM1KeU+KazZaydxg0yW4w6FrzaR9UnzCepHLoW
	 JDJnlcssnRPGvyqSObhJZZeVvjxsmAsWM7aJv9CqE/7Tt27MXBd7Ex9gmZvpZ39ePiOjp
	 EAn9yKh67xzuaoDkT4YkwKz3v6scN41GrkGJaR6Un3mMUmrLUs0oV8/60aF91OlLMRsh5
	 +BVlDPQMXtHbCWti+U4JikCLzCskos+PSg65JU7MDWz4KPlE9GvAfVEjv1CU72OXhRsYW
	 HYkN7ZbdcVDfK2JBvAsEBB0I6/y1ZCMt6Cu/tldkVc3rdFWGAhnLywibzfBMt6sFCBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZYorhPEm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7W+jj9Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F19606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F19606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZYorhPEm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7W+jj9Q
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Ux4C1430540
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=; b=ZYorhPEm7sZKzcvR
	73Hi0ohJQQTWnO7B7Qm42Wt5XnrWHizxkW3JeeGlEfFrhHslC1IcbCeHtzAv2+/c
	UbtY7moUdeGrhi05bn3U86CzWvl5ih8tJ2sldslBhTY1eyseBmgy2AMnbnhPpYj5
	nOSJY6WzHgjmtn2W7s7Zoht00ZIPJ/n10xupzbdc6eDEPxciXm1V3FJyC8jM3uD7
	QTrAOyU2wjAekFjILTe+kCVCm1QBgWkqAVxaRI8hdhBLAcLGXBqA7rwXB5gUyRPH
	ZEPjWuAkejnKrYrGrqmRzxwnw49n2lLdnKDPIAMDpdrndLfa4g352YYaNOZf+lnq
	oRDujg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91fcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9501034c4so7937795ad.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981830; x=1795586630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=;
        b=Q7W+jj9Q3RbdGoHtjsaHSx/z+2yqQPyx+sP7JbIPIZpoI8tt2zpf7qBgLySkFLXyGG
         f4CUf1JnvKIwY7ourblEl9uIlFsKgaSR8OMxpOhIZjm4iBlj0/YuY/q3mIXWRYTU65Cm
         0Dzts+gANeaF3iTlniRd3Ct1RrskS6slN5/kGponlgRSykVlwKMJJmqNfMngx028vVT4
         x8fyM/gcf5ETmiK7Mx/UT5hlFSXFmNNpOWqpweCq/zpDD/qKR3/LBQPTibhETRG0/U8s
         4zQFbk+iD8UiCjtdt/dufB8eGiJsi8qMF8H/Y21H04la3MShbF2+ITlAT3Fg6hyiC8gA
         4w3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981830; x=1795586630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=;
        b=auCZxu+L6ojQsRkG+U2jcCCgoY6S2zEhj8QoeA94UnDXVV+Awl+IWU8miSTjDtOxqP
         G90b1zn6r+1UVBFWNytifoycB+OI513b1U28Fw9nQICImy1rPL1yIiYn44YjN9OUdVg2
         +x/voqx9CUjhLYJtKyvZQVntHuB3uI+ZgWD5nqKBu1HB9PHKzqqybzsxSG0xyBosrDL2
         t2vSNHx5g6vyc9PwL8nKooKYQFaL6dHlTK7o4JaM79EudvHT8iWQysw91sn5203J5qA0
         TElTiuO+nvnV99LNeR05B1jinJCJpuo+dQEtMGzefIGHZMsfhdWQvTTLZGsq7OseQrTi
         uCrg==
X-Forwarded-Encrypted: i=1; AL+hErGIlQabmOxz7lPuhSrL5MyjyzkCINgGrAlIqI16KwI8yLGFwbBsfHomGUzd+NaOjq6M0KwwzRejWYj+@vger.kernel.org
X-Gm-Message-State: APuU4Z+uPKCIL1TF6YaZwN45CjGy+gg5Tx6vDsh+QjIq6t5RjDJjjg7o
	3ZEbbxmW/c5JIWb/HM3xbUXxMbgdcoYnXkFHbQ2vcdccDpyalb96bnqxmMgZUiJV55TI7vxwAXc
	Gyn5oZXxtnf1paMCUSThKF6tzt8qZICF80RucY9Jyw5JE+Fknd/bqa08Y3meUyS9u
X-Gm-Gg: AZFdTZeKMwzlGZlEWYDO9KfxzB7U6W8uaeCBPCHyfhkYGssw7SCh/wURWA9fuDnSbsS
	xM2k7/Cpq0iYHQdWmG+OW2dqYngc6yAL1igpfFTuQYjCYdd1HgYLOlK5f9o6xXHwnYm4fZtl0OY
	ZSSrTXOs+RbOHv7nKOl0WAsDp8kIBsrAFFvrhjVRL+uF5eLslFcRadhQXQ3PEQFMm8vpYMu4rJ/
	DYVLMvrch9dLTcBykZ4u8j50G1NZn3dN+BeguFW9cZmNwkqph36ihcChVojmeZELuj+JJC86edG
	lGDJjNFIyYJAw8kYU64VZAZ76x9vb5D1tFea9Ks5WbdMUUf/nKh9sVGiZZSOxkFAz5TyyZZSCHS
	kAa3jSBbFZQToeMf/eEp036dt/2Mf8egdBSpuQSvT1q29ru12IEFaNRojaT8Os1OigsiOR+tOMg
	==
X-Received: by 2002:a17:903:ac8:b0:2ed:238b:7db8 with SMTP id d9443c01a7336-2eff7574fbemr14550595ad.61.1794981829984;
        Tue, 17 Nov 2026 22:03:49 -0800 (PST)
X-Received: by 2002:a17:903:ac8:b0:2ed:238b:7db8 with SMTP id d9443c01a7336-2eff7574fbemr14550345ad.61.1794981829476;
        Tue, 17 Nov 2026 22:03:49 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:49 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:42 +0530
Subject: [PATCH 11/18] dt-bindings: pinctrl: qcom: kaanapali: add gp_mn
 function
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-gp_mn_tlmm_support-v1-11-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX/SDnDIag2OGd
 3T4nrqdB5OV1v9Rr7TMFqF8Wiafiv7yPv8PSo4OmiJUfSSgVeL1m2DrSsAZGV7qgueAtp5+vcJL
 XV7oiRlsIV5ByhO0nqkD3Uo9BKb03Iu0nGRxi4MADQeGNKorT8379+d0US5D6gdci12WAJEAojw
 J75rfBSAocvEe9PZzRZXuyrUuZ0V4f7TAnYwUNHF7jnzp7spYYWe/Yg9mrHCDDaI8cM8RDiYqEW
 gN2C1V7KDoPJKXVOQF4iyT0pTqFxbWcS2gQgFDoh31D9CQgYBIaHJg1Lpbnz112nYAyUkjqcZ9p
 gk/giI2i5v0pZGKuqGNiDIrLxpV9pHkKpuzsHutUeybrp/vAN5W13VRLgwpguVOmEFEYgblk3Tl
 2SzOnHApClI7MqXZmCiE1jwXaROB7iR2xKl6NuFPHcVidXBOmfaBFLc8DfMTFTjIY4lJynGcMPv
 s/WmtpW3cOEIAMBM7/g==
X-Proofpoint-GUID: M8uvkYdyz3Bco-XIOT3G5c9wyIpA1WCo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX9zvG7b9kzJCF
 xYaKBQxeA1AZyAITAnk0I6MsMlE6euqOoXOB+ou9gtdkJMCmbo+tOnQaCHz6penxCRUHbuP+md1
 epTL6SWttkzFcv8ByP2ifzyVRIOorNM=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd3fc6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YsnPb_3J17WYr9j2Th8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: M8uvkYdyz3Bco-XIOT3G5c9wyIpA1WCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the Kaanapali TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio53.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
index ea7d4768483df5a3b5b8fa85a686cb9f8192e673..c9406a9ddfc54746da2b38ea1f02fd117a472c5c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
@@ -73,7 +73,8 @@ $defs:
                 coex_uart2_tx, dbg_out_clk, ddr_bist_complete, ddr_bist_fail,
                 ddr_bist_start, ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2,
                 ddr_pxi3, dp_hot, egpio, gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0,
-                gnss_adc1, i2chub0_se0, i2chub0_se1, i2chub0_se2, i2chub0_se3,
+                gnss_adc1, gp_mn, i2chub0_se0, i2chub0_se1, i2chub0_se2,
+                i2chub0_se3,
                 i2chub0_se4, i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws,
                 i2s1_data0, i2s1_data1, i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist,
                 mdp_esync0_out, mdp_esync1_out, mdp_vsync, mdp_vsync0_out,

-- 
2.34.1

